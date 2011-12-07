# 7e,00,0d,90,00,13,a2,00,40,71,07,15,04,43,01,42,63,

class RX_Packet
  attr_accessor :length, :frame_type, :src_addy_64, :src_addy_16, :rcv_op, :rcv_data, :chk_sum

  def initialize(*msg)
    "Got this NOISE: #{msg.join(',')}"
    :length = (Integer("0x"+msg[1]) * 255) + Integer("0x"+msg[2])
    :frame_type = msg[3];
    :src_addy_64 = msg[4..11];
    :src_addy_16 = (Integer("0x"+msg[12]) * 255) + Integer("0x"+msg[13])
    :rcv_op = msg[14]
    :rcv_data = msg[15,length -12]
    :chk_sum = msg[length+3]
  end
end
