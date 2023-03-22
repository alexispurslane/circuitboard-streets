#charset "us-ascii"
#include <tads.h>
#include "advlite.h"
#include "extensions/relations.t"
#include "extensions/roomparts.t"
#include "extensions/objtime.t"
#include "extensions/eventListItem.t"
#include "player.t"
#include "city.t"
#include "verbs.t"

versionInfo: GameID
    IFID = 'C62F7146-4A64-450E-B686-5102EE32FE26'
    name = 'Circuitboard Streets'
    byline = 'by Alexis Purslane'
    authorEmail = 'Alexis Purslane <alexispurslane@pm.me>'
    desc = 'An interactive cyberpunk novel.'
    version = '0.1'
;

gameMain: GameMainDef
    initialPlayerChar = me
    gameStartTime = static new Date(2067, 22, 15, 12, 23, 0, 0)

    showIntro()
    {
        "They took your arm. It was in the contract &emdash; fuck, you should've seen it coming. But somehow you hadn't thought it would ever come to this.\b";

        "To get the warehouse job, you'd needed both arms agumented to keep up with the loading mechs. But you'd only been in the city for a couple of years, only managed to get your right arm and spine upgraded. Shit's expensive. So they made you a deal: they pay for the new iron, and you work the job at reduced wages to pay them off. If you left early, well, you didn't pay 'em back for the arm, so they'd take it as compensation.\b";

        "If you'd had the slightest bit of choice, you wouldn't've given up the job, so you didn't think it would be an issue. It was good work. Clock in at 0700 every day, coordinate with the management AI, direct the loading mechs, deal with stuff too small or delicate for them to handle. It was work you could do, and it paid enough to get by, barely. That's all anyone can ask in the City.\b";

        "Then you'd been framed for theft of company property.\b";

        "In a way, you're lucky that's what happened. You can hardly believe that, but that's the ugly truth. If you'd been the one to break the contract instead of them, they could've called in ICS and forced you back onto the job kicking and screaming if they wanted. Or had you accidentally beaten to death in the process.\b";

        "Instead <i>they</i> were the ones that didn't want your sorry thieving prole ass in the production line, so why would they bother bringing you back? Instead they'd kicked you to the curb and ripped your arm off on the way down.\b";

         "Fucking. Lucky.\b";

        inputManager.pauseForMore();
        cls();

        "\b\bWelcome to\n\n";
        "<b>CIRCUITBOARD STREETS</b>\nAn interactive cyberpunk novel by Alexis Purslane\b";

        "Now you're standing outside your apartment tower, trying to put the pieces of your life back together in your head. But they just aren't fitting. With something like this on your record, and a whole captive city to hire from, why would anyone hire you now? Your life is, for all intents and purposes, over.\b";
        "At least, your legal one...\b";
    }
;

modify statusLine
    showStatusRight()
    {
        "<<timeManager.formatDate('%R')>>";
    }
;

chapter1: Scene
    startsWhen = true
    endsWhen = (gPlayerChar.isDirectlyIn(apartment))
;

chapter2: Scene
    startsWhen = nil
    endsWhen = (gPlayerChar.isDirectlyIn(apartment))

    whenStarting()
    {
        " You lean your forehead against your door, too shocked to process what's happening but already filled with dread.\b";
        "<b>Chirp</b>. An AR ping from the megablock's automated landlord pops into your field of vision. <i>Shit.</i> You know what this is now. Numbly, you mentally direct it to open. Sure enough.\b";
        "'We regret to inform you,' it says in a cool female voice that is somehow not reassuring at all, 'that your lease with Mega Holdings Ltd. has been canceled. We have been tracking your employment status and have noted that you have been dishonorably discharged from our partner SMILE Incorporated. We regret to inform you that we are therefore contractually obligated to evict you in favor of your replacement employee. We apologize for the inconvenience, and hope you will reapply if you find a new job with one of our other partners. Thank you.'\b";
        "You want to scream. You want to shout and rail at the injustice of it, you want to slam your right fist into the door till it breaks &emdash; the door or your hand, it doesn't matter. You should be used to this fucking system, to the way the City works, by now, but somehow you aren't. Somehow it still stings, still makes you seethe. Is that good? Does that mean you're not broken yet? Maybe. <i>Or maybe it just means I'm going to snap soon. Go fucking psycho.</i>\b";
        "Despite what the landbot says, though, you still need to get into your apartment. Finally, you make a snap decision. You've got a stash of money in the apartment and an encrypted drive with a few contacts from your old life. They're your only way forward now.\bFuck everything about trying to stay on the right side of the law.";
    }
