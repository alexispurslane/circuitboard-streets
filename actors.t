cop1: Actor 'tall cop; imposing muscular property crime enforcement; police officer; him them'
    "This property crimes officer is a tall, imposingly muscular specimen of porcine flesh entirely covered in standard-issue black ceramic and kevlar SWAT armor, their face hidden behind the visor of a glossy black helmet you can't see through. Four red LEDs trace up the kevlar collar of their suit, blinking rapidly. An oversize high-caliber pistol is slung low on their right hip like some kind of old-world cowboy, and a shield and a shotgun are strung across their back."
    isHim = true

    beforeAction()
    {
        if (gActionIs(Take) && gActor == gPlayerChar && gDobj.isIn(self))
        {
            "You try to swipe {the dobj}, but the muscular officer spots you and, with languid grace, their left hand whips out and locks around your forearm. You twist and turn, trying to pull away, but that vicelike grip holds you tighter than a banker holds his cold storage wallet, until it feels like your arm is going to break. No matter how much you struggle, how hard you try to escape, that grip only seems to grow steadily tighter, and cold panic rushes into you like ice.\b";
            "\"An attempt on an officer's life has been made,\" the cop says, presumably into their comms system. \"Dealing with threat.\"\b";
            "Then, calmly, the officer drwas their handgun and executes you... ";
            finishGameMsg(ftDeath, [finishOptionUndo, finishOptionCredits]);
        }
    }

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
            "In desperation and rage, you lash out at the officer, trying to punch them right in that smug fucking black chrome dome they call a face with all your might, servos whirring with the effort of moving that fast. The officer barely seems to move as they dodge your attack effortlessly, then their left hand blurs up and clamps around your wrist with a snap, and you barely have a millisecond to notice their right fist coming around before it makes shattering contact with your jaw, ripping it straight off. White light and nausea reverberates through your head, both at the impact and the pain. You try to scream, but it comes out as a wet gurgle through the bloody ruin of your lower face as you collapse onto the ground. With some sick sense of mercy, the officer then slowly draws their pistol and puts a bullet between your eyes.";
            finishGameMsg(ftDeath, [finishOptionUndo, finishOptionCredits]);
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
            "Glancing furtively at the taller officer's head, trying to guage where they're looking through that black, mirrored faceplate, you bring your leg around as fast and hard as you can as you pass by toward the door, trying to sweep their legs out from under them. Instead, your leg meets with kevlar and ceramic-armored steel, as immobile as a support beam, and you hear your shin crack with the impact. Screaming in pain, you fall in a heap on the floor, curled in the foetal position around your broken leg. A moment later, you feel the officer's implacible iron grip fix around your collar and begin dragging you to the door, and the patrol car beyond.";
            finishGameMsg(ftFailure, [finishOptionUndo, finishOptionCredits]);
        }
    }
;

+ copArrestAgenda: AgendaItem
    initiallyActive = true
    isReady = Q.canSee(cop1, gPlayerChar)

    invokeItem()
    {
        "The property enforcement officers catch sight of you as soon as you're within visible range, walking up to you silently, then flanking you.\b";
        "\"Citizen,\" the taller one intones through a staticky helmet voice amplifier, \"you have committed a violent offense against private property. As such, you will be imprisoned and work off your debt to the holding company of this property. Please do not resist.\"\b";
        "You back away slightly, afraid, but each officer grabs one of your shoulders and begins hauling you toward the police cruiser. In the few minutes before you are inevitably shoved into the back of that car, a terrible rage and despar grips you. Only one thought circles round and round in your pounding head: <i>Damn it! God motherfucking damn it! If only I'd been a little smarter. A little faster.</i> \b";
        new Fuse(copCar, &moveOutside, 1);
        new Fuse(copCar, &copsArrestPlayer, 2);
        isDone = true;
    }
;

+ copStanding: ActorState
    isInitState = true

    specialDesc = "A tall, muscular property enforcement officer in perfectly black kevlar and ceramic plate, with a gigantic pistol slung low on their left hip, stands to the right of the megablock's entrance."
    stateDesc = 'The property enforcement officer stands impassively, staring at you. '

    beforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar)
        {
            "You begin turning to run, but the tall cop with the gun is faster. With cold cybernetic precision and liquid speed, they draw their handgun and fire. As if in slow motion, the weapon lets loose a gout of flame and a deafening crack that leaves you completely deaf, ears ringing, and you see your side explode in a mist of blood and an expanding cloud of shredded organs and bone fragments. You hit the ground, and as darkness begins to close around you, and you feel a terrible, final falling sensation into blackness, you hear the cop speak over the radio. \"Suspect executed for resisting arrest...\"";
            finishGameMsg(ftDeath, [finishOptionUndo, finishOptionCredits]);
        }
    }
;

+ handgun: Thing 'oversized pistol; huge cowboy gigantic over-size oversize; handgun glock gun'
    "The handgun is a massive, gray brushed aluminum affair that, despite its size, manages to convey a sense of acceleration and grace through its body design, all straight lines leaning forward. You can't even begin to guess at what its caliber is, but it must be practically a rifle cartrige to justify that size."
;

+ shotgun: Thing 'shotgun'
    "It's hard to see any part of the shotgun besides its textured polycarbonate and steel handle sticking over the taller officer's shoulder."
