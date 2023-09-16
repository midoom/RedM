local Debuter = false
local Parler = false
local MaisonEnCour = false
local PorteMaison = false
local RobbingHouse = false
local Spot1 = false
local Spot2 = false
local Spot3 = false
local Spot4 = false
local Spot5 = false
local Spot6 = false
local Spot7 = false
local Spot8 = false
local Spot9 = false
local Spot10 = false
local Spot11 = false
local Spot12 = false
local Spot13 = false
local Spot14 = false
local Spot15 = false
local Spot16 = false
local Spot17 = false
local Spot18 = false
local Spot19 = false
local Spot20 = false
local Spot21 = false
local Spot22 = false
local Spot23 = false
local Spot24 = false
local Spot25 = false
local Spot26 = false
local chance = 0
local skillGap = 20

Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("CS_mud2bigguy") ) do
    Wait(500)
    RequestModel( GetHashKey("CS_mud2bigguy") )
    end
    local HouseDude = CreatePed(GetHashKey("CS_mud2bigguy"), 2455.77, -1221.29, 45.89, 84.43, false, false, 0, 0) -- st-denis
    while not DoesEntityExist(HouseDude) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, HouseDude, true)
    FreezeEntityPosition(HouseDude, true)
    SetEntityInvincible(HouseDude, true)
    TaskStandStill(HouseDude, -1)
    SetEntityCanBeDamagedByRelationshipGroup(HouseDude, false, `PLAYER`)
    SetEntityAsMissionEntity(HouseDude, true, true)
	SetBlockingOfNonTemporaryEvents(HouseDude, true)
    SetModelAsNoLongerNeeded(GetHashKey("CS_mud2bigguy"))
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local _source = source
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 2455.77, -1221.29, 45.89, true)
		    if betweencoords < 5.0 and Debuter == false then
		    DrawInfo(Config.Language.ineedhelp, 0.50, 0.85, 0.4, 0.4, true, 255, 255, 255, 255, true)
		    end
		    if betweencoords < 2.0 and Debuter == false then
		    DrawTxt(Config.Language.talktobill, 0.50, 0.90, 04, 0.4, true, 255, 255, 255, 255, true)
		    if IsControlJustReleased(0, 0xC7B5340A) then -- Enter
		    TriggerServerEvent("lto_houserobbery:sherif1", GetPlayers()) -- check if sherif online
		    end
		end
	end
end)

RegisterNetEvent('lto_houserobbery:montest1')
AddEventHandler('lto_houserobbery:montest1', function()	
    TriggerServerEvent("lto_houserobbery:montest")		
end)

RegisterNetEvent('lto_houserobbery:TalkToBill')
AddEventHandler('lto_houserobbery:TalkToBill', function()	
	Debuter = true
	CoolDownHouse()
    TriggerServerEvent("lto_houserobbery:Bill")		
end)

-- cooldown pour finir la mission sinon sa reset
function CoolDownHouse()
	Citizen.CreateThread(function()
	  local timetocheckHouse = 108000 -- 3600 = 1 min, 18000 = 5 min, 10800 = 30 min, 216000 = 1 hour
		while timetocheckHouse >= 0  do
			Citizen.Wait(1)
			timetocheckHouse = timetocheckHouse - 1
		end
		if timetocheckHouse <= 1 then
		TriggerEvent("lto_houserobbery:FAIL")
		end
	end)
end

RegisterNetEvent('lto_houserobbery:YesOrNo')
AddEventHandler('lto_houserobbery:YesOrNo', function()	
    while Debuter do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 2455.77, -1221.29, 45.89, true)
		if betweencoords < 2.0 and Debuter and not Parler then
			DrawTxt(Config.Language.billacceptmission, 0.50, 0.80, 0.5, 0.5, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) and Debuter and not Parler then -- Enter
			Parler = true
			TriggerServerEvent("lto_houserobbery:Bill2")
			end	
		end
	end
end)

RegisterNetEvent('lto_houserobbery:goto1')
AddEventHandler('lto_houserobbery:goto1', function(source)
    blipBordel = N_0x554d9d53f696d002(203020899, 2390.54, -1216.21, 47.15)
    SetBlipSprite(blipBordel, -570710357, 1)
	PorteMaison = true
    MaisonEnCour = true
    TriggerEvent("lto_houserobbery:DEAD")
	TriggerEvent("lto_houserobbery:Maison")
	PortesMaison("p_doornbd39x_destruct")
	PortesMaison2("p_rhomansion_doorshtruf_l")
	GrilleFenetre("p_doorcircus01x")
end)

RegisterNetEvent('lto_houserobbery:Maison')
AddEventHandler('lto_houserobbery:Maison', function()	
    while PorteMaison do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(PlayerPedId())
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, 2390.05, -1216.19, 47.15 - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 0.3, 77, 7, 17, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, 2390.05, -1216.19, 47.15) < 1.0) then
			DrawTxt(Config.Language.picklockdoorHouse, 0.50, 0.85, 0.5, 0.5, true, 255, 255, 255, 255, true)
			DrawText3D(2389.29, -1216.28, 47.15, Config.Language.doorlockedHouse)
                if IsControlJustPressed(0, 0xC7B5340A) then -- enter
				TriggerServerEvent("lto_houserobbery_check:LockPick")
            end
		end
	end
end)

RegisterNetEvent('lto_houserobbery:crochetage')
AddEventHandler('lto_houserobbery:crochetage', function()
    local playerPed = PlayerPedId()
	RequestAnimDict("script_common@jail_cell@unlock@key")
    while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
		Citizen.Wait(50)
    end
	local Try1 = taskBar(2000,3)
	TaskPlayAnim(playerPed, "script_common@jail_cell@unlock@key", "action", 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
    Wait(1000)
    if Try1 == 100 then
		TriggerEvent("vorp:TipBottom", Config.Language.houseunlocked, 6000)
		ClearPedTasksImmediately(PlayerPedId())
		EffacePorte(MPorteA)
		EffacePorte(MPorteB)
		EffacePorte(MPorteC)
		EffacePorte(MPorteD)
		EffacePorte(MPorteE)
		EffacePorte(MPorteF)
		EffacePorte(MPorteG)
		EffacePorte(GrilleA)
		EffacePorte(GrilleB)
		EffacePorte(GrilleC)
		EffacePorte(GrilleD)
		EffacePorte(GrilleE)
		EffacePorte(GrilleF)
		EffacePorte(GrilleG)
		EffacePorte(GrilleH)
		EffacePorte(GrilleI)
		EffacePorte(GrilleJ)
		EffacePorte(GrilleK)
		EffacePorte(GrilleL)
		EffacePorte(GrilleM)
		EffacePorte(GrilleN)
	    PorteMaison = false
		RemoveBlip(blipBordel)
		RobbingHouse = true
		TriggerEvent("lto_houserobbery:RobHouse")
	else
		TriggerEvent("vorp:TipBottom", Config.Language.brokelockhouse, 4000)
		ClearPedTasksImmediately(PlayerPedId())
    end
end)

RegisterNetEvent('lto_houserobbery:RobHouse')
AddEventHandler('lto_houserobbery:RobHouse', function()	
    while RobbingHouse do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(PlayerPedId())
		
		    if IsPedShooting(playerPed) then
		    TriggerEvent("lto_houserobbery:notify")
			
			elseif GetDistanceBetweenCoords(pos, 2390.05, -1216.19, 47.15, true) > 150 then -- if player run away to finish or cancel the mission
			TriggerEvent("lto_houserobbery:FAILM")
            
            elseif (Vdist(pos.x, pos.y, pos.z, 2384.44, -1214.93, 47.15) < 0.8) and Spot1 == false then
			DrawText3D(2384.44, -1214.93, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot1 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2387.12, -1223.00, 47.15) < 0.8) and Spot2 == false then
			DrawText3D(2387.12, -1223.00, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot2 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2381.09, -1223.02, 47.15) < 0.8) and Spot3 == false then
			DrawText3D(2381.09, -1223.02, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot3 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2381.13, -1219.45, 47.15) < 0.8) and Spot4 == false then
			DrawText3D(2381.13, -1219.45, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot4 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2375.74, -1209.50, 47.15) < 0.8) and Spot5 == false then
			DrawText3D(2375.74, -1209.50, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot5 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2380.95, -1209.27, 47.15) < 0.8) and Spot6 == false then
			DrawText3D(2380.95, -1209.27, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot6 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2369.79, -1211.32, 47.15) < 0.8) and Spot7 == false then
			DrawText3D(2369.79, -1211.32, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot7 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2374.42, -1209.39, 47.15) < 0.8) and Spot8 == false then
			DrawText3D(2374.42, -1209.39, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot8 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2372.27, -1224.68, 47.15) < 0.8) and Spot9 == false then
			DrawText3D(2372.27, -1224.68, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot9 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2370.08, -1220.22, 47.15) < 0.8) and Spot10 == false then
			DrawText3D(2370.08, -1220.22, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot10 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2362.48, -1212.98, 47.15) < 0.8) and Spot11 == false then
			DrawText3D(2362.48, -1212.98, 47.15, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot11 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2385.88, -1213.23, 51.76) < 0.8) and Spot12 == false then
			DrawText3D(2385.88, -1213.23, 51.76, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot12 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2384.54, -1209.72, 51.76) < 0.8) and Spot13 == false then
			DrawText3D(2384.54, -1209.72, 51.76, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot13 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2379.09, -1209.50, 51.76) < 0.8) and Spot14 == false then
			DrawText3D(2379.09, -1209.50, 51.76, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot14 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2374.48, -1207.93, 51.75) < 0.8) and Spot15 == false then
			DrawText3D(2374.48, -1207.93, 51.75, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot15 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2373.02, -1226.30, 51.75) < 0.8) and Spot16 == false then
			DrawText3D(2373.02, -1226.30, 51.75, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot16 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2370.11, -1218.27, 51.75) < 0.8) and Spot17 == false then
			DrawText3D(2370.11, -1218.27, 51.75, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot17 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2362.93, -1217.18, 51.75) < 0.8) and Spot18 == false then
			DrawText3D(2362.93, -1217.18, 51.75, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot18 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2361.93, -1231.49, 46.60) < 0.8) and Spot19 == false then
			DrawText3D(2361.93, -1231.49, 46.60, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot19 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2339.06, -1238.12, 44.97) < 0.8) and Spot20 == false then
			DrawText3D(2339.06, -1238.12, 44.97, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot20 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2302.74, -1224.95, 43.98) < 0.8) and Spot21 == false then
			DrawText3D(2302.74, -1224.95, 43.98, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot21 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2304.71, -1209.82, 43.97) < 0.8) and Spot22 == false then
			DrawText3D(2304.71, -1209.82, 43.97, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot22 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2276.58, -1212.45, 42.21) < 0.8) and Spot23 == false then
			DrawText3D(2276.58, -1212.45, 42.21, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot23 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2264.49, -1224.12, 42.21) < 0.8) and Spot24 == false then
			DrawText3D(2264.49, -1224.12, 42.21, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot24 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			elseif (Vdist(pos.x, pos.y, pos.z, 2335.50, -1196.30, 44.97) < 0.8) and Spot25 == false then
			DrawText3D(2335.50, -1196.30, 44.97, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot25 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end

			elseif (Vdist(pos.x, pos.y, pos.z, 2368.24, -1209.77, 51.75) < 0.8) and Spot26 == false then
			DrawText3D(2368.24, -1209.77, 51.75, Config.Language.searchhouse)
			if IsControlJustPressed(0, 0xC7B5340A) then -- Enter
			Spot26 = true
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
            exports['progressBars']:startUI(10000, Config.Language.searchinghouse)
            Citizen.Wait(10000)			
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent("lto_houserobbery:loot")
			TriggerEvent("lto_houserobbery:AngryWomen1")
			end
			
			
			elseif Spot1 == true and Spot2 == true and Spot3 == true and Spot4 == true and Spot5 == true and Spot6 == true and Spot7 == true and Spot8 == true and Spot9 == true and Spot10 == true and Spot11 == true and Spot12 == true and Spot13 == true and Spot14 == true and Spot15 == true and Spot16 == true and Spot17 == true and Spot18 == true and Spot19 == true and Spot20 == true and Spot21 == true and Spot22 == true and Spot23 == true and Spot24 == true and Spot25 == true and Spot26 == true then
            TriggerEvent("lto_houserobbery:END")
			
        end
	end
end)

function PortesMaison(hash)
    local Porte1 = GetHashKey(hash)
    Wait(500)
    RequestModel(Porte1)
    if not HasModelLoaded(Porte1) then 
    RequestModel(Porte1) 
    end
    while not HasModelLoaded(Porte1) do 
    Citizen.Wait(1) 
    end
	MPorteA = CreateObject(Porte1, 2389.05, -1215.17, 46.15, true, false, false, 0, 0)
    MPorteB = CreateObject(Porte1, 2389.05, -1217.35, 46.15, true, false, false, 0, 0)
	MPorteE = CreateObject(Porte1, 2361.35, -1215.20, 46.15, true, false, false, 0, 0)
    MPorteF = CreateObject(Porte1, 2361.35, -1217.37, 46.15, true, false, false, 0, 0)
    MPorteG = CreateObject(Porte1, 2367.38, -1208.44, 46.15, true, false, false, 0, 0)
    SetEntityAsMissionEntity(MPorteA, true, true)
    SetEntityAsMissionEntity(MPorteB, true, true)
    SetEntityAsMissionEntity(MPorteE, true, true)
    SetEntityAsMissionEntity(MPorteF, true, true)
    SetEntityAsMissionEntity(MPorteG, true, true)
	SetEntityHeading(MPorteA, 270.11)
	SetEntityHeading(MPorteB, 89.58)
	SetEntityHeading(MPorteE, 270.11)
	SetEntityHeading(MPorteF, 89.58)
	SetEntityInvincible(MPorteA, true)
	SetEntityInvincible(MPorteB, true)
	SetEntityInvincible(MPorteE, true)
	SetEntityInvincible(MPorteF, true)
	SetEntityInvincible(MPorteG, true)
end

function PortesMaison2(hash)
    local Porte2 = GetHashKey(hash)
    Wait(500)
    RequestModel(Porte2)
    if not HasModelLoaded(Porte2) then 
    RequestModel(Porte2) 
    end
    while not HasModelLoaded(Porte2) do 
    Citizen.Wait(1) 
    end
    MPorteC = CreateObject(Porte2, 2389.05, -1214.59, 46.15, true, false, false, 0, 0)
    MPorteD = CreateObject(Porte2, 2389.05, -1217.94, 46.15, true, false, false, 0, 0)
    SetEntityAsMissionEntity(MPorteC, true, true)
    SetEntityAsMissionEntity(MPorteD, true, true)
	SetEntityHeading(MPorteC, 270.11)
	SetEntityHeading(MPorteD, 89.58)
	SetEntityInvincible(MPorteC, true)
	SetEntityInvincible(MPorteD, true)
	FreezeEntityPosition(MPorteC, true)
	FreezeEntityPosition(MPorteD, true)
end

function GrilleFenetre(hash)
    local Grille1 = GetHashKey(hash)
    Wait(500)
    RequestModel(Grille1)
    if not HasModelLoaded(Grille1) then 
    RequestModel(Grille1) 
    end
    while not HasModelLoaded(Grille1) do 
    Citizen.Wait(1) 
    end
	GrilleA = CreateObject(Grille1, 2389.10, -1220.35, 46.70, true, false, false, 0, 0)
	GrilleB = CreateObject(Grille1, 2389.10, -1222.65, 46.70, true, false, false, 0, 0)
	GrilleC = CreateObject(Grille1, 2389.10, -1212.63, 46.70, true, false, false, 0, 0)
	GrilleD = CreateObject(Grille1, 2389.10, -1210.40, 46.70, true, false, false, 0, 0)
	GrilleE = CreateObject(Grille1, 2378.45, -1208.05, 47.15, true, false, false, 0, 0)
	GrilleF = CreateObject(Grille1, 2377.85, -1207.85, 47.15, true, false, false, 0, 0)
	GrilleG = CreateObject(Grille1, 2376.45, -1208.20, 47.15, true, false, false, 0, 0)
	GrilleH = CreateObject(Grille1, 2361.35, -1212.63, 47.15, true, false, false, 0, 0)
	GrilleI = CreateObject(Grille1, 2361.35, -1210.40, 47.15, true, false, false, 0, 0)
	GrilleJ = CreateObject(Grille1, 2370.00, -1226.35, 47.15, true, false, false, 0, 0)
	GrilleK = CreateObject(Grille1, 2372.45, -1227.50, 47.15, true, false, false, 0, 0)
	GrilleL = CreateObject(Grille1, 2374.70, -1226.10, 47.15, true, false, false, 0, 0)
	GrilleM = CreateObject(Grille1, 2369.80, -1206.15, 47.15, true, false, false, 0, 0)
	GrilleN = CreateObject(Grille1, 2374.25, -1205.90, 47.15, true, false, false, 0, 0)
    SetEntityAsMissionEntity(GrilleA, true, true)
    SetEntityAsMissionEntity(GrilleB, true, true)
    SetEntityAsMissionEntity(GrilleC, true, true)
    SetEntityAsMissionEntity(GrilleD, true, true)
    SetEntityAsMissionEntity(GrilleE, true, true)
    SetEntityAsMissionEntity(GrilleF, true, true)
    SetEntityAsMissionEntity(GrilleG, true, true)
    SetEntityAsMissionEntity(GrilleH, true, true)
    SetEntityAsMissionEntity(GrilleI, true, true)
    SetEntityAsMissionEntity(GrilleJ, true, true)
    SetEntityAsMissionEntity(GrilleK, true, true)
    SetEntityAsMissionEntity(GrilleL, true, true)
    SetEntityAsMissionEntity(GrilleM, true, true)
    SetEntityAsMissionEntity(GrilleN, true, true)
	SetEntityHeading(GrilleA, 270.11)
	SetEntityHeading(GrilleB, 270.11)
	SetEntityHeading(GrilleC, 270.11)
	SetEntityHeading(GrilleD, 270.11)
	SetEntityHeading(GrilleE, 150.00)
	SetEntityHeading(GrilleF, 0.00)
	SetEntityHeading(GrilleG, 210.00)
	SetEntityHeading(GrilleH, 270.11)
	SetEntityHeading(GrilleI, 270.11)
	SetEntityHeading(GrilleJ, 305.00)
	SetEntityHeading(GrilleK, 0.00)
	SetEntityHeading(GrilleL, 52.00)
	SetEntityHeading(GrilleM, 225.00)
	SetEntityHeading(GrilleN, 135.00)
	FreezeEntityPosition(GrilleA, true)
	FreezeEntityPosition(GrilleB, true)
	FreezeEntityPosition(GrilleC, true)
	FreezeEntityPosition(GrilleD, true)
	FreezeEntityPosition(GrilleE, true)
	FreezeEntityPosition(GrilleF, true)
	FreezeEntityPosition(GrilleG, true)
	FreezeEntityPosition(GrilleH, true)
	FreezeEntityPosition(GrilleI, true)
	FreezeEntityPosition(GrilleJ, true)
	FreezeEntityPosition(GrilleK, true)
	FreezeEntityPosition(GrilleL, true)
	FreezeEntityPosition(GrilleM, true)
	FreezeEntityPosition(GrilleN, true)
end

function EffacePorte(object)
    DeleteObject(object)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

function DrawInfo(text, x, y, size)
    local xc = x / 1.0;
    local yc = y / 1.0;
    SetScriptGfxDrawOrder(3)
    SetTextScale(size, size)
    SetTextCentre(true)
    SetTextColor(255, 255, 255, 100)
    SetTextFontForCurrentCommand(6)
    DisplayText(CreateVarString(10, 'LITERAL_STRING', text), xc, yc)
    SetScriptGfxDrawOrder(3)
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225
	  DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
	end
end

RegisterNetEvent('lto_houserobbery:AngryWomen1')
AddEventHandler('lto_houserobbery:AngryWomen1', function()	
    math.random()
    local _source = source
	local Chances = math.random(1,10)

    if Chances == 2 then
        TriggerEvent("lto_houserobbery:Women1")
		TriggerEvent("vorp:TipBottom", Config.Language.women, 7000)

	elseif Chances == 5 then
	    TriggerEvent("lto_houserobbery:Women2")
		TriggerEvent("vorp:TipBottom", Config.Language.women, 7000)
		
	elseif Chances == 8 then
	    TriggerEvent("lto_houserobbery:Women3")
		TriggerEvent("lto_houserobbery:Pimp")
		TriggerEvent("vorp:TipBottom", Config.Language.women, 7000)
		
    end
end)

RegisterNetEvent('lto_houserobbery:Women1')
AddEventHandler('lto_houserobbery:Women1', function()	
	RequestModel("A_F_M_BTCObeseWomen_01")
	while not HasModelLoaded("A_F_M_BTCObeseWomen_01") do
		Wait(10)
	end
	women1 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2399.95, -1236.35, 46.10, 45.60, true, false, 0, 0)
	women2 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2353.99, -1199.08, 45.97, 195.30, true, false, 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women1, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women1, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women2, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women2, PlayerPedId(), 0, 0)
	SetPedCombatAttributes(women1, 46, 1)
	SetPedCombatAttributes(women2, 46, 1)
	SetPedCombatAbility(women1, 100)
	SetPedCombatAbility(women2, 100)
	SetPedCombatMovement(women1, 2)
	SetPedCombatMovement(women2, 2)
	SetPedCombatRange(women1, 2)
	SetPedCombatRange(women2, 2)
	SetPedKeepTask(women1, true)
	SetPedKeepTask(women2, true)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women1)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women2)
