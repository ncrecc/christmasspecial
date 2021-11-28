// robbed at gunpoint from mystic (posted as a public resource). thx mystic! https://discord.com/channels/423894813646127114/473868039167934464/774048204471533588
/* four minor changes:
   - countdown is reduced to 6 and has a 6 placed in it if run for player (apparently that doesn't work for enemy)
   - uses e.animate("snap") instead of manually recreating snap anim without locale
   - returns true if card was successfully snapped
   - will de-assign any dice already in the card
*/

// Activates a piece of equipment for free.
// Argument 1 - The equipment that needs to be activated.
// Argument 2 - Set to true if the Snap! animation should be played.

var e = args[0];
e.shockedsetting = 0;
e.positionshockslots();
var slotsFilled = false;
if (e.countdown > 0 && e.slots.indexOf("COUNTDOWN") > -1) {
    if(e.equippedby == null || !e.equippedby.isplayer) {
        e.remainingcountdown = 0;
        e.reducecountdownby = 0;
    }
    else {
        if(e.remainingcountdown > 6) e.remainingcountdown = 6;
        var newdice = new elements.Dice();
        newdice.basevalue = e.remainingcountdown;
        self.dicepool.push(newdice);
        e.assigndice(newdice);
        //this doesn't work if you have a card with two countdown slots, but if you have a card with two countdown slots, screw off
    }
}
var newdice = [];
var total = e.needstotal > 0 ? e.needstotal : 9999;
if (e.slots.length > 0) e.removedice();
if (e.slots.length > 0) for (slot in e.slots) {
    var d = 0;
    switch (slot) {
        case "NORMAL": d = 6;
        case "MIN2": d = 6;
        case "MIN3": d = 6;
        case "MIN4": d = 6;
        case "MIN5": d = 6;
        case "MIN6": d = 6; //???
        case "MAX6": d = 6; //??????
        case "REQUIRE6": d = 6;
        case "EVEN": d = 6;
        case "DOUBLES": d = 6;
        case "MAX5": d = 5;
        case "ODD": d = 5;
        case "REQUIRE5": d = 5;
        case "RANGE25": d = 5;
        case "RANGE35": d = 5;
        case "RANGE45": d = 5;
        case "MAX4": d = 4;
        case "REQUIRE4": d = 4;
        case "RANGE24": d = 4;
        case "RANGE34": d = 4;
        case "MAX3": d = 3;
        case "REQUIRE3": d = 3;
        case "RANGE23": d = 3;
        case "MAX2": d = 2;
        case "REQUIRE2": d = 2;
        case "MAX1": d = 1;
        case "REQUIRE1": d = 1;
    }
    d = d < total ? d : total;
    total -= d;
    newdice.push(d);
}
var c = 0;
if (newdice.length > 0) {
    slotsFilled = true;
    for (d in newdice) {
        if (d != 0) {
            var mydice = new elements.Dice();
            mydice.basevalue = d;
            self.dicepool.push(mydice);
            e.assigndice(mydice, c);
            //mydice.assigned = e; redundant
        }
        c++;
    }
}
if (e.countdown == 0 && slotsFilled) e.doequipmentaction(self, target, (self.isplayer ? 1 : -1), e.assigneddice);
e.animate("flashandshake");
if (args[1]) e.animate("snap");
if (e.countdown > 0 || slotsFilled) return true;