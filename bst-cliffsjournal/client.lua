local robtime = 140 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local timers = false
local speaked = false
local started = false
local maksettu = false
local placedbait = false
local missionCompleted = false
local isOver = false
local spawned_bear 
local finished = false

local function spawnWolfs()
    while not HasModelLoaded( GetHashKey("A_C_Wolf") ) do
        Wait(500)
        RequestModel( GetHashKey("A_C_Wolf") )
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('animal')
    AddRelationshipGroup('PlayerPed')
    for k,v in pairs(Config.npcspawn) do
        local animal = CreatePed(GetHashKey("A_C_Wolf"),v.x,v.y,v.z,0, true, false, 0, 0)
        SetPedRelationshipGroupHash(animal, 'animal')       
        Citizen.InvokeNative(0x283978A15512B2FE, animal, true)
        Citizen.InvokeNative(0xF166E48407BAC484, animal, PlayerPedId(), 0, 0)
        FreezeEntityPosition(animal, false)
        Config.npcspawn[k].animal = animal
        TaskCombatPed(animal, playerped, 0, 16)

    end
end

local function spawnWolfs2()
    while not HasModelLoaded( GetHashKey("A_C_Wolf") ) do
        Wait(500)
        RequestModel( GetHashKey("A_C_Wolf") )
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('animal')
    AddRelationshipGroup('PlayerPed')
    for k,v in pairs(Config.npcspawn2) do
        local animal = CreatePed(GetHashKey("A_C_Wolf"),v.x,v.y,v.z,0, true, false, 0, 0)
        SetPedRelationshipGroupHash(animal, 'animal')        
        Citizen.InvokeNative(0x283978A15512B2FE, animal, true)
        Citizen.InvokeNative(0xF166E48407BAC484, animal, PlayerPedId(), 0, 0)
        FreezeEntityPosition(animal, false)
        Config.npcspawn2[k].animal = animal
        TaskCombatPed(animal, playerped, 0, 16)

    end
end
local function spawnBear()
    local bearmodel = "A_C_Bear_01"
    local hash_bearmodel = GetHashKey(bearmodel)
    RequestModel( hash_bearmodel )
    while not HasModelLoaded( hash_bearmodel ) do
        Wait(500)
    end
    local playerPed = PlayerPedId()
    AddRelationshipGroup('bear')
    AddRelationshipGroup('PlayerPed')
    local rand = math.random(1, #Config.npcspawn3)
    local spawnpos = Config.npcspawn3[rand]
    local bear = CreatePed(bearmodel,spawnpos.x,spawnpos.y,spawnpos.z,0, true, false, 0, 0)
	SetPedRelationshipGroupHash(bear, 'bear')	
	Citizen.InvokeNative(0x283978A15512B2FE, bear, true)
	Citizen.InvokeNative(0xF166E48407BAC484, bear, PlayerPedId(), 0, 0)
	FreezeEntityPosition(bear, false)
	Config.npcspawn3[rand].animal = bear
	TaskCombatPed(bear, playerped, 0, 16)
	SetEntityAsMissionEntity(bear, true, true)
	setPetBehavior(bear)
    return bear
end
function setPetBehavior (bear)
	SetRelationshipBetweenGroups(5, GetPedRelationshipGroupHash(bear), GetHashKey('PLAYER'))

end
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,-384.7889404296875, 915.6282348632812, 118.48546600341797, true)
		if betweencoords < 2.0 and speaked == false then
			DrawTxt(" Appuyer sur [~e~ENTRER~q~] pour parler a Roger le fils de Cliffs", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
				speaked = true
                started = true    
				TriggerServerEvent("talon_robbery:talk3", function() 
			end)
			end
		end
	end
end)

