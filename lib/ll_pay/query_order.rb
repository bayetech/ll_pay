require 'date'
require 'uri'
require 'http' # https://github.com/httprb/http

module LlPay
  module QueryOrder
    def self.query_single_order(sign_type, no_order, dt_order)
      query_order_hash = { oid_partner: LlPay.oid_partner, dt_order: dt_order, no_order: no_order }

      if sign_type == 'RSA'
        query_order_hash[:sign_type] = 'RSA'
        query_order_hash[:sign] = RSA.sign(LlPay.rsa_pri_key, params_to_string(query_order_hash))
      else
        query_order_hash[:sign_type] = 'MD5'
        query_order_hash[:sign] = MD5.sign(LlPay.md5_key, params_to_string(query_order_hash))
      end

      http_response = HTTP.post('https://yintong.com.cn/queryapi/orderquery.htm',
                                json: query_order_hash)

      if http_response.code == 200 && LlPay::Sign.verify?(params_to_string(JSON.parse(http_response.body)))
        return JSON.parse(http_response.body)
      else
        return
      end
    end

    def self.params_to_string(params)
      params.sort.map do |k, v|
        "#{k}=#{v}" if v.to_s != '' && k.to_s != 'sign'
      end.compact.join('&')
    end
  end
end
