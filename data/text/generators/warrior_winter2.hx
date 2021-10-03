var thisgenerator = "warrior_winter2";
var warriorshops = [];
var strangeshop = [];
var awesomelist = [];
var floor2gooditem = [];
var floor3item = [];
var floor5item = [];
var vampireitem = [];

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
mycoolfloor1.generate();

//Floor 2:
items = [];
gooditems = [];
otherstuff = [health(), health()];
goodotherstuff = [];

var mycoolfloor2 = addfloor('small').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.generate();

//Floor 3:
items = [];
gooditems = [];

otherstuff = [health(), health()];

goodotherstuff = [];

var mycoolfloor3 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor3.generate();
  
//Floor 4:
items = [];
gooditems = [];

otherstuff = [health(), health(), health()];
goodotherstuff = [];

var mycoolfloor4 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor4.generate();
  
//Floor 5:
items = [];
gooditems = [];

otherstuff = [health(), health(), health()];
goodotherstuff = [shop(["health", "health", "health"], [4, 3, 4])];

var mycoolfloor5 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
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