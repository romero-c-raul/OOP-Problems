# First attempt

class Card
  CARD_VALUES = { 2 => 2, 3=> 3, 4=> 4, 5=> 5, 6=> 6, 7=> 7,
                  8=> 8, 9=> 9, 10=> 10, 'Jack' => 11,
                  'Queen' => 12, 'King' => 13, 'Ace' => 14
  }  
  
  include Comparable
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def <=>(other_card)
    CARD_VALUES[rank] <=> CARD_VALUES[other_card.rank]
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    @cards = create_cards
  end
  
  def draw
    reset_deck if cards.empty?
    cards.pop
  end
  
  private
  
  attr_reader :cards
  
  def create_cards
    SUITS.map do |current_suit|
      RANKS.map do |current_rank|
        Card.new(current_rank, current_suit)
      end
    end.flatten.shuffle
  end
  
  def reset_deck
    @cards = create_cards
  end
  
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  attr_reader :deck, :hand
  
  def initialize(cards)
    #@deck = deck
    @hand = cards
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def print
    puts @hand
  end
  
  private

  def royal_flush?
    suits = obtain_suits
    ranks = obtain_ranks
    
    if suits.uniq.size == 1
      return true if ranks.sort == ['10', 'Jack', 'Queen', 'King', 'Ace'].sort
    else
      false
    end
    
    false
  end

  def straight_flush?
    suits = obtain_suits
    ranks = obtain_ranks_values
    
    if suits.uniq.size == 1
      return true if ranks.sort.each_cons(2).all? { |x,y| y == x + 1 }
    else
      false
    end
    
    false
  end

  def four_of_a_kind?
    ranks = obtain_ranks_values
    
    ranks.any? do |current_rank|
      ranks.count(current_rank) == 4
    end
    
  end

  def full_house?
    ranks = obtain_ranks_values
    
    three_cards = ranks.any? do |current_rank|
      ranks.count(current_rank) == 3
    end
    
    two_cards = ranks.any? do |current_rank|
      ranks.count(current_rank) == 2
    end
    
    three_cards && two_cards
  end

  def flush?
    suits = obtain_suits
    
    suits.uniq.size == 1
  end

  def straight?
    ranks = obtain_ranks_values
    
    ranks.sort.each_cons(2).all? { |x,y| y == x + 1 }
  end

  def three_of_a_kind?
    ranks = obtain_ranks_values
    
    ranks.any? do |current_rank|
      ranks.count(current_rank) == 3
    end
  end

  def two_pair?
    obtain_ranks_values.uniq.size == 3
  end

  def pair?
    ranks = obtain_ranks_values
    
    ranks.any? do |current_rank|
      ranks.count(current_rank) == 2
    end
  end
  
  def create_hand
    # hand = []
    # 5.times { |_| hand << deck.draw }
    # hand
  end
  
  def obtain_suits
    hand.map do |current_card|
      current_card.suit
    end
  end
  
  def obtain_ranks
    hand.map do |current_card|
      current_card.rank.to_s
    end
  end
  
  def obtain_ranks_values
    hand.map do |current_card|
      Card::CARD_VALUES[current_card.rank]
    end
  end
  
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'