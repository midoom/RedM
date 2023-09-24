TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInventory = exports.vorp_inventory:vorp_inventoryApi()
local playerData = {}

-- Default Command to open the battlepass.
RegisterCommand('battlepass',function(source)
	local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier
	if identifier ~= nil  then
		exports.ghmattimysql:execute('SELECT * from aw_battlepass WHERE identifier = @identifier',{ ["@identifier"] = identifier },function (info)
			if info[1] ~= nil then
				if info[1].name == nil then
					local steamname = GetPlayerName(source)
		
					exports.ghmattimysql:execute('UPDATE aw_battlepass SET name = @name WHERE identifier = @identifier', {
						["identifier"] = identifier,
						["name"] = steamname
					}) 
				end
				
				
				playerData[source] = info[1].playtime
				TriggerClientEvent('AW_Battlepass:openBattlePass',source)
			else
				TriggerClientEvent("vorp:TipRight", source, "Non disponi delle autorizzazioni necessarie", 4000)
			end
		
		end)
		
	end
    
end)




-- Save player data / progress when the player leaves or disconnects from the game.
AddEventHandler('playerDropped', function(reason)
    SavePlayerBattlepassData(source)
end)

-- Save all players data / progress when the resource stops.
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    for k,v in pairs(GetPlayers()) do

        if v and playerData[tonumber(v)] then
            playerData[tonumber(v)] = playerData[tonumber(v)] + 1 
            SavePlayerBattlepassData(tonumber(v))
        end
    end

    print("Saved all online players battlepass data / progress.")
end)

-- Updating online players battlepass progress every minute.
CreateThread(function()
-- v = playerid, playerData[v] = playtime di v
    while true do
        Citizen.Wait(60000)
        for k,v in pairs(GetPlayers()) do
			
            if v and playerData[tonumber(v)] then
                playerData[tonumber(v)] = playerData[tonumber(v)] + 1 
                
            end
        end
    end
end)

RegisterServerEvent('AW_Battlepass:SavePlayerBattlepassData')
AddEventHandler('AW_Battlepass:SavePlayerBattlepassData', function()
	local source = source
	SavePlayerBattlepassData(source)
end)

-- Buy Level Boost to unlock more rewards.
RegisterServerEvent("AW_Battlepass:buyLevel")
AddEventHandler("AW_Battlepass:buyLevel", function (currentLevel, selectedLevel, cost)
    local source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier
	local playerGold = Character.gold

    if identifier ~= nil then

        if playerData[source] == Config.LevelsConfiguration[tonumber(selectedLevel)].playedTimeRequired then 
            print("has full level, please receive level reward first before purchasing levels")
            return
        end
		
		if playerGold >= cost then
			Character.removeCurrency(1, cost)
			
			playerData[source] = 0

			exports.ghmattimysql:execute('UPDATE aw_battlepass SET playtime = @playtime, level = @level WHERE identifier = @identifier', {
				["identifier"] = identifier,
				["playtime"] = 0,
				["level"] = selectedLevel  +1
			}) 
	
			for i=currentLevel,selectedLevel do 
				
				local claimedLevel = Config.LevelsConfiguration[tonumber(i)].levelReward
	
				local type, givenReward, givenAmount = claimedLevel.type, claimedLevel.reward, claimedLevel.amount
			
				if type  == 'item' then
                    TriggerEvent("vorpCore:canCarryItems", source, givenAmount, function(canCarry)
                        if canCarry then
                            VorpInventory.addItem(source, givenReward, givenAmount)
                            TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s di %s", givenAmount, givenReward), 4000)
                        else
                            TriggerClientEvent("vorp:TipRight", source, string.format("Limite Inventario Raggiunto"), 4000)
                        end
                    end)
				elseif type  == 'weapon' then
                    TriggerEvent("vorpCore:canCarryWeapons", source, 1, function(canCarry)
                        if canCarry then
                            VorpInventory.createWeapon(source, givenReward)
                            TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s", givenReward), 4000)
                        else
                            TriggerClientEvent("vorp:TipRight", source, string.format("Hai raggiunto il limite di %s armi!", 6), 4000)
                        end
                    end)
					
			
				elseif type == 'money' then
					TriggerEvent("vorp:addMoney", source, 0, givenAmount)
                    TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s $", givenAmount), 4000)
			
		
				else
	
					if Config.levelRewardPacks[type] then
						local rewards = Config.levelRewardPacks[type].rewards
	
						for k, v in pairs(rewards) do
	
							if v.type  == 'item' then
                                TriggerEvent("vorpCore:canCarryItems", source, v.amount, function(canCarry)
                                    if canCarry then
                                        VorpInventory.addItem(source, v.name, v.amount)
                                        TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s di %s", v.amount, v.name), 4000)
                                    else
                                        TriggerClientEvent("vorp:TipRight", source, string.format("Limite Inventario Raggiunto"), 4000)
                                    end
                                end)
								--VorpInventory.addItem(source, v.name, v.amount)
						
							elseif v.type  == 'weapon' then
                                TriggerEvent("vorpCore:canCarryWeapons", source, 1, function(canCarry)
                                    if canCarry then
                                        VorpInventory.createWeapon(source, v.name)
                                        TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s", v.name), 4000)
                                    else
                                        TriggerClientEvent("vorp:TipRight", source, string.format("Hai raggiunto il limite di %s armi!", 6), 4000)
                                    end
                                end)
								--VorpInventory.createWeapon(source, v.name, 0)
						
							elseif v.type == 'money' then
								TriggerEvent("vorp:addMoney", source, 0, v.amount)
                                TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s $", v.amount), 4000)
							end
	
						end
					else
						print("Tried to buy a non existing levelReward Type. Make sure {"..type.."} exists in Config.levelRewardPacks.")
					end
				end
	
			end
	
			TriggerClientEvent('AW_Battlepass:openBattlePass',source)
		else
			TriggerClientEvent("vorp:TipRight", source, string.format("Il costo per l'acquisto è di %s ma attualmente hai %s di Dobloni", cost, playerGold), 4000)
		end
    end

end)

