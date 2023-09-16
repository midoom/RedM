VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


Locations = {
    vector3(-324.26, 804.1, 117.93),
    vector3(2825.2976074219, -1320.1049804688, 45.755676269531),
    vector3(-785.47, -1323.85, 43.9),
    vector3(-1789.34, -387.5, 160.37),
    vector3(-3687.2, -2622.31, -13.3), 
    vector3(-5486.33, -2937.6, -0.35),
    vector3(1328.03, -1293.70,  77.07),

}

RegisterNetEvent("mushy_robbery:startToRob")
AddEventHandler("mushy_robbery:startToRob", function(robtime)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local count = VORP.getItemCount(_source, "lockpick")

    if count >= 1 then        
        -- playerjobloop()      
        VORP.subItem(_source,"lockpick", 1)
        TriggerClientEvent('mushy_robbery:startAnimation', _source)
        TriggerClientEvent("vorp:TipBottom", _source, "Sheriffs Have Been Alerted",6000)
    else
        TriggerClientEvent("vorp:TipBottom", _source, "Vous n\'avez pas de Lockpick", 6000)
    end     
end)


RegisterNetEvent("mushy_robbery:payout")
AddEventHandler("mushy_robbery:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
       -- randommoney = math.random(10,20)
        ritem = math.random(5,10)
        local randomitempull = math.random(1, #Config.Items)
        local itemName = Config.Items[randomitempull]
           VORP.addItem(_source, itemName, ritem)
    end)
        --TriggerClientEvent("vorp:TipBottom", _source, 'You got goldnuggets', 5000)
end)



RegisterNetEvent("policenotify")
AddEventHandler("policenotify", function(players, coords, alert)
    local Character = VorpCore.getUser(source).getUsedCharacter
    for each, player in ipairs(players) do
        if Character ~= nil then
			if Character.job == 'police' or Character.job == 'marshal' or Character.job == 'sheriff' then
				TriggerClientEvent("Witness:ToggleNotification2", player, coords, alert)
			end
        end
    end
end)


            
      

