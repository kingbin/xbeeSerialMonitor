module XBee
  class Client < API
    require 'xbee/client/database'
    require 'xbee/client/thermostat'

    include XBee::Client::Database
    include XBee::Client::Thermostat
  end
end
