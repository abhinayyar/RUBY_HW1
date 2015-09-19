class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
	
	if player1[1] !="S" and player1[1] !="P" and player1[1] !="R"
		raise NoSuchStrategyError, "Strategy must be one of R,P,S"
	end
	
	if player2[1] !="S" and player2[1] != "P" and player2[1] !="R"	
		raise NoSuchStrategyError, "Strategy must be one of R,P,S"
	end

	if(player1[1]==player2[1])
		return player1
	end
	if player1[1]=="P" and player2[1]=="S" 
		return player2
	end
	if player1[1]=="P" and player2[1]=="R"
		return player1
	end
	if player1[1]=="R" and player2[1]=="S"
		return player1
	end
	if player1[1]=="R" and player2[1]=="P"
		return player2
	end
	if player1[1]=="S" and player2[1]=="R"
		return player2
	end
	if player1[1]=="S" and player2[1]=="P"
		return player1
	end
	
  end

  def self.tournament_winner(tournament)

	base_case=false
	tournament.each do|i|
		i.each do |x|
			if x=="P" or x=="R" or x=="S"
				base_case=true
			end
		end
	end
	if(base_case == true)
		winner=self.winner(tournament[0],tournament[1])
		return winner
	end
	value = []
	tournament.each do |i|
		i.each do |x|
		player1 = x[0]
		player2= x[1]
		winner1=self.winner(player1,player2)
		value.push(winner1)
		end
	end
	winner1=self.winner(value[0],value[1])
	winner2=self.winner(value[2],value[3])
	final_winner=self.winner(winner1,winner2)
	return final_winner
  end

end

r=[ "Arma","P" ]
p=[ "Dave" , "S" ]
#s=[ "Mark", "R" ]

#RockPaperScissors.winner(r,s)
tourney = [
        [
          [ ["Armando", "P"], ["Dave", "S"] ],
          [ ["Richard", "R"], ["Michael", "S"] ]
        ],
        [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
      ]
#RockPaperScissors.tournament_winner(tourney)
#RockPaperScissors.tournament_winner([["Armando","P"],["Dave","S"]])