;

megablockExterior: OutdoorRoom 'Outside Megablock M-3B'
    "The cracked and grimy sidewalk here is dominated by the looming brutalist edifice of Megablock M-3B, the entrance to which is east. Its slick black bulk, a gigantic pile of cubes and vertices, rears upward seemingly in defiance of the natural order itself, blocking out the ghastly sky. Its sheer sides are infested with arial antennae and pipes snaking across their slowly crumbling paint like some sort of invasive species. The city street beside the sidewalk here runs north and south into the towers that march away into the gloom in either direction, a thin canyon road crushed between menacing cliff faces. To the west stands the shopping district."
    conciseDesc = "The sidewalk here is dominated by the looming brutalist edifice of Megablock M-3B, the entrance to which is to the east. To the west, across the street, stands the shopping district. The sidewalk and street you are on leads north and south, disappearing into the gloomy crush of Neo-Gothic towers that is the City."

    north: TravelConnector
    {
        canTravelerPass(traveler)
        {
            return !chapter1.isHappening;
        }
        explainTravelBarrier(traveler)
        {
            "You wander south from the resedential districts for awhile into the gloom of the greater City<<first time>>, mulling over what's happened, hoping that the walk and the thinking will cause something to click into place, but nothing does<<only>>. Eventually, you pull yourself out of your meandering thoughts long enough to realize you've wandered into some only vaguely familiar part of the city, several minutes walk from anywhere you might want to be, so you turn around and go back.";
        }
    }
    south: TravelConnector
    {
        canTravelerPass(traveler)
        {
            return !chapter1.isHappening;
        }
        explainTravelBarrier(traveler)
        {
            "You wander south from the resedential districts for awhile into the gloom of the greater City<<first time>>, mulling over what's happened, hoping that the walk and the thinking will cause something to click into place, but nothing does<<only>>. Eventually, you pull yourself out of your meandering thoughts long enough to realize you've wandered into some only vaguely familiar part of the city, several minutes walk from anywhere you might want to be, so you turn around and go back.";
        }
    }

    west = shoppingDistrict
    in = entrancePassage
    east = entrancePassage

    floorObj = citySidewalk

    regions = [city]
;

+ towers: Fixture 'towers; gothic neo-gothic neo city gloomy; city street'
    "The towers that surround the street that stretches north and south of here are as cyclopean as the megablock, giant spires reaching toward the sky, pressed together into ranks only separated by tiny tributary alleys that soon dissapear into the smoggy air. Their uniformly huge height and tight spacing works to create an oppressive sense of monotony, yet as they go further away the brutalism of the megablocks gives way to the pointed arches and reaching spires of the Neo-Gothic architecture that dominates the rest of the City."
;

+ entrancePassage: Passage 'entryway; megablock, orange, dirty; entry'
    "The megablock's entrance is a horizontally elongated six-sided opening in the wall at its base. Pipes and rubber-sleeved wires route around it as if in afterthought, accentuating its strange polygonal shape. Its inside edges glow with a blinding orange light that diffuses like a halo into the smokey air, casting strange shadows on the small concrete pad that leads up to it as well as the entrance hall itself, which is strewn with drifts of refuse produced by thousands of people coming in and out each day with groceries and trash."
    destination = megablockEntrance
;

+ megablock: Fixture 'megablock; m-3b, M-3B, black, crumbling, gigantic, brutalist, ediface, residency; tower, skyscraper, apartment, building, windows'
    "A residency tower is the highest of high-density living situations in the City, a chillingly apt monument to the brutality and utilitarian concerns of the new corporate, urban reality. Only the poorest of the poor live here &emdash; so most of the city. It is not a pleasant place to live. Overcrowded yet somehow isolating, grimy and littered with refuse, an oppressive monument to engineering yet crumbling pathetically. As you look up at it, you notice that some of the clothes that typically hang out of windows to dry appear to have been forgotten or blown out of reach by the wind, and have begun to rot away to soot-stained tatters."
;

++ pipes: Fixture 'pipes; rusty, snaking, plumming; tubes'
    "The pipes that strangle the tower are ancient, rusted and pitted from exposure to the elements, and leaking here and there where fittings have loosened or been eroded away entirely. They are almost impossible to actually repair, however, because of their precarious position on the external walls of a tower several hundred stories high."
    plural = true
;

