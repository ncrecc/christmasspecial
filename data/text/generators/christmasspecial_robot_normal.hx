function setuprobotpuzzleenemy(enemy, newhp){
  Rules.changeenemyequipment(enemy, ['Wrong Answer']);
  Rules.changeenemydice(enemy, 1);
  Rules.changeenemyhp(enemy, newhp);
  Rules.changeenemyinnate(enemy, []);
}

setuprobotpuzzleenemy('Frog', 14);
setuprobotpuzzleenemy('Baby Squid', 16);
setuprobotpuzzleenemy('Kraken', 22);
setuprobotpuzzleenemy('Banshee', 19);
setuprobotpuzzleenemy('Cornelius', 42);
setuprobotpuzzleenemy('Buster', 105);

var locations = ['GAMESHOW', 'GROTTO', 'DUNGEON', 'CASTLE', 'MOUNTAIN'];
locations = shuffle(locations);

//Floor 1
addfloor('witchhalloween1')
  .setlocation(locations.pop())
  .addenemies(['Frog'], [])
  .generate();
  
//Floor 2:
addfloor('witchhalloween2')
  .setlocation(locations.pop())
  .addenemies(['Baby Squid'], [])
  .generate();

//Floor 3:
addfloor('witchhalloween3')
  .setlocation(locations.pop())
  .addenemies(['Kraken'], [])
  .generate();
  
//Floor 4:
addfloor('witchhalloween4')
  .setlocation(locations.pop())
  .addenemies(['Banshee'], [])
  .generate();
  
//Floor 5:
addfloor('witchhalloween1')
  .setlocation(locations.pop())
  .addenemies(['Cornelius'], [])
  .generate();

//Floor 6:
addfloor('witchhalloween6')
  .setlocation('ICE')
  .addenemies(['Buster'], [])
  .generate();