modify Room
    interiorDesc
    {
        if (libGlobal.fullDescMode || !descCount || descCount && descCount % 7 == 0)
        {
            desc;
        }
        else
        {
            conciseDesc;
        }
        descCount++;
    }
    conciseDesc = desc
    descCount = 0
;

modify libGlobal
    lastTimeOfDay = nil
    fullDescMode = nil
;

DefineIAction(SwitchFullDesc)
    execAction(c)
    {
        libGlobal.fullDescMode = !libGlobal.fullDescMode;
        "Room descriptions have been toggled to <<if libGlobal.fullDescMode>>always show the full descriptions for rooms<<else>>only show the full descriptions of rooms the first time, and then periodically afterwards.";
    }
;

DefineIAction(FullLook)
    execAction(c)
    {
        local save = libGlobal.fullDescMode;
        try
        {
            libGlobal.fullDescMode = true;
            execNestedAction(true, gActor, Look);
        }
        finally
        {
            libGlobal.fullDescMode = save;
        }
    }
;


VerbRule(FullDesc) 'toggle' ('fulldesc'|'fulldescs'|'full' ('room'|'location') ('desc'|'descs'|'description'|'descriptions')) : VerbProduction
    action = SwitchFullDesc
    turnsTaken = 0
;

VerbRule(FullLook) 'full' 'look'|'fl'|'ll' : VerbProduction
    action = FullLook
;

DefineTAction(KnockOn) ;

modify Thing
    knockOnMsg = "{I} knock on {the dobj}, but nothing happens."
    dobjFor(KnockOn)
    {
        preCond = [touchObj]
        verify()
        {
            // passes
        }
        action()
        {
            knockOnMsg;
        }
    }
;

VerbRule(KnockOn) 'knock' 'on' singleDobj : VerbProduction
    action = KnockOn
    verbPhrase = 'knock/knocking on (what)'
    missingQ = 'what do you want to knock on'
;

DefineTAction(Kick) ;

modify Thing
    kickMsg = "It may be satisfying to take your anger out on the things around you, but try directing that violence more carefully. Maybe you can cause some real damage. "
    dobjFor(Kick)
    {
        preCond = [touchObj]
        verify()
        {
            // passes
        }
        action()
        {
            kickMsg;
        }
    }
;

VerbRule(Kick) 'kick' ('on'|'at'|'next' 'to'|) singleDobj : VerbProduction
    action = Kick
    verbPhrase = 'kick/kicking (what)'
    missingQ = 'what do you want to kick'
;

VerbRule(Pay) 'pay' singleDobj : VerbProduction
    action = Pay
    verbPhrase = 'pay/ paying (what)'
    missingQ = 'who or what do you want to pay'
;

DefineTAction(Pay)
    execAction(cmd)
    {
        "With a subvocalized command, your augreal hud spins its glowing pink wireframe interface around you with a satisfying animation. A moment later, you've brought up your payments interface. ";

        if (gPlayerChar.hasMoney)
            inherited(cmd);
        else
        {
            "You check your balance and realize that, since you were fired only a few days before your paycheck, you're broke as fuck. A wave of helpless frustration rolls over you again. ";
        }

    }
;

modify About
    execAction(cmd)
    {
        aboutMenu.display();
    }
;

VerbRule(Call) 'call' (singleDobj|) : VerbProduction
    action = Call
    verbPhrase = 'call/ calling (what)'
    missingQ = 'who or what do you want to call'
;

DefineTAction(Call)
    execAction(cmd)
    {
        "With a subvocalized command, the pink wireframe of your augreality hud weaves itself in a half circle around you, calling <<cmd.dobj>>.\b";
        inherited(cmd);
    }
;
