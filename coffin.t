coffinHotel: OutdoorRoom 'The Coffin Hotel'
    "The tunnel opens out onto a strange open square surrounded by apartments. 'WELCOME TO THE COFFIN HOTEL,' proclaims a gigantic holographic sign spinning high above you to the west. Next to it, a cartoonish animation of a zombie emerging from a coffin floats in neon green and red. <<first time>><i>Maybe not the best marketing,</i> you think wryly.<<only>> Below this sign, a ribcage of metal tubes and support beams holding rows and rows of coffin boxes crouches like a gigantic fourty-legged spider against the clogged sky. This must be the Coffin Hotel itself, then. Around and behind the Coffin Hotel, hills of garbage pile up in every direction, pushing up in drifts like disgusting snow against the apartment buildings that surround this impromptu dump."
    conciseDesc = "Drifts and hills of garbage surround the metallic spider of the coffin hotel to the west. To the east, a tunnel through an apartment building leads back out."
    east = street3
    west {
        if (coffinOwner.allowCoffin)
        {
            "{The subj coffin-owner} guides you onto the industrial lift's platform and pulls herself into the driver's seat. A second later, she's lifted you up to your coffin. Its gently curved white lid, slick with the drizzle so that it truly does look like a larval egg of some kind, hisses on hydraulics as it lifts up and out away from you, allowing you to climb inside.";
                gPlayerChar.travelVia(coffinRoom, nil);
        }
        else
        {
            "The {the subj coffin owner} behind the booth stares you down with cold, lizardlike regard. <i>Don't go there,</i> they seem to say.";
            coffinOwner.setState(coffinOwnerAlert);
        }
    }
;

+ spider: Distant 'coffin hotel; metal; framework larvae larava maggot maggots spider ribcage ribs'
    "The strange, spindly, clutching structure is composed mostly of metal tubing, probably stolen construction scaffolding from Megablock M-3C up the road, but who knows. It's not like anyone here cares. The spider clutches two rows of twenty stacks of four vaguely-translucent white plastic boxes each, all held about four feet apart on every side, like carefully cradled eggs waiting to hatch. Between the two rows is a double-spine of reinforced steel beams wide enough apart to permit a rusty industrial lift on tanklike treds to move up and down the isles and lift customers up to their desired coffin."
;

+ coffins: Distant 'coffins; white translucent plastic; rooms'
    "It's hard to tell much about the coffins, besides that they are nine feet long, five feet deep, and five feet wide, and about half of them are occupied, judging by which ones have lights shining vaguely through their walls."
;

+ booth: Decoration 'booth; corrugated metal aluminum; table'
    "The booth is nothing special &emdash; it doesn't even bear a name. Just pitted and rusted corrugated silver aluminum, rivited and haphazardly soldered into the rough shape of a rectangular table with an awning."
    specialDesc = "Closer to you, at the end of the spider's spine, where the head should be, there is a small booth of corrugated metal."
;

coffinRoom: Room 'The Coffin'
    "It's frighteningly cramped. You try to lie to yourself, convince your mind it isn't packed into a tiny box only a few feet bigger than itself, with little room to stretch and none to move, but it's impossible. The reality is staring you right in the face, undeniably, in the form of the coffin's translucent white lid and oppressive pale yellow interior lights, shining from LED strips around the lid. The interior of the coffin is padded on most sides in worn-down self-cleaning plastic-covered pillows, even up the walls, where two swells in the padding hide the casings for the lid's hydraulics. There is another, softer swell in the padding where your head should be, and, to your left, a small inset in the wall holds a yeast food synthesizer. A paper sign is taped above it."
    conciseDesc = "Yup. It's the coffin. Translucent white walls and plastic pillows surround you, except for the black rounded rectangle of the food dispenser to your left."

    out = coffinHotel
    down asExit(out)
    east asExit(out)
;

