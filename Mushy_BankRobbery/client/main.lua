local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core 
end)


local robtime = 140
local timerCount = robtime
local isRobbing = false
local timers = false
local speaked = false
local started = false
local maksettu = false
local Blowedynamite = false
local missionCompleted = false

local isCooldown = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local betweencoords = GetDistanceBetweenCoords(coords, -405.08, 664.26, 115.38, true)
        
        if betweencoords < 2.0 and speaked == false then
            DrawTxt("Appuyez sur [~e~ENTRER~q~] pour démarrer la mission", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
            
            if IsControlJustReleased(0, 0xC7B5340A) then
                if Config.Cooldown ~= nil and Config.Cooldown > 0 then
                    if isCooldown then
                        VORPcore.NotifyRightTip("Vous devez attendre un certain temps avant de pouvoir démarrer une nouvelle mission.", 6000)
                    else
                        speaked = true
                        started = true
                        TriggerServerEvent("mushy_robbery:talk")
                        isCooldown = true
                        Citizen.SetTimeout(Config.Cooldown * 1000, function()
                            isCooldown = false
                        end)
                    end
                else
                    speaked = true
                    started = true
                    TriggerServerEvent("mushy_robbery:talk")
                end
            end
        end
    end
end)


RegisterNetEvent('mushy_robbery:info')
AddEventHandler('mushy_robbery:info', function()	
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,-405.08, 664.26, 115.38, true)
		if betweencoords < 2.0 and maksettu == false and started == true then
			DrawTxt(" Appuyer sur [~e~ENTRER~q~] pour accepter ", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
            started = true
		    maksettu = true 
            isRobbing = true        
			TriggerServerEvent("mushy_robbery:pay", function()                
			end)
			end
		end
	end
end)

RegisterNetEvent('mushy_robbery:go')
AddEventHandler('mushy_robbery:go', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if started == true then
		DrawTxt("Aller ici", 0.50, 0.50, 0.7, 0.7, true, 255, 255, 255, 255, true)
		Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
		Citizen.InvokeNative(0x64C59DD6834FA942, 1290.0882568359, -1312.4019775391, 76.039939880371)
		Citizen.InvokeNative(0x4426D65E029A4DC0, true) 
		Wait(3000)
		
	end
end)

