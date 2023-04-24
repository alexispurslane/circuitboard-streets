tEviction: Topic '(my) eviction; locked canceled; apartment lease' @nil;
tFiring: Topic '(being) fired; (my) (me); firing' @nil;

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
    globalParamName = 'john'
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

++ HelloTopic, StopEventList
    [
        '"Hello," you say, nodding to {the subj john}.\b"The fuck do you want, kid?" he responds, more tired than angry.',
        '"Hey," you say, trying a grin.\b"Got something to talk about? Or are you just here to bother me?" he asks.',
        '"Hey," you say, trying a grin.\b"Got something to talk about? Or are you just here to bother me?" he asks.',
        '"Hi," you falter, with a hopeful smile on your lips. You hope it doesn\'t look as fake as it feels.\b"Spit it out, girl," he responds, patience clearly wearing thin.'
    ]
    changeToState = johnTalking
;

+ johnTalking: ActorState, ShuffledEventList
    attentionSpan = 2
    specialDesc = "{The subj john} is standing behind the crack between the door and the jamb, impatiently talking to you."
    stateDesc = "He's standing, talking to you through the cracked door."
    eventList = [
        '{The subj john} shifts slightly to take the weight off one knee.',
        '{The subj john} looks at you quizzically.',
        '{The subj john} passes a hand over his eyes.'
    ]
;

++ ByeTopic
    "{The subj john} shuts the door with a bang. You hear it lock.<<johnCloseDoorAndLeave()>> ";
;

++ BoredByeTopic
    "\"Look.\", {the subj john} says in frustration, \"If you're not gonna say shit, then don't knock on my door.\"\bWith that, he disappears back into his apartment, shutting the door behind himself. You hear it lock again.<<johnCloseDoorAndLeave()>> ";
;

++ LeaveByeTopic
    "{The subj john} silently watches you go for a moment, then shuts his door.<<johnCloseDoorAndLeave()>> ";
;

++ DefaultAskForTopic
    "{The subj john}'s mouth thins into a line."
;

++ DefaultAskTopic
    "{The subj john} looks at you silently for a moment.\b \"Don't have much to say about that,\" he says finally."
;

++ DefaultTellTopic
    "'None of that means anything to me.'"
;

++ DefaultShowTopic
    "{The subj john} glances at {the dobj} for a second, then looks back at you."
;

++ DefaultGiveTopic
    "{The subj john} pushes it away. \"Don't need that,\" he says curtly."
;

++ AskAboutForTopic 'name; his; handle'
    name = 'his name'
    topicResponse()
    {
        "\"Name's John,\" he replies curtly.";
        john.addVocab('John');
    }
;

++ aboutOveralls: AskTopic @overalls
    "{The subj john} grimaces. \"Not much use to me these days,\" he says. \"Been relegated to directing robots to do the work now. If that.\""
    name = 'his overalls'
    matchScore = 110
;

++ AskForTopic @overalls
    "\"I need your overalls.\"\b{The subj john} looks at you resentfully.\b\"Those are mine, kid. What do you want them for?\"<.convnode overalls>"
    name = 'his overalls'
;

+ ConvNode 'overalls';

++ TellTopic @tFiring
    "\"Got fired by SMILE. Framed.\"\b\"What's that got to do with my overalls?\" {the subj john} says, frowning.<.convnode firing>"
    name = 'your firing'
;

+ TellTopic @tEviction
    name = 'your eviction'
    topicResponse()
    {
        "\"Got locked out of my apartment, need to get through the vents to break in and get my stuff back out.\"\b";
        "{The subj john} looks at you like you just told him you want to blow up a megacorp tower. \"Are you <i>fucking insane</i>,\" he hisses, eyes darting up and down the corridor.<.convnode sanity>";
    }

    convKeys = ['overalls', 'firing']
;

+ ConvNode 'sanity';

++ YesTopic
    "You nod vehemently, eyes sparkling. The man eyes you up and down, then stifles a dark laugh. \"Well, don't get any on me,\" he says, shutting the door. <<johnCloseDoorAndLeave()>>";
;

++ NoTopic
    "\"No, just desperate and with nothing else to lose.\"\b\"Well <i>I've</i> still got something to lose, dipshit, so don't get me involved in your shit,\" he snaps. After staring at you for another second, his lip curls and he slams the door in your face. <<johnCloseDoorAndLeave()>>"
;

++ DefaultAnyTopic
    "You don't answer, and after a moment John shuts the door. <<johnCloseDoorAndLeave()>>"
;

+ ConvNode 'firing';

++ TellTopic 'new job'
    name = 'your new job (lie)'
    topicResponse()
    {
        "\"Getting a new job though,\" you say, faking a relieved smile. \"Bit of a career shift though &emdash; in plumbing. Can I borrow your overalls?\"\b";
        "He frowns. \"What if I need them?\"<.convnode needing>";
        "\"Do you actually use them?\"\b";
        "\"No, suppose not,\" he says after a moment. \"I mostly just direct robots now, and not even that for much longer.\"\b";
        "After another pause, he nods to himself and disappears for a few seconds. When he reappears, he hands the overalls to you.<.activate his-job>";
        overalls.moveInto(gPlayerChar);
    }
;

+ ConvNode 'his-job'
    activated = nil
;

++ AskTopic, StopEventList '(John\'s) job; his; work; it'
    name = 'his job'

    timesToSuggest = 4

    eventList = [
        function() {
            "\"What exactly is your job? What do you tell your robots to do?\"\b";
            "\"Well, I assume it was pretty similar to yours if you worked for at the warehouses for SMILE,\" he says, glancing at you. You nod. \"Yeah. Taking the big shot ideas management has, quotas and shit, and figuring out how to turn them into real world actions the robots can understand. Kinda like what script kiddies do I guess, but you gotta be around the business for awhile to get good at it...\", he trails off.\b";
            "<i>(Hint: ask again to continue this topic of conversation.)</i>\n<.convstay>";
        },
        function() {
            "\"Yeah, I get it. I had to work in warehouses for a couple years to get enough experience to direct loading mechs and shit.\"\b";
            "\"Kinda makes you wonder, doesn't it? Now that bots have replaced everyone but the people with experience, how's anyone gonna get that experience anymore?\"\b";
            "You meet that with silence, not really sure how to respond.\b<.convstay>";
        },
        function() {
            "After a moment, {the subj john} picks the conversation up again. \"Of course, that's all a moot point now...<.activate lost-job>\"\b";
        }
    ]
;

+ ConvNode 'lost-job'
    activated = nil
;

++ QueryTopic 'why' '(he) won\'t (be) working (for much) longer; have very long not; job'
    topicResponse()
    {
        "\"I'm being fired,\" he says, glancing away. You are struck once again by how bloodshot his eyes look, and the dark circles under them. He looks like death. \"'cuz I'm sick.\"\b";
        "He takes a deep breath.\b";
        "\"That's not the worst part though.\"\b";
        "You wait for him to say more, but he doesn't seem to want to. You can understand that.";

    }
;