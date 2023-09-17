
		
Citizen.CreateThread(function()
    local blip = N_0x554d9d53f696d002(1664425300, 2746.9479, -1394.8068, 46.2830)
    SetBlipSprite(blip, 103490298, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Guarma") 
end)

Citizen.CreateThread(function()
    local blip = N_0x554d9d53f696d002(1664425300, 1270.0314, -6854.6113, 43.4185)
    SetBlipSprite(blip, 103490298, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "St. Denis") 
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
    if (Vdist(coords.x, coords.y, coords.z, 2746.9479, -1394.8068, 46.2830) < 2.0) then
            DrawTxt("Appuyer sur [~e~G~q~] pour voyager jusqu\'a Guarma", 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then -- g
                local player = PlayerPedId()
                TriggerServerEvent('wcrp:guarmaticketbuy')
                Wait(800)
                DoScreenFadeOut(5000)
                Wait(10000)
                DoScreenFadeIn(5000)
                SetEntityCoords(player, 1269.55, -6854.188, 43.318)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 1)
                Citizen.InvokeNative(0x74E2261D2A66849A, true)
                guarma = true

            end
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
    if (Vdist(coords.x, coords.y, coords.z, 1270.0314, -6854.6113, 43.4185) < 2.0) then
            DrawTxt("Appuyer sur [~e~G~q~] pour voyager jusqu\'a Saint Denis", 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then -- g
                local player = PlayerPedId()
                TriggerServerEvent('wcrp:guarmaticketbuy')
                Wait(800)
                Citizen.InvokeNative(0x74E2261D2A66849A, 0)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
                DoScreenFadeOut(5000)
                Wait(10000)
                DoScreenFadeIn(5000)
                SetEntityCoords(player, 2746.9479, -1394.8068, 46.2830)

            end
        end
    end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end

-- RegisterNetEvent('wcrp:goGuarma')
-- AddEventHandler('wcrp:goGuarma', function()
--     local ped = PlayerPedID()
--     DoScreenFadeOut(5000)
--     Wait(10000)
--     DoScreenFadeIn(5000)
--     SetEntityCoords(ped, 1269.55, -6854.188, 43.318)
--     Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277)
--     Citizen.InvokeNative(0xE8770EE02AEE45C2, 1)
--     Citizen.InvokeNative(0x74E2261D2A66849A, true)
--     guarma = true
-- end)

-- RegisterNetEvent('wcrp:backGuarma')
-- AddEventHandler('wcrp:backGuarma', function()
--     local ped = PlayerPedID()
--     DoScreenFadeOut(5000)
--     Wait(10000)
--     DoScreenFadeIn(5000)
--     SetEntityCoords(ped, 318.6848, -1297.046, 44.12645)
-- end)


