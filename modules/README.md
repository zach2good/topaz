# Modules

## Goal
To provide an interface to customise the server that is easily extensible by people who aren't comfortable/willing to deep dive into C++.

If the scope of changes is too large and requires extensive core changes, then a module won't cut it.

## Implementation
During startup, the server will init everything it needs to run. It will load all the static data it needs from the database and hold it in memory. It will preload every Lua script and keep the results in the Lua cache.

Once this data is in memory, traditionally, it isn't modified. This applies to both C++ static data and the Lua cache.

The module system applies changes to this data as the last step of server startup, allowing customisation of many things.

As the system expands, more things will be given hooks for modification.
