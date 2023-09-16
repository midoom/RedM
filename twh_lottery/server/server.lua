local VORPcore = {}
local VORPInv = {}

VORPInv = exports.vorp_inventory:vorp_inventoryApi()


local message
local discordIdentity
local discordId 

TriggerEvent("getCore", function(core)
    VORPcore = core
end)


Citizen.CreateThread(function ()
    for k, v in pairs(Config.scratchCards) do
        VORPInv.RegisterUsableItem(tostring(v.item), function(data)
            CheckData(v,data)
        end)
    end
end)


RegisterServerEvent("twh_lottery:scratchS")
AddEventHandler("twh_lottery:scratchS", function(source,item)
	local _source = source
    local _item = item
	local chance = math.random()	
    local sorted = InsertionSort(item.chances)
    local price = 0
    for k, v in pairs(sorted) do
        print(v.chance,v.price)
        if chance < (v.chance/100) then
            print("------")
            print(v.price)
            price = v.price
            break
        end
    end

    TriggerClientEvent("twh_lottery:clientUpdate", _source, price,_item) 
    
end)

RegisterServerEvent("twh_lottery:setPrice")
AddEventHandler("twh_lottery:setPrice", function(winning,item)
	local _source = source
    local _item = item
	local Character = VORPcore.getUser(_source).getUsedCharacter
	local price = winning
		if price == nil then
			return
		end
	
	if price >= 1 then
        if Config.useLocations then
            TriggerClientEvent("vorp:NotifyLeft",_source, _U("title"),_U("successLocation"), "generic_textures", "tick", 2000)
            VORPInv.addItem(source, _item.item, 1, {description = _U("priceDesc")..price.."$",price = price})
        else
            TriggerClientEvent("vorp:NotifyLeft",_source, _U("title"),_U("success").."~e~"..price.."~q~$", "generic_textures", "tick", 2000)
		    Character.addCurrency(0, price)  
        end
		
	end
	if price < 1 then
		TriggerClientEvent("vorp:NotifyLeft",_source, _U("title"),_U("failure"), "generic_textures", "lock", 2000)
	end
end)


RegisterServerEvent("twh_lottery:exchange")
AddEventHandler("twh_lottery:exchange", function()
	local _source = source
	local Character = VORPcore.getUser(_source).getUsedCharacter

    local Identifier = GetPlayerIdentifier(_source)
    local steamName = GetPlayerName(_source)
    if Config.Discord then
        discordIdentity = GetIdentity(_source, "discord")
        discordId = string.sub(discordIdentity, 9)
    end
    local won = 0
    local cards = 0
    local itemstring = ""
    for k, v in pairs(Config.scratchCards) do
        for i, j in pairs(v.chances) do

            local card = VORPInv.getItem(_source, v.item,{description=_U("priceDesc")..j.price.."$",price=j.price})
            if card then
                local meta = card["metadata"]
            
                if next(meta) then
                    local cardCount = VORPInv.getItemCount(_source, v.item,{description=_U("priceDesc")..j.price.."$",price=j.price})
                    Citizen.Wait(100)
                    if cardCount > 0 then
                        won = won + j.price * cardCount
                        cards = cards + cardCount
                        VORPInv.subItem(_source, v.item, cardCount,{description=_U("priceDesc")..j.price.."$",price=j.price})                      
                        itemstring = itemstring.."\n_Card:_`"..tostring(v.item).." x"..tostring(cardCount).."`"
                        cardCount = 0
                    end    
                end
                
            end
            
            
        end
    end

    if won > 0 then
        if Config.Discord then
            message = "**Steam name: **`" .. steamName .. "`**\nIdentifier:**`" .. Identifier .. "` \n**Discord:** <@" .. discordId .. ">".."\n**Price:**` "..won.."$`\n**Cards: **"..itemstring
        else
            message = "**Steam name: **`" .. steamName .. "`**\nIdentifier:**`" .. Identifier .. "`".."\n**Price:**` "..won.."$`\n**Cards: **"..itemstring
        end
    
        if Config.Logs then
            TriggerEvent("twh_lottery:webhook", "`Reward given` ", message)
        end
        TriggerClientEvent("vorp:NotifyLeft",_source, _U("title"),_U("success").."~e~"..won.."~q~$", "generic_textures", "tick", 2000)
		Character.addCurrency(0, won)  
    else
        TriggerClientEvent("vorp:NotifyLeft",_source, _U("title"),_U("noCard"), "generic_textures", "tick", 2000)
    end
    

    
end)



function Discord(webhook, title, description, text, color)
    if Config.Logs then

        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
            embeds = {
                {
                    ["color"] = Config.webhookColor,
                    ["author"] = {
                        ["name"] = Config.name,
                        ["icon_url"] = Config.logo
                    },
                    ["title"] = title,
                    ["description"] = description,
                    ["footer"] = {
                        ["text"] = "TWH" .. " • " .. os.date("%x %X %p"),
                        ["icon_url"] = Config.footerLogo,

                    },
                },

            },
            avatar_url = Config.Avatar
        }), {
            ['Content-Type'] = 'application/json'
        })
    end
end


RegisterServerEvent('twh_lottery:webhook')
AddEventHandler('twh_lottery:webhook', function(title, description, text)
    Discord(Config.webhook, title, description, text, Config.webhookColor)
end)









