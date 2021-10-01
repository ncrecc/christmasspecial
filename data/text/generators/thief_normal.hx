var thisgenerator = "thief_normal";
var commonlist1 = [];
var floor2items = [];
var floor2shop = [];
var commonlist2 = [];
var rarelist1 = [];
var commonlist3 = [];
var floor4items = [];
var tradeoffer = [];
var traderesult = [];
var vampireitem = [];
var itempools = [commonlist1,floor2items,floor2shop,commonlist2,rarelist1,commonlist3,floor4items,tradeoffer,traderesult,vampireitem]; //Initialize lists like this for clarity

/*NOTICE TO MODDERS:
  All you need to do to get your items in here is append the name of your mod to:
    diceydungeons/itempools/[this generator's name minus file extension]/scriptstorun.txt
  Then add a .hx script of the appropriate name to that directory that returns an array containing arrays of items
  you want to add to each of the generator's item pools. Use the vanilla script for this generator for reference -
  it's important you return the right amount of arrays!
  
  (If you want to replace the generator entirely, in case you have an extremely specific item pool in mind, you should
  get rid of declaring itempools and add items directly to the above lists (or replace pops from them with strings).
  Note however that other mods will no longer be able to add items here.)*/
  
itempools = runscript("diceydungeons/flexible_generator",[thisgenerator,itempools]);

var commonlist1 = itempools[0];
var floor2items = itempools[1];
var floor2shop = itempools[2];
var commonlist2 = itempools[3];
var rarelist1 = itempools[4];
var commonlist3 = itempools[5];
var floor4items = itempools[6];
var tradeoffer = itempools[7];
var traderesult = itempools[8];
var vampireitem = itempools[9];

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [commonlist1.pop()];
var mycoolfloor1 = addfloor('tiny').additems(items, gooditems);
mycoolfloor1.theme = rand(['music_combat2']);
mycoolfloor1.generate();
  
//Floor 2:
commonlist1 = commonlist1.concat(floor2items);
commonlist1 = shuffle(commonlist1);

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle([floor2shop.pop(), commonlist1.pop(), commonlist1.pop()]))];
var mycoolfloor2 = addfloor('small').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.theme = mycoolfloor1.theme;
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

if (getfinalboss() == "Drake"){
  items.push(vampireitem.pop());
}

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
		