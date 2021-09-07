var thisgenerator = "inventor_normal";
var floor1countdowns = [];
var floor1sword = [];
var floor1crap = [];
var commonlist1 = [];
var shoplist1 = [];
var scrapitems = [];
var midtierdrops = [];
var floor3items = [];
var commonlist2 = [];
var floor5items = [];
var vampireitem = [];
var itempools = [floor1countdowns,floor1sword,floor1crap,commonlist1,shoplist1,scrapitems,midtierdrops,floor3items,commonlist2,floor5items,vampireitem]; //Initialize lists like this for clarity

/*NOTICE TO MODDERS:
  All you need to do to get your items in here is append the name of your mod to:
    diceydungeons/itempools/[this generator's name minus file extension]/scriptstorun.txt
  Then add a .hx script of the appropriate name to that directory that returns an array containing arrays of items
  you want to add to each of the generator's item pools. Use the vanilla script for this generator for reference -
  it's important you return the right amount of arrays!
  
  (If you want to replace the generator entirely, in case you have an extremely specific item pool in mind, you should
  get rid of declaring scriptstorun and the "for scriptname in scriptstorun" bit. - but note it will no longer be quite as
  compatible with other mods.)*/
  
itempools = runscript("diceydungeons/flexible_generator",[thisgenerator,itempools]);
var floor1countdowns = itempools[0];
var floor1sword = itempools[1];
var floor1crap = itempools[2];
var commonlist1 = itempools[3];
var shoplist1 = itempools[4];
var scrapitems = itempools[5];
var midtierdrops = itempools[6];
var floor3items = itempools[7];
var commonlist2 = itempools[8];
var floor5items = itempools[9];
var vampireitem = itempools[10];

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [];
gooditems = [];
otherstuff = [
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 1]))
];
goodotherstuff = [
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
];

addfloor("smallwinterventorfirst")
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
items = [];
gooditems = [];

otherstuff = [
  health(), 
  health()
];
goodotherstuff = [
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 4]))
];

addfloor("smallwinterventorsecond")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items = [];
gooditems = [];

otherstuff = [health()];
goodotherstuff = [
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 4]))
];
	
addfloor("bigwinterventor")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [];
		
otherstuff = [health(), health()];
goodotherstuff = [
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 4]))
];
		
addfloor("normalwinterventor")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
gooditems = [];
		
otherstuff = [health(), health()];
goodotherstuff = [
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([1, 2, 1])),
  shop(shuffle(["Backfire","Very Good Sword","LOL Sword"]), shuffle([3, 2, 4]))
];
		
addfloor("bigwinterventor")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

var lastfloor = addfloor("boss");

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
		
		