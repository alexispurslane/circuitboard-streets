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
#include "megablock1.t"
#include "john.t"
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
		gSetKnown(tFiring);
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
	startsWhen = (apartmentDoorOutside.attemptedOpen)
	endsWhen = (gPlayerChar.isDirectlyIn(apartment))
	
	whenStarting()
		{
		" You lean your forehead against your door, too shocked to process what's happening but already filled with dread.\b";
		"<b>Chirp</b>. An AR ping from the megablock's automated landlord pops into your field of vision. <i>Shit.</i> You know what this is now. Numbly, you mentally direct it to open. Sure enough.\b";
		"'We regret to inform you,' it says in an empty female voice, 'that due to your recent theft and firing, your CI score has gone below acceptable levels. As per company policy, we have therefore canceled your lease. Your apartment will be reallocated, and all assets that are on company property are forfeit as of this moment.'\b";
		"You want to scream. You want to shout and rail at the injustice of it, you want to slam your remaining fist into the door till it breaks &emdash; the door or your hand, it doesn't matter. By now you should be used to this fucking system. To the way the City works. Somehow you aren't. Somehow it still stings. Is that good? Does that mean you're not broken yet?\b";
		"You stand still for a minute, eyes staring off into nothing, processing. Then something inside you snaps. There's nothing left to lose at this point. Your legal life is already over. And you're not going to let them take your last few possessions.";
		gSetKnown(tEviction);
	}
;

megablockExterior: OutdoorRoom 'Outside Megablock M-3B'
	"The street here is dominated by the impossibly large black edifice of Megablock M-3B to the west, glistening in the eternal acid rain of the city. To the north, the apartment buildings and offices that surround the megablock like a crowd of ragged worshipers begin to give way to the more ambitious neo-Gothic architecture of the city's richer districts, while to the south, the buildings give way to a precariously leaning maze of slums that crashes up against the huge blocks of the warehouse district beyond like dirty surf. To the east, the warmth and light of the gray market shows like patches of mold on the collapsed ruins of another megablock, which is surrounded by a dilapitated chain-link fence."
	
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

grayMarket: OutdoorRoom
;
