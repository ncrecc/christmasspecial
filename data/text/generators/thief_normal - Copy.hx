var commonlist1 = ["Leather Armor", "Bump", "Bandage", "Pickpocket", "Pea Shooter", "Snake Eye Charm"];
var floor2items = ["Pocket Protector", "Giga Drain"];
var floor2shop = ["Keyhole", "Stockpick", "Permapick"];
var commonlist2 = ["Lantern", "Last Stand", "Fruit Loot", "False Swipe", "Lockpick", "Plague Stave"];
var rarelist1 = ["Pigstep", "Hookshot", "Snake Eye Charm", "Midnight Charm", "Flea Shooter"];
var commonlist3 = ["Lockpick", "Iron Armor", "Blight", "Detonator", "Spatula"];
var floor4items = ["Nudgeblade"];
var tradeoffer;
var traderesult;
if(chance(10)){
	tradeoffer = ["Lockpick"];
	traderesult = ["Blender"];
}else if(chance(10)){
	tradeoffer = ["Lockpick"];
	traderesult = ["Rat"];
}else{
	tradeoffer = ["Poison Needle", "Crowbar", "Lockpick", "Dagger"];
	traderesult = ["Backstab", "Blight", "Catastrophe", "Glass Cauldron"];
}
tradeoffer.push("any");

var vampireitem = ["Silver Sword"];



usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [commonlist1.pop()];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist1 = commonlist1.concat(floor2items);
commonlist1 = shuffle(commonlist1);

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle([floor2shop.pop(), commonlist1.pop(), commonlist1.pop()]))];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
items = [commonlist2.pop()];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([commonlist2.pop(), commonlist2.pop(), commonlist1.pop()]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [commonlist3.pop()];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist3 = commonlist3.concat(floor4items);
commonlist3 = shuffle(commonlist3);

otherstuff = [health(), health()];

var thieftrade = trade(tradeoffer,traderesult);
goodotherstuff = [
  shop([rarelist1.pop(), rarelist1.pop(), commonlist2.pop()]),
  thieftrade
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
 //Floor 5:
items = [floor5item];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle(["health", commonlist3.pop(), pick([rarelist1.pop(), commonlist2.pop()])])), 
  upgrade()
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

var lastfloor = addfloor("boss");

if (getfinalboss() == "Mariah Carey"){
  items.push("BOOO!");
}

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();