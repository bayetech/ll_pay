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

      http_response = HTTP.post('https://yintong.com.cn/traderapi/refund.htm', json: params)
      response_hash = JSON.parse(http_response.body.to_s)

      if http_response.code == 200
        if response_hash['ret_code'] == 0000 && LlPay::Sign.verify?(response_hash)
          return response_hash
        else
          return response_hash
        end
      else
        return
      end
    end
  end
end
