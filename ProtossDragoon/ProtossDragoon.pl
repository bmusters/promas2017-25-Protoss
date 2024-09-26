:-dynamic	attack/1,		% the attack/1 predicate for attacking an id	
		attack/2,		% the attack/2 predicate for attacknig a location	
		attacking/1,		% the attacking goal	
		attacking/2,		% the attacking/2 percept	
		enemy/7,		% the enemy percept	
		enemyBase/2,		% the enemy base predicate, contains the coordinates of the enemy base	
		enemyRace/1,		% the enemy race percept	
		entered/1,		% the entered/1 believe, the index for the scout	
		friendly/3,		% the friendly/3 percept, detects friendly units	
		goTo/2,			% the goTo goal
		guarding/2,
		move/0,
		orderToAttack/0,	% our own predicate, to indicate when a unit could attack		
		ownBase/3,		% the ownBase/3 predicate, contains our base info	
		patrol/2,
		resources/4,		% resources percept	
		self/1,	% our own ID from the self/5 percept		
		self/5,			% the self/5 percept
		status/6.		% the status percept

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
		
difference(X,Y,A,B,M):-
	abs(X-A) < M,
	abs(Y-B) < M.
	

checkMap(X,Y, map(A, B), M, N):-
	((X > A; 0 > X), M is A), 
	(A > X, X > 0, M is X),
	((Y > B; 0 > Y), N is B),
	(B > Y, Y > 0, N is Y). 
		