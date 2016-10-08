require 'spec_helper'

describe LlPay::Sign::MD5 do
  describe '#sign md5' do
    specify 'test sign md5 success' do
      expect(LlPay::Sign::MD5.sign(LlPay.md5_key, 'oid_partner=201103171000000000&dt_order=20130515094013'))
        .to eq '17631bd898c4221afb620ea95562827d'
    end

    specify 'test sign md5 verify' do
      expect(LlPay::Sign::MD5.verify?(LlPay.md5_key, 'oid_partner=201103171000000000&dt_order=20130515094013', '17631bd898c4221afb620ea95562827d'))
        .to eq true
    end

    specify 'test sign md5 error' do
      expect(LlPay::Sign::MD5.sign(LlPay.md5_key, 'oid_partner=201103171000000000&dt_order=20130515094013'))
        .not_to eq '17631bd898c4221afb620ea95562827d=='
    end
  end
end
