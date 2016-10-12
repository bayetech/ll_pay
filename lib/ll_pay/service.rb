require 'json'

module LlPay
  module Service

    SECURITY_PAY_REQUIRED_PARAMS = %w(notify_url no_order dt_order busi_partner money_order valid_order user_id)
    def self.securitypay_pay_json(params, options = {})
      params[:sign_type] = options[:sign_type] || LlPay.sign_type

      params = { oid_partner: LlPay.oid_partner }.merge(params)

      params[:sign] = LlPay::Sign.generate(params)

      params.to_json
    end

    def self.check_required_params(params, names)
      names.each do |name|
        warn("ll_pay Warn: missing required option: #{name}") unless params.has_key?(name)
      end
    end
  end
end
