require 'spec_helper'

describe LlPay::Service do
  describe '#test service' do
    specify 'test service securitypay_pay_json' do
      payment_params = {
            ap_merchant_id: 'test',
            user_id: 1,
            no_order: 1,
            dt_order: '20161013153529',
            oid_partner: LlPay.oid_partner,
            busi_partner: 109001,
            money_order: 100,
            info_order: 'info_order',
            name_goods: 'name_goods',
            sign_type: 'RSA',
            valid_order: '10080',
            risk_item: { user_info_mercht_userno: 1,
                         user_info_dt_register: '20161013153529',
                         frms_ware_category: 4008 }.to_json,
            notify_url:  'https://www.xxx.com/payments/1/notify'
          }

      r = LlPay.securitypay_pay_json(payment_params)
      expect_result_json = "{\"ap_merchant_id\":\"test\",\"user_id\":1,\"no_order\":1,\"dt_order\":\"20161013153529\",\"oid_partner\":\"201103171000000000\",\"busi_partner\":109001,\"money_order\":100,\"info_order\":\"info_order\",\"name_goods\":\"name_goods\",\"sign_type\":\"RSA\",\"valid_order\":\"10080\",\"risk_item\":\"{\\\"user_info_mercht_userno\\\":1,\\\"user_info_dt_register\\\":\\\"20161013153529\\\",\\\"frms_ware_category\\\":4008}\",\"notify_url\":\"https://www.xxx.com/payments/1/notify\",\"sign\":\"qqcwimfOewsHFicywhywUKPkPI4ho0V2uf/4OSOINrxjt3Tfp+coX65g7AHYOxd9pnrmkb2FrzWqjBa96EwwOUUZPpgi3R5OCo7bSj1ljcJTesCkumKCLjDsmcZhmNz3zrnfVBpzNP0XsVB28IW4AwkMYO5maWAYIlsABMY4xsw=\"}"

      expect(r).to eq(expect_result_json)
    end
  end
end
