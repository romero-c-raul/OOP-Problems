=begin

Using the following code, create a class named Cat that tracks the number of times a 
new Cat object is instantiated. The total number of Cat instances should be printed 
when ::total is invoked.

=end

class Cat
  @@total_cats = 0
  
  def initialize
    @@total_cats += 1
  end
  
  def self.total
    @@total_cats
  end
  
end

p Cat.total
kitty1 = Cat.new
p Cat.total
kitty2 = Cat.new
p Cat.total #=> 2