local function init(std, data)
    data.state = 1
    data.square = {x = data.width / 2,y = data.height / 2,size = 50,speed = 10}
    data.squareKiller = {color = std.color.black, x = data.square.x-100, y = 0, speed = 8}
    data.squareKiller2= {color = std.color.purple, x = data.square.x + 220, y = data.height, speed = 8}
    local spacing = 100
    data.squareOptions = {
    {color = std.color.gray, x = data.square.x - 4 * spacing, y = data.square.y},
    {color = std.color.white, x = data.square.x - 3 * spacing, y = data.square.y},
    {color = std.color.red, x = data.square.x - 2 * spacing, y = data.square.y},
    {color = std.color.green, x = data.square.x - 1 * spacing, y = data.square.y},
    {color = std.color.blue, x = data.square.x, y = data.square.y},
    {color = std.color.yellow, x = data.square.x + 1 * spacing, y = data.square.y},
    {color = std.color.magenta, x = data.square.x + 2 * spacing, y = data.square.y},
    {color = std.color.brown, x = data.square.x + 3 * spacing, y = data.square.y},
    {color = std.color.purple, x = data.square.x + 4 * spacing, y = data.square.y}
    }
    data.squareOptions_aux = {}
    data.menu_size = #data.squareOptions
    for i, option in ipairs(data.squareOptions) do
        data.squareOptions_aux[i] = option
    end
    data.menu_time = std.milis
end
local function menu_navigation(std, data)
    if data.state == 1 then
        if std.key.axis.x == -1 and std.milis > data.menu_time + 200 then
            local lastColor = data.squareOptions_aux[#data.squareOptions_aux].color
            for i = #data.squareOptions_aux, 2, -1 do
                data.squareOptions_aux[i].color = data.squareOptions_aux[i - 1].color
            end
            data.squareOptions_aux[1].color = lastColor
            data.menu_time = std.milis
        end
        if std.key.axis.x == 1 and std.milis > data.menu_time + 200 then
            local firstColor = data.squareOptions_aux[1].color
            for i = 1, data.menu_size - 1 do
                data.squareOptions_aux[i].color = data.squareOptions_aux[i + 1].color
            end
            data.squareOptions_aux[data.menu_size].color = firstColor
            data.menu_time = std.milis
        end
        if std.key.press.a and std.milis > data.menu_time + 200 then
            data.square.x = 0
            data.square.color = data.squareOptions_aux[5].color
            data.state = 2
            data.menu_time = std.milis
        end
    elseif data.state == 2 then
        if std.key.press.a and std.milis > data.menu_time + 200 then
            data.state = 1
            data.menu_time = std.milis
        end
    end
end
local function loop(std, data)
    menu_navigation(std, data)
    if data.state == 2 then
        --control square navigation
        data.square.y = std.math.clamp(data.square.y + (std.key.axis.y * data.square.speed), 0, (data.height - data.square.size))
        data.square.x = std.math.clamp(data.square.x + (std.key.axis.x * data.square.speed), 0, (data.width - data.square.size))
        
        -- Move the square killer up and down
        data.squareKiller.y = data.squareKiller.y + data.squareKiller.speed
        if data.squareKiller.y > data.height then
            data.squareKiller.y = data.height
            data.squareKiller.speed = -8
        elseif data.squareKiller.y < 0 then
            data.squareKiller.y = 0
            data.squareKiller.speed = 8 
        end

        -- Move the square killer 2 up and down
        data.squareKiller2.y = data.squareKiller2.y + data.squareKiller2.speed
        if data.squareKiller2.y > data.height then
            data.squareKiller2.y = data.height
            data.squareKiller2.speed = -8
        elseif data.squareKiller2.y < 0 then
            data.squareKiller2.y = 0
            data.squareKiller2.speed = 8 
        end
    end
end
local function draw(std, data)
    if data.state == 1 then
        for i, option in ipairs(data.squareOptions_aux) do
            if i == 5 then
                std.draw.color(option.color)
                std.draw.rect(0, option.x - 5, option.y - 5, data.square.size + 20, data.square.size + 20)
            else
                std.draw.color(option.color)
                std.draw.rect(0, option.x, option.y, data.square.size, data.square.size)
            end
        end
    elseif data.state == 2 then
        std.draw.color(std.color.green)
        std.draw.rect(0,1100,0,180,720)
        std.draw.color(data.squareKiller.color)
        std.draw.rect(0,data.squareKiller.x,data.squareKiller.y,data.square.size,data.square.size)
        std.draw.rect(0,data.squareKiller.x + 200,data.squareKiller.y,data.square.size,data.square.size)
        std.draw.color(data.squareKiller2.color)
        std.draw.rect(0,data.squareKiller2.x,data.squareKiller2.y,data.square.size,data.square.size)
        std.draw.rect(0,data.squareKiller2.x - 240,data.squareKiller2.y,data.square.size,data.square.size)
        std.draw.color(std.color.white)
        std.text.put(1,1,"Press Enter to choose your skin again",1)
        std.draw.color(data.square.color)
        std.draw.rect(0, data.square.x,data.square.y,data.square.size,data.square.size)
    elseif data.state == 3 then
        std.draw.color(std.color.white)
        std.text.put(1,1,"YOU WON! Press Enter to choose your skin again",1)
    end
end
local P = {
meta = {
title = "Quadrado da alegria",
author = "Joao vicente",
description = "alegria garantida",
version = "1.0.1"
},
callbacks = {
init = init,
loop = loop,
draw = draw
}
}
return P