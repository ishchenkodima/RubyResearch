require 'rspec'
require 'objspace'
require_relative '../spec_helper'

class GarbageCollectorTest
  def create_objects
    Array.new(100_000) { "string_#{rand(1..100)}" }
  end
end

def print_heap_size
  GC.start
  puts "Current heap size: #{ObjectSpace.memsize_of_all / 1024.0} KB"
end

RSpec.describe GarbageCollectorTest do
  let(:test_class) { GarbageCollectorTest.new }

  it 'creates and collects objects' do
    puts "Before creating objects:"
    print_heap_size

    objects = test_class.create_objects
    puts "After creating objects:"
    print_heap_size

    objects = nil
    GC.start
    puts "After garbage collection:"
    print_heap_size
  end
end
