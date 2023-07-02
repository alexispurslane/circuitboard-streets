megablock1Region: Region
;

megablockEntrance: Room 'M-3B Entrance Hall'
    "This is a small square room of slowly eroding concrete walls, which are painted in an old, chipping gray that you find vaguely distasteful. The exit is east, leading out through the filter-field into the drizzling gloom of the city. West, a few stairs lead up into the <<if scene2.isHappening>>wash of red light from<<else>>shadowy gray-green light of<<end>> the megablock's atrium."

    west = megablockStairs1
    in asExit(west)
    up asExit(west)

    east = megablockExterior
    out asExit(east)

    regions = [megablock1Region]
;
+ megablockStairs1: StairwayUp 'stairs; crumbling concrete entrance; steps'
    "These stairs are made of the same decaying gray concrete as the rest of the megablock's bowels."
    travelDesc = "You slowly trudge up the stairs. <<first time>>As you climb, you idly wonder when the stairways in this godforsaken place will finally give way beneath your feet, killing you.<<only>>"
    destination = megablockBottomFloor
;

+ trash: Fixture 'trash; ; refuse'
    "Trash is everywhere, the refuse of the thousands of people who pass through this entryway every day without a second glance. The corporation doesn't give a fuck, and nobody here has the time or energy to spare to clean it up."
    specialDesc = "Drifts of trash have accumulated in all the corners of the entryway, and flutter a little in the wind from outside."
    cannotTakeMsg = "You don't need any more fucking trash in your life. You've already got corporations and management bots for that."
;

megablockBottomFloor: Room 'M-3B Atrium'
    "The bottom floor of the megablock is a wide open space of concrete interrupted here and there by concrete benches, tables, and what might once have been exercise equipment before the rust took it. It's surrounded on all sides by a densely-packed forest of pillars holding up the floors above. Above you, a shaft rises through the building to the greenhouse roof in the ceiling, through which greenish light sifts lazily down, revealing a dizzying number of apartments all facing inward on the central shaft. A few windows are lighted here and there among the endless ranks. To the south, stairs climb up to the first floor of apartments, where you live. To the west, a short flight of stairs goes down to the entry hall."

    conciseDesc = "A wide, largely featureless expanse of concrete serves as the floor of the tower's atrium. It is interrupted here and there by concrete benches, tables, and rusted exercise equipment and surrounded by pillars. To the south, a flight of stairs climbs up to the first floor of apartments (where you live). To the west, a short flight of stairs goes back down into the entry hall. <<if scene2.isHappening>>Red lights flash ominously from their previously hidden hiding spots tucked up against the tops of the pillars, washing the park benches and exercise equipment in crimson neon highlights<<end>>"

    south = megablockFloor1
    up = megablockFloor1

    out = megablockStairs1b
    west = megablockStairs1b
    down = megablockStairs1b

    regions = [megablock1Region]
;

+ megablockStairs1b: StairwayDown 'stairs; crumbling concrete entrance; steps'
    "These stairs are made of the same decaying gray concrete as the rest of the interior of the megablock."
    destination = megablockEntrance
;

+ playgroundFeatures: Decoration 'atrium attractions; rusted concrete iron metal exercise; bench benches table tables equipment'
    "Judging by these halfhearted attempts at creating a livable space for people to gather and enjoy themselves, some sort of concrete park, the atrium was probably originally intended as a gathering place for residents. No one actually comes here after the first time though; it's far too inhospitable."
;

+ pillars: Decoration 'pillars; thick support; beams'
    "The pillars are old, pitted, but somehow the only things that don't seem to be crumbling in this place. Thank fuck for whatever corporate sellout had the heart left in them to actually design these well."
;

+ windows: Distant 'window; lighted dark; windows'
    "Rows upon rows, floors upon floors of apartment windows stretch up through the atrium above you. They're too distant to see through, and probably would be even if they were close up, given how dirty everything here is."
;

megablockFloor1: Room 'M-3B Floor 1'
    "This is a narrow, gloomy walkway. On the south side, row upon row of apartment doors and windows stretch off to the east and west, while on the north it is crowded by a simple concrete and metal banister broken only by a stairway down into the atrium. Much of the already dim gray-green light from the atrium is blocked by the bottom of the walkway above you, casting most of this passage into shadow."

    north = megablockBottomFloor
    down asExit(north)

    south = apartmentDoorOutside
    in asExit(south)

    east = megablockFloor1a
    west = megablockFloor1b

    regions = [megablock1Region]
