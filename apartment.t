apartment: Room, RandomEventList 'Apartment 104'
    "Your apartment is a small one room studio with unpainted concrete walls and a plastic floor designed to look like tile. In an attempt to make the place more livable, you've covered the walls with posters over the past few years, creating a profusion of bright, clashing colors and shapes which is somehow both mildly nauseating and far more pleasing than the blank walls. Other than that, it is densely populated with the necessities for life, a cozy approximation of habitable living conditions which you've, against all odds, begun to grow fond of."

    eventList = [
        {: "The advertisement spot murmurs <<one of>>an ad jingle<<or>>some corporate slogan<<or>>a long list of disclaimers and side effects<<at random>> in the background." },
        'You hear someone murmur in one of the apartments next door.',
        {: "You hear the sound of two people arguing a few apartments away. The voices rise louder and louder, until they are practically shouting and you can almost make out the words. Then there is a cry, and the arguing stops. You swear you can almost hear a <<one of>>man<<or>>woman<<or>>child<<or>>person<<at random>> sobbing." },
        'You hear the muted whirring and gurgling of the pipes outside your southern wall.',
        {: "You hear a loud <<one of>>thump<<or>>scraping sound<<or>>clatter<<or>>tapping sound<<at random>> from above you."}
    ]

    eventPercent = 20

    travelCount = 0

    out = apartmentDoorInside
    north = apartmentDoorInside

    regions = [megablock1Region]
;

+ futon: Surface, Fixture 'futon; convertible; couch bed'
    "This futon came with the apartment, left behind by the previous owner. You did your best to clean it before using it, but who knows how clean it actually is. It certainly doesn't <i>look</i> clean, anyway, but you've long since given up caring about looks. A thin, well-worn pillow in a blue pillowcase, and a thick green cotton blanket, both of which you've kept with you since your first apartment at sixteen, sit in their respective places on the <<if couchMode>>couch<<else>>bed<<end>>."
    specialDesc = "You see your futon pushed against the east wall, covered in a rumpled pile of blankets from when you got up this morning."

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

+ nightstand: Heavy 'nightstand; cluttered bed; table drawer'
    "A small nightstand of rough black metal, a few feet square, with a drawer underneath. It serves double duty as a table as well, especially when you've collapsed onto the couch to watch TV until sleep takes you after a long day at work. Food wrappers, empty cans of soda and filtered water from the dispenser, and pieces of paperwork, are scattered across its surface. Two items of note, however, are your Takagi DEC-11 and your e-ink notepad, which lie carefully set apart from the trash."
    specialDesc = "You see your nightstand next to the futon."

    remapOn: SubComponent
    {

    }

    remapIn: SubComponent
    {
        bulkCapacity = 10
        isOpenable = true
    }
;

++ encryptionModule: PlugAttachable, SimpleAttachable 'encryption module'
    "A small, oblong piece of soft-touch black plastic about the size of your thumb. On its back is a row of seven tiny metal pins. This is an encryption module, designed to plug into a DEC and provide it with an application-specific integrated circuit for advanced anti-quantum cryptography which would be far too difficult for the generalized computational circuitry in a normal DEC to handle alone. These are fairly common among hardware and security enthusiasts, since traditional cryptography was made obsolete by advances in quantum computing. You're not typically into that kind of stuff, but an old girlfriend managed to talked you into getting one anyway. You never got around to using it much."
    subLocation = &remapIn
    okayAttachMsg = "The encryption module attaches to {the iobj} with a quiet magnetic click."
;

++ darknetModule: PlugAttachable, SimpleAttachable 'darknet module; dark net onion; antenna'
    "This is a small black dome with a stubby antenna sticking out of the rounded end on a joint. On the flat end of the dome, a tight square of four tiny metal pins pokes out. This is a darknet module, used to route your net traffic via a randomized path through a decentralized shadow infrastructure of routers and destination nodes hosted by individual volunteers, rebels, and enthusiasts instead of corporations. That way, your activity on the net is completely untraceable. You bought this module out of curiosity, but never had the occasion to use it for anything series."
    subLocation = &remapIn
    okayAttachMsg = "The darknet module attaches to {the iobj} with a quiet magnetic click."
;

++ clutter: Decoration 'clutter; empty filtered dirty scattered; wrappers cans trash water'
    "A random scattering of various bits of trash and food wrapping. You really should clean up sometime, but you aren't in the right headspace right now."
;

