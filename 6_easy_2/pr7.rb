class Shelter
  attr_accessor :not_yet_adopted_pets
  
  def initialize
    @adoption_list = {}
    @not_yet_adopted_pets = []
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
  
  def print_not_yet_adopted
    puts "The Animal Shelter has the following unadopted pets:"
    not_yet_adopted_pets.each do |current_pet|
      puts "a #{current_pet.animal} named #{current_pet.name}"
    end
    puts ""
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

asta = Pet.new("dog", "Asta")
laddie = Pet.new("dog", "Laddie")
fluffy = Pet.new("cat", "Fluffy")
kat = Pet.new("cat", "Kat")
ben = Pet.new("cat", "Ben")
chatterbox = Pet.new("parakeet", "Chatterbox")
bluebell = Pet.new("parakeet", "Bluebell")

shelter.not_yet_adopted_pets = [asta, laddie, fluffy, kat, ben, chatterbox, bluebell]
shelter.print_not_yet_adopted


=begin
- Instantiating pet object should add 

=end