;

+ apartmentDoorOutside: Door ->apartmentDoorInside 'apartment door; pink apartment 104; entry doorway'
    "<<if isBroken>>Your apartment door lies on the floor of your apartment, bent and splintered along both vertical edges, hinges hanging from one end like grotesquely deformed bones.<<end>> This door has been covered in so many layers of graffiti by its successive occupants that an archaeologist might be able to trace the ephemerable trends in low-life culture through its skin. Two graffitos stick out in particular: some wry soul has written 'abandon all hope' across the top in nearly illegible handwriting. The other is yours, an abbreviation of one of your father's sardonic sayings: 'home is where the roof is.'"

    specialDesc = "<<if isBroken>>The empty doorway to your apartment gapes, splintered, to the south, inviting you in like a bad childhood influence. Your apartment door lies askew inside the apartment.<<else>>You see your own apartment's door directly south of you, in the center of the row of doors.<<end>>"

    lockedMsg = "You place your thumb on the fingerprint reader on the door handle, but it buzzes aggressively, and the screen above the reader flashes red. It's locked."

    isBroken = nil
    isLocked = true
    attemptedOpen = nil
    attackCount = 0

    dobjFor(Attack)
    {
        verify()
        {
            // passes
        }
        check()
        {
            // passes
        }
        action()
        {
            "You punch the door. It barely scratches, but a hollow boom reverberates out into the empty atrium like undead thunder. <<if attackCount == 0>>You look around warily, but nobody seems to have noticed. Almost everyone is probably sleeping now, aided by pills or dream encoders or even earplugs, exhausted from work.<<end>>";
            attackCount++;
        }
    }

    dobjFor(Kick)
    {
        verify()
        {
            // passes
        }
        check()
        {
            // passes
        }
        action()
        {
            "You kick the center of the door. It jumps back in its frame slightly, enough to make you feel briefly elated, but doesn't budge past that. The kick makes a drumlike booming sound that echoes around the atrium oppressively. <<if attackCount == 0>>You look around warily, but nobody seems to have noticed. Almost everyone is probably sleeping now, aided by pills or dream encoders or even earplugs, exhausted from work.<<end>>";
            attackCount++;
        }
    }

    dobjFor(Open)
    {
        check()
        {
            inherited();
            if (gActionIs(Open) && self.isLocked && !attemptedOpen)
            {
                attemptedOpen = true;
            }
        }
    }
;

++ fingerprintReader: Fixture 'fingerprint reader; apartment door scanner; lock'
    "A simple door handle arches down out of the door at roughly hand-height, the top covered by a glossy black glass screen. A thumbprint icon glows gently on the screen, indicating where to put your thumb to authenticate yourself and access your apartment."
    kickCount = 0

    dobjFor(Kick)
    {
        verify()
        {
            // passes
        }

        count()
        {
            // passes
        }

        action()
        {
            switch (kickCount)
            {
                case 0:
                "You kick with all your might, stamping your boot flat into the door right beside the fingerprint reader, right where the bolt should be. The door lets loose a sepulchral boom which echoes around the atrium like undead thunder. Underneath it, you just barely hear splintering, and the sound of rattling metal. <<if apartmentDoorOutside.attackCount == 0>>You look around warily, but nobody seems to have noticed. Almost everyone is probably sleeping now, aided by pills or dream encoders or even earplugs, exhausted from work. But who knows how long that will last against the thunder of your assault against the door.<<end>>";
                break;
                case 1:
                "You kick again, slamming the flat of your boot into the door's weak spot. Now the splintering is far more audible, as well as the shriek of bending metal. <i>It's working!</i> Somewhere far away, you hear murmurs in the apartments around you. You're starting to draw attention, and that's not good. Property enforcement is bound to come down on you like a military-grade firewall...";
                break;
                case 2:
                "Your leg muscles already burning from kicking, panting slightly, you kick again. Now the door is noticibly bent and set back in its frame. <i>Come on,</i> you think. <i>This is the stupidest thing I've ever done, but I can do it.</i>\b";
                "Orange warning holograms begin flickering in around the entrance. <pre>WARNING WARNING WARNING</pre>\b";
                break;
                case 3:
                "Your final kick sends painful reverberations up the bones in your leg, but it doesn't matter. With a final unholy <i><b>CRACK</b></i>, the door flies backward, skidding across the floor of your apartment until it comes to rest against the far wall. Almost instantly, red augmented reality holograms pop up all over the atrium behind you and plastered around your apartment door like enraged moths.";
                "<pre>WARNING: LEGAL VIOLATION: BREAKING AND ENTERING</pre>";
                "<pre>WARNING: LEGAL VIOLATION: FELONY TRESSPASS</pre>";
                "<pre>WARNING: LEGAL VIOLATION: AUTHORITIES HAVE BEEN ALERTED</pre>";
                "Swiping the alerts away from the entrance, you step into your apartment. You've only got a few seconds to grab your shit and run now. ";
                gPlayerChar.travelVia(apartment, nil);
                apartmentDoorInside.isLocked = nil;
                apartmentDoorOutside.isLocked = nil;
                apartmentDoorOutside.isBroken = true;
                apartmentDoorOutside.isOpenable = nil;
                apartmentDoorOutside.isOpen = true;
            }
            kickCount++;
            apartmentDoorOutside.attackCount++;
        }
    }