++ personalTerminal: Switch 'a DEC-11; Takagi dec deck 11 personal; computer deck terminal cyberdeck'
    "This is a chunky oblong rectangle of black magnesium about a third of an inch thick, over a foot long, and about six inches deep. Designed to be tethered to your AR system for use for a compute/storage boost and connectivity hub, since size and connectivity in body-embedded systems is typically limited. Its surface is largely dedicated to a lavish but compact mechanical keyboard for those who find air-keyboards unpleasant to use, and a plethora of ports and access bays. Along the left side are two module expansion ports, one with four metal contacts arranged in a square, and one with seven metal contacts arranged in a line."
;

+++ asicPlug: SimpleAttachable, Component 'the (ASIC) port; application (specific) integrated circuit seven metal contacts (line) (with); expansion port'
    "This is a small expansion port on the upper left side of the DEC, designed to connect to the application specific integrated circuit, compute module, or storage drive of your choice."
    allowableAttachments = [encryptionModule]
;

+++ wirelessPlug: SimpleAttachable, Component 'wireless port; four metal contacts (square) (with); expansion port'
    "This is a small expansion port on the lower left side of the DEC, designed to connect to various radio and other wireless connectivity modules."
    allowableAttachments = [darknetModule]
;

++ notepad: Thing 'notepad; eink e-ink; notebook kindle'
    "This is a gift from your dad, state of the art when it was new about ten years ago. It has an e-ink display with a response time under 7ms when an update is needed, giving you both usable performance and extremely extended battery life. It's also far healtheir on the eye than the augmented reality system in your eyes, since it doesn't rely on beaming low power lasers into your retina. You don't use it much anymore, though, so it's turned more into a treasured keepsake than useful tool."
;

+ posters: Decoration 'posters; ; decorations decoration stickers signs'
    "You scan the posters. Every bright neon color is represented here, and every shape, whether that of people, animals, cars, tech, or Platonic solids, gives form to those colors. The south wall is mostly movie posters on either side of the bathroom door, while the east is mostly posters for long-gone cars and tech that still hold a soft spot in your heart &emdash; probably from seeing their commercials repeatedly as a kid. Meanwhile, the west wall holds a profusion of crinkled flags."
;

+ moviePosters: Decoration 'movie posters'
    "A few large movie posters take up most of the wall above waist height, while a profusion of smaller ones surrounds them. As you look, the poster that happens to jump out at you <<one of>>is the one from your favorite old classic, <i>DUNE 2</i>, all desert oranges and browns with windswept, cloaked figures striding across the illustration<<or>>is from a recent movie you enjoyed immensely, the far-future space opera <i>House of Suns</i>. The poster is all brooding blacks and grays, with disconcertingly gigantic, detailed ships taking up the background and the serious faces of the two protagonists, one male and one female, staring at each other in the forefront<<or>>is a strange old find, a poster from a movie that was lost to time long before even your father was born, called <i>Dark City</i>. The poster shows a strange metal face looming over an eerie Gothic city which reminds you strangely of your own.<<or>>A poster for the underground cult classic indie movie <i>Chasm City</i>, released about a decade ago, hides in the corner of your wall, half-hidden by the <i>Dark City</i> poster. It depicts the lone silhouette of a man, bisected down the middle so that one half of him is a solder and the other half looks like a monk, staring up at the strange Melding-Plague raviged biotechnological Lovecraftian horror of Chasm City's melted, mutated cityscape.<<cycling>>."
    roomPart = defaultSouthWall
    roomPartDesc = "The south wall is mostly movie posters."
;

+ carTechPosters: Decoration 'car and tech posters[n]; automobile sports car tech technology retro old; (ads)'
    "This wall is more sparsely populated than the wall of movie posters. A poster <<one of>>depicting the DEC-1 (<i>a classic</i>, you think to yourself), more than twice as thick as your own deck and containing several times the number of access bays,<<or>>of the old Honda-GM NSX-2060, a sleek wedge of red sportscar composed of elongated hexagons and triangles,<<or>>from a famous old vacuum-bot commercial that was so accidentally sexual it spawned a whole subculture<<cycling>> catches your eye."
    roomPart = defaultEastWall
    roomPartDesc = "This wall is covered with a few posters for classic old tech and cars."
;

+ flagPosters: Decoration 'flags; flag; '
    "Three flags hang down this wall. The first is from some country you've never heard of, a black and orange sigil on a black background. The second is the flag of the City itself, composed of Roberto Fortesque's golden coat of arms merged with stylized and altered versions of the corporations that hold seats on the Board of Administrators for the City. The third is a five-striped flag in pale pastel shades."
    roomPart = defaultWestWall
    roomPartDesc = "A couple of flags hang on the west wall."
