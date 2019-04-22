# frozen_string_literal: true

require_relative '../../lib/unitypretty/parser'

describe UnityPretty::Parsers::EngineVersion do
  describe '#parse' do
    with_line 'Initialize engine version: 2017.4.9f1 (6d84dfc57ccf)' do
      # it { should include version: '2017.4.9f1' }
    end
  end
end
