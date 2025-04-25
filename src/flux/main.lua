local Store = require("src/flux/store")

local function init(std,data)
    data.store = Store:new()
    data.menu_time = std.milis
end

local function loop(std, data)
    if std.key.press.a and std.milis > data.menu_time + 150 then
        data.store.dispatcher:dispatch({ type = "TOGGLE_SELECTION" })
        data.menu_time = std.milis
    end
end

local function draw(std, data)
    std.draw.clear(std.color.black)
    local selected = data.store:getState()

    for i = 1, 2 do
        local x = 50 + (i - 1) * 120
        local y = 100
        local size = 102
        std.draw.color(std.color.white)
        std.draw.rect(0, x, y, size, size)
        
        if selected == i then
            std.draw.color(std.color.red)
            std.draw.rect(1, x - 4, y - 4, size + 8, size + 8) -- Contorno um pouco maior
        end
    end
end

local P = {
    meta = {
        title = "Flux arch",
        author = "Joao Vicente",
        description = "App zedia",
        version = "0.6.0"
    },
    config = {
        require = 'http json'
    },
    callbacks = {
        init = init,
        loop = loop,
        draw = draw
    }
}
return P
