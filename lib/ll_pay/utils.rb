module LlPay
  module Utils
    def self.stringify_keys(hash)
      new_hash = {}
      hash.each do |key, value|
        new_hash[(key.to_sym rescue key) || key] = value
      end
      new_hash
    end

    def self.check_required_params(params, names)
      params_keys = params.keys.map(&:to_s)
      names.each do |name|
        warn("ll_pay Warn: missing required option: #{name}") unless params_keys.include?(name)
      end
    end
  end
end
