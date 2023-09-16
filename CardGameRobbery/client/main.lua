local robtime = 140 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local timers = false
local speaked = false
local started = false
local maksettu = false
local Blowedynamite = false
local missionCompleted = false



local function spawnPolice3()
    while not HasModelLoaded( GetHashKey("mp_g_m_m_redbengang_01") ) do
        Wait(500)
        RequestModel( GetHashKey("mp_g_m_m_redbengang_01") )
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('NPC')
    AddRelationshipGroup('PlayerPed')
    for k,v in pairs(Config.npcspawn) do
        local pedy = CreatePed(GetHashKey("mp_g_m_m_redbengang_01"),v.x,v.y,v.z,0, true, false, 0, 0)
        SetPedRelationshipGroupHash(pedy, 'NPC')
        GiveWeaponToPed_2(pedy, 0x64356159, 500, true, 1, false, 0.0)
        Citizen.InvokeNative(0x283978A15512B2FE, pedy, true)
        Citizen.InvokeNative(0xF166E48407BAC484, pedy, PlayerPedId(), 0, 0)
        FreezeEntityPosition(pedy, false)
        Config.npcspawn[k].NPC = pedy
        TaskCombatPed(pedy,playerped, 0, 16)

    end
end

local function spawnPolice4()
    while not HasModelLoaded( GetHashKey("S_M_M_AmbientSDPolice_01") ) do
        Wait(500)
        RequestModel( GetHashKey("S_M_M_AmbientSDPolice_01") )
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('NPC')
    AddRelationshipGroup('PlayerPed')
    for k,v in pairs(Config.npcspawn2) do
        local pedy = CreatePed(GetHashKey("S_M_M_AmbientSDPolice_01"),v.x,v.y,v.z,0, true, false, 0, 0)
        SetPedRelationshipGroupHash(pedy, 'NPC')
        GiveWeaponToPed_2(pedy, 0x64356159, 500, true, 1, false, 0.0)
        Citizen.InvokeNative(0x283978A15512B2FE, pedy, true)
        Citizen.InvokeNative(0xF166E48407BAC484, pedy, PlayerPedId(), 0, 0)
        FreezeEntityPosition(pedy, false)
        Config.npcspawn2[k].NPC = pedy
        TaskCombatPed(pedy,playerped, 0, 16)

    end
end
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,3296.060546875, -1301.023193359375, 46.79790115356445, true)
		if betweencoords < 2.0 and speaked == false then
			DrawTxt(" PRESS [~e~ENTER~q~] TO START ", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
				speaked = true
                started = true    
				TriggerServerEvent("mushy_robbery:talk3", function() 
			end)
			end
		end
	end
end)

RegisterNetEvent('mushy_robbery:info3')
AddEventHandler('mushy_robbery:info3', function()	
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,3296.060546875, -1301.023193359375, 46.79790115356445, true)
		if betweencoords < 2.0 and maksettu == false and started == true then
			DrawTxt(" PRESS [~e~ENTER~q~] ACCEPT ", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then

            started = true
		    maksettu = true 
            isRobbing = true    
               
			TriggerServerEvent("mushy_robbery:pay3", function() 
              
                             
			end)
			end
		end
	end
end)

RegisterNetEvent('mushy_robbery:go3')
AddEventHandler('mushy_robbery:go3', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if started == true then
		DrawTxt("GO HERE", 0.50, 0.50, 0.7, 0.7, true, 255, 255, 255, 255, true)
		Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
		Citizen.InvokeNative(0x64C59DD6834FA942, 2709.351806640625, -1294.3255615234375, 60.33774185180664)
		Citizen.InvokeNative(0x4426D65E029A4DC0, true) 
		
	end
end)

