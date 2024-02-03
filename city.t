acrossStreetFrom: Relation 'across the street from' 'across the street from' @oneToOne +true ;

InitObject
    execute()
    {
        relate(grayMarketEntrance, 'across the street from', megablockExterior);
        relate(alleyway, 'across the street from', street2);
        relate(tunnel, 'across the street from', street3);
    }
;

displayTimeOfDay(time)
{
    switch (time)
    {
      case busy_state:
        return 'rush hour (morning or evening)';
      case deserted_state:
        return 'midday';
      case nightlife_state:
        return 'early nightfall';
      case night_state:
        return 'past midnight';
    }
    return 'unknown';
}

// city day cycle states
// busy_state --> early morning or late afternoon, commute time
// deserted_state --> middle of the day, when everyone's at work
// nightlife_state --> early night
// night_state --> past 1am or so
enum busy_state, deserted_state, nightlife_state, night_state;

city: Region, RandomEventList
    eventList = [
                 'The wind howls desolately through the artificial canyons between the surrounding towers. ',
                 'The far away sound of sirens pierces the air with a thin warble. ',
                 'Somewhere a few streets away, you hear a shout. You can\'t quite make out the words. ',
                 'A gust of wind blows a sheet of acidic drizzle into your face, smelling of the city\'s sewers and tires. ',
                 'The acid rain grows harder for a moment as a dark cloud passes over head, and then is gone. ',
                 'Far away, one of the skybound monorails rushes past in a whoosh of displaced air and an electric warble. ',
                 'Close by, some curses to themself softly. ',
                 'Someone passes by, gesticulating and talking to the air in front of them, probably talking to someone via augreality. Or just crazy. ',
                 'A beggar meets your eye for a second. ',
                 'Someone ducks into a nearby alley to shoot up. '
                 ]

    eventPercent = (self.timeOfDayState == busy_state || self.timeOfDayState == nightlife_state ? 40 : 30)
    eventReduceTo = 20
    eventReduceAfter = 10

    timeOfDayState = busy_state

    regionBeforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar &&
            related(gPlayerChar.location, 'across the street from', connector) &&
            self.timeOfDayState == busy_state)
            "<<one of>>You glance up and down the street, then make your dash through traffic.<<or>>You wait patiently for a gap in the cars streaming by, and when one finally arrives, you rush across the street.<<or>>Just before you take a step into the street, a car you didn't previously notice whizzes by, splashing you with toxic sewer water. Once it's gone, you continue your journey across the street<<as decreasingly likely outcomes>>";
    }
;

// Conditioned events
+ ELI ~(city.timeOfDayState == busy_state) "Someone pushes past you, grunting an incomprehensible word which might be an apology or just as easily an insult.";
+ ELI ~(city.timeOfDayState == busy_state) "Cars drive past with the low ripping sound of tires on asphalt, throwing up streams of dirty water. The sound of car horns and and electric motors soaks every cubic millimeter of the air with an endless background noise.";

+ ELI ~(city.timeOfDayState != deserted_state) "A <<generateCrowdPerson()>> <<one of>>walks<<or>>strides<<or>>stalks<<or>>pushes<<or>>brushes<<or>>sways<<at random>> past. ";

+ ELI ~(city.timeOfDayState == nightlife_state) "A group of partiers streams around you for a moment, filling your ears with an out of context snipped of their laughter and conversation for a moment before passing around you.";

modify Room
    beforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar && connector.ofKind(OutdoorRoom) && libGlobal.lastTimeOfDay != city.timeOfDayState)
        {
            local statement = 'the sky is dark with thunder';
            switch (city.timeOfDayState)
            {
                case nightlife_state:
                statement = 'night has begun to fall, bringing out the City\'s night life in force';
                break;
                case busy_state:
                statement = 'the city\'s <<if lastTimeOfDay == deserted_state>>evening<<else>>morning<<end>> rush hour has begun';
                break;
                case night_state:
                statement = 'midnight has arrived, the sky a blank black void overhead<<first time>>. You can\'t remember the last time you\'ve seen the stars, or the moon, or the sun for that matter<<only>>';
                break;
                case deserted_state:
                statement = 'the workday has begun in earnest, and the city is quieter than at other times of day';
                break;
            }
            dmsg('As you leave {1}, you discover that {2}. ', self.theName, statement);
        } else if (traveler == gPlayerChar && !connector.ofKind(OutdoorRoom) && self.ofKind(OutdoorRoom))
        {
            libGlobal.lastTimeOfDay = city.timeOfDayState;
        }

        inherited(traveler, connector);
    }
;

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

citySidewalk: MultiLoc, Decoration 'sidewalk; cracked dirty gray grey; pavement ground floor'
    "The sidewalk might once have been white, but has long since been dyed gray-black by layers of ash, soot, dirt, and other kinds of grime, forming an unspeakable patina that glistens wetly in the eternal acidic drizzle. The sidewalk is cracked and uneven where huge pipes from nearby buildings plunge down from their sides and into the city's sewer system, heedless of what was there before."
    locationList = [city]
;

cars: MultiLoc, Decoration 'cars; horseless; car carriage vehicle automobile vehicles automobiles'
    "<<if city.timeOfDayState == deserted_state>>The streets are empty except for a few cars driving swiftly past here and there<<else>>Angular electric cars crowd the streets like salmon on their way to mate.<<end>>"
    locationList = [city]
;

