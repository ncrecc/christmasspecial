var f = args[0];
var red = new elements.Equipment("Fireball").equipmentcol; 
var firstattack = true;

var shocklist:Array<Equipment> = [];
for (i in 0 ... f.equipment.length){
	if(f.equipment[i].equipmentcol != red) {
	}else if (f.equipment[i].skillcard != ""){
	}else if (f.equipment[i].onceperbattle && f.equipment[i].usedthisbattle){
	}else if (!f.equipment[i].availablethisturn){
	}else if (f.equipment[i].shockedsetting >= 1){
	}else if (f.equipment[i].currentlyreducingcountdown()){
	}else if (f.equipment[i].containsadicealready()){
	}else if (f.equipment[i].hastag("shockavoid")){
	}else if (!f.equipment[i].ready){
	}else if (f.equipment[i].applyequipmentstatus == ""){
		shocklist.push(f.equipment[i]);
	}
}

shuffle(shocklist);
trace("shocklist: " + shocklist);

while (shocklist.length > 0){
	var randequipment:Equipment = shocklist.pop();
	if (randequipment.hastag("shockimmune")){
		randequipment.applyequipmentstatus = "shockimmune";
	}else{
		if(randequipment.shockedsetting == 0) {
			randequipment.shockedsetting = 1;
			randequipment.shockedtext = "Place a dice to|release redshift";
			randequipment.shockedcol = "red";
			randequipment.shocked_showtitle = true;
			randequipment.positionshockslots();
			var newanimation:Animation = new elements.Animation();
			newanimation.applytoequipment(randequipment);
			randequipment.animation.push(newanimation);
			//newanimation.addcommand("flash", 0.1);
			randequipment.animate("flash");
			if(firstattack)	{ 
				newanimation.addcommand("soundevent", "apply_shock_to_equipment");
				firstattack = false;
			}
			newanimation.addcommand("textparticle", "[redshift] Redshifted!", 16604780);
		}
	}
}