//initialization for the "reverse emulation" equipment
var self = args[0];
var target = args[1];
var e = args[2];

e.scriptrunner = null;
e.removetag("cannotreuse");
e.setvar("sourceequipment",e);
var gadgetname = "Broken Gadget";
if(target != null && target.lastequipmentused != null) {
  gadgetname = target.lastequipmentused.gadget;
  self.resetvar("lastenemygadget");
}
else {
  if(self.varexists("lastenemygadget")) {
    gadgetname = self.getvar("lastenemygadget");
  }
}
//if(gadgetname == "Steal" || gadgetname == "Reversal" && e.totalusesremaining > 0) gadgetname = "Broken Gadget"; //leftover from the overhaul intended for reunion inventor. reunion inventor is based on inevitability of rust, where multiuse equipment doesn't play nice with giveequipment

var realgadget = new elements.Skill(gadgetname);
if(realgadget.description.indexOf("(once)") != -1) {
  e.onceperbattle = true;
}
e.fulldescription = "[quote]" + gadgetname + "[quote][newline]" + realgadget.description;
e.castdirection = -1;
if(realgadget.script.indexOf("/*casts backward for reverse emulation*/") == -1) {
  var cfterms = ["attack(","sfxdamage(target","drain(","inflict(","\",target,self,"];
  for(term in cfterms) {
    if(realgadget.script.indexOf(term) != -1) {
      e.castdirection = 1; break;
    }
  }
}

if(gadgetname == "Steal" || gadgetname == "Reversal") e.castdirection = 1;

if(gadgetname == "Gadget Roll" || gadgetname == "Mirror Smash") {
  e.usesleft = 3;
}

e.maintainfury = false;
e.preventdefault = false;
if(realgadget.script.indexOf("inflictself(FURY") != -1 || realgadget.script.indexOf("giveequipment") != -1) {
  e.maintainfury = true; e.preventdefault = true;
}
if(realgadget.script.indexOf("giveequipment") != -1) {
  e.addtag("cannotreuse");
}

var equipmentscript = "";
var specialcases = ["Phillips Head","Underwhelm"];
if(specialcases.indexOf(gadgetname) != -1) {
  if(gadgetname == "Phillips Head") {
    equipmentscript = "
      if(self.getvar(\"usedalready\") == 0) {
        attack(3);
        sfxdamage(target,3);
        self.setvar(\"usedalready\",1);
      } else {
        attack(6); sfxdamage(target,6);
      }
    ";
  }
  if(gadgetname == "Underwhelm") {
    equipmentscript = "
      if(!self.getvar(\"torrentunderwhelm\") > 0) {
        self.setvar(\"torrentunderwhelm\",5);
      }
      attack(self.getvar(\"torrentunderwhelm\"));
      sfxdamage(target,self.getvar(\"torrentunderwhelm\"));
      if(self.getvar(\"torrentunderwhelm\") > 1) {
        self.setvar(\"torrentunderwhelm\",self.getvar(\"torrentunderwhelm\")-1);
      }
    ";
  }
}
else {
  equipmentscript = realgadget.script;
  equipmentscript = equipmentscript.split("Gadget.changegadget(").join("//Gadget.changegadget(");
}
e.script = "
  if(!simulation) {
    var soundgadget = new elements.Skill(\"" + gadgetname + "\");
    soundgadget.script = \"\";
    soundgadget.execute(self,target); //kludge so that any manually defined sound effect for the gadget will play
  }
" + equipmentscript;