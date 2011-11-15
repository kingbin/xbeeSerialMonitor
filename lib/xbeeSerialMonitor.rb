require 'xbee/api'
require 'xbee/configuration'
require 'xbee/client'

=begin
module XBee
  extend Configuration
  class << self
    # Alias for XBee::Client.new
    #
    # @return [XBee::Client]
    def new(options={})
      Xbee::Client.new(options)
    end

    # Delegate to XBee::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
=end
