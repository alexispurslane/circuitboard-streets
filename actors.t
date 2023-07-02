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

vrMerchant: Actor 'virtual reality merchant; vr VR; man ; him' @grayMarketPath1
    "A tall, slender, pale man, with a beak of a nose, dressed in loose-fitting cotton clothes. You think he might actually live in Megablock M-3B, on one of the upper floors."

    dobjFor(TalkTo)
    {
        action()
        {
            "\"Yo,\" you say, approaching him. \"Can I talk to you for a second?\"\b";
            "He looks briefly up at you. \"Are you interested in buying something?\"\b";
            gbVRConv.select();
        }
    }
;

+ vrMerchantSelling: ActorState, ShuffledEventList
    eventList = [
                 '"ESCAPE INTO A WORLD OF MAGIC," the virtual reality stall booms. ',
                 '"BOUNDLESS IMAGINATION IN A TINY PACKAGE," the virtual reality stall booms. ',
                 '"BETTER VALUE FOR LESS MONEY" the virtual reality stall booms. ',
                 '"FREE YOUR MIND, ENTER VIRTUAL REALITY," the virtual reality stall booms. ',
                 '"FREE YOUR MIND, ENTER VIRTUAL REALITY," the virtual reality stall booms. ',
                 '"TAKE THE RED PILL, ESCAPE INTO VIRTUAL REALITY," the virtual reality stall booms. ',
                 '"LIKE AUGREALITY? WELL, VIRTUAL IS BETTER THAN AUGMENTED," the virtual reality stall booms. '
                 ]
    isInitState = true
    eventPercent = 40
    eventReduceAfter = 10
    eventReduceTo = 20

    specialDesc = "You see a tall, thin man behind the counter of a booth selling VR headsets"
    stateDesc = 'He looks at you with weary eyes.'
;

gbVRConv: QMain
    options = [gbVRAskJob]
;

gbVRAskJob: Quip
    "\"No, I'm actually looking for a job. Know anyone within ping willing to hire for some manual work? I worked at the warehouse.\""
    "The man shakes his head and sighs. \"No, can't say that I do. You should probably ask around elsewhere.\""
;

synthmeatMerchant: Actor 'synthmeat merchant; meat; vendor woman demiwoman person ; her them' @grayMarketPath1
    "A brown-skinned butch demiwoman with an androgynous, hypermobile face and a shaved head. Her eyes twinkle, they are quick to a hearty laugh, and they appear to be very energetic, but it's unclear exactly how much of that is real, and how much is a performance she puts on for the sake of money. Does it really matter if you can't tell? They're wearing white slacks and a white tank top with the logo of some KPop band or other. "

    dobjFor(TalkTo)
    {
        action()
        {
            "You stride up to the synthmeat cart, catching the street vendor's attention as you approach.\b";
            "\"What can I do for you,\" they ask jovially.\b";

            gbSynthmeatMerchantConv.select();
        }
    }
;

+ synthmeatMerchantSelling: ActorState, ShuffledEventList
    eventList = [
                 '"It\'s closer to real meat than real meat is nowadays! Come and get it!" the synthmeat vendor shouts. ',
                 '"Hey you," the synthmeat vendor shouts, picking some particularly skinny-looking person out of the crowd. "You look like you could use some meat! Freshly vat-grown!" ',
                 '"Fresh, real, animal meat, grown in a vat!" the vendor shouts. '
                 ]
    isInitState = true
    eventPercent = 40
    eventReduceAfter = 10
    eventReduceTo = 20

    specialDesc = "You see a short round street vendor standing behind a cart advertising synthmeat."
    stateDesc = 'They are looking past you at the moving crowd, calling their wares and slogans, trying to get attention.'
;

+ synthmeatMerchantTrading: ActorState, StopEventList
    eventList = [
                 '"Well, ya gonna pay up?" the synthmeat vendor asks.',
                 '"Hey woman, I ain\'t got all day," they say, shaking their head and looking impatient.',
                 '"If you\'re not gonna pay up, then why don\'t you just fuck the hell right off, kay?" the vendor says. Then they turn away.'
                 ]
    specialDesc = "The synthmeat vendor is watching you expectantly, waiting for you to either pay up for your meal or go away."
    stateDesc = 'They are looking at you expectantly, waiting for you to pay up or get out.'

    waitTime = 0

    afterAction()
    {
        if (waitTime == eventList.length())
        {
            waitTime = 0;
            synthmeatMerchant.setState(synthmeatMerchantSelling);
        }
        else
        {
            waitTime++;
        }
    }