generateCrowdPerson()
{
    // 12 * 24 = 288 combinations!
    return "<<one of>>a person of indeterminate gender<<or>>an androgynous person<<or>>someone completely 'borged out on cyberware<<or>>a pretty man<<or>>a femboy<<or>>a handsome man<<or>>a large, muscular man<<or>>a tall woman<<or>>a beautiful woman<<or>>a lithe, muscular woman<<or>>a man<<or>>a woman<<or>>someone<<purely at random>> <<one of>>with ostentatious demonic horns<<or>>wearing an ornate corsetted outfit of ridged leather and metal spines, tailored to their form<<or>>with bioluminescent hair glowing neon <<one of>>red<<or>>green<<or>>blue<<or>>white<<or>>pink<<purely at random>><<or>>displaying a scrawl of e-ink tattoos, shifting shape and design as they walk<<or>>wearing a long, dark-colored trenchcoat pulled tight to hide their face<<or>>wearing not much more than their underwear<<or>>with a long katana strapped to their back, sheathed in a scabbard with cooling vents that glow a soft blue<<or>>with a visor that glows blood red<<or>>armed with a gauss rifle strapped across their back<<or>>a pair of dark mirrored glasses<<or>>with long, elegant silver-and-gold cybernetic arms ending in fine, elegant, <i>clawed</i> fingers<<or>>kitted out with military-spec bullet-proof skin reinforcements, discernable by the black lines tracing circuitry in the skin<<or>>wearing an alluring tight leather dress with a breast window displaying soft, smooth skin<<or>>wearing a combat jacket, tight shorts, and high heeled boots<<or>>trying to hide horrible burns up the side of their body under a jacket<<or>>with heavy combat augmentations erupting out of their body in various places<<or>>with three arms<<or>>whose two arms seem to shift, click, rearrange themselves, like complex clockwork, and split into four arms<<or>>with a penal control box in the side of their head<<or>>with arms too long for their body<<or>>wearing a smart, knife-creased black three-piece suit, dark glasses covering their eyes<<or>>wearing a sharp, professionally-drycleaned cream business suit with a pencil skirt<<or>>guiding a mil-spec hexapod<<shuffled>>";
}

generateCrowdCouple()
{
    return "<<one of>>two men<<or>>two women<<or>>a woman and a man<<or>>two women and a man<<or>>two men and a woman<<or>>three women<<or>>three men<<or>>two androgynous people<<or>>two people of indeterminite gender<<purely at random>>";

}

cityPeople: MultiLoc, Decoration 'people; ; crowds crowd'
    "<<if city.timeOfDayState == busy_state>>Citydwellers walk hurriedly across streets and along sidewalks, shoulders hunched, black leather or micro-shell collars and hoods pulled up against the acid rainwater spray of the passing cars, faces above their masks closed like login screens with lost passwords. So many people, streams of them passing back and forth, a herd of cattle rushed somewhere by invisible corrals, packed together yet profoundly alone. Each person unique in their ethnicity, their gender expression, their religion, their history, their appearance, each further elaborating on some theme through their cyberware, which ranges from the cheap but flashy to the utilitarian and beyond. Each person equally identical somehow, united in their body language and their struggle to survive.<<else if city.timeOfDayState == night_state>>The streets are nearly empty at this time of day, only a few walking here and there, following sidewalks, crossing streets, entering alleyways or buildings. Here and there, ragged dirty figures formerly hidden by the crowds are visible, hunched against walls, laid out on the street, squatting at corners, their few possessions huddled around them. A few have scrounged up VR goggles and are lost to the bleakness of this world. Empty beer cans, needles and syringes, fast food wrappers, and other detritus litter the ground around them, fluttering slightly in the wind and making a barely-audible pattering sound with the rain.<<else if city.timeOfDayState == nightlife_state>>The streets are just as packed now as they were during rush hour, but somehow the energy is different. <i>Live hard now, do everything you want now, have it all now,</i> the streets seem to say, <i>because tomorrow another twelve hours of your life will be sucked from you.</i> There is laughter, partying, groups of friends, jokes, slapping backs, kissing, fondling, drinking, shouting, there are people wearing their best after-hours outfits, leather and lace and mesh and fishnet stockings and corsets and coats and neon tubing and everything, but there is a desparation to it. It makes you anxious.<<else if city.timeOfDayState == deserted_state>>A few citydwellers hurry across streets and along sidewalks here and there, shoulders hunched, black leather or micro-shell collars and hoods pulled up against the acid rainwater spray of the passing cars, faces above their masks closed like login screens with lost passwords. Each person unique in their ethnicity, their gender expression, their religion, their history, their appearance, each further elaborating on some theme through their cyberware, which ranges from the cheap but flashy to the utilitarian and beyond. Each person equally identical somehow, united in their body language and their struggle to survive.<<end>> "
    specialDesc = "<<if city.timeOfDayState == busy_state>>The sidewalks are crowded with people hurrying to and from their shifts.<<else if city.timeOfDayState == deserted_state || city.timeOfDayState == night_state>>A few people walk scattered here and there on the sidewalks.<<else if city.timeOfDayState == nightlife_state>>People stroll or swagger by in groups, talking and laughing raucously, drinking beer, taking hits, playing music.<<end>> "

    dobjFor(Examine)
    {
        action()
        {
            "You notice <<generateCrowdPerson() >>. \b";

            inherited();
        }
    }

    locationList = [city]
;
