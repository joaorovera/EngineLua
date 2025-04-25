local Dispatcher = require("src/flux/dispatcher")

Store = {}
Store.__index = Store

function Store:new()
    local obj = { selectedSquare = 1, dispatcher = Dispatcher:new() }
    
    obj.dispatcher:register(function(action)
        if action.type == "TOGGLE_SELECTION" then
            obj.selectedSquare = 3 - obj.selectedSquare -- Alterna entre 1 e 2
        end
    end)

    setmetatable(obj, Store)
    return obj
end

function Store:getState()
    return self.selectedSquare
end

return Store
