require 'mysql'

module XBee
  class Client
    # Defines methods related to friends and followers
    module Database
      def SaveMessage(message)

        # message => 7e,00,0d,90,00,7d,33,a2,00,40,71,07,15,ed,15,01,42,a8,
        # a => ["7e", "00", "0d", "90", "00", "7d", "33", "a2", "00", "40", "71", "07", "15", "ed", "15", "01", "42", "a8"]
        # a.hex => [126, 0, 13, 144, 0, 125, 51, 162, 0, 64, 113, 7, 21, 237, 21, 1, 66, 168]
          puts message
          a = message.split(',')
          puts a
        # '42'.convert_base(10,16) => 2a ???
        # '42'.hex.chr => "B"
        # message.scan(/../).each { | t | puts t.hex.chr }
        #  dbh.query("INSERT INTO  _TEST(AlarmPIN) VALUES('cnslDOORB')")

#        options = {:cursor => -1}
#        options.merge!(args.last.is_a?(Hash) ? args.pop : {})
#        user = args.first
#        merge_user_into_options!(user, options)
#        response = get('1/friends/ids', options)
#        format.to_s.downcase == 'xml' ? Hashie::Mash.new(:ids => response['id_list']['ids']['id'].map{|id| id.to_i}) : response
      end
    end
  end
end
