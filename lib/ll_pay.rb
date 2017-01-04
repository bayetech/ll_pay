require 'll_pay/version'
require 'll_pay/sign'
require 'll_pay/sign/md5'
require 'll_pay/sign/rsa'
require 'll_pay/notify'
require 'll_pay/query_order'
require 'll_pay/refund_order'
require 'll_pay/service'
require 'll_pay/utils'

module LlPay
  # 银通公钥
  YT_PUB_KEY = <<-EOF
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSS/DiwdCf/aZsxxcacDnooGph3d2JOj5GXWi+
q3gznZauZjkNP8SKl3J2liP0O6rU/Y/29+IUe+GTMhMOFJuZm1htAtKiu5ekW0GlBMWxf4FPkYlQ
kPE0FtaoMP3gYfh+OwI+fIRrpW3ySn3mScnc6Z700nU/VYrRkfcSCbSnRwIDAQAB
-----END PUBLIC KEY-----
    EOF

  @sign_type = 'MD5'

  class << self
    attr_accessor :oid_partner # 商户编号
    attr_accessor :rsa_pri_key # 私钥
    attr_accessor :md5_key     # md5
    attr_accessor :sign_type

    include QueryOrder
    include RefundOrder
    include Service
    include Notify
  end

  def self.request(verb, url, params = {}, options = {})
    case verb.to_sym
    when :post
      @http_response = HTTP.post(url, json: params)
    when :get
      @http_response = HTTP.get(url)
    end
    response_hash = JSON.parse(@http_response.body.to_s)

    if @http_response.code == 200
      if response_hash['ret_code'] == '0000'
        if LlPay::Sign.verify?(response_hash, options)
          return response_hash
        else
          return { ret_msg: '签名验证错误' }
        end
      else
        return response_hash
      end
    end
  end
end
