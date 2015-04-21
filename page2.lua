local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()
local clicktrue = audio.loadSound('true.wav')
local clickfalse = audio.loadSound('false.wav')



local tmr = 60
local timeLeft
local myTimer 

function scene:createScene( event )
    local group = self.view
    ------bg-----
     local background = display.newImage( "back2.jpg" )
    _W = display.contentWidth /2 ;
	_H = display.contentHeight /2 ;
  	background.x=_W;
	background.y=_H;
	background.xScale = 4
	background.yScale = 6
	---------
	local timetext = display.newText("Time: " ,180,100,"Arial",100)
    timetext:setTextColor(64,64,64)

    timeleft = display.newText(tmr,350,100,"Impact",100)
    timeleft:setTextColor(64,64,64)
    
    local function timesupScene()   
        storyboard.gotoScene("restart", "fade", 1000)
    end

    
	local function countTimer()

        tmr = tmr - 1
        

        if tmr == 0 then
            timesupScene()
        end
        if tmr < 0 then
            tmr = 60
        end
        timeleft.text = tmr
    end

    myTimer= timer.performWithDelay(1000,countTimer,60)
	

    
----- goto ture---    
local function nextpage()
        storyboard.gotoScene( "page3", "crossFade", 1000 )    
    return true
end
local function handleButtonEvent( event )
    if ( "ended" == event.phase ) then 
    audio.play(clicktrue)
    plusScore()
    storyboard.gotoScene("page3")
    end
end 
----- goto false---    
local function wrong()
        storyboard.gotoScene( "restart", "crossFade", 1000 )    
    return true
end
local function handleButtonEvent1( event )
    if ( "ended" == event.phase ) then 
    audio.play(clickfalse)
    minusScore()
    storyboard.gotoScene("restart")
    end
end 
-----   pic up 4
local b1 = widget.newButton
{
    width = 600,
    height = 600,
	x = 350, 
	y = 400,
    defaultFile = "6.png",
}

local b2 = widget.newButton
{
    width = 500,
    height = 800,
	x = 600, 
	y = 350,
    defaultFile = "plus.png",
}

local b3 = widget.newButton
{
    width = 600,
    height = 600,
	x = 950, 
	y = 400,
    defaultFile = "3.png",
}

local b4 = widget.newButton
{
    width = 400,
    height = 800,
	x = 400, 
	y = 700,
    defaultFile = "equals.png",
} 	

local b5 = widget.newButton
{
    width = 600,
    height = 750,
	x = 900, 
	y = 800,
    defaultFile = "square.png",
}

-- choose---
 	 	
local button1 = widget.newButton
{	
	width = 200,
    height = 200,
	x = 300, 
	y = 1500,
    defaultFile = "ans3.png",
    overFile = "false.png",
    onEvent = handleButtonEvent1
}
	button1.xScale = 5
	button1.yScale = 1.2
	button1.x = 600 
	button1.y = 1100
	
local button2 = widget.newButton
{
	width = 200,
    height = 200,
	x = 300, 
	y = 1500,
    defaultFile = "ans9.png",
    overFile = "true.png",
    onEvent = handleButtonEvent
}

 	button2.xScale = 5
	button2.yScale = 1.2
	button2.x = 600 
	button2.y = 1400

local button3 = widget.newButton
{
    width = 200,
    height = 200,
	x = 300, 
	y = 1500,
    defaultFile = "ans11.png",
    overFile = "false.png",
    onEvent = handleButtonEvent1
}
	button3.xScale = 5
	button3.yScale = 1.2
	button3.x = 600 
	button3.y = 1700
	

	group:insert( background )
    group:insert( timetext )
    group:insert( timeleft )
 	group:insert( b1 )
 	group:insert( b2 )
 	group:insert( b3 )
 	group:insert( b4 )
 	group:insert( b5 )
    group:insert( button1 )
    group:insert( button2 )
    group:insert( button3 )
    
---- point----
local score = 0
local scoreTxt = display.newText( "0", 0, 0, "Helvetica", 100 ) 
--scoreTxt:setReferencePoint(display.TopLeftReferencePoint)
scoreTxt.x = display.screenOriginX + 950
scoreTxt.y = display.screenOriginY + 100
local minusButtonPressed = false
scoreTxt:setTextColor(2,2,2)
group:insert( scoreTxt )

---------------------score added 10-----------------------------
--function updateScore()
 --  score = score + 1
 -- _G.score = score
--    scoreTxt.text = string.format(" %d", score)
--end
local scoretimer = timer.performWithDelay(1, updateScore,1)
---------------------score minus 1-----------------------------
function plusScore()
   score = score + 1
  _G.score = score
    scoreTxt.text = string.format(" %d", score)
end
local scoretimer = timer.performWithDelay(1, plusScore,1)

function minusScore()
  score = score + 0
    _G.score = score
   scoreTxt.text = string.format(" %d", score)
end
local scoretimer = timer.performWithDelay(1, minusScore,1)

    
end


function scene:enterScene( event )
    local group = self.view 
end

function scene:exitScene( event )
    local group = self.view 
    timer.cancel( myTimer )
end

function scene:destroyScene( event )
    local group = self.view 

end



scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene