require 'spec_helper'

describe LlPay::Notify do
  describe '#test notify' do
    specify 'test notify verify rsa' do
      hash_params = { 'bank_code' => '98000008',
                      'dt_order' => '20161017154209',
                      'money_order' => '0.01',
                      'no_order' => '1dd1ea7523daa43c8efd7538e25c0171',
                      'oid_partner' => '201609211001116515',
                      'oid_paybill' => '2016101784354400',
                      'pay_type' => 'O',
                      'result_pay' =>'SUCCESS',
                      'settle_date' => '20161017',
                      'sign' => 'W8Wjd1UcTbU424U+qRbU5CxFMFrJEuChwrweDG7i9lkBMT88NNJ8hkwOC+lyyGZEjniF8QX1xlQ0V0BnAZSFMD/RKSce/Vb4SJJ0C4QubMKqy3Qs0jITmLKuPQpmolCKVMskoeRJaWFMlT6OOG5D/6B+UBsyRv/2C0l+wJLyyzI=',
                      'sign_type' => 'RSA' }

      expect(LlPay.notify_verify?(hash_params, { oid_partner: '201609211001116515' }))
        .to eq true
    end
  end
end
