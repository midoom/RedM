local game_during = false
local elements = {}
local ingame = false

RegisterNetEvent('lto_roulette:start')
AddEventHandler('lto_roulette:start', function(u_money)
	SendNUIMessage({type = "show_table",zetony = u_money})
	ingame = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = "reset_bet"})
end)

RegisterNUICallback('exit', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
    ingame = false
end)

RegisterNUICallback('roll', function(data, cb)
	cb('ok')
	TriggerEvent('lto_roulette:start_game', data.couleur, data.cota)
end)

RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterNetEvent('lto_roulette:start_game')
AddEventHandler('lto_roulette:start_game', function(action, amount)
	local amount = amount
	if game_during == false then
    TriggerServerEvent('lto_roulette:removemoney', amount)
	local couleur = action
		TriggerEvent("vorp:TipBottom", "You Bet "..amount.." $ on the "..couleur..". The wheel Spins...", 4000) -- The language of This line is not in the config language you need to change it here
		game_during = true
		local randomNumber = math.floor(math.random() * 36)
		SendNUIMessage({type = "show_roulette",hwButton = randomNumber})
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'betup', 1.0)
		Citizen.Wait(10000)
		local Red = {32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3};
		local Black = {15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26};
		local function has_value (tab, val)
			for index, value in ipairs(tab) do
				if value == val then
					return true
				end
			end
			return false
		end
		if action == 'Black' then
				local win = amount * 2
			if has_value(Black, randomNumber) then
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.winblack, 4000) -- from client side
				TriggerServerEvent('lto_roulette:givemoney', action, amount )
			else				
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
				SendNUIMessage({type = "reset_bet"})
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.losemoney, 4000) -- from client side
			end
		elseif action == 'Red' then
			        local win = amount * 2
			if has_value(Red, randomNumber) then
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.winred, 4000) -- from client side
				TriggerServerEvent('lto_roulette:givemoney', action, amount )
			else
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
				SendNUIMessage({type = "reset_bet"})
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.losemoney, 4000) -- from client side
			end
		elseif action == 'Green' then
				local win = amount * 14
			if randomNumber == 0 then
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
				SendNUIMessage({type = "reset_bet"})
			    ingame = false
				TriggerEvent("vorp:TipBottom", Config.Language.wingreen, 4000) -- from client side
				TriggerServerEvent('lto_roulette:givemoney', action, amount )
			else
				SendNUIMessage({type = 'hide_roulette'})
				SetNuiFocus(false, false)
			    ingame = false
                TriggerEvent("vorp:TipBottom", Config.Language.losemoney, 4000) -- from client side
			end
		end
		SendNUIMessage({type = 'hide_roulette'})
		SetNuiFocus(false, false)
		SendNUIMessage({type = "reset_bet"})
		ingame = false
		game_during = false
	else
		TriggerEvent("vorp:TipBottom", Config.Language.inprogress, 4000) -- from client side
	end
end)




Citizen.CreateThread(function()	
	while true do
      	local ped = GetPlayerPed(-1)
      	local coords = GetEntityCoords(PlayerPedId())
		-- Play Roulette
        if not ingame and (Vdist(coords.x, coords.y, coords.z, 3288.53, -1311.77, 42.75) < 1.5) then
		DrawTxt(Config.Language.playroulette, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
        if IsControlJustReleased(0,0xD9D0E1C0) then
        TriggerServerEvent("lto_roulette:Bets")
        end
		end
	Citizen.Wait(0)
	end
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