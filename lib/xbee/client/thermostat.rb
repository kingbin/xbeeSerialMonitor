
module XBee
  class Client
    module Thermostat
    
      def status_of_thermostat()
        puts "http://#{thermostat_ip}/tstat"
        puts "Checking the status of the thermostat"
      end

      def set_thermostat(temp)
        puts "One moment while I set the thermostat to #{temp} degrees"
      end

      def temperature()
        puts "Checking the temperature."
      end 
    
    end
  end
end