++ antennae: Distant 'antennae; spikey, gothic; antenna, arials'
    "The antennae that bristle up from every vertical or semi-vertical surface on the tower give it a jagged, strangely grasping appearance, as if it rushes up to clutch at the sky with a thousand tiny spines."
    plural = true
;

++ clothes: Distant 'clothes; rotten, soot, gray, grey; clothing'
    "A pitiful few articles of clothing. From this distance, it's difficult to see more. <<first time>>You wonder whose clothes they are, and what they'll do without them.<<only>>"
    plural = true
;

Doer 'look north|south'
    strict = true
    execAction(cmd)
    {
        doInstead(Examine, towers);
    }
;

megablockEntrance: Room 'M-3B Entrance Hall'
    "This is a simple room, little more than a staging area to add some architectural breathing room before mounting the stairs and finding your way to your apartment. The slowly eroding concrete walls, ceiling, and floor are painted in an old, chipping gray that you find vaguely distasteful. The exit is west, back out into the drizzling gloom of the city. East, a few stairs lead up into the shadowy gray-green light of the megablock's atrium."

    in = megablockStairs1
    east = megablockStairs1
    up = megablockStairs1

    out = exitPassage
    west = exitPassage
;
+ exitPassage: Passage 'exit; megablock, orange, dirty; entry, entryway'
    "From the inside, the warm orange glow of the entryway's inside edges turns the outdoors into flat blackness that you cannot see beyond."
    destination = megablockExterior
;
+ megablockStairs1: StairwayUp 'stairs; crumbling concrete entrance; steps'
    "These stairs are made of the same decaying gray concrete as the rest of the interior of the megablock."
    travelDesc = "You slowly trudge up the stairs. <<first time>>As you climb, you idly wonder when the stairways in this godforsaken place will finally give way beneath your feet, killing you.<<only>>"
    destination = megablockBottomFloor
;

+ trash: Fixture 'trash; ; refuse'
    "Trash is everywhere, the refuse of the thousands of people who pass through this entryway every day without a second glance. The corporation doesn't give a fuck, and nobody here has the time or energy to spare to clean it up."
    specialDesc = "Drifts of trash have accumulated in all the corners of the entryway, and flutter a little in the wind from outside."
    cannotTakeMsg = "You don't need any more fucking trash in your life. You've already got corporations and management bots for that."
;

megablockBottomFloor: Room 'M-3B Atrium'
    "The bottom floor of the megablock is a largely featureless, wide open space of concrete, interrupted here and there by concrete benches, tables, and what might once have been exercise equipment before the rust took it, and surrounded by a densely-packed forest of pillars holding up the floors above. Above you, a shaft of empty air rises up to the greenhouse roof in the ceiling through which greenish light lazily sifts down, revealing dizzyingly endless floors of apartments all facing inward on the central shaft. A few windows are lighted here and there among the endless ranks. To the south, stairs climb up to the first floor of apartments, where you live. To the west, a short flight of stairs goes down to the entry hall."

    conciseDesc = "A wide, largely featureless expanse of concrete serves as the floor of the tower's atrium. It is interrupted here and there by concrete benches, tables, and rusted exercise equipment and surrounded by pillars. To the south, a flight of stairs climbs up to the first floor of apartments (where you live). To the west, a short flight of stairs goes back down into the entry hall."

    south = megablockFloor1
    up = megablockFloor1

    out = megablockStairs1b
    west = megablockStairs1b
    down = megablockStairs1b
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
    "The stairs open onto the walkway directly south of the door to your apartment, number 104. To the east and west, rows of similar doors march away on one side of the walkway, while on the other a low concrete wall topped with a metal guardrail provides some protection from falling. The light from the atrium's greenhouse roof high above is mostly blocked under the suffocating roof of the walkway of the floor above, casting everything into shadow."
    down = megablockBottomFloor
    north = megablockBottomFloor
    in = apartmentDoorOutside
    south = apartmentDoorOutside
    east = megablockFloor1a
    west = megablockFloor1b
;

+ apartmentDoorOutside: Door 'apartment door; pink apartment 104; entry doorway'
    "You painted it a bright neon pink with a can of spraypaint you bought across the street when you moved in, in a fruitless attempt to liven the place up and add some spark of individuality. It didn't help. In the gloomy green light, it hardly even looks like pink."

    lockedMsg = "You try to open your apartment door, but find that it's locked."
    isLocked = true
    otherSide = apartmentDoorInside

    dobjFor(Open)
    {
        check()
        {
            inherited();
            if (gActionIs(Open) && self.isLocked && !chapter2.isHappening)
            {
                new Fuse(chapter2, &start, 0);
            }
        }
    }
