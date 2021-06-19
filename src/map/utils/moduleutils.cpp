/*
===========================================================================

  Copyright (c) 2021 LandSandBoat Dev Teams

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

#include "moduleutils.h"

#include "common/cbasetypes.h"
#include "../lua/luautils.h"

#include <filesystem>

namespace moduleutils
{
    void LoadModules()
    {
        auto& lua = luautils::lua;

        // Load the helper file
        lua.script_file("./modules/helpers.lua");

        // Load each module file that isn't the helpers.lua file
        for (auto const& entry : std::filesystem::directory_iterator("./modules"))
        {
            auto path          = entry.path().relative_path();
            bool isHelpersFile = path.filename() == "helpers.lua";

            if (!entry.is_directory() &&
                path.extension() == ".lua" &&
                !isHelpersFile)
            {
                auto ret = lua.script_file(path.generic_string());

                // If nothing returns, the script was loaded
                if (ret.return_count() == 0)
                {
                    ShowMessage("\t\t\t\t - %s\n", path.filename());
                }
            }
        }

    }
}; // namespace moduleutils
