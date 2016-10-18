module LlPay
  module Notify
    def notify_verify?(params, options = {})
      params = LlPay::Utils.stringify_keys(params)
      options = LlPay::Utils.stringify_keys(options)

      oid_partner = options[:oid_partner] || LlPay.oid_partner
      LlPay::Sign.verify?(params, options) && oid_partner == params[:oid_partner]
    end
  end
end