;

megablockFloor1a: Room, StopEventList 'M-3B Floor 1 (East Side)'
    "<<if gPlayerChar.hasSeen(megablockFloor1b)>>Another featureless corner just like the one at the west end of the walkway, an accidental liminal space.<<else>>This corner is a strange lacuna in the densely-packed apartments of M-3B, a place where it doesn't really make sense to fit an apartment, because the others are packed so closely on either side that the door itself would have to be bent in half, yet represents more free wall space than average. It's a strangely liminal space, made even more strange by the fact that, due to the geometry of the walkway above, a little more light from the atrium filters down into it. Instead of the atrium floor, it is these corners that have become the <i>de facto</i> gathering places of the megablock residents &emdash; when anyone has the energy or time to gather, which is rare. The walkway turns north here, onto further rows of apartments.<<end>>"
    conciseDesc = "A slightly brighter corner of the first floor, in between apartment doors, where the walkway turns north."
    west = megablockFloor1

    eventList = [
        'Far above you, you hear a shout, and a moment later something hurtles past out in the atrium and hits the bottom floor with a splat. It sounds like a piece of food, hopefully.',
        'You hear a woman scream, and then nothing for a long while. Then the sound of voices talking loudly.',
        'Someone brushes past you with out a word.',
        'Two children run past behind you.',
        {: "The gentle rush of air through the vent momentarily makes a long <<one of>>sighing<<or>>whooping<<shuffled>> sound."}
    ]
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
            "After a lot of digging around, forcing yourself to ignore all the strange, slick, running textures and sticky pieces of packing that you encounter, you finally come across something interesting: a small, flat metal wrench. It's taped to a shred of cardboard with what looks like assembly instructions for some kind of cyberware on it. A throw-away tool for assembling the parts of a cheaply made piece of iron then. ";
            doNested(Take, wrench);
        }
    }
;

++ wrench: Thing 'wrench; cheap assembly; spanner'
    "A cheap, piddling little thing stamped out of a soft, thin piece of metal."
;

+ vent: Fixture 'vent; air; duct'
    "<<first time>>The vent provides air conditioning intake for the houses around you, drawing from the air in the atrium, which in turn comes through the forcefield filter at the entryway. Thus, clean air is provided with only one filter necessary. The ultimate in utilitarian efficiency.<<only>> This vent has a metal grate screwed into the concrete in front of it. It's almost completely corroded with rust and covered in years worth of grit, so that the bolts at each corner of the frame are basically flush with the frame itself."
    initSpecialDesc = "You see an exposed vent here, high up in the corner just below the floor of the walkway above."

    dobjFor(Open) { remap = grate; }

    dobjFor(Enter)
    {
        verify()
        {
        }
        check()
        {
            "You pull as hard as you can, but with only your right arm you can't get enough leverage to pull the grating's bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.";
        }
    }
;

++ grate: Component 'grate; metal stainless steel; grating'
    "This grating is incredibly rusty with disrepair and disuse. You're surprised it hasn't crumbled to dust by now, but despite the rust it's surprisingly sturdy."

    cannotOpenMsg = 'You pull as hard as you can, but with only your right arm you can\'t get enough leverage to pull the grating\'s bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.'
    dobjFor(Unscrew) { remap = bolts; }
;

+++ bolts: Component 'bolts; stainless steel; bolt'
    "The shaft and lower parts of the heads of these bolts, buried in the concrete for all these years, are completely solid. It's only the top parts of the head, where they stick out past the grating, that have been worn away by exposure to the elements, leaving no purchase at all."

    isUnscrewable = true
    dobjFor(Unscrew)
    {
        check()
        {
            "Although your right arm is undoubtedly strong, and dexterous enough for day to day tasks, there's no way you can unscrew these bolts with absolutely nothing to grip onto.";
        }
    }
;

