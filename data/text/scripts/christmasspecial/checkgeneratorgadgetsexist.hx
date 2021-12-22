//by diane, as with broken downgrade tester & broken upgrade tester
var myitempools = args[0];

for(pool in myitempools) {
	if(pool.length > 0) for(entry in pool) {
		trace("creating skill for " + entry);
		var testskill = new elements.Skill(new elements.Equipment(entry).gadget);
		trace(testskill.name);
	}
}