# Modify this class so both flip_switch and the setter method switch= are private methods.

class Machine

  def start
    flip_switch(:on) #removed self prefix
  end

  def stop
    flip_switch(:off) # removed self prefix
  end
  
  def switch_on?
    puts "The lights are #{switch}"
  end
  
  private
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
  
end

lights = Machine.new
lights.start
lights.switch_on? #=> The lights are on
lights.stop
lights.switch_on? #=> The lights are off


