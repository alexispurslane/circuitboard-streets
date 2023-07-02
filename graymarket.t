graymarket: Region, RandomEventList
    eventList = [
                 'Someone manning a stall nearby calls to you, waving you over.',
                 'A woman who might almost be <i>like you</i> nods and smiles at you as she passes by.',
                 'A dealer, his coat open to display his wares, catches sight of you and briefly tries to catch your attention.',
                 'One of the tents nearby fades to a new color.',
                 'The music being played from speakers somewhere in the ruins reaches a creschendo.',
                 'A fight breaks out between two street merchants, the ensuing battle briefly drawing a small circle of onlookers before it ends abruptly.',
                 'As you pass by a tent, someone stumbles out of it backwards, arms windmilling, thumping onto the ground near your feet. Moments later, they are followed out by an enraged proprieter.',
                 'Someone offers you synthmeat on a kebab. It smells surprisingly good, if more oily than the Middle East.',
                 {: "\^<<generateCrowdCouple()>> walk by, <<one of>>laughing softly<<or>>kissing<<or>>groping each other<<or>>one leading the other by a leash<<or>>talking earnestly<<or>>holding hands<<or>>looking lovingly into eachother's eyes<<or>>arguing<<or>>shouting at each other<<shuffled>>." }
                 ]
    eventPercent = 40
    eventReduceTo = 30
    eventReduceAfter = 10

    regionBeforeTravel(traveler, connector)
    {
        "You push through the crowds. ";
    }
;

+ ELI ~(city.timeOfDayState != deserted_state) "\^<<generateCrowdPerson()>> <<one of>>walks<<or>>strides<<or>>stalks<<or>>pushes<<or>>brushes<<or>>sways<<at random>> past. ";

+ ELI ~(city.timeOfDayState == nightlife_state) "A group of partiers streams around you for a moment, filling your ears with an out of context snipped of their laughter and conversation for a moment before passing around you.";

grayMarketPeople: MultiLoc, Decoration 'people; ; crowds crowd'
    "<<if city.timeOfDayState == night_state>>Now that it's past midnight, and the tent shops and street vendors have packed up and closed down to sleep for the night, this place is mostly empty, except for a few people loitering here and there, wandering between the few places that are open all night long. These are the people that look seedy and listless, sad drunks, battered partners, people looking for an escape of some kind. Here and there, homeless people wander, scrounging from the discarded remains of the day. <<else>>Streams of people fill every twist and turn of the wide dirt path through the market, bustling back and forward along the path or two and fro between the tents and vendors, all talking, bargaining, arguing, laughing. Here and there, people move in small groups &emdash; workers and merchants wheeling in the latest shipment of food or guns or anything else, corporate embassies sent out to secure supplies or services, friends out to explore, gangs &emdash; while others cut through the crowd in a bubble of solitude all their own. Each of the genres of people you can find in other regions of the city are blended together here, brought by the life of the bazaar. <<end>> "
    specialDesc = "<<if city.timeOfDayState == night_state>>A few people wander here and there.<<else>>Crowds bustle past you, filling the street with their heat and noise.<<end>> "

    dobjFor(Examine)
    {
        action()
        {
            "You notice <<generateCrowdPerson() >>. \b";

            inherited();
        }
    }

    locationList = [graymarket]
;

grayMarketTents: MultiLoc, Distant 'gray market; black; tents tent maggots'
    "Tents of all sizes line the ruins to either side of the small track that snakes out from the hole in the fence, from small single-occupant tents with their sides opened to form a sort of stall defended from the drizzle, to huge house-sized affairs. Everything is lighted in a multitude of colors, a warm glow which does brave battle against the perpetual night's terrors. People bustle about inside and around the various tents, laughing, cheering, shouting, haggling, getting into fights, and generally milling about. For all its foreboding setting, this place feels startlingly <i>human</i>."
    locationList = [graymarket, grayMarketEntrance]
;

grayMarketStalls: MultiLoc, Distant 'street vendors; ; stalls stall merchant merchants'
    "Every gap between the major tents is filled with the stalls of street vendors, hawking everything from 3D-printed guns to rugs to posters to synthetic meat to fast food and beyond. No space is left free, either physical or categorical, of shouting, calling, singing, and beckoning merchants and their carts of corrugated metal, cardboard, and plastic, cobbled together from whatever they could find."
;

ruins: MultiLoc, Distant 'megablock m-3c ruins; gigantic shattered hills bent iron decaying construction jutting failed; rubble equipment lot block bones bone remains rodds walls hopes dreams'
    "Gray hills of rubble, rusty iron rods, and decaying construction equipment, interspersed with the jutting remains of walls, are all that remains of Better Housing Corp's hopes and dreams. This failed follow-up to the first two megablocks was what ultimately led to their bankrupcy, and the auction that landed Megablock M-3B in the hands of a Smile Corp subsidiary."
    locationList = [graymarket, grayMarketEntrance]
;

grayMarketAdvertisements: MultiLoc, Distant 'gray market augreal advertisements; ; ads'
    "Ads, ads, and more ads. Everywhere you can see. Augreal advertisements in all their neon-glowing glory spinning and moving and animating in every direction, in every location &emdash; over their respective tents or carts, or over those of competitors, or arcing like grand art exhibits for some kind of crazed art festeval over the path. Giant figures tower up into the sky and take dancing steps that make you feel as if you'll be crushed any second by their godlike feet. It's overwhelming. "
    specialDesc = "A forest of neon-glowing augreal advertisements hovers over everything. "
    locationList = [graymarket, grayMarketEntrance]
