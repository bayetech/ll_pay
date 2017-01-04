require 'spec_helper'

describe LlPay::Notify do
  describe '#test notify' do
    specify 'test notify verify rsa' do
      hash_params = { 'bank_code' => '98000008',
                      'dt_order' => '20161017154209',
                      'money_order' => '0.01',
                      'no_order' => '1dd1ea7523daa43c8efd7538e25c0171',
                      'oid_partner' => '201103171000000000',
                      'oid_paybill' => '2016101784354400',
                      'pay_type' => 'O',
                      'result_pay' =>'SUCCESS',
                      'settle_date' => '20161017',
                      'sign' => 'ShS7KAmsX/TgT75xLutFlmU0j87Z9W00h8+WzNkifL0aAEoeY7KncjDQ9klCtPL05mEdUjPNz7mkM6E86Yym6zr0/No817n+yjX2J2STlyUQMKVRcRRDeunR3BWZIUldNVwMi+wr4vpT7gpBpzpcJiS8NT7jJV8k/suAr0bPCD8=',
                      'sign_type' => 'RSA' }

      expect(LlPay.notify_verify?(hash_params))
        .to eq true
    end
  end
end
