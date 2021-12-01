//This script is called when Witch changes floor, and make substitutions based on
//what path you're taking through the episode.
var player = args[0];
var currentfloor = getcurrentfloor();
var currentpath = ~???~;

function islearnedspell(eq){
	var toreturn = false;
	for(i in 1...7){
		if(!Spellbook.isempty(i) && Spellbook.spellname(i) == eq){
			toreturn = true;
			break;
		}
	} if(!toreturn){
		for(i in 1...4){
			for(q in 1...7){
				if(self.getvar(~spellbook~+i+~slot~+q == eq){
					toreturn = true;
					break;
				}
			}
		}
	} return (toreturn);
}

if(self.level == 1){ 
	if(islearnedspell(~Dealmaker~)){
		currentpath = ~Neutral~;
		trace(~Witch is on neutral path (because she picked Dealmaker on level up)~);
	} else if(islearnedspell(~Time Edge~)){
		currentpath = ~Jinx~;
		trace(~Witch is on jinx path (because she picked Time Edge on level up)~);
	} else if(islearnedspell(~Blessed Blade~)){
		currentpath = ~Chance~;
		trace(~Witch is on chance path (because she picked Blessed Blade on level up)~);
	} else if(!islearnedspell(~Dealmaker~) && !islearnedspell(~Time Edge~) && !islearnedspell(~Blessed Blade~)){
		currentpath = ~???~;
		trace(~Witch is not on any path (because she picked nothing)~);
	}
} else if(self.level == 2){ 
	if(islearnedspell(~Dealmaker~)){
		currentpath = ~Neutral~;
		trace(~Witch is on neutral path (because she picked Dealmaker on level up)~);
		Rules.substitute(~Path Spell 1~|~Magic Hug~);
	} else if(islearnedspell(~Time Edge~)){
		currentpath = ~Jinx~;
		trace(~Witch is on jinx path (because she picked Time Edge on level up)~);
		Rules.substitute(~Path Spell 1~|~Moonflower~);
	} else if(islearnedspell(~Blessed Blade~)){
		currentpath = ~Chance~;
		trace(~Witch is on chance path (because she picked Blessed Blade on level up)~);
		Rules.substitute(~Path Spell 1~|~Dream Luck~);
	} else if(!islearnedspell(~Dealmaker~) && !islearnedspell(~Time Edge~) && !islearnedspell(~Blessed Blade~)){
		currentpath = ~???~;
		trace(~Witch is not on any path (because she picked nothing)~);
	}
}