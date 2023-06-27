grayMarket: OutdoorRoom 'Mandible Block (entrance)'
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

+ grayMarketTents: Distant 'gray market; black; tents tent maggots'
    "Tents of all sizes line the ruins to either side of the small track that snakes out from the hole in the fence, from small single-occupant tents with their sides opened to form a sort of stall defended from the drizzle, to huge house-sized affairs. Everything is lighted in a multitude of colors, a warm glow which does brave battle against the perpetual night's terrors. People bustle about inside and around the various tents, laughing, cheering, shouting, haggling, getting into fights, and generally milling about. For all its foreboding setting, this place feels startlingly <i>human</i>."
;

+ ruins: Distant 'megablock m-3c ruins; gigantic shattered hills bent iron decaying construction jutting failed; rubble equipment lot block bones bone remains rodds walls hopes dreams'
    "Hills of rubble, bent iron rods, and decaying construction equipment, giving way here and there to jutting walls, are all that remains of Better Housing Corp's hopes and dreams. This failed follow-up to the first two megablocks was what ultimately led to their bankrupcy, and the auction that landed Megablock M-3B in the hands of a Smile Corp subsidiary."
;

grayMarketPath1: OutdoorRoom 'Gray Market Path'
    "This is where the path through the gray market begins, at the mouth of the hole in the fence to the west. It widens considerably as it winds away northeastward through the city of tents and street carts nestled between towering piles of broken concrete, rusty iron, and shattered walls. This place is bustling at all times of day, crowds of people filling the path walking to and fro, each wrapped up in their own affairs. You see people standing here and there in front of street vendors waving their arms and talking, others ducking in and out of tents, and the constant rush and babble of humanity fills your ears. Chains of lightbulbs and LEDs are strung from tent to tent, while each tent is lit internally with various hues, some even fading between different colors. In contrast to the cold elsewhere in the city, the body-heat of hundreds of closely-packed people warms the air, which smells of street food, gun oil, and wet concrete. To the north, an old shack slouches, with the word 'CLOSED' scrawled across its face in red spraypaint. To the south, meanwhile, a large white tent has been erected. A sign poster has been driven into the ground outside of it saying simply 'FOOD'. There are a few street vendors around these buildings as well. A small gap between the tent to the south and the the fence leads southwest."

    conciseDesc = "This is where the path through the gray market begins, at the mouth of the hole in the fence to the west. It widens considerably as it winds away northeastward through the city of tents and street carts nestled among the ruins. To the north stands a shack with the word 'CLOSED' scrawled across its face. To the south, a large white tent with a sign that says 'FOOD' has been erected. There are a few street vendors around these buildings as well. A small gap between the tent to the south and the the fence leads southwest."

    northeast = grayMarketPath2
    east asExit(northwest)

    west = grayMarket
    southwest = alleyway

    north = closedCyberwareShopDoor
    south = groceryShop
;

+ shack: Fixture 'closed cyberware shop; red old corrugated metal ramshackle; shack graffiti spraypaint word words'
    "This is a simple shack of corrugated metal, welded together with some not-incosiderable amount of skill and attention to structural integrity, although not the work of a professional or anything close. It isn't small either, more than twenty paces wide at your quick estimation. Despite its sturdy construction, it shows clear signs of age and decay: patches of rust stain its sides, and parts of its roof have been eaten away over the decades by the rain. Graffiti has begun to grow over it as well, just like any other flat surface in this area of this city left too long unattended. <<if tape.isIn(closedCyberwareShopDoor)>>The door has been taped shut with electrical tape, and one<<else>>One<<end>> early piece of graffiti, judging by its fading color and depth in the layers of the stuff, is a huge 'CLOSED' spraypainted across the door diagonally."

    dobjFor(Enter)
    {
        check()
        {
            // passes
        }
        verify()
        {
            // passes
        }
        action()
        {
            doInstead(TravelVia, closedCyberwareShopDoor);
        }
    }
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

closedCyberwareShop: Room 'The Cyberware Shop'
    "Pale, sickly greenish strands of light fall gently from the rain-eaten holes in the shack's roof down to the dirt floor, where thick extension cords and power cables snake back and forth like the wiring board of an ENIAC computer, connecting the dim shapes that fill the room. Squarish shapes, shrouded in veils of ragged tarp, loom at the edges, silently watching you."

    out asExit(south)
    south = closedCyberwareShopDoorInside
;

+ closedCyberwareShopDoorInside: Door ->closedCyberwareShopDoor 'cyberware shop door'
    "The inside of this door is little different from its outside, except for an old, faded paper poster from decades ago, a pulpy movie poster for some long-forgotten cult classic."
;

++ poster: Decoration 'faded movie poster'
    "It's so faded by now you can barely make heads or tails of it."
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