;

grayMarketEntrance: OutdoorRoom 'Mandible Block (entrance)'
    "An empty stretch of packed gray dirt, always slightly muddy from the perpetual drizzle, is bifurcated by a rusty, leaning chain-link fence here. On the west side of the fence, the packed dirt verges up against the City's central street, which runs north and south, across which is Megablock M-3B. On the east side, through a hole cut in the fence with a plasma torch, the packed dirt opens up on a gigantic lot, easily the size of several normal city blocks, on which lies the shattered bones of Megablock M-3C and, nestled within them like maggots infesting some paleolithic monster's shattered skull, the tents of the gray market."

    conciseDesc = "West is the the central city road, across which stands the megablock, towering imposingly like a blinded lighthouse. East, through a hole in a chain-link fence, is the central track that leads through the gray market."

    east = fence
    west = megablockExterior

    regions = [city]
;

+ fence: Passage 'chain link fence; chain-link chain cut high rusted rusty leaning bent'
    "It's a high chain link fence, perhaps eight feet tall, lined with barbed wire at the top. Rust crusts over it here and there. A hole large enough to step through has been cut into it with a plasma touch, and a beaten track leads through that hole and into the gray market."

    travelDesc = "You duck through the hole in the fence, carefully avoiding the ragged cut ends of wire."
    destination = grayMarketPath1
;

grayMarketPath1: OutdoorRoom 'Gray Market Path'
    "In contrast to the cold elsewhere in the city, the body-heat of hundreds of closely-packed people warms the air, which smells of street food, gun oil, and wet concrete. This is where the path through the gray market begins, at the mouth of the hole in the fence to the west. It widens considerably as it winds away northeastward through the tiny city of tents and street carts and awnings nestled between the ruins. On either side of the path, chains of lights hang from tent to tent, while each tent is lit internally with various hues, some even fading between different colors. To the north, an old shack slouches, with the word 'CLOSED' scrawled across its face in red spraypaint. To the south, meanwhile, a large white tent has been erected. A sign poster has been driven into the ground outside of it saying simply 'FOOD'. A small gap between the tent to the south and the the fence leads southwest."

    conciseDesc = "This is where the path through the gray market begins, at the mouth of the hole in the fence to the west. It widens considerably as it winds away northeastward through the city of tents and street carts nestled among the ruins. To the north stands a shack with the word 'CLOSED' scrawled across its face. To the south, a large white tent with a sign that says 'FOOD' has been erected. There are a few street vendors around these buildings as well. A small gap between the tent to the south and the the fence leads southwest."

    northeast = grayMarketPath2
    east asExit(northeast)

    west = grayMarketEntrance
    southwest = alleyway

    north = closedCyberwareShopDoor
    south = groceryShop

    regions = [graymarket]
;

+ synthmeatCart: Fixture, Surface 'synthmeat cart; meat street grilled; stall grill box table awning sausages meatballs hot dogs patties'
    "A small cart made of aluminum tubes and corrugated metal, probably machined right here in the market, with a small box table with a grill inset into it and a simple awning to shelter the table and the vendor standing behind it from the rain. LED light strips wind around the tubing and hang like bunting from the awning. On the grill several varieties of synthmeat sizzle invitingly &emdash; sausages, meatballs, hot dogs, grilled meat patties &emdash; and to the side of the grill, rows of seasenings, toppings, and buns stand at the ready. "
;

+ virtualRealityCart: Fixture, Surface 'virtual reality stall; ; cart booth stand'
    "A wide stall with a four foot deep table wrapped like a defensive barracade around the man who runs the business from the center, and a canvas tent awning that covers the entire table, including space in the middle of it. The table is made of sheets of cleverly yet inexpertly folded aluminum in strikingly angular shapes. On the table, there is an array of VR headsets on mannequin heads, each with a cheap transparent touchscreen OLED stationed next to it running hardware info and advertisements like placards in a museum."
;

++ virtualRealityHeadsets: Decoration, Wearable 'virtual reality headsets; ; goggles glasses'
    "Most of these models are knockoffs of major name-brands, produced in China. They clearly violate all sorts of patents and intellectual property laws, but nobody really cares to do anything about it. They're so much cheaper and shitter than the originals they target a totally different market. <<one of>>A bulky white old-style virtual reality headset with black felt padding catches your eye. You just might be able to afford that one.... then you remember that you don't need it, and buying it would probably wipe you out anyway, and you force it out of your mind. <<or>>A svelte black carbon fiber pair of goggles catches your eye. It's a slim, curved visor that fits neatly over your eyes and blocks everything else out, while still somehow seeming cool and aloof. It takes you a second to place it, then it hits you: it's a knockoff of one of the new Meta-Aiellison models that was released recently. They really nailed the design on this one.<<or>>A simple pair of augreality glasses catches your eye, thick black frames concealing primitive pre-2nm backside-power-delivery circuitry and biocompatible cyberware entirely. It's been a long time since anyone has needed those; nowadays, even outside the city, augreality lenses in your eyes are given with the birth certificate.<<shuffled>>"
;

