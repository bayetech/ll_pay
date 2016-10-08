module LlPay
  module Notify
    def self.verify?(params, options = {})
      Sign.verify?(params, options)
    end
  end
end
