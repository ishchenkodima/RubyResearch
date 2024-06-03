require 'rspec'

class ValueReferenceTest
  def modify_string(str)
    str.replace("modified")
  end

  def modify_number(num)
    num += 10
  end
end

RSpec.describe ValueReferenceTest do
  let(:test_class) { ValueReferenceTest.new }

  it 'modifies the original string object' do
    str = "original"
    test_class.modify_string(str)
    expect(str).to eq("modified")
  end

  it 'does not modify the original number' do
    num = 5
    test_class.modify_number(num)
    expect(num).to eq(5)
  end
end
