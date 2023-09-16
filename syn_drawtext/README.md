# Syn_drawtext
this is a draw text script which will be used for my scripts moving forward. 
icons for the drawtext boxes can be found here https://fontawesome.com/icons?d=gallery
if you're downloading this to use for my scripts you dont need to get into the technical stuff. all you have to do is run it before all my scripts in your load order


How To Use For Your Own Scripts:
---------------------------------
```using this script is pretty simple. 
you call the draw text using this trigger when the player is in an area u want the draw text to appear

      TriggerEvent('syn_drawtext:showNotification', { title = Config.draw.jobcenter, message = Config.draw.jobcenter2, icon = Config.draw.jobcenter3 })
in this example the following are the configs:

Config.draw = {
    jobcenter = "<span style='font-size:20px; color:#19B110;'>Job Center</span>",
    jobcenter2 = "<span style='font-size:25px'>Press </span> <span style='font-size:25px; color:#EB0804;'>G</span> <span style='font-size:25px'> For Job Center</span>",
    jobcenter3 = "fad fa-suitcase",
}
    
to Turn off the draw text you want to use this trigger

  TriggerEvent('syn_drawtext:hideNotification')

----------------------------------------
For more Scripts join my discord https://discord.gg/sjSfqxjpUd
