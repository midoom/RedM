
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		DisableControlAction(0, 0xD82E0BD2, true) -- diable [P] key
        
        
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        --if (IsControlJustPressed(0,0x4CC0E2FE))  then -- [B]
        if (IsDisabledControlPressed(0,0xD82E0BD2)) then -- [P] or [B]
          
    
           
          
        --if (IsControlJustPressed(0,0xA8E3F467))  then
            --print('L')
            
            local ped = PlayerPedId()
            if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
                
    
                --RequestAnimDict( "mech_loco_m@generic@reaction@pointing@unarmed@stand" )
                RequestAnimDict( "amb_camp@world_camp_jack_throw_rocks_casual@male_a@base" )
    
                while ( not HasAnimDictLoaded( "amb_camp@world_camp_jack_throw_rocks_casual@male_a@base" ) ) do 
                    Citizen.Wait( 100 )
                end
    
                if IsEntityPlayingAnim(ped, "amb_camp@world_camp_jack_throw_rocks_casual@male_a@base", "base", 3) then
                    deleteAnimationProps()
                    ClearPedSecondaryTask(ped)
                    
                else
                    --TaskPlayAnim(ped, "mech_loco_m@generic@reaction@pointing@unarmed@stand", "point_fwd_0", 8.0, 1.0, -1, 31., 0, true, 0, false, 0, false)
                    TaskPlayAnim(ped, "amb_camp@world_camp_jack_throw_rocks_casual@male_a@base", "base", 8.0, 1.0, -1, 31, 0, true, 0, false, 0, false)
                end
            end
        end
    end
end)


macabre_animation_props = {} 
 
function LoadObject()
    print("Function: "..Config.ScriptName..":"..Config.LoadObject)
    local FunctionName = Config.LoadObject
    local ObjectCode = Config.in_game_object
    local Attachment = Config.Bone  
 
    local player = PlayerPedId()                   
    local coords = GetEntityCoords(player) 
    ClearPedTasksImmediately(player) 
    ClearPedSecondaryTask(player)   
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, player, 2, 1) -- Removes Weapon from animation 
     
    if Config.debug == 1 then print(FunctionName, ObjectCode, Attachment) end 
    local prop = CreateObject(ObjectCode, coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
    table.insert(macabre_animation_props, prop)
    Citizen.Wait(100) 

    local boneIndex = GetEntityBoneIndexByName(player, Attachment)
    if Config.debug == 1 then print(FunctionName, prop, boneIndex) end  
    Citizen.Wait(100) 
    
    x = Config.Object_x
    y = Config.Object_ys
    z = Config.Object_z
    
    pitch = Config.Object_pitch
    roll = Config.Object_roll
    yaw = Config.Object_yaw

    if Config.debug == 1 then print(FunctionName, prop, "AttachEntityToEntity")  end 
    AttachEntityToEntity(prop, PlayerPedId(), boneIndex,x, y, z,pitch, roll, yaw, true, true, false, true, 1, true)
     Citizen.Wait(100)   
end 
 
function UnloadObject()
    print("Function: "..Config.ScriptName..":"..Config.UnloadObject)
    local player = PlayerPedId()                   
    local coords = GetEntityCoords(player) 
    ClearPedTasksImmediately(player) 
    ClearPedSecondaryTask(player)   
    deleteAnimationProps()
end

--------------------------------------------------
-- Character Selected ----------------------------
-------------------------------------------------- 
RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
AddEventHandler("vorp:SelectedCharacter", function(charid)
    TriggerServerEvent(Config.ScriptName..":REGISTER")
end)
--------------------------------------------------
-- Startup --------------------------------------- 
-------------------------------------------------- 
AddEventHandler('onResourceStart', function(resource) 
	if resource == GetCurrentResourceName() then  
		print(Config.ScriptName.."EventHandler: onResourceStart")

	end
end)

--------------------------------------------------
-- Cleanup ---------------------------------------
-- Always leave a space cleaner than you found it.
-------------------------------------------------- 
AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then 
		print(Config.ScriptName.."EventHandler: onResourceStop")
		deleteAnimationProps()    
		ClearPedTasksImmediately(PlayerPedId())  
		if IsScreenFadedOut() == true then 
			DoScreenFadeIn(5000) 
		end
	end
end)
   
function deleteAnimationProps()
    print("Function: deleteAnimationProps")
	while #macabre_animation_props > 0 do  
		for k,_prop_item in pairs(macabre_animation_props) do 
			Wait(200)
			local retval --[[ boolean ]] =	DoesEntityExist( _prop_item --[[ Entity ]]	)
			print("DoesEntityExist", retval)
			if retval == true or retval == 1 then 
				DeleteObject(_prop_item)
				Wait(200)
				local retval --[[ boolean ]] =	DoesEntityExist( _prop_item --[[ Entity ]]	)
				if retval == false or retval == 0 then 
					table.remove(macabre_animation_props, k)
				end 
			end 
		end
	end 
end 

function IN_ExecuteCommand(my_command)
    Citizen.InvokeNative(0x561C060B, my_command) -- ExecuteCommand
    -- EXECUTE_COMMAND  ExecuteCommand( commandString --[[ string ]] )
end 
