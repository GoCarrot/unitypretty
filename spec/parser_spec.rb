# frozen_string_literal: true

require_relative '../lib/unitypretty/parser'

describe UnityPretty::Parser::Output do
  context '' do
    subject { UnityPretty::Parser::Output.new(0) }
    # it { is_expected.to have_attributes priority: 0 }
  end
end
