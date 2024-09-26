:-dynamic 	creating/2,	% the creating predicate, contains the type of the unit and the amount of that unit
		friendly/3,	% The friendly percept	
		queueSize/1,	% The queueSize percept	
		resources/4,	% The resources percept		
		self/1,		% The self percept	
		train/1.	% The train action		

% The amountOf percept, counts all the amount of a certain type.
amountOf(Type, Amount) :- aggregate_all(count,friendly(Type,_,_), Amount).