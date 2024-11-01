local function init(std, game)
    game.current_text = "hello world"
    game.last_time = os.clock()
    game.time_elapsed = 0
end

local function reset_game(std)
    std.game.reset()
end
 
local function loop(std, game)
    local current_time = os.clock()
    std.deltaTime = current_time - game.last_time
    game.last_time = current_time
    game.time_elapsed = game.time_elapsed + std.deltaTime
    
    local comprimento = #game.current_text

    if comprimento >= 20 then
        print("reiniciando jogo")
        reset_game(std)
    end
    if game.time_elapsed >= 1 then
        game.current_text = game.current_text .. "a"
        game.time_elapsed = 0
        print(#game.current_text)
    end
end
 
local function draw(std, game)
    std.draw.clear(std.color.black)
    std.draw.color(std.color.white)
    std.draw.text(100 , 100, game.current_text)
end
 
local function exit(std, game)
end
 
local P = {
    meta={
        title='Hello world',
        author='RodrigoDornelles',
        description='say hello to the world!',
        version='1.0.0'
    },
    callbacks={
        init=init,
        loop=loop,
        draw=draw,
        exit=exit
    }
}

return P;