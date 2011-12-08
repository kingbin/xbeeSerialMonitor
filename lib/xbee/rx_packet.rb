# 7e,00,0d,90,00,13,a2,00,40,71,07,15,04,43,01,42,63,

class RX_Packet
  attr_accessor :msg, :length, :frame_type, :src_addy_64, :src_addy_16, :rcv_op, :rcv_data, :chk_sum

  def initialize(*msg)
    self.msg = msg
    self.length = (Integer("0x"+msg[1]) * 255) + Integer("0x"+msg[2])
    totallngth = self.length+3
    if msg.length == (totallngth+1)
      self.frame_type = msg[3];
      self.src_addy_64 = msg[4..11];
      self.src_addy_16 = (Integer("0x"+msg[12]) * 255) + Integer("0x"+msg[13])
      self.rcv_op = msg[14]
      self.rcv_data = msg[15,self.length-12]
      self.chk_sum = msg[totallngth]
    end
  end
end
