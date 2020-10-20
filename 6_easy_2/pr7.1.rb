class Shelter
  def initialize
    @adoption_list = {}
  end
  
  def adopt(owner, pet)
    owner.pets << pet
    if @adoption_list.keys.include?(owner.name)
      @adoption_list[owner.name] << pet
    else
      @adoption_list[owner.name] = [pet]
    end
  end
  
  def print_adoptions
    @adoption_list.each do |owner, pet_collection|
      puts "#{owner} has adopted the following pets:"
      pet_collection.each do |current_pet|
        puts "a #{current_pet.animal} named #{current_pet.name}"
      end
      puts ""
    end
  end
  
end

class Owner
  attr_accessor :pets, :name
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
  def number_of_pets
    self.pets.size
  end
end

class Pet
  attr_accessor :animal, :name
  
  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."