+ grocery: Fixture, Enterable 'grocery shop tent'
    "This tent glows bright pale green from the inside, perhaps intended to remind you of fresh green plants and growing things.<<first time>> It's been so long since you've had anything like that that it almost makes your mouth water, and you internally chide yourself for falling for such a simplistic marketing manipulation.<<only>> The tent is reasonably large compared to the others, clearly designed to hold multiple tables of wares or merchant stations. It probably represents a conglomerate or assocation of multiple individual sellers, then, and sure enough you can see the decal of a gigantic Southern California sharecropping cartel running along one side of the tent in striking black letters, with more than a dozen smaller circular logos underneath it representing the constituant corporations. The decal seems to have been reapplied multiple times as the canvas under it was ripped and patched over again and again. The rest of the tent is in similar condition, good quality canvas that must now be many years old, patched repeatedly. Most of the tent is held up by thick aluminum poles, but one of its rear corners is actually held up by a decaying section of concrete wall."

    destination = groceryShop
;

+ shack: Fixture, Enterable 'closed cyberware shop; red old corrugated metal ramshackle; shack graffiti spraypaint word words'
    "This is a simple shack of corrugated metal, welded together with some not-incosiderable amount of skill and attention to structural integrity, although not the work of a professional or anything close. It isn't small either, more than twenty paces wide at your quick estimation. Despite its sturdy construction, it shows clear signs of age and decay: patches of rust stain its sides, and parts of its roof have been eaten away over the decades by the rain. Graffiti has begun to grow over it as well, just like any other flat surface in this area of this city left too long unattended. <<if tape.isIn(closedCyberwareShopDoor)>>The door has been taped shut with electrical tape, and one<<else>>One<<end>> early piece of graffiti, judging by its fading color and depth in the layers of the stuff, is a huge 'CLOSED' spraypainted across the door diagonally."

    destination = closedCyberwareShopDoor
;

+ closedCyberwareShopDoor: Door ->closedCyberwareShopDoorInside 'cyberware shop door'
    "A rusty door of corrugated metal, with 'CLOSED' scrawled across it in red letters. <<if tape.isIn(self)>>Old electrical tape holds the door closed.<<end>>"

    dobjFor(Open)
    {
        action()
        {
            if (tape.isIn(closedCyberwareShopDoor))
                tryImplicitAction(Take, tape);
            inherited();
        }
        report()
        {
            "The rusty door comes open with a long, forlorn creak, scraping a half-circle in the dirt. ";
        }
    }
;

++ tape: Thing 'tape'
    "It's smooth black electrical tape, tattered with age and beginning to peel at the edges."

    initSpecialDesc = ''

    plural = true
    ambiguouslyPlural = true

    dobjFor(Take)
    {
        report()
        {
            "You pull the tape off the door with a stickly peeling sound.";
        }
    }
;

closedCyberwareShop: Room 'The Closed Cyberware Shop'
    "Pale, sickly greenish strands of light fall gently from the rain-eaten holes in the shack's roof down to the dirt floor, where thick extension cords and power cables snake back and forth like the wiring board of an ENIAC computer, connecting the dim shapes that fill the room. Squarish shapes, shrouded in veils of ragged tarp, loom at the edges, silently watching you."

    out asExit(south)
    south = closedCyberwareShopDoorInside
;

+ firepit: Decoration 'firepit; fire; pit fire'
    "The fire pit is just a shallow hole dug into the earth and then repacked. It isn't even ringed with anything nonflammable. There is a tiny fire, which barely gives off any light at all, huddled, flickering, in the center of the pit. You can just barely feel its warmpth from here."
    specialDesc = "A shallow fire pit has been dug into the hard-packed earth in the center of the shack, in which a tiny fire struggles fitfully."
;

+ machines: Fixture 'machines; vieled shrouded ragged squareish; shapes squares'
    "You look carefully at the shapes under the tarp, trying to guess what they might be. They are boxy, skeletal, with strange knobs and cylendars and levers making tents in the material. You get the sense it was all some kind of manufacturing equipment once, milling, CNC, bending, PCB printing, picker/placer arms, soldering robots, 3D printers in every material imaginable, all still pretty state of the art. You imagine this place might once have been able to manufacture almost anything electronic under the sun."
;

++ tarp: Fixture 'tarp'
    "A thick, incredibly heavy cloth cover of some kind, which reminds you of the swimmingpool covers you saw back home when you were very young, before the sky clouded over and the acid rain began. It's black, or maybe navy blue, and frayed at the edges."

    cannotTakeMsg = "You try to pull the tarp off of some of the shapes to see what's underneath, but the tarps are just far too large and heavy for you to move by yourself<<if gPlayerChar.leftArm.ofKind(Unthing)>>, especially with only one arm<<end>>. "
;

+ closedCyberwareShopDoorInside: Door ->closedCyberwareShopDoor 'cyberware shop door'
    "The inside of this door is little different from its outside, except for a decaying piece of paper that's been stabbed into the door with a knife."
    specialDesc = "You notice a decaying piece of paper pinned to the rear of the shack's door."
;

++ poster: Fixture 'legal notice; thick white; paper'
    "It's a piece of thick white legal paper, the kind corporations still sometimes like to use for notices and legal documents when they want to be below-board enough for it to be deniable on the 'net but official enough to intimidate people. This one has begun to decay quickly in the musty, acidic air of the shack, but some of it is still readable."
    readDesc
    {
        "<font face='TADS-Typewriter'>";
        "RE: UNAUTHORIZED USAGE OF GIBSON INTERNATIONAL INTELLECTUAL PROPERTY\b\b";
        "Dear [unreadable],\b";
        "We have reason to believe that you are in direct violation of making use of information that is deemed intellectual property of Gibson International.\b";
        "The infringing actions include the following:\b";
        "<ul>";
        "<li>Making, manufacturing, desiging, or otherwise producing or maintaining for sale five-fingered biocompatible cybernetic arms without the authorization of Gibson International and paying the legally-required licensing fees for use of Gibson International's intellectual property</li>";
        "</ul>";
        "</font>\b";
        "After this point, you skim down to the bottom of the page, where you find a notation made in thick, angry handwriting:\b<font face='TADS-Script' color=\"red\">\"Fuck you, fuck all of you! These are my own fucking designs!\"</font>";
    }
