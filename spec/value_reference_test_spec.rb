require 'rspec'
require 'objspace'
require_relative '../spec_helper'

class ValueReferenceTest
  def create_value_types
    Array.new(100_000) { rand(1..100) }
  end

  def create_reference_types
    Array.new(100_000) { "string_#{rand(1..100)}" }
  end
end

def print_heap_size
  GC.start
  puts "Current heap size: #{ObjectSpace.memsize_of_all / 1024.0} KB"
end

RSpec.describe ValueReferenceTest do
  let(:test_class) { ValueReferenceTest.new }

  it 'creates value types and measures heap size' do
    puts "Before creating value types:"
    print_heap_size

    value_types = test_class.create_value_types
    puts "After creating value types:"
    print_heap_size
  end

  it 'creates reference types and measures heap size' do
    puts "Before creating reference types:"
    print_heap_size

    reference_types = test_class.create_reference_types
    puts "After creating reference types:"
    print_heap_size
  end

  it 'measures heap size before and after garbage collection' do
    puts "Before creating objects:"
    print_heap_size

    objects = test_class.create_reference_types
    puts "After creating objects:"
    print_heap_size

    objects = nil
    GC.start
    puts "After garbage collection:"
    print_heap_size
  end
end
