//Written by Black Widow of the Wibi system.
//adjustments made by gost
//with upgrade handling by bert of wibi
var allsmalleqs = args[0];
var pleasereturnupgraded = args[4];

shuffle(allsmalleqs);

var eq = null;

while(eq == null) {
	if(allsmalleqs.length == 0) {
		trace("couldn't find an equipment for A Gun with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(allsmalleqs.pop());
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 2) continue;
	}
	if(
		(testeq.countdown > 0 && testeq.countdown <= 6) &&
		(testeq.usesleft == -1 || testeq.usesleft > 1)
	) {
		eq = testeq;
	}
}

return eq;