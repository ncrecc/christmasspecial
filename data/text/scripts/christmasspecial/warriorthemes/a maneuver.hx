//Written by Black Widow of the Wibi system.
//with upgrade handling by bert of wibi
var allsmalleqs = args[0];
var pleasereturnupgraded = args[4];

shuffle(allsmalleqs);

var eq = null;

while(eq == null) {
	if(allsmalleqs.length == 0) {
		trace("couldn't find an equipment for A Maneuver with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(allsmalleqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 2) continue;
	}
	if(
		testeq.script.indexOf('givedice(') != -1 &&
		testeq.script.split('givedice(split(').join('')
		.split('givedice(actualdice[0] -').join('')
		.split('givedice(d -').join('').indexOf('givedice(') != -1 //we don't like nudge apparently
	) {
		eq = testeq;
	}
}

return eq;