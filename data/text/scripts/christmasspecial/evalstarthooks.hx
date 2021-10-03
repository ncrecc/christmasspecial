var self = args[0];
var target = args[1];
var eq = args[2];
var dobefcomb = true;
if(args[3] != null && !args[3]) dobefcomb = false;
var dobefturn = true;
if(args[4] != null && !args[4]) dobefturn = false;
var doonturn = true;
if(args[5] != null && !args[5]) doonturn = false;
var dosparedice = true;
if(args[6] != null && !args[6]) dosparedice = false;

if(!dobefcomb && !dobefturn && !doonturn && !dosparedice) return;

self.setvar('evalstarthooks_eq',eq);
if(dobefcomb) {
  var dobefcombscript = new elements.Skill('Against all odds_old');
  dobefcombscript.script = 'var e = self.getvar(\'evalstarthooks_eq\'); ' + eq.scriptbeforecombat;
  dobefcombscript.execute(self,target);
}
if(dobefturn) {
  var dobefturnscript = new elements.Skill('Against all odds_old');
  dobefturnscript.script = 'var e = self.getvar(\'evalstarthooks_eq\'); ' + eq.scriptbeforestartturn;
  dobefturnscript.execute(self,target);
}
if(doonturn) {
  var doonturnscript = new elements.Skill('Against all odds_old');
  doonturnscript.script = 'var e = self.getvar(\'evalstarthooks_eq\'); ' + eq.scriptonstartturn;
  doonturnscript.execute(self,target);
}
self.resetvar('evalstarthooks_eq');
//this line currently causes a "self is a null object or operating on a null object" error for some reason?? must be part of the createsparedice function somehow because everything else relating to self works fine
//if(dosparedice) self.createsparedice(eq);