require 'digest/md5'

module LlPay
  module Sign
    def self.generate(params, options = {})
      params = LlPay::Utils.stringify_keys(params)
      options = LlPay::Utils.stringify_keys(options)

      sign_type = params[:sign_type]
      md5_key = options[:md5_key] || LlPay.md5_key
      rsa_pri_key = options[:rsa_pri_key] || LlPay.rsa_pri_key
      params[:oid_partner] = LlPay.oid_partner
      string = params_to_string(params)

      case sign_type
      when 'MD5'
        MD5.sign(md5_key, string)
      when 'RSA'
        RSA.sign(rsa_pri_key, string)
      else
        raise ArgumentError, "invalid sign_type #{sign_type}, allow value: 'MD5', 'RSA'"
      end
    end

    def self.verify?(params, options = {})
      params = LlPay::Utils.stringify_keys(params)
      options = LlPay::Utils.stringify_keys(options)

      sign_type = params[:sign_type]
      sign = params.delete(:sign)
      string = params_to_string(params)

      case sign_type
      when 'MD5'
        md5_key = options[:md5_key] || LlPay.md5_key
        MD5.verify?(md5_key, string, sign)
      when 'RSA'
        RSA.verify?(options[:rsa_pub_key] || LlPay::YT_PUB_KEY, string, sign)
      else
        false
      end
    end

    def self.params_to_string(params)
      params_string = params.sort.map do |k, v|
        "#{k}=#{v}" if v.to_s != '' && k.to_s != 'sign'
      end.compact.join('&')

      params_string[0] = '' if params_string[0] == '&'

      params_string
    end
  end
end
