require 'date'
require 'uri'
require 'http' # https://github.com/httprb/http

module LlPay
  module QueryOrder
    def query_single_order(sign_type, no_order, dt_order)
      query_order_hash = { oid_partner: LlPay.oid_partner, dt_order: dt_order, no_order: no_order, sign_type: sign_type }
      query_order_hash[:sign] = LlPay::Sign.generate(query_order_hash)

      http_response = HTTP.post('https://yintong.com.cn/queryapi/orderquery.htm',
                                json: query_order_hash)

      response_hash = JSON.parse(http_response.body.to_s)

      if http_response.code == 200
        if response_hash['ret_code'] == 0000 && LlPay::Sign.verify?(response_hash)
          return response_hash
        else
          return response_hash
        end
      end
    end
  end
end
