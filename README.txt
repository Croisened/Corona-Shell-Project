Corona Shell Project
Created by Nathanial Ryan

Credits:
Director 1.4 - Ricardo
Beebe posts


See the blog post for information on how this works, this file will explain all the files in the project...


bg.png - a simple image for the background, it matches the targeted resolution 
         in the config.lua file of 768X1024
         
build.settings - Demonstrates a typical settings file, this is where you need to 
                 add any additional permissions required for Android, set the 
                 orientation options for your applications, introduce custom fonts, etc.
                 
config.lua - configuration options and where you set your targetted resultion.
             This is key for all the dynamic image resultion that takes place and
             is the base value for which all image scaling calcuations are determined from
             
director.lua - this version is 1.4 from Ricardo Rauber

globals.lua - this is where i store all my global variables I need in my app
              They are accessed by simple getGlobal and setGlobal functions
              
home.lua - this is the first screen that a user will actually see, it is what
           main.lua calls after binding up to director and any other modularized
           libraries (IE in this exampe the globals.lua)
           
homebutton.png = an image that will serve as a Corona UI button to get you back to the 
                 home page
                 
homebuttonover.png = an image that will serve as the "hover" over button, which is
                     a very nice effect for your users
                     
main.lua - simply wires up to director and any other external libraries and calls
           your first screen, in this case it is calling home.lua
           
MaroonedOnMarsBB.ttf - for this example I borrowed this font from http://www.1001freefonts.com/

newscreentemplate.lua - copy this file when adding a new screen to your project
                        It is commented and is setup for the "clean" function to 
                        fire when you leave the scene
                        
README.txt - YOU ARE HERE

screen1.lua - our one and only screen in this project, home has a button to get here

screen1button.png - an image that will server as the screen1 button on the home page

screen1buttonover.png - the nice hover over efect for the screen1 button

ui.lua - thanks to Corona for this class, it gives us the nice buttons and text features


             