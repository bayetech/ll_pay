require 'date'
require 'uri'
require 'http' # https://github.com/httprb/http

module LlPay
  module QueryOrder
    def query_single_order(sign_type, no_order, dt_order)
      query_order_hash = { oid_partner: LlPay.oid_partner, dt_order: dt_order, no_order: no_order, sign_type: sign_type }
      query_order_hash[:sign] = LlPay::Sign.generate(query_order_hash)

      request(:post, 'queryapi/orderquery.htm', query_order_hash)
    end
  end
end
