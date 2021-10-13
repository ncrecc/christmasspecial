var f = args[0];

var dosound = false;
if(f.equipment.length > 0 && f.layout != "DECK") {  
  var eqlist = [];
  var exceptions = ["skillcard", "excludefromrandomlists", "onceperbattle", "alternateversion", "immunetotide"];
  exceptions = exceptions.concat(runscript('christmasspecial/getexceptions',[f]));
  var allequipmentlarge = getequipmentlist(null,['large'],exceptions);
  allequipmentlarge.sort(function(a,b) return a > b ? 1 : -1);
  var allequipmentsmall = getequipmentlist(null,['small'],exceptions);
  allequipmentsmall.sort(function(a,b) return a > b ? 1 : -1);
  for(eq in f.equipment) {
    if(eq.skillcard == "" && eq.isready(true) && !eq.temporary_thisturnonly && eq.onscreen() && !eq.hastag("skillcard") && !eq.hastag("immunetotide")) {
      eqlist.push(eq);
    }
  }
  if(eqlist.length > 0) {
    for(choseneq in eqlist) {
      var allequipment = [];
      if(choseneq.size > 1) { allequipment = allequipmentlarge; }
      else { allequipment = allequipmentsmall; }
      var myindex = allequipment.indexOf(choseneq);
      if(myindex == -1 || myindex == allequipment.length - 1) continue;
      /*
      trace(allequipment[myindex]);
      trace(allequipment[myindex + 1]);
      */
      var neweq = new elements.Equipment(allequipment[myindex + 1]);
      runscript("christmasspecial/replaceequipment",[f,neweq,choseneq]);
      runscript("christmasspecial/evalstarthooks",[f,target,neweq]);
      neweq.animate("flashandshake");
      dosound = true;
    }
  } else {
    f.textparticle("No effect!");
  }
} else {
  f.textparticle("No effect!");
}
if(dosound) sfx("upgradeequipment");