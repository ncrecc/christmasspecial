var jestershops = shuffle(["Sly Wink","Grim Look","Cheeky Look","Look Away!", "Disgusted Look", "Pip Master", "Blink", "Wink", "Ho Ho Ho", "Eyebrow Raise", "Cold Stare", "Smirk", "Gentle Smile", "Concerned Look", "Tasty Treat", "Emote"]);
var strangeshop = shuffle(["Sly Wink","Grim Look","Cheeky Look","Look Away!", "Disgusted Look", "Pip Master", "Blink", "Wink", "Ho Ho Ho", "Eyebrow Raise", "Cold Stare", "Smirk", "Gentle Smile", "Concerned Look", "Tasty Treat", "Emote"]);
var awesomelist = shuffle(["Sly Wink","Grim Look","Cheeky Look","Look Away!", "Disgusted Look", "Pip Master", "Blink", "Wink", "Ho Ho Ho", "Eyebrow Raise", "Cold Stare", "Smirk", "Gentle Smile", "Concerned Look", "Tasty Treat", "Emote"]);
var floor2gooditem = shuffle(["Budge", "Pip Master"]);
var floor3item = shuffle(["Sly Wink","Grim Look","Cheeky Look","Look Away!", "Disgusted Look", "Lightreaver", "Pip Master", "Blink", "Wink", "Ho Ho Ho", "Eyebrow Raise", "Cold Stare", "Smirk", "Gentle Smile", "Concerned Look", "Tasty Treat", "Emote"]);
var floor5item = shuffle(["Sly Wink","Grim Look","Cheeky Look","Look Away!", "Disgusted Look", "Pip Master", "Blink", "Wink", "Ho Ho Ho", "Eyebrow Raise", "Cold Stare", "Smirk", "Gentle Smile", "Concerned Look", "Tasty Treat", "Emote"]);
var vampireitem = ["Silver Sword"];



usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [];
gooditems = [awesomelist.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
items = [];
gooditems = [floor2gooditem.pop()];
otherstuff = [health()];
goodotherstuff = [shop([jestershops.pop(), jestershops.pop(), jestershops.pop()])];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items.push(floor3item.pop());
gooditems = [pick(["Eye Contact"])];

otherstuff = [health(), health()];

goodotherstuff = [
  shop([jestershops.pop(), jestershops.pop(), jestershops.pop()]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [awesomelist.pop()];

otherstuff = [health()];
goodotherstuff = [
  trade(["any"], [awesomelist.pop()])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
items.push(floor5item.pop());
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [
  upgrade(),
  shop(["health", strangeshop.pop(), "health"], [4, 4, 4])
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