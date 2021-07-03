/*
===========================================================================

  Copyright (c) 2021 LandSandBoat Dev Team

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

===========================================================================
*/

#ifndef _CINVENTORYCOUNTTO80PACKET_H
#define _CINVENTORYCOUNTTO80PACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

class CCharEntity;

class CInventoryCountTo80Packet : public CBasicPacket
{
public:
    CInventoryCountTo80Packet(uint8 LocationID, uint8 SlotID, uint8 additionalArg = 0);
};

#endif // _CINVENTORYCOUNTTO80PACKET_H