RegisterServerEvent("AW_Battlepass:claimReward")
AddEventHandler("AW_Battlepass:claimReward", function (level)

    local source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier

    if identifier ~= nil then

        local level = tonumber(level)
        local selectedLevel = Config.LevelsConfiguration[level].levelReward

        local type, givenReward, givenAmount = selectedLevel.type, selectedLevel.reward, selectedLevel.amount
        
        playerData[source] = 0

        exports.ghmattimysql:execute('UPDATE aw_battlepass SET playtime = @playtime, level = @level WHERE identifier = @identifier', {
            ["identifier"] = identifier,
            ["playtime"] = 0 ,
            ["level"] = level + 1
        }) 
    
        --print(level, selectedLevel, type, givenReward, givenAmount)
        if type  == 'item' then
            TriggerEvent("vorpCore:canCarryItems", source, givenAmount, function(canCarry)
                if canCarry then
                    VorpInventory.addItem(source, givenReward, givenAmount)
                    TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s di %s", givenAmount, givenReward), 4000)
                else
                    TriggerClientEvent("vorp:TipRight", source, string.format("Limite Inventario Raggiunto"), 4000)
                end
            end)
        elseif type  == 'weapon' then
            TriggerEvent("vorpCore:canCarryWeapons", source, 1, function(canCarry)
                if canCarry then
                    VorpInventory.createWeapon(source, givenReward)
                    TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s", givenReward), 4000)
                else
                    TriggerClientEvent("vorp:TipRight", source, string.format("Hai raggiunto il limite di %s armi!", 6), 4000)
                end
            end)
        elseif type == 'money' then
            TriggerEvent("vorp:addMoney", source, 0, givenAmount)
            TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s $", givenAmount), 4000)

        else

            if Config.levelRewardPacks[type] then
                local rewards = Config.levelRewardPacks[type].rewards

                for k, v in pairs(rewards) do

                    if v.type  == 'item' then
                        TriggerEvent("vorpCore:canCarryItems", source, v.amount, function(canCarry)
                            if canCarry then
                                VorpInventory.addItem(source, v.name, v.amount)
                                TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s di %s", v.amount, v.name), 4000)
                            else
                                TriggerClientEvent("vorp:TipRight", source, string.format("Limite Inventario Raggiunto"), 4000)
                            end
                        end)
                        --VorpInventory.addItem(source, v.name, v.amount)
                
                    elseif v.type  == 'weapon' then
                        TriggerEvent("vorpCore:canCarryWeapons", source, 1, function(canCarry)
                            if canCarry then
                                VorpInventory.createWeapon(source, v.name)
                                TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s", v.name), 4000)
                            else
                                TriggerClientEvent("vorp:TipRight", source, string.format("Hai raggiunto il limite di %s armi!", 6), 4000)
                            end
                        end)
                        --VorpInventory.createWeapon(source, v.name, 0)
                
                    elseif v.type == 'money' then
                        TriggerEvent("vorp:addMoney", source, 0, v.amount)
                        TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s $", v.amount), 4000)
                    
                    end
                end
            else
                print("Tried to buy a non existing levelReward Type. Make sure {"..type.."} exists in Config.levelRewardPacks.")
            end
        end
    
        TriggerClientEvent('AW_Battlepass:openBattlePass', source)
		
		--TriggerClientEvent("vorp:TipRight", source, string.format("Hai Ricevuto %s di %s", givenAmount, givenReward), 4000)
        --TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = _U("rewards_claimed_for_level") .. level})
    end