+ foodDispenser: Fixture 'yeast food dispenser; ; synthesizer'
    "It's a rounded black rectangle about two feet wide and two feet tall, jutting out a few inches from the wall. A touch screen is embedded in the upper half, displaying the small selection of imitation of imitation foods it can dispense, and the lower half of the rectangle has a square slot with a hinged door over it, where you can pull the food out after it's done being grown."

    dobjFor(Touch)
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
            "You key in a meal, and, a few minutes later, you hear a small <i>ding</i>. Pulling open the dispensing bin, you see a food-approximating object vaguely the right shape, texture, and color &emdash; if not taste. You eat it, somewhat regretfully. ";
        }
    }
;

+ sign: Fixture 'paper sign; ; notice'
    "It reads: 'Food included in rent.' Then, below it: 'Ask Seraphine for yeast pod refill every morning.'"
    readDesc = "It reads: 'Food included in rent.' Then, below it: 'Ask Seraphine for yeast pod refill every morning.'"
;

// name = Séraphine Lacan
coffinOwner: Actor 'coffin hotel owner; gray gaunt sickly metal metallic military; person implants scars studs woman; her' @coffinHotel
    "The coffin hotel owner is thin. Not just thin, but gaunt: cheeks sunken, hands bony talons, glistening dark eyes hooded, skin stretched over sharp, delicate, birdlike bones. Skin, you notice, that has a distinctly unsettling grayness to it, as if she were not quite... alive. Her dimunitive stature is exaggerated to the point of almost childlike smallness by her hunched shoulders and deeply curved spine. There is something striking about her face, too: it's thin and frail, with a deep dreamy melancholy etched into it, as if she can remember times when things were better, and prefers to spend her days in those memories, instead of in the dirty present. Two small oblong metal studs stick out of her forehead, the skin around them thickened with the scar tissue that's the telltale sign of early cybernetics. You can't remember having seen anything like these implants before in person, but you know from histories that they &emdash; or similar ones, anyway &emdash; were used by the military, for piloting drones and tanks. "

    globalParamName = 'coffin-owner'
    isHer = true
    allowCoffin = nil

    iobjFor(GiveTo)
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
            "{The subj coffin-owner} inspects {the dobj} with care, her delicate fingers flipping it around.\b ";
            if (gDobj == picture)
            {
                "She seems impressed by the real wood construction of the frame. \"This is probably worth a lot of money,\" she says, looking at you. \"I could let you stay a very long time for this.\" \b";
                allowCoffin = true;
            }
            else if (gDobj == notepad)
            {
                "After looking at the notepad for awhile, {the subj coffin-owner} seems to come to a decision. \"Alright, I can accept this, but just for a night. It's pretty old.\" \b";
                allowCoffin = true;
            }
            else
            {
                "\"I'm sorry, but I just don't know if I can sell this for enough to make it worth it.\" She shakes her head sadly.";
            }

            if (allowCoffin)
            {
                "Nodding to herself, {the subj coffin-owner} stands up and guides you around her booth, to the aisle between the rows of larval coffin-rooms. Once there, she gestures for you to get on the industrial lift's platform as she laborously pulls herself into the driver's seat, coughing. You oblige, and a second later she's lifted you to your new home. Its gently curved white lid, slick with the drizzle so that it truly does look like a larval egg of some kind, hisses on hydraulics as it lifts up and out away from you, allowing you to climb inside.";
                gPlayerChar.travelVia(coffinRoom, nil);
            }
        }
    }

    dobjFor(TalkTo)
    {
        action()
        {
            "You wave in greeting to the woman at the booth and walk up to it, trying to ignore your sense of unease at the appearance of the place, and the stink rising from the hills of trash all around you.\b";
            "\"Hey.\"\b";
            "\"Here to rent a room?\" {the subj coffin-owner} asks quietly.\b";

            gbCoffinOwnerConversation.select();
        }
    }
;

+ coffinOwnerWaiting: ActorState, ShuffledEventList
    isInitState = true
    specialDesc = "{The subj coffin-owner} sits hunched behind her small booth of corrugated metal, eyes staring off into the ether of a private AR-hologram display."
    stateDesc = 'She\'s sitting behind her booth, idly reading her hologram display.'
    eventList = [
        {: "{The subj coffin-owner} shuffles slightly, and the booth makes a creaking sound." },
        {: "{The subj coffin-owner} taps one of the metal studs in her head thoughtfully." },
        {: "{The subj coffin-owner} coughs." },
        {: "{The subj coffin-owner} smiles at some secret inner joke." },
        {: "{The subj coffin-owner} glances at you, then her eyes slide away again." }
    ]
