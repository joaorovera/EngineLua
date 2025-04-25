-- PaginaBase.lua
local FormularioContato = require("src/atomic/form")

local PaginaBase = {}

function PaginaBase:new()
    local obj = {
        cabecalho = "Quadrado da Alegria",
        formulario = FormularioContato:new(),
        rodape = "© 2025 Joao Vicente"
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PaginaBase:render(std)
    std.draw.color(std.color.white)
    std.text.put(3, 0, self.cabecalho, 1)
    self.formulario:render(std, 10, 40)
    std.text.put(3, 5, self.rodape, 1)
end

return PaginaBase
