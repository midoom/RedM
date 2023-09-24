----- 
print(Config.ScriptName..":RegisterCommand: "..Config.LoadObject)
RegisterCommand(Config.LoadObject, function(source, args)    
    print("Command: "..Config.ScriptName..": /"..Config.LoadObject)
    if args ~= nil then   
        local data =  source 
        LoadObject()
    end
end)

RegisterCommand(Config.UnloadObject, function(source, args)   
    print("Command: "..Config.ScriptName..": /"..Config.UnloadObject) 
    if args ~= nil then   
        local data =  source 
        UnloadObject()
    end
end)