;

+ window: Decoration 'window'
    "You've tried to clean this window in the past, but nothing really seems to make it any less dingy. Its dark, sooty tinge seems to have been baked in at the factory. Cheap manufacturing, maybe. Looking out, you get a fucking great view of nothing much at all but the gray concrete walkway outside, the concrete balcony, and the apartments across from you. Even a view of the desolate bottom floor would've been better, but the angles just didn't work out right."
;

+ counter: Decoration 'counter; ; cupboard cupboards countertop sink'
    "Most of this thing is counter &emdash; a counter which would have already been almost unusably cramped had it been unbroken; split as it is by the sink, it must have been designed with the explicit goal of making preparing your own meals impossible. What remains that isn't counter is a simple stainless steel and black glass electric stove, pushed up into the northwest corner."
    specialDesc = "Taking up most of the west wall is a counter-oven combination which experience has proved nearly unusable in its compact functionality."
;

++ picture: Thing 'picture; picture Polaroid wooden; frame portrait'
    "This picture is another gift of your father's, from before he died. It depicts you, a wiry girl of thirteen with a toothy grin, and him, an old, well-built man with a fiery red beard and a youthful look in his eye, standing arm and arm behind your childhood home. It's the result of one of your father's peculer whimsies &emdash; namely, a fascination for old style chemical photography and rare materials like paper and wood. The material was entirely too expensive, and you remember, even as a thirteen-year-old girl, wanting to chastise him for wasting the money, but you hadn't had the heart. He'd been so excited when he came home with the Polaroid and the wood, rushing you out back to take the picture and then rushing into his makeshift darkroom. He then spent <i>days</i> whittling the wood into a sturdy picture frame, all entirely by hand, while he waited for the picture to develop. It had taken what seemed like ages for the photograph to properly develop, but you'd kept it close ever since. Sitting on the porch of your old house, watching him whittle the picture frame in the cool afternoons after his shift at the factory, while you waited with bated breath for the picture to develop, remains one of your fondest memories."
    specialDesc = "A tiny old-style printed picture in a wooden picture-frame stands in the corner of the counter."
;

++ stove: Decoration 'stove; electric small; oven'
    "The oven is a tiny affair, an unholy melding of electric cooktop and microwave oven designed to offer as much utility as possible without actually allowing you to cook anything particularly impressive. Not that you would anyway."
;

+ tv: Switch, Fixture 'advertisements; ads ad cylinder of; television advertisement mobile'
    "A short nested cylinder of advertisements spins eternally above you, displaying the wares and wiles of an ever-changing array of corporate sponsors. Crooning their slogans, murmuring your desires. <<one of>>You see an advertisement for Cambell-Magomedova Corporation's line of all-in-one nutrient pills, which claim to provide the nourishment of three square meals a day at a fraction of the cost, spin by.<<or>>A news report about violence breaking out somewhere in the Chicano district of the City flashes past, the blank white faces of the newscasters posed in an imitation of concern as they discuss what genetic reasons there might be for such an occurrence.<<or>>Another advertisement for a virtual assistant and companion, this one of <<one of>>Chang Microtechnology<<or>>EpsilonGroup<<or>>H&Y Conglomerate<<at random>> make, rotates past with a seductive sigh.<<purely at random>>"
    specialDesc = "Occupying the center of the roof is a spinning mobile of small advertisements."

    dobjFor(SwitchOff)
    {
        check()
        {
            "There's physically no way to turn it off.";
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

+ apartmentDoorInside: Door 'apartment door; ; exit doorway'
    "<<if apartmentDoorOutside.isBroken>>Your apartment door lies on the floor of your apartment, bent and splintered along both vertical edges, hinges hanging from one end like grotesquely deformed bones.<<end>> This door has been covered in so many layers of graffiti by its successive occupants that an archaeologist might be able to trace the ephemerable trends in low-life culture through its skin. Two graffitos stick out in particular: some wry soul has written 'abandon all hope' across the top in nearly illegible handwriting. The other is yours, an abbreviation of one of your father's sardonic sayings: 'home is where the roof is.'"
    specialDesc = "<<if apartmentDoorOutside.isBroken>>You see your apartment door, lying bent and splintered, on the floor of your apartment, agains the opposite wall from its frame.<<end>>"
    otherSide = apartmentDoorOutside
    isLocked = true
;
