#charset "us-ascii"
#include <tads.h>
#include <advlite.h>
#include "extensions/relations.t"
#include "extensions/roomparts.t"
#include "extensions/postures.t"
#include "extensions/eventListItem.t"

Quip template "desc"? "reply"?;
string template <<time of day * as words>> displayTimeOfDay;

#include "player.t"
#include "city.t"
#include "verbs.t"
#include "megablock1.t"
#include "apartment.t"
#include "graymarket.t"
#include "southside.t"
#include "coffin.t"
#include "john.t"
#include "actors.t"
#include "tests.t"

versionInfo: GameID
	IFID = 'C62F7146-4A64-450E-B686-5102EE32FE26'
	name = 'Circuitboard Streets'
	byline = 'by Alexis Purslane'
	authorEmail = 'Alexis Purslane <alexispurslane@pm.me>'
	desc = 'An interactive cyberpunk novel inspired by immersive sims.'
	version = '0.1'
;

modify statusLine
	showStatusRight()
    {
        "<<time of day city.timeOfDayState as words>>";
	}
;

aboutMenu: MenuItem 'About';
+ MenuItem 'About Circuitboard Streets';

++ MenuLongTopicItem 'About the Game'
    menuContents = 'Circuitboard Streets is my first work of interactive fiction. It is a cyberpunk story, directly inspired by movies like Blade Runner and Ghost in the Shell, books like Hardwired and Neuromancer, and R. Talsorian Games\' Cyberpunk universe, as well as my own anarchist, punk, queer, and technological ethos and experience (athough it is not even remotely autobiographical).\bIts existence represents a confluence of a few disparate but interrelated factors.\bFirst, the fact that my two favorite hobbies are programming and writing science fiction. Second, that I am deeply interested in semantic (as opposed to numerical/quantitative) logic and simulations in computers, and this has led me to an abiding interest in parser-based interactive fction. Third, that, due to a functional neurologic disorder which makes reading and especially watching TV painful and difficult, I have been playing a lot of parser IF with my girlfriend (she reads aloud to me) as a leasure activity, and I noticed a rather conspicuous gap in the IF genre: cyberpunk and queer long-form games. Fourth, that my FND allows me to work on things for a limited amount of time each day.\bIt also represents two different experiments in parser interactive fiction gameplay and storytelling: first, how much of the feel of immersive sim gameplay, like the gameplay found in Deus Ex, can I imitate in parser IF? It seems very amenible to that sort of problem-solving, world-model-interaction motivated gameplay on the surface, perhaps even better adapted to it than 3D games! And second, how can I subtly and naturally coax my readers into inhabiting the subjectivity of a player character who is likely very different than them, instead of merely experiencing a factually-described world via their own subjectivity, as in most large parser IF works?\b Is all of this entirely too ambitious for someone\'s first foray into parser interactive fiction? Should I have started with a small competition entry instead, perhaps a showcase of just a few of these ideas? Probably. But I\'ve never been able to contain my ambition like that. I\'m an all or nothing person, I either want to lasso the moon or I\'m not interested. And I have no qualms about facing off against an impossible task either &emdash; for me, the fight, no matter how doomed it may be, is half the point. Some things are just worth trying. This is, coincidentally, one of the fundamental themes of the game. So I ask your patience and understanding with this overambitious work, and hope you enjoy it. <3'
;

