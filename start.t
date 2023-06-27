#charset "us-ascii"
#include <tads.h>
#include <advlite.h>
#include "extensions/relations.t"
#include "extensions/roomparts.t"
#include "extensions/objtime.t"
#include "extensions/eventListItem.t"

Quip template "desc"? "reply"?;

#include "player.t"
#include "city.t"
#include "verbs.t"
#include "megablock1.t"
#include "apartment.t"
#include "graymarket.t"
#include "coffin.t"
#include "john.t"
#include "actors.t"
#include "tests.t"

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
	gameStartTime = static new Date(2100, 22, 15, 12, 23, 0, 0)
	
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
		
		"Now you're standing outside your apartment tower, trying to put the pieces of your life back together in your head. But they just aren't fitting. With something like this on your record, and a whole captive city to hire from, why would anyone hire you now? Nevertheless, the urge to go into your apartment and get on your deck to try to find another job, the hope that you might luck out and find one willing to take you, pulls you. \b";
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
	endsWhen = (gPlayerChar.isDirectlyIn(megablockFloor1))
;

chapter2: Scene
	startsWhen = (apartmentDoorOutside.attemptedOpen)
	endsWhen = (gPlayerChar.isDirectlyIn(apartment))
	
	whenStarting()
	{
		" You lean your forehead against your door, too shocked to process what's happening but already filled with dread.\b";
		"<b>Chirp</b>. An AR ping from the megablock's automated landlord pops into your field of vision. <i>Shit.</i> You know what this is now. Numbly, you mentally direct it to open. Sure enough.\b";
		"'We regret to inform you,' it says in an empty female voice, 'that due to your recent theft and firing, your CI score has gone below acceptable levels. As per company policy, we have therefore canceled your lease. Your apartment will be reallocated, and all assets that are on company property are forfeit as of this moment.'\b";
		"You want to scream. You want to shout and rail at the injustice of it, you want to slam your remaining fist into the door till it breaks &emdash; the door or your hand, it doesn't matter. By now you should be used to this fucking system. To the way the City works. Somehow you aren't. Somehow it still stings. Is that good? Does that mean you're not broken yet?\b";
		"You stand still for a minute, eyes staring off into nothing, processing. Then something inside you snaps. There's nothing left to lose at this point. Your legal life is already over. And you're not going to let them take your last few possessions. ";
	}

    whenEnding()
    {
        "You look around with a mixture of relief and bitterness. This place has been your home for two years, and you just had to break in. Well, now it's time to grab anything useful and get the fuck out before anyone realizes what you've done. ";
    }
;

chapter3: Scene
    leftApartment = (!gPlayerChar.isDirectlyIn(apartment))
    brokeDoor = (apartmentDoorOutside.isBroken)

    startsWhen = ((brokeDoor || leftApartment) && chapter2.hasHappened)
    endsWhen = (gPlayerChar.isDirectlyIn(street2))

    spawnCops()
    {
        if (gPlayerChar.isIn(megablock1Region))
        {
            cop1.moveInto(megablockEntrance);
            cop2.moveInto(megablockEntrance);
            copCar.moveInto(megablockExterior);

            "Suddenly, you hear the rising wail of sirens from somewhere outside the megablock. A moment later, you hear a staccato <i>whump</i> from around the building as all the other exits are closed off. They'll be waiting for you at the only exit now, calm and assured of their prey. You've been cornered. ";
        }
        else if (gPlayerChar.isDirectlyIn(megablockExterior))
        {
            cop1.moveInto(megablockExterior);
            cop2.moveInto(megablockExterior);
            copCar.moveInto(megablockExterior);

            "The rising wail of sirens, and then the spinning red and blue lights, are your first warnings that you're royally fucked. A moment later, a cop car pulls up beside the megablock entrance and two property enforcement officers step out. You're pinned. ";
        }
        else
        {
            cop1.moveInto(megablockExterior);
            cop2.moveInto(megablockExterior);
            copCar.moveInto(megablockExterior);

            "Far in the distance, you hear the wail of sirens as the police arrive to investigate what you did at the megablock. ";

        }

        new Fuse(self, &despawnCops, 20);
    }

    despawnCops()
    {
        cop1.moveInto(nil);
        cop2.moveInto(nil);
        copCar.moveInto(nil);
    }

    whenStarting()
    {
        if (brokeDoor)
        {
            "\bOutside your apartment, red alarm lights hidden in various places around the atrium, reserved for filtration failures and property crimes against the megablock's holding company, begin flashing neon red, and a constant, high pitched alarm starts to scream in your ears. <i>Clock's ticking,</i> you think to yourself. <i>Need to get the fuck out soon.</i>";
        }
        else
        {
            "The act of leaving the apartment tricks some internal alarm in the apartment's antideluvian logic system &emdash; someone just exited an apartment they never entered, and according to its finite state machine, that's an impossibility, a hole in the universe, and that means <i>crime</i>. Red warning holograms spring into existance clustered around your door and at various stations throughout the atrium like enraged moths, screaming in monospace capitals about breaking and entering and tresspass. <i>Clock's ticking,</i> you think to yourself. <i>Time to get the fuck out.</i>";
        }
        alarms.isHidden = nil;
        new Fuse(self, &spawnCops, 9);
    }
