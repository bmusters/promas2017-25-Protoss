:-dynamic 	creating/2,		% the creating predicate, contains the type of the unit and the amount of that unit	
		friendly/3,		% the friendly percept	
		queueSize/1,		% the queueSize percept	
		resources/4,		% the resources percept	
		self/1.			% the self percept

	
% The amountOf percept, counts all the amount of a certain type
amountOf(Type, Amount) :- aggregate_all(count,friendly(Type,_,_), Amount).