;

megablockFloor1a: Room, StopEventList 'M-3B Floor 1 (East Corner)'
    "<<if gPlayerChar.hasSeen(megablockFloor1b)>>Another featureless corner just like the one at the west end of the walkway, an accidental liminal space.<<else>>This corner is a strange lacuna in the densely-packed apartments of M-3B, a place where it doesn't really make sense to fit an apartment, because the others are packed so closely on either side that the door itself would have to be bent in half, yet represents more free wall space than average. It's a strangely liminal space, made even more strange by the fact that, due to the geometry of the walkway above, a little more light from the atrium filters down into it. Instead of the atrium floor, it is these corners that have become the <i>de facto</i> gathering places of the megablock residents &emdash; when anyone has the energy or time to gather, which is rare. The walkway turns north here, onto further rows of apartments.<<end>>"
    conciseDesc = "A slightly brighter corner of the first floor, in between apartment doors, where the walkway turns north."
    west = megablockFloor1
    north = megablockFloor1NorthEast

    eventList = [
        'Far above you, you hear a shout, and a moment later something hurtles past out in the atrium and hits the bottom floor with a splat. It sounds like a piece of food, hopefully.',
        'You hear a woman scream, and then nothing for a long while. Then the sound of voices talking loudly.',
        'Someone brushes past you with out a word.',
        'Two children run past behind you.',
        {: "The gentle rush of air through the vent momentarily makes a long <<one of>>sighing<<or>>whooping<<shuffled>> sound."}
    ]

    regions = [megablock1Region]
;

+ trashcan: Fixture, Container 'trashcan; rubbish; bin, can, trash'
    "A metal wire trashcan, overflowing with mostly plastic wrappers and other needlessly wasteful packaging pieces from all sorts of purchaseable items, including frozen food and technological flotsam like chargers. You haven't had to pay attention to what people throw out in years. With the way things are going right now though? Might have to get used to trash diving again."
    initSpecialDesc = "You see an overflowing trashcan here."
    contentsListedInExamine = nil
    contentsListedInLook = nil

    dobjFor(Search)
    {
        action()
        {
            doInstead(LookIn, trashcan);
        }
    }

    dobjFor(LookIn)
    {
        check()
        {
            if (gPlayerChar.knowsAbout(wrench))
                "You find nothing else useful in the trashcan.";
        }
        action()
        {
            "After a lot of digging around, forcing yourself to ignore all the strange, slick, running textures and sticky pieces of packing that you encounter, you finally come across something interesting: a small, flat metal wrench. It's taped to a shred of cardboard with what looks like assembly instructions for some kind of cyberware on it. A throw-away tool for assembling the parts of a cheaply made piece of iron then. You fish it out. ";
            wrench.discover();
            doNested(Take, wrench);
        }
    }
;

+ wrench: Thing 'wrench; cheap assembly; spanner'
    "A cheap, piddling little thing stamped out of a soft, thin piece of metal."

    isHidden = true
    iobjFor(UnscrewWith)
    {
        preCond = [objHeld]
        verify()
        {
            // passes
        }
        check()
        {
            // passes
        }
    }
;



