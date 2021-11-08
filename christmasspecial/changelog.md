10/23/2021 gost of wibi
- silver sword now only inflicts vampire on the target if they already had the vampire innate. wtf

10/23/2021 gost of wibi
hotfix again aren't we having such fun
- repast rapier and baseball bat no longer crash the game due to their statuses being missing
- added a damage indicator to burst beam (something i'd meant to do), however selfvars are completely broken in the latest build of dicey so i guess we'll see tomorrow if it works visually or not

10/23/2021 Reyder of Wibi, Black Widow of Wibi, gost of wibi
- Lady Luck and Warrior now no longer get Budge or Pip Master.
- Cape Deflect's upgrade is no longer a size reduce.
- Per Matt: fixed Lady Luck generator crashing due to shops still being generated.
- Fixed missing upgrade/downgrade type specifications on Polarized Cauldron, Pulsing Cauldron, and Earsplitter.
- Before Combat/Before Start Turn/On Start Turn scripts are now properly run when rerolling items as Warrior.
- Widow: Tagged Banhammer as excludefromrandomlists due to inconvenience from getting it as Warrior.
- gost: inventor generator implemented (with new items)
- gost: added two new currently unimplemented themecards: "a bat" (nailbatlike) and "a bonus" (passive item)

10/12/2021 Reyder of Wibi
Hotfix, woo!
- Lady Luck now uses a separate generator from Warrior.

10/12/2021 gost of wibi, Reyder of Wibi
- immunetotide items can no longer be rerolled into if you're warrior (their property is that they cannot be rerolled, so you could reroll into them and then not be able to reroll out)
- immunetotide items now resist catalog and cannot be catalog'd into
- a gun now actually works and has more inclusive criteria
- gave warrior a rudimentary generator
- fixed a typo in a tool's description
- added more items fitting a gun's query and a tool's query
- snowcloud now actually does double damage like it says it does
- card reroll now makes the `_thinghappens` sfx
- Added Matt's "Cape Deflect" item.
- Added mondaybear's Lady Luck art (with implementation by Matt).
- Added Matt's Lady Luck cutscene; a bit buggy at the moment.

10/4/2021 Diane and Black Widow of Wibi
- buffed slide (freeze on even instead of on 8, which was very rare)
- commented out traces from thesaurus.hx
- bear equipment is now marked excludefromrandomlists like the rest of the vanilla equipment
- marked spare parts as excludefromrandomlists
- marked some equipment that assumes it stays between turns as excludefromrandomlists
- technology and minigun are now consistent; technology's bonus depends on turn number rather than how many turns it's been in play
- fixed some themecards not being black
- present and the ghosts of christmas equipment preview now works
- fixed some missing reference stuff items
- Added Matt's new Lady Luck equipment.
- Buffed Divine Storm to CD9.

10/3/2021 diane of wibi
- readded tons of vanilla equipment that actually was being used
- warrior now starts with an "a blade" themecard that ensures he'll receive a normal-slot weapon
- warrior's gimmick now uses giveequipment instead of pushing equipment directly to self.equipment
- merged in new lady luck commandments/overworld stuff from matt and plok
- fixed warrior's gimmick not caring about themecards (e.g. A Weapon) after turn 1
- fixed crash due to missing falseswipe status
- fixed some missing sfx
- fixed items not being marked excludefromrandomlists that should
- wrapped the ghosts of christmas' "change form" script in if(!simulation)
- fixed a harmless error that would happen when warrior's "themesequipped" variable was length 0
- rewrote some statuses that decrease by 1 each turn to make it more clear that they do that
- made commandments loaded from a separate commandments.csv file
- fixed a crash that would happen when using bop bop due to https://github.com/TerryCavanagh/diceymodgeons/issues/59 (irony noted)

10/1/2021 diane of wibi
- !!purged all unused vanilla equipment!! with the rest being marked excludefromrandomlists
- rehauled warrior from the ground up
- added "rudy" enemy and his "redshift" status effect
- renamed "antler" item for lightning to "ram"
- updated credits.txt to not mention 2nd episodes
- fixed some jinx syntax to not use "%VAR%x2", instead taking the number that would be %VAR% and manually multiplying it by 2
- removed equipment for now unused jester 2
- added neypah's "endless winter" status and associated equipment (currently unused)

9/22/2021-10/1/2021
...bunch of stuff by plok and matt, who didn't update changelog.md; fill this in later...

9/22/2021 gost of wibi
- added a non-mana witch generator (currently witch 1) and several modded items to go with it. we plan to make a mana witch generator later; if neither episode will be non-mana then the mana generator will likely be built upon the non-mana generator
- minor grammatical changes

9/21/2021 geddy of wibi
- merged in inventor ep 2 and jester ep 2
- and various other shit that was present in the inventor ep 2 build, e.g. new victory.ogg
if i missed anything hollar it out and i'll add it. this is what happens when a lot of builds go by without one simple full changelog and no pull request

9/12/2021 Titku of Wibi
Hotfix. Er, patch. Hotpatch?
- Merged in Matt101's Pip Master redesign.
- Changed Pip Master's script, which didn't make sense with the previous description ("Do 1 damage per pip to dice", which I'm assuming means "Do damage equal to the absolute difference between the old and new dice", but only did 1 damage if the new dice was smaller or equal to the old dice and did damage equal to the difference otherwise?).
- Tidied up Pip Master's description.

9/12/2021 Titku of Wibi
- Added more Angelmoon themes (tradingpost, blacksmith, openchest, lowhealth).
- Merged in Green's Thief episode!
- Rewrote some character descriptions a little.
- Sorted the characters in characters.csv according to their vanilla placement.

9/9/2021 abagail of wibi
- flame whip now has an on dodge script
- added matt101's robot cutscene
- fixed What_s -equipment.csv about.txt's filename
- moved credits.txt out of data\text\
- credited matt101 for the jester1 concept in credits.txt
- deleted Winter Jester Todo.txt which is now contained in the github repo's issues page
- fixed grammar issue in last word that was fixed in last word+ ("survive the fatal blow" instead of "survive next fatal blow")
- fixed frosty bufu and burning agi's description (used `<d6>` instead of `<slotdoubles>` breaking consistency with other needs doubles items)
- finally did it. finally nerfed bloody drill+. now max2 but drains 2 for d6 turns instead of 1
- fixed text bleed on burning agi and frosty bufu
- made present shotgun size 2 (forgot to do this when making it max3 for balance; also makes things not break when it pulls large items)
- fixed crash from invalid downgrade type for confetti popper ("reducerange" should be "decreaserange")

9/9/2021 abagail of wibi
- merged in levelworld's robot puzzle stuff thus far
- frozen gloves (the special robot version and the normal version) now has an on dodge script
- added a placeholderesque rule screen to winter jester
- added bear to characters.csv to probably prevent crashes if you transform into bear somehow
- fixed the introductions.csv placeholder line being all fucky
- added angelmoon's shop theme
- added a credits file

9/8/2021 abagail of wibi
- winter witch and demise actuators no longer use the same selfvar
- winter witch and demise actuators now use .stop() after combat instead of ._repeat = 0
- winter witch and demise selfvars are now properly reset so the actuators won't be serialized
- winter witch now uses default witch generator (could crash because the previous generator contained non-spell equipment because witch used a deck instead of a spellbook)
- minor grammar fix for "never roll x" statuses; "you can't roll x this fight" instead of "you can't roll x on this fight"
the winter witch stuff here is mildly pointless since the episode is going to be tossed pretty soon

9/7/2021 abagail of wibi
- fixed snowcloud saying `2x<d6>` instead of `<double>` which was overlooked forever
- fixed stomp not inflicting shock on initial use
- more grammar fixes on equipment
- added a few items to excludefromrandomlists that didn't make sense to get from card reroll as warrior (or other "get a random item this turn" cards): snowdrift, mortal sin, acceleration kick, bet
- snowdrift is actually always offered for scrap now
- acceleration kick no longer has change_power as upgrade and downgrade (it had no corresponding upgraded/downgraded versions)
- certain passive items now avoid shock: acceleration kick, bet
- certain items with no weakened version now avoid weaken: acceleration kick, bet
- timely demise actuator now actually works
- heater and heater+ should no longer weaken weaken-avoiding/weaken-immune equipment
- "never roll x" statuses were ultra broken and always made you roll 1; this is because the input was effectively e.g. `Rules.playerdicerange([[1, 2, 3, 4, 5, 6]])` - double-heaping of brackets made it interpret the array itself as one of the dice ranges, which somehow it simplified to being 1 instead of throwing an error.
- fixed a separate bug with "never roll x" statuses where it wouldn't actually exclude the roll corresponding to the status (getstatusself was checked in "when inflicted", before the inflicted status actually counted for it)
- tit somehow left the episodes.csv ~lock file in

9/7/2021 6:47 PM: by Titku of Wibi
- Introduced the changelog. A big thank you to Abagail for doing all the GitHub setup.

9/7/2021 6:07 PM: by Titku of Wibi

- Added a missing gadget, Random Hit, from Indeed.
- Fixed some formatting on the Indeed items.
- Banned Curse enemies from Winter Jester due to Curse currently being broken in that episode.
- Added a placeholder introduction line so new classes won't cause a crash.
- Spruced up the shopkeeper and boss dialogue, mainly grammar correction.
- Jester now has a separate generator from Warrior, which does not have Present Shotgun (giveequipment breaks things).
- Nerfed Present Shotgun to MAX3.
- Fixed Persent Shotgun- doing double damage.
- Fixed a bunch of semicolons at the end of each row of episodes.csv.
- Winter Jester has a new limit break, Telescope.

9/4/2021 11:10 PM: by Fiship
No written changelog.

9/3/2021 6:36 PM: by Matt101
- changed witch episode to be a time crunch thing
needs to be fixed since actuators are confusing and i dont know what im doing
crashes after beating an enemy

Beyond: Lost to antiquity. :P Project was started on August 19th, 2021.