;

+ coffinOwnerAlert: ActorState, StopEventList
    specialDesc = "{The subj coffin-owner} sits, as straight as she can, in her stall, looking at you expectantly."
    stateDesc = 'Those watery black eyes look at you expectantly out of her sharp, long face.'
    waitTime = 0

    eventList = [
        {: "{The subj coffin-owner} coughs." },
        {: "{The subj coffin-owner} drums her fingers on the booth." },
        {: "\"Hey,\" {the subj coffin-owner} looks you askance." },
        ''
    ]

    afterAction()
    {
        if (waitTime == 2)
        {
            waitTime = 0;
            coffinOwner.setState(coffinOwnerWaiting);
        }
        else
        {
            waitTime++;
        }
    }

    beforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar && connector == street3)
        {
            "{The subj coffin-owner} watches you go.";
        }
    }
;

+ coffinOwnerTrading: ActorState
    specialDesc = "{The subj coffin-owner} waits for you to proffer her something to pay for your stay."

    waitTime = 0

    afterAction()
    {
        if (waitTime == 2)
        {
            waitTime = 0;
            coffinOwner.setState(coffinOwnerAlert);
        }
        else
        {
            waitTime++;
        }
    }

    beforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar && connector == street3)
        {
            "{The subj coffin-owner} watches you go.";
        }
    }
;

+ coffinOwnerAlertAgenda: AgendaItem
    initiallyActive = true
    isReady = (Q.canSee(coffinOwner, gPlayerChar) && coffinOwnerAlert.pcJustArrived)

    invokeItem()
    {
        "Seeing you come out of the tunnel, the sickly woman behind the Coffin Hotel booth waves you over.";

        coffinOwner.setState(coffinOwnerAlert);
    }
;

gbCoffinOwnerConversation: QMain
    options = [gbCoffinName, gbRoom, gbStuds]
;

gbCoffinName: Quip
    "\"What's your name, by the way?\" "
    "The woman gives you a small smile. \"Seraphine.\" <<coffinOwner.addVocab('Seraphine')>>\b\"Nice to meet you,\" you say, almost tempted to return the smile. Such a frail person, still willing to smile... "
    qOff = [gbCoffinName]
    qOn = [gbStuds]

    transfer = gbCoffinOwnerConversation
;

gbStuds: Quip
    "\"What are those studs?\" "
    "You ask the question with a little trepidation, but, luckily, {the subj coffin-owner} doesn't take offense.\b\"Used to hardwire into combat APCs,\" she says casually, as if it was the most normal thing in the world. \"That's what these were for, back in the day. Hardlining directly in with optical fiber. I was good, too,\" she says wistfully. "

    qOff = [gbStuds]
    options = [gbLike, gbWhy]
;

gbLike: Quip
    "\"What was that like?\""
    "\"Exhillerating.\" Then she pauses, and her mouth twists bitterly. \"And horrible, like you can't imagine if you weren't there. And the drugs were good too,\" she says wryly. \"They had to keep us hopped up on the most insane fuckshit imaginable, to keep up with the AIs, you know.\" "
    qOff = [gbLike]
    options = [gbWhy]
;

gbWhy: Quip
    "\"Why did they use humans?\" "
    "\"Because humans are more flexible. AIs are fast, sure, but they're rote. A baseline human still has no chance against an AI, but a human with hyped-up reaction times? Then you have both advantages. And that...\" Her eyes look past you, into the past. \"yeah.\" She pauses. \"Now, what can I do for you?\" "

    qOff = [gbWhy]
    transfer = gbCoffinOwnerConversation
;

gbRoom: Quip
    "\"Yeah, I need a room.\" "
    "\"It's about 30 scratch a night, but I'm willing to bargain. Got the cash?\" <<coffinOwner.setState(coffinOwnerTrading)>> "

    qOff = [gbRoom]
;
