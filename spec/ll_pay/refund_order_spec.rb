require 'spec_helper'

describe LlPay::QueryOrder do
  describe '#test refund_order' do
    specify 'test refund_order refund_order rsa' do
      params = { sign_type: 'RSA',
                 oid_partner: '201103171000000000',
                 no_refund: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_refund: '20161017154209',
                 money_refund: '0.01',
                 no_order: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_order: '20161017154209',
                 oid_paybill: '2016101784354400',
                 notify_url: 'https://xxx.com/refund/llpay/1dd1ea7523daa43c8efd7538e25c0171/refund_callback'
               }

      request_parms = params.merge(sign: "amAAfQnn0ZUpNWTygaTsRrNLH6TuWrshxkt9p138OZZ8/4iVjVlNuLk+0QUvvP82AtD1gdvGZQpcAryDa/mLG662WJ78DTL5zxuTImdKIGwiVDaO53UyIm7uNv7VITSbvdkrA5WZRwAFjmE9288AB8IxtKCBJguoQ6Rz05IQvlY=")

      expect_result_json = "{\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"sm/Tlb2ip93PqOEuw6iom3jUi9DBOTpQzPoy2JGJrGeQtNtn6YarKA7XqA9Rj5rZUKVtfpxaDK4NgD7jLdpwYrqmXI1uOA2kGG6xF/kTBHAY74EsDCKNfyCY3EkvHXMEQYovFzTqS3pIWX5+FRrsY0acGfwDAXxeV4ECz5EhFBE=\",\"sign_type\":\"RSA\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/traderapi/refund.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'test refund_order refund_order md5' do
      params = { sign_type: 'MD5',
                 oid_partner: '201103171000000000',
                 no_refund: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_refund: '20161017154209',
                 money_refund: '0.01',
                 no_order: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_order: '20161017154209',
                 oid_paybill: '2016101784354400',
                 notify_url: 'https://xxx.com/refund/llpay/1dd1ea7523daa43c8efd7538e25c0171/refund_callback'
               }

      request_parms = params.merge(sign: "bdadc6992c93c139e9cc3b7d8f16ef11")

      expect_result_json = "{\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"b72abab1870ed5c8869a1e07ec357754\",\"sign_type\":\"MD5\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/traderapi/refund.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end
  end

  describe '#test refund_order' do
    specify 'test refund_order refund_order_query rsa' do
      params = { sign_type: 'RSA',
                 oid_partner: '201103171000000000',
                 no_refund: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_refund: '20161017154209',
                 oid_refundno: '9016101823522307'
               }

      request_parms = params.merge(sign: "kFTjFgqn8NmBo/LOVGJ3eRLSCI9b6FXge8Jg/UpQTu8AqedX0yT6lA8wz9f4JoEwzYFZd5OaXAFQXyaOQwqb1wGJAr/XUlp31+YOgBP5sAE6nbcYb/wzHXmqZp15gjJ+AQ6FWgf8ZPN3PMAv1nOUm/8ubcSsxo+ziSw1oAQtQbw=")

      expect_result_json = "{\"dt_refund\":\"20161017154209\",\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"jpfCUkAuKIbbtEHJ8jOhG362P8PB0rwS+MHoFWkqpkRvvAbDSz8AJMu7INOvZh7OkVjTrFTrkPcSZ/7f+7a6e6JhcRtc60Hjtr/yKTJGOlNvOeqgZI1y6Z3Jk8g3TtRusgzTpLvuHhDqCnpS60YLcASHqhHdrPnFsvBLKXfQhd0=\",\"sign_type\":\"RSA\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://queryapi.lianlianpay.com/refundquery.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order_query(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'test refund_order refund_order_query md5' do
      params = { sign_type: 'MD5',
                 oid_partner: '201103171000000000',
                 no_refund: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_refund: '20161017154209',
                 oid_refundno: '9016101823522307'
               }

      request_parms = params.merge(sign: "df56b0bd827e978610b010320c611d42")

      expect_result_json = "{\"dt_refund\":\"20161017154209\",\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"e2fb13ce74b908ff7aa875245592e55c\",\"sign_type\":\"MD5\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://queryapi.lianlianpay.com/refundquery.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order_query(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end
  end
end
