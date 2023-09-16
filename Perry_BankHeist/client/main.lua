local started = false
local missionInProgress = false
local itemDynamiteprop
local missionInProgress = false
local missionCompleted = false
local StoleDynamiteParts = false
local IsLockPicked = false
local KillGuardsText = false
local CraftDynamites = false
local CraftetDynamite = false
local Blowedynamite = false
local speaked = false
local maksettu = false
local b1 = nil

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 2676.01, -1237.43, 53.28, true)
		if betweencoords < 2.0 and speaked == false then
			DrawTxt("Appuyer sur [~e~ENTRER~q~] Pour Parler", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
				speaked = true
				started = true
				TriggerServerEvent("Perry_Heist:tekstit", function() 
			end)
			end
		end
	end
end)

RegisterNetEvent('Perry_Heist:maksateksti')
AddEventHandler('Perry_Heist:maksateksti', function()	
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, 2676.01, -1237.43, 53.28, true)
		if betweencoords < 2.0 and maksettu == false and started == true then
			DrawTxt("Appuyer sur [~e~ENTRER~q~] Pour Parler", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
				started = true
				maksettu = true
				TriggerServerEvent("Perry_Heist:otanevitunrahat", function() 
			end)
			end
		end
	end
end)

RegisterNetEvent('Perry_Heist:gpskoordit')
AddEventHandler('Perry_Heist:gpskoordit', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if started == true then
		DrawTxt("Rendez-vous à l'endroit marqué sur votre carte", 0.50, 0.50, 0.7, 0.7, true, 255, 255, 255, 255, true)
		Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
		Citizen.InvokeNative(0x64C59DD6834FA942, 2670.55, -1552.04, 46.46)
		Citizen.InvokeNative(0x4426D65E029A4DC0, true)
		TriggerEvent("Perry_Heist:npcspawn", function() 
	end)
	end
end)

function deletedoor()
	local entity = modeltodelete
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		modeltodelete = nil
	end
	modeltodelete = nil
end

function deletedoor2()
	local entity = modeltodelete2
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		modeltodelete2 = nil
	end
	modeltodelete2 = nil
end

function deletedoor3()
	local entity = modeltodelete3
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		modeltodelete3 = nil
	end
	modeltodelete3 = nil
end

function deletedoor4()
	local entity = modeltodelete4
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		modeltodelete4 = nil
	end
	modeltodelete4 = nil
end

--RegisterCommand('tykki', function(source)
 --   TriggerEvent('Perry_Heist:npcspawn')
--end)

