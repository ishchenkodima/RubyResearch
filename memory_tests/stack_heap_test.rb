require 'rspec'
require 'objspace'

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

def print_heap_size
  GC.start
  puts "Current heap size: #{ObjectSpace.memsize_of_all / 1024.0} KB"
end

RSpec.describe StackHeapTest do
  let(:test_class) { StackHeapTest.new }

  it 'creates a local variable on the stack' do
    print_heap_size
    var = test_class.local_variable
    print_heap_size
    expect(var).to eq("local")
  end

  it 'creates an object on the heap' do
    print_heap_size
    var = test_class.heap_object
    print_heap_size
    expect(var).to eq("heap")
  end

  it 'measures heap size before and after creating value and reference types' do
    puts "Before creating objects:"
    print_heap_size

    # Створюємо масив цілих чисел (value types)
    value_types = Array.new(100_000) { rand(1..100) }
    puts "After creating value types:"
    print_heap_size

    # Створюємо масив рядків (reference types)
    reference_types = Array.new(100_000) { "string_#{rand(1..100)}" }
    puts "After creating reference types:"
    print_heap_size

    # Виконуємо збірку сміття
    GC.start
    puts "After garbage collection:"
    print_heap_size
  end
end
