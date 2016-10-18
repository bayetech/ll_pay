require 'date'
require 'uri'
require 'http' # https://github.com/httprb/http

module LlPay
  module QueryOrder
    def query_single_order(sign_type, no_order, dt_order)
      query_order_hash = { oid_partner: LlPay.oid_partner, dt_order: dt_order, no_order: no_order }

      if sign_type == 'RSA'
        query_order_hash[:sign_type] = 'RSA'
        query_order_hash[:sign] = LlPay::Sign::RSA.sign(LlPay.rsa_pri_key, LlPay::Sign.params_to_string(query_order_hash))
      else
        query_order_hash[:sign_type] = 'MD5'
        query_order_hash[:sign] = LlPay::Sign::MD5.sign(LlPay.md5_key, LlPay::Sign.params_to_string(query_order_hash))
      end

      http_response = HTTP.post('https://yintong.com.cn/queryapi/orderquery.htm',
                                json: query_order_hash)

      response_hash = JSON.parse(http_response.body.to_s)

      if http_response.code == 200
        if response_hash['ret_code'] == 0000 && LlPay::Sign.verify?(response_hash)
          return response_hash
        else
          return response_hash
        end
      else
        return
      end
    end
  end
end
