

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

humanFrames = {}

humanFrames[0] = love.graphics.newQuad(0,0,30,43,183,174)
humanFrames[1] = love.graphics.newQuad(30,0,31,43,183,174)
humanFrames[2] = love.graphics.newQuad(61,0,31,43,183,174)
humanFrames[3] = love.graphics.newQuad(91,0,31,43,183,174)
humanFrames[4] = love.graphics.newQuad(122,0,31,43,183,174)
humanFrames[5] = love.graphics.newQuad(152,0,31,43,183,174)

humanFrames[6] = love.graphics.newQuad(0,43,30,43,183,174)
humanFrames[7] = love.graphics.newQuad(30,43,31,43,183,174)
humanFrames[8] = love.graphics.newQuad(61,43,31,43,183,174)
humanFrames[9] = love.graphics.newQuad(91,43,31,43,183,174)
humanFrames[10] = love.graphics.newQuad(122,43,31,43,183,174)
humanFrames[11] = love.graphics.newQuad(152,43,31,43,183,174)

humanFrames[12] = love.graphics.newQuad(0,87,30,43,183,174)
humanFrames[13] = love.graphics.newQuad(30,87,31,43,183,174)
humanFrames[14] = love.graphics.newQuad(61,87,31,43,183,174)
humanFrames[15] = love.graphics.newQuad(91,87,31,43,183,174)
humanFrames[16] = love.graphics.newQuad(122,87,31,43,183,174)
humanFrames[17] = love.graphics.newQuad(152,87,31,43,183,174)

humanFrames[18] = love.graphics.newQuad(0,131,30,43,183,174)
humanFrames[19] = love.graphics.newQuad(30,131,31,43,183,174)
humanFrames[20] = love.graphics.newQuad(61,131,31,43,183,174)
humanFrames[21] = love.graphics.newQuad(91,131,31,43,183,174)
humanFrames[22] = love.graphics.newQuad(122,131,31,43,183,174)
humanFrames[23] = love.graphics.newQuad(152,131,31,43,183,174)

ghostFrames = {}

ghostFrames[0] = love.graphics.newQuad(0,0,14,26,55,26)
ghostFrames[1] = love.graphics.newQuad(13,0,15,26,55,26)
ghostFrames[2] = love.graphics.newQuad(27,0,15,26,55,26)
ghostFrames[3] = love.graphics.newQuad(41,0,14,26,55,26)

cityCreateFrames = {}

cityCreateFrames[0] = love.graphics.newQuad(0,0,97,91,493,91)
cityCreateFrames[1] = love.graphics.newQuad(99,0,97,91,493,91)
cityCreateFrames[2] = love.graphics.newQuad(198,0,97,91,493,91)
cityCreateFrames[3] = love.graphics.newQuad(297,0,97,91,493,91)
cityCreateFrames[4] = love.graphics.newQuad(396,0,97,91,493,91)

cityDestroyFrames = {}

cityDestroyFrames[4] = love.graphics.newQuad(0,0,97,91,493,91)
cityDestroyFrames[3] = love.graphics.newQuad(99,0,97,91,493,91)
cityDestroyFrames[2] = love.graphics.newQuad(198,0,97,91,493,91)
cityDestroyFrames[1] = love.graphics.newQuad(297,0,97,91,493,91)
cityDestroyFrames[0] = love.graphics.newQuad(396,0,97,91,493,91)

function love.load()

	love.graphics.setBackgroundColor(bgcolor)

	loadHighscore()
	loadResources()
	
	math.randomseed( os.time() )
	
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
	
	imgPauseScreen = love.graphics.newImage("gfx/PauseScreen.png")
	imgPauseScreen:setFilter("nearest","nearest")
	
	imgHumans = love.graphics.newImage("gfx/humanframes.png")
	imgHumans:setFilter("nearest","nearest")

	imgGhosts = love.graphics.newImage("gfx/ghostframes.png")
	imgGhosts:setFilter("nearest","nearest")

	imgCityCreate = love.graphics.newImage("gfx/citycreateframes.png")
	imgCityCreate:setFilter("nearest","nearest")
	
	imgCityDestroy = love.graphics.newImage("gfx/citydestroyframes.png")
	imgCityDestroy:setFilter("nearest","nearest")

	imgSkyGauge = love.graphics.newImage("gfx/skyfiller.png")
	imgSkyGauge:setFilter("nearest","nearest")
	
	-- Load sound effects
	auJump = love.audio.newSource("sfx/jump.wav","static")
	auAttack = love.audio.newSource("sfx/attack.wav","static")
	auDestroy = love.audio.newSource("sfx/destroy.wav","static")
	auEat = love.audio.newSource("sfx/eat.wav","static")
	
	if use_music == true then
		auBGM = love.audio.newSource("sfx/bu-ninjas.wav","stream")
		auBGM:setLooping(true)
		auBGM:setVolume(0.8)
		auBGM:play()
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
	currentHumanFrame = 0
	
	--City handling
	cities = {}
	citiesLife = {}
	citiesFrames = {}
	cityCount = 0
	cityTimer = 2.5
	
	--Humans handling
	humans = {}
	humanSpeeds = {}
	humanColors = {}
	humanCount = 0
	
	--Ghosts handling
	ghosts = {}
	ghostHeights = {}
	
	--Cities destruction handling
	dcities = {}
	dcitiesFrames = {}
	
	humanDeaths = 0
	
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
		
	--Draw the sky gauge
	
	y = 163+190 -  ( (1/0.87*(1-worldSize) )    *190)
	
	gaugeQuad = love.graphics.newQuad(0 ,y ,1457, 1457-y ,1457 ,1457)
	love.graphics.drawq( imgSkyGauge, gaugeQuad,  screenmiddlewidth, screenmiddleheight+272, math.rad(skyRotation*360), 1, 1, imgSky:getWidth()/2, imgSky:getHeight()/2-y )
		
	--Draw the background
	love.graphics.draw( imgBackground, screenmiddlewidth, yRef, math.rad(rotation*360), worldSize, worldSize, imgBackground:getWidth()/2, imgBackground:getHeight()/2 )
	
	--Draw destroyed cities
	for i,dcity in ipairs(dcities) do
		love.graphics.drawq( imgCityDestroy, cityDestroyFrames[math.floor(dcitiesFrames[i]/5)], screenmiddlewidth, yRef, math.rad(rotation*360)+dcity, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
	end
	
	--Draw cities
	for i,city in ipairs(cities) do
		if (citiesLife[i] == 3) then
			if(citiesFrames[i] < 15) then
				love.graphics.drawq( imgCityCreate, cityCreateFrames[math.floor(citiesFrames[i]/5)], screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
			else
				love.graphics.draw( imgCity, screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
			end
		elseif (citiesLife[i] == 2) then 
			love.graphics.draw( imgCityDamaged, screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
		else
			love.graphics.draw( imgCityDestroyed, screenmiddlewidth, yRef, math.rad(rotation*360)+city, 1, 1, imgCity:getWidth()/2, imgCity:getHeight() + yRef-screenmiddleheight-70)
		end
	end
	
	
	--Draw humans :D
	for i,human in ipairs(humans) do
		love.graphics.drawq( imgHumans, humanFrames[math.floor(currentHumanFrame)+6*humanColors[i]], screenmiddlewidth, yRef, math.rad(rotation*360)+human, 1, 1, 15, 43 + yRef-screenmiddleheight-65)		
	end
	
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
	
	
	
	--Draw the ghosts
	for i,ghost in ipairs(ghosts) do
		love.graphics.drawq( imgGhosts, ghostFrames[math.floor(ghostHeights[i]/6)], screenmiddlewidth, yRef+7-ghostHeights[i], math.rad(rotation*360)+ghost, 1, 1, 15, 43 + yRef-screenmiddleheight-65)		
	end
	

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
		
		currentHumanFrame = (currentHumanFrame + 25*dt) % 6
		
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
			auJump:stop() auJump:play()
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
					skyRotation = skyRotation + 0.0002
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
		
		if worldSize > 0.25 then
			citiesToBuild = 5
		elseif worldSize > 0.14 then	
			citiesToBuild = 3
		elseif worldSize > 0.13 then	
			citiesToBuild = 1
		else 
			citiesToBuild = 0
		end
		
		if cityTimer < 0 then 
			cityTimer = 5.0
			if cityCount < citiesToBuild then
				createCity()
				cityCount = cityCount + 1
			end
		end
		
		--update human's locations
		updateHumans()
		
		--update human's locations
		updateGhosts()
	
		--update human's locations
		updateDCities()

		--update cities
		updateCities()
		
		--Check for endgame condition
		if worldSize < 0.13 then
			initEndGame()
		end
		
	end


end

function initEndGame()
	
	for i,human in ipairs(humans) do
		death(human)
		table.remove(humans, i)
		table.remove(humanSpeeds, i)
		table.remove(humanColors, i)
		humanCount = humanCount -1
		auEat:stop() auEat:play()
	end
		
	for i,city in ipairs(cities) do
		--Erase city
		destroyCity(city)
		table.remove(cities,i)
		table.remove(citiesLife,i)
		table.remove(citiesFrames,i)
		cityCount = cityCount - 1
		auDestroy:stop() auDestroy:play()
	end
	
end


--Check for collisions when walking to the right
function townCollitionRight()
 
	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) < math.rad(7)  and macy > 280 then
			return true
		end
	end
	return false
	
end

--Check for collisions when walking to the left
function townCollitionLeft()
 
	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) > math.rad(352.5) and (math.rad(rotation*360)+city)%math.rad(360) < math.rad(353) and macy > 280 then
			return true
		end
	end
	return false
	
end

--Clean up destroyed towns
function townClean()
	for i,city in ipairs(cities) do
		if citiesLife[i] == 0 then
		
		--Create humans!
			for d = 0, 15, 1 do
				if humanCount < 120 then
					createHuman(cities[i])
					humanCount = humanCount + 1
				end	
			end
			
			--Erase city
			destroyCity(city)
			table.remove(cities,i)
			table.remove(citiesLife,i)
			table.remove(citiesFrames,i)
			cityCount = cityCount - 1
			auDestroy:stop() auDestroy:play()
		end
	end
end

--Check if a town is being attacked
function townAttack()

	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) > math.rad(355.5) or (math.rad(rotation*360)+city)%math.rad(360) < math.rad(4.5) then
			citiesLife[i] = citiesLife[i]-1
			auAttack:stop() auAttack:play()
		end
	end
	
end

function updateCities()
	
	for i,frame in ipairs(citiesFrames) do
		if citiesFrames[i] < 16 then
			citiesFrames[i] = frame+1
		end
	end
	
end

function destroyCity(city)

	table.insert(dcities, city)
	table.insert(dcitiesFrames, 0)

end 

function updateDCities()
	for i,frame in ipairs(dcitiesFrames) do
		if dcitiesFrames[i] < 16 then
			dcitiesFrames[i] = frame+1
		else
			table.remove(dcities, i)
			table.remove(dcitiesFrames, i)
		end
	end
end

--Create a new city
function createCity()
	--Create a random location for the city
	location = math.rad(360) * math.random(0,1000)/1000
	
	--Add to cityList
	table.insert(cities,location)

	--Add to city life list
	table.insert(citiesLife,3)

	--Add to frameslist
	table.insert(citiesFrames,0)
end

--Create a puny human running for its life
function createHuman(location)
	speed = math.random(-100,100)/200
	
	table.insert(humanSpeeds,speed)
	
	if(speed > 0) then
		table.insert(humans,location+math.rad(3.2))
	else
		table.insert(humans,location-math.rad(3.2))
	end
	
	table.insert(humanColors,math.random(0,3))
end

--Start Ghost Animation at location
function death(location)
	
	table.insert(ghosts,location)
	table.insert(ghostHeights,0)
	
end

--Continue or finish Ghost Animation at location
function updateGhosts()
	
	for i,ghost in ipairs(ghosts) do
		ghostHeights[i] = ghostHeights[i] + 1
		if ghostHeights[i] > 23 then
			table.remove(ghosts, i)
			table.remove(ghostHeights, i)
		end
	end
	
end

--update human's locations
function updateHumans()

	for i,human in ipairs(humans) do

		humans[i] = (humans[i]+(humanSpeeds[i]*(2-worldSize))*math.rad(0.6)) % math.rad(360)
	
		ang =( math.rad(rotation*360)+math.abs(humans[i]) ) % math.rad(360)
		
		if( ang < math.rad(1) and math.rad(359)-ang > math.rad(358) and not jumping) then
			death(humans[i])
			
			table.remove(humans, i)
			table.remove(humanSpeeds, i)
			table.remove(humanColors, i)
			humanCount = humanCount -1
			auEat:stop() auEat:play()
			worldSize = worldSize - 0.01*(worldSize)
		end
	end

end
