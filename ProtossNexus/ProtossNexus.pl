:-dynamic	attacking/2,	% The attacking/2 percept		
		base/4,		% The base/4 percept	
		chokepoint/3,	% The chokepoint/2 percept		
		enemy/7,	% The enemy/7 percept		
		enemyRace/1,	% The enemyRace/1 percept		
		friendly/3, 	% The friendly/3 percept
		firstNexus/1,	% The firstNexus belief that tells the agent if he is the first Nexus		
		map/2,		% The map/2 percept	
		queueSize/1,	% The queueSize/1 percept		
		resources/4,	% The resources/4 percept		
		self/5,		% The self/5 percept	
		status/6.	% The status/6 percept		



% The amountOf percept, counts all the amount of a certain type
amountOf(Type, Amount) :- aggregate_all(count,friendly(Type,ID,_), Amount).