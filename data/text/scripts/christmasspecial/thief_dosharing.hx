//written by bert
//and buster
var self = args[0];
var target = args[1];
var timing = args[2];
var turn = args[3];

var player = null;
var enemy = null;
if(self.isplayer) {
	player = self;
	enemy = target;
}
if(target.isplayer) {
	player = target;
	enemy = self;
}



/* phases we need to be concerned about


on odd turns, you steal from enemy for 2 turns
on even turns, enemy steals from you for 2 turns


turn n%2==1, player before start turn:
[player naturally steals a card, old card discarded]

turn n%2==1, player end turn:

turn n%2==1, enemy before start turn:

turn n%2==1, enemy end turn:
enemy makes it so player can only "steal" the card they stole last turn, if that isn't null

turn n%2==0, player before start turn:
[player naturally steals a card]
enemy removes their old reverse-stolen card and reverse-steals a new card

turn n%2==0, player end turn:

turn n%2==0, enemy before start turn:

turn n%2==0, enemy end turn:


...huh. simpler than it seems?
-buster */


if(timing == "endturn_enemy") { //we want to piggyback on internal stolencard management, but it occurs before "before start turn" scripts are run, so we need this to be run on end turn
	if(turn % 2 == 1 && turn > 0) { //bert was paranoid because of sticky rule lol -bert
		if(player.getvar("mystolencard") != null) {
			var mystolencardfound = false;
			for(eq in enemy.equipment) {
				if(eq.name != player.getvar("mystolencard")) { //make sure the only card that can be stolen is identical to the card just used, giving the illusion that you're keeping the card for 2 turns (might break on once per battle equipment?)
					//sharinghint now exists to fix possible once per battle equipment break -buster
					if(!eq.hastag("cannotsteal")) {
						eq.addtag("cannotsteal");
						eq.addtag("madecannotsteal");
					}
				} else mystolencardfound = true;
			}
			if(!mystolencardfound) {
				//unlike the actual reverse stolen card, sharinghinttemp is a card that only exists between end of enemy's turn and beforestart of player's turn, so that thief's stealing mechanic will pick it up. the reverse stolen card stays indefinitely. -buster
				sharinghint = new elements.Equipment(player.getvar("mystolencard"));
				enemy.equipment.push(sharinghint);
				sharinghint.addtag("sharinghint_temp");
			}
		}
	}
}

if(timing == "beforestartturn_player") {
	if(turn % 2 == 0 && turn > 0) {
		if(enemy.spaceleft() > 0) {
			//reverse stealing time
			for(eq in enemy.equipment) {
				if(eq.hastag("madecannotsteal")) {
					eq.removetag("madecannotsteal");
					eq.removetag("cannotsteal");
				}
				if(eq.hastag("reversestolencard")) {
					eq.name = "bustersaysdeleteme";
				}
			}
			removeequipment("bustersaysdeleteme",enemy);
			var equipmentpool = [];
			for(eq in player.equipment) {
				if(!eq.hastag("cannotsteal")) {
					equipmentpool.push(eq);
				}
			}
			if(equipmentpool.length > 0) {
				var cardtoreversesteal = pick(equipmentpool);
				cardtoreversesteal.addtag("dostolenanim");
				var reversestolencard = new elements.Equipment(cardtoreversesteal);
				reversestolencard.x = -9999;
				reversestolencard.y = -9999; //without this, equipment very briefly displays as on-screen once created, before it's pushed into the enemy's equipment and the game realizes it's not supposed to draw it
				enemy.equipment.push(reversestolencard);
				reversestolencard.addtag("reversestolencard");
				reversestolencard.addtag("weakenavoid");
				reversestolencard.addtag("weakenimmune");
				reversestolencard.addtag("shockavoid");
				reversestolencard.addtag("shockimmune");
				reversestolencard.addtag("cannotsteal");
			}
		}
	}
	if(turn % 2 == 1 && turn > 0) {
		player.setvar("mystolencard", self.stolencard.name);
	}
}

if(timing == "onstartturn_player") {
	if(turn % 2 == 0 && turn > 0) {
		for(eq in player.equipment) {
			if(eq.hastag("dostolenanim")) {
				eq.animate("flashandshake");
				eq.animation[0].addcommand("textparticle", "Shared!", 16777215);
				eq.removetag("dostolenanim");
			}
		}
	}
}