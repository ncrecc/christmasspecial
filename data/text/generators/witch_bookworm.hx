var commonlist_basic = shuffle(["Enchanted Armor", "Spiked Coffin", "Blue Ocean", "Fear Ocean", "Christmas Bells"]);
var commonlist_offensive = ["Candy Steal","Cold Burn","Winds Of Winter","Enchanted Bolt","Christmas Star","Glass Dust","Staff Hilt"];
var commonlist_dicemanipulation = ["Coffee Pot", "Stew Pot", "Spring Equinox","Overwinter","Wide Divide","Confetti"];
var cursedlist = shuffle(["Luck Omen", rand(["Cold Snap", "Sun Beam", "Moon Beam"]), "Dragon Dust", "Sultry Winds", "Chilly Pepper", "Christmas Star"]);

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [commonlist_basic.pop(),commonlist_basic.pop()];
gooditems = [commonlist_basic.pop()];
otherstuff = [];
goodotherstuff = [];
var mycoolfloor1 = addfloor('big').additems(items, gooditems);
mycoolfloor1.theme = rand(['xmas1']);
mycoolfloor1.generate();

//Floor 2:
commonlist_dicemanipulation = shuffle(commonlist_dicemanipulation);
commonlist_offensive = shuffle(commonlist_offensive);
		
items = ["Path Spell 1"]; //Must be a dice/mana manipulation or something
		
gooditems = ["Mirror Cauldron",commonlist_dicemanipulation.pop()];
otherstuff = [health(),health()];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), "Path Spell 2",  commonlist_basic.pop()]))]; //Must be a weapon or something

var mycoolfloor2 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.theme = rand(['xmas1']);
mycoolfloor2.generate();
  	
//Floor 3:
items = [commonlist_dicemanipulation.pop(),commonlist_offensive.pop()];
gooditems = ["Path Spell 3"]; //Must be a really good weapon or something
		
otherstuff = [health(), health()];

goodotherstuff = [shop(["Different Path 1", "Health", "Different Path 2"], [2, 3, 2])];  //Here you can pick another path!

var mycoolfloor3 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor3.theme = rand(['xmas2']);
mycoolfloor3.generate();
  
//Floor 4:
items = [commonlist_offensive.pop()];
gooditems = [cursedlist.pop()];
		
shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
		
otherstuff = [health(),health(),health()];

goodotherstuff = [shop(shuffle(["Path Spell 4", "Path Spell 5", "Path Spell 6"]), [3, 4, 3])]; //All three are equipments from different paths and/or cool spells for current path
		
var mycoolfloor4 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor4.theme = rand(['xmas3']);
mycoolfloor4.generate();
  
//Floor 5:
items = [];
gooditems = [commonlist_dicemanipulation.pop()];
otherstuff = [health(), health(), health()];
goodotherstuff = [shop(shuffle([cursedlist.pop(), "Path Spell 7", "Path Spell 8"]))]; //Multislot or countdown weapon from starter path and something from another
		
var mycoolfloor5 = addfloor('big').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor5.theme = rand(['xmas6']);
mycoolfloor5.generate();

//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("boss")
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
