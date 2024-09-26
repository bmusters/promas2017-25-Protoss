:-dynamic 	friendly/3,	
		self/1,		
		resources/4,
		queueSize/1,
		upgraded/1.
	
% The amountOf percept, counts all the amount of a certain type
amountOf(Type, Amount) :- aggregate_all(count,friendly(Type,_,_), Amount).