RegisterNetEvent("Witness:ToggleNotification3")
AddEventHandler("Witness:ToggleNotification3", function(coords, alert)
	--print('store name '..tostring(alert))
	TriggerEvent("vorp:TipBottom", 'Telegram of Loud Explosion at ' .. alert, 15000)
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
        local betweencoords = GetDistanceBetweenCoords(coords,2716.97265625, -1282.83203125, 60.34485244750976, true)
        if betweencoords < 2.0 and isRobbing == true then
            DrawTxt(Config.rob, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
                
            if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = false 
                   
                TriggerServerEvent("mushy_robbery:startrobbery3", Config.Policealert)
                Wait(Config.Policealert)
                Wait(1000)
                spawnPolice3() 
                Wait(45000)

                local alert = Config.Banks[1].name      
                TriggerServerEvent("policenotify3", nil, coords, alert)
                Wait(3000)
               
                
                
            end
        end
    end
end)

RegisterNetEvent('mushy_robbery:startAnimation3')
AddEventHandler('mushy_robbery:startAnimation3', function(num,typey)	
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
    local testplayer = exports["syn_minigame"]:taskBar(4000,7)
    local testplayer2
    local testplayer3
    local testplayer4
    Wait(1000)
    if testplayer == 100 then
    testplayer2 = exports["syn_minigame"]:taskBar(3500,7)
    end
    Wait(1000)
    if testplayer2 == 100 then
    testplayer3 = exports["syn_minigame"]:taskBar(3200,7)
    end
    Wait(1000)
    if testplayer3 == 100 then
    testplayer4 = exports["syn_minigame"]:taskBar(2900,7)
    end
    if testplayer4 == 100 then   
	BlowDynamite()
    TriggerServerEvent("mushy_robbery:loot3", function()
		Citizen.Wait(1000)  
	
	
    maksettu = false 
    started = true
    Blowedynamite = true                
    end)                
    elseif not testplayer then 
    Blowedynamite = false 
    isRobbing = false
    speaked = false
    started = false
    maksettu = false     
	Citizen.Wait(6000)
	ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())  
	Citizen.Wait(1000)  
	
    end        
end)

RegisterNetEvent('mushy_robbery:loot4')
AddEventHandler('mushy_robbery:loot4', function()	
	while true do
		Citizen.Wait(0)
        local _source = source    
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,2716.97265625, -1282.83203125, 60.34485244750976, true)
		if betweencoords < 2.0 and Blowedynamite == true then
			DrawTxt("Press [~e~ENTER~q~] to take loot", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
              TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 6000, true, false, false, false)
	          exports['progressBars']:startUI(Config.LockpickTime, "Getting The Safe Loot...")
			  
              Blowedynamite = false 
              isRobbing = false
              speaked = false
              started = false
              maksettu = false 
              spawnPolice4()
                Citizen.Wait(6000)
			  ClearPedTasksImmediately(PlayerPedId())
			  ClearPedSecondaryTask(PlayerPedId())
			  TriggerServerEvent("mushy_robbery:payout3")
			end
		end
	end
end)
              
            


Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("CS_CIGCARDGUY") ) do
        Wait(500)
        RequestModel( GetHashKey("CS_CIGCARDGUY") )
    end
    local npc = CreatePed(GetHashKey("CS_CIGCARDGUY"), 3296.060546875, -1301.023193359375, 45.79790115356445, 89.19, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("CS_CIGCARDGUY"))
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
   local blip = N_0x554d9d53f696d002(1664425300,3296.060546875, -1301.023193359375, 46.79790115356445)
    SetBlipSprite(blip, 90287351, 1)
         Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Start Card Game Robbery") 
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
			
	exports['progressBars']:startUI(5500, "PLACING DYNAMITE")
	Citizen.Wait(5500)
		
	ClearPedTasks(playerPed)
	DetachEntity(itemDynamiteprop)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)
	
	
	
	exports['progressBars']:startUI(25000, "DYNAMITE LIT STAND BACK")
	Citizen.Wait(25000)
			
	AddExplosion(2716.52880859375, -1283.31884765625, 60.36137390136719, 25 , 5000.0 ,true , false , 27)
	Blowedynamite = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2) 
    
    
	
end