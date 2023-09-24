-- Import the VORP Inventory and other dependencies if necessary
Inventory = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData", function(call)
    data = call
end)

-- Register the "mlpayout" server event
RegisterServerEvent("mlpayout")
AddEventHandler("mlpayout", function()
    local _source = source
    TriggerEvent('vorp:getCharacter', _source, function(user)
        local _user = user

        -- Give the player money and items as a reward
        TriggerEvent("vorp:addMoney", _source, 0, 1000, _user)
        Inventory.addItem(_source, "goldbar", 3)
        -- Notify the player of their reward
        TriggerClientEvent("vorp:Tip", _source, 'You found 1000$ and 3 golden bars!', 5000)
    end)
end)

-- Register the "lockpick" server event
RegisterServerEvent('lockpick')
AddEventHandler('lockpick', function()
    local _source = source
    TriggerEvent('vorp:getCharacter', _source, function(user)
        local count = Inventory.getItemCount(_source, "lockpick")

        if count >= 1 then
            Inventory.subItem(_source, "lockpick", 1)
            TriggerClientEvent('StartRobbing', _source)
        else
            TriggerClientEvent("vorp:Tip", _source, 'You do not have enough lockpicks', 5000)
        end
    end)
end)

