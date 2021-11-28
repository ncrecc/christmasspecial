//written by diane of wibi
//with upgrade handling by bert of wibi
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;
var pleasereturnupgraded = args[4];

shuffle(alllargeeqs);

var eq = null;
while(eq == null) {
	if(alllargeeqs.length == 0) {
		trace("couldn't find an equipment for A Blade with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(alllargeeqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 1) continue;
	}
	if(
		(!testeq.hastag("notweapon") && !testeq.hastag("notblade"))
		&&
		(
			(
				testeq.script.indexOf('attack(') != -1 &&
				testeq.script.split('attack(-').join('').indexOf('attack(') != -1
			) || (
				testeq.script.indexOf('drain(') != -1
			)
		) && (
			testeq.getslots().length == 1 &&
			testeq.getslots()[0] == 'NORMAL'
		)
	) {
		eq = testeq;
	}
}

return eq;