+ vent: Fixture 'vent; air; duct'
    "<<first time>>The vent provides air conditioning intake for the houses around you, drawing from the air in the atrium, which in turn comes through the forcefield filter at the entryway. Thus, clean air is provided with only one filter necessary. The ultimate in utilitarian efficiency.<<only>> This vent has a metal grate screwed into the concrete in front of it. Although the steel underneath reamins as strong as ever, the grate's surface is almost completely corroded with rust. Even the bolts at each corner of the frame have been worn down to basically flush with the frame itself."
    initSpecialDesc = "You see an exposed vent here, high up in the corner just below the floor of the walkway above."

    dobjFor(Open) { remap = grate; }
    dobjFor(Unscrew) { remap = grate; }
    dobjFor(UnscrewWith) { remap = grate; }

    cannotEnterMsg = 'You pull as hard as you can, but with only your right arm you can\'t get enough leverage to pull the grating\'s bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.';
;

++ grate: Component 'grate; metal stainless steel; grating'
    "This grating is incredibly rusty with disrepair and disuse. You're surprised it hasn't crumbled to dust by now, but despite the rust it's surprisingly sturdy."

    cannotOpenMsg = 'You pull as hard as you can, but with only your right arm you can\'t get enough leverage to pull the grating\'s bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.'
    dobjFor(Unscrew) { remap = bolts; }
    dobjFor(UnscrewWith) { remap = bolts; }
;

+++ bolts: Component 'bolts; stainless steel; bolt'
    "The shaft and lower parts of the heads of these bolts, buried in the concrete for all these years, are completely solid. It's only the top parts of the head, where they stick out past the grating, that have been worn away by exposure to the elements, leaving no purchase at all."

    plural = true
    massNoun = true

    isUnscrewable = true
    cannotUnscrewMsg = 'Although your right arm is undoubtedly strong, and dexterous enough for day to day tasks, there\'s no way you can unscrew these bolts with absolutely nothing to grip onto.'
    cannotUnscrewWithMsg = 'Even with a wrench, there\'s no way you can unscrew these bolts with absolutely nothing to grip onto.'
;

megablockFloor1b: Room, StopEventList 'M-3B Floor 1 (West Corner)'
    "<<if gPlayerChar.hasSeen(megablockFloor1a)>>Another featureless corner just like the one at the east end of the walkway, an accidental liminal space.<<else>>This corner is a strange lacuna in the densely-packed apartments of M-3B, a place where it doesn't really make sense to fit an apartment, because the others are packed so closely on either side that the door itself would have to be bent in half, yet represents more free wall space than average. It's a strangely liminal space, made even more strange by the fact that, due to the geometry of the walkway above, a little more light from the atrium filters down into it. Instead of the atrium floor, it is these corners that have become the <i>de facto</i> gathering places of the megablock residents &emdash; when anyone has the energy or time to gather, which is rare.<<end>> The walkway turns north here, onto further rows of apartments."
    conciseDesc = "A slightly brighter corner of the first floor, in between apartment doors, where the walkway turns north."
    east = megablockFloor1
    north = megablockFloor1NorthWest
    up = vent2
    in asExit(up)

    eventList = [
        'You hear a gentle metallic rumbling from inside the vent.',
        'You can hear the faint sounds of people arguing several apartments away.',
        'Someone brushes past you with out a word.',
        'A child, dead-eyed and dirty, wanders past you.',
        'A man pushes past you hurriedly, seeming to bump you more than he had to. Was that a hand on your ass?',
        {: "The gentle rush of air through the vent momentarily makes a long <<one of>>sighing<<or>>whooping<<shuffled>> sound."}
    ]

    regions = [megablock1Region]
;

+ trashcan2: Unthing 'trashcan; rubbish; bin, can, trash'
    "Unlike the other side of the walkway, there is no trashcan here."
;

