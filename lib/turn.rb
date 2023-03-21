class Turn
  attr_reader :player1, :player2, :spoils_of_war
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end 

  def type 
    #BASIC - rank of card [0] are not the same rank
    #WAR - turn occurs when both players rank of card [0]
      #are the same
    #MUTUALLY ASSURED DESTRUCTION - both players rankofcard[0] and
        #rankofcard[2] are the same
  
  end 


  def winner #determine winner of turn
    #if turn is :basic 
      #return whichever player has higher rankofcard[0]
    #if turn is :war 
      #return whichever player has higher rankofcard[2]
    #if turn is MAD 
      #return no winner
  end 

  def pile_cards #when called cards sent from players deck to @spoilsofwar
    #:basic turn >> top card to spoils pile 
    #:war turn >> top 3 cards to spoils pile
    #:MAD turn >> remove top 3 cards THESE DON'T GO TO SPOILS
  end 

  def award_spoils 
    #add each card in @spoils_of_war to winner of turn
  end 