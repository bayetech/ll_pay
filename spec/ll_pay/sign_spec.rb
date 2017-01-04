require 'spec_helper'

describe LlPay::Sign do
  describe '#sign rsa generate' do
    specify 'test sign generate rsa' do
      expect(LlPay::Sign.generate({ sign_type: 'RSA', oid_partner: '201103171000000000', dt_order: '20130515094013' }))
        .to eq 'gDPdKXfrgy9oIpWDyGGjdUoIi7iiDKrjAAk4W3UT2m27xwnqbkWEVUK/wXsKTZh7a6WUGtEKKgTLGQ9VSF5NjsdXlqx4aOZ8a4cWhqOHXsYCvokxRwdD0/Q8NJ7uw34E3+HSzNOwqjCKC6P4sLepeBaOnMa8Gs/2l4vf1tIaMoA='
    end

    specify 'test sign generate md5' do
      expect(LlPay::Sign.generate({ sign_type: 'MD5', oid_partner: '201103171000000000', dt_order: '20130515094013' }))
        .to eq '2839663fe85c3195ac205fcf6648c905'
    end

    specify 'test sign generate none' do
      expect { LlPay::Sign.generate({ sign_type: 'none', oid_partner: '201103171000000000', dt_order: '20130515094013' }) }
        .to raise_error("invalid sign_type none, allow value: 'MD5', 'RSA'")
    end
  end

  describe '#sign sign verify' do
    specify 'test sign verify rsa' do
      expect(LlPay::Sign.verify?({ sign_type: 'RSA', oid_partner: '201103171000000000', dt_order: '20130515094013', sign: 'gDPdKXfrgy9oIpWDyGGjdUoIi7iiDKrjAAk4W3UT2m27xwnqbkWEVUK/wXsKTZh7a6WUGtEKKgTLGQ9VSF5NjsdXlqx4aOZ8a4cWhqOHXsYCvokxRwdD0/Q8NJ7uw34E3+HSzNOwqjCKC6P4sLepeBaOnMa8Gs/2l4vf1tIaMoA=' }))
        .to eq true
    end

    specify 'test sign verify md5' do
      expect(LlPay::Sign.verify?({ sign_type: 'MD5', oid_partner: '201103171000000000', dt_order: '20130515094013', sign: '2839663fe85c3195ac205fcf6648c905' }))
        .to eq true
    end

    specify 'test sign verify none' do
      expect(LlPay::Sign.verify?({ sign_type: 'none', oid_partner: '201103171000000000', dt_order: '20130515094013', sign: '2839663fe85c3195ac205fcf6648c905' }))
        .to eq false
    end
  end
end
