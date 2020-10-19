=begin
Complete this class so that the test cases shown below work as intended. 
You are free to add any methods or instance variables you need. 

However, do not make the implementation details public.

PROBLEM
- Output: Banner

rules
    - Explicit rules
      - Complete class so that test cases shown work as intended:
        - Length: 5 Characters (+, |, |, |, +)
        - Width: Length of message_line plus two empty spaces, plus two pipes
        
      - Horizontal rule:
        - "+" + "-"*(message length + 2)
      - Empty line:
        - "|" + " "*(message length + 2)
      - Message line:
        - Message line
        

=end

class Banner
  def initialize(message)
    @message = message
  end
  
  def to_s
    [horizontal_rule, empty_line, message_line, 
     empty_line, horizontal_rule].join("\n")
  end
  
  private
  
  def horizontal_rule
    "+" + ('-' * (@message.length + 2)) + "+"
  end
  
  def empty_line
    "|" + (" " * (@message.length + 2)) + "|"
  end
  
  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner