
WIDTH = 400
HEIGHT = 250
SCALE = 3

bgcolor = {240,240,255,255}

highscore = {0,0,0}

JUMP_POWER = -500
GRAVITY = 1000

use_music = true

--State of the game:

-- 0: menu
-- 1: ingame
-- 2: pause?
-- 3: endgame
-- 4: credits

gamestate = 1

--Direction of our main character

--0: right
--1: left

direction = 1

--load assets and initialize values

function love.load()

	love.graphics.setBackgroundColor(bgcolor)

	loadHighscore()
	loadResources()

	updateScale()
	restart()

end

function updateScale()
	SCRNWIDTH = WIDTH*SCALE
	SCRNHEIGHT = HEIGHT*SCALE
	
	love.graphics.setMode(SCRNWIDTH,SCRNHEIGHT,false)
	
	screenmiddlewidth = WIDTH*SCALE/2
	screenmiddleheight = HEIGHT*SCALE/2
	
	macy=screenmiddleheight+65
end

function loadResources()

	-- Load images
	imgBackground = love.graphics.newImage("gfx/background.png")
	imgBackground:setFilter("nearest","nearest")
	
	imgCity = love.graphics.newImage("gfx/city.png")
	imgCity:setFilter("nearest","nearest")

	imgMacLeft = love.graphics.newImage("gfx/macl.png")
	imgMacLeft:setFilter("nearest","nearest")
	
	imgMacRight = love.graphics.newImage("gfx/macr.png")
	imgMacRight:setFilter("nearest","nearest")

	imgForeground = love.graphics.newImage("gfx/foreground.png")
	imgForeground:setFilter("nearest","nearest")
	
	imgSky = love.graphics.newImage("gfx/sky.png")
	imgSky:setFilter("nearest","nearest")
	
	imgPauseScreen = love.graphics.newImage("gfx/pauseScreen.png")
	imgPauseScreen:setFilter("nearest","nearest")


	-- Load sound effects
	--auCoffee = love.audio.newSource("sfx/coffee.wav","static")
	--auHit = love.audio.newSource("sfx/hit.wav","static")
	--auSelect = love.audio.newSource("sfx/select.wav","static")
	
	if use_music == true then
	--	auBGM = love.audio.newSource("sfx/bgm.ogg","stream")
	--	auBGM:setLooping(true)
	--	auBGM:setVolume(0.6)
	--	auBGM:play()
	end


end

function loadHighscore()
	if love.filesystem.exists("highscore") then
		local data = love.filesystem.read("highscore")
		if data ~=nil then
			local datatable = table.load(data)
			if #datatable == #highscore then
				highscore = datatable
			end
		end
	end
end

function saveHighscore()
	local datatable = table.save(highscore)
	love.filesystem.write("highscore",datatable)
end

function restart()

	score = 0
	worldSize = 1
	rotation = 0
	jumping = false
	yspeed = 1

end


function love.focus(f)
	if not f and gamestate == 1 then
		gamestate = 2
	end
end

function love.draw()

	--Draw world
	
	
	--love.graphics.draw( imgSky, screenmiddlewidth, screenmiddleheight+600-((1.0-worldSize)*700), -rotation*0.25*6.28, 0.4, 0.4, imgSky:getWidth()/2, imgSky:getHeight()/2 )
	
	love.graphics.draw( imgBackground, screenmiddlewidth, screenmiddleheight+65+imgBackground:getHeight()/2*worldSize*0.629, rotation*6.28, worldSize, worldSize, imgBackground:getWidth()/2, imgBackground:getHeight()/2 )
	
	--Draw mac!
	if direction == 1 then
		love.graphics.draw( imgMacLeft, screenmiddlewidth, macy, 0, 1, 1, imgMacLeft:getWidth()/2, imgMacLeft:getHeight())
	else
		love.graphics.draw( imgMacRight, screenmiddlewidth, macy, 0, 1, 1, imgMacLeft:getWidth()/2, imgMacLeft:getHeight())
	end
	
	love.graphics.draw( imgForeground, screenmiddlewidth, screenmiddleheight+65+imgBackground:getHeight()/2*worldSize*0.629, rotation*6.28, worldSize, worldSize, imgBackground:getWidth()/2, imgBackground:getHeight()/2 )
	
	--love.graphics.draw( imgForeground, screenmiddlewidth, screenmiddleheight+600-((1.0-worldSize)*700), rotation*6.28, worldSize, worldSize, imgBackground:getWidth()/2, imgBackground:getHeight()/2 )
	
	if gamestate == 2 then
		love.graphics.draw( imgPauseScreen, 0, 0 )
	end

end

function love.keypressed(key,unicode)

	--MAIN MENU KEYBOARD HANDLING
    if gamestate == 0 then
    
		if key == 'down' then
			menuDown()
		elseif key == 'up' then
			menuUp()
		elseif key == 'return' then
			menuEnter()
		elseif key == 'escape' then
			menuEscape()
		end	
	

	--IN-GAME KEYBOARD HANDLING
    elseif gamestate == 1 then
    
		if key == 'p' then
			gamestate = 2
		end	
	
	--PAUSE KEYBOARD HANDLING
	elseif gamestate == 2 then
	
		if key == 'p' then
			gamestate = 1
		elseif key == 'q' then
			gamestate = 0
		end	
		
	end
	
	
	
end

function love.update(dt)

	
    if gamestate == 1 then
		if love.keyboard.isDown("u") then
			if worldSize < 1 then
				worldSize = worldSize + 0.001
			end
		
		elseif love.keyboard.isDown("d") then
			if worldSize > 0 then
				worldSize = worldSize - 0.001
			end
		end
		
		--Jumping logic
		if love.keyboard.isDown(" ") and jumping == false then
			yspeed = JUMP_POWER
			jumping = true
		end

		jumping = true

		-- Update position
		yspeed = yspeed + dt*GRAVITY

		macy = macy + yspeed*dt
		if macy > screenmiddleheight+65 then
			macy = screenmiddleheight+65
			yspeed = 0
			jumping = false
		end
		
		if love.keyboard.isDown("left") then
			direction = 1
			if rotation < 1 then
				rotation = rotation + 0.002
			
			else
				rotation = -1
			end
			
		elseif love.keyboard.isDown("right") then
			direction = 0
			if rotation > -1 then
				rotation = rotation - 0.002
			else
				rotation = 1
			end	
		end
	end


end
