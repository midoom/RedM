local prompts = GetRandomIntInRange(0, 0xffffff)
local openmenu


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true

        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        
        for k, v in pairs(Config.props) do
            local distance
            local label
            local animation
            local lootTime
            if Config.propLoot[v] then
                distance = Config.propLoot[v].distance
                label = CreateVarString(10, 'LITERAL_STRING',Config.propLoot[v].label)
                animation = Config.propLoot[v].animation
                lootTime = Config.propLoot[v].lootTime
            else
                distance = Config.propLoot["default"].distance
                label = CreateVarString(10, 'LITERAL_STRING',Config.propLoot["default"].label)
                animation = Config.propLoot["default"].animation
                lootTime = Config.propLoot["default"].lootTime
            end
            local prop = DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, distance, GetHashKey(v), 0)
            if prop then
                sleep = false
                
                PromptSetActiveGroupThisFrame(prompts, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE, openmenu) then
                    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(animation), lootTime, true, false, false, false)
                    exports['progressBars']:startUI(lootTime,_U("searching"))
                    Citizen.Wait(lootTime)
                    TriggerServerEvent("twh_searchProps:propLoot",v,coords)
                end
                
            end 
        end 
        if sleep then
            Citizen.Wait(500)
        end
    end
end)


-----------------------------------------
----------Container Interaction----------

Citizen.CreateThread(function()
    if Config.enableInteraction then
        while true do
            Citizen.Wait(10)
        

            local size = GetNumberOfEvents(0)   -- get number of events for EVENT GROUP 0 (SCRIPT_EVENT_QUEUE_AI). Check table below.
            if size > 0 then
                for i = 0, size - 1 do

                    local eventAtIndex = GetEventAtIndex(0, i)

                    if eventAtIndex == GetHashKey("EVENT_CONTAINER_INTERACTION") then   -- if eventAtIndex == GetHashKey("EVENT_VEHICLE_CREATED")

                        local eventDataSize = 4  -- for EVENT_VEHICLE_CREATED data size is 1. Check table below.

                        local eventDataStruct = DataView.ArrayBuffer(40) -- buffer must be 8*eventDataSize or bigger
                        eventDataStruct:SetInt32(0 ,0)                  -- 8*0 offset for 0 element of eventData
                        eventDataStruct:SetInt32(8 ,0)    	  	        -- 8*1 offset for 1 element of eventData
	    				eventDataStruct:SetInt32(16 ,0)			        -- 8*2 offset for 2 element of eventData
	    				eventDataStruct:SetInt32(24 ,0)
                        local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)    -- GET_EVENT_DATA
                        if is_data_exists then
                            local searcher = eventDataStruct:GetInt32(0)
                            local searched = eventDataStruct:GetInt32(8)
                            local isClosedAfter = eventDataStruct:GetInt32(24)
                            local entityModel = GetEntityModel(eventDataStruct:GetInt32(8))
                            if isClosedAfter == 0 then
                                TriggerServerEvent("twh_searchProps:interactionLoot", searcher,searched, entityModel)
                            end

                        end

                    end
                end
            end 
        end
    end
end)



Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = _U("prompt")
    openmenu = PromptRegisterBegin()
    PromptSetControlAction(openmenu, Config.keys.searchKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(openmenu, str)
    PromptSetEnabled(openmenu, 1)
    PromptSetVisible(openmenu, 1)
    PromptSetStandardMode(openmenu, 1)
    PromptSetGroup(openmenu, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, openmenu, true)
    PromptRegisterEnd(openmenu)
end)