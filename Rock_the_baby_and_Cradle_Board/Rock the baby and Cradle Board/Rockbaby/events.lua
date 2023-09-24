
-- UnLoad the objects
print("RegisterNetEvent: "..Config.ScriptName..":"..Config.UnloadObject )
RegisterNetEvent(Config.ScriptName..":"..Config.UnloadObject )

print("AddEventHandler: "..Config.ScriptName..":"..Config.UnloadObject )
AddEventHandler(Config.ScriptName..":"..Config.UnloadObject , function()
    print("Event: "..Config.ScriptName..":"..Config.UnloadObject )
    UnloadObject()
end) 

-- Load the objects
print("RegisterNetEvent: "..Config.ScriptName..":"..Config.LoadObject )
RegisterNetEvent(Config.ScriptName..":"..Config.LoadObject )

print("AddEventHandler: "..Config.ScriptName..":"..Config.LoadObject )
AddEventHandler(Config.ScriptName..":"..Config.LoadObject , function()
    print("Event: "..Config.ScriptName..":"..Config.LoadObject )
    LoadObject()
end) 