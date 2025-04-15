-- Botao.lua
local Botao = {}

function Botao:new(texto, cor, largura, altura)
    local obj = {
        texto = texto or "Clique",
        cor = cor or nil,
        largura = largura or 100,
        altura = altura or 30
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Botao:render(std, x, y)
    std.draw.color(self.cor or std.color.white)
    std.draw.rect(0, x, y, self.largura, self.altura)
    std.text.put(x + 10, y + 10, self.texto, 1)
end

return Botao
