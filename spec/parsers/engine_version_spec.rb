# frozen_string_literal: true

describe UnityPretty::Parsers::EngineVersion do
  describe '#parse' do
    with_line 'Initialize engine version: 2017.4.9f1 (6d84dfc57ccf)' do
      it { should have_attributes version: '2017.4.9f1' }
      it { should have_attributes sha: '6d84dfc57ccf' }
    end
  end
end