;

gbSynthmeatMerchantConv: QMain
    options = [gbSynthmeatBuy, gbSynthmeatAskJob]
;

gbSynthmeatAskJob: Quip
    "\"I know this is left-field, but do you have a ping to anyone that could use a hand, manual labor?\""
    "The vendor looks you up and down, a smirk sneaking onto their mobile face. \"You certainly spoke the truth sister, it certainly would be just <i>one</i> hand huh?\" Then, before your startlement can turn into anger, they continue. \"But to answer your question, nah, not really. You could talk to some of the merchants though,\" she says, crooking her thumb in the direction of one of the bigger tents. \"They always need more hands bringing new wares in.\""
    qOff = [gbSynthmeatAskJob]
;

gbSynthmeatBuy: QSub
    "\"I'd like to buy...\""
    quipQuestion = 'Ask the street vendor for:'

    options = [gbSausage, gbHotDog, gbPatty, gbMeatball]
;

gbSausage: Quip
    "a sausage sub "
    "The vendor nods. \"Just transfer me the money.\" <<synthmeatMerchant.setState(synthmeatMerchantTrading)>>"
;

gbHotDog: Quip
    "a hot dog "
    "The vendor nods. \"Just transfer me the money.\" <<synthmeatMerchant.setState(synthmeatMerchantTrading)>>"
;

gbPatty: Quip
    "a burger "
    "The vendor nods. \"Just transfer me the money.\" <<synthmeatMerchant.setState(synthmeatMerchantTrading)>>"
;

gbMeatball: Quip
    "a meatball "
    "The vendor nods. \"Just transfer me the money.\" <<synthmeatMerchant.setState(synthmeatMerchantTrading)>>"
;


homelessWoman: Actor 'homeless woman; ; bum tramp; her' @closedCyberwareShop
    "Her hollow, sunken, sad eyes, buried in a face smeared with dirt and grease, stare back at you with hopless incuriousness. You wonder if these eyes will be yours someday. Life is harsh in the City. It doesn't care for anyone. It's a moment before you can pull your eyes away from that morbid prophecy and human tragedy wrapped up in one and look at the rest of her. She is thin, bird-boned, and utterly frail, her skin practically transparent, blue veins and knobbly bones showing through. She is bundled up tightly in an assortment of old ill-fitting rags. Doesn't seem to have any cyberware at all."
    specialDesc = "There is a gaunt old homeless woman crouching next to the firepit, her hands held out to the fire."
;

corpulantMan: Actor 'sharecropping combine overseer; corpulant; man; him' @groceryShop
    "The man wears a creased, dirty gray jumpsuit with the zipper that runs down the front opened to about his midriff. The jumpsuit seems to be straining desperately to contain his bulk, both his prodigious gut and his thick, trunklike muscular arms. His face is round, florid, mustached, and the picture of jovial good humor &emdash; something he can afford, it seems: he wears the pins of every major sharecropping combine like military medals across his chest."
    specialDesc = ""

    dobjFor(TalkTo)
    {
        action()
        {
            "You walk up to the man behind the desk. Seeing you approach, he smiles expansively, his eyes travelling up and down your body with hungry greed, feeling you up with his gaze. When he finally speaks a split second later, his eyes still largely fixed on your breasts, it feels like you've already spent unpleasant hours with this man. \"What can I do for you... ma'am?\"";
            gbOverseerConv.select();
        }
    }
;

gbOverseerConv: QMain
    options = [gbGroceriesBuy, gbOverseerAskJob]
;

gbGroceriesBuy: Quip
    "\"I'd like to buy something please.\""
    "He smirks, and, in a clotted, self-satisfied voice says, \"Feel free to speak with our hard-working sharecroppers and merchants then.\" He gestures to the rest of the tent behind you, then rests his hands back on his stomach."
;

