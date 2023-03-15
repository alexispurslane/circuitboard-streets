"Circuitboard Streets" by "Alexis Purslane"

Include Basic Screen Effects by Emily Short.

Use American dialect, the serial comma, and scoring.

Volume 1 - World Mechanics and Special Rules
		
Book 1 - City Sim Rules

Part 1 - The Sky and Skyline

The sky is a backdrop. It is everywhere. The description is "[if time of day > 6:00 AM and time of day < 7:00 AM]The neon colors of dawn, bright red, purple, and yellow, punch through the thick haze of the atmosphere above, painting the city in a pastel glow.[otherwise if time of day > 6:00 PM and time of day < 7:00 PM]The sun sinks, wan and tired, through the clouds of smog, casting a ruddy pastel glow out over the city.[otherwise if time of day < 6:00 PM]The sun filters down through a sky filled so fully with acrid pollutants that it is tinted a dingy green. Here and there, streamers of smoke or steam trail upward to add to the pervasive miasma.[otherwise]The sky is a dark, oppressive blanket of roiling clouds above you, the city's lights reflecting against its underbelly in a queasy kaleidoscope."

A city-region is a kind of region. A city-region can be busy, deserted, or at night. City-regions are usually busy. A city-region has a table name called atmospherics. The atmospherics of a city-region are usually the Table of Default Atmospherics.

Part 2 - Atmospherics

Table of Mulanosonic Atmospherics
State					Message
"busy"					"Someone pushes past you, grunting an incomprehensible word which might be an apology or just as easily an insult."
"busy"					"Cars drive past with the low ripping sound of tires on asphalt, throwing up streams of dirty water. The sound of car horns and engines soaks every cubic millimeter of the air, deafening if you're not used to it."
--						"The far away sound of sirens pierces the air with a thin warble."
--						"Somewhere a few streets away, you hear a shout. You can't quite make out the words."
"deserted"				"A dirty wind, smelling of the city's sewers and exhaust pipes, gusts by."

Table of Default Atmospherics
State					Message
"busy"					"Someone pushes past you, grunting an incomprehensible word which might be an apology or just as easily an insult."
"busy"					"Cars drive past with the low ripping sound of tires on asphalt, throwing up streams of dirty water. The sound of car horns and engines soaks every cubic millimeter of the air, deafening if you're not used to it."
--						"The far away sound of sirens pierces the air with a thin warble."
--						"Somewhere a few streets away, you hear a shout. You can't quite make out the words."
--				"A woman wearing [one of]strange demonic horns[or]an e-ink tattoo[or]a long canvas trenchcoat pulled tight to hide her face[or]not much more than her underwear[or]a long katana on her back, sheathed in a scabbard with cooling vents[or]a blank visor[at random] [one of]walks[or]strides[or]stalks[or]pushes[or]brushes[at random] past."
--				"A man wearing [one of]strange demonic horns[or]an e-ink tattoo[or]a long leather trenchcoat pulled tight to hide his face[or]not much more than his underwear[or]a gauss rifle on his back[or]a pair of dark mirrored glasses[at random] [one of]walks[or]strides[or]stalks[or]pushes[or]brushes[at random] past."

Every turn while the player is regionally in a busy city-region (called R):
	if a random chance of 1 in 2 succeeds:
		let O be 0;
		let N be 0;
		repeat with I running from 1 to the number of rows in the atmospherics table of R:
			choose row I in the table of atmospherics of R;
			if the region is busy and the state entry is "busy", or the region is deserted and the state entry is "deserted", or the region is at night and the state entry is "at night", or there is no state entry:
				if O is 0:
					now O is I;
				increase N by 1;
		let J be a random number from 1 to N;
		say the message in row J of the atmospherics table of R.

Part 3 - City Life

Every turn when the player is regionally in a city-region (called R):
	if R is at night:
		if time of day is after 6:00 AM:
			say "As another day of work dawns, the streets and sidewalks begin to fill with commutors.";
			now every city-region is busy;
	if R is busy:
		if time of day is after 9:00 PM:
			if R is not at night:
				say "As night falls, the city's streets fill with people looking for an escape from their memories of the day.";
				now every city-region is at night;
		if time of day is after 7:30 AM:
			say "As the early-morning rush to work dies off, the city sidewalks slowly begin to empty out. Soon, there is no one left.";
			now every city-region is deserted;
	if R is deserted:
		if time of day is after 7:30 PM:
			say "As their jobs slowly begin granting them a temporary reprieve for the night, the streets and sidewalks of the city begin to fill with people commuting home.";
			now every city-region is busy.


Pedestrians are a backdrop. The description is "[if the player is regionally in the Mulanosonic District]The pedestrians here in the Mulanosonic District are basically like the pedestrians in any other place, except poorer and more downtrodden. Instead of the stylish body-mods and upware you might see in other districts, typically all wrapped up in artificially fit bodies and stylish, tight-fitting clothing, what you see here is an endless parade of grimy, unhealthy people with utilitarian cyberware intended to serve a single function — work — and nothing else, rushing back and forth with their sunken eyes downcast and their chins buried in their coats. This is, after all, the target customer base of the mega-arcologies: those too poor to afford housing anywhere else in the dense urban sprawl of the city. There are a few meagre benefits, but no one lives here by choice. Not even you.[otherwise]Streams of people dressed in gaudy, tight fitting clothes in various states of cleanliness or disrepair push past you. You catch glimpses of every color and type of cloth in existence, every body-mod from zuo-mods to e-ink tattoos to chrome skin, every piece of cyberware from the latest and greatest to the worst hacked piece of garbage downware you've ever seen. None of it is truly expensive, nothing a corporate daimyo or heir would be seen dead wearing, but the sort of thing that's designed to be just expensive enough to stretch the pockets of your average street punk and make them feel like they splurged, but not expensive enough to actually be out of their reach. You can hear the cacophony of a thousand voices speaking into tooth mounted microphones and see a thousand tiny squares of light as they stare into their AR-glasses."

Refuse is a backdrop. "Used condoms, wrappers, pieces of torn clothing, bits of paper, needles, rotting food, you name a kind of trash and you can probably find it lying around somewhere on this city's streets."

Check taking refuse:
	say "You don't want any of that shit.";
	rule fails.

Understand "condoms", "wrappers", "torn clothing", "trash", "needles", and "litter" as the refuse.
 
After looking when the player is regionally in a city-region (called R):
	if R is deserted:
		now refuse is in R;
		now the pedestrians are nowhere;
	otherwise:
		now the pedestrians are in R.

Across the street relates one room to another.

The verb to be across the street from means the across the street relation.

Before going to a room (called X) from a room (called Y) when X is across the street from Y:
	if the player is regionally in a city-region (called R) and R is busy:
		say "You wait for a gap in the traffic, then dodge across the street as quickly as you can, shoes splashing in potholes as you pound across the asphalt.";
	otherwise:
		say "You glance both ways, then run across the street."

Book 3 - Intro Text

