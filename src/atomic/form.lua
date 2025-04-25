-- FormularioContato.lua
local CampoComBotao = require("src/atomic/campocombotao")

local FormularioContato = {}

function FormularioContato:new()
    local obj = {
        titulo = "Fale conosco",
        campo = CampoComBotao:new("Sua mensagem:", nil, nil)
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function FormularioContato:render(std, x, y)
    std.draw.color(std.color.white)
    std.text.put(3, 12, self.titulo, 1)
    self.campo:render(std, x, y + 20)
end

return FormularioContato
