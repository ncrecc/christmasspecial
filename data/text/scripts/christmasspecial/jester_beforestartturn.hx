//Written by Titku of the Wibi system. That sounds exotic, huh?

var f = args[0];

var chainable = [];
for(eq in self.equipment) {
	eq.removetag("alreadyunchained");
	if(eq.skillcard == "" && !eq.hastag("immunetochain")) {
		chainable.push(eq);
	}
}

if(!f.getvar("wj-initialized")) {
	if(chainable.length > 0) {
		for(i in 0...chainable.length) {
			chainable[i].addtag("chained");
			f.setvar("wj-initialized",1);
		}
	}
}

if(chainable.length > 0) {
	for(eq in chainable) {
		if(eq.hastag("chained")) {
			runscript("christmasspecial/chainunavailable",[f,eq,false]);
		}
	}
}
runscript("christmasspecial/jester_dochaining", [self]);