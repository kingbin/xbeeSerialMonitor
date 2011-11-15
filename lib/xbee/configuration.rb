require 'serialport'

module XBee
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :baud,
      :data_bits,
      :stop_bits,
      :parity,
      :host,
      :db,
      :user,
      :pass].freeze

    # The adapter that will be used
    Dir.chdir("/dev")
    DEFAULT_USB = Dir.glob("tty.usbserial*")
    DEFAULT_BAUD = 9600
    DEFAULT_DATA_BITS = 8
    DEFAULT_STOP_BITS = 1
    DEFAULT_PARITY = SerialPort::NONE

    # should seperate into it's own module, but for now I'm combining them
    DEFAULT_HOST = "localhost".freeze
    DEFAULT_DB = "db".freeze
    DEFAULT_USER = "user".freeze
    DEFAULT_PASS = "pass".freeze

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_USB
      self.baud               = DEFAULT_BAUD
      self.data_bits          = DEFAULT_DATA_BITS
      self.stop_bits          = DEFAULT_STOP_BITS
      self.parity             = DEFAULT_PARITY
      self.host               = DEFAULT_HOST
      self.db                 = DEFAULT_DB
      self.user               = DEFAULT_USER
      self.pass               = DEFAULT_PASS
      self
    end
  end
end
