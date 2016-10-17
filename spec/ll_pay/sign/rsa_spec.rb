require 'spec_helper'

describe LlPay::Sign::RSA do
  describe '#sign rsa' do
    specify 'test sign rsa' do
      expect(LlPay::Sign::RSA.sign(LlPay.rsa_pri_key, 'oid_partner=201103171000000000&dt_order=20130515094013'))
        .to eq 'CxHJ+2X2IHoK9lF2ATxxY6fEBm7QqB5ENUe31zkU8llSMZxIsyq7nNw9Ho8MXVoo5pNvPBGT84N2L61872atGTTX1aeTC+7JI753foko+RyPTWK7D9iowFO0ChAVL8j+9Ug9Puvp2Ue3ygy6Ffu2YXzMNX5KH3c6EHyzqU2v7F0='
    end

    specify 'test sign rsa verify' do
      string = "bank_code=98000008&dt_order=20161017154209&money_order=0.01&no_order=1dd1ea7523daa43c8efd7538e25c0171&oid_partner=201609211001116515&oid_paybill=2016101784354400&pay_type=O&result_pay=SUCCESS&settle_date=20161017&sign_type=RSA"
      sign = "W8Wjd1UcTbU424U+qRbU5CxFMFrJEuChwrweDG7i9lkBMT88NNJ8hkwOC+lyyGZEjniF8QX1xlQ0V0BnAZSFMD/RKSce/Vb4SJJ0C4QubMKqy3Qs0jITmLKuPQpmolCKVMskoeRJaWFMlT6OOG5D/6B+UBsyRv/2C0l+wJLyyzI="
      expect(LlPay::Sign::RSA.verify?(string,sign))
        .to eq true
    end
  end
end