RegisterNetEvent('Perry_Heist:npcspawn')
AddEventHandler('Perry_Heist:npcspawn', function()
	local playerPed = PlayerPedId()
	
	RequestModel(GetHashKey('gatling_gun'))
	while not HasModelLoaded(GetHashKey('gatling_gun')) do
		Citizen.Wait(0)
	end
	
	Cannon = CreateVehicle(GetHashKey('gatling_gun'), 994.948, -6750.226, 63.19, 160.835, true, false)
	SetEntityAsMissionEntity(Cannon)
	SetEntityHeading(Cannon, 160.83)

	local taken = false
	local coords = false
	
	RequestModel("s_m_m_valdeputy_01")
	while not HasModelLoaded("s_m_m_valdeputy_01") do
		Wait(10)
	end
	
	local object = CreateObject(212892441, 1004.13, -6742.32, 57.60, true, false, false, 0, 0)
	local object2 = CreateObject(212892441, 1005.13, -6742.25, 57.60, true, false, false, 0, 0)
	local object3 = CreateObject(212892441, 1005.13, -6742.25, 59.60, true, false, false, 0, 0)
	local object4 = CreateObject(212892441, 1004.13, -6742.32, 59.60, true, false, false, 0, 0)
	local npc1 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 997.401, -6741.511, 57.40, 259.74, true, false, 0, 0)
	local npc2 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 1000.674, -6752.747, 62.20, 139.494, true, false, 0, 0)
	local npc3 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 991.492, -6769.651, 49.90, 157.06, true, false, 0, 0)
	local npc4 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 982.577, -6770.771, 48.90, 190.31, true, false, 0, 0)
	local npc5 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 981.479, -6792.109, 48.90, 154.19, true, false, 0, 0)
	local npc6 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 982.840, -6803.474, 48.90, 68.10, true, false, 0, 0)
	local npc7 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 1015.388, -6746.457, 66.13, 117.84, true, false, 0, 0)
	local npc8 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 982.555, -6743.401, 54.85, 161.72, true, false, 0, 0)
	local npc9 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 987.601, -6748.971, 62.14, 159.78, true, false, 0, 0)
	local npc10 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 990.281, -6783.518, 40.70, 178.84, true, false, 0, 0)
	local npc11 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 952.519, -6853.485, 55.30, 220.09, true, false, 0, 0)
	local npc12 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 966.568, -6763.002, 42.45, 198.06, true, false, 0, 0)
	local npc13 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 993.156, -6727.797, 57.40, 148.49, true, false, 0, 0)
	local npc14 = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 989.704, -6755.877, 54.85, 162.36, true, false, 0, 0)
	local CannonNPC = CreatePed(GetHashKey("s_m_m_valdeputy_01"), 997.346, -6746.041, 62.19, 163.83, true, false, 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, npc1, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc2, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc3, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc4, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc5, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc6, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc7, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc8, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc9, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc10, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc11, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc12, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc13, true)
	Citizen.InvokeNative(0x283978A15512B2FE, npc14, true)
	Citizen.InvokeNative(0x283978A15512B2FE, CannonNPC, true)
	Citizen.InvokeNative(0xF166E48407BAC484, npc1, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc2, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc3, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc4, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc5, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc6, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc7, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc8, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc9, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc10, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc11, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc12, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc13, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, npc14, PlayerPedId(), 0, 0)
	Citizen.InvokeNative(0xF166E48407BAC484, CannonNPC, PlayerPedId(), 0, 0)
	GiveWeaponToPed_2(npc1, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc2, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc3, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc4, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc5, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc6, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc7, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc8, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc9, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc10, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc11, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc12, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc13, 0x64356159, 500, true, 1, false, 0.0)
	GiveWeaponToPed_2(npc14, 0x64356159, 500, true, 1, false, 0.0)
	SetPedIntoVehicle(CannonNPC, Cannon, -1)
	SetPedCombatAttributes(npc1, 46, 1)
	SetPedCombatAttributes(npc2, 46, 1)
	SetPedCombatAbility(npc1, 100)
	SetPedCombatAbility(npc2, 100)
	SetPedCombatMovement(npc1, 2)
	SetPedCombatMovement(npc2, 2)
	SetPedCombatRange(npc1, 2)
	SetPedCombatRange(npc2, 2)
	SetPedCombatRange(CannonNPC, 200)
	SetPedKeepTask(npc1, true)
	SetPedKeepTask(npc2, true)
	local playerPed = PlayerPedId()
	AddRelationshipGroup('NPC')
	AddRelationshipGroup('PlayerPed')
	SetPedRelationshipGroupHash(npc1, 'NPC')
	SetPedRelationshipGroupHash(npc2, 'NPC')
	SetPedRelationshipGroupHash(npc3, 'NPC')
	SetPedRelationshipGroupHash(npc4, 'NPC')
	SetPedRelationshipGroupHash(npc5, 'NPC')
	SetPedRelationshipGroupHash(npc6, 'NPC')
	SetPedRelationshipGroupHash(npc7, 'NPC')
	SetPedRelationshipGroupHash(npc8, 'NPC')
	SetPedRelationshipGroupHash(npc9, 'NPC')
	SetPedRelationshipGroupHash(npc10, 'NPC')
	SetPedRelationshipGroupHash(npc11, 'NPC')
	SetPedRelationshipGroupHash(npc12, 'NPC')
	SetPedRelationshipGroupHash(npc13, 'NPC')
	SetPedRelationshipGroupHash(npc14, 'NPC')
	SetPedRelationshipGroupHash(CannonNPC, 'NPC')
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, npc1)

	SetPedAsCop(npc1, true)
	SetPedAsCop(npc2, true)
	modeltodelete = object
	modeltodelete2 = object2
	modeltodelete3 = object3
	modeltodelete4 = object4
	
	missionInProgress = true
		
	while not taken do
		Citizen.Wait(3)
		
		if missionInProgress == true then
			local pos = GetEntityCoords(GetPlayerPed(), false)
			local distancedoor = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, 1004.058, -6742.708, 58.793, false)
						
			local playerPed = PlayerPedId()
			local playerdead = IsPlayerDead(playerped)
			if playerdead then
				DrawTxt("Mission failed", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				taken = true
				missionInProgress = false
				missionCompleted = false
				StoleDynamiteParts = false
				IsLockPicked = false
				KillGuardsText = false
				deletedoor()
				deletedoor2()
				deletedoor3()
				deletedoor4()
				speaked = false
				maksettu = false
				break
			end
			
			if distancedoor <= 2.0 and IsLockPicked == false then
				DrawTxt("Appuyer Sur [ENTRER]", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0xC7B5340A) then
					LockPickIt()
					Citizen.Wait(500)
				end
			end
		end
		
		if StoleDynamiteParts == true then
			local pos = GetEntityCoords(PlayerPedId())
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, 996.49, -6745.70, 58.31, false)

			if distance > 5.0 then
			Citizen.Wait(500)
			end
			
			if distance <= 2.0 then
				DrawTxt("Appuyez sur [~e~ENTRER~q~] pour sélectionner les ingrédients", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0xC7B5340A) then
					StoleDynamiteParts = false
					RobbingTheParts()
					Citizen.Wait(500)
				end
			end
		end
		
		if CraftDynamites == true then
			local pos = GetEntityCoords(PlayerPedId())
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, -2396.80, -2378.01, 60.28, false)

			if distance > 5.0 then
			Citizen.Wait(500)
			end
			
			if distance <= 2.0 then
				DrawTxt("Appuyez sur [~e~ENTER~q~] pour faire de la dynamite", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0xC7B5340A) then
					CraftDynamites = false
					CraftDynamite()
					Citizen.Wait(500)
				end
			end
		end

		if CraftetDynamite == true then
			local pos = GetEntityCoords(PlayerPedId())
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, -309.06, 763.95, 118.70, false)

			if distance > 2.0 then
			Citizen.Wait(500)
			end
			
			if distance <= 1.0 then
				DrawTxt("Appuyez sur [~e~ENTER~q~] pour placer la dynamite", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0xC7B5340A) then
					CraftetDynamite = false
					BlowDynamite()
					Citizen.Wait(500)
				end
			end
		end
		
		if Blowedynamite == true then
			local pos = GetEntityCoords(PlayerPedId())
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, -309.06, 763.95, 118.70, false)

			if distance > 2.0 then
			Citizen.Wait(500)
			end
			
			if distance <= 2.0 then
				DrawTxt("Appuyez sur [~e~ENTER~q~] pour cambrioler une banque", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if IsControlJustReleased(0, 0xC7B5340A) then
					Blowedynamite = false
					MissionEnd()
					Citizen.Wait(500)
				end
			end
		end
		
		if missionCompleted == true then
			taken = true
			missionInProgress = false
			missionCompleted = false
			StoleDynamiteParts = false
			IsLockPicked = false
			KillGuardsText = false
			CraftDynamites = false
			CraftetDynamite = false
			Blowedynamite = false
			deletedoor()
			deletedoor2()
			deletedoor3()
			deletedoor4()
			speaked = false
			maksettu = false
			break
		end
		
	end
end)