;

alarms: MultiLoc, Decoration 'alarms; red orange monospace capital property legal crime holographic augmented reality; warnings warning alarm holograms'
    "Partially transparent holographic billboards in traceries of red and orange hovering in the air, with monospace capitals spelling out legal warnings in scrolling text: <pre>WARNING: <<one of>>LEGAL VIOLATION: BREAKING AND ENTERING<<or>>LEGAL VIOLATION: FELONY TRESSPASS<<or>>LEGAL VIOLATION: DESTRUCTION OF CORPORATE PROPERTY<<or>>LEGAL VIOLATION: HOUSING CONTRACT TERMINATION VIOLATION<<or>>AUTHORITIES HAVE BEEN ALERTED<<or>>AUTHORITIES ARE ON THEIR WAY<<shuffled>></pre>"
    specialDesc = "Red and orange warning holograms hover all around you."
    cannotTakeMsg = "Your hands pass through the ghostly hologram."
    cannotAttackMsg = "You flail with helpless fury at the hologram, but fail to do any damage."
    notImportantMsg = "You can't touch the holograms."
    isHidden = true
    plural = true
    locationList = [megablockFloor1, megablockBottomFloor, megablockEntrance]
;

megablockExterior: OutdoorRoom 'Outside Megablock M-3B'
	"The street here is dominated by the impossibly large black edifice of Megablock M-3B to the west, glistening in the eternal acid drizzle of the city. To the north, the apartment buildings and offices that surround the megablock like a crowd of ragged worshipers begin to give way to the more ambitious neo-Gothic architecture of the city's richer districts, while to the south, the buildings give way to a precariously leaning maze of slums that crashes up against the huge blocks of the warehouse district beyond like dirty surf. To the east, the warmth and light of the gray market shows like patches of mold on the collapsed ruins of another megablock, which is surrounded by a dilapitated chain-link fence.\b <<if cop1.isDirectlyIn(self) && cop2.isDirectlyIn(self)>>There is a glowing holographic cordon of moving black and yellow stripes around the entrance of the megablock, blocking off all passage while the property enforcement officers finish up their investigation &emdash; not that it'll be hard to figure out who broke into your apartment.<<end>>"

    beforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar && connector != self.north && !cop1.isDirectlyIn(self) && chapter2.hasHappened)
            "As you walk away from the place that's been your home for the past two years, a strange feeling of unreality settles over you. You feel adrift, at sea &emdash; there is nowhere in the world you can return back to now, no fixed place to anchor you, to reassure you that it's always there, waiting for you at the end of every day. A vast, empty chasm seems to have opened up in your heart. Some crucial socket in your psyche your home used to fill is suddenly empty, broken wires hanging, diagnostic lights blinking in the lonely darkness. The fact that you never made any friends here, never had the time, hits home now. There's no one to turn to for help, or a friendly roof over your head. You don't have anything but what you're cradling in your arms. You'll eventually need to find another job, probably under the table to avoid the stigma of a low credit score, but you can't seem to focus on that right now. You just want to find somewhere to lie your head, to store your possessions. A temporary anchor. ";
    }

    north: TravelConnector
    {
        canTravelerPass(actor)
        {
            return chapter3.hasHappened;
        }

        explainTravelBarrier(actor)
        {
            if (chapter3.isHappening)
                "You start to go north toward the corporate district of the city, but, hearing sirens coming from that direction, you quickly turn back. No need to do the pigs' job for them. Better run the other way. ";
            else if (chapter1.isHappening || chapter2.isHappening)
                "The thought of venturing into the rich business district is too exhausting right now. You don't want to deal with the stares at your blue-collar attire and shabby cyberware, or seeing those corporate sons of bitches walking around with their briefcases and three-piece suits. It's sickening, and you've got bigger fish to fry right now. ";
        }

        destination = street1
    }
    south = street2

    east = grayMarket
	west = megablockArch
	in asExit(west)
	
	floorObj = citySidewalk
	
	regions = [city]
