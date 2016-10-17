module LlPay
  module Notify
    def self.verify?(params, options = {})
      sign_params = {
        'oid_partner' => params['oid_partner'],
        'sign_type'   => params['sign_type'],
        'dt_order' => params['dt_order'],
        'no_order' => params['no_order'],
        'oid_paybill' => params['oid_paybill'],
        'money_order' => params['money_order'],
        'result_pay' => params['result_pay'],
        'bank_code' => params['bank_code']
      }

      llpay_public_key.pem
      public_key = OpenSSL::PKey::RSA.new(File.read("./llpay_public_key.pem"))

      LlPay::Sign.verify?(params, options) && LlPay.oid_partner == params[:oid_partner]
    end
  end
end
