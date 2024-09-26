:-dynamic 	attack/1,		% The attack goal	
		attacking/0,		% The attacking/0 believe
		attacking/2,		% The attacking percept	
		attackOwnTactic/1,	% indicates if own tactic is attacked
		base/4,			% The base percept
		building/3, 		% action to start building buildings
		buildingNexus/3,	% The building goal for the nexus
		constructionSite/3,	% the constructionSite/3 percept, used for where buildings can be build		
		enemy/7,		% The enemy percept	
		enemyBase/2, 		% The enemy base predicate, contains the coordinates of the enemy base	
		enemyRace/1,		% The enemyRace percept	
		entered/1,		% The entered believe
		friendly/3,		% the friendly/3 percept, detects friendly units
		firstNexus/1,		% the firstNexus belief	
		gathered/1,		% used as a goal to gather mineralFields	
		goTo/2,			% The goTo goal
		goToBase/2,		% The goToBase goal
		goToEnemy/0,		% The goToEnemy believe	
		map/2,			% The map percept
		mapMiddle/2,
		mineralField/5, 	% mineralField IDs and amounts from the mineralField/5 percept		
		ownBase/3,		% The own base predicate, contains the coordinates of the own base and the region id	
		possibleBase/3,		% The possible base believe	
		regionID/1,		% The region id percept	
		resources/4,		% resources percept	
		retreating/0,		% The retreating believe	
		scout/1,		% The believe that a probe is a scout	
		scout2/1,		% The believe that a probe is the second scout (Only for the big map)	
		self/1,		% our own ID from the self/5 percept	
		self/5,			% the self/5 percept
		status/6,		% The status percept	
		tryBuilding/3,		% The try building predicate that helps us with building	
		vespeneGeyser/5, 	% the vespeneGeyser/5 percept, used for where Assimilators can be build		
		workerActivity/1,	% our own activity state from the workerActivity/1 percept		
		wrongBase/2.		% The believe that a base is not the enemy base	
					
difference(X,Y,A,B,M):-
	abs(X-A) < M,
	abs(Y-B) < M.
