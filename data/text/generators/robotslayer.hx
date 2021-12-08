var robotitems = shuffle(["Bunker Buster", "Binary Code", "Encryption", "Password", "Dice Printer", "Back Up Drive", "Risky Bet", "Antivirus", "Copy Machine", "Cooling Dagger", "The Deal Offer"]);
var jestershops = shuffle(["Doom and Gloom", "Pip Master", "Christmas Pistol","Blighted Zap", "Christmas Revolver", "Nine Iron", "Shrug", "Gatling Pea", "Brace", "Pocket Protector", "Electric Arc", "Rock Crusher", "Dime", "Bloody Drill", "Power Glove", "Frosty Bufu", "Dynamite Shotgun", "Sandbag", "Asklepios", "Matchbook"]);
var strangeshop = shuffle(["Bet", "Wide Spatula", "Ice Skates", "Quake Sigma", "Sickle", "Dazzler", "Cactus Cauldron"]);
var awesomelist = shuffle(["Doom and Gloom", "Christmas Pistol","Countvalanche", "Roulette", "AC Unit", "Christmas Revolver", "Flame Lance", "Poison Sting", "Power Glove", "Ukulele", "Shovel Blade", "Lucky Punch"]);
var floor2gooditem = shuffle(["Budge", "Pip Master"]);
var floor3item = shuffle(["Bunker Buster", "Binary Code", "Encryption", "Password", "Dice Printer", "Back Up Drive", "Risky Bet", "Antivirus", "Copy Machine", "Cooling Dagger", "The Deal Offer", "Parry", "Double Parry", "Lightreaver", "Minigun", "Shielding Potion", "The Monarch", "Innovate"]);
var floor5item = shuffle(["Bunker Buster", "Binary Code", "Encryption", "Password", "Dice Printer", "Back Up Drive", "Risky Bet", "Antivirus", "Copy Machine", "Cooling Dagger", "The Deal Offer", "Parrying Sword", "Parrying Claw", "Locket", "False Swipe", "The Monarch", "Biohazard"]);
var vampireitem = ["Silver Sword"];

var bosses = ["Mega Snowman", "Ultra Mariah Carey"];
bosses = shuffle(bosses);

usestandardenemies(false);

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [robotitems.pop(),awesomelist.pop(),floor3item.pop()];
gooditems = [awesomelist.pop(),pick(floor2gooditem),pick([awesomelist.pop(), strangeshop.pop()]),vampireitem.pop(),robotitems.pop(),robotitems.pop()];
otherstuff = [];
goodotherstuff = [shop(shuffle([jestershops.pop(), strangeshop.pop(), jestershops.pop()])),upgrade(),shop(shuffle(["upgrade", jestershops.pop(), strangeshop.pop()])),upgrade()];

addfloor("chestandshops")
  .additems(items, gooditems)
  .setlocation("boss")
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("boss")
  .addenemies([bosses.pop()], [])
  .setlocation("boss")
  .generate();
  
