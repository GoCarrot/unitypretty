# frozen_string_literal: true

describe UnityPretty::Parsers::CommandInvokationFailure do
  describe '#parse' do
    with_log 'gradle.multiple.dex.define' do
      it { should have_attributes description: 'Gradle build failed.' }
    end
  end
end
