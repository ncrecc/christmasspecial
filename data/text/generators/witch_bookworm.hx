var dicethings = [rand(["Budge","Nudge"]),"Vise Grip","Innovate","Vise Grip","Nudge","Dice Pump","Sine Wave","Sine Wave"];
var weirddicethings = ["Spanner",rand(["Skeleton Key","Giant Spatula"]),"Skeleton Key","Spatula","Candle","Candle","Saw Wave","Saw Wave","Berlin Key"];
var enchantedbolts = ["Enchanted Bolt","Enchanted Bolt","Sealing Stamp","Sealing Stamp","Enchanted Missile","Dragon Dust","Glass Dust"];
var shields = ["Magic Shield","Spirit Shield","Spirit Shield",rand(["Leather Armor","Cloak"]),"Leather Armor","Worm Scarf","Earth Shield","Forefront","Small Helmet"];
var missiles = ["Magic Missile","Christmas Star","Lucky 7","Lucky 7","Tetraphobia","Missing Score","Magic Axe","Berlin Blade","Magic Kapow","Detonator"];
var duplicatelike = ["Illuminate",rand(["Illuminate","Paper Lantern"]),rand(["Magic Key","Lockpick"]),"Magic Key",rand(["Master Key","Subdivide"]),"Subdivide","Signal Jammer","Shadow Dice",rand(["Doppeldice","Ungeradedice"]),rand(["Doppeldice","Doppeltwice"]),"Duplicate"])
var healings = ["Healing Crystal",rand(["Healing Crystal","Elastic Heart"]),rand(["Bandage","Plaster"]),"Life Drain","Bandage","Gumbal Machine","Gumbal Machine","Syringe","Thick Skin","Umbrella"];
var weirdspells = ["Infliction","Knitting Needle","Poison Needle","Antidote",rand(["Nunchucks","Sharp Spike"]),"Wrecking Ball",rand(["Magic Dagger","Push Knife"]),"Magic Dagger",rand(["Hex","Nightstick"]),rand(["Ignite","Cold Wind"]),"Icicle","Lighter","Hex","Cowbell",rand(["Capacitor","Blast Chiller","Furnace"]),"Slime Ball","Slime Ball",rand(["Matchstick","Weird Flame"]),"Weird Flame",rand(["Icecube","Snowflake"]),"Snowflake","Blood Let","Catastrophe","Fiasco",rand(["Determination","Secret Weapon"]),"Spring Equinox","Overwinter"];
var cauldrons = ["Cauldron","Silver Cauldron","Gold Cauldron","Rat","Silver Cauldron","Gold Cauldron",rand(["Rat","Locket"]),"Contact Juggling"];
var goodcauldrons = ["Half Moon Cauldron","Skewer","Lucky Star","Slingshot","Glass Cauldron","Sand Cauldron","Glass Cauldron","Sand Cauldron","Crucible","Blood Cauldron","Blood Cauldron","Polarized Cauldron","Pulsing Cauldron","Bronze Cauldron","Bronze Cauldron","Bronze Bowl","Bumpblade"];
var requirexspells = ["Fury Spell","Fury Spell","Sludge Spear","Iron Armor","Magic Barrier","Sheer Wall","Teleport Spell","Magic Spear","Magic Spear","Hall of Mirrors","Hookshot","Starspear","Sword Hilt"];
var counterspelllikes = ["Counter Spell","Parrying Dagger","Embargo@fd"];
var goodshopcontents = ["Lightning Bolt","Inferno","Blizzard", "Shockwave","Raw Energy"];
var strongspells = [rand(["Absolute Zero", "Meteor"]), rand(["Kite Shield","First Aid Kit","Blight"])];
var floor2items = ["Mirror Cauldron"];
var finespells = [rand(["Electric Shock","Electric Shock","Sheer Will"]), rand(["Ice Shard","Ice Shard","Trident"]), rand(["Sonic Wave","Sonic Wave","Venus Gospel"]), rand(["Burning Light","Burning Light","Pitchfork"]),rand(["Princess Guard","Fishing Net"])];
var vampireitems = ["Wooden Stake"];
var myitempools = [dicethings, weirddicethings, enchantedbolts, shields, missiles, duplicatelike, healings, weirdspells, cauldrons, goodcauldrons, requirexspells, counterspelllikes, goodshopcontents, counterspelllikes, goodshopcontents, strongspells, floor2items, finespells, vampireitems];
shuffle(dicethings);
shuffle(weirddicethings);
shuffle(enchantedbolts);
shuffle(shields);
shuffle(missiles);
shuffle(duplicatelike);
shuffle(healings);
shuffle(weirdspells);
shuffle(cauldrons);
shuffle(goodcauldrons);
shuffle(requirexspells);
shuffle(counterspelllike);
shuffle(goodshotcontents);
shuffle(strongspells);
shuffle(floor2items);
shuffle(finespells);


usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [shields.pop(),missile.pop()];
gooditems = [dicethings.pop()];
otherstuff = [];
goodotherstuff = [];
var mycoolfloor1 = addfloor('big').additems(items, gooditems);
mycoolfloor1.theme = rand(['xmas1']);
mycoolfloor1.generate();

//Floor 2:
items = [weirdspells.pop()];
gooditems = ["Mirror Cauldron",dicethings.pop()];
otherstuff = [health(),health()];

goodotherstuff = [
  shop(shuffle([rand(enchantedbolts.pop(),duplicatelike.pop()]), rand([healings.pop,weirdspells.pop()]),  rand([missiles.pop(),shields.pop()])]))];

var mycoolfloor2 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor2.theme = rand(['xmas1']);
mycoolfloor2.generate();
  	
//Floor 3:
items = [rand([weirddicethings.pop(),cauldrons.pop()]),rand([weirdspells.pop(),duplicate.pop()])];
gooditems = [requirexspells.pop()];
		
otherstuff = [health(), health()];

goodotherstuff = [shop([goodshopcontents.pop(), "Health", goodshopcontents.pop()], [2, 3, 2])];

var mycoolfloor3 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor3.theme = rand(['xmas2']);
mycoolfloor3.generate();
  
//Floor 4:
items = [weirdspells.pop()];
gooditems = [goodcauldrons.pop()];
		
shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
		
otherstuff = [health(),health(),health()];

goodotherstuff = [shop(shuffle([weirdspells(),weirddicethings(), rand([enchantedbolts.pop(),counterspells.pop()])]), [3, 4, 3])];
		
var mycoolfloor4 = addfloor('normal').additems(items, gooditems).addotherstuff(otherstuff, goodotherstuff);
mycoolfloor4.theme = rand(['xmas3']);
mycoolfloor4.generate();
  
//Floor 5:
items = [];
gooditems = [commonlist_dicemanipulation.pop()];
otherstuff = [health(), health(), health()];
goodotherstuff = [shop(shuffle([strongspells.pop, enchantedbolts.pop, finespells.pop])),shop(shuffle([strongspells.pop, missiles.pop, finespells.pop]))];
		
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
