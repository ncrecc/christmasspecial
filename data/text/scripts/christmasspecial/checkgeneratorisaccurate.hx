//by diane, as with broken downgrade tester & broken upgrade tester
var myitempools = args[0];

var allitems = getequipmentlist();

trace("scanning for missing items");
for(pool in myitempools) {
	if(pool.length > 0) for(entry in pool) {
		if(allitems.indexOf(entry) == -1) {
			trace(entry + " is not an item");
		}
	}
}
trace("scan complete");