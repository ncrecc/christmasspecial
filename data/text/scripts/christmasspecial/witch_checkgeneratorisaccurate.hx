//by diane, as with broken downgrade tester & broken upgrade tester
var myitempools = args[0];

var allspells = getequipmentlist(null, ["spell", "small"]); //"spell" arg makes it return all equipment that has a valid spellcost, though i don't know if it automatically checks whether the equipment is small (large equipment breaks witch even with a spellcost) so i threw in small just to be safe

trace("scanning for missing witch spells");
for(pool in myitempools) {
	for(entry in pool) {
		if(allspells.indexOf(entry) == -1) {
			trace(entry + " is not a spell");
		}
	}
}
trace("scan complete");