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
      names.each do |name|
        warn("ll_pay Warn: missing required option: #{name}") unless params.has_key?(name)
      end
    end
  end
end
