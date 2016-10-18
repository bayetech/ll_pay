require 'spec_helper'

describe LlPay::Sign::RSA do
  describe '#sign rsa' do
    specify 'test sign rsa' do
      expect(LlPay::Sign::RSA.sign(LlPay.rsa_pri_key, 'oid_partner=201103171000000000&dt_order=20130515094013'))
        .to eq 'HVstS3RbooGHV/2Thji2liF1sGmIpDhVS2DEP2Pb1toxTW5N2arHoFpCwOlfi8qdwUzV+svK4hnRnGoUXqk7KoOWeFN+IRA/RHT2qS769/nE+U4SkVXrnDFdOphj2alMZYE7enuTOtQfQPnYjDZFEgylQtdlpLGrLBMkqvqlAYk='
    end

    specify 'test sign rsa verify' do
      expect(LlPay::Sign::RSA.verify?(RSA_PUB_KEY, 'oid_partner=201103171000000000&dt_order=20130515094013', 'HVstS3RbooGHV/2Thji2liF1sGmIpDhVS2DEP2Pb1toxTW5N2arHoFpCwOlfi8qdwUzV+svK4hnRnGoUXqk7KoOWeFN+IRA/RHT2qS769/nE+U4SkVXrnDFdOphj2alMZYE7enuTOtQfQPnYjDZFEgylQtdlpLGrLBMkqvqlAYk='))
        .to eq true
    end
  end
end
