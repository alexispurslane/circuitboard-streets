me: Thing 'you'
    "You glance down at yourself. You're a tall woman, muscular from a lifetime of habits formed when you were a kid working manual labor. You're wearing relatively simple clothes for the City, but still styled to keep up with the times: a pair of thick, heavy duty pants made of a material that looks like leather but breathes far better, an old faded yellow shirt, steel toed boots, and a micro-shell jacket with gold circuitry patterns thrown over top of everything against the cold. <<if playerMask.isWornBy(me)>>You are also wearing your active filtration mask.<<end>>"

    isFixed = true
    person = 2
    contType = Carrier
    location = megablockExterior
;

+ playerMask: Wearable 'mask; filter active electronic gas toxin; gasmask'
    "<<if isWornBy(gPlayerChar)>>You can't see your mask while you're wearing it.<<else>>Your mask is made of a black lightweight plastic polymer: durable, high-quality to the touch, and cheap to produce, with aesthetically champfered edges and decorative lines snaking at right angles through its surface. Active filters glow a soft green on the right and left sides, their fans making a thin whirring sound, pulling air into the multilayered filtration system before it's passed to the inside of the mask for you to breathe. The inside edges of the mask, where the plastic would touch your face, are lined with a soft rubber that, when placed against your face, forms an airtight seal. The mask's elastic strap hangs down from the sides. <<first time>>You have little to no memory of a time when wearing an active filter outside wasn't necessary, since the air became toxic when you were very young. You, like everyone else, had to pick up the habit of them outdoors real quick after the first person died, their lungs eaten away into a useless mess of tissue in their chest.<<only>><<end>>"

    dobjFor(Doff)
    {
        check()
        {
            if (gPlayerChar.location.ofKind(OutdoorRoom))
                "The air's fucking toxic. Taking your mask off outdoors would screw your lungs up, bad.";
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
    "This jacket is made of a thin material that feels rough to the touch. It is near impenetrable by either cold or heat &emdash; and also bullets according to the ad-copy, which you don't believe for a second and have no intention of trying out &emdash; and yet somehow reasonably cool. A thin, almost tasteful circuitry pattern is embroidered around the coller and down the shoulders in gold thread. It's a recent purchase on your part, like your boots, an attempt to fit into the City's neo-punk style better, and you have no regrets."
    wornBy = me
;
