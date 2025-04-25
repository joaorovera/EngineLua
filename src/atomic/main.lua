-- main.lua
local PaginaBase = require("src/atomic/paginabase")

local function init(std, data)
   data.pagina = PaginaBase:new()
    -- Inicializações futuras aqui, se quiser
end

local function loop(std, data)
    -- Lógica de jogo
end

local function draw(std, data)
    std.draw.clear(std.color.black)
    data.pagina:render(std)
end

local P = {
    meta = {
        title = "Quadrado da alegria",
        author = "João Vicente",
        description = "Alegria garantida",
        version = "1.0.1"
    },
    callbacks = {
        init = init,
        loop = loop,
        draw = draw
    }
}

return P
