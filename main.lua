
	----------------------------------
	----------------------------------
	--		Destroy all Humans		--
	--	 A game by Sergio Morales   --
	--		    (Fireblend)         --
	--	   A Ludum Dare 23 Entry	--
	----------------------------------
	----------------------------------

	--		  April 22, 2012		--

WIDTH = 300
HEIGHT = 200
SCALE = 3

bgcolor = {240,240,255,255}

highscore = {25000,20000,15000}

JUMP_POWER = -500
GRAVITY = 1000

use_music = true

menuSelection = 0
menuFrame = 0

--State of the game:

-- 0: menu
-- 1: ingame
-- 2: pause?
-- 3: endgame
-- 4: credits

gamestate = 0

--load assets and initialize values

macFrames = {}
macFrames[0] = love.graphics.newQuad(0,0,78,106,719,537)
macFrames[1] = love.graphics.newQuad(81,0,78,106,719,537)
macFrames[2] = love.graphics.newQuad(161,0,78,106,719,537)
macFrames[3] = love.graphics.newQuad(241,0,78,106,719,537)
macFrames[4] = love.graphics.newQuad(321,0,78,106,719,537)
macFrames[5] = love.graphics.newQuad(401,0,78,106,719,537)
macFrames[6] = love.graphics.newQuad(481,0,78,106,719,537)
macFrames[7] = love.graphics.newQuad(561,0,78,106,719,537)
macFrames[8] = love.graphics.newQuad(641,0,78,106,719,537)

macFrames[9] = love.graphics.newQuad(0,108,78,106,719,537)
macFrames[10] = love.graphics.newQuad(81,108,78,106,719,537)
macFrames[11] = love.graphics.newQuad(161,108,78,106,719,537)
macFrames[12] = love.graphics.newQuad(241,108,78,106,719,537)
macFrames[13] = love.graphics.newQuad(321,108,78,106,719,537)
macFrames[14] = love.graphics.newQuad(401,108,78,106,719,537)
macFrames[15] = love.graphics.newQuad(481,108,78,106,719,537)
macFrames[16] = love.graphics.newQuad(561,108,78,106,719,537)
macFrames[17] = love.graphics.newQuad(641,108,78,106,719,537)

macFrames[18] = love.graphics.newQuad(0,216,78,106,719,537)
macFrames[19] = love.graphics.newQuad(81,216,78,106,719,537)
macFrames[20] = love.graphics.newQuad(161,216,78,106,719,537)
macFrames[21] = love.graphics.newQuad(241,216,78,106,719,537)
macFrames[22] = love.graphics.newQuad(321,216,78,106,719,537)
macFrames[23] = love.graphics.newQuad(401,216,78,106,719,537)
macFrames[24] = love.graphics.newQuad(481,216,78,106,719,537)
macFrames[25] = love.graphics.newQuad(561,216,78,106,719,537)
macFrames[26] = love.graphics.newQuad(641,216,78,106,719,537)

macFrames[27] = love.graphics.newQuad(0,324,78,106,719,537)
macFrames[28] = love.graphics.newQuad(81,324,78,106,719,537)
macFrames[29] = love.graphics.newQuad(161,324,78,106,719,537)
macFrames[30] = love.graphics.newQuad(241,324,78,106,719,537)
macFrames[31] = love.graphics.newQuad(321,324,78,106,719,537)
macFrames[32] = love.graphics.newQuad(401,324,78,106,719,537)
macFrames[33] = love.graphics.newQuad(481,324,78,106,719,537)
macFrames[34] = love.graphics.newQuad(561,324,78,106,719,537)
macFrames[35] = love.graphics.newQuad(641,324,78,106,719,537)

