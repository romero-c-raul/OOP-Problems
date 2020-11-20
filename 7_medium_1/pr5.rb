#Incomplete answer

class Stack
  attr_reader :values
  
  def initialize
    @values = []
  end
end

class Register
  
end

class Minilang
  VALID_COMMANDS = %w[ADD DIV MULT MOD SUB PUSH POP PRINT]
  
  attr_reader :stack, :commands
  attr_accessor :register
  
  def initialize(commands)
    @commands = commands.split
    @stack = Stack.new
    @register = 0
  end
  
  def eval
    commands.each do |token|
      case token
      when 'ADD'    then add
      when 'DIV'    then div
      when 'MULT'   then mult
      when 'MOD'    then mod
      when 'SUB'    then sub
      when 'PUSH'   then push
      when 'POP'    then pop
      when 'PRINT'  then print
      else               self.register = token.to_i
      end
    end
  end
  
  def push
    stack.values << register
  end
  
  def add
    self.register += stack.values.pop
  end
  
  def sub
    self.register -= stack.values.pop
  end
  
  def mult
    self.register *= stack.values.pop
  end
  
  def div
    self.register /= stack.values.pop
  end
  
  def mod
    self.register %= stack.values.pop
  end
  
  def pop
    self.register = stack.values.pop
  end
  
  def print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)