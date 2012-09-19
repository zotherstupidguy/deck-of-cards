require_relative 'deck-of-cards/compare_cards'
require_relative 'deck-of-cards/card'
require_relative 'deck-of-cards/version'

class DeckOfCards
  attr_reader :cards
  
  def initialize
    @cards = []
    suits = %w[Hearts Spades Diamonds Clubs]
    ranks = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    suits.product(ranks) { |suit, rank| @cards << Card.new(rank, suit) }
  end

  def shuffle
    @cards.shuffle!
  end
  
  def cut
    @cards.rotate! @cards.count.div 2
  end
  
  alias split cut
  
  def draw
    @cards.shift
  end
end