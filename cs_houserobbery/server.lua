local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('lto_houserobbery:Bill')
AddEventHandler('lto_houserobbery:Bill', function()
    local _source = source 
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.billtext1, 7000)
	Citizen.Wait(7000)
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.billtext2, 7000)
	Citizen.Wait(7000)
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.billtext3, 7000)
	Citizen.Wait(7000)
	TriggerClientEvent('lto_houserobbery:YesOrNo', _source)
end)

RegisterServerEvent('lto_houserobbery:Bill2')
AddEventHandler('lto_houserobbery:Bill2', function()
    local _source = source
	TriggerClientEvent('lto_houserobbery:goto1', _source)	
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.billtext4, 7000)
	Citizen.Wait(7000)
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.billtext5, 7000)
	Citizen.Wait(7000)
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.toofar, 7000)
end)

RegisterServerEvent("lto_houserobbery:sherif1")
AddEventHandler("lto_houserobbery:sherif1", function(players)
    local _source = source
    local sherif = 0
    for k,v in pairs(players) do
        local User = VorpCore.getUser(v)
        local Character = User.getUsedCharacter
        if Character.job == "sheriff_v" or  Character.job == "sheriff_bw" then -- change here the job req to start
            sherif = sherif + 1     
        end
    end
	if sherif >= 0 then 
		TriggerClientEvent('lto_houserobbery:montest1', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, Config.Language.sherifonline, 6000)
    end
end)

local cooldown = 0
RegisterServerEvent("lto_houserobbery:montest")
AddEventHandler("lto_houserobbery:montest", function()
    local _source = source
    if cooldown < (GetGameTimer()) then
        cooldown = GetGameTimer() + 60000 -- 1 Hour
		TriggerClientEvent('lto_houserobbery:TalkToBill', _source)
    else
	   TriggerClientEvent("vorp:Tip", _source, Config.Language.notnowhouse, 6000)
    end
end)

RegisterServerEvent('lto_houserobbery_check:LockPick')
AddEventHandler('lto_houserobbery_check:LockPick', function()
    local _source = tonumber(source)
    local count = VORP.getItemCount(_source, "lockpick")
    if count >= 1 then
	VORP.subItem(_source,"lockpick", 1)
	TriggerClientEvent('lto_houserobbery:crochetage', _source)
	TriggerClientEvent("vorp:TipBottom", _source, Config.Language.lockpickinghouse, 3000)
    else
    TriggerClientEvent("vorp:TipBottom", _source, Config.Language.nolockpickhouse, 5000)
    end     
end)

RegisterServerEvent('lto_houserobbery:loot')
AddEventHandler('lto_houserobbery:loot', function()
math.random() math.random() math.random()
    local _source = source
    local Amount = math.random(1,3)
	local luck = math.random(1,10)

    if luck == 1 then
        VORP.addItem(_source, "stolenmerch", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck1, 6000)

    elseif luck == 2 then
        VORP.addItem(_source, "alliance", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck2, 6000)
		
    elseif luck == 3 then
        VORP.addItem(_source, "pepite_or", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck3, 6000)
		
    elseif luck == 4 then
        VORP.addItem(_source, "pocket_watch", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck4, 6000)
		
    elseif luck == 5 then
        VORP.addItem(_source, "pipe", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck5, 6000)
		
    elseif luck == 6 then
        VORP.addItem(_source, "diamond", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck6, 6000)
		
    elseif luck == 7 then
        VORP.addItem(_source, "goldbar", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck7, 6000)
		
    elseif luck == 8 then
        VORP.addItem(_source, "goldring", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck8, 6000)
		
    elseif luck == 9 then
        TriggerEvent('vorp:getCharacter', source, function(user)
            local _source = source
            local _user = user
            TriggerEvent("vorp:addMoney",source, 1, Amount, _user) -- change money loot here
        end)
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck9, 6000)
		
    elseif luck == 10 then
        VORP.addItem(_source, "bague_rubis", Amount) -- change loot here
        TriggerClientEvent("vorp:Tip", _source, Config.Language.luck10, 6000)
    end
end)

RegisterNetEvent("lto_houserobbery:notifysherif")
AddEventHandler("lto_houserobbery:notifysherif", function(players, coords)
    for each, player in ipairs(players) do
        TriggerEvent("vorp:getCharacter", player, function(user)
            if user ~= nil then
				if user.job == 'sheriff_rh' or user.job == 'marshal' then
					TriggerClientEvent("lto_houserobbery:repportsherif", player, coords)
				end
            end
        end)
    end
end)