require 'digest/md5'

module LlPay
  module Sign
    def self.generate(params, options = {})
      sign_type = params[:sign_type]
      md5_key = options[:md5_key] || LlPay.md5_key
      rsa_pub_key = options[:rsa_pub_key] || LlPay.rsa_pub_key
      string = params_to_string(params)

      case sign_type
      when 'MD5'
        MD5.sign(md5_key, string)
      when 'RSA'
        RSA.sign(rsa_pub_key, string)
      else
        raise ArgumentError, "invalid sign_type #{sign_type}, allow value: 'MD5', 'RSA'"
      end
    end

    def self.verify?(params, options = {})
      sign_type = params.delete('sign_type')
      sign = params.delete('sign')
      string = params_to_string(params)

      case sign_type
      when 'MD5'
        md5_key = options[:md5_key] || LlPay.md5_key
        MD5.verify?(md5_key, string, sign)
      when 'RSA'
        rsa_pub_key = LlPay.rsa_pub_key
        RSA.verify?(rsa_pub_key, string, sign)
      else
        false
      end
    end

    def self.params_to_string(params)
      params.sort.map do |k, v|
        "#{k}=#{v}" if v.to_s != '' && k.to_s != 'sign'
      end.compact.join('&')
    end
  end
end
