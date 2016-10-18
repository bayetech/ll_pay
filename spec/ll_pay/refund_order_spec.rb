require 'spec_helper'

describe LlPay::QueryOrder do
  describe '#test query_order' do
    specify 'test query_order query_single_order rsa' do
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

      expect_result_json = "{\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"amAAfQnn0ZUpNWTygaTsRrNLH6TuWrshxkt9p138OZZ8/4iVjVlNuLk+0QUvvP82AtD1gdvGZQpcAryDa/mLG662WJ78DTL5zxuTImdKIGwiVDaO53UyIm7uNv7VITSbvdkrA5WZRwAFjmE9288AB8IxtKCBJguoQ6Rz05IQvlY=\",\"sign_type\":\"RSA\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/traderapi/refund.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'test query_order query_single_order md5' do
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

      expect_result_json = "{\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"amAAfQnn0ZUpNWTygaTsRrNLH6TuWrshxkt9p138OZZ8/4iVjVlNuLk+0QUvvP82AtD1gdvGZQpcAryDa/mLG662WJ78DTL5zxuTImdKIGwiVDaO53UyIm7uNv7VITSbvdkrA5WZRwAFjmE9288AB8IxtKCBJguoQ6Rz05IQvlY=\",\"sign_type\":\"RSA\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/traderapi/refund.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end
  end
end
