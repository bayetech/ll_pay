require 'spec_helper'

describe LlPay::Service do
  describe '#test service' do
    specify 'test service securitypay_pay_json' do
      payment_params = {
            user_id: 1,
            no_order: 1,
            dt_order: '20161013153529',
            busi_partner: 109001,
            money_order: 100,
            risk_item: { user_info_mercht_userno: 1,
                         user_info_dt_register: '20161013153529',
                         frms_ware_category: 4008 }.to_json,
            notify_url:  'https://www.xxx.com/payments/1/notify'
          }

      r = LlPay::Service.securitypay_pay_json(payment_params)

      expect(r).to eq("{\"oid_partner\":\"201103171000000000\",\"user_id\":1,\"no_order\":1,\"dt_order\":\"20161013153529\",\"busi_partner\":109001,\"money_order\":100,\"risk_item\":\"{\\\"user_info_mercht_userno\\\":1,\\\"user_info_dt_register\\\":\\\"20161013153529\\\",\\\"frms_ware_category\\\":4008}\",\"notify_url\":\"https://www.xxx.com/payments/1/notify\",\"sign_type\":\"MD5\",\"sign\":\"14b4dc8725b6c22326c2017319854190\"}")
    end
  end
end
