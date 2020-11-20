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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
