class Deck 
  attr_reader :cards 
  def initialize(cards)
    @cards = cards 
     
  end 

  def rank_of_card_at(index)
    @cards[index].rank  
    
    #return rank of card
  end 

  def high_ranking_cards()
    #return array of cards in deck that have rank of 11 or above
    #use select do method 
  end 

  def percent_high_ranking()
    #return percentage of cards that are high ranking
  end 

  def remove_card
    #remove top card from deck
    @cards.shift
  end 

  def add_card(new_card)
    #add one card to end of deck
    @cards << new_card 
  end 
end 
