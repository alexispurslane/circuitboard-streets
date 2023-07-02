southside: Region, RandomEventList
    eventList = [
                 'Someone shouts from a high apartment window at someone else in another apartment window across the street.',
                 'A scream lances high over the apartment buildings from somewhere deeper in this sector of the city.',
                 'Someone bumps into you and hurries away before you can pick a fight.',
                 'You see a lone child wandering down the sidewalk.',
                 'You hear someone weeping from a doorway near you.',
                 'There is a gunshot somewhere, the echos ricocheting between the apartment buildings.',
                 'A group of men on the other side of the street glances at you, and you feel a chill run up your spine.',
                 'Someone jeers at you from somewhere, you can\'t see where.',
                 'Someone shouts a slur at you as they pass on the other side of the street.',
                 'A mother and her two children cross to the sidewalk on the other side of the street from you as the approach.'
                 ]
    eventPercent = 30
    eventReduceTo = 20
    eventReduceAfter = 5
;

southsidePeople: MultiLoc, Decoration 'people; ; crowds crowd'
    "There are all different kinds of people here, of every imaginable ethnicity, religion, philosophy, and background, every possible sexuality, gender identity, or gender expression, every stage of ability or disability or sickness. Few have extensive cybernetics, beyond cosmetic augmentations like horns, scales, e-ink tattoos, and other such affectations, and what cyberware there is are old models that still use hydraulics, heavy but simple and easy to repair. What unifies them all is their look of utter exhaustion and hopelessness &emdash; red-rimmed eyes stare out at you from sunken sockets with hooded expressions, brows and cheeks prematurely wrinkled with worry-lines, all faces pale and sickly, some gaunt from drugs, others overweight from the cheap food that is accessible. "
    specialDesc = "<<if city.timeOfDayState == busy_state>>People lounge in small clusters of plastic deck chairs and benches under makeshift awnings in the entranceways or balconies of buildings, smoking, drinking, arguing, or cracking jokes with their neighbors, or blissing out on nanotech drugs. Lazy eyes track you with vague, exhausted indifference or stare off into the haze. It is ostensibly loud here with conversation, but there is a subdued undercurrent.<<else if city.timeOfDayState == deserted_state || city.timeOfDayState == night_state>>Empty, white plastic deck chairs and benches stand in apartment entranceways and balconies, empty beer cans, needles and syringes, fast food wrappers, and other detritus litter the ground around them, fluttering slightly in the wind and making a barely-audible pattering sound with the rain.<<else if city.timeOfDayState == nightlife_state>>Some people sit in clusters of plastic deck chairs and benches under makeshift awnings in the entranceways or balconies of buildings, smoking, drinking, arguing, or cracking jokes with their neighbors, or blissing out on nanotech drugs. Others dance in small cleared spaces outside, or on the gutted first floors of the apartments, or rush back and forth across the street, making it impossible to walk five paces without almost running into someone. An air of obstinate, desperate energy suffuses this place, as if each person here is trying, and failing, to party hard enough to forget that work begins the next day.<<end>>"
    locationList = [southside]
    isHidden = (city.timeOfDayState == deserted_state || city.timeOfDayState == night_state)
;


street2: OutdoorRoom 'Central City Street (mid)'
    "The six-lane central street of the City, black tarmac shiny in the rain, runs north, past Megablock M-3B towards the business district of the City, and south, toward Warehouse Slum and the coffin hotel, here. The eyeless, staring skulls of gutted office buildings crowd the street like beggars to the east and west, a long-lost legacy of forgotten prosperity carved into brutalist monuments of drab concrete. Despite the width of the road, the narrowness of sidewalks and the crowding of the street by these buildings creates a clausterphobic sensation, as if at any moment these broken-down buildings will collapse in on you.\bA cramped alleyway slinks off to the east, between an office building and the chain link fence of Mandible Block."

    east = alleyway
    north = megablockExterior
    south = street3

    regions = [city]
;

+ buildings: Decoration 'office buildings; gutted long-lost bombed-out empty; ruins offices office beggars'
    "The building to the east is about thirteen stories of dirty, brownish concrete and broken windows. The first floor is covered in graffiti, mostly unintelligable except for one phrase which stands out to you, spraypainted in neon vomit-green across the building's door: 'NO CHOICE WHEN THEY OWN THE CHOICES.'\b The building directly west of you is a crumbling, sagging four story office building, with an old, faded sign above the few shattered glass teeth that remain of its double door entrance: 'MURPHEY & SONS.' What it may once have meant, or what business they may have plied, is now long-lost to time, but it must have been an old building, to have a physical sign like that instead of paying for a hologram placement registration. From before that, then. A few decades, maybe."
;

alleyway: OutdoorRoom 'Alley'
    "This alley is a small sidewalk branching off from the main one to the west, tightly pressed on one side by the tall brown office building to the south, and the high chain-link fence to the north, so that you practically have to turn sideways to follow it. The floor here is broken up sidewalk pavement, long since decaying back into rubble. The alley smells of urine and despair."

    west = street2
    regions = [southside]
;

+ fence2: Decoration 'chain link fence; chain-link chain cut high rusted rusty leaning bent'
    "It's a high chain link fence, perhaps eight feet tall, lined with barbed wire at the top. Rust crusts over it here and there. It has been bent down substantially in the center, so that you just might be able to climb it, if you had a something to throw over the barbed wire at the top."
;

street3: OutdoorRoom 'Central City Street (south)'
    "The gutted office buildings on either side of the street to the north begin to give way to equally ancient and decrepit apartment buildings here, which show signs of dissolute habitation. The air is hazy with the smoke from cooking fires high up on the rooves of the apartments, and clothes lines attached to pullies stretch in a criss-cross thicket above you, scratching out the sky."

    north = street2
    west = tunnel

    regions = [southside]
;

+ tunnel: Passage 'concrete tunnel'
    "This is a sort of passageway or arch that runs through the entire apartment above it and out the other side. It's too dark to see inside, but rivulets of water stream out of its mouth, pooling in a depression in the cracked sidewalk at its entrance. At the far end, you can just barely see the other opening, where it presumably lets out. Trash bags sit around the entrance, as if someone put them down for a second while on their way to take them to a dump, but never got around to picking them up again. A few are overflowing, littering their contents around."
    destination = coffinHotel
    travelDesc = "You slip into the tunnel, walking briefly through darkness and the sound of dripping water, before emerging into the relative light on the other side."
    specialDesc = "To the west, you can see that the entranceway into one of the apartments actually leads directly through the entire apartment building and out to the other side, like some kind of dark concrete tunnel. Spraypainted next to the entrance is the word 'COFFIN' in bright red capitals."
;

+ apartments: Distant 'apartments; decrepit; buildings'
    "The apartment buildings are packed tightly on either side of the street, rising tens of stories up into the sky, seeming to weigh on you. They are festooned with rotting clothes on clotheslines, forgotten or abandoned decorations, ad-hoc repairs in cardboard or corrugated metal, and crumbling balconies, some holding dying gardens. The buildings are crumbling slowly, and little attempt has been made to repair them. No one here has the time, or money."
;