function RobbingTheParts()
	
	RequestAnimDict('amb_work@world_human_crouch_inspect@male_c@idle_a')
	while not HasAnimDictLoaded('amb_work@world_human_crouch_inspect@male_c@idle_a') do
		Citizen.Wait(50)
	end
	
	local playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(playerPed)
	
	TaskPlayAnim(PlayerPedId(), "amb_work@world_human_crouch_inspect@male_c@idle_a", "idle_c", 8.0, -8.0, -1, 1, 0, false, false, false)
	FreezeEntityPosition(playerPed, true)
	
	exports['progressBars']:startUI(5500, "Allons vérifier")
	Citizen.Wait(5500)
	
	DeleteEntity(moneyBag)
    ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(playerPed, false)
	
	TriggerServerEvent("Perry_Heist:RobComplete")
	
	CraftDynamites = true
	Citizen.Wait(1000)
	Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
	Citizen.InvokeNative(0x64C59DD6834FA942, -2396.92, -2377.96, 60.29)
	Citizen.InvokeNative(0x4426D65E029A4DC0, true)
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end

    return players
end



function MissionEnd()
	
	RequestAnimDict('amb_work@world_human_crouch_inspect@male_c@idle_a')
	while not HasAnimDictLoaded('amb_work@world_human_crouch_inspect@male_c@idle_a') do
		Citizen.Wait(50)
	end
	
	local playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(playerPed)
	
	TaskPlayAnim(PlayerPedId(), "amb_work@world_human_crouch_inspect@male_c@idle_a", "idle_c", 8.0, -8.0, -1, 1, 0, false, false, false)
	FreezeEntityPosition(playerPed, true)
	
	exports['progressBars']:startUI(100000, "RETRAIT D'ARGENT DANS LE SAC")
	Citizen.Wait(100000)
	
	DeleteEntity(moneyBag)
    ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(playerPed, false)
	
	
	TriggerServerEvent("Perry_Heist:missionComplete")
	
	
	--TriggerEvent("vorp:TipBottom", ' test ', 6500)
	--TriggerEvent("laporanSheriff") --notify
	
	
	missionCompleted = true
	Citizen.Wait(1000)
