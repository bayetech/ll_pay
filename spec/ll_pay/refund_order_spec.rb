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

      expect_result_json = "{\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"amAAfQnn0ZUpNWTygaTsRrNLH6TuWrshxkt9p138OZZ8/4iVjVlNuLk+0QUvvP82AtD1gdvGZQpcAryDa/mLG662WJ78DTL5zxuTImdKIGwiVDaO53UyIm7uNv7VITSbvdkrA5WZRwAFjmE9288AB8IxtKCBJguoQ6Rz05IQvlY=\",\"sign_type\":\"RSA\",\"sta_refund\":\"2\"}"

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

      expect_result_json = "{\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201103171000000000\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"amAAfQnn0ZUpNWTygaTsRrNLH6TuWrshxkt9p138OZZ8/4iVjVlNuLk+0QUvvP82AtD1gdvGZQpcAryDa/mLG662WJ78DTL5zxuTImdKIGwiVDaO53UyIm7uNv7VITSbvdkrA5WZRwAFjmE9288AB8IxtKCBJguoQ6Rz05IQvlY=\",\"sign_type\":\"RSA\",\"sta_refund\":\"2\"}"

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

      request_parms = params.merge(sign: "HlOLdxvVhNSA5S4ElDKzM38aCAXTE+Y1JL3/RUvMwzeL4CXMvNtGRE2tNQtpM5JiPeAV1GQbcJMwx5K1c/ESD/OVj3z+P1N4iawTwcmw6W6Tt1BUX7UQBEE426Q0maG06EBRmVNfQ6Ujg3WNqaiWV+ikmU/a7nuoh7SsX2u8S0c=")

      expect_result_json = "{\"dt_refund\":\"20161017154209\",\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201609211001116515\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"4cfd1218aacf0233fb70c695bdec6af7\",\"sign_type\":\"MD5\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/traderapi/refund.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'test refund_order refund_order_query md5' do
      params = { sign_type: 'MD5',
                 oid_partner: '201103171000000000',
                 no_refund: '1dd1ea7523daa43c8efd7538e25c0171',
                 dt_refund: '20161017154209',
                 oid_refundno: '9016101823522307'
               }

      request_parms = params.merge(sign: "350aae8281b7a1622b6c4b884056a2d5")

      expect_result_json = "{\"dt_refund\":\"20161017154209\",\"money_refund\":\"0.01\",\"no_refund\":\"1dd1ea7523daa43c8efd7538e25c0171\",\"oid_partner\":\"201609211001116515\",\"oid_refundno\":\"9016101823522307\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20161018\",\"sign\":\"4cfd1218aacf0233fb70c695bdec6af7\",\"sign_type\":\"MD5\",\"sta_refund\":\"2\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/traderapi/refund.htm', json: request_parms).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.refund_order(params)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end
  end
end
