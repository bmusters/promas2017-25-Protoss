:- dynamic 	agent/3,		% the agent/3 percept			
		allIn/0,		% the allIn predicate,if we believe this, then spam the zealots to move to the enemybase 	
		attacking/2,		% the attacking/2 percept	
		base/4,			% the base/4 percept
		builded/2, 		% the builded/2 percept, indicates if the building has been built	
		building/2,		% the building/2 percept, indicates if a building is under construction
		buildedAssim/0,
		chokepoint/3,		% the chokepoint/3 percept	
		closestChokepoint/2, 	% the closeschokepoint/2 percept, shows us the nearest chokepoint
		constructionSite/3,	% the construction/3 percept		
		counterBase/1,		% the counterBase predicate, used to to send a second scouter if we are on the big map	
		counterGas/1,		% the counterGas predicate, indicates how many gas collectors we have	
		doingCounterOwnTactic/0,% indicates if counter own tactic is executed.
		dragoonId/1,		% the id of a Dragoon	
		enemy/7,		% the enemy/7 percept	
		enemyBase/2,		% the enemy base predicate, has the coordinates of the enemy base	
		enemyRace/1,		% the enemyRace/1 percept
		expanded/0,		% the expanded belief, indicates if we have a second Nexus
		friendly/3,		% the friendly percept
		firstNexus/1,		% the firstNexus belief that contains the id of the first nexus.
		gasIds/1,		% the gasIds predicate, contains the ids of our gas gatherers	
		gatheringGas/1,		% the gatheringGas/1 percept	
		map/2,			% the map/2 percept
		nextStage/1,		% the nextStage predicate, indicates the current index
		nexusId/1,		% the nexusId belief, contains the id of a Nexus agent	
		ownBase/2,		% the ownbase predicate, has the coordinates of our own base	
		ownBase/3,		% the ownbase predicate, has the coordinates of our own base with the region id	
		possibleBase/3,		% the possibleBase believe	
		probeId/1,		% the probeId/1 predicate, the id of the probe	
		resources/4,		% the resources available	
		scouting/1,		% the scouting predicate, contains the id of our scouter	
		scouting2/1,		% the scouting2 predicate, contains the id of our second scouter, if we are on the big map	
		scoutToBase/4,		% the scoutToBase belief
		vespeneGeyser/5,	% the vespeneGeyser/5 percept	
		updatedEnemyBase/0,	% the believe that makes sure that we update the enemyBase
		buildPylonHere/2,	% the buildPylonHere predicate, indicates where a pylon needs to be built for the chokepoint
		zealotId/1.		% the zealotId predicate, contains the id of a zealot

% This is a list of our buildorder.
% You can put the name of the buildings that you want in a string as an item in this list.
% You can also use the following predicates: 
% - createUnit('Unit name in string format', the current amount that you want to have)
% - scouting, let a probe go and scout
% - more follows..
buildOrder([
	scouting,
	createUnit('Protoss Probe', 9),
	"Protoss Pylon",
	"Protoss Gateway",
	"Protoss Gateway",
	createUnit('Protoss Zealot', 6),
	"Protoss Pylon",
	"Protoss Pylon", 
	createUnit('Protoss Zealot', 10),
	"Protoss Pylon",  
	"Protoss Pylon",
	createUnit('Protoss Zealot', 16),
	"Protoss Pylon",
	"Protoss Pylon",
	createUnit('Protoss Zealot', 22),
	"Protoss Assimilator",
	"Protoss Cybernetics Core",
	"Protoss Pylon",
	createUnit('Protoss Dragoon', 6),
	"Protoss Citadel of Adun",
	"Protoss Pylon",
	"Protoss Templar Archives",
	"Protoss Pylon",
	createUnit('Protoss Dark Templar', 4),
	"Protoss Forge",
	createUnit('Protoss Dark Templar', 10),
	"Protoss Photon Cannon",
	"Protoss Photon Cannon",
	"Protoss Pylon",
	createUnit('Protoss Zealot', 30),
	createUnit('Protoss Dragoon', 12),
	"Protoss Pylon",
	"Protoss Photon Cannon",
	createUnit('Protoss Dark Templar', 18),
	"Protoss Photon Cannon",
	createUnit('Protoss Zealot', 40),
	createUnit('Protoss Dragoon', 20)
	]).

buildOrderTournament([
	scouting,
	createUnit('Protoss Probe', 9),
	"Protoss Pylon",
	"Protoss Gateway",
	"Protoss Gateway",
	createUnit('Protoss Zealot', 6),
	"Protoss Pylon",
	"Protoss Pylon", 
	createUnit('Protoss Probe', 15),
	"Protoss Pylon",
	"Protoss Pylon",  
	createUnit('Protoss Zealot', 20),
	"Protoss Pylon",
	"Protoss Cybernetics Core",
	"Protoss Assimilator",
	"Protoss Pylon",
	"Protoss Pylon",
	"Protoss Stargate",
	createUnit('Protoss Dragoon', 6),
	"Protoss Gateway",
	"Protoss Pylon",
	"Protoss Fleet Beacon",
	"Protoss Citadel of Adun",
	"Protoss Pylon",
	createUnit("Protoss Carrier", 10),
	"Protoss Templar Archives",
	"Protoss Pylon",
	createUnit('Protoss Dark Templar', 4),
	"Protoss Forge",
	"Protoss Pylon",
	"Protoss Stargate",
	"Protoss Pylon",
	createUnit('Protoss Zealot', 20),
	"Protoss Pylon",
	"Protoss Pylon",
	createUnit('Protoss Corsair', 20),  
	"Protoss Pylon",
	"Protoss Pylon",
	"Protoss Pylon",
	createUnit('Protoss Dragoon', 12),
	"Protoss Pylon",
	"Protoss Photon Cannon",
	"Protoss Stargate",
	createUnit('Protoss Dark Templar', 18),
	"Protoss Photon Cannon",
	createUnit('Protoss Zealot', 40),
	createUnit('Protoss Dragoon', 20)
	]).

