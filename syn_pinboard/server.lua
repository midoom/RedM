TriggerEvent("getCore",function(core)
    VorpCore = core
end)
VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("syn_pinboard:get_posters")
AddEventHandler("syn_pinboard:get_posters", function(city)
    local _source = source
    local tablex = {}
    local User = VorpCore.getUser(source) 
    local Character = User.getUsedCharacter
    local charidentifier = Character.charIdentifier
    local group = User.getGroup
    exports.ghmattimysql:execute('SELECT * FROM posters WHERE city=@city', {['city'] = city}, function(result)
        if result[1] ~= nil then 
            for i=1, #result, 1 do
                table.insert(tablex, {
                    title = result[i].title,
                    poster_link = result[i].poster_link,
                    charidentifier = result[i].charidentifier,
                    id = result[i].id,
                })
            end
        end
        TriggerClientEvent("syn_pinboard:send_list",_source,tablex,charidentifier,group)
    end)
end)

RegisterServerEvent("syn_pinboard:set_link")
AddEventHandler("syn_pinboard:set_link", function(title,poster_link,city)
    local _source = source
    if poster_link ~= nil then 
        local Character = VorpCore.getUser(source).getUsedCharacter
        local charidentifier = Character.charIdentifier
        Discord(Config.webhook,title,poster_link, 3447003,city)
        local parameters = { ['title'] = title,  ['poster_link'] = poster_link, ['city'] = city, ['charidentifier'] = charidentifier}
        exports.ghmattimysql:execute("INSERT INTO posters ( `title`, `poster_link`, `city`, `charidentifier`) VALUES ( @title, @poster_link, @city, @charidentifier)", parameters)
    end
end)

RegisterServerEvent("syn_pinboard:removeposter")
AddEventHandler("syn_pinboard:removeposter", function(id)
    local _source = source
    exports.ghmattimysql:execute("DELETE FROM posters WHERE id=@id", {["id"] = id})
end)

RegisterCommand("clearpins", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  local Character = User.getUsedCharacter
  local group = User.getGroup -- Return user group (not character group)
    if group == "admin" then
		exports.ghmattimysql:execute("TRUNCATE TABLE posters", {})
    else return false
    end
   end
end)


function Discord(webhook, title, description, color,city)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local name        = Character.firstname .. ' ' .. Character.lastname
    local logs = ""
    local avatar = "https://media.discordapp.net/attachments/805495169901789194/911350679447150603/unknown.png"
    if string.match(description, "http") then
        logs = {
          {
              ["color"] = color,
              ["title"] = title,
              ["image"]={["url"]= description},
              ["footer"] = {["text"]="Town: "..city,["icon_url"]= "https://media.discordapp.net/attachments/805495169901789194/921620092704423986/SYN5.png"}
          }
        }
    else
        logs = {
            {
                ["color"] = color,
                ["title"] = title,
                ["description"] = description,
                ["footer"] = {["text"]="Town: "..city,["icon_url"]= "https://media.discordapp.net/attachments/805495169901789194/921620092704423986/SYN5.png"}
            }
          }
    end
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({["username"] = name ,["avatar_url"] = avatar ,embeds = logs}), { ['Content-Type'] = 'application/json' })
  end