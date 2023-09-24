TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local guiEnabled, isDead = false, false

local uiType = 'enable_battlepass'

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		SetNuiFocus(false,false)
    end
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerServerEvent('AW_Battlepass:loadPlayerInformation')
end)

function EnableGui(state, ui)
	SetNuiFocus(state, state)
	guiEnabled = state

	SendNUIMessage({
		type = ui,
		enable = state
	})
end


RegisterNUICallback('closeNUI', function()
	TriggerServerEvent("AW_Battlepass:SavePlayerBattlepassData", function()
	end)
	EnableGui(false, uiType)
end)

function closeBaseUI()
	EnableGui(false, uiType)
end

RegisterNetEvent("AW_Battlepass:closeBaseUI")
AddEventHandler("AW_Battlepass:closeBaseUI", function()
	EnableGui(false, uiType)
end)


RegisterNetEvent('AW_Battlepass:openBattlePass')
AddEventHandler('AW_Battlepass:openBattlePass', function()

	Wait(1000)

	SendNUIMessage({
		action = 'mainData',
		battlepass_levels = #Config.LevelsConfiguration
	})	

	--TriggerServerEvent('AW_Battlepass:loadPlayerInformation')
	if not isDead then
		local levelCost = 0


		VorpCore.RpcCall('AW_Battlepass:getPlayerBattlepassInfo', function(cb) 
			uiType = "enable_loading"

			EnableGui(true, uiType)

			Wait(200)


			for k,v in pairs(Config.LevelsConfiguration) do

	
				if cb.canClaim and v.level == cb.level then
					SendNUIMessage({
						action = 'addLevels',
						level_detail = v.levelReward,
						status = 'canClaim'
					})
				elseif (v.level < cb.level) or cb.hasBattlepassEnded then
					SendNUIMessage({
						action = 'addLevels',
						level_detail = v.levelReward,
						status = 'claimed'
					})					
				elseif v.level == cb.level then
					levelCost = levelCost + Config.LevelUpCost
					SendNUIMessage({
						action = 'addLevels',
						level_detail = v.levelReward,
						status = 'loading',
						cost   = levelCost
					})
				else
					levelCost = levelCost + Config.LevelUpCost
	
					SendNUIMessage({
						action = 'addLevels',
						level_detail = v.levelReward,
						status = 'waiting',
						cost   = levelCost
					})
				end
			end
	
	
			SendNUIMessage({
				action = 'addPlayerDetails',
				level = cb.level,
				percentage = cb.percentage,
				playedTime    = cb.playedTime,
				remainingTime = cb.remainingTime,
				requiredTime  = cb.requiredTime,
				dc            = cb.money,
				levelCost     = Config.LevelUpCost
			})
			
			uiType = "enable_battlepass"
			
			EnableGui(true, uiType)

		end)
			 
	end
end)

RegisterNUICallback('claimRewards', function (data)
	TriggerServerEvent('AW_Battlepass:claimReward',data.level)
end)

RegisterNUICallback('buyLevel', function (data)

	local paidLevels   = math.floor(data.level - data.currentLevel)
	local levelCost    = (Config.LevelUpCost * paidLevels) + Config.LevelUpCost

	VorpCore.RpcCall('AW_Battlepass:canBuyLevel', function(cb)

		if cb then
			TriggerServerEvent("AW_Battlepass:buyLevel", data.currentLevel, data.level, levelCost)

		--else
			--sendNotification('You dont have enough money (' .. levelCost .. ') to perform this action.' ,"error")
			--TriggerEvent("vorp:TipBottom", data, string.format("Non hai abbastanza gold per acquistare questa ricompensa %", levelCost), 4000)
		end

	end, levelCost)

end)

RegisterNUICallback('displayReceivedReward', function (data)

	SendNUIMessage({
		action = 'addCenterRewardDisplay',
		item = data.item, 
		level = data.level, 
		description = data.description,
		image = data.image
	})
end)


RegisterNUICallback('displayReward', function (data)

	SendNUIMessage({
		action = 'addCenterDisplay',
		item = data.item, 
		level = data.level, 
		description = data.description,
		image = data.image
	})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if guiEnabled then


			DisableControlAction(0, 0x07CE1E61,   true) -- LookLeftRight
			DisableControlAction(0, 0xF84FA74F,   true) -- LookUpDown
			DisableControlAction(0, 0xCEE12B50, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 0x3076E97C, true) -- MeleeAttackAlternate
			DisableControlAction(0, 0xB4E465B4,  true) -- MoveLeftRight
			DisableControlAction(0, 0xD27782E3,  true) -- MoveUpDown
			DisableControlAction(0, 0xD9D0E1C0,  true) -- disable sprint
			--DisableControlAction(0, 47,  true) -- disable weapon -- G
			--DisableControlAction(0, 263, true) -- disable melee --R
			DisableControlAction(0, 0xDE794E3E, true) -- disable melee
			DisableControlAction(0, 0xB2F377E8,  true) -- disable exit vehicle
		else
			Citizen.Wait(1000)
		end
	end
end)