+ vent2: TravelConnector, Thing 'vent; air; duct'
    "<<if grate2.isDirectlyIn(self)>>This vent is barred off with a metal grill screwed into the surrounding concrete. The grill gives off a metallic gleam incongruous with its surroundings, as if it has been replaced recently. In each corner of the frame, a small stainless steel bolt is screwed solidly into place.<<else>>The vent, now bereft of its grill, is just an empty hole in the wall, lined on its inside with aluminum. It looks just about wide enough to climb into.<<end>>"

    initSpecialDesc = "You see an exposed vent here, high up in the corner just below the floor of the walkway above."

    destination = airDuct

    dobjFor(Open) { remap = grate2; }
    dobjFor(Unscrew) { remap = grate2; }
    dobjFor(UnscrewWith) { remap = grate2; }

    isEnterable = true
    dobjFor(Enter)
    {
        verify()
        {
            // passes
        }
        check()
        {
            // passes
        }
        action()
        {
            doInstead(TravelVia, vent2);
        }
    }

    canTravelerPass(actor)
    {
        return bolts2.unscrewed;
    }

    explainTravelBarrier(actor)
    {
        "The grate bars off your access to the vent. You pull on the grate as hard as you can, but with only your right arm you can't get enough leverage to pull the grating's bolts out of the wall and get inside, even with your industrial cyberware. ";
    }

    travelDesc = "<<one of>>Grasping one inside edge of the ventilation shaft with your remaining hand, you pull yourself up, relying on the heavy-duty motors of your right arm to be able to life your weight. They whine worryingly, and you hear some concerning clicks and pops, as if gears are grinding together inside it somewhere, but eventually it's able to drag your weight up and into the vent.<<or>>You pull yourself into the vent with your cybernetic arm.<<stopping>> "
;

++ grate2: Component 'grate; metal stainless steel; grating'
    "The grating must have been repaired recently, although you have no idea when. Who in this place gives a fuck about the <i>grates?</i>"
    cannotOpenMsg = 'You pull as hard as you can, but with only your right arm you can\'t get enough leverage to pull the grating\'s bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.'
    dobjFor(Unscrew) { remap = bolts2; }
    dobjFor(UnscrewWith) { remap = bolts2; }
;

+++ bolts2: Component 'bolts; stainless steel; bolt'
    "These bolts are practically new. Made out of cheap metal that will strip easily, but still maintaining their shape so far nonetheless."

    unscrewed = nil
    isUnscrewable = true
    plural = true
    massNoun = true
    dobjFor(Unscrew)
    {
        check()
        {
            "Although your right arm is undoubtedly strong, and dexterous enough for day to day tasks, unscrewing a tiny hexogonal bolt with your bare fingers, when it's mostly embedded in the surrounding metal, is just beyond their capability. <<first time>>Hell, it'd probably be beyond the capabilities of your original 'ganic hands too, although a part of you bitterly wishes you still had your left arm. <<only>>";
        }
    }

    dobjFor(UnscrewWith)
    {
        check()
        {
            if (gIobj != wrench)
            {
                "You can't unscrew the grate with that. ";
            }
        }
        action()
        {
            "With surprisingly little effort, you're able to screw the bolts out of the grate. Freed, the gate falls to the ground with a clattering sound that's loud enough to make you wince. You look around, wondering if anyone's watching, but of course no one is. ";
            bolts2.unscrewed = true;
            bolts2.moveInto(megablockFloor1b);
            grate2.moveInto(megablockFloor1b);
            bolts2.isListed = true;
            bolts2.isDecoration = true;
            grate2.isListed = true;
            grate2.isDecoration = true;
        }
    }
;

megablockFloor1NorthEast: Room 'M-3B Floor 1 (East Side)'
    "Another interminable row of doors and windows, all scratched, pitted, and defaced, stretches away northward on the east side of the walkway. None of the windows are lighted or show any signs of life behind them."
    south = megablockFloor1a

    regions = [megablock1Region]
;

+ Fixture 'doors; scratched pitted defaced apartment; door'
    plural = true
    massNoun = true
    lockedMsg = "You try to unlock a few of the doors with your fingerprint, but they all reject you, as expected, and you doubt there's anything in them that'd make breaking in worth a damn."
    knockOnMsg = "You try knocking on a few doors, but no one responds."
;

+ Fixture 'windows; scratched pitted defaced apartment; window'
    canLookThroughMe = true
    lookThroughMsg = "You try to peer into a few of the windows, but you can't see anything through the grit, scratches, and gloom."
    plural = true
    massNoun = true
;

megablockFloor1NorthWest: Room 'M-3B Floor 1 (West Side)'
    "Another interminable row of doors and windows, all scratched, pitted, and defaced, stretches away northward on the east side of the walkway.\b Most of the windows are dark and apartments empty, but three of the windows on this side are lighted, and you can hear a few faint noises from those apartments, indicating that they are occupied."
    south = megablockFloor1b

    regions = [megablock1Region]
;