macFrames[37] = love.graphics.newQuad(0,432,78,106,719,537)
macFrames[36] = love.graphics.newQuad(81,432,78,106,719,537)
macFrames[38] = love.graphics.newQuad(161,432,78,106,719,537)
macFrames[39] = love.graphics.newQuad(241,432,78,106,719,537)
macFrames[40] = love.graphics.newQuad(321,432,78,106,719,537)
macFrames[41] = love.graphics.newQuad(401,432,78,106,719,537)
macFrames[42] = love.graphics.newQuad(481,432,78,106,719,537)
macFrames[43] = love.graphics.newQuad(561,432,78,106,719,537)
macFrames[44] = love.graphics.newQuad(641,432,78,106,719,537)

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

	loadResources()
	loadHighscore()
	
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

	imgSkyGauge = love.graphics.newImage("gfx/skyFiller.png")
	imgSkyGauge:setFilter("nearest","nearest")
	
	imgBullet = love.graphics.newImage("gfx/bullet.png")
	imgBullet:setFilter("nearest","nearest")
	
	imgTitleScreen = love.graphics.newImage("gfx/titleScreen.png")
	imgTitleScreen:setFilter("nearest","nearest")
	
	imgzs1 = love.graphics.newImage("gfx/zs1.png")
	imgzs1:setFilter("nearest","nearest")
	
	imgzs2 = love.graphics.newImage("gfx/zs2.png")
	imgzs2:setFilter("nearest","nearest")
	
	imgSelector = love.graphics.newImage("gfx/selector.png")
	imgSelector:setFilter("nearest","nearest")
	
	imgDream = love.graphics.newImage("gfx/hsDream.png")
	imgDream:setFilter("nearest","nearest")
	
	imgDreamInstructions = love.graphics.newImage("gfx/instructionsDream.png")
	imgDreamInstructions:setFilter("nearest","nearest")
	
	imgEnd = love.graphics.newImage("gfx/endSpace.png")
	imgEnd:setFilter("nearest","nearest")
	
	imgThanks1 = love.graphics.newImage("gfx/thanksScreen1.png")
	imgThanks1:setFilter("nearest","nearest")
	imgThanks2 = love.graphics.newImage("gfx/thanksScreen2.png")
	imgThanks2:setFilter("nearest","nearest")
	imgThanks3 = love.graphics.newImage("gfx/thanksScreen3.png")
	imgThanks3:setFilter("nearest","nearest")
	imgThanks4 = love.graphics.newImage("gfx/thanksScreen4.png")
	imgThanks4:setFilter("nearest","nearest")
	imgThanks5 = love.graphics.newImage("gfx/thanksScreen5.png")
	imgThanks5:setFilter("nearest","nearest")
	
	-- Load sound effects
	auJump = love.audio.newSource("sfx/jump.wav","static")
	auAttack = love.audio.newSource("sfx/attack.wav","static")
	auDestroy = love.audio.newSource("sfx/destroy.wav","static")
	auShot = love.audio.newSource("sfx/shot.wav","static")
	auHurt = love.audio.newSource("sfx/hurt.wav","static")
	auEat = love.audio.newSource("sfx/eat.wav","static")
	auSelect = love.audio.newSource("sfx/select.wav","static")
	auSelect:setVolume(0.3)
	
	if use_music == true then
		auBGM = love.audio.newSource("sfx/bu-ninjas.ogg","stream")
		auBGM:setLooping(true)
		auBGM:setVolume(0.8)
		auBGM:play()
	end

	font = love.graphics.newFont( "gfx/PressStart2P.ttf", 23 )
	fontHS = love.graphics.newFont( "gfx/PressStart2P.ttf", 16 )
	love.graphics.setFont( font )

end

