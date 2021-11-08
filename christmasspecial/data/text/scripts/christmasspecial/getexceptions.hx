var self = args[0];
var opb = args[1];
var exceptions = ['skillcard','excludefromrandomlists','alternateversion','robotonly','witchonly','inventoronly','jesteronly'];
if(opb) exceptions.push('onceperbattle');
if(self.layout != 'DECK') {
  if(self.usecpuinsteadofdice) exceptions.remove('robotonly');
  if(self.getskillcard().skillcard == 'witch') exceptions.remove('witchonly');
  if(self.getskillcard() != null && self.getskillcard().skillcard == 'inventor') exceptions.remove('inventoronly');
} else exceptions.remove('jesteronly');
return exceptions;