++ MenuLongTopicItem 'Augmented Reality and Holograms: Background'
    menuContents = 'In this cyberpunk world, everyone has implants in their eyes that project digital displays into their retinas, allowing them to use augmented reality at all times without the need to wear glasses. This allows a number of functionalities.\b Firstly, there is the ARTek corporation\'s central location-based registry of hologram emplacements. This is a central spatial database of agumented reality displays (holograms) provided by their servers that all augmented-reality-capable eyes connect to to determine if, at their present location and direction, an augmented reality hologram should be visible to the wearer, and if so, how it should be projected into the world for them. This database has a resolution of about ten feet. Companies and individuals can purchase a plot of virtual "land" in this database from ARTek to have an augmented reality hologram placed into the world visible to everyone. This system of course implies that everyone\'s location and heading is constantly streamed to the central ARTek databases, and that is true. In fact, LIDAR scans of the three-dimensional shapes of everything you see are also streamed to ARTek so they can build a live composite three-dimensional scale model of the city so they can determine where emplacements can go.\b The second function of these augmented reality implants is to provide each person with a personal augmented reality hud (heads-up-display) visible only to them, which functions as their combined smartphone and personal computer. This is used for all the normal personal communication and computing tasks, and has basically supplanted all other types of computing, although these eye implants typically have very limited processing power and so more strenuous computing tasks are supplemented with cyberDecs, which connect wirelessly to your augreality eye implants and convert your implants into a remote terminal through which you access the cyberDec.\b The third function of augreality eye implants is to allow virtual teleconferencing. This is done by projecting a simulated model of each participant in the teleconferencing call into the field of vision of each other participant, wherever they may be, using the spatial model of the world provided by ARTek. Alternatively, when calling one-on-one, you can choose to be "transported" into the other person\'s location, whereupon the implants will replace your entire field of view with a reconstruction of their location from your perspective, also courtesy of ARTek.'
;

++ MenuLongTopicItem 'Special Commands'
    menuContents = 'This game has a few special commands. To use your augreality hud, for instance in order to pay someone, look up their identity, contact them, or connect to your cyberDec, simply type a command as if you are interacting with something in the world around you, and the hud will appear: PAY [someone], IDENTIFY [someone], CONNECT TO [cyberdec] or CALL [someone].'
;

+ MenuLongTopicItem 'Acknowledgements'
    menuContents = 'Thanks to Joey Cramsey and John Ziegler for helping me out a ton with TADS. Thanks to my girlfriend for being an entirely-too-patient playtester and my biggest fan.'
;

gameMain: GameMainDef
	initialPlayerChar = me

	showIntro()
    {
        "<center><img src=\"cover2.png\" width=\"800\" height=\"800\"/></center>";

        inputManager.pauseForMore();
        cls();
		"They took your arm. It was in the contract &emdash; fuck, you should've seen it coming. But somehow you hadn't thought it would ever come to this.\b";
		
		"To get the warehouse job, you'd needed both arms agumented to keep up with the loading mechs. But you'd only been in the city for a couple of years, only managed to get your right arm and spine upgraded. Shit's expensive. So they made you a deal: they pay for the new iron, and you work the job at reduced wages to pay them off. If you left early, well, you didn't pay 'em back for the arm, so they'd take it as compensation.\b";
		
		"If you'd had the slightest bit of choice, you wouldn't've given up the job, so you didn't think it would be an issue. It was good work. Clock in at 0700 every day, coordinate with the management AI, direct the loading mechs, deal with stuff too small or delicate for them to handle. It was work you could do, and it paid enough to get by, barely. That's all anyone can ask in the City. And it was so much better than the hellscape you'd escaped.\b";
		
		"Then you'd been framed for theft of company property.\b";
		
		"In a way, you're lucky that's what happened. You can hardly believe that, but that's the ugly truth. If you'd been the one to break the contract instead of them, they could've called in ICS and forced you back onto the job kicking and screaming if they wanted. Or had you accidentally beaten to death in the process.\b";
		
		"Instead <i>they</i> were the ones that didn't want your sorry thieving prole ass in the production line, so why would they bother bringing you back? Instead they'd kicked you to the curb and ripped your arm off on the way down.\b";
		
		"Fucking. Lucky.\b";
		
		inputManager.pauseForMore();
		cls();
		
		"This is...\n<h1>CIRCUITBOARD STREETS</h1>\nAn interactive cyberpunk novel by Alexis Purslane";

        "<h3>Chapter 1</h3>";
        "<blockquote><i>Welcome to the future\nAn always ice-cold nightmare\nBurnt coffee and Percocets\nThis night too will end...</i></blockquote>\n&ndash; Against Me, <i>Unconditional Love</i>\b";

		"Now you're standing outside your apartment tower, trying to put the pieces of your life back together in your head. But they just aren't fitting. With something like this on your record, and a whole captive city to hire from, why would anyone hire you now? And without a job, how are you going to survive? Get food, shelter, the medicine you need? You need to get into your apartment and start exploring the 'net, looking for something, <i>anything.</i> \b";
	}
