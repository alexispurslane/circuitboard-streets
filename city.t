acrossStreetFrom: Relation 'across the street from' 'across the street from' @oneToOne +true ;

enum busy_state, deserted_state, night_state;

city: Region, RandomEventList
    eventList = [
        'Someone pushes past you, grunting an incomprehensible word which might be an apology or just as easily an insult.',
        'Cars drive past with the low ripping sound of tires on asphalt, throwing up streams of dirty water. The sound of car horns and engines soaks every cubic millimeter of the air, deafening if you\'re not used to it.',
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

    timeOfDay = busy_state
    regionBeforeTravel(traveler, connector)
    {
        if (traveler == gPlayerChar && related(gPlayerChar.location, 'across the street from', connector) && self.timeOfDay == busy_state)
            "You glance up and down the street quickly, then make your dash through traffic.";
    }
;