//written by not mario
var allsmalleqs = args[0];
var pleasereturnupgraded = args[4];

shuffle(allsmalleqs);

var eq = null;

while(eq == null) {
	if(allsmalleqs.length == 0) {
		trace("couldn't find an equipment for Something Orange with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(allsmalleqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 2) continue;
	}
	if(
		testeq.equipmentcol == 9
	) {
		eq = testeq;
	}
}

return eq;