RegisterNetEvent("Witness:ToggleNotification2")
AddEventHandler("Witness:ToggleNotification2", function(coords, alert)
	--print('store name '..tostring(alert))
	TriggerEvent("vorp:TipBottom", 'Vous avez recu un telegram qui vous informe d un braquage de banque ' .. alert, 15000)
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

local function spawnPolice()
    while not HasModelLoaded(GetHashKey("s_m_m_valdeputy_01")) do
        Wait(1000)
        RequestModel(GetHashKey("s_m_m_valdeputy_01"))
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('NPC')
    AddRelationshipGroup('PlayerPed')
    for k, v in pairs(Config.npcspawn) do
        local pedy = CreatePed(GetHashKey("s_m_m_valdeputy_01"), v.x, v.y, v.z, 0, true, false, 0, 0)
        SetPedRelationshipGroupHash(pedy, 'NPC')
        GiveWeaponToPed_2(pedy, 0x64356159, 500, true, 1, false, 0.0)
        Citizen.InvokeNative(0x283978A15512B2FE, pedy, true)
        Citizen.InvokeNative(0xF166E48407BAC484, pedy, playerPed, 0, 0)
        Config.npcspawn[k].NPC = pedy
        TaskCombatPed(pedy, playerPed, 0, 16)
    end
end


local function spawnPolice2()
    while not HasModelLoaded(GetHashKey("s_m_m_valdeputy_01")) do
        Wait(1000)
        RequestModel(GetHashKey("s_m_m_valdeputy_01"))
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('NPC')
    AddRelationshipGroup('PlayerPed')
    for k, v in pairs(Config.npcspawn) do
        local pedy = CreatePed(GetHashKey("s_m_m_valdeputy_01"), v.x, v.y, v.z, 0, true, false, 0, 0)
        SetPedRelationshipGroupHash(pedy, 'NPC')
        GiveWeaponToPed_2(pedy, 0x64356159, 500, true, 1, false, 0.0)
        Citizen.InvokeNative(0x283978A15512B2FE, pedy, true)
        Citizen.InvokeNative(0xF166E48407BAC484, pedy, playerPed, 0, 0)()
        Config.npcspawn[k].NPC = pedy
        TaskCombatPed(pedy, playerPed, 0, 16)
    end
end

--Robbery startpoint

Citizen.CreateThread(function() 
    while true do
    Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local betweencoords = GetDistanceBetweenCoords(coords,1287.72, -1313.52, 76.039939880371, true)
        if betweencoords < 2.0 and isRobbing == true then
            DrawTxt(Config.rob, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)                
            if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = false 
                TriggerServerEvent("mushy_robbery:startrobbery", Config.Policealert)
                Wait(Config.Policealert)
                local alert = Config.Banks[1].name      
                TriggerServerEvent("policenotify", nil, coords, alert)
                Wait(5000)
                spawnPolice()
            end
        end
    end
end)

-- RegisterNetEvent('mushy_robbery:startAnimation2')
-- AddEventHandler('mushy_robbery:startAnimation2', function(num,typey)	
-- 	local _source = source
-- 	local playerPed = PlayerPedId()
-- 	local coords = GetEntityCoords(playerPed)
--     local testplayer = exports["syn_minigame"]:taskBar(4000,7)
--     local testplayer2
--     local testplayer3
--     local testplayer4
--     Wait(1000)
--     if testplayer == 100 then
--     testplayer2 = exports["syn_minigame"]:taskBar(3500,7)
--     end
--     Wait(1000)
--     if testplayer2 == 100 then
--     testplayer3 = exports["syn_minigame"]:taskBar(3200,7)
--     end
--     Wait(1000)
--     if testplayer3 == 100 then
--     testplayer4 = exports["syn_minigame"]:taskBar(2900,7)
--     end
--     if testplayer4 == 100 then   
-- 	BlowDynamite()
--     TriggerServerEvent("mushy_robbery:loot", function()
-- 		Citizen.Wait(1000)
--         maksettu = false 
--         started = true
--         Blowedynamite = true                
--     end)                
--     elseif not testplayer then 
--     Blowedynamite = false 
--     isRobbing = false
--     speaked = false
--     started = false
--     maksettu = false     
-- 	Citizen.Wait(6000)
-- 	ClearPedTasksImmediately(PlayerPedId())
-- 	ClearPedSecondaryTask(PlayerPedId())  
-- 	Citizen.Wait(1000)
--     spawnPolice2()
--     Citizen.Wait(1000)
--     VORPcore.NotifyRightTip("Vous venez de raté le braquage! barrez vous",6000)	
--     end        
-- end)


RegisterNetEvent('mushy_robbery:startAnimation2')
AddEventHandler('mushy_robbery:startAnimation2', function(num, typey)	
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local testplayer = exports["syn_minigame"]:taskBar(4000, 7)
	local testplayer2
	local testplayer3
	local testplayer4
	Wait(1000)
	if testplayer == 100 then
		testplayer2 = exports["syn_minigame"]:taskBar(3500, 7)
	end
	Wait(1000)
	if testplayer2 == 100 then
		testplayer3 = exports["syn_minigame"]:taskBar(3200, 7)
	end
	Wait(1000)
	if testplayer3 == 100 then
		testplayer4 = exports["syn_minigame"]:taskBar(2900, 7)
	end
	if testplayer4 == 100 then   
		BlowDynamite()
		TriggerServerEvent("mushy_robbery:loot", function()
			Citizen.Wait(1000)
			maksettu = false 
			started = true
			Blowedynamite = true                
		end)                
	elseif not testplayer or not testplayer2 or not testplayer3 or not testplayer4 then 
		Blowedynamite = false 
		isRobbing = false
		speaked = false
		started = false
		maksettu = false
		Citizen.Wait(6000)
		ClearPedTasksImmediately(PlayerPedId())
		ClearPedSecondaryTask(PlayerPedId())
		Citizen.Wait(1000)
		spawnPolice2()
        VORPcore.NotifyRightTip("Vous venez de raté le braquage! fuyez",6000)	
	end        
end)

RegisterNetEvent('mushy_robbery:loot2')
AddEventHandler('mushy_robbery:loot2', function()	
	while true do
		Citizen.Wait(0)
        local _source = source    
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,1287.72, -1313.52, 76.039939880371, true)
		if betweencoords < 2.0 and Blowedynamite == true then
			DrawTxt("Appuyez sur [~e~ENTRER~q~] pour prendre le butin", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
              TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 6000, true, false, false, false)
	          exports['progressBars']:startUI(Config.LockpickTime, "Vous cherchez le butin")			  
              Blowedynamite = false 
              isRobbing = false
              speaked = false
              started = false
              maksettu = false 
              spawnPolice2()
			  TriggerServerEvent("mushy_robbery:payout")    
			  Citizen.Wait(6000)
			  Citizen.Wait(35000)
			  ClearPedTasksImmediately(PlayerPedId())
			  ClearPedSecondaryTask(PlayerPedId())			  
			end
		end
	end
end) 

Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("CS_johnmarston") ) do
        Wait(500)
        RequestModel( GetHashKey("CS_johnmarston") )
    end
    local npc = CreatePed(GetHashKey("CS_johnmarston"), -404.98327636719, 663.14361572266, 114.55465698242, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("CS_johnmarston"))
end)

function DrawTxt(text,x,y)
    SetTextScale(0.35,0.35)
    SetTextColor(255,255,255,255)--r,g,b,a
    SetTextCentre(true)
    SetTextDropshadow(1,0,0,0,200)
    SetTextFontForCurrentCommand(0)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

Citizen.CreateThread(function()
   local blip = N_0x554d9d53f696d002(1664425300,-404.98327636719, 663.14361572266, 114.55465698242)
    SetBlipSprite(blip, 90287351, 1)
         Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Start Bank Heist") 
 end)

function BlowDynamite()			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemDynamiteprop = CreateObject(GetHashKey('p_dynamite01x'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itemDynamiteprop, playerPed, GetPedBoneIndex(playerPed, 54565), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 15000, true, false, false, false)			
	exports['progressBars']:startUI(5500, "Vous placez la dynamite")
	Citizen.Wait(5500)		
	ClearPedTasks(playerPed)
	DetachEntity(itemDynamiteprop)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)	
	exports['progressBars']:startUI(25000, "La dynamite vas peter! Mettez vous a couvert")
	Citizen.Wait(25000)			
	AddExplosion(1287.72, -1313.52, 76.039939880371, 25 , 5000.0 ,true , false , 27)
	Blowedynamite = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2)
end