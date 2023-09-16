local coordsVisible = false

-- function DrawGenericText(text)
-- 	--SetTextColour(186, 186, 186, 255)
-- 	SetTextFont(7)
-- 	SetTextScale(0.378, 0.378)
-- 	SetTextWrap(0.0, 1.0)
-- 	SetTextCentre(false)
-- 	SetTextDropshadow(0, 0, 0, 0, 255)
-- 	SetTextEdge(1, 0, 0, 0, 205)
-- 	SetTextEntry("STRING")
-- 	AddTextComponentString(text)
-- 	DrawText(0.40, 0.00)
-- end

function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
  end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			--DrawGenericText(("~g~Heading~w~: %s"):format(FormatCoord(playerH)))
			drawtext(("~g~Heading~w~: %s"):format(FormatCoord(playerH)), 0.15, 0.10, 0.3, 0.5, true, 255, 255, 255, 255, true, 10000)
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("heading", function()
    ToggleCoords()
end)