end

function BlowDynamite()
	
	RequestAnimDict('amb_work@world_human_crouch_inspect@male_c@idle_a')
	while not HasAnimDictLoaded('amb_work@world_human_crouch_inspect@male_c@idle_a') do
		Citizen.Wait(50)
		end
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemDynamiteprop = CreateObject(GetHashKey('p_dynamite01x'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itemDynamiteprop, playerPed, GetPedBoneIndex(playerPed, 54565), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskPlayAnim(playerPed, 'amb_work@world_human_crouch_inspect@male_c@idle_a', "idle_c", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			
	exports['progressBars']:startUI(5500, "la dynamite est réglementée")
	Citizen.Wait(5500)
			
	ClearPedTasks(playerPed)
	DetachEntity(itemDynamiteprop)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)
	
	
	
	exports['progressBars']:startUI(25000, "EXPLOSER")
	Citizen.Wait(25000)
			
	AddExplosion(-309.06, 763.95, 118.70, 25 , 5000.0 ,true , false , 27)
	Blowedynamite = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2)
	
	TriggerServerEvent("policenotify30", GetPlayers(), coords) -- averti les sherif		
	
end

function CraftDynamite()
	
	RequestAnimDict('amb_work@world_human_hammer@table@male_a@idle_b')
	while not HasAnimDictLoaded('amb_work@world_human_hammer@table@male_a@idle_b') do
		Citizen.Wait(50)
	end
	
	local playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(playerPed)
	
	TaskPlayAnim(PlayerPedId(), "amb_work@world_human_hammer@table@male_a@idle_b", "idle_d", 8.0, -8.0, 25000, 1, 0, false, false, false)
	FreezeEntityPosition(playerPed, true)
	
	exports['progressBars']:startUI(25000, "Loading")
	Citizen.Wait(25000)
	
	DeleteEntity(moneyBag)
    ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(playerPed, false)
	
	TriggerServerEvent("Perry_Heist:GiveDynamite")

	Citizen.Wait(3000)
	OmistajaNPC()
	
	CraftetDynamite = true
	Citizen.Wait(1000)
	Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
	Citizen.InvokeNative(0x64C59DD6834FA942, -308.22, 776.03, 118.70)
	Citizen.InvokeNative(0x4426D65E029A4DC0, true)
end

function OmistajaNPC()
	local playerPed = PlayerPedId()
	
	RequestModel("mp_g_m_m_bountyhunters_01")
	while not HasModelLoaded("mp_g_m_m_bountyhunters_01") do
		Wait(10)
	end
	
	local npc = CreatePed(GetHashKey("mp_g_m_m_bountyhunters_01"), -2366.62, -2391.60, 61.50, 72.93, true, false, 0, 0)
	Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
	Citizen.InvokeNative(0xF166E48407BAC484, npc, PlayerPedId(), 0, 0)
	GiveWeaponToPed_2(npc, 0x64356159, 500, true, 1, false, 0.0)
	SetPedCombatAttributes(npc, 46, 1)
	SetPedCombatAbility(npc, 100)
	SetPedCombatMovement(npc, 2)
	SetPedCombatRange(npc, 2)
	SetPedKeepTask(npc, true)
	p1 = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, npc)
	SetPedAsCop(npc, true)
