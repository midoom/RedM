local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('wcrp:guarmaticketbuy')
AddEventHandler("wcrp:guarmaticketbuy", function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    Character.removeCurrency(0, 0)
    TriggerClientEvent("vorp:TipBottom", _source, 'Voyage...', 3000)
        
end)