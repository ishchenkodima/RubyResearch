require 'rspec'

class StackHeapTest
  def local_variable
    var = "local"
    var
  end

  def heap_object
    var = String.new("heap")
    var
  end
end

RSpec.describe StackHeapTest do
  let(:test_class) { StackHeapTest.new }

  it 'creates a local variable on the stack' do
    var = test_class.local_variable
    expect(var).to eq("local")
  end

  it 'creates an object on the heap' do
    var = test_class.heap_object
    expect(var).to eq("heap")
  end
end
