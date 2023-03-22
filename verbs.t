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