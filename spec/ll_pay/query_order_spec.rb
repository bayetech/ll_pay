require 'spec_helper'

describe LlPay::QueryOrder do
  describe '#test query_order' do
    specify 'test query_order query_single_order md5' do
      query_order_hash = {
        oid_partner: '201103171000000000',
        dt_order: nil,
        no_order: '2013051500001',
        sign_type: 'MD5',
        sign: 'fc89030f6514ac7442de4bb46237b647'
      }

      expect_result_json = "{\"bank_code\":\"03080000\",\"card_no\":\"621483******7016\",\"dt_order\":\"20150820120033\",\"info_order\":\"考拉理财,开启懒人理财生活。\",\"money_order\":\"0.01\",\"no_order\":\"2013051500001\",\"oid_partner\":\"201408071000001543\",\"oid_paybill\":\"2015082119289047\",\"pay_type\":\"D\",\"result_pay\":\"SUCCESS\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20150821\",\"sign\":\"57c49eb3687e7fa86cea5906420e17f3\",\"sign_type\":\"MD5\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/queryapi/orderquery.htm', json: query_order_hash).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay::QueryOrder.query_single_order('MD5', '2013051500001', nil)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'test query_order query_single_order rsa' do
      query_order_hash = {
        oid_partner: '201103171000000000',
        dt_order: nil,
        no_order: '2013051500001',
        sign_type: 'RSA',
        sign: 'f4+1KcPttjFOEWSuJYAaT4+C3t30AZ/bXyB76408ydbJDhDy8zfawwglMUexCrU4yCoPHCTXlJXhPtpgpvR+dHHpjs5DhdDFTtDq3SHeKJ+eVTcTAeoLV5kbYkHYCtCHMm7YCz4JoLk+YX+pNJ7Atz7YLjU6+XjKlrKE3qf+UA8='
      }

      expect_result_json = "{\"bank_code\":\"03080000\",\"card_no\":\"621483******7016\",\"dt_order\":\"20150820120033\",\"info_order\":\"考拉理财,开启懒人理财生活。\",\"money_order\":\"0.01\",\"no_order\":\"2013051500001\",\"oid_partner\":\"201408071000001543\",\"oid_paybill\":\"2015082119289047\",\"pay_type\":\"D\",\"result_pay\":\"SUCCESS\",\"ret_code\":\"0000\",\"ret_msg\":\"交易成功\",\"settle_date\":\"20150821\",\"sign\":\"57c49eb3687e7fa86cea5906420e17f3\",\"sign_type\":\"RSA\"}"

      expect(HTTP).to receive(:post).with('https://yintong.com.cn/queryapi/orderquery.htm', json: query_order_hash).and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay::QueryOrder.query_single_order('RSA', '2013051500001', nil)

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end
  end
end