;

+ shield: Thing 'shield; riot; '
    "The shield is a huge transparent plastic affair, designed for riots. Why this officer chose to bring it with them on this occasion is beyond you, and honestly, you could give a flying fuck."
;

cop2: Actor 'short cop; brutal lithe thin sleek property crime enforcement officer; police officer; him them'
    "This property crimes officer is shorter than the other one, a brutally lithe specimen of porcine flesh entirely covered in standard-issue black ceramic and kevlar SWAT armor, their face hidden behind the visor of a glossy black helmet you can't see through. Three small red LEDs trace up the kevlar collar of their suit, blinking rapidly. A vibro-knife is strapped to one thigh, and they're holding a slim gauss rifle."
    isHim = true

    beforeAction()
    {
        if (gActionIs(Take) && gActor == gPlayerChar && gDobj.isIn(self))
        {
            "You try to swipe {the dobj}, but the smaller cop spots you and, with languid grace, their left hand whips out and locks around your forearm. You twist and turn, trying to pull away, but that vicelike grip holds you tighter than a banker holds his cold storage wallet, until it feels like your arm is going to break. No matter how much you struggle, how hard you try to escape, that grip only seems to grow steadily tighter, and cold panic rushes into you like ice.\b";
            "\"An attempt on an officer's life has been made,\" the cop says, presumably into their comms system. \"Dealing with threat.\"\b";
            "Then, calmly, the officer aims their gauss rifle at your head and executes you... ";
            finishGameMsg(ftDeath, [finishOptionUndo, finishOptionCredits]);
        }
    }

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
            "In desperation and rage, you lash out at the officer, trying to punch them right in that smug fucking black chrome dome they call a face with all your might, servos whirring with the effort of moving that fast. The officer barely seems to move as they dodge your attack effortlessly, then their left hand blurs up and clamps around your wrist with a snap, and you barely have a millisecond to notice their right fist coming around before it makes shattering contact with your jaw, ripping it straight off. White light and nausea reverberates through your head, both at the impact and the pain. You try to scream, but it comes out as a wet gurgle through the bloody ruin of your lower face as you collapse onto the ground. With some sick sense of mercy, the officer then slowly raises their gauss rifle and puts a slug between your eyes.";
            finishGameMsg(ftDeath, [finishOptionUndo, finishOptionCredits]);
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
            "Glancing furtively at the shorter officer's head, trying to guage where they're looking through that black, mirrored faceplate, you bring your leg around as fast and hard as you can as you pass by toward the door, trying to sweep their legs out from under them. Instead, your leg meets with kevlar and ceramic-armored steel, as immobile as a support beam, and you hear your shin crack with the impact. Screaming in pain, you fall in a heap on the floor, curled in the foetal position around your broken leg. A moment later, you feel the officer's implacible iron grip fix around your collar and begin dragging you to the door, and the patrol car beyond.";
            finishGameMsg(ftFailure, [finishOptionUndo, finishOptionCredits]);
        }
    }
;

+ gaussgun: Thing 'gauss gun; gaussion long slim; rifle longgun'
    "The gaussion rifle's barrel is a vertically elongated octagon of dark gray steel, serrated for grip, with a hole in the center, out of the back of which emerges a pistol-grip and a standard assault-rifle stock with thick hydraulic dampners between the base of the stock on the rifle end, and the stock's shoulder cup. It is very clearly a weapon of urban warfare."
;

+ vibroknife: Thing 'vibro knife; vibration; dagger'
    "An eight-inch blade fitted into a scalloped black grip that can vibrate it at supersonic speeds. You've heard these nasty fuckers can slice through bones like butter."
;

+ copStanding2: ActorState
    isInitState = true

    specialDesc = "A short, lithe property enforcement officer in all-black armor stands to the left of the megablock's entrance. They stand loose and assured, cradling a gauss rifle."
    stateDesc = 'The property enforcement officer stands impassively, staring at you. '
;

copCar: Fixture, Booth 'police cruiser; cop officer property enforcement crime paddy; car wagon'
    "The police cruiser is a sleek swooping wedge of black with radiator fins at the rear end below the red lines of the break lights, to cool the power-hungry electric motors. There are four doors, the front two with the city's golden shield emblazoned on them."

    isVehicle = true

    moveOutside()
    {
        "While the shorter officer completes a ream of holographic paperwork which floats around them in a blue half-circle like a control panel, the taller one shoves you face first against the police cruiser's flank. Your cheek presses into the cold mettalic surface, slightly damp with acidic drizzle that burns as you touch it, and, with tears of helpless rage beginning to well in your eyes, you surrender quietly as they remove your right arm, leaving you completely helpless. <i>More effective than handcuffs, I guess,</i> you think bitterly.\b ";
        cop1.moveInto(megablockExterior);
        cop2.moveInto(megablockExterior);
        gPlayerChar.moveInto(megablockExterior);
    }

    copsArrestPlayer()
    {
        "Finally, the car door swings open, and you are shoved inside. You will not be seen in the City for a decade, and by the time you return, you are a broken woman.\b";
        finishGameMsg('YOU WERE ARRESTED', [finishOptionUndo, finishOptionCredits]);
    }
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
