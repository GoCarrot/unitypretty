# frozen_string_literal: true

require 'date'

module UnityPretty
  #
  # Base class for class which parses a line of Unity output
  #
  module Parser
    extend Enumerable

    #
    # Structured output from each parser
    #
    Output = Struct.new(
      :timestamp,   # DateTime
      :version,     # Parser version, int
      :action_type, # Type of action, symbol
      :result,      # Type of result of action, symbol or nil
      :data         # Parser-specific data, hash
    )

    OUTPUT_VERSION = 1

    def self.each(&block)
      @all.each(&block)
    end

    class << self
      def included(klass)
        klass.extend(ClassMethods)
        klass.extend(Enumerable)
        klass.include(InstanceMethods)

        @all ||= []
        @all << klass
      end
    end

    #
    # Common class methods
    #
    module ClassMethods
      extend Enumerable

      def each(&block)
        @line_matchers.each(&block)
      end

      def line(matcher, &block)
        @line_matchers ||= {}

        key = matcher.is_a?(Regexp) ? matcher : Regexp.new(matcher)
        @line_matchers[key] = block
      end
    end

    #
    # Common instance methods
    #
    module InstanceMethods
      def parse(line)
        self.class.each do |line_matcher, line_proc|
          match = line_matcher.match(line)
          next unless match

          captures = match.captures
          return instance_exec(captures.length == 1 ? captures.first : captures, &line_proc)
        end
      end

      def output(action_type: nil, result: nil, data:)
        action_type ||= UnityPretty::Formatter::INFORMATION
        result ||= UnityPretty::Formatter::LOG

        @output ||= Output.new(
          DateTime.new,
          OUTPUT_VERSION,
          action_type,
          result,
          data(data)
        )
        @output
      end

      def data(data_merge = nil)
        @data ||= self.class::Data.new

        data_merge ||= {}
        data_merge.each do |key, value|
          @data[key] = value if @data.members.include? key
        end

        @data
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/parsers/*.rb'].each { |file| require file }
