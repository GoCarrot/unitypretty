# frozen_string_literal: true

module UnityPretty
  #
  # Base class for class which formats parsed Unity output
  #
  module Formatter
    extend Enumerable

    def self.each(&block)
      @all.each(&block)
    end

    class << self
      def included(klass)
        klass.extend(ClassMethods)
        klass.include(InstanceMethods)

        @all ||= []
        @all << klass
      end
    end

    # Actions
    COMMAND = '▸'
    INFORMATION = 'TODO'

    # Results
    WARNING = '⚠️'
    LOG = '📋'

    #
    # Common class methods
    #
    module ClassMethods
    end

    #
    # Common instance methods
    #
    module InstanceMethods
    end
  end
end

Dir[File.dirname(__FILE__) + '/formatters/*.rb'].each { |file| require file }
