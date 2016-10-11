require 'll_pay/version'
require 'll_pay/sign'
require 'll_pay/sign/md5'
require 'll_pay/sign/rsa'
require 'll_pay/notify'
require 'll_pay/query_order'

module LlPay
  @debug_mode = true

  class << self
    attr_accessor :oid_partner # 商户编号
    attr_accessor :rsa_pri_key # 私钥
    attr_accessor :rsa_pub_key # 公钥
    attr_accessor :md5_key     # md5
    attr_accessor :debug_mode

    def debug_mode?
      @debug_mode
    end
  end
end
