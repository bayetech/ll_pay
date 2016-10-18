require 'openssl'
require 'base64'

module LlPay
  module Sign
    class RSA
      def self.sign(prikey, string)
        rsa = OpenSSL::PKey::RSA.new(prikey)
        Base64.strict_encode64(rsa.sign('md5', string.force_encoding('utf-8')))
      end

      def self.verify?(pubkey, string, sign)
        rsa = OpenSSL::PKey::RSA.new(pubkey)
        rsa.verify('md5', Base64.strict_decode64(sign), string.force_encoding('utf-8'))
      end
    end
  end
end