end)

RegisterNetEvent('lto_houserobbery:Women2')
AddEventHandler('lto_houserobbery:Women2', function()	
	RequestModel("A_F_M_BTCObeseWomen_01")
	while not HasModelLoaded("A_F_M_BTCObeseWomen_01") do
		Wait(10)
	end
	women11 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2399.95, -1236.35, 46.10, 45.60, true, false, 0, 0)
	women22 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2353.99, -1199.08, 45.97, 195.30, true, false, 0, 0)
	women33 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2400.16, -1194.89, 46.09, 133.90, true, false, 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women11, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women11, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women22, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women22, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women33, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women33, PlayerPedId(), 0, 0)
	SetPedCombatAttributes(women11, 46, 1)
	SetPedCombatAttributes(women22, 46, 1)
	SetPedCombatAttributes(women33, 46, 1)
	SetPedCombatAbility(women11, 100)
	SetPedCombatAbility(women22, 100)
	SetPedCombatAbility(women33, 100)
	SetPedCombatMovement(women11, 2)
	SetPedCombatMovement(women22, 2)
	SetPedCombatMovement(women33, 2)
	SetPedCombatRange(women11, 2)
	SetPedCombatRange(women22, 2)
	SetPedCombatRange(women33, 2)
	SetPedKeepTask(women11, true)
	SetPedKeepTask(women22, true)
	SetPedKeepTask(women33, true)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women11)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women22)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women33)
