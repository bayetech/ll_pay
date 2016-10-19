module LlPay
  module RefundOrder
    def refund_order(params)
      params = LlPay::Utils.stringify_keys(params)

      params[:sign_type] = params[:sign_type] || LlPay.sign_type
      params[:oid_partner] = LlPay.oid_partner

      sign_params = { 'oid_partner' => params[:oid_partner],
                      'sign_type' => params[:sign_type],
                      'no_refund' => params[:no_refund],
                      'dt_refund' => params[:dt_refund],
                      'money_refund' => params[:money_refund],
                      'no_order' => params[:no_order],
                      'dt_order' => params[:dt_order],
                      'oid_paybill' => params[:oid_paybill],
                      'notify_url' => params[:notify_url]
                    }

      params[:sign] = LlPay::Sign.generate(sign_params)

      request(:post, 'traderapi/refund.htm', params)
    end
  end
end
