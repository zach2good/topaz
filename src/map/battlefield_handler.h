﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _CBATTLEFIELDHANDLER_H
#define _CBATTLEFIELDHANDLER_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "battlefield.h"
#include <vector>

class CCharEntity;
class CMobEntity;

class CBattlefieldHandler
{
public:

    CBattlefieldHandler(std::uint16_t zoneid);
    void	handleBattlefields(time_point tick);							// called every tick to handle win/lose conditions, locking the bcnm, etc
    int		registerBcnm(std::uint16_t bcnmid, CCharEntity* PChar);		// returns the battlefield id of the registration, -1 if no free bcnm.
                                                                    // also registers all people in the characters PT, etc.

    bool	enterBcnm(std::uint16_t bcnmid, CCharEntity* PChar);			// Enters the BCNM battlefield if you're registered
    bool	leaveBcnm(std::uint16_t bcnmid, CCharEntity* PChar);			// Leaves the BCNM battlefield if you're registered
    bool	disconnectFromBcnm(CCharEntity* PChar);					// Disconnects/Warps you from a BCNM
    bool	winBcnm(std::uint16_t bcnmid, CCharEntity* PChar);				// Wins a BCNM battlefield (e.g. the player opening the chest)

    std::uint8_t	findBattlefieldIDFor(CCharEntity* PChar);					// returns 1 2 3 or 255 if non-existent
    bool	hasFreeBattlefield();										// returns true if there is a free battlefield available
    bool	hasFreeSpecialBattlefield(std::uint16_t id);
    bool    hasSpecialBattlefieldEmpty(std::uint16_t id);                     // return 1 if one or more player is still on the special battlefield
    duration     SpecialBattlefieldLeftTime(std::uint16_t id, time_point tick);         //return left Time of the specific battlefield
    int     GiveTimeToBattlefield(std::uint16_t id, duration Time);              // give time to specific battlefield
    void    SetLootToBCNM(std::uint16_t LootID, std::uint16_t id, std::uint32_t npcID);
    void    RestoreOnBattlefield(std::uint16_t id);                          //restor MP HP ability on a specific battlefield
    std::uint32_t	pollTimeLeft(std::uint16_t bcnmid);							// returns the shortest time left of all 3 battlefields of the given BCNM ID
    void	openTreasureChest(CCharEntity* PChar);
    void	wipeBattlefield(CBattlefield* inst);
    CBattlefield* getBattlefield(CCharEntity*);                           // returns the battlefield a player is in

    int     SpecialBattlefieldAddPlayer(std::uint16_t id, CCharEntity* PChar);
    //Dynamis Functions
    int		getUniqueDynaID(std::uint16_t id);								//
    int		registerDynamis(std::uint16_t id, CCharEntity* PChar);			//
    int		dynamisAddPlayer(std::uint16_t dynaid, CCharEntity* PChar);	// Add a player to the dynamis battlefield
    int		dynamisMessage(std::uint16_t Param1, std::uint16_t Param2);			// Add message on dynamis param1: messageid, param2: parameter
    void	launchDynamisSecondPart();
    bool	disconnectFromDynamis(CCharEntity* PChar);

    void	insertMonsterInList(CMobEntity* PMob);
    bool	checkMonsterInList(CMobEntity* PMob);

    std::uint16_t					m_ZoneId;

private:
    std::uint8_t					m_MaxBattlefields;							// usually 3 except dynamis, einherjar, besieged, ...
    CBattlefield*				m_Battlefields[8];
};

#endif