end)


VorpCore.addRpcCallback('AW_Battlepass:getPlayerBattlepassInfo', function(source,cb)
    local source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier
	local playerMoney = Character.money


    if identifier ~= nil then

        exports.ghmattimysql:execute('SELECT * from aw_battlepass WHERE identifier = @identifier',
        {
            ["@identifier"] = identifier

        },function (playerStatus)
    
            if playerStatus[1] then

                local currentLevel = playerStatus[1].level 
                local playtime = playerData[source]

                if Config.LevelsConfiguration[currentLevel] == nil then
                    local playerInfo = {
                        level              = currentLevel - 1,
                        percentage         = 100,
                        playedTime         = 0,
                        remainingTime      = 0,
                        requiredTime       = 0,
                        money              = playerMoney,
                        canClaim           = false,
                        hasBattlepassEnded = true
                    }
    
                    cb(playerInfo)
                else

                    local target = Config.LevelsConfiguration[currentLevel].playedTimeRequired

  
                    local progress = math.floor( (playtime/target) * 100 )
    
                    local canClaim = canClaim(playtime,target)
                    local remainingProgress = target-playtime
        
                    if canClaim then
                        progress, remainingProgress = 100, 0
                    end
        
                    local playerInfo = {
                        level              = currentLevel,
                        percentage         = progress,
                        playedTime         = playtime,
                        remainingTime      = remainingProgress,
                        requiredTime       = Config.LevelsConfiguration[currentLevel].playedTimeRequired,
                        money              = playerMoney,
                        canClaim           = canClaim,
                        hasBattlepassEnded = false
                    }
						
                    cb(playerInfo)
                end
    
            end
    
        end)
    end

end)

VorpCore.addRpcCallback("AW_Battlepass:fetchUserBattlepassLevel", function(source, cb)
    local _source = source

    local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier
	
    local result = exports.ghmattimysql:execute("SELECT * FROM aw_battlepass WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] then 
        local playerStats = result[1]

        return {
            cb(playerStats['level'])
        }
    else
        return cb(1)
    end
end)

VorpCore.addRpcCallback("AW_Battlepass:canBuyLevel", function(source, cb, cost)
    local _source = source
	local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier
	local playerMoney = Character.money

    if identifier ~= nil then
        local currentMoney = playerMoney

        if cost <= currentMoney then
            cb(true)
        else
            cb(false)
        end
	else
		cb(false)
	end
end)


function canClaim(playtime,target)
    if tonumber(playtime) >= tonumber(target) then
        return true
    else
        return false
    end
end


function SavePlayerBattlepassData(source)
    --local source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
	local identifier = Character.identifier
    if identifier ~= nil then
        --print("playerData[source]: ",playerData[source])
        if playerData[source] ~= nil then
           -- print("update")
            exports.ghmattimysql:execute('UPDATE aw_battlepass SET playtime = @playtime WHERE identifier = @identifier', {
                ["identifier"] = identifier,
                ["playtime"] = playerData[source]
            }) 
        end
		
       

    end
end

AddEventHandler('onServerResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
    Wait(500)
	print(string.format("^5%s Starting thanks to %s - Version %s^7", Config.Name, Config.Author, Config.Version))
end)

