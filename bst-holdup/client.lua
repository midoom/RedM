

local starting = false
local already = false
local count = {}
local createdped = {}
local pressing = false
local gpsx = 0.0
local gpsy = 0.0
local gpsz = 0.0






function missionstart()


	local randomNCoords = math.random(1)
	local chossenCoords = {}
	--print(randomNCoords)

    if randomNCoords == 1 then
		chossenCoords = Config.outlaws.coords
	--elseif randomNCoords == 2 then
		--chossenCoords = Config.Coordenates.coords2
	--elseif randomNCoords == 3 then
	--chossenCoords = Config.Coordenates.coords3
    
end

	

			  
	for k,item in pairs(chossenCoords) do
		
	--Take a random model
		local modelNumeroRandom = math.random(6)
		local modelRandom = Config.models[modelNumeroRandom].hash
		local _hash = GetHashKey(modelRandom)
		RequestModel(_hash)
		if not HasModelLoaded(_hash) then 
			RequestModel(_hash) 
		end
	
		while not HasModelLoaded(_hash) do 
			Citizen.Wait(1) 
		end
		
	--print(modelNumeroRandom)

		createdped[k] = CreatePed(_hash, item.x, item.y, item.z, true, true, true, true)
		Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
		Citizen.InvokeNative(0x8D9BFCE3352DE47F, createdped[k])
		gpsx = item.x
		gpsy = item.y
		gpsz = item.z
		
	
		TaskCombatPed(createdped[k],PlayerPedId())
		count[k] = createdped[k]
		--print(count[k])
	end
	

	starting = true
	Wait(1000)
	Citizen.CreateThread(function()
		local x = #chossenCoords
		local pl = Citizen.InvokeNative(0x217E9DC48139933D)
		local qued = Citizen.InvokeNative(0x8D9BFCE3352DE47F, v)

		while starting == true do
			Citizen.Wait(0)
			for k,v in pairs(createdped) do
				if IsEntityDead(v) then --Wait(60000) DeletePed(createdped[k])
					if count[k] ~= nil then
						x = x - 1
						count[k] = nil
						if x == 0 then
							--DeletePed(v)
							TriggerEvent('vorp:ShowTopNotification', "~e~Felictation! Vous etes sauver", "Voyager sur vos gardes...", 4000)
							Citizen.Wait(Config.Cooldown)
							pressing = false
							starting = false
							already = false
							table.remove{createdped}
							table.remove{count}
							
						end
					end
				end
				if IsPlayerDead(pl) then
					--TriggerEvent("vorp:TipRight", Config.DeadMessage, 4000)
					stopmission()
				end
			end
		end
	end)
end

function missionstart2()


	local randomNCoords = math.random(1)
	local chossenCoords = {}
	--print(randomNCoords)

    if randomNCoords == 1 then
		chossenCoords = Config.outlaws.coords2
	--elseif randomNCoords == 2 then
		--chossenCoords = Config.Coordenates.coords2
	--elseif randomNCoords == 3 then
	--chossenCoords = Config.Coordenates.coords3
    
end

	

			  
	for k,item in pairs(chossenCoords) do
		
	--Take a random model
		local modelNumeroRandom = math.random(6)
		local modelRandom = Config.models[modelNumeroRandom].hash
		local _hash = GetHashKey(modelRandom)
		RequestModel(_hash)
		if not HasModelLoaded(_hash) then 
			RequestModel(_hash) 
		end
	
		while not HasModelLoaded(_hash) do 
			Citizen.Wait(1) 
		end
		
	--print(modelNumeroRandom)

		createdped[k] = CreatePed(_hash, item.x, item.y, item.z, true, true, true, true)
		Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
		Citizen.InvokeNative(0x8D9BFCE3352DE47F, createdped[k])
		gpsx = item.x
		gpsy = item.y
		gpsz = item.z
		
	
		TaskCombatPed(createdped[k],PlayerPedId())
		count[k] = createdped[k]
		--print(count[k])
	end
	

	starting = true
	Wait(1000)
	Citizen.CreateThread(function()
		local x = #chossenCoords
		local pl = Citizen.InvokeNative(0x217E9DC48139933D)
		local qued = Citizen.InvokeNative(0x8D9BFCE3352DE47F, v)

		while starting == true do
			Citizen.Wait(0)
			for k,v in pairs(createdped) do
				if IsEntityDead(v) then --Wait(60000) DeletePed(createdped[k])
					if count[k] ~= nil then
						x = x - 1
						count[k] = nil
						if x == 0 then
							--DeletePed(v)
							TriggerEvent('vorp:ShowTopNotification', "~e~Vous avez tuer les Mineurs!", "Voyager sur vos gardes...", 4000)
							Citizen.Wait(Config.Cooldown)
							pressing = false
							starting = false
							already = false
							table.remove{createdped}
							table.remove{count}
							
						end
					end
				end
				if IsPlayerDead(pl) then
					--TriggerEvent("vorp:TipRight", Config.DeadMessage, 4000)
					stopmission()
				end
			end
		end
	end)
