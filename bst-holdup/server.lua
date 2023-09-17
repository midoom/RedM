VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)



RegisterServerEvent('bst_holdup:startrobbery')
AddEventHandler('bst_holdup:startrobbery', function()
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter

   
    TriggerClientEvent("vorp:TipBottom", _source, "Les Sheriffs ont ete alerter",6000)
    
       print("SERVERSIDE")
       -- isRobbing = true    
        TriggerClientEvent('bst_holdup:spawnOutlaws', _source)
        
        
        
    
           
end)