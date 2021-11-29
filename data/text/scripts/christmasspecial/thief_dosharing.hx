//written by bert
var self = args[0];
var target = args[1];
var timing = args[2];
var turn = args[3];

if(timing == "endturn") { //we want to piggyback on internal stolencard management, but it occurs before "before start turn" scripts are run, so we need this to be run on end turn
	if(turn % 2 == 0 && turn > 0) { //lol sticky hands rule
		for(eq in enemy.equipment) {
			if(eq.name != player.getvar("mystolencard")) { //make sure the only card that can be stolen is identical to the card just used, giving the illusion that you're keeping the card for 2 turns (might break on once per battle equipment?)
				if(!eq.hastag("cannotsteal") {
					eq.addtag("cannotsteal");
					eq.addtag("madecannotsteal");
				}
			}
		}
	}
}

if(timing == "beforestartturn") {
	if(turn % 2 == 0 && turn > 0) {
		//reverse stealing time
		var equipmentpool = [];
		for(eq in self.equipment) {
			if(!eq.hastag("cannotsteal") {
				equipmentpool.push(eq);
			}
		}
	}
}