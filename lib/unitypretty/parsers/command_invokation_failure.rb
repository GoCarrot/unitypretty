# frozen_string_literal: true

module UnityPretty
  module Parsers
    #
    # Parses Unity version
    #
    class CommandInvokationFailure
      include UnityPretty::Parser

      Data = Struct.new(:description, :command)

      line /^CommandInvokationFailure:(.*)$/ do |desc|
        @state = :parse_command
        data(
          description: desc.strip
        )
      end

      state :parse_command do
        line /org.gradle.launcher.GradleMain "(.*)" "(.*)"$/ do |args, target|
          data(
            command: {
              gradle: {
                args: args,
                target: target
              }
            }
          )
        end

        line /.*/ do |command|
          data(
            command: command
          )
        end
      end
    end
  end
end
