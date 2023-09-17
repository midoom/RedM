local MenuOuvert = false

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()
		if IsAppActive(`MAP`) ~= 0 and not MenuOuvert then
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			MenuOuvert = true
			SortirMap()
			Wait(2000)
			local player = PlayerPedId()
            local coords = GetEntityCoords(player) 
            local props = CreateObject(GetHashKey("s_twofoldmap01x_us"), coords.x, coords.y, coords.z, 1, 0, 1)
            prop = props
            SetEntityAsMissionEntity(prop,true,true)
            RequestAnimDict("mech_carry_box")
            while not HasAnimDictLoaded("mech_carry_box") do
            Citizen.Wait(100)
            end
            Citizen.InvokeNative(0xEA47FE3719165B94, player,"mech_carry_box", "idle", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
            Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"SKEL_L_Finger12"), 0.20, 0.00, -0.15, 180.0, 190.0, 0.0, true, true, false, true, 1, true)
		end
        if IsAppActive(`MAP`) ~= 1 and MenuOuvert then
		MenuOuvert = false
        RangerMap()
		ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
     	DetachEntity(prop,false,true)
        ClearPedTasks(player)
        DeleteObject(prop)
		end
	end
end)

function SortirMap()
    local ped = PlayerPedId()
	animateMap("mech_inspection@two_fold_map@satchel", "enter")
end

function RangerMap()
    ClearPedTasks(PlayerPedId())
    RemoveAnimDict(dictar)
    local ped = PlayerPedId()
	animateMap(ped, "mech_inspection@two_fold_map@satchel", "exit_satchel")
end

RegisterCommand("testanim",function()
    animateMap("mech_inspection@newspaper@satchel", "enter")
end)

function animateMap(v1,v2)
    local dictar = v1
    local antar = v2
    if not DoesAnimDictExist(dictar) then
		print("Invalid animation dictionary: " .. dictar)
		return
	end
	RequestAnimDict(dictar)
	while not HasAnimDictLoaded(dictar) do
		Citizen.Wait(0)
	end
    TaskPlayAnim(PlayerPedId(), dictar, antar, -1.0, -0.5, -1   ,14, 0, true, 0, false, 0, false)
end