megablockFloor1b: Room, StopEventList 'M-3B Floor 1 (West Side)'
    "<<if gPlayerChar.hasSeen(megablockFloor1a)>>Another featureless corner just like the one at the east end of the walkway, an accidental liminal space.<<else>>This corner is a strange lacuna in the densely-packed apartments of M-3B, a place where it doesn't really make sense to fit an apartment, because the others are packed so closely on either side that the door itself would have to be bent in half, yet represents more free wall space than average. It's a strangely liminal space, made even more strange by the fact that, due to the geometry of the walkway above, a little more light from the atrium filters down into it. Instead of the atrium floor, it is these corners that have become the <i>de facto</i> gathering places of the megablock residents &emdash; when anyone has the energy or time to gather, which is rare.<<end>> The walkway turns north here, onto further rows of apartments."
    conciseDesc = "A slightly brighter corner of the first floor, in between apartment doors, where the walkway turns north."
    east = megablockFloor1

    eventList = [
        'You hear a gentle metallic rumbling from inside the vent.',
        'You can hear the faint sounds of people arguing several apartments away.',
        'Someone brushes past you with out a word.',
        'A child, dead-eyed and dirty, wanders past you.',
        'A man pushes past you hurriedly, seeming to bump you more than he had to. Was that a hand on your ass?',
        {: "The gentle rush of air through the vent momentarily makes a long <<one of>>sighing<<or>>whooping<<shuffled>> sound."}
    ]
;

+ trashcan2: Unthing 'trashcan; rubbish; bin, can, trash'
    "Unlike the other side of the walkway, there is no trashcan here."
;

+ vent2: Enterable 'vent; air; duct'
    "This vent is barred off with a metal grill screwed into the surrounding concrete. The grill gives off a metallic gleam incongruous with its surroundings, as if it has been replaced recently. In each corner of the frame, a small stainless steel bolt is screwed solidly into place."
    initSpecialDesc = "You see an exposed vent here, high up in the corner just below the floor of the walkway above."
    destination = airDuct

    dobjFor(Open)
    {
        remap = grate2;
    }

    dobjFor(Enter)
    {
        check()
        {
            if (!bolts2.unscrewed)
                "You pull as hard as you can, but with only your right arm you can't get enough leverage to pull the grating's bolts out of the wall and get inside, even with your industrial cyberware.";
        }
        report()
        {
            "Grasping one inside edge of the hole the grate left with your remaining hand, you pull yourself up, relying on the heavy-duty motors to be able to life your weight. Its motors whine worryingly, and you hear some concerning clicks and pops, as if gears are grinding together inside it somewhere, but eventually it's able to drag your weight up and into the vent.";
        }
    }
;

++ grate2: Component 'grate; metal stainless steel; grating'
    "The grating must have been repaired recently, although you have no idea when. Who in this place gives a fuck about the <i>grates?</i>"
    cannotOpenMsg = 'You pull as hard as you can, but with only your right arm you can\'t get enough leverage to pull the grating\'s bolts out of the wall and get inside without needing to unscrew the bolts first, even with your industrial cyberware.'
    dobjFor(Unscrew) { remap = bolts2; }
;

+++ bolts2: Component 'bolts; stainless steel; bolt'
    "These bolts are practically new. Made out of cheap metal that will strip easily, but still maintaining their shape so far nonetheless."

    unscrewed = nil
    isUnscrewable = true
    dobjFor(Unscrew)
    {
        check()
        {
            "Although your right arm is undoubtedly strong, and dexterous enough for day to day tasks, unscrewing a tiny hexogonal bolt with your bare fingers, when it's mostly embedded in the surrounding metal, is just beyond their capability. Hell, it'd probably be beyond the capabilities of your original 'ganic hands too, although a part of you bitterly wishes you still had your left arm.";
        }
    }
;

Doer 'unscrew bolts with wrench; unlock grate with wrench; open grate with wrench'
    when = (wrench.isDirectlyHeldBy(gPlayerChar))
    where = megablockFloor1b
    execAction(cmd)
    {
        "With surprisingly little effort, you're able to screw the bolts out of the grate. Freed, the gate falls to the ground with a clattering sound that's loud enough to make you wince. You look around, wondering if anyone's watching, but of course no one is.";
        bolts.unscrewed = true;
        bolts.moveInto(megablockFloor1b);
        grate.moveInto(megablockFloor1b);
    }
;

