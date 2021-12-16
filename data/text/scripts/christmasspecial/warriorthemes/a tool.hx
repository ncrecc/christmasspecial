//written by diane of wibi
//(999 was stiww hewe :3)
//with upgrade handling by bert of wibi
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;
var pleasereturnupgraded = args[4];

shuffle(alllargeeqs);

var eq = null;

while(eq == null) {
	if(alllargeeqs.length == 0) {
		trace("couldn't find an equipment for A Tool with pleasereturnupgraded " + pleasereturnupgraded);
		break;
	}
	var testeq = new elements.Equipment(alllargeeqs.pop());
	var unupgradedeq = null;
	if(pleasereturnupgraded) {
		if(testeq.upgradetype == "") continue;
		unupgradedeq = testeq.copy(); //we keep the unupgraded eq around for later because we want to account for equipment that upgrades from "on 6" to "on even" since that still procs its effect on 6. equipment that upgrades to "on 5 or 6" are not so lucky (if that's a thing) -bert
		testeq = new elements.Equipment(testeq.name + "+");
		if(testeq.size == 1) continue;
	}
	if(
		(
			!pleasereturnupgraded && (
				testeq.fulldescription.indexOf('On 6') != -1 ||
				testeq.fulldescription.indexOf(' on 6') != -1 ||
				testeq.fulldescription.indexOf('|on 6') != -1
			)
		) || (
			pleasereturnupgraded && (
				(
					unupgradedeq.fulldescription.indexOf('On 6') != -1 ||
					unupgradedeq.fulldescription.indexOf(' on 6') != -1 ||
					unupgradedeq.fulldescription.indexOf('|on 6') != -1
				) && (
					testeq.fulldescription.indexOf('On even') != -1 ||
					testeq.fulldescription.indexOf(' on even') != -1 ||
					testeq.fulldescription.indexOf('|on even') != -1
				)
			)
		)
	) {
		eq = testeq;
		if(unupgradedeq != null) unupgradedeq.dispose();
	}
}

return eq;