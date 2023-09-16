RegisterCommand("doorsearch", function(source, args, raw)
	TriggerClientEvent("doorsearch:search", source)
end, true)

RegisterCommand("door", function(source, args, raw)
	local door = tonumber(args[1])
	local state = tonumber(args[2])
	TriggerClientEvent("doorsearch:door", source, door, state)
end, true)
