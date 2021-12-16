var script = new elements.DiceyScript('
if (self.dicepool.length == 0) {
	return;
}
var type = args[0];
var e = args[1];
var trailer = args[2];

var odds = false;
var evens = false;
var forbiddendicepool = [];
for (dice in self.dicepool) {
	forbiddendicepool.push([dice + "s", [dice.basevalue]]);
	if (dice % 2 == 1) {
		odds = true;
	} else {
		evens = true;
	}
}
if (odds) {
	forbiddendicepool.push(["odds", [1,3,5]]);
}
if (evens) {
	forbiddendicepool.push(["evens", [2,4,6]]);
}
// forbiddendice has a distribution skewed towards the values the player has the
// most of. Also, "odds" and "evens" are rarer. This is all intentional.
var forbiddendice = rand(forbiddendicepool);
self.setvar("forbiddendice", forbiddendice);
var bonuses = [];
if (type == "all" || type == "status") {
	bonuses = bonuses.concat([
		["burn all enemy dice.", "inflict(FIRE, ALL);"],
		["freeze 2 enemy dice.", "inflict(ICE, 2);"],
		["shock and[newline]weaken enemy.", "inflict(WEAKEN); inflict(SHOCK);"],
		["lock 1 enemy dice.", "inflict(LOCK);"],
		["snap an item.", "inflictself(\'ncr_snap\');"]
	]);
}
if (type == "all" || type == "damage") {
	bonuses = bonuses.concat([
		["do [sword]4 damage.", "attack(4);"],
		["snap an item.", "inflictself(\'ncr_snap\');"],
		["inflict 2 poison", "inflict(POISON, 2);"],
		["inflict [powerdown]1 powerdown", "inflict(\'Powerdown\');"],
		["inflict [bleed]2 bleed", "inflict(\'bleed\', 2);"]
	]);
}
if (type == "all" || type == "dice") {
	bonuses = bonuses.concat([
		["lock 1 enemy dice.", "inflict(LOCK);"],
		["roll a 6 next turn.", "inflictself(\'stash6\'); inflictself(\'illuminate\');"],
		["snap an item.", "inflictself(\'ncr_snap\');"],
		["roll all 6s next turn.", "inflictself(\'all6\');"],
		["roll a dice next turn.", "var d = rand([1,2,3,4,5,6]); inflictself(\'stash\' + d); inflictself(\'illuminate\');"]
	]);
}
if (type == "all" || type == "health") {
	bonuses = bonuses.concat([
		["heal [heal]5 hp.", "attackself(-5);"],
		["gain [grace]2 regeneration", "inflictself(\'regeneration\', 2);"],
		["inflict [powerdown]1 powerdown", "inflict(\'Powerdown\');"],
		["gain [heal]fireplace", "inflictself(\'fireplace\');"],
		["inflict [heart]too sweet", "inflict(\'Too Sweet\');"]
	]);
}
var bonus = rand(bonuses);
self.setvar("commandbonus",bonus);
e.fulldescription =
	"If you don\'t use " + forbiddendice[0] + " this[newline]turn, "
	+ bonus[0] + trailer
;
act.stop();
');
var act = new motion.actuators.SimpleActuator(null, 0, null);
script.set("self", self);
script.set("args", args);
script.set("rand", rand);
script.set("act", act);
act.onRepeat(script.execute, []);
act._repeat = -1;
act.move();
self.setvar("commandmentact", act);