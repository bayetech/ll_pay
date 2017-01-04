require 'json'

module LlPay
  module Service

    SECURITY_PAY_REQUIRED_PARAMS = %w(busi_partner dt_order info_order money_order name_goods no_order notify_url oid_partner risk_item sign_type valid_order)
    def securitypay_pay_json(params, options = {})
      LlPay::Utils.check_required_params(params, SECURITY_PAY_REQUIRED_PARAMS)
      params = LlPay::Utils.stringify_keys(params)
      options = LlPay::Utils.stringify_keys(options)

      params[:sign_type] = params[:sign_type] || options[:sign_type] || LlPay.sign_type
      params[:oid_partner] = params[:oid_partner] || options[:oid_partner] || LlPay.oid_partner

      sign_params = { busi_partner: params[:busi_partner],
                      dt_order: params[:dt_order],
                      money_order: params[:money_order],
                      no_order: params[:no_order],
                      notify_url: params[:notify_url],
                      oid_partner: params[:oid_partner],
                      risk_item: params[:risk_item],
                      sign_type: params[:sign_type],
                      valid_order: params[:valid_order]
                    }

      params[:sign] = LlPay::Sign.generate(sign_params, options)

      params.to_json
    end
  end
end
