#charset "us-ascii"
#include <tads.h>
#include "advlite.h"
#include "extensions/relations.t"
#include "extensions/roomparts.t"
#include "player.t"
#include "city.t"

versionInfo: GameID
    IFID = 'C62F7146-4A64-450E-B686-5102EE32FE26'
    name = 'Circuitboard Streets'
    byline = 'by Alexis Purslane'
    authorEmail = 'Alexis Purslane <alexispurslane@pm.me>'
    desc = 'An interactive cyberpunk novel.'
    version = '0.1'
;

gameMain: GameMainDef
    initialPlayerChar = me
;

InitObject
    execute()
    {
        relate(inteletekShopfront, 'across the street from', megablockExterior);
    }
;

megablockExterior: OutdoorRoom 'Outside Megablock M-3B'
    "You stand outside the towering mega-arcology of Megablock M-3B."

    west = inteletekShopfront

    regions = [city]
;

inteletekShopfront: OutdoorRoom 'InteleTek Shopfront'
    "You are standing in front of the InteleTek cyberware store, which is to the west."

    east = megablockExterior
    west = inteletekInterior
    in = inteletekInterior

    regions = [city]
;

inteletekInterior: Room 'InteleTek Store Interior'
    "You stand inside the dingy InteleTek shop."
    east = inteletekShopfront
    out = inteletekShopfront
;
