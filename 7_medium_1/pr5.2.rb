#Further Exploration 1

require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT) #Set creates array with no duplicates
  
  def initialize(program)
    @program = program
  end
  
  def eval(parameter)
    @stack = []
    @register = 0
    format(@program, parameter).split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end
  
  private
  
  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase) # This is what executes our methods
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end
  
  def push
    @stack.push(@register)
  end
  
  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end
  
  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

AREA_OF_RECTANGLE =
  '%<base>d PUSH %<height>d PUSH MULT PRINT'
minilang = Minilang.new(AREA_OF_RECTANGLE)
minilang.eval(base: 5, height: 5)
# 25
