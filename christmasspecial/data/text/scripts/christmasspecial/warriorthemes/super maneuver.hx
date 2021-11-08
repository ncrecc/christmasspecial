//Written by Black Widow of the Wibi system.
var alllargeeqs = args[1];
var pleasereturnsmall = args[3];
if(pleasereturnsmall) return null;

shuffle(alllargeeqs);


shuffle(alllargeeqs);

var eq = null;

while(eq == null) {
	var testeq = new elements.Equipment(allsmalleqs.pop());
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