end



function missionstart3()


	local randomNCoords = math.random(1)
	local chossenCoords = {}
	--print(randomNCoords)

    if randomNCoords == 1 then
		chossenCoords = Config.outlaws.coords3
	--elseif randomNCoords == 2 then
		--chossenCoords = Config.Coordenates.coords2
	--elseif randomNCoords == 3 then
	--chossenCoords = Config.Coordenates.coords3
    
end

	

			  
	for k,item in pairs(chossenCoords) do
		
	--Take a random model
		local modelNumeroRandom = math.random(6)
		local modelRandom = Config.models[modelNumeroRandom].hash
		local _hash = GetHashKey(modelRandom)
		RequestModel(_hash)
		if not HasModelLoaded(_hash) then 
			RequestModel(_hash) 
		end
	
		while not HasModelLoaded(_hash) do 
			Citizen.Wait(1) 
		end
		
	--print(modelNumeroRandom)

		createdped[k] = CreatePed(_hash, item.x, item.y, item.z, true, true, true, true)
		Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
		Citizen.InvokeNative(0x8D9BFCE3352DE47F, createdped[k])
		gpsx = item.x
		gpsy = item.y
		gpsz = item.z
		
	
		TaskCombatPed(createdped[k],PlayerPedId())
		count[k] = createdped[k]
		--print(count[k])
	end
	

	starting = true
	Wait(1000)
	Citizen.CreateThread(function()
		local x = #chossenCoords
		local pl = Citizen.InvokeNative(0x217E9DC48139933D)
		local qued = Citizen.InvokeNative(0x8D9BFCE3352DE47F, v)

		while starting == true do
			Citizen.Wait(0)
			for k,v in pairs(createdped) do
				if IsEntityDead(v) then --Wait(60000) DeletePed(createdped[k])
					if count[k] ~= nil then
						x = x - 1
						count[k] = nil
						if x == 0 then
							--DeletePed(v)
							TriggerEvent('vorp:ShowTopNotification', "~e~Vous avez tuer Les braconniers!", "Voyager sur vos gardes...", 4000)
							Citizen.Wait(Config.Cooldown)
							pressing = false
							starting = false
							already = false
							table.remove{createdped}
							table.remove{count}
							
						end
					end
				end
				if IsPlayerDead(pl) then
					--TriggerEvent("vorp:TipRight", Config.DeadMessage, 4000)
					stopmission()
				end
			end
		end
	end)
end

function missionstart4()


	local randomNCoords = math.random(1)
	local chossenCoords = {}
	--print(randomNCoords)

    if randomNCoords == 1 then
		chossenCoords = Config.outlaws.coords4
	--elseif randomNCoords == 2 then
		--chossenCoords = Config.Coordenates.coords2
	--elseif randomNCoords == 3 then
	--chossenCoords = Config.Coordenates.coords3
    
end

	

			  
	for k,item in pairs(chossenCoords) do
		
	--Take a random model
		local modelNumeroRandom = math.random(6)
		local modelRandom = Config.gang[modelNumeroRandom].hash
		local _hash = GetHashKey(modelRandom)
		RequestModel(_hash)
		if not HasModelLoaded(_hash) then 
			RequestModel(_hash) 
		end
	
		while not HasModelLoaded(_hash) do 
			Citizen.Wait(1) 
		end
		
	--print(modelNumeroRandom)

		createdped[k] = CreatePed(_hash, item.x, item.y, item.z, true, true, true, true)
		Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
		Citizen.InvokeNative(0x8D9BFCE3352DE47F, createdped[k])
		gpsx = item.x
		gpsy = item.y
		gpsz = item.z
		
	
		TaskCombatPed(createdped[k],PlayerPedId())
		count[k] = createdped[k]
		--print(count[k])
	end
	

	starting = true
	Wait(1000)
	Citizen.CreateThread(function()
		local x = #chossenCoords
		local pl = Citizen.InvokeNative(0x217E9DC48139933D)
		local qued = Citizen.InvokeNative(0x8D9BFCE3352DE47F, v)

		while starting == true do
			Citizen.Wait(0)
			for k,v in pairs(createdped) do
				if IsEntityDead(v) then --Wait(60000) DeletePed(createdped[k])
					if count[k] ~= nil then
						x = x - 1
						count[k] = nil
						if x == 0 then
							--DeletePed(v)
							TriggerEvent('vorp:ShowTopNotification', "~e~Vous avez tuer les membres de GANGS!", "Voyager sur vos gardes...", 4000)
							Citizen.Wait(Config.Cooldown)
							pressing = false
							starting = false
							already = false
							table.remove{createdped}
							table.remove{count}
							
						end
					end
				end
				if IsPlayerDead(pl) then
					--TriggerEvent("vorp:TipRight", Config.DeadMessage, 4000)
					stopmission()
				end
			end
		end
	end)
end

