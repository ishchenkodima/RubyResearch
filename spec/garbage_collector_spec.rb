require 'rspec'

class GarbageCollectorTest
  attr_accessor :object

  def create_object
    @object = "I am alive!"
  end

  def destroy_object
    @object = nil
    GC.start
  end

  def object_alive?
    !@object.nil?
  end
end

RSpec.describe GarbageCollectorTest do
  let(:test_class) { GarbageCollectorTest.new }

  it 'creates and destroys an object' do
    test_class.create_object
    expect(test_class.object_alive?).to be true

    test_class.destroy_object
    expect(test_class.object_alive?).to be false
  end
end