;

+ shopDesk: Fixture 'worktable; dusty work wide; table desk'
    "This table stands alone in the center of the room, covered in a thick layer of pale dust, like an altar to long-forgotton god. "
    specialDesc = 'The center of the room is empty, except for a long worktable.'
;

+ wires: Decoration 'wires; extension power rotten; cords cables'
    "These wires cover much of the floor, snaking back and forth in a tangled web. Here and there, the wires are bundled together, as if in an attempt to bring some order to the mess, but it's clear that whoever did this quickly met with defeat in that regard, as the overall system grew over time. The wires are now half-embedded in the packed dirt floor of the shack, sunk in after many cycles of harder rainstorms and then periods of relative dry, and their rubber casings have begun to fall apart in places, as the cheap material begins to give up at last."
    plural = true
    ambiguouslyPlural = true
;

groceryShop: Room 'The Grocery Merchant Shop'
    "The tent's spacious interior is wrapped in baggy canvas sagging between rows of leaning tent-poles and bathed in pale green light from ancient flood lights hooked up at its corners. Here and there, industrial fans in wire cages fight a desparate war against the heat and humidity. Wires tied by zip-ties snake up vertical poles and hang in bunches from horizontal ones above you. It is all frighteningly low-tech, even for this area of the city, and it also makes you mildly clausterphobic, a feeling which is only made more severe by the tightly-packed rows of plastic folding tables laid out underneath it, holding baskets, boxes, crates, sacks, and piles of every kind of fresh or canned food imaginable. Here and there, flies alight on the wares, then are shood off by tired-looking sellers with waved handkercheifs. For some reason, the thin black sheen of the tent's wiring reminds you of those flies."
;

+ people: Decoration 'people; ; person crowd crowds'
    isHidden = (city.timeOfDayState == night_state)
    specialDesc = "The tent is packed with people wandering about and inspecting the wares or haggling with the merchants behind the tables over prices."
;

+ merchants: Decoration 'merchants'
    "They look hot and tired. Most of them are not even from here, beleaguered small-time farmers or resellers from elsewhere in California, almost universally wearing the pins of the massive sharecropping corporations down south. They are uniformly sun-tanned, thin, and have had various parts of their body replaced by ancient non-biocompatible cyberware that still uses stainless steel and primitive hydraulics and requires regular immunosuppresants to prevent rejection. Expensive drugs which function both as prerequisite, lifesaving drug, and means of control. Not to mention that it's harder for immunosuppressed people to organize. Many of them wear goggles or face sheilds over their masks to prevent infection."

    specialDesc = "Tired merchants stand behind the tables, haggling with insistant customers and performing transactions."
;

+ backDesk: Fixture, Surface 'back desk; rear'
    "A simple white plastic table, dented and scratched. It doesn't look like it's been moved from this spot in a very long time, judging by how far it's sunk into the muddy ground. "
    specialDesc = "Far at the rear of the tent stands a smaller folding table with a folding chair set up behind it, on which sits a corpulant man."
;

+ food: Decoration 'food; fresh canned white plastic; tables crates boxes sacks baskets barrels piles'
    "The food is mostly things like fruit and vegetables, canned fruit, beans, and other canned items, and baskets of stables like potatoes and yuka. <<first time>>Looking through it, you quickly realize that this is not the sort of \"grocery\" store you're used to &emdash; designed to provide quick premade frozen meals and yeast cannisters for food dispensers. This is where people find real, fresh, actual food. You can't imagine how expensive most of this is. You wonder why it has to be sold here in the gray market instead of elsewhere. Is it smuggled in to avoid taxes? Is it food discarded from the larger fresh goods retailers the rich in Northside use, which doesn't meet the health regulations designed to create regulatory capture?<<only>>"
;

groceryShopAlley: OutdoorRoom 'Small Alley (behind grocery)'
    "It's a small dim alley. The lights, sounds, and smells of the gray market feel muffled here. It's almost nice to be away from the hype and bustle of the market. To the north is the back of the grocery tent. A small opening left between the tent itself and the large standing ruined wall that holds up a rear corner invites you in. "
    north: TravelConnector
    {
        travelDesc = "You duck into the grocery tent discreetly. No one seems to notice. ";
        destination = groceryShop
    }
;

grayMarketPath2: OutdoorRoom, ShuffledEventList
    eventList = [
                 'The low thumping techno beats of the brothel shiver and quake in your ears and stomach. ',
                 'Moans and cries of ecstacy or pain echo from the brothel\'s upper stories. ',
                 'Blots of blue, red, and purple light play games across your path. '
                 ]
    name = 'Gray Market Path (northeast)'
    desc = "This part of the central thoroughfare that runs through the gray market bends southwest toward the market's entrance and the grocery tent in one direction, and due east in the other, running through the tents, stalls, vendors, and ruins to either side. Just north of the path here, there is a substantial three-storey section of the megablock that originally stood here that hasn't quite crumbled yet. It's been closed off with sheets of plastic and canvas and propped up with all manner of impromptu construction materials, including the rusted-out hulks of the construction equipment itself, and turned into a sort of brothel &emdash; or at least, that's what the augreal advertisements that hover in front of its third storey imply, with sighing, gyrating wireframe outlines and bold slogans. Light from the brothel, mostly blues and reds, tints this whole area of the path, making it feel strangely dominated by the structure."

    conciseDesc = "This part of the central thoroughfare that runs through the gray market bends southwest toward the market's entrance and the grocery tent in one direction, and due east in the other, running through the tents, stalls, vendors, and ruins to either side. Just north of the path here is the brothel."

    north = brothel
    in asExit(north)
    east = grayMarketPath3

    regions = [graymarket]