+ neighbor1Door: Fixture 'first door; neighbor\'s door front apartment; door'
    "The door nearest you is covered in graffiti, the geologically layered incoherent screams of a thousand successive inhabitants' pain. The window next to it has had its blinds drawn closed against its dreary view of the atrium, but yellow light still filters through and casts bars of light on the dusty walkway in front of you."
    isOpenable = true
    isLocked = true
    dobjFor(KnockOn)
    {
        action()
        {
            "Although you can tell that someone is home, no one responds to your knocking.";
        }
    }
    lockedMsg = "You place your finger against the fingerprint lock on the door handle, but it buzzes red as expected."
;

+ Fixture 'first window; neighbor\'s window apartment; window'
    canLookThroughMe = true
    lookThroughMsg = "The blinds on this window are closed, only letting a few lines of yellow light slip out."
;

+ neighbor2Door: Fixture 'second door; neighbor\'s door front apartment; door'
    "This door seems to have been industriously scrubbed clean of graffiti sometime relatively recently, although not extremely so &emdash; various tags and gang territory marks and other such colorful fungi native to the City have begun to grow back again. Nevertheless, you can tell that someone who lived here used to care a lot about trying to keep their surroundings together as best they could. "
    isOpenable = true
    isLocked = true
    travelMsg = "<<if isOpen>>You could try to push past the man, and probably succeed, but that's not a good idea.<<end>>"
    dobjFor(KnockOn)
    {
        check()
        {
            if (isOpen)
                illogical('The door is already open, there\'s no need to knock.');
        }
        action()
        {
            "You hear a muffled grunt, then shuffling steps. A moment later, the door opens a crack, and a middle-aged man's face peers out at you.";
            john.setState(johnStanding);
        }
    }
    lockedMsg = "You place your finger against the fingerprint lock on the door handle, but it buzzes red as expected."
;

+ Fixture 'second window; neighbor\'s window apartment; window'
    canLookThroughMe = true
    lookThroughMsg = "The blinds on this window are closed, only letting a few bars of yellow light slip out."
;

+ neighbor3Door: Fixture 'third door; neighbor\'s door front apartment; door'
    "The door farthest to you down the hallway might once have been black underneath all of its layered graffiti, but it's hard to tell. The window next to it has not had its blinds drawn closed, unlike the first one, but only a faint blue light shines out, flickering almost subliminally, like a cathode ray tube's glow."
    isOpenable = true
    isLocked = true
    dobjFor(KnockOn)
    {
        action()
        {
            "You knock. A moment later, you hear an unintelligible, but clearly unwelcoming, shout.";
        }
    }
    lockedMsg = "You place your finger against the fingerprint lock on the door handle, but it buzzes red as expected."
;

+ Fixture 'third window; neighbor\'s window apartment; window'
    canLookThroughMe = true
    lookThroughMsg = "The blinds on this window are open, giving you a view of the apartment beyond. The apartment's main lights are off, so it is only lighted by the bright blue glow which emanates from deep within. The light throws everything into deep black silhouettes and sharp outlines, making it difficult to discern the exact nature of anything, but it seems to originate from a prone figure which lies surrounded by a spiderweb of cables and machinery near the rear."
;

+ Fixture 'other doors; scratched pitted defaced apartment; door'
    plural = true
    massNoun = true
    lockedMsg = "You try to unlock a few of the doors with your fingerprint, but they all reject you, as expected, and you doubt there's anything in them that'd make breaking in worth a damn."
    knockOnMsg = "You try knocking on a few doors, but no one responds."
;

+ Fixture 'other windows; scratched pitted defaced apartment; window'
    canLookThroughMe = true
    lookThroughMsg = "You try to peer into a few of the windows, but you can't see anything through the grit, scratches, and gloom."
    plural = true
    massNoun = true
;

overalls: Wearable 'protective overalls; (his) plumber janitor; pads jumpsuit; them'
    "A simple, heavy duty jumpsuit, designed to provide full body protection with a strong material resistant to cuts and scratches, and rubber shoulder and knee pads."
    ambiguouslyPlural = true
    massNoun = true
    owner = [john]
;

class AirDuct: Room, RandomEventList
    eventList = [
        'You hear a rhythmic rattling noise, probably from some misaligned circulation system, from somewhere deeper in.',
        'Air rushes past you on its way through the maze of shafts with a whoosh that flutters your clothes.',
        'A hollow metallic booming, sighing sound reverberates through the vent\'s hollow metal skin.',
        'From somewhere surprisingly nearby, through the vent walls, you hear voices in conversation.',
        'For a second, you let your focus drift, and begin to feel the walls of the vent close in around you, the clausterophobic horror of your situation starting to take hold. You grit your teeth and focus your eyes ahead.'
    ]

    eventPercent = 30

    regions = [megablock1Region]
