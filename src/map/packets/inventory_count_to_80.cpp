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

#include "inventory_count_to_80.h"

CInventoryCountTo80Packet::CInventoryCountTo80Packet(uint8 LocationID, uint8 SlotID, uint8 additionalArg)
{
    this->type = 0x26; // this->type = 0x026; 
    this->size = 0x1C;

    ref<uint8>(0x04) = LocationID;
    ref<uint8>(0x05) = SlotID;
    ref<uint8>(0x06) = additionalArg;

    ref<uint8>(0x08) = 0xFC;
    ref<uint8>(0x09) = 0xFC;
    ref<uint8>(0x0A) = 0x1F;

    if (LocationID)
    {
        ref<uint8>(0x0D) = 0x10;
        ref<uint8>(0x0F) = 0x20;
        ref<uint8>(0x11) = 0x30;
        ref<uint8>(0x13) = 0x40;
        ref<uint8>(0x15) = 0x50;
        ref<uint8>(0x17) = 0x60;
        ref<uint8>(0x19) = 0x70;
        ref<uint8>(0x1B) = 0x80;
    }
}