When play begins: say "They've taken your arm. They said they'd do it if
	— [italic type]when[roman type] — you left, said it in the contract. It had
	all seemed perfectly sensible at the time; if you were going to survive on
	their warehouse floor, you needed to keep up with the loading mechs, and
	that meant replacing your last [']ganic arm with some industrial chrome. And
	since you didn't have the chips, well, they'd buy it for you — with a hitch:
	they'd take it back if you left before you'd done enough work to pay it off.
	And that's if they let you go before then at all. So you'd let them chop
	your arm off and jack you in, and felt grateful. Now, not so much. Now, all
	that perfectly rational explanation makes you sick. Doesn't do shit for the
	sense of absence on your left side, the dislocation that poisons you every
	time you try to use what isn't there anymore.
	
	It wasn't like you'd have chosen to leave, given that choice. It was good
	work, for what it was. You'd show up every morning at 0700 below the
	warehouses's brutalist square concrete walls and take the rickety freight
	elevator to the tenth floor squeezed between mechs and cargo boxes. You'd
	push your way out of the elevator squeezing your noise cancelling [']buds in
	to find your loading team and start organizing the work for the day with the
	management AR-bot that ran the floor. It was loud, hot, uncomfortable, and
	often actively dangerous — more than once you'd barely evaded being maimed
	by falling crates or rushing mechs, and you'd seen more than a few of your
	buddies initiate indenture contracts with the corp to pay off the loan for
	replacements — but it was work you could do.
	
	The problem was that another orchestrator had had it in for you from day
	zero, and they'd been at the company far longer. Today, he'd finally gotten
	the best of you: had you framed for petty theft, actually, stealing low
	value company property. They'd promptly 'repossessed' your bike for not
	returning something you'd never had in the first place and kicked you to the
	curb — but not before taking back that arm.
	
	In a sense, you were lucky. It could've been far worse.
	
	You'd walked back home after that, pushing through the crowded streets fast
	and rough to match the rush of your thoughts, railing at the unfairness.
	You'd think after so long in the city you would've gotten used to this kind
	of shit, but not for a minute. Not yet anyway. Maybe that's a good sign, a
	sign they haven't worn you down, broken you. Or maybe it's a sign that
	you're too inflexible, that one day, instead of bending under the weight,
	you'll just snap, jump from one of the buildings or go psycho...
	[line break]";
	center "[fixed letter spacing]/press any key to continue/";
	wait for any key;
	clear the screen;
	now the right hand status line is "[turn count] / [score] / [time of day]";
	now the time of day is 12:00 PM.
	

Before looking in Megablock Sidewalk for the first time, say "Now you're standing outside the mega-arcology that holds your tiny apartment along with several thousand others, wondering what to do next. Suddenly you feel completely lost. The comforting monotony of work for most of the day and mindless entertainment for the rest is gone. You've been cut free, and free in this world means dead, because this is a world where you need protection and income and nobody competes with the corps by themselves. The only lead you have now is Jamie 'Nano' Rivest, a retired cracker who offered you a job awhile back.

 Welcome to the City. We hope you enjoy your stay."

Volume 2 - Places

Book 1 - The Mulanosonic District

Mulanosonic District is a city-region.


Megablock Sidewalk is a room. It is in Mulanosonic District. The description is "Megablock M-3B looms to the east like a monument to the concept of urban density and decay, throwing its massive bulk against the sky[if region is not at night], blotting out the sun and leaving you in a deep, cold shadow[otherwise]. Dizzyingly gargantuan advertisements shift in endless motion on the side of the megablock, projected there from the top of the building using lasers[end if]. The air here is moist with the water evaporating from the gutters of the city and acrid with the smoke of passing cars. The megablock tower is encircled by a dirty sidewalk, interrupted here and there by pipes plunging into the ground. To the west is a busy street, and across that, a row of shops. The sidewalk curves around the building to the north east and south east.

[if region is busy]Pedestrians clog the streets around you, rushing to or from work.[otherwise if region is deserted]A few bits of refuse lie about the sidewalk, and pieces of waste gust about on the wind like leaves.[otherwise]Night has fallen, and everything is awash in the bright neon glow of shop fronts, street lights, and billboard ads projected onto the Megablock and its surrounding skyscrapers. Reds, greens, purples, and blues dance on every reflective surface, including the faces and cyberware of the passing crowds. The City's nightlife is out in force, traveling in groups of shouting, laughing people to whatever dive bar, night club, or dollhouse they're planning to visit.[end if]"

Megablock M-3B is scenery in Megablock Sidewalk. "The tower is rectangular in cross section and in profile, covered in rows of plumbing and ventilation pipes that it was cheaper to leave exposed than cover up. It is made of crumbling concrete painted in a dismal, chipping sky-blue, as if in a failed attempt to replace the sky itself. The sheer concrete faces are occasionally crisscrossed by rusting steel girders which have the visual effect more of window frames than structural supports. There are a few slits here and there in the concrete, short windows every storey of the several hundred storeys that make up the building. [if region is at night]A gigantic advertisement for [one of]Ameritech Arms[or]S.M.I.L.E. Heavy Shipping, your old employer,[or]MuTech Solutions[or]AtroDynamics Aerospace[or]Beta Infosec[or]The O&Y Group[at random] booms and swirls in bright colors carelessly projected over top of this entire side of the buillding. All the windows are shuttered against the light.[end if]"

Understand "tower", "building", "mega-arcology", "arcology", "skyscraper", "megablock", and "M-3B" as Megablock M-3B.



Shop Fronts is west of Megablock Sidewalk. It is in the Mulanosonic District. The description is "You see a long line of shop fronts stretching away to the north and south here, an endless parade of neon advertisements thrown up like digital vomit across huge screens behind bullet proof glass shop windows. This shopping district, a whole city block in size just like the megablock, has quickly accreted here to take advantage of the density of customers brought about by the mega-arcology — and their bleak depression, which can only be salved by the dopamine hit of a new acquisition. The ads are gaudy, kitsch crocks, mostly, shit that barely has a purpose and barely works [italic type]for[roman type] that purpose. "

Shop Fronts is across the street from the Megablock Sidewalk.

Gibson Cyberware Front is north of Shop Fronts. It is in the Mulanosonic District. The description is "Gibson Cyberware's trademark flashy, poetically narrated advertisements play on a strip of screens that slashes through the center of the clear glass walls of this shop front. Inside, you can see rows of black plastic tables on which carefully posed and displayed cyberware sits, all stainless steel and fake carbon fiber, waiting for customers. On the walls are shelves full of add-on modules, the company's claim to fame and major profit source."

Every turn while the player is in Gibson Cyberware Front, say "[one of]FEEL GIBSON'S POWER FLOW THROUGH YOUR ELECTRIC VEINS, the woman in the advertisement croons.[or]GIBSON CYBERWARE: FROM THE GRAY MARKETS OF NEO-KYOTO TO YOU, the ad blares.[or]BRINGING CYBERPUNK-CLASS UPWARE TO THE MASSES — DON'T MISS THE EDGE!, the ad declares.[at random]"

The Gibson Cyberware Store is in and west from the Gibson Cyberware Front. "You pull the "

Volume 3 - Characters