end)

RegisterNetEvent('lto_houserobbery:Women3')
AddEventHandler('lto_houserobbery:Women3', function()	
	RequestModel("A_F_M_BTCObeseWomen_01")
	while not HasModelLoaded("A_F_M_BTCObeseWomen_01") do
		Wait(10)
	end
	women111 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2399.95, -1236.35, 46.10, 45.60, true, false, 0, 0)
	women222 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2353.99, -1199.08, 45.97, 195.30, true, false, 0, 0)
	women333 = CreatePed(GetHashKey("A_F_M_BTCObeseWomen_01"), 2400.16, -1194.89, 46.09, 133.90, true, false, 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women111, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women111, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women222, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women222, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, women333, true)
	Citizen.InvokeNative(0xF166E48407BAC484, women333, PlayerPedId(), 0, 0)
	SetPedCombatAttributes(women111, 46, 1)
	SetPedCombatAttributes(women222, 46, 1)
	SetPedCombatAttributes(women333, 46, 1)
	SetPedCombatAbility(women111, 100)
	SetPedCombatAbility(women222, 100)
	SetPedCombatAbility(women333, 100)
	SetPedCombatMovement(women111, 2)
	SetPedCombatMovement(women222, 2)
	SetPedCombatMovement(women333, 2)
	SetPedCombatRange(women111, 2)
	SetPedCombatRange(women222, 2)
	SetPedCombatRange(women333, 2)
	SetPedKeepTask(women111, true)
	SetPedKeepTask(women222, true)
	SetPedKeepTask(women333, true)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women111)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women222)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, women333)
