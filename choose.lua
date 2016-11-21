-----------------------------------------------------------------------------------------
--
-- choose.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"
local widget = require( "widget" )

-- Globals
local screenW, screenH, halfW, halfH = display.actualContentWidth, display.actualContentHeight, display.contentCenterX, display.contentCenterY
local selfName = "choose"

local function onStormyBtnRelease()
	composer.gotoScene( "game", {effect = "fade", time = 200, params = {char = "stormy"}} )
	return true
end

local function onBibiBtnRelease()
	composer.gotoScene( "game", {effect = "fade", time = 200, params = {char = "bibi"}} )
	return true
end

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	physics.start()
	physics.pause()


	local background = display.newImage( "Assets/menus/background.png")
	background1.x = halfW
	background1.y = halfH
	background1.xScale = screenW / background1.contentWidth
	background1.yScale = screenH / background1.contentHeight
	sceneGroup:insert( background1 )

	local chooseLogo = display.newImageRect( "Assets/menus/chooseText.png", 264, 42 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 100
	
	stormyBtn = widget.newButton{
		defaultFile="Assets/menus/stormyButton.png",
		overFile="Assets/menus/stormyButton-over.png",
		width=154, height=40,
		onRelease = onStormyBtnRelease
	}
	stormyBtn.x = display.contentCenterX
	stormyBtn.y = display.contentHeight - 250

	bibiBtn = widget.newButton{
		defaultFile="Assets/menus/bibiButton.png",
		overFile="Assets/menus/bibiButton-over.png",
		width=154, height=40,
		onRelease = onBibiBtnRelease
	}
	bibiBtn.x = display.contentCenterX
	bibiBtn.y = display.contentHeight - 150

end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		physics.start()
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene