local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('Perry_Heist:tekstit')
AddEventHandler('Perry_Heist:tekstit', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: J'ai entendu une conversation dans le saloon, que la tirelire n'avait pas été vidée depuis longtemps", 9000)
		Citizen.Wait(9000)
		TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: J'aurai besoin d'un gang fiable, le seul problème est qu'il faut des pièces de rechange", 9000)
		Citizen.Wait(9000)
		TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: Les Pieces sont strictement gardés, si vous voulez savoir où ils se trouvent, payez-moi à l'avance (25 $)", 9000)
		Citizen.Wait(10000)
		TriggerClientEvent('Perry_Heist:maksateksti', _source)
end)

RegisterServerEvent('Perry_Heist:otanevitunrahat')
AddEventHandler('Perry_Heist:otanevitunrahat', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        u_money = Character.money

    if u_money <= 5 then
        TriggerClientEvent("vorp:TipBottom", _source, "Tu n'as pas d'argent", 9000)
        return
    end

    TriggerEvent("vorp:removeMoney", _source, 0, 5)
    TriggerClientEvent("vorp:TipBottom", _source, "ABIGAIL: Allez maintenant à Guarma!", 9000)
	Citizen.Wait(10000)
    TriggerClientEvent('Perry_Heist:gpskoordit', _source)    
end)

RegisterServerEvent('Perry_Heist:Alotetaanteksti')
AddEventHandler('Perry_Heist:Alotetaanteksti', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        TriggerClientEvent("vorp:TipBottom", _source, "Appuyez sur [ENTRER] pour accepter la mission", 9000)
        if IsControlJustReleased(0, 0xC7B5340A) then
            TriggerClientEvent('Perry_Heist:Aloitetaan', _source)
        end
end)

RegisterServerEvent('Perry_Heist:RobComplete')
AddEventHandler('Perry_Heist:RobComplete', function()
    local item = "cable_electrique"
    local item2 = "nitroglycerine"
    local item3 = "poudre"    
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        VORP.addItem(_source, item, 3)
        VORP.addItem(_source, item2, 1)
        VORP.addItem(_source, item3, 1)
        TriggerClientEvent("vorp:TipBottom", _source, "Revenez en arrière et suivez les indications sur la carte!", 9000)
end)

RegisterServerEvent('Perry_Heist:GiveDynamite')
AddEventHandler('Perry_Heist:GiveDynamite', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
        local count = VORP.getItemCount(_source, "cable_electrique")
        local count2 = VORP.getItemCount(_source, "nitroglycerine")
        local count3 = VORP.getItemCount(_source, "poudre")

        if count >= 3 and count2 >= 1 and count3 >= 1 then
         
            VORP.subItem(_source,"cable_electrique", 3)
            VORP.subItem(_source,"nitroglycerine", 1)
            VORP.subItem(_source,"poudre", 1)
            VORP.addItem(_source, "dynamite", 1)
            TriggerClientEvent("vorp:TipBottom", _source, "Vous entendez le propriétaire gronder dans la maison, se rendant rapidement à la banque de la Valentine!", 9000)
        else
            TriggerClientEvent("vorp:TipBottom", _source, "Vous n'avez pas de fournitures", 9000)
        end     
end)


RegisterServerEvent('Perry_Heist:missionComplete')
AddEventHandler('Perry_Heist:missionComplete', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        local _user = user
		local count = VORP.getItemCount(_source, "dynamite")

        if count >= 1 then
		
		   VORP.subItem(_source,"dynamite", 1)
		   TriggerEvent("vorp:addMoney",source, 1, 10, _user)
           VORP.addItem(_source, "lockpick", 2)
		else
           TriggerClientEvent("vorp:TipBottom", _source, "Vous n'avez pas de dynamite", 9000)
        end     
    TriggerClientEvent("vorp:Tip",source, 'Vous obtenez 10 pieces d or et 2 crochets!', 5000)
end)
---basic---

-----police notify
RegisterNetEvent("policenotify30")
AddEventHandler("policenotify30", function(players, coords)
    local _source = source
	for each, player in ipairs(players) do
        --TriggerEvent("vorp:getCharacter", player, function(user)
		
		local Character = VorpCore.getUser(_source).getUsedCharacter
            if Character ~= nil then
				if Character.job == 'police' then
					TriggerClientEvent("PosisiPerompak", player, coords)
					Wait(60000)
                    TriggerClientEvent("Witness:ToggleNotification30", player, coords)
					Wait(100000)
                    TriggerClientEvent("Witness:ToggleNotification40", player, coords)
					--Wait(200000)
                    --TriggerClientEvent("Witness:ToggleNotification40", player, coords)
					Wait(100000)
                    TriggerClientEvent("Witness:ToggleNotification50", player, coords)
					--Wait(200000)
                    --TriggerClientEvent("Witness:ToggleNotification50", player, coords)
				end
            end
        --end)
    end
end)