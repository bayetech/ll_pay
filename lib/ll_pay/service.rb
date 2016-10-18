require 'json'

module LlPay
  module Service

    SECURITY_PAY_REQUIRED_PARAMS = %w(busi_partner dt_order info_order money_order name_goods no_order notify_url oid_partner risk_item sign_type valid_order)
    def securitypay_pay_json(params, options = {})
      # params = LlPay::Utils.stringify_keys(params)
      # options = LlPay::Utils.stringify_keys(options)

      check_required_params(params, SECURITY_PAY_REQUIRED_PARAMS)

      params['sign_type'] = params['sign_type'] || LlPay.sign_type

      params = { 'oid_partner' => LlPay.oid_partner }.merge(params)

      sign_params = { 'busi_partner' => params['busi_partner'],
                      'dt_order' => params['dt_order'],
                      'money_order' => params['money_order'],
                      'no_order' => params['no_order'],
                      'notify_url' => params['notify_url'],
                      'oid_partner' => params['oid_partner'],
                      'risk_item' => params['risk_item'],
                      'sign_type' => params['sign_type'],
                      'valid_order' => params['valid_order']
                    }

      params['sign'] = LlPay::Sign.generate(sign_params)

      params.to_json
    end

    def check_required_params(params, names)
      names.each do |name|
        warn("ll_pay Warn: missing required option: #{name}") unless params.has_key?(name)
      end
    end
  end
end
