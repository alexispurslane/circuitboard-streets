me: Thing 'you'
    "You glance down at yourself. You're a tall woman, muscular from a lifetime of habits formed when you were a kid working manual labor. You've always been insecure about your body, having gone through the wrong puberty as a kid, growing more masculine when that was the last thing in the world you wanted, but thanks to your medicine, the last few years have been kinder. You've been slowly growing more feminine, and the more feminine your body gets, the more comfortable you've become. You're almost content with it now.\b A piece of solid industrial iron serves as your right arm, while on your left, <<me.leftArm.onPlayerDesc>>. As for what you're wearing, it's relatively simple shit for the City: a pair of thick black leather pants, an old faded yellow shirt, steel toed boots, and a micro-shell jacket thrown over top of everything against the cold. <<if playerMask.isWornBy(me)>>You are also wearing your active filtration mask.<<end>>"

    isFixed = true
    person = 2
    contType = Carrier
    location = megablockExterior
    leftArm: Unthing
    {
        desc = "Your left arm is missing, and just looking at the empty stump where it should be tugs at your psyche as if something is trying to drag you down into insanity. You quell the rising anxiety in your chest and look away quickly. ";
        onPlayerDesc = "your entire left arm is missing"
    }
    rightArm = playerArm
;

+ playerArm: Wearable 'cybernetic right arm; industrial cyberware heavy-duty solid gray steel; (arm)'
    "This arm is a heavy-duty industrial-grade hunk of upware. You bought it refurbished from an aftermarket seller for about a fifth of its price brand new, and from what you can tell, you underpaid by a lot. This is a reasonably old model, and would be comically bulky on most other people, but thanks to your own height and build it fits you just fine. The armor that covers everything but the joints is an extremely durable gray polycarbonate that isn't used for consumer cyberware anymore due to a lack of mass-market appeal, thanks to how prone it is to scratching. The joints themselves are made of stainless steel, which you have to oil manually every once in awhile. You're proud of this arm. It's probably the one high-quality thing you own, your most prized possession."

    dobjFor(Doff)
    {
        check()
        {
            if (gPlayerChar.leftArm == nil)
            {
                "How do you figure to manage taking off your only arm? With your teeth?";
            }
        }
    }

    wornBy = me
;

+ playerMask: Wearable 'mask; filter filtration active electronic gas toxin; gasmask'
    "<<if isWornBy(gPlayerChar)>>You can't see your mask while you're wearing it.<<else>>Your mask is made of a black lightweight plastic polymer: durable, high-quality to the touch, and cheap to produce, with aesthetically champfered edges and decorative lines snaking at right angles through its surface. Active filters glow a soft green on the right and left sides, their fans making a thin whirring sound, pulling air into the multilayered filtration system before it's passed to the inside of the mask for you to breathe. The inside edges of the mask, where the plastic would touch your face, are lined with a soft rubber that, when placed against your face, forms an airtight seal. The mask's elastic strap hangs down from the sides. <<first time>>You have little to no memory of a time when wearing an active filter outside wasn't necessary, since the air became toxic when you were very young. You, like everyone else, had to pick up the habit of them outdoors real quick after the first person died, their lungs eaten away into a useless mess of tissue in their chest. The mask also serves as a neat excuse to hide your face.<<only>><<end>>"

    dobjFor(Doff)
    {
        check()
        {
            if (gPlayerChar.location.ofKind(OutdoorRoom))
                "The air's fucking toxic. Taking your mask off outdoors would screw your lungs up, bad.";
        }
        report()
        {
            "You reluctantly take off your mask, displaying your face to anyone around who might see.";
        }
    }
    wornBy = me
;

modify OutdoorRoom
    travelerEntering(traveler, origin)
    {
        if (gActor == gPlayerChar && !origin.ofKind(OutdoorRoom) && !playerMask.isWornBy(gPlayerChar) && playerMask.isHeldBy(gPlayerChar))
        {
            "(first putting on your mask)";
            tryImplicitAction(Wear, playerMask);
            inherited(traveler, origin);
        }
    }
;

+ playerBoots: Wearable 'steel-toed boots; steel black work; shoes'
    "These are a pair of thick black leather boots with dark steel toes for protection. As attested to by their worn, weathered leather and tended and scraped toes, you've owned these for many years and taken good care of them to make them last this long. You don't own any other pair of shoes."
    ambiguouslyPlural = true
    wornBy = me
    plural = true
;

+ playerPants: Wearable 'leather pants; thick heavy-duty heavy duty'
    "A pair of pants that appear to be dull black leather, matching your shoes, but really are some other sort of material that doesn't require an extinct animal to create and breathes well enough to be used for work. These are a recent purchase on your part, an attempt to fit into the City's neo-punk style better."
    ambiguouslyPlural = true
    wornBy = me
    plural = true
;

+ playerShirt: Wearable 'yellow shirt; faded band print; (top)'
    "A faded yellow shirt that you keep around despite the holes beginning to wear in it for the sake of nostalgia &emdash; it's got a home-made print on it, of your favorite band from back home."
    wornBy = me
;

+ playerJacket: Wearable 'jacket; micro-shell shell gold circuit; coat'
    "This jacket is made of a thick, shiny material that's supposed to be near impenetrable by temperature or bullets &emdash; according to the ad-copy, anyway. You have no intention of actually testing that last part out. Embossed black filigree plays down the shoulders and breasts of the jacket, the pattern seeming to writhe every-so-slightly as you stare at it, matte against the glossy surfaces. It's a recent purchase on your part, like your boots, an attempt to fit into the City's neo-punk style better, and you have no regrets."
    wornBy = me
;
