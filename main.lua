
WIDTH = 300
HEIGHT = 200
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


--load assets and initialize values


macFrames = {}
macFrames[0] = love.graphics.newQuad(0,0,78,106,719,106)
macFrames[1] = love.graphics.newQuad(81,0,78,106,719,106)
macFrames[2] = love.graphics.newQuad(161,0,78,106,719,106)
macFrames[3] = love.graphics.newQuad(241,0,78,106,719,106)
macFrames[4] = love.graphics.newQuad(321,0,78,106,719,106)
macFrames[5] = love.graphics.newQuad(401,0,78,106,719,106)
macFrames[6] = love.graphics.newQuad(481,0,78,106,719,106)
macFrames[7] = love.graphics.newQuad(561,0,78,106,719,106)
macFrames[8] = love.graphics.newQuad(641,0,78,106,719,106)

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
	
	macy=screenmiddleheight+12
end

function loadResources()

	-- Load images
	imgBackground = love.graphics.newImage("gfx/background.png")
	imgBackground:setFilter("nearest","nearest")
	
	imgCity = love.graphics.newImage("gfx/city.png")
	imgCity:setFilter("nearest","nearest")
	
	imgCityDamaged = love.graphics.newImage("gfx/city-damaged.png")
	imgCity:setFilter("nearest","nearest")
	
	imgCityDestroyed = love.graphics.newImage("gfx/city-destroyed.png")
	imgCity:setFilter("nearest","nearest")

	imgMacRF = love.graphics.newImage("gfx/macrframes.png")
	imgMacRF:setFilter("nearest","nearest")
	
	imgMacLF = love.graphics.newImage("gfx/maclframes.png")
	imgMacLF:setFilter("nearest","nearest")

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

	--Direction of our main character

	--0: right
	--1: left

	direction = 1
	score = 0
	worldSize = 1
	rotation = 0
	skyRotation = 0
	jumping = false
	goingDown = false
	attacking = false
	moving = false
	canquit = false
	yspeed = 1
	currentMacFrame = 0
	
	
	--City handling
	cities = {}
	citiesLife = {}
	cityCount = 0
	cityTimer = 2.5
end


function love.focus(f)
	if not f and gamestate == 1 then
		gamestate = 2
	end
end

function love.draw()

	yRef = screenmiddleheight+65+imgBackground:getHeight()/2*worldSize*0.629
	
	--Draw the sky
	love.graphics.draw( imgSky, screenmiddlewidth, screenmiddleheight+272, math.rad(skyRotation*360), 1, 1, imgSky:getWidth()/2, imgSky:getHeight()/2 )
		
	--Draw the background
	love.graphics.draw( imgBackground, screenmiddlewidth, yRef, math.rad(rotation*360), worldSize, worldSize, imgBackground:getWidth()/2, imgBackground:getHeight()/2 )
	
	
	--TODO: Draw cities
	for i,city in ipairs(cities) do
		if (citiesLife[i] == 3) then
			love.graphics.draw( imgCity, screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
		elseif (citiesLife[i] == 2) then 
			love.graphics.draw( imgCityDamaged, screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
		else
			love.graphics.draw( imgCityDestroyed, screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
		end
	end
	
	--TODO: Draw citizens
	
	
	
	--Draw mac!
	if direction == 1 then
		frameToDraw = 0
		-- Determine if moving, if true, animate
		if moving == true then
			frameToDraw = currentMacFrame
		end
		love.graphics.drawq( imgMacLF, macFrames[math.floor(frameToDraw)], screenmiddlewidth, macy, 0, 1, 1, 39, 53)
	else
		frameToDraw = 0
		-- Determine if moving, if true, animate
		if moving == true then
			frameToDraw = currentMacFrame
		end
		love.graphics.drawq( imgMacRF, macFrames[math.floor(frameToDraw)], screenmiddlewidth, macy, 0, 1, 1, 39, 53)
	end
	
	--Draw the foreground
	love.graphics.draw( imgForeground, screenmiddlewidth, yRef, math.rad(rotation*360), worldSize, worldSize, imgBackground:getWidth()/2, imgBackground:getHeight()/2 )
	
	--Draw the pause screen
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
	

	--IN-GAME/ENDGAME KEYBOARD HANDLING
    elseif gamestate == 1 or gamestate == 3  then
    
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
	
	--CREDITS KEYBOARD HANDLING
	elseif gamestate == 4 then
	
		if key == 'escape' and canquit then
			gamestate = 0
		end	
		
	end
	
	
	
end

function love.update(dt)

	
    if gamestate == 1 then
    
		--Update frame for character animation
		
		currentMacFrame = (currentMacFrame + 18*dt) % 9
		
		moving = false
		
		--Modify worldsize (for debugging)
		
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
			attacking = true
		end

		jumping = true

		-- Update Y position (jump)
		yspeed = yspeed + dt*GRAVITY
		
		newmacy = macy + yspeed*dt
		
		if newmacy > macy then
			goingDown = true
		else
			goingDown = false
		end
		
		macy = newmacy
		
		if macy > 275 and jumping and goingDown and attacking then
			townAttack()
			attacking = false
		end
		
		if macy > screenmiddleheight+15 then
			macy = screenmiddleheight+15
			yspeed = 0
			attacking = false
			jumping = false
			townClean()
		end
		
		
		-- Move to the left
		if love.keyboard.isDown("left") then
			moving = true
			direction = 1
			
			if not townCollitionLeft() then
				if rotation < 1 then
					rotation = rotation + 0.001
				else
					rotation = -1
				end
				
				if skyRotation < 1 then
					skyRotation = skyRotation + 0.0004
				else
					skyRotation = -1
				end
			end
		
		-- Move to the right
		elseif love.keyboard.isDown("right") then
			moving = true
			direction = 0
			
			
			if not townCollitionRight() then
			
				if rotation > -1 then
					rotation = rotation - 0.001
				else
					rotation = 1
				end	
				
				if skyRotation > -1 then
					skyRotation = skyRotation - 0.0004
				else
					skyRotation = 1
				end
			end
		end
		
		
		--Check if a city has to be created
		cityTimer = cityTimer - dt
		
		if cityTimer < 0 and cityCount < 5 then
			cityTimer = 5.0
			createCity()
			cityCount = cityCount + 1
		end
		
	end


end


function townCollitionRight()
 
	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) < math.rad(7)  and macy > 280 then
			return true
		end
	end
	return false
	
end

function townCollitionLeft()
 
	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) > math.rad(352.5) and (math.rad(rotation*360)+city)%math.rad(360) < math.rad(353) and macy > 280 then
			return true
		end
	end
	return false
	
end


function townClean()


	for i,city in ipairs(cities) do
			if citiesLife[i] == 0 then
				table.remove(cities,i)
				table.remove(citiesLife,i)
				cityCount = cityCount - 1
			end
		end
	end

function townAttack()

	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) > math.rad(355.5) or (math.rad(rotation*360)+city)%math.rad(360) < math.rad(4.5) then
			citiesLife[i] = citiesLife[i]-1
		end
	end
	
end

function createCity()

	--Create a random location for the city
	location = math.rad(360) * math.random(0,1000)/1000
	
	--Add to cityList
	table.insert(cities,location)

	--Add to city life list
	table.insert(citiesLife,3)

end
