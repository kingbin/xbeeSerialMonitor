# 7e,00,0d,90,00,13,a2,00,40,71,07,15,04,43,01,42,63,
class RX_Packet 
  attr_accessor :length, :frame_type, :src_addy_64, :src_addy_16, :rcv_op, :rcv_data, :chk_sum
 
  def initialize(*msg)
    "Got this NOISE: #{msg.join(',')}"
#    @fname = fname
#    @lname = lname
  end
end
