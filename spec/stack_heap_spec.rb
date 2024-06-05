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

def get_heap_size
  GC.start
  ObjectSpace.memsize_of_all
end

RSpec.describe StackHeapTest do
  let(:test_class) { StackHeapTest.new }

  it 'creates a local variable on the stack' do
    initial_heap_size = get_heap_size
    var = test_class.local_variable
    expect((get_heap_size - initial_heap_size).abs).to be < 1000 # Дозволяємо похибку в 1 КБ
    expect(var).to eq("local")
  end

  it 'creates an object on the heap' do
    initial_heap_size = get_heap_size
    var = test_class.heap_object
    expect(get_heap_size).to be > initial_heap_size
    expect(var).to eq("heap")
  end

  it 'measures heap size before and after creating value and reference types' do
    initial_heap_size = get_heap_size

    # Створюємо масив цілих чисел (value types)
    value_types = Array.new(100_000) { rand(1..100) }
    value_types_heap_size = get_heap_size
    expect((value_types_heap_size - initial_heap_size).abs).to be < 1_000_000 # Дозволяємо похибку в 1 МБ

    # Створюємо масив рядків (reference types)
    reference_types = Array.new(100_000) { "string_#{rand(1..100)}" }
    reference_types_heap_size = get_heap_size
    expect(reference_types_heap_size).to be > value_types_heap_size

    # Виконуємо збірку сміття
    reference_types = nil
    GC.start
    after_gc_heap_size = get_heap_size
    expect(after_gc_heap_size).to be < reference_types_heap_size
  end
end



