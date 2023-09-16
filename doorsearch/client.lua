local function AddDoorToSystemNew(doorHash, p1, p2, p3, threadId, p5, p6)
	return N_0xd99229fe93b46286(doorHash, p1, p2, p3, threadId, p5, p6)
end

RegisterNetEvent("doorsearch:setDoorState", function(door, state)
	if not IsDoorRegisteredWithSystem(door) then
		AddDoorToSystemNew(door, 1, 1, 0, 0, 0, 0)
	end

	DoorSystemSetDoorState(door, state)
end)

RegisterNetEvent("doorsearch:search", function()
	CreateThread(function()
		local coords = GetEntityCoords(PlayerPedId())

		local i = 0

		print(string.format("Starting door search at %.2f, %.2f, %.2f...", coords.x, coords.y, coords.z))

		for door, info in pairs(doorhashes) do
			if #(coords - vector3(info[4], info[5], info[6])) <= 2.0 then
				print(door)
			end

			if i % 100 == 0 then
				Wait(0)
			end

			i = i + 1
		end

		print("Done")
	end)
end)