function loadHighscore()

	if not love.filesystem.exists("highscores") then
		love.filesystem.newFile( "highscores" )
		saveHighscore()
	end
	 
	local data = love.filesystem.read("highscores")
	
    local sep, fields = ",", {}
       
    local pattern = string.format("([^%s]+)", sep)
       
    data:gsub(pattern, function(c) fields[#fields+1] = c end)
        
    highscore = fields
end

function saveHighscore()
	data = table.concat(highscore, ",")
	love.filesystem.write("highscores",data)
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
	
	--Bullets handling
	bullets = {}
	bulletsLife = {}
	bulletsDirection = {}
	
	humanDeaths = 0
	endGame = false
	endGame2 = false
	endGame3 = false
	
	starttime = os.time()
	newtime = 0
	
	damageFrame = 0
	jumps = 3
	macRotation = 0
	macyEnd = 0
	
	showThanks1 = false
	showThanks2 = false
	showThanks3 = false
	showThanks4 = false
	showThanks5 = false
	endFrames = 0
end

function love.focus(f)
	if not f and gamestate == 1 then
		gamestate = 2
	end
end

function love.draw()
	if gamestate == 0 then
	
		--Draw titlescreen
		love.graphics.draw( imgTitleScreen, 0, 0 )
		
		--Draw Zs
		if menuFrame < 40 then 
			love.graphics.draw(imgzs1, 500, 126)
		else
			love.graphics.draw(imgzs2, 500, 126)
		end
		
		--Draw highscores
		if menuSelection == 1 then
			love.graphics.setFont( fontHS )
			r, g, b, a = love.graphics.getColor( )
			
			love.graphics.draw(imgDream, 145, 200 , 0, 1, 1, imgSelector:getWidth()/2, imgSelector:getHeight()/2)
		
			--WRITE HIGHSCORES
			love.graphics.setColor( 0, 0, 0, 255 )
			
			love.graphics.print(highscore[1], 240, 355)
			love.graphics.print(highscore[2], 240, 385)
			love.graphics.print(highscore[3], 240, 414)
			
			love.graphics.setColor( r, g, b, a )
		end
		love.graphics.setFont( font )
		
		--Draw instructions
		if menuSelection == 2 then
			love.graphics.draw(imgDreamInstructions, 145, 200 , 0, 1, 1, imgSelector:getWidth()/2, imgSelector:getHeight()/2)
		end
		love.graphics.setFont( font )
		
		--Draw Selector thingy
		
		if menuSelection == 0 then
			love.graphics.draw(imgSelector, 540, 255 ,0,1,1,imgSelector:getWidth()/2, imgSelector:getHeight()/2)
		elseif menuSelection == 1 then
			love.graphics.draw(imgSelector, 540, 315 ,0,1,1,imgSelector:getWidth()/2, imgSelector:getHeight()/2)
		elseif menuSelection == 2 then
			love.graphics.draw(imgSelector, 540, 375 ,0,1,1,imgSelector:getWidth()/2, imgSelector:getHeight()/2)
		else
			love.graphics.draw(imgSelector, 540, 435 ,0,1,1,imgSelector:getWidth()/2, imgSelector:getHeight()/2)
		end
		
	elseif gamestate == 1 or gamestate == 2 or gamestate == 3 and not endGame3 then 
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
			if endGame2 then
				love.graphics.drawq( imgMacLF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macyEnd, macRotation, 1, 1, 39, 53)
			else
				love.graphics.drawq( imgMacLF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macy, macRotation, 1, 1, 39, 53)
			end
		else
			frameToDraw = 0
			-- Determine if moving, if true, animate
			if moving == true then
				frameToDraw = currentMacFrame
			end
			if endGame2 then
				love.graphics.drawq( imgMacRF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macyEnd, macRotation, 1, 1, 39, 53)
			else
				love.graphics.drawq( imgMacRF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macy, macRotation, 1, 1, 39, 53)
			end
		end
		
		--Draw bullets :D
		for i,bullet in ipairs(bullets) do
			love.graphics.draw( imgBullet, screenmiddlewidth, yRef-20, math.rad(rotation*360)+bullet, 1, 1, 15, 43 + yRef-screenmiddleheight-65)		
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
		
		--Draw the score
		love.graphics.print("Score: ", 20,20)
		love.graphics.print(score, 165,20)
		
		love.graphics.print("Time: ", 20, 60)
		
		if not endGame then
			newtime = os.time()-starttime
		end
		love.graphics.print(newtime,140,60)
	else
		
		yRef = screenmiddleheight+65+imgBackground:getHeight()/2*worldSize*0.629
		
		--Draw the sky
		love.graphics.draw( imgEnd, 0, 0 )
		
		--Draw mac!
		if direction == 1 then
			frameToDraw = 0
			-- Determine if moving, if true, animate
			if moving == true then
				frameToDraw = currentMacFrame
			end
			if endGame2 then
				love.graphics.drawq( imgMacLF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macyEnd, macRotation, 1, 1, 39, 53)
			else
				love.graphics.drawq( imgMacLF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macy, macRotation, 1, 1, 39, 53)
			end
		else
			frameToDraw = 0
			-- Determine if moving, if true, animate
			if moving == true then
				frameToDraw = currentMacFrame
			end
			if endGame2 then
				love.graphics.drawq( imgMacRF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macyEnd, macRotation, 1, 1, 39, 53)
			else
				love.graphics.drawq( imgMacRF, macFrames[math.floor(frameToDraw+8*damageFrame/6)], screenmiddlewidth, macy, macRotation, 1, 1, 39, 53)
			end
		end
		if showThanks1 then
			love.graphics.draw( imgThanks1, 0, 0 )
		end
		if showThanks2 then
			love.graphics.draw( imgThanks2, 36, 204 )
		end
		if showThanks3 then
			love.graphics.draw( imgThanks3, 137, 273 )
		end
		if showThanks4 then
			love.graphics.draw( imgThanks4, 87, 330 )
		end
		if showThanks5 then
			love.graphics.draw( imgThanks5, 551, 560 )
		end
	end
end

function menuDown()

	if menuSelection < 3 then
		menuSelection = menuSelection +1
		auSelect:stop() auSelect:play()
	end

end

function menuUp()
	if menuSelection > 0 then
		menuSelection = menuSelection -1
		auSelect:stop() auSelect:play()
	end
end

function menuEnter()
	if menuSelection == 0 then
		restart()
		gamestate = 1
		auBGM:stop() auBGM:play()
	elseif menuSelection == 3 then
		love.event.push("quit")
	end
end

function love.keypressed(key,unicode)
	
	if endGame3 and showThanks5 then
		if key == 'q' then
			restart()
			gamestate = 0
			auBGM:stop() auBGM:play()
		end	

	--MAIN MENU KEYBOARD HANDLING
    elseif gamestate == 0 then
    
		if key == 'down' then
			menuDown()
		elseif key == 'up' then
			menuUp()
		elseif key == 'return' then
			menuEnter()
		elseif key == 'escape' then
			love.event.push("quit")
		end	
	
	--IN-GAME/ENDGAME KEYBOARD HANDLING
    elseif gamestate == 1 or gamestate == 3  then
    
		if key == 'p' then
			gamestate = 2
		elseif key == 'escape' then
			gamestate = 2
		end	
	
	--PAUSE KEYBOARD HANDLING
	elseif gamestate == 2 then
	
		if key == 'p' then
			gamestate = 1
		elseif key == 'q' then
			restart()
			gamestate = 0
			auBGM:stop() auBGM:play()
		end	
	
	--CREDITS KEYBOARD HANDLING
	elseif gamestate == 4 then
		if key == 'escape' and canquit then
			gamestate = 0
		end	
	end
end

function love.update(dt)
	if not endGame3 then
		if gamestate == 0  then
		
			if menuFrame == 80 then
				menuFrame = 0
			else
				menuFrame = menuFrame+1
			end

		elseif gamestate == 1 or gamestate == 3 then
		
			--Update frame for character animation
			
			currentMacFrame = (currentMacFrame + 18*dt) % 9
			
			currentHumanFrame = (currentHumanFrame + 25*dt) % 6
			
			if damageFrame > 0 then
				damageFrame = damageFrame - 1
			end
			
			moving = false
			
			--Modify worldsize (for debugging)
			if gamestate == 1 then
				
				--Jumping logic
				if love.keyboard.isDown(" ") and jumping == false then
					auJump:stop() auJump:play()
					yspeed = JUMP_POWER
					jumping = true
					attacking = true
				end
			end 
			
			if endGame then
				
				if jumps > 0 then
					if jumping == false then
						auJump:stop() auJump:play()
						yspeed = JUMP_POWER
						jumping = true
						attacking = true
					end
				else
					if(macyEnd < 700) then
						endGame2 = true
						macRotation = macRotation+0.02
						macyEnd = macyEnd + 15
					else
						macy = 0
						macRotation = 0.02
						endGame3 = true
						endGame2 = false
						endGame = false
						
					end
				end
				
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
				
				if endGame then
					jumps = jumps - 1
				end
				
				attacking = false
				jumping = false
				townClean()
			end
			
			if not endGame2 then
				macyEnd = macy
			end
			
			if gamestate == 1 then
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
							skyRotation = skyRotation + 0.00013
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
							skyRotation = skyRotation - 0.00013
						else
							skyRotation = 1
						end
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
			
			--update bullets
			updateBullets()
			
			--Check for endgame condition
			if worldSize < 0.13 then
				
				initEndGame()
				if not endGame then
					calculateAndHandleScore()
					endGame = true
					gamestate = 3
				end
			end
			
			if endGame3 then
				auBGM:play()
			end
		end
	else
		macRotation = macRotation+0.02
		macy = macy + 0.5
		if macy > 650 then
			macy = -50
		end
		
		if endFrames > 650 then
			showThanks5 = true
		elseif endFrames > 500 then
			showThanks4 = true
		elseif endFrames > 400 then
			showThanks3 = true
		elseif endFrames > 300 then
			showThanks2 = true
		elseif endFrames > 200 then
			showThanks1 = true
		end
		
		if not showThanks5 then
			endFrames = endFrames + 1
		end
	end	
end

function calculateAndHandleScore()

	bonus = 0
	
	if(newtime < 180) then
		bonus = ( (180-newtime)/180*10000 )
	end
	
	score = math.floor(bonus + score)
	
	if(score > tonumber(highscore[1])) then
		highscore[3] = highscore[2]
		highscore[2] = highscore[1]
		highscore[1] = tostring(score)
		
	elseif(score > tonumber(highscore[2])) then
		highscore[3] = highscore[2]
		highscore[2] = tostring(score)
	
	elseif(score > tonumber(highscore[3])) then
		highscore[3] = tostring(score)
	end
	
	saveHighscore()
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
	
	for i,bullet in ipairs(bullets) do
		table.remove(bulletsLife, i)
		table.remove(bullets, i)
		table.remove(bulletsDirection, i )
	end
			
	auBGM:stop()
	
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
		if citiesLife[i] <= 0 then
		
		--Create humans!
			for d = 0, 15, 1 do
				if humanCount < 120 then
					createHuman(cities[i])
					humanCount = humanCount + 1
				end	
			end
			
			--Erase city
			destroyCity(city)
			score = score + 100
			table.remove(cities,i)
			table.remove(citiesLife,i)
			table.remove(citiesFrames,i)
			cityCount = cityCount - 1
			auDestroy:stop() auDestroy:play()
		end
	end
end

function fireBullet(location, right)

	table.insert(bulletsLife, 0)
	if right then
		table.insert(bullets, location + math.rad(2) )
	else
		table.insert(bullets, location + math.rad(-2) )
	end
	
	table.insert(bulletsDirection, right )
	auShot:stop() auShot:play()

end

function updateBullets()

	
	for i,bullet in ipairs(bullets) do
	
		speed = -0.5 -- 1*(1-worldSize)

		if bulletsDirection[i] then	
			speed = 0.5 --+ 1*(1-worldSize)
		end
	
		bullets[i] = bullets[i] + math.rad(speed)
		bulletsLife[i] = bulletsLife[i] + 1
		
		ang =( math.rad(rotation*360)+math.abs(bullets[i]) ) % math.rad(360)
		
		if( ( ang < math.rad(1.4) or math.rad(358.6)-ang < math.rad(1.4) ) and macy > 265 and bulletsLife[i] > 15) then
			
			table.remove(bulletsLife, i)
			table.remove(bullets, i)
			table.remove(bulletsDirection, i )
			
			if score > 0 then
				score = score -25
			end
			
			damageFrame = 24
			
			if 1 - worldSize < 0.045*(worldSize) then
				worldSize = 1
			else
				worldSize = worldSize + 0.045*(worldSize)
			end
			
			auHurt:stop() auHurt:play()
			
		elseif bulletsLife[i] > 190 then
		
			table.remove(bulletsLife, i)
			table.remove(bullets, i)
			table.remove(bulletsDirection, i )
		end
	end

end

--Check if a town is being attacked
function townAttack()

	for i,city in ipairs(cities) do
		if (math.rad(rotation*360)+city)%math.rad(360) > math.rad(355.5) or (math.rad(rotation*360)+city)%math.rad(360) < math.rad(4.5) then
			citiesLife[i] = citiesLife[i]-1
			score = score + 200
			auAttack:stop() auAttack:play()
		end
	end
	
end

function updateCities()
	
	for i,frame in ipairs(citiesFrames) do
		if citiesFrames[i] < 16 then
			citiesFrames[i] = frame+1
		else
			ang =( math.rad(rotation*360)+math.abs(cities[i]) ) % math.rad(360)
			
			if (ang < math.rad(30) or math.rad(359)-ang < math.rad(30)) and citiesFrames[i] > 15 then
				rand = math.random(0,140) 
				
				if(rand <= 1) then
					if(ang < math.rad(30)) then
						fireBullet(cities[i], false)
					else
						fireBullet(cities[i], true)
					end
				end
			end
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
		
		if( (ang < math.rad(1) or math.rad(359)-ang < math.rad(1)) and not jumping) then
			death(humans[i])
			score = score + 50
			
			table.remove(humans, i)
			table.remove(humanSpeeds, i)
			table.remove(humanColors, i)
			humanCount = humanCount -1
			auEat:stop() auEat:play()
			worldSize = worldSize - 0.01*(worldSize)
		end
	end

end