;

+ ramenCart: Decoration, Surface 'ramen noodle cart'
    "A small corrugated metal noodle cart, complete with a small awning lined with glowing round lamps, a slim section of table with bar stools on one side for customers, and a small portable kitchen to prepare the food on the other side, where the cart's owner stands hard at work. An artistic rendition of a bowl of ramen noodles has been carefully painted onto the front. The rest of the corrugated metal has been painted to look like bamboo."
;

+ brothelFront: Passage 'brothel; chicken wire rubble; tunnel'
    "You hear moans, screams, shouts, and cries of agony and joy from inside the brothel, as well as the rhythmically thumping beat of some techno song. The opaque plastic and canvas walls alternately take reddish, purplish, and bluish hues from the lights inside, and you can see bodies writhing in ecstasy silhouetted against that light."
    specialDesc = "A tunnel constructed out of chickenwire fencing and concrete rubble leads into the brothel to the north."
    destination = brothel
    travelDesc = "As you pass into the tunnel, both the sounds of the brothel and the larger market outside are temporarily muted. But as you travel down its length, the sound gets louder, until you finally part the heavy plastic curtains and step into the brothel itself and are accosted by overwhelming sound. "
;

tOfficeDoor: Topic 'office door' @nil;

brothel: Room 'The Brothel'
    "This first floor serves more as a strip club than brothel, the fusion a product of mutual convenience and serendipity, due to this section of the megablock being the only place in the market that could sustain the floor space for both endeavors, but the combination seems to have reached an orgasmic symbiosis. Blue, red, and purple lights splash the stage at the north end of the room with alluring neon hues perfectly calculated to get anyone aroused. <<if city.timeOfDayState == nightlife_state>>Men, women, and others dance frantically, ecstatically, on that stage, some around poles, some in pairs or triples, some by themselves, smooth waxed bodies pressing against each other. Beside and around the stage, and walking through the crowd, sex workers ply their trade among the primed audience.<<else>>The stage is empty for now except for a few forgotten pieces of outfit and chrome poles drilled into the ceiling, but you feel certain it will be bustling as soon as night falls.<<end>> The rest of the room is bathed in inky darkness, tinted only slightly by the stage's lights<<if city.timeOfDayState == nightlife_state>>, and is packed with onlookers, by turns watching the stage and leaving to bring go up the northeast stairs or get a drink from the bar across the west wall<<else>>, which reveal a stairway in the northeast corner of the building and a bar along the west wall<<end>>. <<if gPlayerChar.knowsAbout(tOfficeDoor)>>To the east, a small doorway hung with plastic curtains opens off into a cream-lighted room.<<end>>"
    conciseDesc = "The first floor of the brothel, which serves as a strip club. Blue, red, and purple lights bathe the stage<<if city.timeOfDayState != night_state>> and the undulating bodies of the dancers<<end>> to the north, leaving the rest of the room<<if city.timeOfDayState != night_state>> and its crowd<<end>> deep in darkness. The exit is across from the stage to the south, while the northeast corner is taken up by a stairway<<if gPlayerChar.knowsAbout(tOfficeDoor)>>, and to the east, a small doorway hung with plastic curtains opens off<<end>>."

    up = "You're not feeling particularly in the mood right now. <<if gPlayerChar.leftArm.ofKind(Unthing)>>Especially not with one arm.<<end>>"
    northeast asExit(up)
    south = grayMarketPath2

    east: TravelConnector
    {
        destination = mistressOffice;
        isConnectorApparent = (gPlayerChar.knowsAbout(tOfficeDoor));
    }
;

+ stripClubAudience: Distant, Decoration 'crowd; ; audience people crowds'
    "The crowd is rowdy, rambunctious, shouting and cheering at the performers on stage, milling about getting drinks, carousing, and going upstairs. They are reduced to vague, dark shapes by the gloom, somewhat amorphous, a single collective entity."
    isHidden = (city.timeOfDayState != nightlife_state)
    specialDesc = "The room is crowded by the amorphous mass of the strip club's patrons. "
;

+ stripClubBar: Distant, Decoration 'bar'
    "A chromium strip of gleaming metal flows across the west side of the room, with a line of bar stools in front of it and a mixing area for the automated bartender to work at behind it, along with racks of various drink ingredients. "
    roomPart = defaultWestWall
    roomPartDesc = "The strip club's bar runs along the west wall. "
;

++ stripClubBarstools: Fixture, Chair 'bar stools; ; barstool barstools stool'
    specialDesc = "Circular black-cushioned stools stand in front of the bar<<if city.timeOfDayState == nightlife_state>>, most of which are occupied by members of the crowd, drinking down sugery cocktails and hard liquor<<end>>."
    plural = true
    ambiguouslyPlural = true
;

