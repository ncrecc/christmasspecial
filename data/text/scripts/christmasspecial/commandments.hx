var forbiddendice = rand([
	["odds", [1,3,5]],
	["evens", [2,4,6]],
	["1s",[1]],
	["2s",[2]],
	["3s",[3]],
	["4s",[4]],
	["5s",[5]],
	["6s",[6]]
]);
self.setvar("forbiddendice", forbiddendice);
var bonuses = [];
if (args[0] == ALL || args[0] == "status") {
	bonuses = bonuses.concat([
		["burn all enemy dice.", "inflict(FIRE, ALL)"],
		["roll a 6 next turn.", "inflictself(\"stash6\"); inflictself(\"illuminate\")"],
		["freeze 2 enemy dice.", "inflict(ICE, 2)"],
		["shock and[newline]weaken enemy.", "inflict(WEAKEN); inflict(SHOCK);"],
		["enemy loses a dice.", "inflict(\"losedice\")"],
	]);
}
if (args[0] == ALL || args[0] == "damage") {
	bonuses = bonuses.concat([
		["do [sword]5 damage.", "attack(5)"],
		["heal [heal]5 hp.", "attackself(-5)"]
	]);
}
var bonus = rand(bonuses);
self.setvar("commandbonus",bonus);
return "If you don't use " + forbiddendice[0] + " this[newline]turn, " + bonus[0];