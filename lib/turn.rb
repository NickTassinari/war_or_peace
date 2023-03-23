class Turn
  attr_reader :player1, :player2, :spoils_of_war
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner 
  end 

  def type 
    #BASIC - rank of card [0] are not the same rank
    #WAR - turn occurs when both players rank of card [0]
      #are the same
    #MUTUALLY ASSURED DESTRUCTION - both players rankofcard[0] and
        #rankofcard[2] are the same
    if @player1.deck.cards.length > 2 && player2.deck.cards.length > 2 
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
        player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        :war 

      else 
        :basic 
      end
    end 


  def winner #determine winner of turn
    #if turn is :basic 
      #return whichever player has higher rankofcard[0]
    if type == :basic 
      @winner = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war 
      #if turn is :war 
      #return whichever player has higher rankofcard[2]
        @winner = player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    else 
      return "No Winner"
        #if turn is MAD 
      #return no winner
    end
  end 

  def pile_cards #when called cards sent from players deck to @spoilsofwar
    if type == :basic 
    #turn >> top card to spoils pile 
      pile_basic
    elsif type == :war 
    #turn >> top 3 cards to spoils pile
      pile_war
    elsif type == :mutually_assured_destruction 
    #turn >> remove top 3 cards THESE DON'T GO TO SPOILS
      pile_mutually_assured_destruction
    elsif type == :draw
      pile_draw 
    else 
      puts "Oops looks like you don't know how to play war!"
    end 
  end

  def pile_basic 
    #basic turn, each player sends one card to spoils pile
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end

  def pile_war 
    #each player sends 3 cards to spoils
    3.times {@spoils_of_war << @player1.deck.remove_card}
    3.times {@spoils_of_war << @player1.deck.remove_card}
  end

  def pile_mutually_assured_destruction
    #each player removes 3 cards and they are removed from game
    3.times {@player1.deck.remove_card}
    3.times {@player2.deck.remove_card}
  end

  def pile_draw
    @player1.deck.cards.rotate
    @player2.deck.cards.rotate 
  end


  def award_spoils 
    @spoils_of_war.each {|spoils| @winner.deck.add_card(spoils)}
    #add each card in @spoils_of_war to winner of turn
  end 
end 