apartment: Room, RandomEventList 'Apartment 104'
    "Your apartment is a small one room studio affair with unpainted and untreated concrete walls and a plastic floor designed to look like tile. It is densely populated with an assortment of the things required for living: a small electric stove, refrigerator, and counter, inset with a sink and cabinets underneath, stand against the east wall below a large flatscreen TV. To the west, a convertable futon, <<if futon.couchMode>>currently folded up to form a couch<<else>>currently pulled out into its bed form<<end>>, takes up the opposite wall and a cluttered nightstand-cum-table stands next to it. To the south, a plastic curtain hides the tiny bathroom. Beside the pink door to the north, a grimy window looks out onto the megablock's atrium."

    eventList = [
        {: "The television murmers <<one of>>an ad jingle<<or>>some corporate slogan<<or>>a long list of disclaimers and side effects<<at random>> in the background." },
        'You hear someone murmer in one of the apartments next door.',
        {: "You hear the sound of two people arguing a few apartments away. The voices rise louder and louder, until they are practically shouting and you can almost make out the words. Then there is a cry, and the arguing stops. You swear you can almost hear a <<one of>>man<<or>>woman<<or>>child<<or>>person<<at random>> sobbing." },
        'You hear the muted whirring and gurgling of the pipes outside your southern wall.',
        {: "You hear a loud <<one of>>thump<<or>>scraping sound<<or>>clatter<<or>>tapping sound<<at random>> from above you."}
    ]

    eventPercent = 20

    travelCount = 0

    afterTravel(traveler, connector)
    {
        if (travelCount % 3 == 0)
            "Although it's a meager place to live, it's home, and you feel a small weight lift off your shoulders.";
        self.travelCount++;
    }

    out = apartmentDoorInside
    north = apartmentDoorInside
;

+ nightstand: Fixture, Surface 'nightstand; cluttered bed; table'
    "Your nightstand, which also serves as a table for eating, especially when you've collapsed onto the couch to watch TV until sleep takes you after a long day at work, is covered in clutter: "
;

+ walls: Decoration 'walls; concrete untreated unpainted gray; wall'
    "The walls are smooth to the touch, some kind of sanded concrete. At least they had the courtesy to sand it."
;

+ window: Decoration 'window'
    "You've tried to clean this window in the past, but nothing really seems to make it any less dingy. Its dark, sooty tinge seems to have been baked in at the factory. Cheap manufacturing, maybe. Looking out, you get a fucking great view of nothing much at all but the gray concrete walkway outside, the concrete balcony, and the apartments across from you. Even a view of the desolate bottom floor would've been better, but the angles just didn't work out right."
;

+ futon: Surface, Fixture 'futon; convertible; couch bed'
    "This futon came with the apartment, left behind by the previous owner. You did your best to clean it before using it, but who knows how clean it actually is. It certainly doesn't <i>look</i> clean, anyway, but you've long since given up caring about looks. A thin, well-worn pillow in a blue pillowcase and a thick green cotton blanket, both of which you've kept with you since your first apartment at sixteen, sit in their respective places on the <<if couchMode>>couch<<else>>bed<<end>>."

    couchMode = nil

    dobjFor(Pull)
    {
        check()
        {
            if (!self.couchMode)
                "The futon is already opened up into the bed mode.";
        }
        action()
        {
            "With some effort, you manage to force the futon's rusty hinges to open up, folding the bed out satisfyingly into bed mode. you arrange the pillow and blanket on it.";
            self.couchMode = nil;
        }
    }

    dobjFor(Push)
    {
        check()
        {
            if (self.couchMode)
                "The futon is already folded into the couch mode.";
        }
        action()
        {
            "With a heave, you lift the edge of the futon bed and coax it into folding back into a couch.";
            self.couchMode = true;
        }
    }
;

+ counter: Decoration 'counter; ; cupboard cupboards countertop sink'
    "The counter would already have been almost unusably cramped had it been unbroken; split up as it is by the sink, it's nearly unusable, practically designed to force you to eat freezer food instead."
;

+ stove: Decoration 'stove; electric small; oven'
    "The oven is a tiny affair, an unholy melding of eletric cooktop and microwave oven designed to offer as much utility as possible without actually allowing you to keep anything particularly impressive. Not that you would anyway."
;

+ tv: Switch, Fixture 'TV; ; television advertisements'
    "The only piece of even relatively high quality tech in this apartment, besides what's on your body is the television. The slim rectangle, borderless and barely a few millimeters thick, displays an endless tide of advertisements paid for by the shareholders, investors, and customers of the megablock. Whether this is the megablock's main business, or just a source of secondary profit, is unknown, but given the fact that the television is impossible to turn off, and the heavy fines and automatic replacement that comes with destroying it, many have begun to suspect these buildings are mostly just holding pens for saleable attention."

    dobjFor(SwitchOff)
    {
        check()
        {
            "There's physically no way to turn the television off.";
        }
    }

    dobjFor(Attack)
    {
        check()
        {
            "You really can't afford that fine right now.";
        }
    }
;

+ apartmentDoorInside: Door 'apartment door; pink apartment 104; exit doorway'
    otherSide = apartmentDoorOutside
    isLocked = true
;