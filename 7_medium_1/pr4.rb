=begin
Your task is to write a CircularQueue class that implements a circular queue for 
arbitrary objects. The class should obtain the buffer size with an argument provided
to CircularQueue::new, and should provide the following methods:

- enqueue to add an object to the queue
- dequeue to remove (and return) the oldest object in the queue. 
  It should return nil if the queue is empty.
You may assume that none of the values stored in the queue are nil 
(however, nil may be used to designate empty spots in the buffer).

- Any object that is 'enqueued' will be added to the front of array (Array#unshift)
  - If the array is full, then last element of the array will be deleted (Array#pop)
  
- 'dequeue' will delete last element in array (Array#pop) unless all elements in array are nil
=end

class CircularQueue
  
  def initialize(number_of_elements)
    @array = Array.new(number_of_elements)
    @max_size = number_of_elements
  end
  
  def dequeue
    if array.all?(nil)
      nil
    else
      array.delete_at(last_index_not_nil)
    end
  end
  
  def enqueue(new_element)
    array.unshift(new_element)
    array.pop if array.size > max_size
  end
  
  private
  
  attr_reader :max_size, :array
  
  def last_index_not_nil
    array.rindex do |element|
      element != nil
    end
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1


queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2


queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil