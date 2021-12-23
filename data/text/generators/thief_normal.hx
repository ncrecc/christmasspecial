var commonlist1 = shuffle(["Mouse Trap", "Umbrella", pick(["Demote", "Trinity Charm"]), "Hand Sanitiser", "Bubble Burster", "Glue Gun", "Natural Charm", "Waltzer"]);
var floor2items = shuffle(["Pocket Protector", "Giga Drain"]);
var floor2shop = shuffle(["Mitosis", pick(["Stockpick", "Permapick"]), "Luckpick"]);
var commonlist2 = shuffle(["Booby Trap", "Lightreaver", "Bulletproof Glass", "Fruit Loot", "False Swipe", "Locktrick", "Plague Stave", "Locket", "The Monarch", "Precognition"]);
var rarelist1 = shuffle(["Pigstep", "Autohook", "Metal Crusher", "Push Knife", "Flea Shooter", "Eternity Cannon", "Adamant Rail"]);
var commonlist3 = shuffle(["Rockfall", "Iron Helmet", "Biohazard", "Reagent", "Mirror Spatula"]);
var floor4items = shuffle(["Spear"]);
var tradeoffer;
var traderesult;
if(chance(10)){
	tradeoffer = ["Lockpick"];
	traderesult = ["Stockpick"];
}else if(chance(10)){
	tradeoffer = ["Lockpick"];
	traderesult = ["Nail Rat"];
}else{
	tradeoffer = ["Stink Bomb", "Greedy Crowbar", "Lockpick", "Christmas Dagger"];
	traderesult = shuffle(["Poison Thread", "Plight", "Incapacitate", "Third Place Cauldron"]);
}
tradeoffer.push("any");

var vampireitem = ["Silver Sword"];

var itempools = [commonlist1, floor2items, floor2shop, commonlist2, rarelist1, commonlist3, floor4items, vampireitem, ["Demote", "Trinity Charm", "Stockpick", "Permapick", "Poison Thread", "Plight", "Incapacitate", "Nail Rat", "Third Place Cauldron"]];

runscript("christmasspecial/checkgeneratorisaccurate",[itempools]);

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [commonlist1.pop()];

var mycoolfloor1 = addfloor('tiny').additems(items, gooditems);
mycoolfloor1.theme = rand(['xmas1']);
mycoolfloor1.generate();
  
//Floor 2:
commonlist1 = commonlist1.concat(floor2items);
commonlist1 = shuffle(commonlist1);

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle([floor2shop.pop(), commonlist1.pop(), commonlist1.pop()]))];

var mycoolfloor2 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.theme = rand(['xmas1']);
mycoolfloor2.generate();
  
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


var mycoolfloor3 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor3.theme = rand(['xmas2']);
mycoolfloor3.generate();

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
var mycoolfloor4 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor4.theme = rand(['xmas3']);
mycoolfloor4.generate();
  
 //Floor 5:
items = [floor5item];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle(["health", commonlist3.pop(), pick([rarelist1.pop(), commonlist2.pop()])])), 
  upgrade()
];

var mycoolfloor5 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor5.theme = rand(['xmas6']);
mycoolfloor5.generate();

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