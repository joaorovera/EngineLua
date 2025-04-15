-- CampoComBotao.lua
local Botao = require("src/atomic/botao")

local CampoComBotao = {}

function CampoComBotao:new(label, corLabel, corBotao)
    local obj = {
        label = label or "Texto:",
        corLabel = corLabel,
        botao = Botao:new("Enviar", corBotao)
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function CampoComBotao:render(std, x, y)
    std.draw.color(self.corLabel or std.color.white)
    std.text.put(x, y, self.label, 1)
    self.botao:render(std, x, y + 20)
end

return CampoComBotao