% Return the next part of the buildorder.
nextBuilding(NextStage):- buildOrder(List), nextStage(Int), nth0(Int, List, NextStage).

% Generate a random Probe Id from the probes ids in the list.
probeIds(X) :- findall(Id, probeId(Id), List), random_member(X,List).

% Generate a random Zealot Id from the zealot ids in the list.
zealotIds(X) :- findall(Id, zealotId(Id), List), random_member(X,List).

% Generate a random Nexus Id from the zealot ids in the list.
nexusIds(X) :- findall(Id, nexusId(Id), List), random_member(X,List).

% Knowledge to find our own realbase.
% The Nexus sends us the coordinates of the status percept and the controller stores it as its own base.
% Since the base percept and the status percept coordinates are not always exact the same coordinates we give a boundary of 3 
%	to be the difference in the coordinates.
realOwnBase(X, Y, A, B):- abs(X-A) =< 5, abs(Y-B) =< 5.

% The amountOf percept, counts all the amounts of a certain type.
amountOf(Type, Amount) :- aggregate_all(count,friendly(Type,_,_), Amount).

% The distance between two points
distance(X1,Y1,X2,Y2,D) :- D is sqrt((X2-X1)**2 + (Y2-Y1)**2).	

% BEGIN automated costsList
	% You can insert: upgradeTo("someUpgrade") in the buildorder and it should work if the building that has to
	% do the upgrade is already there.
	
	%insert a costs list item like this: (building/upgrade/coststype, message channel of executer, required minerals, required gas).
	costsList( [
	  %Begin upgrades
	    %TODO: levels to be implemented
		(forge, "Protoss Ground Weapons", 100, 100), %Increases ground unit damage.
		(forge, "Protoss Ground Armor", 100, 100),	 %Increases ground unit armor.
		(forge, "Protoss Plasma Shields", 200, 200),	 %Increases shields for all units [and most buildings].
		
		(cybernetics, "Protoss Air Weapons", 100, 100),  %Increases air unit damage.
		(cybernetics, "Protoss Plating", 150, 150),	 %Increases air unit armor.
	    %END levels to be implemented
		(cybernetics, "Singularity Charge", 150, 150),	 %Increases firing range for all Dragoons.
		
		(adun, "Leg Enhancements", 150, 150), %Zealots run much faster.
		
		(robotics, "Gravitic Drive", 200, 200),		%Greatly improves Shuttle Speed.
		(robotics, "Scarab Damage", 200, 200),		%Scarab damage increased by 25
		(robotics, "Reaver Capacity", 200, 200),	%+5 max Scarabs per Reaver.
		
		(beacon, "Apial Sensors", 100, 100),	  %Increases Scout sight range.
		(beacon, "Gravitic Thrusters", 200, 200), %Increases Scout movement speed.
		(beacon, "Carrier Capacity", 100, 100),	  %Allows all Carriers to carry up to eight interceptors.
		(beacon, "Argus Jewel", 100, 100),	  %Increases maximum Corsair Energy to 250.
		
		(tempArch, "Khaydarin Amulet", 200, 200), %Increases High Templar energy to 250.
		(tempArch, "Argus Talisman", 150, 150),	  %Increases maximum Dark Archon energy to 250.	
		
		(observatory, "Sensor Array", 150, 150),	%Increases Observer sight range.
		(observatory, "Gravitic Boosters", 150, 150),	%Increases Observer movement speed.
		
		(arbiter, "Khaydarin Core", 150, 150)	%Increases maximum Arbiter energy to 250.
	  %End updates
		
	%TODO: Insert all buildings
		
	]).

	% Has resources predicate
	%
	% Look up if you have enough resources for a building or upgrade.
	% Plus it provides the executer message name that has to build or upgrade.

	%hasResources(CostsType, ExecutorOut):- %this one is for probes and thus for buildings, but it doesn't work yet
	%	costsList(L),
	%	member((probes,CostsType,RequiredMinerals,RequiredGas),L),
	%	probeIds(ExecutorOut),
	%	resources(CurMinerals, CurGas, _, _),
	%	CurMinerals >= RequiredMinerals,
	%	CurGas >= RequiredGas.
	hasResources(CostsType, ExecutorOut):-
		costsList(L),
		member((ExecutorOut,CostsType,RequiredMinerals,RequiredGas),L),
		resources(CurMinerals, CurGas, _, _),
		CurMinerals >= RequiredMinerals,
		CurGas >= RequiredGas.
% END automated costsList