;

chapter1: Scene
	startsWhen = true
	endsWhen = (gPlayerChar.isDirectlyIn(megablockFloor1))

    whenStarting()
    {

    }
;

scene1: Scene
	startsWhen = (apartmentDoorOutside.attemptedOpen)
	endsWhen = (gPlayerChar.isDirectlyIn(apartment))
	
	whenStarting()
	{
		" You lean your forehead against your door, too shocked to process what's happening but already filled with dread.\b";
		"<b>Chirp</b>. An augreal ping from the megablock's automated landlord pops into your field of vision. <i>Shit.</i> You know what this is now. Numbly, you mentally direct it to open. Sure enough.\b";
		"'We regret to inform you,' it says in an empty female voice, 'that due to your recent theft and firing, your CI score has gone below acceptable levels. As per company policy, we have therefore canceled your lease. Your apartment will be reallocated, and all assets that are on company property are forfeit as of this moment.'\b";
		"You want to scream. You want to shout and rail at the injustice of it, you want to slam your remaining fist into the door till it breaks &emdash; the door or your hand, it doesn't matter. By now you should be used to this fucking system. To the way the City works. Somehow you aren't. Somehow it still stings. Is that good? Does that mean you're not broken yet?\b";
		"You stand still for a minute, eyes staring off into nothing, processing. Then something inside you snaps. There's nothing left to lose at this point. Your legal life is already over. And you're not going to let them take your last few possessions.\b";
	}

    whenEnding()
    {
        "You look around with a mixture of relief and bitterness. This place has been your home for two years, and you just had to break in. Well, now it's time to grab anything useful and get the fuck out before anyone realizes what you've done. ";
    }
;

scene2: Scene
    leftApartment = (!gPlayerChar.isDirectlyIn(apartment))
    brokeDoor = (apartmentDoorOutside.isBroken)

    startsWhen = ((brokeDoor || leftApartment) && scene1.hasHappened)
    endsWhen = (gPlayerChar.escaped)

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

    whenEnding()
    {
        "As you walk away from the place that's been your home for the past two years, a strange feeling of unreality settles over you. You feel set adrift in deep, deep waters, and there is nowhere in the world you can return back to now, no fixed place to anchor you, to reassure you that it's always there, waiting for you at the end of every day. Your isolation in this City suddenly hits home with all the force of a sandbag to the head. You moved here to escape the very real dangers of where you'd grown up, to find safety and freedom and a marginally better life, and you <i>have</i> found that. You'd rather be isolated than dead. But still. A vast, empty chasm seems to have opened up around you, and inside you. There's no one to turn to for help, no friendly face to lend you their couch. You don't have anything but what you're cradling in your arms. ";
    }
;

tTheJob: Topic 'Nanowire\'s offer' @nil;

chapter2: Scene
    startsWhen = (gPlayerChar.escaped)
    endsWhen = (gPlayerChar.knowsAbout(tTheJob))

    whenStarting()
    {
        "<h3>Chapter 2</h3>";
        "<i>Devaluation reigns\nAnd fear of self-destruction\nAdapt or be replaced\nAnd follow their instructions...\n</i>\n&ndash; Essenger/Scandroid, <i>Empire of Steel</i>\b";
        "Your priorities have been brutally paired down to the essentials by circumstance, the underpinnings of all animal existence laid bare for you in painful clarity. You only need two things right now: a job, so you can eat, and shelter.\b";
    }
;

