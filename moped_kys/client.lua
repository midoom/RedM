local prvykrat = false
local currentCam = nil
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local test = false

function prompts()
	if not test then
		test = true
    	Citizen.CreateThread(function()
		local str = Config.Locales.shoot
    	SuicidePress = PromptRegisterBegin()
    	PromptSetControlAction(SuicidePress, 0x07CE1E61)
    	str = CreateVarString(10, 'LITERAL_STRING', str)
    	PromptSetText(SuicidePress, str)
		PromptSetUrgentPulsingEnabled(SuicidePress, true)
    	PromptSetEnabled(SuicidePress, 1)
    	PromptSetVisible(SuicidePress, 1)
    	PromptSetStandardMode(SuicidePress,1)
    	PromptSetGroup(SuicidePress, buttons_prompt)
    	Citizen.InvokeNative(0xC5F428EE08FA7F2C,SuicidePress,true)
    	PromptRegisterEnd(SuicidePress)
    	end)

    	Citizen.CreateThread(function()
		local str = Config.Locales.leave
    	SuicideLeave = PromptRegisterBegin()
    	PromptSetControlAction(SuicideLeave, 0x43F2959C)
    	str = CreateVarString(10, 'LITERAL_STRING', str)
    	PromptSetText(SuicideLeave, str)
    	PromptSetEnabled(SuicideLeave, 1)
    	PromptSetVisible(SuicideLeave, 1)
    	PromptSetStandardMode(SuicideLeave,1)
    	PromptSetGroup(SuicideLeave, buttons_prompt)
    	Citizen.InvokeNative(0xC5F428EE08FA7F2C,SuicideLeave,true)
    	PromptRegisterEnd(SuicideLeave)
    	end)
	end
end

local function kys()		
	local ped = PlayerPedId()
	local canSuicide = false
	local foundWeapon = nil
	local found, weapon = GetCurrentPedWeapon(ped, true)
	for i=1, #Config.ValidWeapons do
		if weapon == Config.ValidWeapons[i] then
			if GetAmmoInPedWeapon(ped, weapon) > 0 then
				canSuicide = true
				foundWeapon = Config.ValidWeapons[i]
				break
			end
		end
	end
 
	if canSuicide then
		if weapon == foundWeapon and IsPedWeaponReadyToShoot(ped) then
			prompts()
			local heading = GetEntityHeading(ped)
			currentCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
			SetCamCoord(currentCam, GetOffsetFromEntityInWorldCoords(ped, 4.75, 0.0, -0.5))
			PointCamAtCoord(currentCam, GetPedBoneCoords(ped, 27981, 0.0, 0.0, 0.0))
			SetCamFov(currentCam, 25.0)
			SetCamActive(currentCam, true)
			RenderScriptCams(true, true, 4000, 1, 1)
			if Config.BlackBars then
				Citizen.InvokeNative(0x69D65E89FFD72313, true,true)
			end
			RequestAnimDict('script_story@mry1@ig@ig6_jamie_attempts_suicide')
			while not HasAnimDictLoaded('script_story@mry1@ig@ig6_jamie_attempts_suicide') do Wait(100) end
			TaskPlayAnim(ped, "script_story@mry1@ig@ig6_jamie_attempts_suicide", "ig6_gun_to_head_ig_jamie", 1.5, 1.0, -1, 67109394, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
			FreezeEntityPosition(ped, true)
			PromptSetVisible(SuicideLeave,true)
			PromptSetEnabled(SuicideLeave,true)
			PromptSetVisible(SuicidePress,true)
			PromptSetEnabled(SuicidePress,true)
			local doing = false
			Citizen.CreateThread(function()
				while currentCam ~= nil do
					Wait(0)
					local label = CreateVarString(10, 'LITERAL_STRING', Config.Locales.suicide)
					PromptSetActiveGroupThisFrame(buttons_prompt, label)
					--PointCamAtCoord(currentCam, GetPedBoneCoords(ped, 27981, 0.0, 0.0, 0.0))
					if Citizen.InvokeNative(0xC92AC953F0A982AE,SuicideLeave) then
						ClearPedTasks(ped)
						FreezeEntityPosition(ped, false)
						Citizen.InvokeNative(0x69D65E89FFD72313, false,false)
						PromptSetVisible(SuicideLeave,false)
						PromptSetEnabled(SuicideLeave,false)
						PromptSetVisible(SuicidePress,false)
						PromptSetEnabled(SuicidePress,false)
						RenderScriptCams(0,1,4000)
						Wait(4000)
						SetCamActive(currentCam, false)
						DestroyCam(currentCam, false)
						ClearFocus()
						currentCam = nil
						break
					end
					if IsPedShooting(ped) and not doing then
						doing = true
						ClearPedTasks(ped)
						SetEntityHeading(ped, heading)
						TaskPlayAnim(ped, "script_story@mry1@ig@ig6_jamie_attempts_suicide", "ig6_jamie_shoots_himself_ig_jamie", 1.0, 8.0, -1, 2, 0, true, 0, false, 0, false)
						RemoveAnimDict("script_story@mry1@ig@ig6_jamie_attempts_suicide")
						Citizen.InvokeNative(0x69D65E89FFD72313, false,false)
						PromptSetVisible(SuicideLeave,false)
						PromptSetEnabled(SuicideLeave,false)
						PromptSetVisible(SuicidePress,false)
						PromptSetEnabled(SuicidePress,false)
						FreezeEntityPosition(ped, false)
						Wait(750)
						Citizen.InvokeNative(0x697157CED63F18D4, PlayerPedId(), 500000, false, true, true)
						Wait(1000)
						RenderScriptCams(0,1,6000)
						Wait(6000)
						SetCamActive(currentCam, false)
						DestroyCam(currentCam, false)
						ClearFocus()
						currentCam = nil
						break
					end
				end
			end)
		end
	else
		SendNotification(Config.Locales.requirement)
	end
end

RegisterCommand(Config.Command, function(source, args, rawCommand)
	if prvykrat == false then
	 SendNotification(Config.Locales.sure)
	 prvykrat = true
	 Wait(10000)
	 prvykrat = false
	elseif prvykrat == true then
	 kys() 
	 prvykrat = false
	end
end)