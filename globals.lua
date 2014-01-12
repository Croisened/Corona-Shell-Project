--[[
  Only store data you need to share across scenes that you aren't persisting in some other manner in here.
  Just add any variables you need to the table....
--]]
local json = require("json")

local Globals = {}

local function setDefaultValues()
  Globals = 
    {
    ["DEBUG"]        = true,
    ["FONTNAME"]        = "SF Digital Readout",
    ["TEXTFIELDSIZE"] = 48,
    ["TEXTFIELDFONTSIZE"] = 18,
    ["STANDARDLABELCOLORS"] = {["r"] = 200, ["g"] = 30, ["b"] = 40, ["a"] = 255},    
    ["STANDARDLABELSIZE"] = 48,
    }
end    


local function saveTable(t, filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local contents = json.encode(t)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end
 
local function loadTable(filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local contents = ""
    --local myTable = {}
    local file = io.open( path, "r" )
    if file then
        -- read all contents of file into a string
        local contents = file:read( "*a" )
        Globals = json.decode(contents);
        io.close( file )
        --return myTable
    else
      --we need to setup all the defaults
      setDefaultValues()
    end
    --return nil
end	

function getGlobal(key)
    local val = Globals[key]
    return val
end
 
function setGlobal(key, val)
    Globals[key] = val
    
    --anytime we set a value, persist it out to the json file...
    saveTable(Globals, "gamevals.json")
    return
end

function setupGlobals()
  loadTable("gamevals.json")
    --print("Check")
  
  --Correct the Font based on platform
  --For Android we need to reference the font file name
  --For iOS we need to reference the actual font name as recognized by an OS, easiest to tell is to register the font and view it there
  if system.getInfo("platformName") == "Android" then
    Globals["FONTNAME"] = "customfont"  --For Android we need to sue the file name, for IOS we need the actual font name
    Globals["TEXTFIELDSIZE"] = 96  --For Android we need need to double the IOS size
  end
  
end

function resetGame()
  setDefaultValues()
  saveTable(Globals, "gamevals.json")
end    


--depricated once we switched to images, but still a useful routine to keep around...
function loadCluesTable(filename)
    local path = system.pathForFile( filename, system.TemporaryDirectory)
    local contents = ""
    local myClues = {}
    local file = io.open( path, "r" )
    if file then
        --print("we have a file")

        -- read all contents of file into a string
        local contents = file:read( "*a" )
        myClues = json.decode(contents);
        io.close( file )
        --return myTable
        
        Globals["cluesloaded"] = true
        Globals["clue1"] = myClues.clue1
        Globals["clue2"] = myClues.clue2
        Globals["clue3"] = myClues.clue3
        Globals["clue4"] = myClues.clue4
        Globals["clue5"] = myClues.clue5
        Globals["clue6"] = myClues.clue6
        
    else
      Globals["cluesloaded"] = false
    end
    --return nil
    saveTable(Globals, "gamevals.json")

end	


--[[
--Possible Storyboard transitions
fade
zoomOutIn
zoomOutInFade
zoomInOut
zoomInOutFade
flip
flipFadeOutIn
zoomOutInRotate
zoomOutInFadeRotate
zoomInOutRotate
zoomInOutFadeRotate
fromRight (over original scene)
fromLeft (over original scene)
fromTop (over original scene)
fromBottom (over original scene)
slideLeft (pushes original scene)
slideRight (pushes original scene)
slideDown (pushes original scene)
slideUp (pushes original scene)
crossFade
--]]