end)

RegisterNetEvent('lto_houserobbery:Pimp')
AddEventHandler('lto_houserobbery:Pimp', function()	
	RequestModel("CS_strawberryoutlaw_01")
	while not HasModelLoaded("CS_strawberryoutlaw_01") do
		Wait(10)
	end
	Pimp = CreatePed(GetHashKey("CS_strawberryoutlaw_01"), 2355.24, -1237.13, 46.00, 85.99, true, false, 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, Pimp, true)
	Citizen.InvokeNative(0xF166E48407BAC484, Pimp, PlayerPedId(), 0, 0)
    GiveWeaponToPed_2(Pimp, 0x64356159, 500, true, 1, false, 0.0)
	SetPedCombatAttributes(Pimp, 46, 1)
	SetPedCombatAbility(Pimp, 100)
	SetPedCombatMovement(Pimp, 2)
	SetPedCombatRange(Pimp, 2)
	SetPedKeepTask(Pimp, true)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, Pimp)
end)

RegisterNetEvent('lto_houserobbery:notify')
AddEventHandler('lto_houserobbery:notify', function()	
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
	TriggerServerEvent("lto_houserobbery:notifysherif", GetPlayers(), coords) -- averti les sherif
end)

RegisterNetEvent("lto_houserobbery:repportsherif")
AddEventHandler("lto_houserobbery:repportsherif", function(coords)
	TriggerEvent("vorp:TipBottom", Config.Language.repportsherifhouse, 6000)
	local bliphouse = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, coords.x, coords.y, coords.z, 50.0)
	Wait(15000) -- 15 seconds befor removing the blip on map
	RemoveBlip(bliphouse)
