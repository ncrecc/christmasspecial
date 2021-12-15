//by diane of wibi. titku of wibi convinced me not to overcomplicate this in terms of getting exact equipment positions to align with themecard positions
//gaetana wa shere lol
//999 was hewe!!!
var f = args[0];
var target = args[1];
var midturn = args[2];

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
		if(!f.varexists("themesequipped") && eq.hastag("themecard")) {
			themesequipped.push([eq.name, eq.upgraded]);
		}
		eq.dispose();
		f.equipment.splice(i, 1);
	}
}

if(!f.varexists("themesequipped")) f.setvar("themesequipped",themesequipped);
themesequipped = f.getvar("themesequipped").copy();
shuffle(themesequipped); //if there's more themes than can actually fit (i.e. due to a size 1 themecard requesting or allowing a size 2 card), then choose some at random -diane

var eqtoadd = [];

var space = f.spaceleft();
while(space > 1 && themesequipped.length > 0) {
	var theme = themesequipped.pop();
	
	//4th arg requests the script to return only a small equipment if set to true. if the script receives the 4th arg as true, it MUST return either a small equipment or null. -diane
		//clarifying on the above a bit - this isn't because themecards normally can't be asked to return equipment of a particular size; this is because of cases where all slots are filled and a card that can return small *or* large equipment would not have space to return a large equipment. -bert
	//5th arg requests the script to return an upgraded equipment if passed true. (on the scripts' side they still have to return a properly sized equipment, though note that as currently implemented, small equipment that becomes large on upgrade (e.g. proton pack) will not count as an upgraded large equipment, since large equipment is only oikked from getequipmentlist with the "large" argument supplied. not sure how i would solve this) -bert
	//...in retrospect it's pretty messy to literally just write one of three variants of "also if it wants upgraded return upgraded thx" in every single themecard (variant 1 is base, variant 2 rejects all size 1 upgraded equipment, variant 3 rejects all size 2 upgraded equipment) but dicey dungeons is 90% kludge so w/e -bert
	var neweq = runscript("christmasspecial/warriorthemes/" + theme[0].toLowerCase(),[allsmalleqs,alllargeeqs,alleqs,false,theme[1]]); 
	
	if(neweq != null) eqtoadd.push(neweq);
	if(neweq != null) space -= neweq.size;
}
if(space == 1 && themesequipped.length > 0) {
	var theme = themesequipped.pop();
	var neweq = runscript("christmasspecial/warriorthemes/" + theme[0].toLowerCase(),[allsmalleqs,alllargeeqs,alleqs,true, theme[1]]);
	if(neweq != null) eqtoadd.push(neweq);
	if(neweq != null) space -= neweq.size;
}/*
while(space > 1) {
	var neweq = new elements.Equipment(rand(alleqs));
	if(neweq != null) eqtoadd.push(neweq);
	if(neweq != null) space -= neweq.size;
}
if(space == 1) {
	var neweq = new elements.Equipment(rand(allsmalleqs));
	if(neweq != null) eqtoadd.push(neweq);
	if(neweq != null) space -= neweq.size;
}*/
shuffle(f.equipment);
var oldequipment = f.equipment.copy();
giveequipment(eqtoadd, true, false);
var newequipment = f.equipment.copy();
for(eq in newequipment) {
	if(oldequipment.indexOf(eq) == -1) {
		runscript("christmasspecial/evalstarthooks",[f,target,eq,true,true,midturn]);
	}
}
f.fixskillcard();