---after bear dead
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,-384.7889404296875, 915.6282348632812, 118.48546600341797, true)
		if betweencoords < 2.0 and placedbait == true then
			DrawTxt(" Appuyer sur [~e~ENTRER~q~] pour parler une nouvelle fois avec Roger", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
                placedbait = false
				isfinished = true                   
				TriggerServerEvent("talon_robbery:talk5", function()
			end)
			end
		end
	end
end)
RegisterNetEvent('talon_robbery:info3')
AddEventHandler('talon_robbery:info3', function()	
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,-384.7889404296875, 915.6282348632812, 118.48546600341797, true)
		if betweencoords < 2.0 and maksettu == false and started == true then
			DrawTxt(" Appuyer sur [~e~ENTRER~q~] pour chercher Cliffs ", 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then

            started = true
		    maksettu = true 
            isRobbing = true    
               
			TriggerServerEvent("talon_robbery:pay3", function() 
              
                             
			end)
			end
		end
	end
end)

RegisterNetEvent('talon_robbery:go3')
AddEventHandler('talon_robbery:go3', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if started == true then
		TriggerEvent("vorp:TipBottom", 'Allez a la recherche de Cliff ', 5000)
        Citizen.Wait(2000)
		Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
		Citizen.InvokeNative(0x64C59DD6834FA942, -952.5138549804688, 2175.417724609375, 341.6063537597656)
		Citizen.InvokeNative(0x4426D65E029A4DC0, true) 
        
		
	end
end)
RegisterNetEvent('talon_robbery:go4')
AddEventHandler('talon_robbery:go4', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if started == true then
		
	
		Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
		Citizen.InvokeNative(0x64C59DD6834FA942, -768.2218017578125, 2633.5625, 344.48529052734375)
		Citizen.InvokeNative(0x4426D65E029A4DC0, true) 
        spawnWolfs()
		
	end
end)
RegisterNetEvent('talon_robbery:go5')
AddEventHandler('talon_robbery:go5', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
	if isfinished == true then
		
SetGpsMultiRouteRender(false)
TriggerServerEvent("talon_robbery:payout3", function() 
end)	
		
	end
end)

local areablip
RegisterNetEvent("talon:ToggleNotification3")
AddEventHandler("talon:ToggleNotification3", function()
    TriggerEvent("vorp:TipBottom", 'Cherche dans le coin un Ours ', 15000)
    areablip = Citizen.InvokeNative(0x45f13b7e0a15c880,-1282792512, -768.2218017578125, 2633.5625, 344.48529052734375, 100.0)
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if spawned_bear and areablip then
                RemoveBlip(areablip)
                areablip = nil
                break
            end
        end
    end)
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

--startpoint
local isRobbing = true