end)

function GetPlayers()
    local players = {}
	for _,player in ipairs(GetActivePlayers()) do
        table.insert(players, GetPlayerServerId(player))
    end
    return players
end

function openGui(sentLength,taskID,namesent,chancesent,skillGapSent)
    TriggerEvent("vorp:TipBottom", Config.Language.linehouse, 4000)
    Wait(1000)
    guiEnabled = true
    SetNuiFocus(guiEnabled,false)
    SendNUIMessage({runProgress = true, Length = sentLength, Task = taskID, name = namesent, chance = chancesent, skillGap = skillGapSent})
end

function updateGui(sentLength,taskID,namesent,chancesent,skillGapSent)
    SendNUIMessage({runUpdate = true, Length = sentLength, Task = taskID, name = namesent, chance = chancesent, skillGap = skillGapSent})
end

local activeTasks = 0

function closeGuiFail()
    guiEnabled = false
    SetNuiFocus(guiEnabled,false)
    SendNUIMessage({closeFail = true})
end

function closeGui()
    guiEnabled = false
    SetNuiFocus(guiEnabled,false)
    SendNUIMessage({closeProgress = true})
end

function closeNormalGui()
    guiEnabled = false
    SetNuiFocus(guiEnabled,false)
end
  
RegisterNUICallback('taskCancel', function(data, cb)
  closeGui()
  activeTasks = 2
  FactorFunction(false)
end)

RegisterNUICallback('taskEnd', function(data, cb)
    closeNormalGui()
    if (tonumber(data.taskResult) < (chance + 20) and tonumber(data.taskResult) > (chance))  then
        activeTasks = 3
        factor = 1.0
    else
        FactorFunction(false)
        activeTasks = 2
    end
end)

local factor = 1.0
local taskInProcess = false
local calm = true

function FactorFunction(pos)
    if not pos then
        factor = factor - 0.1
        if factor < 0.1 then
            factor = 0.1
        end
        if factor == 0.5 and calm then
            calm = false
        end
        TriggerEvent("factor:restore")        
    else
        if factor > 1.0 or factor == 0.9 then
            if not calm then
                calm = true
            end            
            factor = 1.0
            return
        end
        factor = factor + 0.1
    end    