;

airDuct: AirDuct
    roomTitle = 'Air Duct (Inside Vent)'
    desc = "A corridor of aluminum, studded here and there with sharp screws and barely large enough for you to crawl through, runs into the deep blackness brooding inside the megablock's hollow walls ahead. A faint glow from the atrium casts a few hesitant fingers of light past you into the gloom ahead, revealing that the corridor soon ends in a T intersection. One passageway leads north, following the walkway, while the south opening bends almost immediately back east to follow the south walkway."
    out = megablockFloor1b
    down = megablockFloor1b

    afterTravel(traveler, connector)
    {
        if (!overalls.isWornBy(gPlayerChar))
            "As you pull yourself further into the vent, a screw snags on your pants and then rips through, slicing into your knee. Fucking hell.";
    }

    north: TravelConnector
    {
        destination = airDuctNorth;
        travelDesc = "<<one of>>You shuffle forward awkwardly. <<or>>You squeeze painfully past the screws, which catch on your clothes as you pass. <<purely at random>>"
    }
    south: TravelConnector
    {
        destination = airDuctSouth;
        travelDesc = "You squeeze painfully past the screws, which catch on your overalls but do not penetrate them."

        canTravelerPass(traveler)
        {
            return overalls.isWornBy(traveler);
        }

        explainTravelBarrier(traveler)
        {
            "Your knees are already cut enough, and the screws get far denser around thanks to bend east. These pants may be thick, but they're not specialized protective gear.";
        }
    }
;

airDuctSouth: AirDuct
    roomTitle = 'Air Duct (South, Behind South Walkway)'
    desc = "The air duct here is another screw-studded aluminum corridor, which stretches far away into the darkness. Its floor is lined along the north side with apartment air conditioning vents blocked by grates and fans."

    down = apartmentVent
    out asExit(down)
    in asExit(down)
    north asExit(down)
    west = airDuct
;

+ apartmentVent: TravelConnector, Thing 'vent; apartment home; passage'
    "Peering down past the fan and grating, you can see the floor of your apartment, messy as ever."
    initSpecialDesc = "Once specific vent catches your eye: the one that corresponds to your apartment."

    destination = apartment

    dobjFor(Open) { remap = apartmentGrate; }
    dobjFor(Unscrew) { remap = apartmentGrate; }
    dobjFor(UnscrewWith) { remap = apartmentGrate; }

    canTravelerPass(actor)
    {
        return apartmentBolts.unscrewed;
    }

    explainTravelBarrier(actor)
    {
        "You pull as hard as you can, but with only your right arm you can't get enough leverage to pull the grating's bolts out of the wall and get inside, even with your industrial cyberware. ";
    }

    isEnterable = true
    dobjFor(Enter)
    {
        verify()
        {
            // passes
        }
        check()
        {
            // passes
        }
        action()
        {
            doInstead(TravelVia, apartmentVent);
        }
    }

    travelDesc = "You jump down through the vent and into your apartment, landing in a crouch on the floor with a clump. For a second after landing you totter, your balance thrown by the missing weight of your left arm, then you are able to get a proper footing and stand up. "

    execTravel(actor, traveller, conn)
    {
        inherited(actor, traveller, conn);
        apartmentDoorOutside.makeLocked(nil);
    }
;

+ apartmentGrate: Fixture 'grate; apartment metal stainless steel; grating'
    "A grate not too unlike the one you removed to accesss this duct, although in worse shape."
    cannotOpenMsg = 'You pull as hard as you can, but with only your right arm you can\'t get enough leverage to pull the grating\'s bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.'
    dobjFor(Unscrew) { remap = apartmentBolts; }
    dobjFor(UnscrewWith) { remap = apartmentBolts; }
;