;

+ megablockArch: Passage 'entrance; arched; door archway'
	"The entrance to the megablock is a tall, pointed arch that leads into a dim interior. Instead of a door, the entrance is filled by a gently glowing orange filter-field, to keep the acidic air out, so that it's safe to take off your breathing apparatus inside."
	specialDesc = "The arched entrance to the megablock glows invitingly orange to your west."
	destination = megablockEntrance
;

+ ads: Distant 'advertisements; neon AR VR virtual agumented reality; ads'
	"These ads, floating in plots of space rented by various megacorporations from the feudal barons of the clearnet, and automatically overlaid onto your surroundings by your augmented reality enhanced eyes, which are in constant communication with the clearnet's rental databases, claim to provide a veritable cornucopia of distractions for the oxytocin and dopamine-addicted. From AR partners displayed as gigantic etherial manniquens that stride and pose in the concrete parking lot in front of the megablock, to the billboards hawking nano-tailored nootropics and hallucinagens that wrap themselves around the length of the megablock itself, the area is a veritable profusion of ways to waste your hard earned cash."
	specialDesc = "A neon-bright skein of advertisements plays over everything, courtesy of the Megablock's generous sponsors."
;

+ megablock: Distant 'megablock; m-3b, M-3B, black crumbling gigantic large edifice residency; tower skyscraper apartment building windows'
	"The tower is the width and depth of a city block, and many hundreds of stories high judging by the lines of windows, an imposing finger of vertical planes and arches thrusting up at the gray-green sky. Here and there, clotheslines hang out of windows, usually hidden under makeshift awnings in a futile attempt to dry clothes. Every surface is covered in rubber-wrapped pipes and wires, which wrap around everything like ivy choking the life out of a tree, snaking downward toward the ground in patterns that seem almost logical &emdash; to an insane person.\bThe Megablock is the highest density, and therefore cheapest, living arrangement in the city. That is, unless you wanna end up in the slums. It's a chillingly apt monument to the brutality and utilitarian concerns of the new coporate world, a wonderfully efficient machine for holding warm bodies while they're not in use at factories and warehouses and offices. The people who live here are just barely managing to scrape by, and grateful for that."
;

++ pipes: Fixture 'pipes; rusty, snaking, plumming; tubes'
	"The pipes that strangle the tower are ancient, and where visible through the eroded rubber, rusted and pitted. You can spot a few leaks here and there among the tangle, where fittings have loosened or been eroded away entirely. They are almost impossible to actually repair, however, because of their precarious position on the external walls of a tower several hundred stories high."
	plural = true
;

++ clothes: Distant 'clothes; rotten, soot, gray, grey; clothing'
	"A pitiful few articles of clothing. From this distance, it's difficult to see more."
	plural = true
;

++ megablockWindows: Distant 'window; ; windows'
	"Thin, slitted windows with panes of cheap, inch-thick plastic covered with archaeological layers of scratches. A few here and there are lighted, and you can see people moving behind them."
	plural = true
;

street2: OutdoorRoom 'Central City Street (mid)'
    "The six-lane central street of the City, black tarmac shiny in the rain, runs north, past Megablock M-3B towards the business district of the City, and south, toward Warehouse Slum and the coffin hotel, here. The eyeless, staring skulls of gutted office buildings crowd the street like beggars to the east and west, a long-lost legacy of forgotten prosperity carved into brutalist monuments of drab concrete. Despite the width of the road, the narrowness of sidewalks and the crowding of the street by these buildings creates a clausterphobic sensation, as if at any moment these broken-down buildings will collapse in on you.\bA cramped alleyway slinks off to the east, between an office building and the chain link fence of Mandible Block."

    east = alleyway
    north = megablockExterior
    south = street3

	floorObj = citySidewalk
;

+ buildings: Decoration 'office buildings; gutted long-lost bombed-out empty; ruins offices office beggars'
    "The building to the east is about thirteen stories of dirty, brownish concrete and broken windows. The first floor is covered in graffiti, mostly unintelligable except for one phrase which stands out to you, spraypainted in neon vomit-green across the building's door: 'NO CHOICE WHEN THEY OWN THE CHOICES.'\b The building directly west of you is a crumbling, sagging four story office building, with an old, faded sign above the few shattered glass teeth that remain of its double door entrance: 'MURPHEY & SONS.' What it may once have meant, or what business they may have plied, is now long-lost to time, but it must have been an old building, to have a physical sign like that instead of paying for a hologram placement registration. From before that, then. A few decades, maybe."
;