end

RegisterNetEvent('factor:restore')
AddEventHandler('factor:restore', function()
    Wait(15000)
    FactorFunction(true)
end)

function taskBar(difficulty,skillGapSent)
    Wait(100)
    skillGap = skillGapSent
    if skillGap < 5 then
        skillGap = 5
    end
    local name = "E"
    local playerPed = PlayerPedId()
    if taskInProcess then
        return 100
    end
    FactorFunction(false)
    chance = math.random(15,90)

    local length = math.ceil(difficulty * factor)

    taskInProcess = true
    local taskIdentifier = "taskid" .. math.random(1000000)
    openGui(length,taskIdentifier,name,chance,skillGap)
    activeTasks = 1

    local maxcount = GetGameTimer() + length
    local curTime

    while activeTasks == 1 do
        Citizen.Wait(1)
        curTime = GetGameTimer()
        if curTime > maxcount then
            activeTasks = 2
        end
        local updater = 100 - (((maxcount - curTime) / length) * 100)
        updater = math.min(100, updater)
        updateGui(updater,taskIdentifier,name,chance,skillGap)
    end

    if activeTasks == 2 then
        closeGui()
        taskInProcess = false
        return 0
    else
        closeGui()
        taskInProcess = false
        return 100
    end 
end

RegisterNetEvent('lto_houserobbery:DEAD')
AddEventHandler('lto_houserobbery:DEAD', function()	
    while MaisonEnCour do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerdead = IsPlayerDead(playerped)
		if MaisonEnCour == true then
		    if playerdead then
		TriggerEvent("lto_houserobbery:FAILM")
		break
		end
		end
	end
end)

RegisterNetEvent('lto_houserobbery:END')
AddEventHandler('lto_houserobbery:END', function()
    local _source = source
	TriggerEvent("vorp:TipBottom", Config.Language.done, 7000)
    Debuter = false
    Parler = false
    MaisonEnCour = false
    PorteMaison = false
    RobbingHouse = false
    timetocheckHouse = 0
    RemoveBlip(blipBordel)
	EffacePorte(MPorteA)
	EffacePorte(MPorteB)
	EffacePorte(MPorteC)
	EffacePorte(MPorteD)
	EffacePorte(MPorteE)
	EffacePorte(MPorteF)
	EffacePorte(MPorteG)
	EffacePorte(GrilleA)
	EffacePorte(GrilleB)
	EffacePorte(GrilleC)
	EffacePorte(GrilleD)
	EffacePorte(GrilleE)	
	EffacePorte(GrilleF)
	EffacePorte(GrilleG)
	EffacePorte(GrilleH)
	EffacePorte(GrilleI)
	EffacePorte(GrilleJ)
	EffacePorte(GrilleK)
	EffacePorte(GrilleL)
	EffacePorte(GrilleM)
	EffacePorte(GrilleN)
	Spot1 = false
	Spot2 = false
	Spot3 = false
	Spot4 = false
	Spot5 = false
	Spot6 = false
	Spot7 = false
	Spot8 = false
	Spot9 = false
	Spot10 = false
	Spot11 = false
	Spot12 = false
	Spot13 = false
	Spot14 = false
	Spot15 = false
	Spot16 = false
	Spot17 = false
	Spot18 = false
	Spot19 = false
	Spot20 = false
	Spot21 = false
	Spot22 = false
	Spot23 = false
	Spot24 = false
	Spot25 = false
	DeletePed(Pimp)
	DeletePed(women1)
	DeletePed(women2)
	DeletePed(women11)
	DeletePed(women22)
	DeletePed(women33)
	DeletePed(women111)
	DeletePed(women222)
	DeletePed(women333)
end)

RegisterNetEvent('lto_houserobbery:FAILM')
AddEventHandler('lto_houserobbery:FAILM', function()
    local _source = source
	TriggerEvent("vorp:TipBottom", Config.Language.failhouse, 7000)
    Debuter = false
    Parler = false
    MaisonEnCour = false
    PorteMaison = false
    RobbingHouse = false
    timetocheckHouse = 0
    RemoveBlip(blipBordel)
	EffacePorte(MPorteA)
	EffacePorte(MPorteB)
	EffacePorte(MPorteC)
	EffacePorte(MPorteD)
	EffacePorte(MPorteE)
	EffacePorte(MPorteF)
	EffacePorte(MPorteG)
	EffacePorte(GrilleA)
	EffacePorte(GrilleB)
	EffacePorte(GrilleC)
	EffacePorte(GrilleD)
	EffacePorte(GrilleE)	
	EffacePorte(GrilleF)
	EffacePorte(GrilleG)
	EffacePorte(GrilleH)
	EffacePorte(GrilleI)
	EffacePorte(GrilleJ)
	EffacePorte(GrilleK)
	EffacePorte(GrilleL)
	EffacePorte(GrilleM)
	EffacePorte(GrilleN)
	Spot1 = false
	Spot2 = false
	Spot3 = false
	Spot4 = false
	Spot5 = false
	Spot6 = false
	Spot7 = false
	Spot8 = false
	Spot9 = false
	Spot10 = false
	Spot11 = false
	Spot12 = false
	Spot13 = false
	Spot14 = false
	Spot15 = false
	Spot16 = false
	Spot17 = false
	Spot18 = false
	Spot19 = false
	Spot20 = false
	Spot21 = false
	Spot22 = false
	Spot23 = false
	Spot24 = false
	Spot25 = false
	DeletePed(Pimp)
	DeletePed(women1)
	DeletePed(women2)
	DeletePed(women11)
	DeletePed(women22)
	DeletePed(women33)
	DeletePed(women111)
	DeletePed(women222)
	DeletePed(women333)
end)

