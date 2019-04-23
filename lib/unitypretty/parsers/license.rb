# frozen_string_literal: true

module UnityPretty
  module Parsers
    #
    # Parses messages relevant to the Unity License server
    #
    class License
      include UnityPretty::Parser

      #
      # Unity engine version and sha
      #
      Data = Struct.new(:date, :next_date)

      line /^LICENSE SYSTEM \[(.*)\] Next license update check is after (.*)$/ do |date, next_date|
        date, time = date.split(' ')
        year = date[0..3]
        month = date[4..5]
        day = date[6..-1]

        unless month[0] == '1' && month[1].to_i < 3 && date.length > 6
          month = date[4]
          day = date[5..-1]
        end

        output data: {
          date: DateTime.strptime("#{year} #{month} #{day} #{time}", '%Y %m %d %H:%M:%S'),
          next_date: DateTime.parse(next_date)
        }
      end
    end
  end
end