function stopmission()
	Wait(1000)
	pressing = false
	starting = false
	already = false
	--if IsEntityDead(count) and IsEntityDead(createdped) then
	for k,v in pairs(createdped) do
		DeletePed(v)
		DeletePed(count[k])
		
		Wait(500)
	end
	table.remove{createdped}
	table.remove{count}
	createdped = {}
	count = {}
	print("missiondone")
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function startdialog()
	Citizen.CreateThread(function()
	  local timetocheck = 600
		while timetocheck >= 0  do
			Citizen.Wait(0)
			TriggerEvent('vorp:ShowTopNotification', "~e~Des bandits vous attaques!", "Defendez vous!!!", 4000)
			timetocheck = timetocheck - 1
		end
	end)
end

function startdialog2()
	Citizen.CreateThread(function()
	  local timetocheck = 600
		while timetocheck >= 0  do
			Citizen.Wait(0)
			TriggerEvent('vorp:ShowTopNotification', "~e~Des Chercheurs D or sont apres VOUS!", "Defendez vous!!!", 4000)
			timetocheck = timetocheck - 1
		end
	end)
end
function startdialog3()
	Citizen.CreateThread(function()
	  local timetocheck = 600
		while timetocheck >= 0  do
			Citizen.Wait(0)
			TriggerEvent('vorp:ShowTopNotification', "~e~Des Braconiers vous recherchent!", "Defendez vous!!!", 4000)
			timetocheck = timetocheck - 1
		end
	end)
end
function startdialog4()
	Citizen.CreateThread(function()
	  local timetocheck = 600
		while timetocheck >= 0  do
			Citizen.Wait(0)
			TriggerEvent('vorp:ShowTopNotification', "~e~Un Gang Local vous recherchent!", "Kill All Gang Members!!!", 4000)
			timetocheck = timetocheck - 1
		end
	end)
end

Citizen.CreateThread(function()
  -- random = math.floor(math.random(1,11) * 0.1)
  
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local _source = source
		for k,v in pairs(Config.holdup.first) do
            local distance = GetDistanceBetweenCoords(coords, v['x'], v['y'], v['z'], true)
				if distance < 3.0 and not already then
					--print("close")
					local random = math.random(1, 10)
					if random <= Config.lotterynumber then
					--if math.random(1, 5) <= 2 then
                        print(random)
						startdialog()
						missionstart()
						
						already = true
						
					else
						if random > 2 and not already == true then
						stopmission()
						print(random)
						end
					end	
					
				end
			end
		
		end
end)

Citizen.CreateThread(function()
	-- random = math.floor(math.random(1,11) * 0.1)
	
	  while true do
		  Citizen.Wait(0)
		  local playerPed = PlayerPedId()
		  local coords = GetEntityCoords(playerPed)
		  local _source = source
		  for k,v in pairs(Config.holdup.second) do
			  local distance = GetDistanceBetweenCoords(coords, v['x'], v['y'], v['z'], true)
				  if distance < 3.0 and not already then
					  --print("close")
					  local random = math.random(1, 10)
					  if random <= Config.lotterynumber then
					  --if math.random(1, 5) <= 2 then
						  print(random)
						  startdialog2()
						  missionstart2()
						  
						  already = true
						  
					  else
						  if random > 2 and not already == true then
						  stopmission()
						  print(random)
						  end
					  end	
					  
				  end
			  end
		  
		  end
  end)


  Citizen.CreateThread(function()
	-- random = math.floor(math.random(1,11) * 0.1)
	
	  while true do
		  Citizen.Wait(0)
		  local playerPed = PlayerPedId()
		  local coords = GetEntityCoords(playerPed)
		  local _source = source
		  for k,v in pairs(Config.holdup.third) do
			  local distance = GetDistanceBetweenCoords(coords, v['x'], v['y'], v['z'], true)
				  if distance < 3.0 and not already then
					  --print("close")
					  local random = math.random(1, 10)
					  if random <= Config.lotterynumber then
					  --if math.random(1, 5) <= 2 then
						  print(random)
						  startdialog3()
						  missionstart3()
						  
						  already = true
						  
					  else
						  if random > 2 and not already == true then
						  stopmission()
						  print(random)
						  end
					  end	
					  
				  end
			  end
		  
		  end
  end)

  Citizen.CreateThread(function()
	-- random = math.floor(math.random(1,11) * 0.1)
	
	  while true do
		  Citizen.Wait(0)
		  local playerPed = PlayerPedId()
		  local coords = GetEntityCoords(playerPed)
		  local _source = source
		  for k,v in pairs(Config.holdup.fourth) do
			  local distance = GetDistanceBetweenCoords(coords, v['x'], v['y'], v['z'], true)
				  if distance < 3.0 and not already then
					  --print("close")
					  local random = math.random(1, 10)
					  if random <= Config.lotterynumber then
					  --if math.random(1, 5) <= 2 then
						  print(random)
						  startdialog4()
						  missionstart4()
						  
						  already = true
						  
					  else
						  if random > 2 and not already == true then
						  stopmission()
						  print(random)
						  end
					  end	
					  
				  end
			  end
		  
		  end
  end)

