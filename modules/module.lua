-----------------------------------
-- 'Module' helpers
-----------------------------------

-- Global Defines
NULL = nil

-- Module Object
Module = {}
Module.__index = Module

function Module:new(name)
    if name == nil or string.len(name) < 5 then
        printf("Invalid module name: %s", name)
    end

    local obj = {}
    setmetatable(obj, self)
    obj.name = name
    return obj
end

function Module:override(base_table, name, func)
    local old = base_table[name]
    local thisenv = getfenv(old)

    local env = { super = old }
    setmetatable(env, { __index = thisenv })

    setfenv(func, env)
    base_table[name] = func
end
