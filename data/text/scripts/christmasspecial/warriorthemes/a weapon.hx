//written by diane of wibi
//with upgrade handling by bert of wibi
var eqlist = [];
var allsmalleqs = args[1];
var alleqs = args[2];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) {
	eqlist = allsmalleqs;
} else {
	eqlist = alleqs;
}
var pleasereturnupgraded = args[4];

shuffle(eqlist);

var eq = null;

while(eq == null) {
	if(eqlist.length == 0) {
		trace("couldn't find an equipment for A Weapon with pleasereturnsmall " + pleasereturnsmall + " and pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(eqlist.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(pleasereturnsmall && testeq.size == 2) continue;
	}
	if(
		(!testeq.hastag("notweapon"))
		&&
		(
			(
				testeq.script.indexOf('attack(') != -1 &&
				testeq.script.split('attack(-').join('').indexOf('attack(') != -1
			) || (
				testeq.script.indexOf('drain(') != -1
			)
		)
	) {
		eq = testeq;
	}
}

return eq;