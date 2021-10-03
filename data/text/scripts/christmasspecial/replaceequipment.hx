//DEPRECATED, DO NOT USE OUTSIDE OF VERY RARE CASES WHERE A NEW EQUIPMENT ABSOLUTELY HAS TO BE INSTANTIATED

var self = args[0];
var neweq = args[1];
var replaceeq = args[2];
var inherituses = args[3];
var inheritcardeffects = args[4];

neweq.row = replaceeq.row;
neweq.column = replaceeq.column;
neweq.x = replaceeq.x;
neweq.y = replaceeq.y;
self.equipment[self.equipment.indexOf(replaceeq)] = neweq;