# frozen_string_literal: true

require 'json'

#
# Helper module for less typing, more description
#
module ParserOutput
  def with_parser_output(&block)
    output = UnityPretty::Parser::Output.new(0)
    context "with parsed output '#{output.to_json}'" do
      subject { output }
      instance_exec(&block)
    end
  end
end