chapter3: Scene
    startsWhen = (gPlayerChar.knowsAbout(tTheJob))
    endsWhen = (gPlayerChar.isIn(nanowiresApartment))

    whenStarting()
    {
        city.timeOfDayState = nightlife_state;
        foreach (local room in graymarket.roomList)
        {
            room.descCount = 0;
        }
        "<h3>Chapter 3</h3>";
        "<i>So lay waste to all we've made\n For your corporate palisade\n You won't automate our roles\n If we digitize our souls\n A new force will intervene\n Half human, half machine\n And no enterprise on Earth will make us kneel\n To your empire of steel...</i>\b";

        "With trepidation in your heart, you accept the contact Jason sends you. It is simple, practically empty, no previous history. A brand new cryptographically generated one-time anonymous handle, so that you can't trace who you're talking to. This is the big leages now.\b";
    }

    whenEnding()
    {
        city.timeOfDayState = night_state;
        "You step into Nanowire's apartment with a strange feeling of fear and excitement running through your stomach in loops like electricity in a copper coil. Although you briefly played at anti-corporate punk when you first started living in the City, that quickly fell to the wayside when you couldn't find anyone like you. You had wanted to organize, find a union or something, things your dad had told you about the old days, like the union surge in the early '20s, but you had quickly found that it was every woman for themselves, the efficient logic of the corporate system expertly cutting people apart without even needing to pay special attention to doing so. Now, though... now you're stepping into that world again, and this time for real. No play-acting now. You've gone black. Off the edge.\b";
    }
;

alarms: MultiLoc, Decoration 'alarms; red orange monospace capital property legal crime holographic augmented reality; warnings warning alarm holograms'
    "Partially transparent holographic billboards in traceries of red and orange hovering in the air, with monospace capitals spelling out legal warnings in scrolling text: <pre>WaugrealNING: <<one of>>LEGAL VIOLATION: BREAKING AND ENTERING<<or>>LEGAL VIOLATION: FELONY TRESSPASS<<or>>LEGAL VIOLATION: DESTRUCTION OF CORPORATE PROPERTY<<or>>LEGAL VIOLATION: HOUSING CONTRACT TERMINATION VIOLATION<<or>>AUTHORITIES HAVE BEEN ALERTED<<or>>AUTHORITIES augrealE ON THEIR WAY<<shuffled>></pre>"
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
            gPlayerChar.escaped = true;
        inherited(traveler, connector);
    }

    north: TravelConnector
    {
        canTravelerPass(actor)
        {
            return chapter3.hasHappened;
        }

        explainTravelBarrier(actor)
        {
            if (scene2.isHappening)
                "You start to go north toward the corporate district of the city, but, hearing sirens coming from that direction, you quickly turn back. No need to do the pigs' job for them. Better run the other way. ";
            else if (chapter1.isHappening || scene1.isHappening)
                "The thought of venturing into the rich business district is too exhausting right now. You don't want to deal with the stares at your blue-collar attire and shabby cyberware, or seeing those corporate sons of bitches walking around with their briefcases and three-piece suits. It's sickening, and you've got bigger fish to fry right now. ";
            else
                "This part of the street stretches away for an interminably long time before it gets to anything interesting. It's much too far to walk. ";
        }

        destination = street1
    }
    south = street2

    east = grayMarketEntrance
	west = megablockArch
	in asExit(west)

	regions = [city]
;

+ megablockArch: Passage 'entrance; arched; door archway'
	"The entrance to the megablock is a tall, pointed arch that leads into a dim interior. Instead of a door, the entrance is filled by a gently glowing orange filter-field, to keep the acidic air out, so that it's safe to take off your breathing apparatus inside."
	specialDesc = "The arched entrance to the megablock glows invitingly orange to your west."
	destination = megablockEntrance
;

+ ads: Distant 'advertisements; neon augreal VR virtual agumented reality; ads'
	"These ads, floating in plots of space rented by various megacorporations from the feudal barons of the clearnet, and automatically overlaid onto your surroundings by your augmented reality enhanced eyes, which are in constant communication with the clearnet's rental databases, claim to provide a veritable cornucopia of distractions for the oxytocin and dopamine-addicted. From augreal partners displayed as gigantic etherial manniquens that stride and pose in the concrete parking lot in front of the megablock, to the billboards hawking nano-tailored nootropics and hallucinagens that wrap themselves around the length of the megablock itself, the area is a veritable profusion of ways to waste your hard earned cash."
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
