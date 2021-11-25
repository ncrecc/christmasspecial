//written by diane of wibi
var eqlist = [];
var allsmalleqs = args[1];
var alleqs = args[2];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) {
	eqlist = allsmalleqs;
} else {
	eqlist = alleqs;
}

shuffle(eqlist);

var eq = null;

while(eq == null) {
	var testeq = new elements.Equipment(eqlist.pop());
	if(
		(!eq.hastag("notweapon"))
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