++ apartmentBolts: Component 'bolts; stainless steel; bolt'

    unscrewed = nil
    isUnscrewable = true
    plural = true
    massNoun = true
    dobjFor(Unscrew)
    {
        check()
        {
            "Although your right arm is undoubtedly strong, and dexterous enough for day to day tasks, unscrewing a tiny hexogonal bolt with your bare fingers, when it's mostly embedded in the surrounding metal, is just beyond their capability. <<first time>>Hell, it'd probably be beyond the capabilities of your original 'ganic hands too, although a part of you bitterly wishes you still had your left arm. <<only>>";
        }
    }

    dobjFor(UnscrewWith)
    {
        check()
        {
            if (gIobj != wrench)
            {
                "You can't unscrew the grate with that. ";
            }
        }
        action()
        {
            "With surprisingly little effort, you're able to screw the bolts out of the grate. Freed, the gate and bolts fall through the vent and onto the floor of your apartment with a clatter.";
            self.unscrewed = true;
            self.moveInto(apartment);
            apartmentGrate.moveInto(apartment);
            self.isListed = true;
            self.isDecoration = true;
            apartmentGrate.isListed = true;
            apartmentGrate.isDecoration = true;
        }
    }
;

airDuctNorth: AirDuct
    roomTitle = 'Air Duct (North, Behind West Walkway)'
    desc = "The aluminum corridor stretches away to the north for what seems like miles, dwindling to a point somewhere in the deeper blackness at the far end of the building. The whole length, as far as the light will allow you to see, is dotted here and there with impossibly sharp screws driven through the metal frame. To the south, the corridor continues to the south, broken only by the dim light of the exit to the east. At regular intervals corresponding to the apartments below, rectangular indentations push down out of the east side of the corridor's floor, ending in gratings and fans that pull filtered air from the ducts. Light from only the first three of those apartments illuminates the roof of the corridor in shifting orange hues."

    south = airDuct
    north = "<<if overalls.isWornBy(gPlayerChar)>>You crawl forward through the ducts for awhile, but eventually you lose interest and shuffle back.<<else>>You're unwilling to risk further lacerations by crawling deeper into these ducts without some way to protect yourself.<<end>>"
;

+ grateNorth1: Fixture 'first grate; rectangular apartment first; (grates) vent indentation fan filter'
    "You see an old leather coat hung on a hook taped to the back of the door of the apartment the grate vents into. It's real leather, faded from black to grayish black, and dusty with disuse. The black stitching that holds it together is patterned in decorative lines that sweep in long arcs and then bend in sharp parallel angles, like stylized circuitry. There's something special about this jacket, though: on the inside of the high collar, a flexible screen peeks out, designed to be hooked up to a cortex jack like a netrunner might have. <<first time>><i>What's this person's story?</i> you wonder.<<only>>"

    dobjFor(LookThrough)
    {
        action()
        {
            doInstead(Examine, self);
        }
    }
;

+ grateNorth2: Fixture 'second grate; rectangular apartment second; (grates) vent indentation fan filter'
    "You look through the grate closest to you. It's difficult to see through the slats of the grate and past the blades of the fan, but you appear to be looking down at a generic welcome mat. Two pairs of shoes stand on it, a bair of huge rubber work boots not too unlike your own, and a pair of pink children's sneakers. <<first time>>From somewhere further inside the apartment you're looking into, you hear the sound of a man sobbing.<<only>> On the wall next to the door, you can just make out an old janitor's overalls with thick rubber knee and elbow pads."

    afterAction()
    {
        if (gActor == gPlayerChar && gActionIs(Examine) && gDobj == self)
        {
            gSetSeen(overalls);
        }
    }

    dobjFor(LookThrough)
    {
        action()
        {
            doInstead(Examine, self);
        }
    }
;

+ grateNorth3: Fixture 'third grate; rectangular apartment third; (grates) vent indentation fan filter'
    "Peering through this grate and the fan behind it, it's difficult to tell what you're looking at for a second. Then you realize that the floor is completely hidden in trash. Drifts of it. Piles everywhere. Used food cartons, packaging, other trash you can't even identify. It looks like no one's cleaned here in ages. Not only that, but it's not the apartment's light bulb that's casting light here, but the bright blue glow of... something, further inside the apartment.\b<<more>> Just before you're about to look away, you notice something: all three of the power sockets in the wall near the door have cables plugged into them, which snake away deeper into the apartment. Every now and then, you see them move, as if something is moving on the other end of them. Listening closer, you can hear the sound of someone shuffling around inside the apartment, speaking to nobody at all."

    dobjFor(LookThrough)
    {
        action()
        {
            doInstead(Examine, self);
        }
    }
;
