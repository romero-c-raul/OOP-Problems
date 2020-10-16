class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting

#The last line returns the string in line 3, this is because calling method #class
# on the object returns Cat (this is the class). Then we call instance method 
# generic_greeting on class Cat, which is equivalent to what we did on line 7. 