alleyway: OutdoorRoom 'Alley'
    "This alley is a small sidewalk branching off from the main one to the west, tightly pressed on one side by the tall brown office building to the south, and the high chain-link fence to the north, so that you practically have to turn sideways to follow it. The floor here is broken up sidewalk pavement, long since decaying back into rubble. The alley smells of urine and despair."

    west = street2
;

+ fence2: Decoration 'chain link fence; chain-link chain cut high rusted rusty leaning bent'
    "It's a high chain link fence, perhaps eight feet tall, lined with barbed wire at the top. Rust crusts over it here and there. It has been bent down substantially in the center, so that you just might be able to climb it, if you had a something to throw over the barbed wire at the top."
;

street3: OutdoorRoom 'Central City Street (south)'
    "The gutted office buildings on either side of the street to the north begin to give way to equally ancient and decrepit apartment buildings here, which show signs of dissolute habitation. The air is hazy with the smoke from cooking fires high up on the rooves of the apartments, and clothes lines attached to pullies stretch in a criss-cross thicket above you, scratching out the sky."

    north = street2
    west = tunnel
;

+ tunnel: Passage 'concrete tunnel'
    "This is a sort of passageway or arch that runs through the entire apartment above it and out the other side. It's too dark to see inside, but rivulets of water stream out of its mouth, pooling in a depression in the cracked sidewalk at its entrance. At the far end, you can just barely see the other opening, where it presumably lets out. Trash bags sit around the entrance, as if someone put them down for a second while on their way to take them to a dump, but never got around to picking them up again. A few are overflowing, littering their contents around."
    destination = coffinHotel
    travelDesc = "You slip into the tunnel, walking briefly through darkness and the sound of dripping water, before emerging into the relative light on the other side."
    specialDesc = "To the west, you can see that the entranceway into one of the apartments actually leads directly through the entire apartment building and out to the other side, like some kind of dark concrete tunnel. Spraypainted next to the entrance is the word 'COFFIN' in bright red capitals."
;

+ people: Decoration 'people; ; crowds crowd'
    "There are all different kinds of people here, of every imaginable ethnicity, religion, philosophy, and background, every possible sexuality, gender identity, or gender expression, every stage of ability or disability or sickness. Few have extensive cybernetics, beyond cosmetic augmentations like horns, scales, e-ink tattoos, and other such affectations, and what cyberware there is are old models that still use hydraulics, heavy but simple and easy to repair. What unifies them all is their look of utter exhaustion and hopelessness &emdash; red-rimmed eyes stare out at you from sunken sockets with hooded expressions, brows and cheeks prematurely wrinkled with worry-lines, all faces pale and sickly, some gaunt from drugs, others overweight from the cheap food that is accessible. "
    specialDesc = "<<if city.timeOfDayState == busy_state>>People lounge in small clusters of plastic deck chairs and benches under makeshift awnings in the entranceways or balconies of buildings, smoking, drinking, arguing, or cracking jokes with their neighbors, or blissing out on nanotech drugs. Lazy eyes track you with vague, exhausted indifference or stare off into the haze. It is ostensibly loud here with conversation, but there is a subdued undercurrent.<<else if city.timeOfDayState == deserted_state || city.timeOfDayState == night_state>>Empty, white plastic deck chairs and benches stand in apartment entranceways and balconies, empty beer cans, needles and syringes, fast food wrappers, and other detritus litter the ground around them, fluttering slightly in the wind and making a barely-audible pattering sound with the rain.<<else if city.timeOfDayState == nightlife_state>>Some people sit in clusters of plastic deck chairs and benches under makeshift awnings in the entranceways or balconies of buildings, smoking, drinking, arguing, or cracking jokes with their neighbors, or blissing out on nanotech drugs. Others dance in small cleared spaces outside, or on the gutted first floors of the apartments, or rush back and forth across the street, making it impossible to walk five paces without almost running into someone. An air of obstinate, desperate energy suffuses this place, as if each person here is trying, and failing, to party hard enough to forget that work begins the next day.<<end>>"
    isHidden = (city.timeOfDayState == deserted_state || city.timeOfDayState == night_state)
;

+ apartments: Distant 'apartments; decrepit; buildings'
    "The apartment buildings are packed tightly on either side of the street, rising tens of stories up into the sky, seeming to weigh on you. They are festooned with rotting clothes on clotheslines, forgotten or abandoned decorations, ad-hoc repairs in cardboard or corrugated metal, and crumbling balconies, some holding dying gardens. The buildings are crumbling slowly, and little attempt has been made to repair them. No one here has the time, or money."
;