Citizen.CreateThread(function() 
    while true do
    Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local betweencoords = GetDistanceBetweenCoords(coords,-949.1871948242188, 2170.0615234375, 341.5546569824219, true)
        if betweencoords < 2.0 and isRobbing == true then
            DrawTxt(Config.rob, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
               
            if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = false 
                readjournal()   
                --TriggerServerEvent("talon_robbery:talk4", Config.Policealert)
                Wait(Config.Policealert)
                Wait(1000)
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
    Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local betweencoords = GetDistanceBetweenCoords(coords,-768.2218017578125, 2633.5625, 344.48529052734375, true)
        if betweencoords < 15.0 and isRobbing == false then
            DrawTxt(Config.rob2, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
                
            if IsControlJustReleased(0, 0x760A9C6F) then
                
                   
                TriggerServerEvent("talon_robbery:startrobbery3", Config.Policealert)
                Wait(Config.Policealert)
                isRobbing = true
                --Wait(45000)
                --spawnWolfs2()
                --Wait(1000)
               --spawnWolfs3() 
            end
        end
    end
end)  


RegisterNetEvent('talon_placebait:startAnimation3')
AddEventHandler('talon_placebait:startAnimation3', function(num,typey)    
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	isOver = false
	started = true
	PlaceBait()

	Citizen.Wait(9000)
	spawned_bear = spawnBear() -- then spawn the bear
    Wait(1000)
    ClearPedTasksImmediately(PlayerPedId())
    ClearPedSecondaryTask(PlayerPedId()) 

    Citizen.CreateThread(function()
        while started and not isOver do
            Citizen.Wait(1)
            local beardead = IsPedDeadOrDying(spawned_bear)
            if beardead then
                started = false
                isOver = true
                spawned_bear = nil
                SetGpsMultiRouteRender(false)
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                if isOver == true then
                    
                
                    Citizen.InvokeNative(0x3D3D15AF7BCAAF83, 6, true, true)
                    Citizen.InvokeNative(0x64C59DD6834FA942, -384.7889404296875, 915.6282348632812, 118.48546600341797)
                    Citizen.InvokeNative(0x4426D65E029A4DC0, true) 
                    TriggerEvent("vorp:TipBottom", "Depecer l'ours puis retourner voir Roger.", 5000)
                    isOver = false
                end    
          
            end
            
        end 
       
    end)
end)

Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("S_M_Y_NewspaperBoy_01") ) do
        Wait(500)
        RequestModel( GetHashKey("S_M_Y_NewspaperBoy_01") )
    end
    local npc = CreatePed(GetHashKey("S_M_Y_NewspaperBoy_01"), -383.5957946777344, 916.1079711914062, 117.50582122802734, 120.14, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityAsMissionEntity(npc, true, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    
    Citizen.InvokeNative(0x524B54361229154F, npc, GetHashKey("WORLD_HUMAN_SMOKE_NERVOUS_STRESSED"), -1, false, false, false, false)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("S_M_Y_NewspaperBoy_01"))
    
end)

function PlayAnimation(ped, anim)
	if not DoesAnimDictExist(anim.dict) then
		return
	end

	RequestAnimDict(anim.dict)

	while not HasAnimDictLoaded(anim.dict) do
		Wait(0)
	end

	TaskPlayAnim(ped, anim.dict, anim.name, 1.0, 1.0, -1, anim.flag, 0, false, false, false, '', false)

	RemoveAnimDict(anim.dict)
end

local Anims = {

    
    ["dead"] = {
        dict = "script_re@savage_aftermath@dead",
        name = "faceup_dead_pose_04", 
        flag = 2
},
}


Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("MES_SADIE4_MALES_01") ) do
        Wait(500)
        RequestModel( GetHashKey("MES_SADIE4_MALES_01") )
    end
    local npc = CreatePed(GetHashKey("MES_SADIE4_MALES_01"), -949.4511108398438, 2170.24267578125, 341.6, 0, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    SetEntityHealth(npc, 0, 0)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityAsMissionEntity(npc, true, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityHealth(npc, 0, 0)
    PlayAnimation(npc, Anims["dead"])
    
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("MES_SADIE4_MALES_01"))
    
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
   local blip = N_0x554d9d53f696d002(1664425300, -384.7383117675781, 915.52783203125, 118.48490142822266)
    SetBlipSprite(blip, 150441873, 1)
         Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Journal de Clifford William") 
 end)
 
function PlaceBait()
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itembaitprop = CreateObject(GetHashKey('s_grizzlybait01x'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itembaitprop, playerPed, GetPedBoneIndex(playerPed, 54565), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 15000, true, false, false, false)
			
	exports['progressBars']:startUI(5500, "Vous placez un APPAT a OURS")
	Citizen.Wait(5500)
		
	ClearPedTasks(playerPed)
	DetachEntity(itembaitprop)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)
	
	
	
	exports['progressBars']:startUI(25000, "Cherche un Ours...")
	Citizen.Wait(25000)
	 	
	
	placedbait = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2) 
    

   
    

end

function readjournal()
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_WRITE_NOTEBOOK'), 50000, true, false, false, false)
			
	exports['progressBars']:startUI(50000, "Lecture du journal de CLIFFS")
	ClearPedTasks(playerPed)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(500)
    TriggerServerEvent("talon_robbery:talk4", function()
	
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2) 
    
    
	end)

end
