//written by not mario
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;
var pleasereturnupgraded = args[4];

shuffle(alllargeeqs);

var eq = null;

while(eq == null) {
	if(alllargeeqs.length == 0) {
		trace("couldn't find an equipment for Something Large with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(alllargeeqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 1) continue;
	}
	if (testeq.slots.length == 0) continue;
	var realslots = 0;
	for (slot in testeq.slots) {
		if (["FREE1","FREE2","FREE3","FREE4","FREE5","FREE6"].indexOf(slot) == -1) {
			realslots++;
		}
	}
	if(
		realslots >= 2
	) {
		eq = testeq;
	}
}

return eq;