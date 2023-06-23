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
