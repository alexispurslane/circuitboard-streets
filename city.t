acrossStreetFrom: Relation 'across the street from' 'across the street from' @oneToOne +true ;

// city day cycle states
enum busy_state, deserted_state, nightlife_state, night_state;

// sky day cycle states
enum dawn_state, dusk_state, day_state, night_state;

city: Region, RandomEventList
    eventList = [
        'The far away sound of sirens pierces the air with a thin warble.',
        'Somewhere a few streets away, you hear a shout. You can\'t quite make out the words.',
        'A dirty wind, smelling of the city\'s sewers and exhaust pipes, gusts by.',
        'The far away sound of sirens pierces the air with a thin warble.',
        'Somewhere a few streets away, you hear a shout. You can\'t quite make out the words.',
        'A woman wearing <<one of>>strange demonic horns<<or>>an e-ink tattoo<<or>>a long canvas trenchcoat pulled tight to hide her face<<or>>not much more than her underwear<<or>>a long katana on her back, sheathed in a scabbard with cooling vents<<or>>a blank visor<<shuffled>> <<one of>>walks<<or>>strides<<or>>stalks<<or>>pushes<<or>>brushes<<at random>> past.',
        'A man wearing <<one of>>strange demonic horns<<or>>an e-ink tattoo<<or>>a long leather trenchcoat pulled tight to hide his face<<or>>not much more than his underwear<<or>>a gauss rifle on his back<<or>>a pair of dark mirrored glasses<<shuffled>> <<one of>>walks<<or>>strides<<or>>stalks<<or>>pushes<<or>>brushes<<at random>> past.'
    ]

    eventPercent = 30
    eventReduceTo = 20
    eventReduceAfter = 10

    timeOfDayState = busy_state
    skyMode = dawn_state

    regionBeforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar &&
            related(gPlayerChar.location, 'across the street from', connector) &&
            self.timeOfDayState == busy_state)
            "You glance up and down the street quickly, then make your dash through traffic.";
    }

    regionDaemon()
    {
        inherited();

        /*local time = timeManager.currentTime.getClockTime()[0];
        if (6 < time && time < 8)
            self.timeOfDayState = busy_state;
        else if (8 <= time && time <= 18)
            self.timeOfDayState = deserted_state;
        else if (18 < time && time <= 20)
            self.timeOfDayState = busy_state;
        else if (time > 20 || time <= 24)
        self.timeOfDayState = night_state;*/
    }
;

// Conditioned events
+ ELI ~(city.timeOfDayState == busy_state) "Someone pushes past you, grunting an incomprehensible word which might be an apology or just as easily an insult.";
+ ELI ~(city.timeOfDayState == busy_state) "Cars drive past with the low ripping sound of tires on asphalt, throwing up streams of dirty water. The sound of car horns and engines soaks every cubic millimeter of the air, deafening if you\'re not used to it.";

modify defaultSky
    desc = "<<if city.skyMode == dawn_state>>The neon colors of dawn, bright red, purple, and yellow, punch through the thick haze of the atmosphere above, painting the city in a pastel glow.<<else if city.skyMode == dusk_state>>The sun sinks, wan and tired, through the clouds of smog, casting a ruddy pastel glow out over the city.<<else if city.skyMode == day_state>>The sun filters down through a sky filled so fully with acrid pollutants that it is tinted a dingy green. Here and there, streamers of smoke or steam trail upward to add to the pervasive miasma.<<else>>The sky is a dark, oppressive blanket of roiling clouds above you, the city's lights reflecting against its underbelly in a queasy kaleidoscope.<<end>>"
;

modify OutdoorRoom
    traversalTimeFrom(origin)
    {
        if (origin.ofKind(OutdoorRoom))
        {
            return 300;
        }
        else
        {
            return self.traversalTime;
        }
    }
;