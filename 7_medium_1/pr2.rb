=begin
A fixed-length array is an array that always has a fixed number of elements. 
Write a class that implements a fixed-length array, and provides the necessary 
methods to support the following code:
=end

class FixedArray
  attr_accessor :array
  
  def initialize(number_of_elements)
    @array = Array.new(number_of_elements)
  end
  
  def [](index)
    array.fetch(index)
  end
  
  def []=(index, object)
    self[index]
    array[index] = object
  end
  
  def to_a
    array.clone # To prevent any modification to the object's state
  end
  
  def to_s
    array.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end


# The above code should output true 16 times.

=begin
- Create FixedArray class with the following methods
  - [], []=
    - These methods allow us to return or re-assign a value within the fixed array
  - to_a
    - Returns the fixed array
  - to_s
    - Returns the array as a string
=end