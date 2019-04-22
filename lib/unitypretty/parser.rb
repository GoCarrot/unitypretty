# frozen_string_literal: true

require 'date'

module UnityPretty
  #
  # Base class for class which parses a line of Unity output
  #
  module Parser
    extend Enumerable

    Output = Struct.new(
      :timestamp,   # DateTime
      :version,     # Parser version, int
      :action_type, # Type of action, symbol
      :result,      # Type of result of action, symbol or nil
      :data         # Parser-specific data, hash
    )

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

      def self.each(&block)
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
          return instance_exec(match.captures, &line_proc) if match
        end
        nil
      end

      def output(data_merge)
        @output ||= Output.new(DateTime.new, version, data(data_merge))
        @output
      end

      def data
        @data ||= class.Data.new
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/parsers/*.rb'].each { |file| require file }
