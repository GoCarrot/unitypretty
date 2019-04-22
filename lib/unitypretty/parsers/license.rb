# frozen_string_literal: true

module UnityPretty
  module Parsers
    #
    # Parses messages relevant to the Unity License server
    #
    class License
      include UnityPretty::Parser

      # LICENSE SYSTEM [201921 13:47:26] Next license update check is after 2019-01-31T02:16:03
      line /^LICENSE SYSTEM \[(.*)\] Next license update check is after (.*)$/ do |date, next_date|
        puts date
        puts next_date
        'bar'
      end
    end
  end
end
