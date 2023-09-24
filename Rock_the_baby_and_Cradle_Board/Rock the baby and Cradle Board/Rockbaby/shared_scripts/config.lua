Config = {} 
Config.ScriptName = "mm_Torch"
Config.debug = 0
Config.in_game_object = "prop_stuntdoll_01"  -- object in game to be spawned
Config.LoadObject = "Baby"  -- command to be called in chat to spawn object
Config.UnloadObject = "DBaby" -- command to be called in chat to delete object

Config.Bone = "CP_CHEST"
Config.Object_x = -0.11999999999999
Config.Object_y = -0.00999999999999
Config.Object_z =  0.19
Config.Object_pitch = 46.00
Config.Object_roll = 120.00
Config.Object_yaw = -11.00

Config.vorp = true
 
-- Created Config.vorp in the config file.
-- Renamed directories, and updated fxmanifest (directories were not in the file path)
-- Moved torch.lua to the client_scritps because it's a client script.
-- added print statements for debuging
-- added variables to control object spawn position
-- added variables for commands
-- changed object variable table to be generic (better for template)
-- changed function names to be generic (better for template)
-- changed event calls to be variables to make it easier to troubleshoot and for consistency.
-- created additional files to seperate commands, functions, and events to make it easier to read.
-- created server side event to catch the players source id (required to track status of in hand objects)
-- added if statements to check the in hand status allows player to click inventory object: 1 to spawn 2 to delete.
