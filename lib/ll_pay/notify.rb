module LlPay
  module Notify
    def self.verify?(params, options = {})
      Sign.verify?(params, options) && LlPay.oid_partner == params[:oid_partner]
    end
  end
end
