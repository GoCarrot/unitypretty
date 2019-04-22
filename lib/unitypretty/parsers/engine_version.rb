# frozen_string_literal: true

module UnityPretty
  module Parsers
    #
    # Parses Unity version
    #
    class EngineVersion
      include UnityPretty::Parser

      Data = Struct.new(:version, :sha)

      # Initialize engine version: 2017.4.9f1 (6d84dfc57ccf)
      line /^Initialize engine version: (.*) \((.*)\)$/ do |version, sha|
        {
          timestamp: ,
          version: 1,
          data: {
            version: version,
            sha: sha
          }
        }
        self
      end
    end
  end
end
