//by diane of wibi. titku of wibi convinced me not to overcomplicate this in terms of getting exact equipment positions to align with themecard positions
//gaetana wa shere lol
//999 was hewe!!!
var f = args[0];

var themesequipped = [];
var allsmalleqs = getequipmentlist(
	null,
	["small"],
	[
		"skillcard",
		"excludefromrandomlists",
		"robotonly",
		"witchonly",
		"jesteronly",
		"inventoronly",
		"alternateversion"
	]
);
var alllargeeqs = getequipmentlist(
	null,
	["large"],
	[
		"skillcard",
		"excludefromrandomlists",
		"robotonly",
		"witchonly",
		"jesteronly",
		"inventoronly",
		"alternateversion"
	]
);
var alleqs = allsmalleqs.concat(alllargeeqs);

var i = f.equipment.length;
while(i > 0) {
	var eq = f.equipment[--i];
	if(eq.skillcard == "" && !eq.hastag("immunetotide") && !eq.hastag("skillcard")) {
		if(!f.varexists("themesequipped")) if(eq.hastag("themecard")) themesequipped.push(eq.name);
		eq.dispose();
		f.equipment.splice(i, 1);
	}
}

if(!f.varexists("themesequipped")) f.setvar("themesequipped",themesequipped);
themesequipped = f.getvar("themesequipped");
shuffle(themesequipped); //if there's more themes than can actually fit (i.e. due to a size 1 themecard requesting or allowing a size 2 card), then choose some at random

var space = f.spaceleft();
trace(space);
while(space > 1 && themesequipped.length > 0) {
	var neweq = runscript("christmasspecial/warriorthemes/" + themesequipped.pop().toLowerCase(),[allsmalleqs,alllargeeqs,alleqs,false]); //4th arg requests the script to return only a small equipment if set to true. if the script receives the 4th arg as true, it MUST return either a small equipment or null. -diane
	if(neweq != null) f.equipment.push(neweq);
	space = f.spaceleft();
}
if(space == 1 && themesequipped.length > 0) {
	var neweq = runscript("christmasspecial/warriorthemes/" + themesequipped.pop(),[allsmalleqs,alllargeeqs,alleqs,true]);
	if(neweq != null) f.equipment.push(neweq);
	space = f.spaceleft();
}
while(space > 1) {
	var neweq = new elements.Equipment(rand(alleqs));
	f.equipment.push(neweq);
	space = f.spaceleft();
}
if(space == 1) {
	var neweq = new elements.Equipment(rand(allsmalleqs));
	f.equipment.push(neweq);
	space = f.spaceleft();
}
shuffle(f.equipment);
f.fixskillcard();
//kludge! i want Game.animateequipmentintoplace(self);, but that isn't exposed, so i try to call giveequipment in such a way that invokes it while changing as little as possible
giveequipment(new elements.Equipment("Equipment That Does Nothing"), true, false);
removeequipment("Equipment That Does Nothing");
/*for(eq in f.equipment) {
	eq.animate('flash');
	eq.resetfornewturn('player');
}*/