RegisterNetEvent('lto_houserobbery:FAIL')
AddEventHandler('lto_houserobbery:FAIL', function()
    local _source = source
	TriggerEvent("vorp:Tip", Config.Language.failtime, 4000)
    Debuter = false
    Parler = false
    MaisonEnCour = false
    PorteMaison = false
    RobbingHouse = false
    RemoveBlip(blipBordel)
	EffacePorte(MPorteA)
	EffacePorte(MPorteB)
	EffacePorte(MPorteC)
	EffacePorte(MPorteD)
	EffacePorte(MPorteE)
	EffacePorte(MPorteF)
	EffacePorte(MPorteG)
	EffacePorte(GrilleA)
	EffacePorte(GrilleB)
	EffacePorte(GrilleC)
	EffacePorte(GrilleD)
	EffacePorte(GrilleE)	
	EffacePorte(GrilleF)
	EffacePorte(GrilleG)
	EffacePorte(GrilleH)
	EffacePorte(GrilleI)
	EffacePorte(GrilleJ)
	EffacePorte(GrilleK)
	EffacePorte(GrilleL)
	EffacePorte(GrilleM)
	EffacePorte(GrilleN)
	Spot1 = false
	Spot2 = false
	Spot3 = false
	Spot4 = false
	Spot5 = false
	Spot6 = false
	Spot7 = false
	Spot8 = false
	Spot9 = false
	Spot10 = false
	Spot11 = false
	Spot12 = false
	Spot13 = false
	Spot14 = false
	Spot15 = false
	Spot16 = false
	Spot17 = false
	Spot18 = false
	Spot19 = false
	Spot20 = false
	Spot21 = false
	Spot22 = false
	Spot23 = false
	Spot24 = false
	Spot25 = false
	DeletePed(Pimp)
	DeletePed(women1)
	DeletePed(women2)
	DeletePed(women11)
	DeletePed(women22)
	DeletePed(women33)
	DeletePed(women111)
	DeletePed(women222)
	DeletePed(women333)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
    Debuter = false
    Parler = false
    MaisonEnCour = false
    PorteMaison = false
    RobbingHouse = false
	timetocheckHouse = 0
    RemoveBlip(blipBordel)
	EffacePorte(MPorteA)
	EffacePorte(MPorteB)
	EffacePorte(MPorteC)
	EffacePorte(MPorteD)
	EffacePorte(MPorteE)
	EffacePorte(MPorteF)
	EffacePorte(MPorteG)
	EffacePorte(GrilleA)
	EffacePorte(GrilleB)
	EffacePorte(GrilleC)
	EffacePorte(GrilleD)
	EffacePorte(GrilleE)	
	EffacePorte(GrilleF)
	EffacePorte(GrilleG)
	EffacePorte(GrilleH)
	EffacePorte(GrilleI)
	EffacePorte(GrilleJ)
	EffacePorte(GrilleK)
	EffacePorte(GrilleL)
	EffacePorte(GrilleM)
	EffacePorte(GrilleN)
	Spot1 = false
	Spot2 = false
	Spot3 = false
	Spot4 = false
	Spot5 = false
	Spot6 = false
	Spot7 = false
	Spot8 = false
	Spot9 = false
	Spot10 = false
	Spot11 = false
	Spot12 = false
	Spot13 = false
	Spot14 = false
	Spot15 = false
	Spot16 = false
	Spot17 = false
	Spot18 = false
	Spot19 = false
	Spot20 = false
	Spot21 = false
	Spot22 = false
	Spot23 = false
	Spot24 = false
	Spot25 = false
	DeletePed(Pimp)
	DeletePed(women1)
	DeletePed(women2)
	DeletePed(women11)
	DeletePed(women22)
	DeletePed(women33)
	DeletePed(women111)
	DeletePed(women222)
	DeletePed(women333)
	end
end)