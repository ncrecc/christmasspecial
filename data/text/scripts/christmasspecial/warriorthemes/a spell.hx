//written by not mario
var pleasereturnupgraded = args[4];

var allspells = loadtext("christmasspecial/warrior_spells");

shuffle(allspells);

var eq = null;

while(eq == null) {
	if(allspells.length == 0) {
		trace("couldn't find an equipment for A Spell with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(allspells.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 2) continue;
	}
	eq = testeq;
}

return eq;