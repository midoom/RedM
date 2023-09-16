local VorpCore = {}
TriggerEvent("getCore",function(core)
    VorpCore = core
end)
VorpInv = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()
    Wait(500)
    VorpInv.RegisterUsableItem('remede', function(_Data)
        TriggerClientEvent('DVR_Injuredstartremede', _Data.source)
        VorpInv.subItem(_Data.source, 'remede', 1)
    end)
end)

local injuredTable = {}

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
       return
    end
    Wait(1000)
       -- select
    local Parameters = {}
    exports.ghmattimysql:execute( "SELECT * FROM injured ", Parameters, function(result)

        if injuredTable then
            for i = 1, #result, 1 do 
                table.insert(injuredTable, {injured = result[i].injured, identifier = result[i].identifier})
            end
        end
    end)
end)

function CheckInjured(identifier)
    for i = 1, #injuredTable, 1 do 
        if injuredTable[i].identifier == identifier then 
            return true
        end
    end
    return false
end

RegisterNetEvent("LoadisInjured:check")
AddEventHandler("LoadisInjured:check", function(injured) 
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Parametres = {}
    exports.ghmattimysql:execute( "SELECT * FROM injured ", Parametres, function(result)
 
        if injuredTable then
            for i = 1, #result, 1 do 
                table.insert(injuredTable, {injured = result[i].injured, identifier = result[i].identifier})
                local injured = result[i]
                if result then 
                    TriggerClientEvent('vorp:injuredinplayers', _source, injured.injured)
                end
            end
        end
    end)
end)

RegisterNetEvent("LoadisInjured:player")
AddEventHandler("LoadisInjured:player", function(injured) 
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter    
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier
    local chanceInjured = math.random(1, 10)
    
    print(chanceInjured)
    if chanceInjured >= 5 then
        local asinjured = CheckInjured(u_identifier)
        if asinjured then
            print('^2Le joueurs  ' ..GetPlayerName(_source).. ' et deja en bdd')
        else
            Citizen.Wait(5000)
            local Parametres = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid, ['injured'] = injured}
            exports.ghmattimysql:execute("INSERT INTO injured (`identifier`,`charidentifier`,  `injured` ) VALUES ( @identifier, @charidentifier, @injured)", Parametres)
            table.insert(injuredTable, {identifier = u_identifier, charIdentifier = u_charid, injured = injured})
        end
    else
        print(injured, ' pas malade')
    end
end)

RegisterNetEvent("LoadisInjuredUpdate:player")
AddEventHandler("LoadisInjuredUpdate:player", function(injured) 
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter    
    local u_identifier = Character.identifier
    local u_charid = Character.charIdentifier

    local Parametres = { ['@identifier'] = u_identifier, ['@charidentifier'] = u_charid, ['@injured'] = injured}
    exports.ghmattimysql:execute("UPDATE injured SET injured = @injured WHERE identifier = @identifier AND charidentifier = @charidentifier", Parametres,

      function(result)
         print('^3Le joueurs ' ..GetPlayerName(_source).. ' vien de se faire soigné')
         TriggerClientEvent('vorp:notinjuredinplayers', _source, injured)
      end
    )
end)