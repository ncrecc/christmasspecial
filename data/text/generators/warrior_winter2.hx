var colours = shuffle(["Something Red","Something Blue","Something Purple","Something Orange","Something Yellow","Something Green","Something Pink","Something Gray","Something Warm","Something Cold"]);
var themes = shuffle(["A Maneuver","A Gun","A Maneuver","A Spell","A Flower","A Bonus","Something Large","A Finale","A Scrap"]);
var vampireitem = ["Silver Sword"];

runscript("christmasspecial/checkgeneratorisaccurate",[[colours, themes, vampireitem]]);

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [];
gooditems = [themes.pop()];
otherstuff = [];
goodotherstuff = [];

var mycoolfloor1 = addfloor('tiny').additems(items, gooditems);
mycoolfloor1.theme = rand(['xmas1']);
mycoolfloor1.generate();

//Floor 2:
items = [];
gooditems = [colours.pop()];
otherstuff = [health()];
goodotherstuff = [shop([colours.pop(), colours.pop(), colours.pop()])];

var mycoolfloor2 = addfloor('small').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.theme = rand(['xmas1']);
mycoolfloor2.generate();

//Floor 3:
items = [];
items.push(themes.pop());
gooditems = [];

otherstuff = [health(), health()];

goodotherstuff = [
  shop([themes.pop(), colours.pop(), themes.pop()]),
  upgrade()
];

var mycoolfloor3 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor3.theme = rand(['xmas2']);
mycoolfloor3.generate();
  
//Floor 4:
items = [];
gooditems = [themes.pop()];

otherstuff = [health()];
goodotherstuff = [
  trade(["any"], [themes.pop()])
];

var mycoolfloor4 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor4.theme = rand(['xmas3']);
mycoolfloor4.generate();
  
//Floor 5:
items = [];
items.push(colours.pop());
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [
  upgrade(),
  shop(["upgrade", themes.pop(), "health"], [4, 4, 4])
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