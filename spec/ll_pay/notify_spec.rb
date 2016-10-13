require 'spec_helper'

describe LlPay::Notify do
  describe '#test notify' do
    specify 'test notify verify rsa' do
      expect(LlPay::Sign.verify?({ sign_type: 'RSA', oid_partner: '201103171000000000', dt_order: '20130515094013', sign: 'gN4RdsOHfpsXzM2ylEy75R72ohrVjx50HLpQrBzti+VgTKnDrzOsS7l344hA4vkCKL7qrlSTva5LeN9WqxKkg+aS15IUbR+AzWo3+Is3QYgNQISkroKWK7skLMTQvlEvzi48azKV9VPXWtWokV4yVJpGwyjJUKgtYqTCphQ6fmc=' }, { rsa_pub_key: RSA_PUB_KEY }))
        .to eq true
    end

    specify 'test notify verify md5' do
      expect(LlPay::Sign.verify?({ sign_type: 'MD5', oid_partner: '201103171000000000', dt_order: '20130515094013', sign: '2839663fe85c3195ac205fcf6648c905' }, { rsa_pub_key: RSA_PUB_KEY }))
        .to eq true
    end
  end
end
