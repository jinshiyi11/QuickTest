--sigslot
--from http://lua-users.org/wiki/AlternativeObserverPattern 
--and http://lua-users.org/wiki/ObserverPattern

local signal = {}

-- Provision for garbage collection, weak metatable and sentinel.
local weak = { __mode = "kv" }

-- Register
local function connect( self, observer, method )
    local t = {}
    t.o = observer or weak
    t.m = method
    setmetatable( t, weak )
    table.insert( self, t )
end

-- Deregister
local function disconnect( self, observer, method )
    local i
    local n = #self
    for i = n, 1, -1 do
        if (not observer or self[i].o == observer) and
            (not method   or self[i].m == method)
        then
            table.remove( self, i )
        end
    end
end

-- Notify
local function emit( self, ... )
    local i
    local n = #self
    for i = 1, n do
        if self[i].o == weak then
            self[i].m( ... )
        elseif self[i].o then
            self[i].m( self[i].o, ... )
        end
        -- garbage collected observers (nil) are skipped.
    end
end

-- signal metatable
local mt = {
    __call = function( self, ... )
        self:emit(...)
    end
}

function signal.new()
    local t = {}
    t.connect = connect
    t.disconnect = disconnect
    t.emit = emit
    setmetatable( t, mt )
    return t
end

return signal