require 'spec_helper'

describe LlPay do
  it 'has a version number' do
    expect(LlPay::VERSION).not_to be nil
  end

  describe '#ll pay request' do
    specify 'll pay request ret_code error' do
      expect_result_json = "{\"ret_code\":\"9002\",\"ret_msg\":\"报文解析异常\"}"

      expect(HTTP).to receive(:get).with('https://queryapi.lianlianpay.com/refundquery.htm').and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.request(:get, 'https://queryapi.lianlianpay.com/refundquery.htm')

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'll pay request get success' do
      expect_result_json = "{\"ret_code\":\"0000\",\"ret_msg\":\"退款成功\",\"sign_type\":\"RSA\",\"sign\":\"dKutUenajQnmte+a0jlsJtEOecFJX8yILTs4UTIbgRKH4mWzuAogrgB9MR9aH7FFptKECKjsWCOEdh9r1fRLHb+a0nZ7feS/XtgtuQYy7FTPvQOnrutpXJvDstK0B9MAaNARGlUMEHhLLlvr+B/ccHDYG7eyCgos6fr2I7CrLDw=\",\"oid_partner\":\"201103171000000000\"}"

      expect(HTTP).to receive(:get).with('https://queryapi.lianlianpay.com/refundquery.htm').and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.request(:get, 'https://queryapi.lianlianpay.com/refundquery.htm')

      expect(response_hash).to eq(JSON.parse(expect_result_json))
    end

    specify 'll pay request get ret_code success, but sign error' do
      expect_result_json = "{\"ret_code\":\"0000\",\"ret_msg\":\"退款成功\",\"sign_type\":\"RSA\",\"sign\":\"dKutUenajQnmte+a0jlsJtEOecFJX8yILTs4UTIbgRKogrgB9MR9aH7FFptKECKjsWCOEdh9r1fRLHb+a0nZ7feS/XtgtuQYy7FTPvQOnrutpXJvDstK0B9MAaNARGlUMEHhLLlvr+B/ccHDYG7eyCgos6fr2I7CrLDw=\",\"oid_partner\":\"201103171000000000\"}"

      expect(HTTP).to receive(:get).with('https://queryapi.lianlianpay.com/refundquery.htm').and_return(HTTP::Response.new(status: 200, body: expect_result_json, version: '1.0'))

      response_hash = LlPay.request(:get, 'https://queryapi.lianlianpay.com/refundquery.htm')

      expect(response_hash).to eq({ ret_msg: '签名验证错误' })
    end
  end
end
