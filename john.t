Quip template "desc"? "reply"?;

johnCloseDoorAndLeave()
{
    john.setState(johnInside);
    john.isHidden = true;
    neighbor2Door.isOpen = nil;
    john.currentInterlocutor = nil;
}

john: Actor 'middle-aged man; weathered weatherbeaten; neighbor; him' @megablockFloor1NorthWest
    "You can't see much of {the subj john} through the crack in the door. What you can see, however, is his face. It is a perfect study in the toll the City takes on a man. His dark skin is deeply pockmarked from decades of exposure to the acid rain, his sunken, red-rimmed eyes squint at you with something between apathy and sorrow, and his mouth below the graying mustache is pressed into an eternal line, chin jutting out. He isn't balding, by some miracle, and dark, unwashed hair straggles limply over his face."
    isHidden = true
    isHim = true
    globalParamName = 'john'

    dobjFor(TalkTo)
    {
        action()
        {
            "\"Hey,\" you say, taking a step back from the doorway. \b";
            "{The subj john} looks at you, his face an immobile mask poorly concealing the pain that's encoded there like holographic information, every line telling the whole story. \"What can I do for you?\" \b";

            gbJohnConversation.select();
        }
    }
;

+ Fixture 'moustache; gray grey graying greying'
    ownerNamed = true
;

+ johnInside: ActorState
    isInitState = true
;

+ johnStanding: ActorState
    specialDesc = "{The subj john} stands motionlessly, peering through the cracked door at you."
    stateDesc = "He's looking through the crack between the door and the jamb at you."

    activateState(actor, oldState)
    {
        john.isHidden = nil;
        neighbor2Door.isOpen = true;
    }
;

gbJohnConversation: QMain
    options = [gbName, gbOkay, gbOveralls, gbPressForMore]
;

gbOkay: Quip
    "\"Hey man, you look like shit. Everything okay?\" "
    "{The subj john} grimaces. \"It doesn't really matter.\" "
    isOn = nil
    qOff = [gbOkay]
    qOn = [gbPressForMore]
    transfer = gbJohnConversation
;

gbName: Quip
    "\"What's your name?\" "
    "The middle-aged man looks at you wearily. \"Name's John.\" Resignation weighs his voice down so that his name lands with the limp thud of a dead body. Like he doesn't want to get to know anyone, because he's seen where that leads.<<john.addVocab('John')>> "

    qOff = [gbName]
    qOn = [gbOkay, gbOveralls]
    transfer = gbJohnConversation
;

gbOveralls: Quip
    "\"I need your overalls real quick. I'll get them back to you, don't worry.\""
    "{The subj john} grimaces, looking at you through slightly squinted eyes. \"What for?\""
    isOn = nil
    isOff = [gbOveralls]
    options = [gbNewJob, gbBreakIn]
;

gbNewJob: Quip
    "\"Just got a new job. Work safety is different than the warehouse job I worked before, need some reinforced overalls and shit to keep me safe, but I don't have the scratch right now. Gonna need to work a few weeks before I have the money to buy the gear I need. Figured I could borrow yours and pay you back later.\" "
    reply()
    {

        "John nods to himself, considering for a moment. \"Alright. Not like I'll need them anymore anyway, and I could use the money myself.\"\b";
        "He dissappears into his apartment, then reappears a moment later with the overalls rolled up in one hand. He hands them to you with a strange reluctance. ";
        overalls.moveInto(gPlayerChar);
    }
    qOff = [gbNewJob]
;

gbBreakIn: Quip
    "\"Just lost my job, framed for theft. The corporation was affiliated with the one that runs this dump, so... bad credit, no apartment. Gotta break in and get my stuff before I get the fuck out of here.\""
    reply()
    {

        "John gives a sharp, quiet bark of laughter. \"You gotta be fucking joking.\"\b";
        "After a moment, he realizes you're deadly serious, and his bitter smile fades. \"Kid, that's insane.\" Then, adds: \"I don't want any part of this,\" and with that, the door closes in your face. ";
        johnCloseDoorAndLeave();
    }
    qOff = [gbBreakIn]
;

gbPressForMore: Quip
    "\"It looks like whatever it is matters like fuck to you, John. Are you sure you're okay?\" "
    "John looks at you with tired, confused eyes. \"Look, just leave me alone, alright? What business of it is yours, anyway. You've been here for awhile and we haven't spoken once that whole time, except now. That means you want something. So spit it out, kid, before I close this door.\" "
    isOn = nil
    qOff = [gbPressForMore]
    options = [gbOveralls]
;
