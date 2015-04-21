local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()
local function nextpage()
        storyboard.gotoScene( "page1", "crossFade", 100 )    
    return true
end
function scene:createScene( event )
    local group = self.view
    local background = display.newImage( "background1.png" )
    _W = display.contentWidth /2 ;
	_H = display.contentHeight /2 ;
  	background.x=_W;
	background.y=_H;
	background.xScale = 3.6
	background.yScale = 4.6
		
	local highs1 = display.newImage( "highscore1.png" )
	highs1.xScale = 4
	highs1.yScale = 4
	highs1.x = 550
	highs1.y = 500
	
	
	local square1 = display.newImage ("squarepoint.png")
	square1.xScale = 4
	square1.yScale = 3
	square1.x =  550
	square1.y = 1000
	
	b = widget.newButton{
        defaultFile="arrow.png",
        onRelease = nextpage
    }
    b.xScale = 3
	b.yScale = 3
	b.x = 550 
	b.y = 1600
	
	group:insert ( background )
    group:insert ( highs1 )
    group:insert ( square1 )
    group:insert ( b )
    end

function scene:enterScene( event )
    local group = self.view
    storyboard.removeScene("page")
    storyboard.removeScene("page1")
    storyboard.removeScene("page2")
    storyboard.removeScene("page3")
    storyboard.removeScene("page4")    
 	storyboard.removeScene("page5")
 	storyboard.removeScene("page6")
 	storyboard.removeScene("page7")
 	storyboard.removeScene("page8")
 	storyboard.removeScene("page9")
	storyboard.removeScene("page10") 	
end
function scene:exitScene( event )
    local group = self.view    
end
function scene:destroyScene( event )
    local group = self.view
   -- if buttonHome then
     --   buttonHome:removeSelf()
      --  buttonHome = nil
   -- end        
end
   
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene