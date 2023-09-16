local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('fence:vender')
AddEventHandler( 'fence:vender', function ( args )
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local _src   = source
    local _price = args['Price']
    local _model = args['Tipo']
	local _mens  = args['Mens']
	
	local inv_count = VorpInv.getItemCount(_src, _model)
	
    if inv_count < 1 then
        TriggerClientEvent( 'UI:NotificaVenta', _src, Config.NoInv )
        return
    end

	VorpInv.subItem(_src, _model, 1)
	Character.addCurrency(0, _price)
	
	TriggerClientEvent( 'UI:NotificaVenta', _src, Config.Selltext .. _mens )
	TriggerEvent("vorp:NotifyLeft", "~pa~ Poissonier","J'ai acheter votre poisson", "toast_challenges_survivalist", "challenge_survivalist_1", 5000)
end)

RegisterServerEvent('bar:comprar')
AddEventHandler( 'bar:comprar', function ( args )
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local _src   = source
    local _price = args['Price']
    local _model = args['Tipo']
    local _mens  = args['Mens']
    
    u_money = Character.money

    if u_money <= _price then
        TriggerClientEvent( 'UI:NotificaCompra', _src, Config.NoMoney )
	TriggerEvent("vorp:NotifyLeft", "~t8~ Poissonier","Vous n'avez pas assez d'argent", "toast_challenges_survivalist", "challenge_survivalist_1", 5000)
        return
    end

    Character.removeCurrency(0, _price)
    
    VorpInv.addItem(_src, _model, 1)

    TriggerClientEvent( 'UI:NotificaCompra', _src, Config.Buytext .. _mens )
TriggerEvent("vorp:NotifyLeft", "~t6~ Poissonier","Merci de votre ACHAT", "toast_challenges_survivalist", "challenge_survivalist_1", 5000)
    
end)