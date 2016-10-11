require 'll_pay/version'
require 'll_pay/sign'
require 'll_pay/sign/md5'
require 'll_pay/sign/rsa'
require 'll_pay/notify'
require 'll_pay/query_order'

module LlPay
  # 银通公钥
  YT_PUB_KEY = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSS/DiwdCf/aZsxxcacDnooGph3d2JOj5GXWi+q3gznZauZjkNP8SKl3J2liP0O6rU/Y/29+IUe+GTMhMOFJuZm1htAtKiu5ekW0GlBMWxf4FPkYlQkPE0FtaoMP3gYfh+OwI+fIRrpW3ySn3mScnc6Z700nU/VYrRkfcSCbSnRwIDAQAB'.freeze

  class << self
    attr_accessor :oid_partner # 商户编号
    attr_accessor :rsa_pri_key # 私钥
    attr_accessor :md5_key     # md5
  end
end
