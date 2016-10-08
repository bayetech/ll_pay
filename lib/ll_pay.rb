require 'll_pay/version'
require 'll_pay/sign'
require 'll_pay/sign/md5'
require 'll_pay/sign/rsa'
require 'll_pay/notify'

module LlPay
  @debug_mode = true

  class << self
    attr_accessor :rsa_pub_key, :md5_key, :debug_mode

    def debug_mode?
      @debug_mode
    end
  end
end
