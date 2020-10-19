=begin
#Further Exploration
=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# Instance variable @name is pointing to a String Object, which is the different from the
# original object local variable 'name' is pointing to.
# The #to_s method being called on local var name within the initialize method
# is a method within the Integer class, the lookup chain of integer class does not
# go into class Pet at all, so the Pet#to_s does not take over