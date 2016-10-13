require 'spec_helper'

describe LlPay::Utils do
  describe '#test unils' do
    specify 'test unils stringify_keys' do
      expect(LlPay::Utils.stringify_keys({ aa: 1, 'bb' => 2 })).to eq({ aa: 1, bb: 2 })
    end
  end
end
