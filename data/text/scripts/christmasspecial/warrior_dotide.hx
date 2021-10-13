//by diane of wibi. titku of wibi convinced me not to overcomplicate this in terms of getting exact equipment positions to align with themecard positions
//gaetana wa shere lol
//999 was hewe!!!
var f = args[0];
var target = args[1];

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
		"onceperbattle",
		"alternateversion",
		"immunetotide"
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
		"onceperbattle",
		"alternateversion",
		"immunetotide"
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
themesequipped = f.getvar("themesequipped").copy();
shuffle(themesequipped); //if there's more themes than can actually fit (i.e. due to a size 1 themecard requesting or allowing a size 2 card), then choose some at random

var eqtoadd = [];

var space = f.spaceleft();
while(space > 1 && themesequipped.length > 0) {
	var neweq = runscript("christmasspecial/warriorthemes/" + themesequipped.pop().toLowerCase(),[allsmalleqs,alllargeeqs,alleqs,false]); //4th arg requests the script to return only a small equipment if set to true. if the script receives the 4th arg as true, it MUST return either a small equipment or null. -diane
	if(neweq != null) eqtoadd.push(neweq);
	space -= neweq.size;
}
if(space == 1 && themesequipped.length > 0) {
	var neweq = runscript("christmasspecial/warriorthemes/" + themesequipped.pop(),[allsmalleqs,alllargeeqs,alleqs,true]);
	if(neweq != null) eqtoadd.push(neweq);
	space -= neweq.size;
}
while(space > 1) {
	var neweq = new elements.Equipment(rand(alleqs));
	if(neweq != null) eqtoadd.push(neweq);
	space -= neweq.size;
}
if(space == 1) {
	var neweq = new elements.Equipment(rand(allsmalleqs));
	if(neweq != null) eqtoadd.push(neweq);
	space -= neweq.size;
}
shuffle(f.equipment);
giveequipment(eqtoadd, true, false);
for(eq in eqtoadd) runscript("christmasspecial/evalstarthooks",[f,target,eq]);
f.fixskillcard();