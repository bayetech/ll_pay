require 'spec_helper'

describe LlPay::Sign::RSA do
  describe '#sign rsa' do
    specify 'test sign rsa' do
      expect(LlPay::Sign::RSA.sign(LlPay.rsa_pri_key, 'oid_partner=201103171000000000&dt_order=20130515094013'))
        .to eq 'CxHJ+2X2IHoK9lF2ATxxY6fEBm7QqB5ENUe31zkU8llSMZxIsyq7nNw9Ho8MXVoo5pNvPBGT84N2L61872atGTTX1aeTC+7JI753foko+RyPTWK7D9iowFO0ChAVL8j+9Ug9Puvp2Ue3ygy6Ffu2YXzMNX5KH3c6EHyzqU2v7F0='
    end

    specify 'test sign rsa verify' do
      expect(LlPay::Sign::RSA.verify?(RSA_PUB_KEY, 'oid_partner=201103171000000000&dt_order=20130515094013', 'CxHJ+2X2IHoK9lF2ATxxY6fEBm7QqB5ENUe31zkU8llSMZxIsyq7nNw9Ho8MXVoo5pNvPBGT84N2L61872atGTTX1aeTC+7JI753foko+RyPTWK7D9iowFO0ChAVL8j+9Ug9Puvp2Ue3ygy6Ffu2YXzMNX5KH3c6EHyzqU2v7F0='))
        .to eq true
    end
  end
end
