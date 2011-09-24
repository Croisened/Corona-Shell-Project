module(..., package.seeall)

--====================================================================--
-- SCENE: [MASTER TEMPLATE]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Fully Croisened, NJR Studios LLC - Nathanial Ryan]
 - Website: [www.fullycroisened.com]
 - Mail: [croisened@gmail.com]

******************
 - INFORMATION
******************

  - [XXXXXXXXXX]

--]]

new = function ()

	------------------
	-- Imports, Include any external references that this scenes needs
	-- Example: local ui = require ( "ui" )
	------------------
    local ui = require ( "ui" )

	-------------------------------------------------
	-- Handle any Params that get passed to the Scene
	-------------------------------------------------

	local vLabel = ""
	local vReload = false
	--
	if type( params ) == "table" then
		--
		if type( params.label ) == "string" then
			vLabel = params.label
		end
		--
		if type( params.reload ) == "boolean" then
			vReload = params.reload
		end
		--
	end


	------------------
	-- Groups
	------------------

	local localGroup = display.newGroup()


    ------------------
    -- Local Variable Definitions
    -------------------
	local backGround = display.newImage( "bg.png", true )
    local labelFont = "MaroonedOnMarsBB"
    local standardLabelColors = getGlobal("StandardLabelColors")
    local textSize = 48

	------------------
	-- Functions
	------------------


    -------------------
    --Change Scene-----
    -------------------
    local moveToScene = function(event)

      --Example scene change with parameters
      --director:changeScene( { label="Scene Reloaded" }, "screen2","moveFromRight" )

      --Example scene change without parameters
      --director:changeScene( "screen1", "crossfade" )

	  director:changeScene( "home", "moveFromRight" )

    end

    --UI Stuff--
    local homeButton = ui.newButton{
    	default = "homebutton.png",
	    over = "homebuttonover.png",
	    onRelease = moveToScene,
    }
    
    
    
    local label = display.newText("This is an example of using a custom font! ", 100, 250, labelFont, textSize )
    label:setTextColor(0, 0, 0)

    --Each time we change scenes we will add to the global "Score"
    local label2 = display.newText("Current Score is: " .. getGlobal("Score"), 200, 350, labelFont, textSize + 10 )
    --label2:setTextColor(0, 0, 0)
    label2:setTextColor(standardLabelColors["r"], standardLabelColors["g"], standardLabelColors["b"])
    

	------------------
	-- Code here
	------------------

	--====================================================================--
	-- INITIALIZE, Every Display Object must get shoved into the local Display Group
	-- Example:	localGroup:insert( background )
	--====================================================================--
	local initVars = function ()
      print("Initializing Screen1")
	  localGroup:insert(backGround)
	  localGroup:insert(homeButton)
	  localGroup:insert(label)
	  localGroup:insert(label2)

       --Position Things
       homeButton.x = display.contentWidth / 2
       homeButton.y = 100

    end



    --Clean up local variables, etc...
	clean = function()
	  --Updating the global "Score" -- you can perform this getGlobal and setGlobal from anywhere in your project
	  setGlobal("Score", getGlobal("Score") + 1) 
	  print("Cleaning Screen1")
	end


   	------------------
	-- INITIALIZE variables
	------------------
	initVars()

	------------------
	-- MUST return a display.newGroup()
	------------------
	return localGroup

end
