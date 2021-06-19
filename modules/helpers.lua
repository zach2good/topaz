-----------------------------------
-- 'Module' helpers
-----------------------------------
module = {}

module.override = function(base_table, name, func)
    local old = base_table[name]
    local thisenv = getfenv(old)

    local env = { super = old }
    setmetatable(env, { __index = thisenv })

    setfenv(func, env)
    base_table[name] = func
end
