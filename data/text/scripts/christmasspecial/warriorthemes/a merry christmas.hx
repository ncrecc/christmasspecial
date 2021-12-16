//written by not mario
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;
var pleasereturnupgraded = args[4];

shuffle(alllargeeqs);

var eq = null;

while(eq == null) {
	if(allsmalleqs.length == 0) {
		trace("couldn't find an equipment for A Merry Christmas with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(alllargeeqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 2) continue;
	}
	if(
		testeq.equipmentcol == 2 ||
		testeq.equipmentcol == 3
	) {
		eq = testeq;
	}
}

return eq;