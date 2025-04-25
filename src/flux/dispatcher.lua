Dispatcher = {}
Dispatcher.__index = Dispatcher

function Dispatcher:new()
    local obj = { callbacks = {} }
    setmetatable(obj, Dispatcher)
    return obj
end

function Dispatcher:register(callback)
    table.insert(self.callbacks, callback)
end

function Dispatcher:dispatch(action)
    for _, callback in ipairs(self.callbacks) do
        callback(action)
    end
end

return Dispatcher
