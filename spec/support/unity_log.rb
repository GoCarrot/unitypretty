# frozen_string_literal: true

#
# Helper module for testing parsers against lines of input
#
module UnityLog
  # :reek:TooManyStatements
  def with_line(input, &block)
    context "with input '#{input}'" do
      subject(:data) do
        parser = described_class.new
        input.each_line { |line| parser.parse(line) }
        parser.data
      end

      instance_exec(&block)
    end
  end

  # :reek:TooManyStatements
  def with_log(filename, &block)
    logfile = File.expand_path(File.join(File.dirname(__FILE__), '..', 'fixtures', filename))

    context "with log file '#{logfile}'" do
      subject(:data) do
        parser = described_class.new
        File.foreach(logfile) { |line| parser.parse(line) }
        parser.data
      end

      instance_exec(&block)
    end
  end
end
