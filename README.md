# RubyResearch

This project demonstrates memory management concepts in Ruby including value types, reference types, stack and heap allocation, and garbage collection.

## Concepts

- **Value Types**: In Ruby, primitive data types like integers are value types. When assigned to another variable, a copy is made.
- **Reference Types**: Objects like arrays are reference types. When assigned to another variable, both variables reference the same object.
- **Stack and Heap**: Primitive data types are usually stored on the stack, while objects are stored on the heap.
- **Garbage Collection**: Ruby has a built-in garbage collector that automatically frees memory that is no longer in use.

## Running Tests

To run the tests, use the following commands:

```bash
docker-compose build
docker-compose run ruby_tests
