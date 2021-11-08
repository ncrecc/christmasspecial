//Written by Titku of the Wibi system. Todo! For spoofing Shock and Weaken, since those won't work normally. Plan is to replace Shock and Weaken with fake statuses visually identical to them, but which are changed to accommodate for WJester in particular since most of their equipment at any given time is unavailable.
//fUCK IT I'M WRITING THIS -GEDDY
//okay, written by titku, geddy, & diane total

var f = args[0];

//pSEUDOCODE DRAFTING WHICH WHY THE FUCK DOESN'T SHE DO THIS
/*
GONNA JUST COVER EVERY PART OF THIS

bEFORE START TURN YOU FIND SHOCK AND WEAKEN, REMOVE THEM, AND THEN QUIETLY PLACE IN THEIR FALSE VERSIONS WITH ADDSTATUS OR SOMETHING (MAKE SURE IT PIERCES ALT REDUCE)

oN START TURN IF WS IS PRESENT YOU WS ALL ACTIVE EQUIPMENT UNTIL ALL ACTIVE EQUIPMENT AT RANDOM IS EITHER WEAKENED OR SHOCKED
func doshock
 if list length == 0 return
 while shock over 0 and i < list length
  mark item in supplied list for shock randomly
  decrement shock
  increment i
func doweaken
 if list length == 0 return
 while weaken over 0 and i < list length
  mark item in supplied list for weaken randomly
  decrement weaken
  increment i

var activeequipment = get the active equipment duh
doshock(activeequipment)
doweaken(activeequipment)
iff excess
 var inactive equipment = the inactive equipment
 doshock(activeequipment)
 doweaken(activeequipment)
iff excess
 var unshockedactiveequipment
 for eq in activeequipment
  if it's not shocked
   unshockedactiveequipment.push(thatone)
 doshock(unshockedactiveequipment)
 var unweakenedactiveequipment
 for eq in activeequipment
  if it's not weakened
   unweakenedactiveequipment.push(thatone)
 doweaken(unweakenedactiveequipment)
iff still excess
 var unshockedinactiveequipment
 for eq in inactiveequipment
  if it's not shocked
   unshockedinactiveequipment.push(thatone)
 doshock(unshockedinactiveequipment)
 var unweakenedinactiveequipment
 for eq in inactiveequipment
  if it's not weakened
   unweakenedinactiveequipment.push(thatone)
 doweaken(unweakenedinactiveequipment)
*/

function doshock(list,f) {
 var i = 0;
 var amount = f.getstatus("wj_intshock");
 if(list.length > 0) shuffle(list);
 while(amount > 0 and i < list.length) {
  list[i].addtag("wj_shocktemp");
  list[i].animate("flashandshake");
  amount--;
  i++;
 }
 f.removestatus("wj_intshock",i);
};
function doweaken(list,f) {
 var i = 0;
 var amount = f.getstatus("wj_intweaken");
 if(list.length > 0) shuffle(list);
 while(amount > 0 and i < list.length) {
  list[i].addtag("wj_weakentemp");
  list[i].animate("flashandshake");
  amount--;
  i++;
 }
 f.removestatus("wj_intweaken",i);
};

var activeequipment = [for(eq in self.equipment) if(eq.isready(false)) eq];
doshock(activeequipment,f);
doweaken(activeequipment,f);

if(f.getstatus("wj_intshock") > 0 || f.getstatus("wj_intweaken") > 0) {
 var inactiveequipment = [for(eq in self.equipment) if(eq.isready(true) && !eq.availablethisturn) eq];
 doshock(inactiveequipment,f);
 doweaken(inactiveequipment,f);
}
if(f.getstatus("wj_intshock") > 0 || f.getstatus("wj_intweaken") > 0) {
 var unshockedactiveequipment = [for(eq in self.equipment) if(eq.isready(false) && !eq.hastag("wj_shocktemp")) eq];
 doshock(unshockedactiveequipment,f);
 var unweakenedactiveequipment = [for(eq in self.equipment) if(eq.isready(false) && !eq.hastag("wj_weakentemp")) eq];
 doweaken(unweakenedactiveequipment,f);
}
if(f.getstatus("wj_intshock") > 0 || f.getstatus("wj_intweaken") > 0) {
 var unshockedinactiveequipment = [for(eq in self.equipment) if(eq.isready(true) && !eq.availablethisturn && !eq.hastag("wj_shocktemp")) eq];
 doshock(unshockedinactiveequipment,f);
 var unweakenedinactiveequipment = [for(eq in self.equipment) if(eq.isready(true) && !eq.availablethisturn && !eq.hastag("wj_weakentemp")) eq];
 doweaken(unweakenedinactiveequipment,f);
}