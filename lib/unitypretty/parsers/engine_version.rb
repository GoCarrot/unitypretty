# frozen_string_literal: true

module UnityPretty
  module Parsers
    #
    # Parses Unity version
    #
    class EngineVersion
      include UnityPretty::Parser

      #
      # Unity engine version and sha
      #
      Data = Struct.new(:version, :sha)

      # Initialize engine version: 2017.4.9f1 (6d84dfc57ccf)
      line /^Initialize engine version: (.*) \((.*)\)$/ do |version, sha|
        output data: {
          version: version,
          sha: sha
        }
      end
    end
  end
end
