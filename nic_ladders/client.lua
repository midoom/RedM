
-- GLOBAL VARIABLES DECLARATION
----------------------------------------------------------------------------------------------------
local holdingLadder = false
local ladder
local nearProp
local carrying = false
local exist = false
local placed = false
local prompt = false
local duration = 60 -- How long the ladder will stay in seconds
local propLife = 0
local prop
local propModel = "p_beechers_ladder01x"
local centerBone = "SKEL_Spine3"


-- IF CARRYING
----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10)
		if carrying then
            DrawTxt("Placer votre echelle '~COLOR_BLUE~CORRECTEMENT~COLOR_WHITE~' Appuyer sur:", 0.5, 0.08, 0.3, 0.4, true, 181, 204, 242, 250, true)  
            DrawTxt("ENTRER", 0.5, 0.10, 0.3, 0.7, true, 199, 215, 0, 200, true)
            DisableControlAction(0, 0xD9D0E1C0, true) -- Disable Jump
            DisableControlAction(0, 0x8FFC75D6, true) -- Disable Sprint
       end
    end
end)

-- IF LADDER IS USED
----------------------------------------------------------------------------------------------------

RegisterNetEvent('nic_ladder:useLadder')
AddEventHandler('nic_ladder:useLadder', function()
    if not exist then
        RequestAnimDict("mech_carry_box")
        while not HasAnimDictLoaded("mech_carry_box") do
            Wait(100)
        end    
        TriggerEvent("vorp_inventory:CloseInv")
        addLadder()
        carryLadder()
        exist = true
        carrying = true
    else
        print("There's an existing Ladder")
        TriggerEvent("vorp:TipBottom", "Il y a encore une échelle existante", 3000)
    end
end)

-- IF ENTER KEY IS PRESSED
----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10)
        local heading = GetEntityHeading(PlayerPedId())
        if (IsControlJustPressed(0, 0xC7B5340A)) and carrying and not IsEntityDead(PlayerPedId())  then
            carrying = false
            AttachEntityToEntity(prop, PlayerPedId(), centerBone, 0.0, 0.80, 0.20, 90.0, -90.0, 0.00, true, true, false, true, 1, true)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('nic_ladder:removeitem')
            TriggerEvent('nic_ladder:timer')
            placed = true
			DetachEntity(prop, 1, 1)
            SetEntityHeading(prop, heading)
            print(heading)
            ClearPedTasks(PlayerPedId())
            PlaceObjectOnGroundProperly(prop)
        end
    end
end)

-- IF RAGDOLL
----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10)
		if IsPedRagdoll(PlayerPedId()) then
			DeleteObject(prop)
            propLife = 0
            carrying = false
            placed = false
            exist = false
            ClearPedTasks(PlayerPedId())
       end       
    end
end)

-- IF DEL KEY IS PRESSED
----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
		local px, py, pz = table.unpack(GetEntityCoords(prop))
        nearProp = DoesObjectOfTypeExistAtCoords(x, y, z, 0.8, propModel, true)
        if nearProp and placed then
            DrawText3DSM(px, py, pz-0.2, "[~t8~DEL~q~]~q~ Ranger votre Echelle")
            if (IsControlJustPressed(0, 0x4AF4D473)) and placed and not IsEntityDead(PlayerPedId()) then
                TriggerServerEvent('nic_ladder:additem')
                DeleteObject(prop)
                carrying = false
                playPickAnimation()
                propLife = 0
                placed = false
                exist = false
            end
        end
    end
end)


-- IF LADDER EXISTS
----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
		local px, py, pz = table.unpack(GetEntityCoords(prop))
        nearProp = DoesObjectOfTypeExistAtCoords(x, y, z, 1.5, propModel, true)
        if exist and nearProp and placed and not IsEntityDead(PlayerPedId())  then
            if propLife <= 20 and propLife > 10 then
                DrawText3D(px, py, pz, "~o~Echelle: ~d~"..propLife)
            elseif propLife <= 10 and propLife > 0 then
                DrawText3D(px, py, pz, "~o~Echelle: ~e~"..propLife)
            else
                DrawText3D(px, py, pz, "~o~Echelle: ~q~"..propLife)
            end
        end
    end
end)

-- IF DEAD
----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local dead = Citizen.InvokeNative(0x3317DEDB88C95038, PlayerPedId(), true)
		if dead then
            propLife = 0
            carrying = false
            placed = false
            exist = false
			DeleteObject(prop)
        end      
    end
end)

-- TIMER FUNCTION
----------------------------------------------------------------------------------------------------

RegisterNetEvent('nic_ladder:timer')
AddEventHandler('nic_ladder:timer', function()
	Citizen.CreateThread(function()
        propLife = duration
		while propLife > 0 and placed do
			Citizen.Wait(1000)
			if propLife > 0 then
				propLife = propLife - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while exist do
            Citizen.Wait(0)
            if propLife < 1 then
                ClearPedTasks(PlayerPedId())
                DeleteObject(prop)
                placed = false
                carrying = false
                exist = false
                propLife = 0
			end
		end
	end)
end)

-- CLOSE PROMPT FUNCTION
----------------------------------------------------------------------------------------------------

function closePrompt()
    Wait(3000)
    prompt = false
end

-- CARRY PROP FUNCTION
----------------------------------------------------------------------------------------------------

function carryLadder()
    local boneIndex = GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Hand")
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
    AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 0.0, 0.80, 0.20, 90.0, -90.0, 0.00, true, true, false, true, 1, true)
    carrying = true
    TaskPlayAnim(PlayerPedId(), "mech_carry_box", "idle", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
end

-- PLAY PICK ANIMATION FUNCTION
----------------------------------------------------------------------------------------------------

function playPickAnimation()
    local animation = "mech_pickup@plant@gold_currant"
    RequestAnimDict(animation)
    while not HasAnimDictLoaded(animation) do
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), animation, "stn_long_low_skill_exit", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
    Citizen.Wait(2000)
    ClearPedTasks(PlayerPedId())
end

-- ADD PROP FUNCTION
----------------------------------------------------------------------------------------------------

function addLadder()
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
    prop = CreateObject(GetHashKey(propModel), 2607.01, -1454.44, 47.16,  true,  true, true)
end

-- DRAW 2D TEXT IN-GAME FUNCTION
----------------------------------------------------------------------------------------------------

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end

-- DRAW 3D TEXT IN-GAME FUNCTION
----------------------------------------------------------------------------------------------------

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.45, 0.45)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

function DrawText3DSM(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.25, 0.25)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end