++ stripClubAutoBartender: Fixture 'automated bartender; auto; mixer'
    "The automated bartender is plated in chrome like the bar itself, its body a beautiful assemblage of curved plates, spines, and rods that all shift in relation to each other in eerie imitation of muscles moving under skin as it moves and flexes<<if city.timeOfDayState == nightlife_state>> selecting ingredients, mixing drinks, and handing them out to customers with blurring speed and frightning precision, almost too fast for your eye to see<<else>> cleaning the bar counter.<<end>> It has a ten fingered hand which is assembled with the intricacy of Swiss clockwork, a million tiny servos in the palm driving metal ligaments which allow the jointed fingers to move with ease and precision, all covered in plates that shift to allow maximum flexibility."
    specialDesc = "Behind the bar stands a robotic arm<<if city.timeOfDayState == nightlife_state>>, mixing and serving drinks<<else>>, idle for now, waiting for the nightlife to begin<<end>>."
;

mistressOffice: Room 'The Mistress\'s Office'
    "This is a small one-room apartment, not unlike<<first time>> &emdash; you notice with a pang of regret &emdash;<<only>> the one you used to have in megablock M-3B, but it's been converted into an office. Wood paneling lines the walls and ceiling, and although you know it must be fake, you find it oddly effective at making this place feel like a real corporate office. Some sort of bas-relief sculpture is embedded into the wooden walls, running the entire width and height of them. The room is lit by soft white light strips attached to the ceiling, which shine down on a lavish cream carpet."
    west = brothel
    wallObjs = [bassrelief, bassrelief, bassrelief, bassrelief]
;

+ mistressDesk: Fixture, Surface 'desk; intricate; table'
    "The rich brown material of this gigantic desk, which looks like shiny amber and chocolate mixed together and frozen mid-flow, appears to have been 3D-printed using a fine-resolution resin printer of industrial size. It is designed, like the walls, to look like a wooden desk, given artificial grain and coloring and lacquer, and it truly does look the part. The sides are covered in intricate and very explicit triptychs depicting strange demonic creatures cavorting, playing, fighting, and mating in so many combinations that the designer's psychology must have been one to drive even Freud mad. You feel both intranced and repulsed by it."
    specialDesc = "An imposing desk sits languidly in the center of the room like a jungle cat. "
;

++ mistressDeck: Decoration 'deck'
    "A slim, angular black cyberDEC, fitted into a baroque cast-iron stand designed to look like a weave of branches and leaves and filled with intricate clockwork gears and springs running a fan along the cooling vents of the deck. A few modules have been fitted to the expansion ports of the deck, making a small row of rectangular electronic objects along the top. "
    specialDesc = "A black cyberDec sits in the center of the desk. "
;

++ plant: Decoration 'small potted plant'
    "A green fern, or something like it, sprouts up in an exuberant fan of shoots from a clay pot. You can't tell if it's real or not. "
    specialDesc = "A small green potted plant sits in one corner of the desk. "
    remapUnder: SubComponent {  }
;

+++ book: Decoration 'blue book; nietzsche; birth of tragedy'
    "This is a slim blue book, perhaps less than two hundred pages, with a title in gold-leaf lettering embossed on the side. The title reads: <font face='TADS-Script'>The Birth of Tragedy, by Friedrich Nietzsche.</font> "
    specialDesc = "The potted plant rests on top of a slim blue book with golden lettering on the side."
    subLocation = &remapUnder;
;

+ bassrelief: Decoration 'bas relief scuplture; bas-relief bassrelief; walls wall'
    "Bass relief images of satyrs and Pan and Dionysis and fairies and fey and succubi and incubi of every erotic permutation parade around the room in Dionysian festive glory, framed by grape vines and tradgadean masks. The very sight of it makes you want to shed your clothes and join some ancient elder orgy with fey creatures. A strange rollicking song seems to fill your head for a second:\b <i><<one of>> Come, come, come, come, come along now\n Run away from the hum-drum\n We'll go to a place that is safe from\n Greed, anger and boredom\n...<<or>> We'll dance and sing 'til sundown\n And feast with abandon\n We'll sleep when the morning comes\n And we'll rise by the sound of the birdsongs\n...<<or>> We'll be here when the world slows down\n And the sunbeams fade away\n Keeping time by a pendulum\n As the fabric starts to fray\n<<stopping>></i>"

;

+ mistressChair: Decoration, Surface 'thronelike chair; throne like; throne'
    "This chair might almost be called a throne. Its depth, width, and large, rounded arm rests are enough to make anyone who sits in it look small by comparison, to swallow them up in its plush burgundy cushions, and the high back is scalloped and fanned out to frame the occupant's head and shoulders in a way that reminds you of Sandro Botticelli's <i>The Birth of Venus</i>. Yet somehow instead of making its occupant seem insigificant in comparison to it, its size seems carefully calculated to enhance their imposing presence like a peacock's fanned feathers. Its edges appear to be real lacquered wood, and you can't imagine how expensive that must have been."
;

grayMarketPath3: OutdoorRoom 'Gray Market Path (east)'
    "The gray market's main thoroughfare ends here in a small circular cul de sac surrounded by larger tents<<if city.timeOfDayState != night_state>>, and the crowd swirls around it and back the other way in a great meandering whirlpool of bodies<<end>>. To the north, a long, low gray tent hunches under an augreal depiction of a glowing blue genie with the words 'THE MIND PALACE' written across his chest. To the east, a large building made of prefab building materials has been erected on a cracked section of foundation. A neon augreal ad spins above it, a wireframe mug overlfowing with beer. To the south stands another tent, with a small vertical augreal sign in front of it spelling out 'CLOTHES.' Another sign hovers above the tent, a wrench animated eternally in the process of tightening a bolt. To the northeast, an alley runs between two tents, bending south and out of sight. You can go back along the gray market's path to the west."

    northeast: TravelConnector
    {
        travelDesc = "The alleyway takes a long and winding path through the ruins, but you eventually arrive behind the grocery tent. ";
        destination = groceryShopAlley
    }

    west = grayMarketPath2

    north = drugTent
    south = clothesTent
    east = beerspace

    regions = [graymarket]
