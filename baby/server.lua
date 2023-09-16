local VorpCore = {}
local VorpInv
local data = {}


if Config.vorp then
    Citizen.CreateThread(function()
        Wait(500)
        TriggerEvent("getCore",function(core)
            VorpCore = core
        end)
        VorpInv = exports.vorp_inventory:vorp_inventoryApi()

        VorpInv.RegisterUsableItem("Baby", function(data)
        
            TriggerClientEvent("vorp:TipRight", data.source, "Enjoy!", 5000)
            TriggerClientEvent('ricx_Baby:start',data.source)
        end)
    end)


          
elseif Config.redm then

    RegisterServerEvent("RegisterUsableItem:Baby")
    AddEventHandler("RegisterUsableItem:Baby", function(source)
        TriggerClientEvent('ricx_Baby:start', source)
    end)
end   
