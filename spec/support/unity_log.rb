# frozen_string_literal: true

#
# Helper module for less typing, more description
#
module UnityLog
  def with_line(log_line, &block)
    context "with input '#{log_line}'" do
      subject { described_class.new.parse(log_line) }
      instance_exec(&block)
    end
  end
end
