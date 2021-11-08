var _self = args[0];
var _target = args[1];

var myequipment = getequipmentlist(_self, [], ["skillcard"]);
var enemyequipment = getequipmentlist(_target, [], []); 

var myeq = [];
var enemyeq = [];
enemyequipment = shuffle(enemyequipment);
myequipment = shuffle(myequipment);
for(i in enemyequipment){
  var xeq = enemyequipment.pop();
  if(xeq && xeq.usedthisbattle) {};
  else enemyeq.push(xeq);
} 
enemyequipment = shuffle(enemyequipment);
myequipment = shuffle(myequipment);
for(i in myequipment){
  var yeq = myequipment.pop();
  if(yeq && yeq.usedthisbattle) {};
  else myeq.push(yeq);
} 
enemyeq = rand(enemyeq);
myeq = rand(myeq);

removeequipment(enemyeq, _self); 
removeequipment(myeq, _target); 

giveequipment(enemyeq, 1, false);
var eneq = target.equipment;
trace(eneq);

animateequipmentintoplace(_self);
