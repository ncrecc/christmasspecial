//Written by Black Widow of the Wibi system.
var allsmalleqs = args[0];

shuffle(allsmalleqs);

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