module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  attr_reader :name
  
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title
  
  def initialize(name, title)
    super(name)
    @title = title
  end
  
  def gait
    "struts"
  end
  
  def walk
    "#{title} " + super
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
p byron.name
p byron.title