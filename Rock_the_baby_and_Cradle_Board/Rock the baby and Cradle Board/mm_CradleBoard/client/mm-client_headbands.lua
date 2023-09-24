AttachedHeadbands = {}
--------------------------------- Events -----------------------------------------

RegisterNetEvent('mm_native_headbands:AttachHeadbandTypeOnPlayerPed')
AddEventHandler('mm_native_headbands:AttachHeadbandTypeOnPlayerPed', function(type)
    AttachHeadbandTypeOnPlayerPed(type)
end)

------------------------- Attaching / De Functions -------------------------------

AttachHeadbandTypeOnPlayerPed = function (type)

    Wait(1000)

    if Config.MultiItemSetList[type] then

        local foundResult = false
        for k, v in pairs (AttachedHeadbands) do
    
            if v.type == type then
                foundResult = true
            end
        end
    
        Wait(500)
    
        local player = PlayerPedId() 

        if not foundResult then
                  
            local coords = GetEntityCoords(player) 
            ClearPedTasksImmediately(player) 
            ClearPedSecondaryTask(player)   
            Citizen.InvokeNative(0xFCCC886EDE3C63EC, player, 2, 1) -- Removes Weapon from animation 
             

            local entitiesList = {}

            for obj_key, obj_table in pairs (Config.MultiItemSetList[type]) do
        
                Citizen.Wait(200) 

                local prop = CreateObject(obj_table.ObjectCode, coords.x, coords.y, coords.z , 0.2, true, true, false, false, true)

                table.insert(entitiesList, prop)
        
                local boneIndex = GetEntityBoneIndexByName(player, obj_table.Attachment)
                
                AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 
                obj_table.x, obj_table.y, obj_table.z, obj_table.xRot, obj_table.yRot, obj_table.zRot, 
                true, true, false, true, 1, true)
            end

            table.insert(AttachedHeadbands, {type = type, entities = entitiesList })

        else
            ClearPedTasksImmediately(player) 
            ClearPedSecondaryTask(player) 
        
            DeleteAnimationHeadbandTypeProps(type)
        end

    else
        print("This headband type does not exist")
    end

end

DHeadband = function ()
    
    local player = PlayerPedId()                   

    ClearPedTasksImmediately(player) 
    ClearPedSecondaryTask(player) 

    DeleteAnimationHeadbandProps()
end

------------------------- Attaching / De Commands -------------------------------

-- Testing purposes
if Config.UseCradleCommand then

    RegisterCommand("Cradle", function(source, args)    

        if args ~= nil and args[1] ~= nil then
            AttachHeadbandTypeOnPlayerPed("Cradle" .. tostring(args[1]))
        end
    end)

end

-- Removing all the headbands
RegisterCommand("DCradle", function(source, args)    
    if args ~= nil then   
        DHeadband()
    end
end)
