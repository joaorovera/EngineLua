local components = require('src/luaComponents/components')
local App = {
    title = 'Grid System',
    author = '',
    version = '1.0.0',
    require = 'math'
}

local ClimaTV = {
    draw = function(std, data)
        std.draw.clear(std.color.black)
        std.draw.color(std.color.red)
        std.draw.rect(1, 1, 1, data.width - 2, data.height - 2)
        local w, h = tostring(std.math.ceil(data.width)), tostring(std.math.ceil(data.height))
        std.text.print(8, 8, 'Clima TV\n'..w..'x'..h)
    end
}

local HoraTv = {
    draw = function(std, data)
        std.draw.clear(std.color.black)
        std.draw.color(std.color.green)
        std.draw.rect(1, 1, 1, data.width - 2, data.height - 2)
        local w, h = tostring(std.math.ceil(data.width)), tostring(std.math.ceil(data.height))
        std.text.print(8, 8, 'Clima TV\n'..w..'x'..h)
    end
}

local TestTv = {
    draw = function(std, data)
        std.draw.color(std.color.yellow)
        std.draw.rect(1, 1, 1, data.width - 2, data.height - 2)

        local w, h = tostring(std.math.ceil(data.width)), tostring(std.math.ceil(data.height))
        std.text.print(8, 8, 'Clima TV\n'..w..'x'..h)
    end
}

function App.load(std, data)
    std.ui.grid('1x10')
    :add(ClimaTV,1)
    :add(std.ui.grid('12x1')
        :add(ClimaTV,1)
        :add(ClimaTV,8)
        :add(ClimaTV,3),7)
    :add(ClimaTV,2)
    :apply()
    -- std.ui.style('selected')
    --     :pos_y(function(std, node, parent)
    --         return parent.config.offset_y - 128
    --     end)
    -- std.ui.grid('1x12')
    -- :add(ClimaTV,8)
    -- :add(std.ui.slide('6x1')
    -- :style_item_select('selected')
    -- :add(ClimaTV)
    -- :add(HoraTv)
    -- :add(TestTv)
    -- :add(ClimaTV)
    -- :add(HoraTv)
    -- :add(TestTv)
    -- :apply(),4)
    -- :apply()
end

return App