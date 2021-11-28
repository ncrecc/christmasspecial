//Written by Black Widow of the Wibi system.
//with upgrade handling by bert of wibi
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;
var pleasereturnupgraded = args[4];

shuffle(alllargeeqs);


shuffle(alllargeeqs);

var eq = null;

while(eq == null) {
	if(alllargeeqs.length == 0) {
		trace("couldn't find an equipment for Super Maneuver with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(alllargeeqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 1) continue;
	}
	if(
		testeq.script.indexOf('givedice(') != -1 &&
		testeq.script.split('givedice(split(').join('')
		.split('givedice(actualdice[0] -').join('')
		.split('givedice(d -').join('').indexOf('givedice(') != -1
	) {
		eq = testeq;
	}
}

return eq;