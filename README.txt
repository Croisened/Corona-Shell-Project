Corona Shell Project
Created by Nathanial Ryan

Credits:
Beebe posts




bg.png - a simple image for the background, it matches the targeted resolution 
         in the config.lua file of 640X960
         
build.settings - Demonstrates a typical settings file, this is where you need to 
                 add any additional permissions required for Android, set the 
                 orientation options for your applications, introduce custom fonts, etc.
                 
config.lua - configuration options and where you set your targetted resultion.
             This is key for all the dynamic image resultion that takes place and
             is the base value for which all image scaling calcuations are determined from

globals.lua - this is where I store all my global variables I need in my app
              They are accessed by simple getGlobal and setGlobal functions
              
scene1.lua - this is the first screen that a user will actually see, it is what
           main.lua calls after binding up to storyboard and any other modularized
           libraries (IE in this exampe the globals.lua)

/images Folder houses any graphic images           
                     
main.lua - simply wires up to storyboard, widgets and any other external libraries and calls
           your first screen, in this case it is calling scene1.lua
           
customfont.ttf - for this example I borrowed this font from http://www.1001freefonts.com/

scenetemplate.lua - copy this file when adding a new screen to your project
                        It is commented and is setup for the "clean" function to 
                        fire when you leave the scene
                        

scene1.lua - our landing scene, home has a button to get here




             