gbOverseerAskJob: Quip
    "\"Do you know anywhere where a manual laborour might find work?\""
    "The overseer scoffs. \"Pah. With one arm? <i>Please.</i> Run along and find yourself another arm, darling, and then come back to me and we can talk. Unless, of course, you want another sort of job... I find your kind quite enticing, if you know what I mean. I consider myself a great ally!\""

    qOff = [gbOverseerAskJob]
;

bouncer: Actor 'bouncer; ; man; him' @brothel
    "A bitblit copy of every single bouncer you've ever seen. Tall, muscular, barrel chested, bald, in a dark suit with sunglasses covering his eyes. E-ink gang tattoos of some kind writhe on his bald head, shifting between gloriously intricate shapes from some folk fairytale nightmare. It's all so stereotypical he'd almost be funny to look at if he wasn't so intimidating."
    specialDesc = "You see a bouncer standing off in a corner near the entrance."

    dobjFor(TalkTo)
    {
        action()
        {
            "Approaching the bouncer, you start to open your mouth, but he cuts you off. \"Am not here to talk,\" he says in a thick Russian accent. \"Talk to the boss. In there.\" He points east. <.known tOfficeDoor> \b";
        }
    }
;

mistress: Actor 'mistress Lea Belveau; ; woman; her' @mistressOffice
    "The mistress herself. Tall, taller than you even, and old, perhaps seventy, but in a way that makes her seem like an infinitely wise and alluring demoness. Her makeup is bold, stylized in shades of shiny navy blue around eyes, and arterial red around pouting lips, not tasteless. She wears what seems to be a Victorian corsetted dress of some kind made of diaphanous black silk, lace, and embroidry, run through with spines and ridges which remind you of bats. "

    dobjFor(TalkTo)
    {
        action()
        {
            "You're usually a brash person, but something makes you hesitate to interrupt her. However, you steel yourself and clear your throat, catching the Mistress' attention.\b";
            mistress.setState(mistressTalking);
            gbMistressConv.select();
        }
    }
;

+ mistressWorking: ActorState, ShuffledEventList
    isInitState = true
    eventList = [
                 'The Mistress sighs, looking at something in her private augreal workspace.',
                 'The Mistress chuckles softly and makes a gesture, dismissing some invisible augreal window.',
                 'The Mistress tsk-tsks, shaking her head.',
                 'The Mistress reaches out and does some complex manipulation with her hands, subvocalizing all the while, composing some sort of message.',
                 'The Mistress nods to herself.',
                 'The Mistress absentmindedly taps her lips, thinking.',
                 'The Mistress absentmindedly fondles the plush armrests of her chair.'
                 ]
    eventPercent = 60

    stateDesc = 'The Mistress ignores you, completely occupied by her tasks. '
    specialDesc = "The Mistress sits at her desk, working. "
;

+ mistressTalking: ActorState, StopEventList
    eventList = [
                 '"Well girl?" the Mistress smiles, looking at you. "Cat got your tongue?"',
                 '"You know, I don\'t bite &emdash; well, usually." The Mistress smiles mischeviously.',
                 '"If you have nothing more to say, child," the Mistress says primly, turning back to her work, "please exit my office."'
                 ]

    stateDesc = 'The Mistress watches you looking at her with a tiny smile, as if she is seizing you up for eating. '
    specialDesc = "The Mistress sits at her desk, waiting for you to say something. "

    waitTime = 0

    afterAction()
    {
        if (waitTime == eventList.length())
        {
            waitTime = 0;
            mistress.setState(mistressWorking);
        }
        else
        {
            waitTime++;
        }
    }
;

+ mistressAlertAgenda: AgendaItem
    initiallyActive = true
    isReady = (Q.canSee(mistress, gPlayerChar) && mistressWorking.pcJustArrived)

    invokeItem()
    {
        "Seeing you enter her office, the Mistress smiles and waves her hand languidly, dismissing her augreality display. \"What can I do for you child?\" she purrs.\b";
        mistress.setState(mistressTalking);
        gbMistressConv.select();
    }
;

gbMistressConv: QMain
    options = [gbAreYouOwner, gbWhoAreYou, gbWhatAreThoseCarvings, gbMistressAskJob]
;

gbAreYouOwner: Quip
    "\"Are you the owner of this place?\""
    "\"Why yes I am. The upstairs used to be owned by someone else, but I bought them out,\" she says, inspecting her glossy burgundy fingernails."
    qOff = [gbAreYouOwner]
    options = [gbHowDidYouGetHere, gbHowDidYouBuyThemOut]
;

gbHowDidYouGetHere: Quip
    "\"How did you create all this?\""
    "\"By fighting like hell for a very long time, kitten,\" she says, looking at you. \"I started out walking the streets, you know. I'm proud to say that, because it shows just how <i>far</i> I've come. Don't you think?\" You nod."
    qOff = [gbHowDidYouGetHere]
    transfer = gbAreYouOwner
;

gbHowDidYouBuyThemOut: Quip
    "\"How did you convince them to sell to you? Did you really just pay them that much?\""
    "\"Well,\" the Mistress says, her catlike eyes gleaming, \"I shan't devulge all my secrets.\""
    qOff = [gbHowDidYouBuyThemOut]
    transfer = gbAreYouOwner
;

gbWhoAreYou: Quip
    "\"Who are you?\""
    "\"My my, now that's quite a complicated question. 'To indulge the fable of 'unity,' 'soul,' 'person,' &emdash; this we have forbidden: with such hypotheses one only covers up the problem,' to quote a very great man. But I can tell you my name nevertheless: Lea Belveau, Mistress of this place.\" She gestures around her."
    qOff = [gbWhoAreYou]
    transfer = gbMistressConv
;

gbWhatAreThoseCarvings: Quip
    "\"What are those carvings on the walls?\""
    "\"Oh, just a little fancy of mine.\" She hums a little tune, as if it's supposed to mean something to you. \"Feel free to look at them all you like. Although, be warned, they have a... <i>corrupting</i> influence.\" This last sentence is spoken with erotic suggestiveness, her voice smoky and dark."
    qOff = [gbWhatAreThoseCarvings]
    transfer = gbMistressConv
;

gbMistressAskJob: Quip
    "\"Do you know anyone that has any use for a manual laborer like me? I can supervise loader-lifter AIs. Boston Dynamics ones, you know.\""
    "The Mistress looks thoughtful for a moment. \"I don't really do those kind of jobs child, although I can of course offer you other options. And I'm really not sure how good you'd be at manual labor with only one arm, although I'm sure you already know that. Let me think... Aha! You should speak to Jason, he runs a hardware shop of sorts. He might know.\""
    qOff = [gbMistressAskJob]
    transfer = gbMistressConv
;

ramenVendor: Actor 'ramen vendor; noodle; merchant; him' @grayMarketPath2
    "A short black man of medium build in a white apron. He moves with incredible precision and speed, arms flickering back and forth assembling bowls of ramen like he's on some kind of assembly line. Yet he does it with perfect ease, a calm look on his face, and he manages to carefully smell each bowl to make sure it's seasoned right and add a small personal touch of garnish. He's just that fast. Surrounded by his small neat kitchen, he seems perfectly at home, and you get the impression he's been doing this for years. Nevertheless, it isn't <i>all</i> natural skill and practice: you can see the telltale signs of nerve and fast-twitch muscle enhancements in specific the black strips of circuitry and biochemcial materials that run up his arms and shoulders, and his eyes have been replaced with good middle of the road Kiroshi optics to allow him to better process information."

    dobjFor(TalkTo)
    {
        action()
        {
            "The ramen vendor looks at you politely with his glowing blue Kiroshi eyes, hands still working on other orders. ";
            ramenVendor.setState(ramenVendorTalking);
            gbRamenVendorConv.select();
        }
    }
;

+ ramenVendorWorking: ActorState, ShuffledEventList
    isInitState = true
    eventList = [
                 '"Classic ramen noddles, come get \'em," the ramen noodle vender shouts, beckoning people over. ',
                 '"Fresh, hand-made, cheap as dirt, will fill your stomach better than any yeast! Ramen noodles!" the ramen noodle vender laughs. ',
                 '"Fuck synthmeat am I right? This guy knows what he wants!" the ramen noodle vendor crows as a customer walks up to the bar.',
                 'The ramen noodle vendor pulls a piece of paper from the awning and hands it along with a bowl to a customer. '
                 ]
    eventPercent = 60

    stateDesc = 'The ramen noodle vendor is hard at work cooking right now. '
    specialDesc = "You see a ramen noodle vendor standing behind a lovingly constructed cart, cooking. "
;

+ ramenVendorTalking: ActorState, StopEventList
    eventList = [
                 ]

    stateDesc = 'The ramen noodle vendor looks at you impatiently as he cooks. '
    specialDesc = "The ramen noodle vendor stands looking at you expectantly. "

    waitTime = 0

    afterAction()
    {
        if (waitTime == eventList.length())
        {
            waitTime = 0;
            ramenVendor.setState(ramenVendorWorking);
        }
        else
        {
            waitTime++;
        }
    }
;

gbRamenVendorConv: QMain
    options = [gbWhereHardware, gbBuyRamen, gbHowLongRamen]
;

gbWhereHardware: Quip
    "\"Hey, do you know where I could find Jason's hardware store?\""
    "He nods quickly. \"Its through the tent to the south, the clothes seller. Anything else?\""
    qOff = [gbWhereHardware]
    transfer = gbRamenVendorConv
;

gbBuyRamen: Quip
    "\"I'd like to buy a bowl of ramen please.\""
    "\"Sure thing, go ahead and transfer me the money with your augreal wallet and I'll whip it right up.\""
;

gbHowLongRamen: Quip
    "\"How long have you been doing this job?\""
    "\"Since I was a kid!\" he answers, smiling widely. \"And my papa before me too. We've built up our recipes, techniques and sourcing over generations.\"\b It has the feel of a marketing line now, but you get the sense it only became one over time, that it's also true."
    qOff = [gbHowLongRamen]
;

jason: Actor 'Jason' @jasonsChair
    "A short, muscular man with a broad chest and thick, gnarled arms. Yet, paradoxically also hunched and pale, as if he works out exclusively in this tiny room. Which he probably does. He is wearing a navy blue micro-shell jacket over olive green fatigues from some unidentifiable army. His face is round, sparsely bearded, and his eyes are a striking dark shade of olive green flecked with gold. He seems good natured and kind, but his sheer compact physicality and intensity makes you want to step back."
    dobjFor(TalkTo)
    {
        action()
        {
            "\"Hey,\" you say, walking up behind Jason. He jumps, startled by your intrusion into his little world, and spins around on his stool to look at you.\b\"What's up?\" he asks, after he's recovered from his fright. \b";
            jason.setState(jasonTalking);
            gbJasonConv.select();
        }
    }
;

+ jasonWorking: ActorState, RandomEventList
    isInitState = true
    eventList = [
                 'There is a zapping sound and Jason makes a startled noise of pain and pulls his finger away from something. ',
                 'A thin stream of smoke and a mettalic smell wafts up as Jason briefly solders two components together. ',
                 'With an frustrated grunt, Jason hops up, dashes into the maze of shelves with infinite purpose, and returns a moment later with some new component for his project. ',
                 'Putting down whatever he has been working on, Jason leans back for a moment and rubs his eyes. Then he sighs and returns to work. ',
                 'Jason snaps two pieces together, and with an excited cry, something seems to briefly spring to life, glowing and whirring under his hands. Then it sputters out and he returns to work with a curse. '
                 ]
    eventPercent = 60

    stateDesc = 'Jason notices you looking at him and gives an awkward smile. '
    specialDesc = "Jason is perched on the edge of his stool, bent practically double over his desk, working on assembling something. "
;

+ jasonTalking: ActorState, StopEventList
    eventList = [
                 'Jason waits briefly for you to continue talking, then returns to his project. '
                 ]

    stateDesc = 'Jason looks back at you mildly. '
    specialDesc = "Jason sits on his stool facing towards you, waiting quietly. "

    waitTime = 0

    afterAction()
    {
        if (waitTime == eventList.length())
        {
            waitTime = 0;
            jason.setState(jasonWorking);
        }
        else
        {
            waitTime++;
        }
    }
;

gbJasonConv: QMain
    options = [gbAreYouJason, gbWhatIsThisPlace, gbHowDidYouGetAllThisStuff, gbJasonAskJob]
;

gbAreYouJason: Quip
    "\"Are you Jason?\""
    "Jason smiles. \"Yup, that's me!\""

    qOff = [gbAreYouJason]
    transfer = gbJasonConv
;

gbWhatIsThisPlace: Quip
    "\"What <i>is</i> this place?\""
    "You say it while looking around, gesturing in helpless amazement at the endless shelves of technology stretching away into the dimness in every direction.\b\"It's my hardware shop of course!\" Jason says proudly. \"I can repair anything, build any kind of custom hardware you want, trade you any part you need. It's my life's work &emdash; at least as far as everyone else thinks. I also do the cosmetic cyberware implantations. Just buy something out there, then bring it in here and I'll put it in ya.\""
    qOff = [gbWhatIsThisPlace]
    transfer = gbJasonConv
;

gbHowDidYouGetAllThisStuff: Quip
    "\"How did you even get all this stuff?\""
    "\"Here and there, mostly. I contract with a lot of corps around here to take all their electronic waste when they're done with it. Not the tiny scraps, but the stuff that can still be used for something. I also barter a lot, if you need a piece to fix some cyberware, for instance, I ask you to find me a cyberware component in return, just a different one. Usually people have that stuff, you know? Planned obsolescence, right?\""
    qOff = [gbHowDidYouGetAllThisStuff]
    transfer = gbJasonConv
;

gbJasonAskJob: Quip
    "\"Do you know where a manual laborer like me could find work?\""
    "Jason looks thoughtful for a moment. \"Well, the fact that you've only got one arm tells me you failed an indenture contract. You won't be able to get a legitimate job willing to front you the money for another arm for a couple years. But, I could try to find you someone a little more desparate, who doesn't have a big pool of desparate captive workers to pull from, who needs someone locked out of the system, so they're willing to trade under the table. That you?\""

    options = [gbJasonYes]
;

gbJasonYes: Quip
    "\"Yeah, I suppose so.\""
    "\"Alright then,\" Jason says, and his eyes go unfocused for a second as he searches his augreality hud. \"Okay, I think I found ya something. Prick by the name of Nanowire, he's looking for an industrial worker looking to go black, off the edge. I'll send you his contact.\"\b<.known tTheJob>"
    qOff = [gbJasonAskJob, gbJasonYes]
;

clothingOwner: Actor 'clothes and cosmetics shop owner; ; merchant; them' @clothesTent
    "The clothing shop owner is a short, round-faced middle-aged nonbinary person, wearing a fluffy yellow coat with blue lightning painted onto the back and a simple black tank top and jeans underneath. They look tired, and something about their expression seems far older than their visible age, as if they've seen too many things in their lifetime, all of them terribly sad. You get the sense that this quiet, simple business of helping people find outfits that suit them is a refuge from something in their past, and it makes your heart ache for them a little, involuntarily. A small silver pendant hangs down between their breasts."
;

+ clothingOwnerWorking: ActorState, RandomEventList
    isInitState = true
    eventList = [
                 'The clothing shop owner sighs and shifts on their feet. ',
                 'The clothing shop owner mutters to themself under their breath. ',
                 'The clothing shop owner subvocalizes something to their augreal hud. ',
                 'The clothing shop owner closes their augreal hud with a gesture, ventures out into the ranks of clothing to check something, and returns a moment later to take their place behind the counter again. '
                 ]
    eventPercent = 30

    stateDesc = 'The clothing shop owner looks back at you with a sorrowful look in their eyes. '
    specialDesc = "The owner of the clothes and cosmetics shop stands behind their counter, surveying their ranks of clothes. "
;

+ clothingOwnerTalking: ActorState, StopEventList
    eventList = [
                 'The clothing owner looks at you for a moment, waiting to see if you will say any more. '
                 ]

    stateDesc = 'The shop owner looks back at you mildly. '
    specialDesc = "The shop owner stands behind their desk. "

    waitTime = 0

    afterAction()
    {
        if (waitTime == eventList.length())
        {
            waitTime = 0;
            jason.setState(jasonWorking);
        }
        else
        {
            waitTime++;
        }
    }
;
