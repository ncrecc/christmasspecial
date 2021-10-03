//by diane of wibi. 999 and gaetana are in fact still here.
var f = args[0];

var i = f.equipment.length;
while(i > 0) {
	var eq = f.equipment[--i];
	if(eq.skillcard == "" && !eq.hastag("immunetotide")) {
		eq.dispose();
		f.equipment.splice(i, 1);
	}
}

var themesequipped = f.getvar("themesequipped");

if(themesequipped.length > 0) {
	for(themecard in themesequipped) {
		f.equipment.push(new elements.Equipment(themecard));
	}
}

f.resetvar("themesequipped");
shuffle(f.equipment);
f.fixskillcard();