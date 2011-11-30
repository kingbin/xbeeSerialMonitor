require 'json'

module XBee
  class Client
    module Thermostat

      def status_of_thermostat()
        # puts "http://#{thermostat_ip}/tstat"

          status = JSON.parse(open("http://#{thermostat_ip}/tstat").read) rescue nil
          returnStatus = Array.new

          if status
            returnStatus[returnStatus.length] = "The temperature is currently #{status["temp"]} degrees."

            if status["tmode"] == 0
              returnStatus[returnStatus.length] = "The heater and air conditioner are turned off."
            else
              device_type = (status["tmode"] == 1 ? "heater" : "air conditioner")
              target_temp = (status["tmode"] == 1 ? status["t_heat"] : status["t_cool"])

              returnStatus[returnStatus.length] =  "The #{device_type} is set to engage at #{target_temp} degrees."

              if status["tstate"] == 0
                returnStatus[returnStatus.length] =  "The #{device_type} is off."
              elsif (status["tmode"] == 1 and status["tstate"] == 1) or (status["tmode"] == 2 and status["tstate"] == 2)
                returnStatus[returnStatus.length] =  "The #{device_type} is running."
              end
            end
          else
            returnStatus[returnStatus.length] =  "Sorry, the thermostat is off."
          end
#          puts '-----------'
#          puts returnStatus.length
#          puts returnStatus
#          puts '----------'
          return returnStatus
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