end

function LockPickIt()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local distancetodoor = GetDistanceBetweenCoords(coords, 1006.411, -6747.251, 60.35, true)
	if distancetodoor > 2.0 and missionInProgress == true then
		IsLockPicked = true
			
		RequestAnimDict('script_common@jail_cell@unlock@key')
		while not HasAnimDictLoaded('script_common@jail_cell@unlock@key') do
			Citizen.Wait(50)
		end
			
		local playerPed = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		itemDynamiteprop = CreateObject(GetHashKey('P_KEY02X'), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(itemDynamiteprop, playerPed, GetPedBoneIndex(playerPed, 41308), 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
		SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
		Citizen.Wait(700)
		FreezeEntityPosition(playerPed, true)
		TaskPlayAnim(playerPed, 'script_common@jail_cell@unlock@key', "action", 8.0, -8.0, 25000, 31, 0, true, 0, false, 0, false)

		exports['progressBars']:startUI(25000, "Lockpicking")
		Citizen.Wait(25000)

		ClearPedTasks(playerPed)
		DetachEntity(itemDynamiteprop)
		FreezeEntityPosition(playerPed, false)
		Citizen.Wait(500)
		
		ClearPedTasks(playerPed)
		DetachEntity(itemDynamiteprop)
			
		DrawTxt("allez dans la chambre et poser la dynamite", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
		StoleDynamiteParts = true
		deletedoor()
		deletedoor2()
		deletedoor3()
		deletedoor4()
	else
		DrawTxt("Vous n'avez pas tué tous les gardes", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
	end
end

Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("re_coachrobbery_females_01") ) do
        Wait(500)
        RequestModel( GetHashKey("re_coachrobbery_females_01") )
    end
    local npc = CreatePed(GetHashKey("re_coachrobbery_females_01"), 2675.51, -1237.48, 52.30, 292.83, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("re_coachrobbery_females_01"))
end)

function DrawTxt(text,x,y)
    SetTextScale(0.35,0.35)
    SetTextColor(255,255,255,255)--r,g,b,a
    SetTextCentre(true)
    SetTextDropshadow(1,0,0,0,200)
    SetTextFontForCurrentCommand(0)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end
--[[
RegisterNetEvent('laporanSheriff')
AddEventHandler('laporanSheriff', function()	
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
	TriggerServerEvent("policenotify30", GetPlayers(), coords) -- averti les sherif
end)
  --]]  
------Police notify-------
RegisterNetEvent("PosisiPerompak")
AddEventHandler("PosisiPerompak", function(coords)
	TriggerEvent("vorp:TipBottom", 'Quelqu un a reussi a voler', 6500)
	local blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, coords.x, coords.y, coords.z, 50.0)
	Wait(30000)--Time till notify blips dispears, 1 min
	RemoveBlip(blip)
end)

RegisterNetEvent("Witness:ToggleNotification30")
AddEventHandler("Witness:ToggleNotification30", function(coords)
	::restart::
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
   TriggerEvent("vorp:TipBottom", 'Les voleurs sont en fuite', 6500)
	local blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, coords, 5.0) -- LOCAL FIXO
	
	Wait(30000)--Time till notify blips dispears, 1/2 min
	RemoveBlip(blip)
end)


RegisterNetEvent("Witness:ToggleNotification40")
AddEventHandler("Witness:ToggleNotification40", function(coords)
	::restart::
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
    TriggerEvent("vorp:TipBottom", 'Les voleurs sont en fuite', 6500)
	local blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, coords, 5.0) -- LOCAL FIXO
	
	Wait(30000)--Time till notify blips dispears, 1/2 min
	RemoveBlip(blip)
end)


RegisterNetEvent("Witness:ToggleNotification50")
AddEventHandler("Witness:ToggleNotification50", function(coords)
	::restart::
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
   TriggerEvent("vorp:TipBottom", 'Les voleurs sont en fuite', 6500)
	local blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, coords, 5.0) -- LOCAL FIXO
	
	Wait(100000)--Time till notify blips dispears, 1-2 min
	RemoveBlip(blip)
end)