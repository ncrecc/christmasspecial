//written by diane of wibi
//999 was stiww hewe :3
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;

shuffle(alllargeeqs);

var eq = null;

while(eq == null) {
	var testeq = new elements.Equipment(alllargeeqs.pop());
	if(
		testeq.fulldescription.indexOf('On 6') != -1 ||
		testeq.fulldescription.indexOf(' on 6') != -1 ||
		testeq.fulldescription.indexOf('||'.substr(0,1) + 'on 6') != -1
	) {
		eq = testeq;
	}
}

return eq;