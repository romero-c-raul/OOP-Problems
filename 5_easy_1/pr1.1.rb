=begin
#Further Exploration

Modify this class so new will optionally let you specify a fixed banner width at 
the time the Banner object is created. The message in the banner should be centered 
within the banner of that width. Decide for yourself how you want to handle widths 
that are either too narrow or too wide.

ALGORITHM
- Add the width option to the initialize method
- Create a writer and getter methods for the width
- Create a rule_width method

=end

class Banner
  
  def initialize(message, width="standard")
    @message = message
    @width = width
  end
  
  def to_s
    [horizontal_rule, empty_line, message_line, 
     empty_line, horizontal_rule].join("\n")
  end
  
  private
  
  attr_accessor :width, :message
  
  def horizontal_rule
    "+-" + ('-' * rule_width) + "-+"
  end
  
  def empty_line
    "| " + (" " * rule_width) + " |"
  end
  
  def message_line
    "| " + message.center(rule_width) + " |"
  end
  
  def rule_width
    unless width.class == Integer
      message.length
    else
      self.width = 80 if width > 80
      message.length > width ? message.length : width
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 10000000)
puts banner

banner = Banner.new('', 20)
puts banner