# frozen_string_literal: true

describe UnityPretty::Parser do
  describe 'UnityPretty::Parser::OUTPUT_VERSION' do
    subject { UnityPretty::Parser::OUTPUT_VERSION }
    it { is_expected.to equal 1 }
  end

  describe UnityPretty::Parser::Output do
    subject { UnityPretty::Parser::Output.new(0) }

    it { is_expected.to have_attributes timestamp: 0 }
    it { is_expected.to have_attributes version: nil }
    it { is_expected.to have_attributes action_type: nil }
    it { is_expected.to have_attributes result: nil }
    it { is_expected.to have_attributes data: nil }
  end
end
