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
	if(chainable.length > 0) chainable[0].addtag("alreadyunchained");
	if(chainable.length > 1) {
		for(i in 1...chainable.length) {
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