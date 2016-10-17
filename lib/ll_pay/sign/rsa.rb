require 'openssl'
require 'base64'

module LlPay
  module Sign
    class RSA
      def self.sign(prikey, string)
        rsa = OpenSSL::PKey::RSA.new(prikey)
        Base64.strict_encode64(rsa.sign('sha1', string))
      end

      def self.verify?(string, sign)
        public_key = OpenSSL::PKey::RSA.new File.read(File.expand_path('./llpay_public_key.pem', __dir__))
        public_key.verify('sha1', Base64.strict_decode64(sign), string)
      end
    end
  end
end
