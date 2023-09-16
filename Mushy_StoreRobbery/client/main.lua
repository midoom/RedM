local robtime = 120 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local timers = false
local storetimer = nil
local storenumber = nil

RegisterNetEvent("Witness:ToggleNotification2")
AddEventHandler("Witness:ToggleNotification2", function(coords, alert)
	--print('store name '..tostring(alert))
	TriggerEvent("vorp:TipBottom", 'Telegram of Robbery in Progress at ' .. alert, 15000)
	local blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, coords.x, coords.y, coords.z, 50.0)
	Wait(90000)--Time till notify blips dispears, 1 min
	RemoveBlip(blip)
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

--Robbery startpoint
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		for i = 1, #Config.Shops do
			currentshop = i
			if GetDistanceBetweenCoords(coords, Config.Shops[currentshop].coords.x, Config.Shops[currentshop].coords.y, Config.Shops[currentshop].coords.z, true)  < 1.2 then
				DrawTxt(Config.rob, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0x760A9C6F) then        
				TriggerServerEvent("mushy_robbery:startToRob", function()
				end)
				Wait(Config.Policealert) 
				local alert = Config.Shops[i].name        
				TriggerServerEvent("policenotify", GetPlayers(), coords, alert, i) --Getting the item lockpick
                Wait(Config.Cooldown)
                isRobbing = true   
				end
			end
		end
	end
end)


-- function playerjobloop()
 	--local players = GetPlayers()
 	--local police = 0;
		
 	--for k,v in pairs(players) do
		--local _source = v
 		--local Character = VorpCore.getUser(_source).getUsedCharacter
 		--local job = Character.job
			
 		--if(job == 'police') then
 			--police = police + 1
 		--end
 	--end
		
 	--if(police > 1) then
 		--TriggerClientEvent('mushy_robbery:startAnimation', _source)
 	--else
 		--TriggerClientEvent("vorp:TipBottom", _source, 'Not Enough Lawmen Online', 6000)
 	--end
		
 --end



function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end

    return players
end


RegisterNetEvent('mushy_robbery:startAnimation')
AddEventHandler('mushy_robbery:startAnimation', function()	
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
    local testplayer = exports["lockpick"]:lockpick()
    local testplayer2
    local testplayer3
    local testplayer4
    Wait(1000)
    if testplayer == 100 then
    testplayer2 = exports["lockpick"]:lockpick()
    end
    Wait(1000)
    if testplayer2 == 100 then
    testplayer3 = exports["lockpick"]:lockpick()
    end
    Wait(1000)
    if testplayer3 == 100 then
    testplayer4 = exports["lockpick"]:lockpick()
    end
    if testplayer4 == 100 then   
	TaskStartScenarioInPlace(playerPed, GetHashKey('world_human_shop_browse_counter'), 120000, true, false, false, false)
	exports['progressBars']:startUI(Config.LockpickTime, "Vole en cours")
    Citizen.Wait(1000)
	Citizen.Wait(Config.LockpickTime)
	ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())
    Citizen.Wait(1000)    
	TriggerServerEvent("mushy_robbery:payout", function(playerPed, coords)
	end)
    elseif not testplayer then 
    isRobbing = false         
    end        
end)
