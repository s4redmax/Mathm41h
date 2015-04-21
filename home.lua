local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()
local click = audio.loadSound('click_button.mp3')
local backgroundMusic = audio.loadSound ("12.mp3")
local backgroundMusicChannel = audio.play(backgroundMusic,{channel = 1, loops = -1 ,fadein= 500})

local function handleButtonEvent( event )
    if ( "ended" == event.phase ) then 
    audio.stop( backgroundMusicChannel )
    audio.play (click)
    storyboard.gotoScene("page1","slideLeft", 1000)
    end
end 
function scene:createScene( event )
    local group = self.view
    local background = display.newImage( "background.jpg" )
    _W = display.contentWidth /2 ;
	_H = display.contentHeight /2 ;
  	background.x=_W;
	background.y=_H;
	background.xScale = 2
	background.yScale = 2.1
	
	local logo = display.newImage ("logo.png")
	logo.xScale = 4
	logo.yScale = 4
	logo.x = 800
	logo.y = 400
	

  
    buttonHome = widget.newButton{
        defaultFile="start.png",
        onEvent = handleButtonEvent
        
    }
   	
	buttonHome.xScale = 4
	buttonHome.yScale = 4
	buttonHome.x = 600
	buttonHome.y = 1000
	
	local highs = display.newImage ("highscore1.png")
	highs.xScale = 3
	highs.yScale = 3
	highs.x =  400
	highs.y = 1700
	
	local square = display.newImage ("squarepoint.png")
	square.xScale = 4
	square.yScale = 3
	square.x =  970
	square.y = 1700
	
    group:insert ( background )
    group:insert ( logo )
    group:insert ( buttonHome )
    group:insert ( highs )
    group:insert ( square )

end
function scene:enterScene( event )
    local group = self.view    
end
function scene:exitScene( event )
    local group = self.view    
end
function scene:destroyScene( event )
    local group = self.view
    if buttonHome then
        buttonHome:removeSelf()
        buttonHome = nil
    end        
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene