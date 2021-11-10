//written by diane of wibi, with needling about how possible it is to write a "satisfying" trade function by gost of wibi

var _self = args[0];
var _target = args[1];
//making _self and _target arguments is kind of misleading because we use giveequipment and giveenemyequipment here anyway

//pick an item.
//enemy picks an item.
//if player's item is size 2,
// if enemy's item is size 1,
//  if they have at least 1 other size 1 item,
//   make them pick another size 1 item, too. both items will be included in the trade.
//if enemy's item is size 2,
// if player's item is size 1,
//  if they have at least 1 other size 1 item,
//   make them pick another size 1 item, too. both items will be included in the trade.
//trade the items.

//pick an item.
var myvalideq = [];
for(eq in _self.equipment) {
	if(!eq.hastag("skillcard") && !eq.hastag("nonnegotiable") && !(eq.onceperbattle && eq.usedthisbattle)) {
		myvalideq.push(eq);
	}
}
var myoffer = [rand(myvalideq)];

//enemy picks an item.
var enemyvalideq = [];
for(eq in _target.equipment) {
	if(!eq.hastag("skillcard") && !eq.hastag("nonnegotiable") && !(eq.onceperbattle && eq.usedthisbattle)) {
		enemyvalideq.push(eq);
	}
}
var enemyoffer = [rand(enemyvalideq)];

//if player's item is size 2,
// if enemy's item is size 1,
if(myoffer[0].size == 2 && enemyoffer[0].size == 1) {
//  if they have at least 1 other size 1 item,
	var smalleqtemp = [];
	for(eq in enemyvalideq) if(eq.size == 1 && eq != enemyoffer[0]) smalleqtemp.push(eq);
	if(smalleqtemp.length > 0) {
//   make them pick another size 1 item, too. both items will be included in the trade.
		enemyoffer.push(rand(smalleqtemp));
	}
}
//if enemy's item is size 2,
// if player's item is size 1,
if(enemyoffer[0].size == 2 && myoffer[0].size == 1) {
//  if they have at least 1 other size 1 item,
	var smalleqtemp = [];
	for(eq in myvalideq) if(eq.size == 1 && eq != myoffer[0]) smalleqtemp.push(eq);
	if(smalleqtemp.length > 0) {
//   make them pick another size 1 item, too. both items will be included in the trade.
		myoffer.push(rand(smalleqtemp));
	}
}
//trade the items.
var myoffer_strings = [for(eq in myoffer) eq.rawname];
var enemyoffer_strings = [for(eq in enemyoffer) eq.rawname];
//giveenemyequipment(myoffer, true, false); //this doesn't work for some reason. fuck it
for(eq in myoffer) eq.equippedby = _target;
_target.equipment = _target.equipment.concat(myoffer); //surprisingly this actually does work and without destroying everything
giveequipment(enemyoffer, true, false);

for(eq in myoffer) _self.equipment.remove(eq);
for(eq in enemyoffer) _target.equipment.remove(eq);

//animateequipmentintoplace(_self);
