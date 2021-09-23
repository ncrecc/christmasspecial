var commonlist_basic = ["Worm Scarf", "Pin Missile", "Decantation"];
var commonlist_offensive = [rand(["Blood Pact", "Regen Ale", "Bop Bop"]), "Sludge Spear", "Forbidden Magic", "Melon Cauldron", "Magic Axe", "Loud Yelling", "Precognition", "Cherry Bomb", "Head of Krampus"];
var commonlist_dicemanipulation = ["Smoke Signal", "Caustic Cauldron", "Polarized Cauldron", "Pulsing Cauldron", "Push Knife", "Mass Grimoire", "Locket"];
if(chance(20)){
  commonlist_dicemanipulation.push("Boiling Cauldron");
}else{
  commonlist_dicemanipulation.push(pick(commonlist_dicemanipulation));
}
var floor2items = [pick(["Fogged Mirror","Sacridice"])];
var floor2shop = ["Transporter"];

var goodshopcontents = ["Power Up", "Sludge Wave", "Enchanted Missile", "Magnum Opus", "Raw Energy"];
var floor5shop = ["Sealing Stamp", "Philosopher's Stone", "Sheer Will", "Molten Core", "Eternity Cannon"];
var vampireitems = ["Silver Sword@witch"];

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [commonlist_basic.pop()];
gooditems = [commonlist_basic.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist_dicemanipulation = shuffle(commonlist_dicemanipulation);
commonlist_offensive = shuffle(commonlist_offensive);
		
items = [];
		
gooditems = [floor2items.pop()];
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), floor2shop.pop(),  commonlist_basic.pop()]))
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  	
//Floor 3:
items = [commonlist_dicemanipulation.pop()];
gooditems = [commonlist_offensive.pop()];
		
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), "Health", commonlist_dicemanipulation.pop()]), [2, 3, 4])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [rand([commonlist_dicemanipulation.pop(), commonlist_offensive.pop()])];
		
shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
		
otherstuff = [
  health(),
  health(),
  health()
];

goodotherstuff = [
  shop(shuffle([goodshopcontents.pop(), goodshopcontents.pop(), "Health"]), [3, 4, 5])
];
		
addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle(
    [
      rand(floor5shop), 
      commonlist_offensive.pop(), 
      "Health"
    ]))
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