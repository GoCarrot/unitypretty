# frozen_string_literal: true

require 'unitypretty'

Dir[File.dirname(__FILE__) + '/support/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.extend UnityLog
  config.extend ParserOutput
end
