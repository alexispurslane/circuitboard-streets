acrossStreetFrom: Relation 'across the street from' 'across the street from' @oneToOne +true ;

InitObject
    execute()
    {
        relate(shoppingDistrict, 'across the street from', megablockExterior);
    }
;

// city day cycle states
enum busy_state, deserted_state, nightlife_state, night_state;

// sky day cycle states
enum dawn_state, dusk_state, day_state, night_state;

city: Region, RandomEventList
    eventList = [
        {: "A <<one of>>person<<or>>man<<or>>woman<<purely at random>> wearing <<one of>>strange demonic horns<<or>>an ornate outfit of ridged leather and metal spines, tailored to their form<<or>>an e-ink tattoo<<or>>a long, dark-colored trenchcoat pulled tight to hide their face<<or>>not much more than their underwear<<or>>a long katana on their back, sheathed in a scabbard with cooling vents that glow a soft blue<<or>>a visor that glows a bright neon red<<or>>a gauss rifle across their back<<or>>a pair of dark mirrored glasses<<shuffled>> <<one of>>walks<<or>>strides<<or>>stalks<<or>>pushes<<or>>brushes<<at random>> past." },
        'The wind howls desolately through the artificial canyons between the surrounding towers.',
        'The far away sound of sirens pierces the air with a thin warble.',
        'Somewhere a few streets away, you hear a shout. You can\'t quite make out the words.',
        'A gust of wind blows a sheet of acidic drizzle into your face, smelling of the city\'s sewers and exhaust pipes.'
    ]

    eventPercent = (self.timeOfDayState == busy_state || self.timeOfDayState == nightlife_state ? 40 : 30)
    eventReduceTo = 20
    eventReduceAfter = 10

    timeOfDayState = busy_state
    skyMode = dawn_state

    regionBeforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar &&
            related(gPlayerChar.location, 'across the street from', connector) &&
            self.timeOfDayState == busy_state)
            "<<one of>>You glance up and down the street, then make your dash through traffic.<<or>>You wait patiently for a gap in the cars streaming by, and when one finally arrives, you rush across the street.<<or>>Just before you take a step into the street, a car you didn't previously notice whizzes by, splashing you with toxic sewer water. Once it's gone, you continue your journey across the street<<as decreasingly likely outcomes>>";
    }

    regionDaemon()
    {
        inherited();

        local time = timeManager.currentTime.getClockTime()[1];
        if (6 < time && time < 8)
            self.timeOfDayState = busy_state;
        else if (8 <= time && time <= 18)
            self.timeOfDayState = deserted_state;
        else if (18 < time && time <= 20)
            self.timeOfDayState = busy_state;
        else if (time > 20 || time <= 23)
            self.timeOfDayState = nightlife_state;
        else
            self.timeOfDayState = night_state;
    }
;

// Conditioned events
+ ELI ~(city.timeOfDayState == busy_state) "Someone pushes past you, grunting an incomprehensible word which might be an apology or just as easily an insult.";
+ ELI ~(city.timeOfDayState == busy_state) "Cars drive past with the low ripping sound of tires on asphalt, throwing up streams of dirty water. The sound of car horns and engines soaks every cubic millimeter of the air, deafening if you\'re not used to it.";

modify defaultSky
    desc()
    {
        switch (city.timeOfDayState)
        {
            case busy_state:
            case deserted_state:
            "The sun filters through the dense black pall of clouds which churn above the city with a febrile gray-green glow which seems to infect the streets and towers around you.";
            break;
            case nightlife_state:
            "The neon glow of the city's splendour, only fully revealed after night falls, projects a bright kaleidoscope of contrasting colors, from bright yellow to electric blue, across the unbroken cloud cover, reinforcing a sense of clausterphobia even as it dazzles you.";
            break;
            case night_state:
            "The clouds blot out the sky above you light a midnight black funeral shroud draped suffocatingly from the tops of the city's towers.";
            break;
        }
    }
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

citySidewalk: MultiLoc, Floor 'sidewalk; cracked dirty gray grey; pavement ground floor'
    "The sidewalk might once have been white, but has long since been dyed gray-black by layers of ash, soot, dirt, and other kinds of grime, forming an unspeakable patina that glistens wetly in the eternal acidic drizzle. The sidewalk is cracked and uneven where huge pipes from nearby buildings plunge down from their sides and into the city's sewer system, heedless of what was there before."
;