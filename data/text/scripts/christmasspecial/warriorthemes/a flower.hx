//written by not mario
var allsmalleqs = args[0];
var pleasereturnupgraded = args[4];

shuffle(allsmalleqs);

var eq = null;

while(eq == null) {
	if(allsmalleqs.length == 0) {
		trace("couldn't find an equipment for A Flower with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(allsmalleqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 2) continue;
	}
	if(
		testeq.script.indexOf('inflictself(MANA') != -1 ||
		testeq.script.indexOf('inflictself("mana"') != -1 ||
		testeq.script.indexOf('removestatusself(MANA') != -1 ||
		testeq.script.indexOf('removestatusself("mana"') != -1 ||
		testeq.script.indexOf('getstatusself(MANA') != -1 ||
		testeq.script.indexOf('getstatusself("mana"') != -1
	) {
		eq = testeq;
	}
}

return eq;