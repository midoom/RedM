local open = false

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("lto_slots:enterBets")
AddEventHandler("lto_slots:enterBets", function ()
    local _source = source 
	local bets = KeyboardInput("Entrez la valeur du pari:", "", Config.MaxBetNumbers)
    if tonumber(bets) ~= nil then
    	TriggerServerEvent('lto_slots:BetsAndMoney', tonumber(bets))
    else
    --
    end
end)

RegisterNetEvent("lto_slots:UpdateSlots")
AddEventHandler("lto_slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("lto_slots:PayOutRewards", data.coinAmount)
end)

Citizen.CreateThread(function()
	SetNuiFocus(false, false)
	open = false
    while true do
		Citizen.Wait(0)
		local _source = source
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, Config.PlayZone['Slot1'].x, Config.PlayZone['Slot1'].y, Config.PlayZone['Slot1'].z, true)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.PlayZone['Slot1'].x, Config.PlayZone['Slot1'].y, Config.PlayZone['Slot1'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.2, 1.2, 0.2, 23, 153, 27, 155, 0, 0, 2, 0, 0, 0, 0)
		    if betweencoords < 1.0 and not open then 
		    DrawTxt(Config.Language.playslot, 0.50, 0.85, 0.5, 0.5, true, 255, 255, 255, 255, true)
		    if IsControlJustPressed(0, 0xD9D0E1C0) then	-- Espace
                TriggerEvent('lto_slots:enterBets')
		    end
		end
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

Citizen.CreateThread(function()
 for i, v in ipairs(Config.Tables) do
    local blip = N_0x554d9d53f696d002(1664425300, v)
    SetBlipSprite(blip, 595820042, 1)
    SetBlipScale(blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Machine a Sous")
end
end)