;

drugTent: Room 'The Mind Palace'
    "The tent is long, low, and dark, filled with the choking smoke of several different drugs and a murky navy blue light, as well as the smell incense. Standing here, with the smoke wafting back and forth agitated by the motion of dim figures in the gloom, you feel like you've stepped into an entirely different world. Rows of people sit or lie on mats to either side of you, some wearing virtual reality goggles, some talking to each other, some talking to themselves or batting at the air, although it's difficult to tell if they're interacting with their augreal huds or drug-induced hallucinations."

    south = grayMarketPath3
;

+ drugSeller: Actor 'emaciated drug dealer; emaciated sickly; seller'
    "A sickly, emaciated man, with a strange jaundice to his skin, a perverse placticity. A cigarette hangs out of the corner of his mouth, softly glowing, and he's holding a glass of whiskey. He is wearing a long brown trenchcoat that seems to completely drown him with its size."

    dobjFor(TalkTo)
    {
        action()
        {
            "The emaciated man seems to ignore you. ";
        }
    }
;

beerspace: Room 'The NeoGothic Bar'
    "A gimmick bar. This bar's appeal, if it can be called that, is adopting the neogothic chic of northside establishments, 'bringing it to the masses' as the owner might say. The best it can do in that respect without the requisite soaring architecture and expensive materials, though, is a limp gesture in a vaguely northward direction. The inside of the place is a sleek, shiny black, with pointed arches dividing the interior into smaller sub-areas and green LED strips snaking in angular circuitry patterns lighting everything. The floor is made of squares of plate glass separated by a black grid of frames holding them in place, and lit from below with a soft white light. <<if city.timeOfDayState != night_state>>Overall, the place is neither busy nor completely empty. <<first time>>It offers a relatively peaceful respite from the chaos outside, and through that, it seems to have reached a steady equilibrium niche. As long as it remains quieter than outside, a few people will always want to be here, but if too many come in, others start to leave, maintaining the balance.<<only>><<end>>"
    conciseDesc = "A gimmick bar peddling a shabby imitation of northside neogothic chic, but offering welcome peace and quiet compared to the rest of the gray market outside. The bar stands along the east wall, following the longest axis of the rectangular room."
    west = grayMarketPath3
    out asExit(west)
;

+ bar: Fixture, Surface 'bar; green glass; counter'
    "A glass counter underlit by green lights so that it gives an eerie green underlighting to everything around it, recalling to mind old black and white horror movies."
    specialDesc = "The bar counter itself is at the back, running about half the length of the east wall."
    roomPart = defaultEastWall
    roomPartDesc = "The bar runs along about half of the east wall. "
;

+ barstools: Fixture, Chair 'bar stools; ; barstool barstools stool'
    specialDesc = "Circular black-cushioned stools stand in front of it, on which a few patrons sit hunched."
    plural = true
    ambiguouslyPlural = true
;

+ tables: Fixture, Surface 'glass tables; white round'
    "Thick, heavy-duty slabs of glass, milled into a few simple shapes designed to slot together into a simple round table and then rounded at the edges to prevent anyone from cutting themselves. Large white LEDs have been installed into the bases of these tables in order to make them seem to glow with an interior light. The light unfortunately shows off the fact that these tables are <i>covered</i> in scratches. "
    specialDesc = "There are plate glass tables, round and lighted from the inside with a white glow like solid holograms, placed here and there throughout the room."
    plural = true
    ambiguouslyPlural = true
;

+ chairs: Fixture, Chair 'chair; black filigree cast iron'
    "These chairs are made of black cast iron, cheap yet incredibly sturdy. They might have been made for this bar, or they might originally have belonged somewhere else, you can't quite tell. The styling is almost right &emdash; the baroque details that make up the moulded exterior seem almost gothic &emdash; but not quite neogothic, indicating they might be repurposed. If so, you can't begin to guess where they came from."
    specialDesc = "Chairs of cast iron filigree are placed in groups of twos or threes around the tables."
    plural = true
    ambiguouslyPlural = true
;

+ patrons: Decoration 'patrons; ; people customers'
    "A cross section of everyone you might find in the gray market itself. Maybe tending toward the more introverted ones."
    specialDesc = "Here and there, a few patrons sit at the tables or at the bar. "
    plural = true
    ambiguouslyPlural = true
;

clothesTent: Room 'The Clothes & Cosmetics Shop'
    "This is an extremely large tent, larger than any of the other ones you've seen, but poorly lit; racks and racks of used clothing stretch away into the gloom to the south like the ranks of a vagabond army. The place smells musty as only a used clothing shop can, the combination with the gloom conjuring simultaneously a sense of unease and homey familiarity for you. This place is startlingly high-tech for such a simple operation as well. A glowing neon wireframe consensus-hologram, anchored to a nearby cyberDec, advertises the fact that you can check clothes out yourself &emdash; they're each electrochemically tagged, so the moment you leave with any, your account will be charged. The clothes racks also echo this theme: the central pole that the clothes hang off of has strips of UV emittors across its entire length, constantly baking the clothes free of any lice, ticks, or bacteria, filling the tent with a dim purple glow."

    south = clothesTent2
    north = grayMarketPath3
    out asExit(north)
;

