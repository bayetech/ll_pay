require 'spec_helper'

describe LlPay::Sign::RSA do
  describe '#sign rsa' do
    specify 'test sign rsa verify' do
      # expect(LlPay::Sign::RSA.sign(LlPay.rsa_pri_key, 'oid_partner=201103171000000000&dt_order=20130515094013'))
      #   .to eq '17631bd898c4221afb620ea95562827d'
    end
  end
end
