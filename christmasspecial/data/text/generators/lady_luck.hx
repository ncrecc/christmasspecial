var warriorshops = [];
var strangeshop = [];
var awesomelist = [];
var floor2gooditem = [];
var floor3item = [];
var floor5item = [];
var vampireitem = ["Silver Sword"];



usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];
var mycoolfloor1 = addfloor('tiny').additems(items, gooditems);
mycoolfloor1.theme = rand(['music_combat2']);
mycoolfloor1.generate();

//Floor 2:
items = [];
gooditems = [];
otherstuff = [health()];
goodotherstuff = [];
var mycoolfloor2 = addfloor('small').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.theme = mycoolfloor1.theme;
mycoolfloor2.generate();

//Floor 3:
items = [];
gooditems = [];
otherstuff = [health(), health()];

goodotherstuff = [];
var mycoolfloor3 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor3.theme = rand(['music_combat3']);
mycoolfloor3.generate();

//Floor 4:
items = [];
gooditems = [];

otherstuff = [health()];
goodotherstuff = [];
var mycoolfloor4 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor4.theme = rand(['music_combat3']);
mycoolfloor4.generate();
  
//Floor 5:
items = [];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [
  upgrade(),
  shop(["health", "health", "health"], [4, 4, 4])
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