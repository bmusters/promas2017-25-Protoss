:-dynamic 	attack/1,		% The attack goal	
		attack/2,		% The attack/2 goal	
		attacking/1,		% The attacking believe	
		attacking/2,		% The attacking percept	
		chokepoint/3,		% The chokepoint/3 percept
		constructionSite/3,	% The construcion site percept		
		enemy/7,		% The enemy percept	
		enemyBase/2,		% The enemy base percept	
		enemyRace/1,		% The enemy race percept	
		entered/1,		% The entered believe, to keep track of walking around the enemyBase	
		friendly/3,		% the friendly/3 percept, detects friendly units	
		goTo/2,			% The goTo goal
		guarding/2,		% The guarding believe
		move/0,			% The order to go and move
		orderToAttack/0,	% The order to attack believe		
		ownBase/3,		% The own base predicate, contains the location and the region id of the own base	
		patrol/2,
		resources/4,		% resources percept	
		self/1,			% our own ID from the self/5 percept	
		self/5,			% the self/5 percept
		status/6,		% The status percept	
		status/6.	
					
					
		
groundUnits([
	% Terran
	"Terran SCV",
	"Terran Marine",
	"Terran Firebat",
	"Terran Medic",
	"Terran Ghost",
	"Terran Vulture",
	"Terran Siege Tank",
	"Terran Goliath",
	
	% Zerg
	"Zerg Larva",
	"Zerg Drone",
	"Zerg Zergling",
	"Zerg Hydralisk",
	"Zerg Lurker",
	"Zerg Ultralisk",
	"Zerg Infest Terran",
	"Zerg Broodling",
	
	% Protoss
	"Protoss Probe", 
	"Protoss Zealot",
	"Protoss Dragoon",
	"Protoss High Templar",
	"Protoss Dark Templar",
	"Protoss Reaver",
	"Protoss Archon",
	"Protoss Dark Archon"	
	]).
	
airUnits([
	% Terran
	"Terran Wraith",
	"Terran Dropship",
	"Terran Science Vessel",
	"Terran Battlecruiser",
	"Terran Valkyrie",
	
	% Zerg
	"Zerg Overlord",
	"Zerg Mutalisk",
	"Zerg Scourge",
	"Zerg Queen",
	"Zerg Guardian",
	"Zerg Devourer",
	
	% Protoss
	"Protoss Observer",
	"Protoss Shuttle",
	"Protoss Scout",
	"Protoss Carrier",
	"Protoss Arbiter",
	"Protoss Corsair"
	]).
	
	
memberOfGroundUnits(Type):-
		member(Type, groundUnits).
		
memberOfAirUnits(Type):-
		member(Type, airUnits).
	
%BEGIN closest something finder
	%end extra feature
	   
	  closest('chokepoint',SelfX,SelfY,Xout,Yout) :-
	    findall((X,Y,Dist),(
	                       chokepoint(X,Y,_), % change here if you want another belief
	                       Dist is (X-SelfX)^2 + (Y-SelfY)^2 %the square root isn't necessary, because we are looking for the smallest
	                       ),L),
	    L = [FirstTriplet|T],
		smallest(T, FirstTriplet,Xout,Yout).
	
	smallest([],(X,Y,_),X,Y) :- !.
	smallest([(X,Y,Dist)|T],(_,_,CurrentSmallestDist),Xout,Yout) :-
	    Dist < CurrentSmallestDist,
	    smallest(T,(X,Y,Dist),Xout,Yout),!.
	smallest([_|T],CurrentSmallestTriplet,Xout,Yout) :-
	    smallest(T,CurrentSmallestTriplet,Xout,Yout),!.
	
%I could add a sort method here that gives a list with the closest points in the front
%END closest something finder

difference(X,Y,A,B,M):-
	abs(X-A) < M,
	abs(Y-B) < M.
	

checkMap(X,Y, map(A, B), M, N):-
	((X > A; 0 > X), M is A), 
	(A > X, X > 0, M is X),
	((Y > B; 0 > Y), N is B),
	(B > Y, Y > 0, N is Y). 