+ clothesCounter: Fixture, Surface 'counter'
    "A small counter made of plastic and bent stainless steel. There are no interesting flourishes or quirks to its design, except unless its rigid adherence to function over form and not making statement is a quirk itself. A cheap old cyberDec is built into the center of the table, providing a fine-grained anchorpoint for shared-consensus augreal holograms and secure payment processing so that customers can see their receipts and pay for clothes."
    specialDesc = "A small counter stands at the front of the tent, next to the entrance."
;

+ clothesHologram: Fixture 'consensus hologram sign; consensus-hologram augreal; advertisement ad notice'
    "A simple purple wireframe augreal display, a consensus-hologram, anchored to a nearby cyberDec. "
    readDesc = "The augreal hologram advertises the fact that the clothes here have been electrochemically tagged, so the system will know if you leave with any clothes and automatically charge you. It doesn't seem very secure against theft if someone figures out a way to stop the transaction, but you guess this place has enough clothes that it doesn't matter for whoever runs it."
;

tentClothes: MultiLoc, Decoration 'racks of clothes; clothing; racks'
    "Clothing of every style, age, condition, and description hangs from these stainless steel racks, which stretch off into the dim gray gloom of the tent to the south."
    locationList = [clothesTent, clothesTent2]
;

cosmetics: MultiLoc, Decoration, Surface 'cosmetics shelf'
    "A vast stainless steel skeleton of a shelf, about ten feet tall and stretching off many yards into the gloom of the south of the tent."

    specialDesc = "A massive shelf holding an endless selection of cosmetic cyberware lines the western wall."
    locationList = [clothesTent, clothesTent2]
;

clothesTent2: Room 'The Clothes & Cosmetics Shop (south)'
    "The back half of the clothes and cosmetics tent is so like the first half that it almost gives you a sense of unreality and deja vu. Gloomy, filled with a dim purple glow, quiet, musty. The only difference is that the counter and entrance seem to have disappeared into the murkey gloom, leaving you isolated between head-high racks of clothes which block your view in nearly every direction."
    north = clothesTent
    south = metalFence
    in asExit(south)
    out asExit(north)
;

+ metalFence: Door 'metal fence; ; door'
    "A mesh of stainless steel wire with square holes of about a centimeter to a side. A sign of real neon tubing spells \"JASON'S HARDWARE\" across the fence, dark now, unpowered, probably for what looks like a very long time. The door in the center of the fence is framed by a simple doorframe of stainless steel welded to a gap in the fence itself."
    specialDesc = "A fence made of metal wires to the south divides the tent east to west. The fence has a small door in its center."
    okayOpenMsg = "The door comes open with a shriek and rattle."
    otherSide = metalFenceInside
;

jasonsHardware: Room 'Jason\'s Hardware (1)'
    "You are stuck first by the darkness, then by the stuffy clausterphobia, and finally, as your eyes adjust, by the endless strange electronic shapes that loom out from every direction in the dimness. Wires, hoses, broken robot arms and heads, VR goggles and headsets, power armor helmets, circuitboards, broken cyberDecs, and all manner of other things, all covered in a thick layer of dust. The fence to the north is lined with shelves utterly buried in these strange electronic objects, and you stand in a thin corridor made of similar shelves, which stand to the east and west like walls. The only grudging concession made to free space is a small gap to allow for the door to swing open and for people to step in or out. The corridor of shelves leads a little way to the south and then meets another shelf full of unidentifiable but fainly menacing dim shapes and turns sharply west, deeper into the labrynth of electronic detritus."

    west: TravelConnector
    {
        travelDesc = "You pick your way carefully through the maze of shelving, trying not to bump anything, shying away from the strange shapes that loom out at you from the darkness as you pass.";
        destination = jasonsHardware2;
    }
    south asExit(west)
    north = metalFenceInside
;

+ metalFenceInside: Door 'metal fence; ; door'
    specialDesc = "A fence made of metal wires to the north divides the tent east to west. The fence has a small door in its center."
    okayOpenMsg = "The door comes open with a shriek and rattle."
    otherSide = metalFence
;

jasonsHardware2: Room 'Jason\'s Hardware (2)'
    "There is a small clearing at the center of the maze of shelves, as you might have expected. A bright spotlight deliniates the clearing like a magic circle drawn to keep out whatever electronic daemons might choose to make their homes here. In the center of the spotlight's light stand a small desk with a doctor's chair next to it and, next to those, what appears to be a reclining chair ripped out of some dentist's office. Wires snake to and from the desk, in which a cyberDec is embedded, and between the desk and the dentist's stool."

    north = jasonsHardware
    west asExit(north)
;

+ jasonsDesk: Fixture, Surface 'desk'
    "A simple stainless steel desk with a cheap built in cyberDec, designed to function as a high-precision location anchor for consensus augreal holograms, so that if someone wants to project holograms another person can see, the augreality microprocessors in their eyes can have a common fixed point to figure out where those holograms should be, since ordinarily personal augreality holograms are relative to where you're looking, and augreality advertisements are anchored via optical recognition and GPS tracking based on a central registry, and only have a ten-meter location accuracy. The desk is covered in piles of electronic components, mostly circuitboards and integrated circuits, as well as various tools."
;

+ jasonsChair: Fixture, Chair 'doctor\'s chair; stool'
    "A circular black cushion sits atop a chrome plated stem which fans out to four wheels. A standard doctor's stool."
;

+ dentistChair: Fixture, Bed 'dentist\'s reclining chair'
    "Mint-colored, well cushioned, adjustable, and huge. Foot pedals for the doctor to adjust its positioning stick out of one side of its base."
;
