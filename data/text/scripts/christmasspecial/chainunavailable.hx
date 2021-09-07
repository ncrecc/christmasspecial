//Written by Titku of the Wibi system.
var f = args[0];
var e = args[1];
var note = args[2];

e.availablethisturn = false;
e.unavailabletext = e.displayname + e.namemodifier;
e.unavailabledetails = e.fulldescription.split("|");
for(i in 0...e.unavailabledetails.length) {
	var power = e.getpower();
	if(!e.countdown > 0) {
		if(power == 0) { 
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<d6>").join("[d6]");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<double>").join("2x[d6]");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<triple>").join("3x[d6]");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<quadruple>").join("4x[d6]");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<quintuple>").join("5x[d6]");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<evendice_d6>").join("[d6]");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<odddice_d6>").join("[d6]");
		} else {
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<d6>").join("[d6] + " + power);
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<double>").join("2x([d6] + " + power + ")");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<triple>").join("3x([d6] + " + power + ")");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<quadruple>").join("4x([d6] + " + power + ")");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<quintuple>").join("5x([d6] + " + power + ")");
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<evendice_d6>").join("[d6] + " + power);
			e.unavailabledetails[i] = e.unavailabledetails[i].split("<odddice_d6>").join("[d6] + " + power);
		}
	} else {
		e.unavailabledetails[i] = e.unavailabledetails[i].split("<d6>").join("" + power);
		e.unavailabledetails[i] = e.unavailabledetails[i].split("<double>").join("" + (power * 2));
		e.unavailabledetails[i] = e.unavailabledetails[i].split("<triple>").join("" + (power * 3));
		e.unavailabledetails[i] = e.unavailabledetails[i].split("<quadruple>").join("" + (power * 4));
		e.unavailabledetails[i] = e.unavailabledetails[i].split("<quintuple>").join("" + (power * 5));
	}
}
if(note) {
	e.unavailabletext = "[openbracket]" + e.unavailabletext + "[closebracket]";
}
e.addtag("chained");