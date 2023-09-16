local houses = {}
local doorlocksevent = false
local doorlocksevent2 = false
local doorhash
local objc
local doorname
local entit
local objYaw3
local objYaw1
local objYaw2
local coord
local show3d = false
local changeloc = false
local changeloc2 = false
local o,p,q
local doorinfo = {}
local doorset = Config.Language.notset
local secondarydoors = {}
local next = next 
local editeddoor
local range = 0
local price = 0
local charid
local id
local pricex 
local taxx 
local houseidx
local sellercharid
local sellerid
local houseid
local typez
local secid
local blips = {}
local blips2 = {}
local soldhousing = 0
local ledger = 0
local onhold = false
local rangex
local findchangingroom = false
local findinventory = false
local housex
local housey
local housez
local poutifts = 0
local playerskin
local tax = 0
local repo
local invspace = 0
local invspacex
local furniturex = {}
local playerjob
local playerrank
local upgradex
local furniturecatagory = {}
local furniturepiece = {}
local furnitem -- findme 2
local furnitemcost
local placefurniture = false
local xx,yy,zz,hh
local furniname
local objectxyz 
local int = 0.5
local soldfurni
local soldfurni
local keyholdersx
local owner = false
local onhold2 = false
local roomid
local hasLoaded = false

local gettingoutfits = false 
local globalhouseid
local buyhouse
local housedistance = {}
local housegeneral = {}
local houseownership = {}
local prompts = GetRandomIntInRange(0, 0xffffff)
local prompts2 = GetRandomIntInRange(0, 0xffffff)
local prompts3 = GetRandomIntInRange(0, 0xffffff)
local prompts4 = GetRandomIntInRange(0, 0xffffff)
local prompts5 = GetRandomIntInRange(0, 0xffffff)
local prompts6 = GetRandomIntInRange(0, 0xffffff)
local prompts7 = GetRandomIntInRange(0, 0xffffff)
local prompts8 = GetRandomIntInRange(0, 0xffffff)
local prompts9 = GetRandomIntInRange(0, 0xffffff)
local prompts10 = GetRandomIntInRange(0, 0xffffff)
local prompts11 = GetRandomIntInRange(0, 0xffffff)
local prompts12 = GetRandomIntInRange(0, 0xffffff)
local prompts13 = GetRandomIntInRange(0, 0xffffff)
local prompts14 = GetRandomIntInRange(0, 0xffffff)
local exitprompt2
local allowinprompt
local declineprompt
local knockprompt
local enterhouse
local exitmotelprompt
local buyroomprompt
local changingprompt
local invprompt
local pendingjob = false 
local managehouse
local checkinginmenu = false 
local allowmenu = true
local doorlock
local inmenu = false 
local homeledgerprompt
local getsolehouseinfo = false 
local entermotelprompt
local playermotels = {}
local insidemotel = false
local processingmotel = false
local activemotel
local insidemotel = false
local motelident
local invprompt2
local wardroveprompt
local playergroup
local spawnedfurniture = {}
local taxledger
local furniitems = {}
local thefurniitem 
local typeoftele = " Not Set!"
local insidetelehome = false 
local activetelehome
local activehomeid 
local access2 = false 
local insidehome = {}
local exithouse
local knock = false 
local doorknocked = false 
local knocker 
local isaguest = false 
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)
function GetPlayers()
	local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    return players
end

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function getEntity(player)                                          
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)    
    return entity                                                   
end  

function contains(table, element)
	for k, v in pairs(table) do
		if v[2] == element then
			return true
		end
	end
	return false
end

function contains3(table, element)
    for k, v in pairs(table) do
          if v.id == element then
            return false
        end
    end
return true
end

local function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
	if not HasStreamedTextureDictLoaded(textureStreamed) then
	   RequestStreamedTextureDict(textureStreamed, false);
	else
		DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
	end
end

function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
  end

function drawicon(x, y, z, text , state)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    if state then
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 100, 1, 1, 255, 0)
    else
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 67, 160, 71, 255, 0)
    end
end 


Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0)
        local sleep = true 
        if doorlocksevent then
            sleep = false 
            drawtext(Config.Language.aimingatdoor, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.createhousecancel, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.nodoorhouse, 0.15, 0.16, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["B"]) then
                doorlocksevent = false 
                createhousemenu2() 
            end
            if IsPlayerFreeAiming(PlayerId()) then         
                local entity = getEntity(PlayerId())       
                local coords = GetEntityCoords(entity) 
                local player = GetEntityCoords(PlayerPedId())       
                local heading = GetEntityHeading(entity)    
                local model = GetEntityModel(entity) 
                if model ~= 0 and model ~= nil then
                    if contains(DOOR_HASHES, model) then
                        for k,v in pairs(DOOR_HASHES) do 
                            if model == v[2] then
                                local doorcoords = vector3(v[4],v[5], v[6])
                                local a,b,c = table.unpack(doorcoords)
                                local d,f,g = table.unpack(coords)
                                local distance = GetDistanceBetweenCoords(a, b, c, d, f, g, false)
                                if 1 > distance then
                                    doorname = v[3]
                                    doorhash = v[2]
                                    objc = v[1]
                                    entit = entity
                                end
                            end
                        end
                        DrawTexture("inventory_items", "consumable_lock_breaker", 0.5, 0.5, 0.05, 0.05, 0.0, 255, 0, 0, 180, true)
                        if whenKeyJustPressed(Config.keys["G"]) then
                            local x,y,z = table.unpack(GetEntityRotation(entit))
                            objYaw3 = z
                            objYaw1= x
                            objYaw2 = y
                            coord = GetEntityCoords(entit)
                            o,p,q = table.unpack(coord)
                            show3d = true
                            createhousemenu() 
                            doorlocksevent = false 
                        end
                    end
                end
            end
        end  
        if doorlocksevent2 then
            sleep = false 
            drawtext(Config.Language.aimingatdoor, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.createhousecancel, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            if IsPlayerFreeAiming(PlayerId()) then         
                local entity = getEntity(PlayerId())       
                local coords = GetEntityCoords(entity) 
                local heading = GetEntityHeading(entity)    
                local model = GetEntityModel(entity)        
                if model ~= 0 and model ~= nil then
                    if contains(DOOR_HASHES, model) then
                        for k,v in pairs(DOOR_HASHES) do 
                            if model == v[2] then
                                local doorcoords = vector3(v[4],v[5], v[6])
                                local a,b,c = table.unpack(doorcoords)
                                local d,f,g = table.unpack(coords)
                                local distance = GetDistanceBetweenCoords(a, b, c, d, f, g, false)
                                if 1 > distance then
                                    doorname = v[3]
                                    doorhash = v[2]
                                    objc = v[1]
                                    entit = entity
                                end
                            end
                        end
                        DrawTexture("inventory_items", "consumable_lock_breaker", 0.5, 0.5, 0.05, 0.05, 0.0, 255, 0, 0, 180, true)
                        if whenKeyJustPressed(Config.keys["G"]) then
                            local x,y,z = table.unpack(GetEntityRotation(entit))
                            objYaw3 = z
                            objYaw1= x
                            objYaw2 = y
                            coord = GetEntityCoords(entit)
                            o,p,q = table.unpack(coord)
                            show3d = true
                            setdoormenu3()
                            doorlocksevent2 = false 

                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)  


Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0)
        local sleep = true 
        if show3d then
            sleep = false 
            drawicon(o, p, q, " " ,true)
            if changeloc or changeloc2 then 
                drawtext(Config.Language.pressenterconfirm, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.createhousecancel, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.uparrowicon, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.downarrowicon, 0.15, 0.22, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.rightarrowicon, 0.15, 0.25, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.leftarrowicon, 0.15, 0.28, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.bracketrighticon, 0.15, 0.31, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.bracketlefticon, 0.15, 0.34, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["UP"]) then
                    q = q + 0.1
                end
                if whenKeyJustPressed(Config.keys["DOWN"]) then
                    q = q-0.1
                end
                if whenKeyJustPressed(Config.keys["LEFTBRACKET"]) then
                    p = p+0.1
                end
                if whenKeyJustPressed(Config.keys["RIGHTBRACKET"]) then
                    p = p-0.1
                end
                if whenKeyJustPressed(Config.keys["RIGHT"]) then
                    o = o+0.1
                end
                if whenKeyJustPressed(Config.keys["LEFT"]) then
                    o = o-0.1
                end
                if whenKeyJustPressed(Config.keys["ENTER"]) then
                    if changeloc then
                        changeloc = false
                        setdoormenu()
                    elseif changeloc2 then
                        changeloc2 = false
                        setdoormenu3()
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)


Citizen.CreateThread(function() 
    local pos2 = {x = 0, y = 0, z = 0}
    local placedobject = false
    local x,y,z = 0,0,0
    local h = 0
    while true do 
        Citizen.Wait(0)
        local sleep = true
        if placefurniture then
            sleep = false
            local myPed = PlayerPedId()
            local pHead = GetEntityHeading(myPed)
            local pos = GetEntityCoords(PlayerPedId(), true)
            local dist = GetDistanceBetweenCoords(housex,housey,housez, pos.x,pos.y,pos.z, 1)
            if dist > rangex then
                drawtext(Config.Language.outofrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.fourtocancel, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["4"]) then
                    placefurniture = false
                    placedobject = false
                    if objectxyz ~= nil then
                        DeleteObject(objectxyz)
                    end
                end
            else
                drawtext(Config.Language.gitemplace, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.fourtocancel, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.bonground, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.changemoverate, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.rotateitem1, 0.15, 0.22, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.rotateitem2, 0.15, 0.25, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.moveitem1, 0.15, 0.28, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.moveitem2, 0.15, 0.31, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.moveitem3, 0.15, 0.34, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.moveitem4, 0.15, 0.37, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.moveitem5, 0.15, 0.40, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.moveitem6, 0.15, 0.43, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.pressenterconfirm, 0.15, 0.46, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                

                if not HasModelLoaded(furnitem) then
                    RequestModel(furnitem)
                end
            
                while not HasModelLoaded(furnitem) do
                    Citizen.Wait(1)
                end
                if whenKeyJustPressed(Config.keys["G"]) then
                    if not placedobject then
                        objectxyz = CreateObject(furnitem, pos.x+1, pos.y+1, pos.z, true, true, false)
                        PlaceObjectOnGroundProperly(objectxyz)
                        SetEntityAsMissionEntity(objectxyz, true)
                        FreezeEntityPosition( objectxyz, true)
                        SetEntityAlpha(objectxyz, 153)
                        placedobject = true
                        pos2 = GetEntityCoords(objectxyz, true)
                        x,y,z = table.unpack(pos2)
                        h = GetEntityHeading(objectxyz)


                    end
                end
                if whenKeyJustPressed(Config.keys["B"]) then
                    if placedobject then
                        PlaceObjectOnGroundProperly(objectxyz)
                        local pos3 = GetEntityCoords(objectxyz, true)
                        z = pos3.z
                    end
                end
                if whenKeyJustPressed(Config.keys["UP"]) then
                    if placedobject then
                        SetEntityCoords(objectxyz, x, y, z + int, true, true, true, false)
                        z = z + int
                    end
                end
                if whenKeyJustPressed(Config.keys["DOWN"]) then
                    if placedobject then
                        SetEntityCoords(objectxyz, x, y, z - int, true, true, true, false)
                        z = z - int
                    end
                end
                if whenKeyJustPressed(Config.keys["LEFT"]) then
                    if placedobject then
                        SetEntityCoords(objectxyz, x- int, y , z , true, true, true, false)
                        x = x - int
                    end
                end
                if whenKeyJustPressed(Config.keys["RIGHT"]) then
                    if placedobject then
                        SetEntityCoords(objectxyz, x+ int, y , z , true, true, true, false)
                        x = x + int
                    end
                end
                if whenKeyJustPressed(Config.keys["LEFTBRACKET"]) then
                    if placedobject then
                        SetEntityCoords(objectxyz, x, y - int, z , true, true, true, false)
                        y = y - int
                    end
                end
                if whenKeyJustPressed(Config.keys["RIGHTBRACKET"]) then
                    if placedobject then
                        SetEntityCoords(objectxyz, x, y + int, z , true, true, true, false)
                        y = y + int
                    end
                end
                if whenKeyJustPressed(Config.keys["1"]) then
                    if placedobject then
                        h = h + 5
                        SetEntityHeading(objectxyz, h % 360)
                    end
                end
                if whenKeyJustPressed(Config.keys["2"]) then
                    if placedobject then
                        h = h - 5
                        SetEntityHeading(objectxyz, h % 360)
                    end
                end
                if whenKeyJustPressed(Config.keys["3"]) then
                    if Config.vorp then
                        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.changerateinfo, function(cb)
                             local testint =     tonumber(cb)
                             if testint ~= nil and testint ~= 0  then
                                if testint > 5 then
                                    int = 5 
                                elseif 0 > testint then
                                    int = 0.5
                                else
                                    int = testint
                                end
                             end
                        end)
                    end
                end
                if whenKeyJustPressed(Config.keys["4"]) then
                    placefurniture = false
                    placedobject = false
                    if objectxyz ~= nil then
                        DeleteObject(objectxyz)
                    end
                end
                if whenKeyJustPressed(Config.keys["ENTER"]) then
                    if placedobject then
                        xx = x
                        yy = y
                        zz = z
                        hh = h
                        placefurniture = false
                        placedobject = false
                        DeleteObject(objectxyz)
                        Citizen.Wait(500)
                        confirmmenu("confirmfurniturebuy","buyfurnimenu2")
                    end
                end
            end
        end  
        if sleep then
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("syn_housing:createhouse")
AddEventHandler("syn_housing:createhouse", function()
    if doorlocksevent and not doorlocksevent2 then 
        doorlocksevent = false
    elseif doorlocksevent2 then
        doorlocksevent2 = false
    else
        doorlocksevent = true
    end
    if show3d  then 
        show3d = false
    end
    range = 0   
    price = 0   
    tax = 0
    invspace = 0
    doorset = Config.Language.notset
    secondarydoors = {}
    doorinfo = {}
    changeloc = false   
    changeloc2 = false
end)

RegisterNetEvent("syn_housing:getplayeridentifier") 
AddEventHandler("syn_housing:getplayeridentifier", function(identifier,charidentifier)
    charid = charidentifier
    id = identifier
end)

RegisterNetEvent("syn_housing:getplayerjobinfo") 
AddEventHandler("syn_housing:getplayerjobinfo", function(job, rank,group)
    playerjob = job
    playerrank = rank
    playergroup = group
    pendingjob = false 
end)

RegisterNetEvent("syn_housing:recplayerfurni")
AddEventHandler("syn_housing:recplayerfurni", function(z)
    furniitems = z
    recfurniitems()
end)


RegisterNetEvent("syn_housing:ledger")
AddEventHandler("syn_housing:ledger", function(ledgers,ledger2)
    ledger = ledgers
    taxledger = ledger2
    pendingjob = false
end)

RegisterNetEvent("syn_housing:sendinterior")
AddEventHandler("syn_housing:sendinterior", function(x,y)
    -- you can send a y = 1 here to deal with player mlo homes 
    if x ~= 0 then 
        if y == 0 then 
            if Config.anticrashloop then 
                local location 
                if x.ishouse ~= nil then 
                    location = housegeneral[x.id].primarydoor[1]
                else
                    location = Config.motellocation[x.motel].PosEntrance
                end
                DoScreenFadeOut(1000)
                while IsScreenFadingOut() do
                  Wait(0)
                end
                SetEntityCoords(PlayerPedId(), location.x, location.y, location.z)
                Wait(1000)
                while IsPedFalling(PlayerPedId()) == 1 do 
                    Wait(1000)
                    SetEntityCoords(PlayerPedId(), location.x, location.y, location.z)
                end
                DoScreenFadeIn(1000)
                while IsScreenFadingIn() do
                  Wait(0)
                end
                Wait(60000)
                TriggerServerEvent("syn_housing:updatecharmotel",0,0,0,0)
            else
                TriggerEvent("syn_scene:stopscene",false)
                if x.ishouse ~= nil then 
                    insidetelehome = true 
                    activetelehome = housegeneral[x.id].otherdoors[1]
                    activehomeid = x.id
                    TriggerServerEvent('instanceplayer:setNamed', tonumber(activehomeid)+Config.bucketblock)
                    spawnfurnitureevent(activehomeid)
                else
                    activemotel = x.motel
                    motelident = x.id
                    insidemotel = true 
                    TriggerServerEvent('instanceplayer:setNamed', tonumber(motelident)+Config.bucketblock)
                end
            end
        end
    end
end)

RegisterNetEvent("syn_housing:soldhouses")
AddEventHandler("syn_housing:soldhouses", function(soldhouses)
    soldhousing = soldhouses
    getsolehouseinfo = false 
end)

RegisterNetEvent("syn_housing:listoutfits")
AddEventHandler("syn_housing:listoutfits", function(playeroutfits)
    poutifts = playeroutfits
    gettingoutfits = false 
end)

RegisterNetEvent("syn_housing:getskins")
AddEventHandler("syn_housing:getskins", function(skin)
    playerskin = skin
end)

function refreshfurni(id)
    despawnfurnitureevent(id)
    spawnfurnitureevent(id)
end
function spawnfurnitureevent(id)
    local furnitureplayer = housegeneral[id].furniture
    spawnedfurniture[id] = {}
    for k,v in pairs(furnitureplayer) do 
        local object = CreateObject(v.furnitem, v.x, v.y, v.z, false, true, false)
        SetEntityAsMissionEntity(object, true)
        FreezeEntityPosition( object, true)
        SetEntityHeading(object, v.h)
        table.insert(spawnedfurniture[id],object)
    end
end
function despawnfurnitureevent(id)
    if spawnedfurniture[id] ~= nil then 
        for k,v in pairs(spawnedfurniture[id]) do 
            DeleteObject(v)
        end
        spawnedfurniture[id] = nil 
    end
end

RegisterNetEvent("syn_housing:finddoorclient")
AddEventHandler("syn_housing:finddoorclient", function()
    TriggerServerEvent("syn_housing:find", 1)
end)

RegisterNetEvent("syn_housing:allowmenu")
AddEventHandler("syn_housing:allowmenu", function(x)
    allowmenu = x 
    checkinginmenu = false 
end)

RegisterNetEvent("syn_housing:getvariousinfo")
AddEventHandler("syn_housing:getvariousinfo", function(housinginfo,owner,id,selhousinginfo,selowner,refresh)
    if housinginfo ~= 0 then 
        housegeneral = housinginfo
    end
    if owner ~= 0 then 
        houseownership = owner
    end
    if id ~= 0 and id ~= nil then 
        if selhousinginfo ~= 0 then 
            housegeneral[id] = selhousinginfo
        end
        if selowner ~= 0 then 
            houseownership[id] = selowner
        end
    end
    if refresh == 1 then 
        refreshfurni(id)
    end
    TriggerEvent("syn_housing:createblips")
    onhold = false 
    onhold2 = false 
end)

RegisterNetEvent("syn_housing:sendmotelinfo")
AddEventHandler("syn_housing:sendmotelinfo", function(motel)
    playermotels = motel
    Wait(2000)
    processingmotel = false 
end)

if Config.vorp then
    RegisterNetEvent("vorp:SelectedCharacter")
    AddEventHandler("vorp:SelectedCharacter", function(charid)
        processingmotel = true
        TriggerServerEvent("syn_housing:bootupinforequest")
        TriggerServerEvent("syn_housing:getplayerid")
        Citizen.Wait(2000) 
        TriggerEvent("syn_housing:createblips")
        TriggerServerEvent("syn_housing:findmotel")
    end)
end
AddEventHandler(
    "onResourceStart",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            if Config.debug then 
                --DoScreenFadeIn(1000)
                processingmotel = true
                Citizen.Wait(5000)
                TriggerServerEvent("syn_housing:bootupinforequest")
                TriggerServerEvent("syn_housing:getplayerid")
                Citizen.Wait(2000)
                TriggerEvent("syn_housing:createblips")
                TriggerServerEvent("syn_housing:findmotel")
            end
        end
    end
)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for k,v in pairs(blips) do
                RemoveBlip(v)
            end
            for k,v in pairs(blips2) do
                RemoveBlip(v)
            end
            if tempObj ~= nil then
                DeleteObject(tempObj)
            end
            for k,v in pairs(spawnedfurniture) do 
                for x,y in pairs(v) do 
                    DeleteObject(y)
                end
            end
        end
    end
)

RegisterNetEvent("syn_housing:finddoors")
AddEventHandler("syn_housing:finddoors", function(doorslocations)
    houses = doorslocations
end)

function contains2(table, element)
    for k, v in pairs(table) do
        for x, y in pairs(v) do
            if y == element then
		    	return true
            end
        end
	end
	return false
end

function basiccontains(table, element)
	for k, v in pairs(table) do
		if v == element then
			return true
		end
	end
	return false
end
function iskeyholder(table, element)
	for k, v in pairs(table) do
        if v.charidentifier == element then 
			return true
		end
	end
	return false
end
RegisterNetEvent("syn_housing:createblips")
AddEventHandler("syn_housing:createblips", function()
    Citizen.Wait(2000)
    if next(blips) ~= nil then 
        for k,v in pairs(blips) do
            RemoveBlip(v)
        end
    end
    if next(blips2) ~= nil then 
        for k,v in pairs(blips2) do
            RemoveBlip(v)
        end
    end
    for k,v in pairs(houseownership) do 
        if v.owned == 0 then 
            local blip = N_0x554d9d53f696d002(1664425300, housegeneral[k].primarydoor[1].x, housegeneral[k].primarydoor[1].y, housegeneral[k].primarydoor[1].z)
            SetBlipScale(blip, 0.2)
            SetBlipSprite(blip, Config.housebliphash, 1) 
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.hsfrsale)
            blips[k] = blip
        elseif v.owned == 1 then 
            if (v.buyercharidentifier == charid) or iskeyholder(v.keyholders, charid) then 
                local blip = N_0x554d9d53f696d002(1664425300, housegeneral[k].primarydoor[1].x, housegeneral[k].primarydoor[1].y, housegeneral[k].primarydoor[1].z)
                SetBlipScale(blip, 0.2)
                SetBlipSprite(blip, Config.ownedhouseblip, 1)
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.mehome)
                blips[k] = blip
            end
        end
    end
    for k, v in pairs(Config.Locations) do
        local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
        SetBlipSprite(blip, v.blipsprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
        table.insert(blips2,blip)
    end
    for k, v in pairs(Config.motellocation) do
        local blip = N_0x554d9d53f696d002(1664425300, v.PosEntrance.x, v.PosEntrance.y, v.PosEntrance.z)
        SetBlipSprite(blip, v.blipsprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
        table.insert(blips2,blip)
    end
end)

Citizen.CreateThread(function()
    Wait(1000)
    local str = Config.Language.presstobuy
	buyhouse = PromptRegisterBegin()
	PromptSetControlAction(buyhouse, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(buyhouse, str)
	PromptSetEnabled(buyhouse, 1)
	PromptSetVisible(buyhouse, 1)
	PromptSetStandardMode(buyhouse,1)
	PromptSetGroup(buyhouse, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,buyhouse,true)
	PromptRegisterEnd(buyhouse)

    local str = Config.Language.presstomanage
	managehouse = PromptRegisterBegin()
	PromptSetControlAction(managehouse, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(managehouse, str)
	PromptSetEnabled(managehouse, 1)
	PromptSetVisible(managehouse, 1)
	PromptSetStandardMode(managehouse,1)
	PromptSetGroup(managehouse, prompts2)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,managehouse,true)
	PromptRegisterEnd(managehouse)
    
    local str = Config.Language.doorlock
	doorlock = PromptRegisterBegin()
	PromptSetControlAction(doorlock, Config.keys["SHIFT"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(doorlock, str)
	PromptSetStandardMode(doorlock,1)
	PromptSetGroup(doorlock, prompts2)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,doorlock,true)
	PromptRegisterEnd(doorlock)

    local str = Config.Language.exithouse
	exithouse = PromptRegisterBegin()
	PromptSetControlAction(exithouse, Config.keys["ALT"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(exithouse, str)
	PromptSetStandardMode(exithouse,1)
	PromptSetGroup(exithouse, prompts2)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,exithouse,true)
	PromptRegisterEnd(exithouse)

    local str = Config.Language.open
	changingprompt = PromptRegisterBegin()
	PromptSetControlAction(changingprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(changingprompt, str)
	PromptSetEnabled(changingprompt, 1)
	PromptSetVisible(changingprompt, 1)
	PromptSetStandardMode(changingprompt,1)
	PromptSetGroup(changingprompt, prompts3)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,changingprompt,true)
	PromptRegisterEnd(changingprompt)

    local str = Config.Language.open
	invprompt = PromptRegisterBegin()
	PromptSetControlAction(invprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(invprompt, str)
	PromptSetEnabled(invprompt, 1)
	PromptSetVisible(invprompt, 1)
	PromptSetStandardMode(invprompt,1)
	PromptSetGroup(invprompt, prompts4)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,invprompt,true)
	PromptRegisterEnd(invprompt)

    local str = Config.Language.open
	homeledgerprompt = PromptRegisterBegin()
	PromptSetControlAction(homeledgerprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(homeledgerprompt, str)
	PromptSetEnabled(homeledgerprompt, 1)
	PromptSetVisible(homeledgerprompt, 1)
	PromptSetStandardMode(homeledgerprompt,1)
	PromptSetGroup(homeledgerprompt, prompts5)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,homeledgerprompt,true)
	PromptRegisterEnd(homeledgerprompt)

    local str = Config.Language.presstoaccess
	entermotelprompt = PromptRegisterBegin()
	PromptSetControlAction(entermotelprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(entermotelprompt, str)
	PromptSetEnabled(entermotelprompt, 1)
	PromptSetVisible(entermotelprompt, 1)
	PromptSetStandardMode(entermotelprompt,1)
	PromptSetGroup(entermotelprompt, prompts6)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,entermotelprompt,true)
	PromptRegisterEnd(entermotelprompt)

    local str = Config.Language.presstobuyroom
	buyroomprompt = PromptRegisterBegin()
	PromptSetControlAction(buyroomprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(buyroomprompt, str)
	PromptSetEnabled(buyroomprompt, 1)
	PromptSetVisible(buyroomprompt, 1)
	PromptSetStandardMode(buyroomprompt,1)
	PromptSetGroup(buyroomprompt, prompts7)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,buyroomprompt,true)
	PromptRegisterEnd(buyroomprompt)

    local str = Config.Language.presstoexit
	exitmotelprompt = PromptRegisterBegin()
	PromptSetControlAction(exitmotelprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(exitmotelprompt, str)
	PromptSetEnabled(exitmotelprompt, 1)
	PromptSetVisible(exitmotelprompt, 1)
	PromptSetStandardMode(exitmotelprompt,1)
	PromptSetGroup(exitmotelprompt, prompts8)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,exitmotelprompt,true)
	PromptRegisterEnd(exitmotelprompt)

    local str = Config.Language.open
	invprompt2 = PromptRegisterBegin()
	PromptSetControlAction(invprompt2, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(invprompt2, str)
	PromptSetEnabled(invprompt2, 1)
	PromptSetVisible(invprompt2, 1)
	PromptSetStandardMode(invprompt2,1)
	PromptSetGroup(invprompt2, prompts9)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,invprompt2,true)
	PromptRegisterEnd(invprompt2)

    
    local str = Config.Language.open
	wardroveprompt = PromptRegisterBegin()
	PromptSetControlAction(wardroveprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(wardroveprompt, str)
	PromptSetEnabled(wardroveprompt, 1)
	PromptSetVisible(wardroveprompt, 1)
	PromptSetStandardMode(wardroveprompt,1)
	PromptSetGroup(wardroveprompt, prompts10)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,wardroveprompt,true)
	PromptRegisterEnd(wardroveprompt)

    local str = Config.Language.enterhouse
	enterhouse = PromptRegisterBegin()
	PromptSetControlAction(enterhouse, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(enterhouse, str)
	PromptSetEnabled(enterhouse, 1)
	PromptSetVisible(enterhouse, 1)
	PromptSetStandardMode(enterhouse,1)
	PromptSetGroup(enterhouse, prompts11)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,enterhouse,true)
	PromptRegisterEnd(enterhouse)

    local str = Config.Language.knockprompt
	knockprompt = PromptRegisterBegin()
	PromptSetControlAction(knockprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(knockprompt, str)
	PromptSetEnabled(knockprompt, 1)
	PromptSetVisible(knockprompt, 1)
	PromptSetStandardMode(knockprompt,1)
	PromptSetGroup(knockprompt, prompts12)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,knockprompt,true)
	PromptRegisterEnd(knockprompt)

    local str = Config.Language.allowinprompt
	allowinprompt = PromptRegisterBegin()
	PromptSetControlAction(allowinprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(allowinprompt, str)
	PromptSetEnabled(allowinprompt, 1)
	PromptSetVisible(allowinprompt, 1)
	PromptSetStandardMode(allowinprompt,1)
	PromptSetGroup(allowinprompt, prompts13)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,allowinprompt,true)
	PromptRegisterEnd(allowinprompt)

    local str = Config.Language.declineprompt
	declineprompt = PromptRegisterBegin()
	PromptSetControlAction(declineprompt, Config.keys["ALT"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(declineprompt, str)
	PromptSetEnabled(declineprompt, 1)
	PromptSetVisible(declineprompt, 1)
	PromptSetStandardMode(declineprompt,1)
	PromptSetGroup(declineprompt, prompts13)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,declineprompt,true)
	PromptRegisterEnd(declineprompt)

    local str = Config.Language.exithouse
	exitprompt2 = PromptRegisterBegin()
	PromptSetControlAction(exitprompt2, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(exitprompt2, str)
	PromptSetEnabled(exitprompt2, 1)
	PromptSetVisible(exitprompt2, 1)
	PromptSetStandardMode(exitprompt2,1)
	PromptSetGroup(exitprompt2, prompts14)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,exitprompt2,true)
	PromptRegisterEnd(exitprompt2)
end)

AddEventHandler('menuapi:closemenu', function()
    inmenu = false
    FreezeEntityPosition(PlayerPedId(),false)
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent("syn_housing:closemenu",globalhouseid)
end)
RegisterNetEvent("syn:closeinv")
AddEventHandler("syn:closeinv", function()
    inmenu = false
    TriggerServerEvent("syn_housing:closemenu",globalhouseid)
end)

RegisterNetEvent("syn_housing:doorknocked")
AddEventHandler("syn_housing:doorknocked", function(id)
    knocker = id 
    doorknocked = true 
    Wait(60000)
    doorknocked = false  
end)
Citizen.CreateThread(function() -- door knocked 
    while true do
        Citizen.Wait(2)
        local sleep = true
        if doorknocked then 
            sleep = false 
            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.doorknocked)
            PromptSetActiveGroupThisFrame(prompts13, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,allowinprompt) then
                TriggerServerEvent("syn_housing:allowin",knocker,activehomeid)
                doorknocked = false  
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,declineprompt) then
                doorknocked = false
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

RegisterNetEvent("syn_housing:allowentry")
AddEventHandler("syn_housing:allowentry", function(id)
    isaguest = true 
    insidetelehome = true 
    activetelehome = housegeneral[id].otherdoors[1]
    activehomeid = id
    TriggerEvent("syn_scene:stopscene",false)
    TriggerServerEvent("syn_housing:updatecharmotel",activetelehome,activehomeid,1,1)
    DoScreenFadeOut(1000)
    while IsScreenFadingOut() do
      Wait(0)
    end
    TriggerServerEvent('instanceplayer:setNamed', tonumber(activehomeid)+Config.bucketblock)
    SetEntityCoords(PlayerPedId(), Config.teleporterhouses[activetelehome].location.x, Config.teleporterhouses[activetelehome].location.y, Config.teleporterhouses[activetelehome].location.z)
    Wait(1000)
    while IsPedFalling(PlayerPedId()) == 1 do 
        Wait(1000)
        SetEntityCoords(PlayerPedId(), Config.teleporterhouses[activetelehome].location.x, Config.teleporterhouses[activetelehome].location.y, Config.teleporterhouses[activetelehome].location.z)
    end
    DoScreenFadeIn(1000)
    while IsScreenFadingIn() do
      Wait(0)
    end
    local playerindex = NetworkGetPlayerIndexFromPed(PlayerPedId())                                
    local serverid = GetPlayerServerId(playerindex)
    if housedistance[activehomeid] == nil then 
        housedistance[activehomeid] = {}
    end
    if not basiccontains(housedistance[activehomeid], serverid) then 
        TriggerServerEvent("syn_housing:playersnearby",activehomeid,"add")
        TriggerServerEvent("syn_housing:recclosehouse",activehomeid)
        spawnfurnitureevent(activehomeid)
        table.insert(housedistance[activehomeid],serverid)
    end
end)

Citizen.CreateThread(function() -- inside tele house logic 
    while true do
        Citizen.Wait(2)
        local sleep = true 
        if insidetelehome then 
            local coords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(coords, Config.teleporterhouses[activetelehome].location.x,Config.teleporterhouses[activetelehome].location.y,Config.teleporterhouses[activetelehome].location.z , true)
            local id = activehomeid 
            if isaguest then 
                if 1 >= distance then
                    sleep = false
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                    PromptSetActiveGroupThisFrame(prompts14, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,exitprompt2) then
                        isaguest = false  
                        local playerindex = NetworkGetPlayerIndexFromPed(PlayerPedId())                                
                        local serverid = GetPlayerServerId(playerindex)
                        if basiccontains(housedistance[id], serverid) then 
                            TriggerServerEvent("syn_housing:playersnearby",id,"remove")
                            for x,y in pairs(housedistance[id]) do 
                                if y == serverid then 
                                    despawnfurnitureevent(id)
                                    housedistance[id][x] = nil 
                                end
                            end
                        end 
                        PromptSetEnabled(exithouse, 0)
                        PromptSetVisible(exithouse, 0)
                        insidetelehome = false 
                        TriggerEvent("syn_scene:stopscene",true)
                        TriggerServerEvent("syn_housing:updatecharmotel",0,0,0,0)
                        DoScreenFadeOut(1000)
                        while IsScreenFadingOut() do
                          Wait(0)
                        end
                        SetEntityCoords(PlayerPedId(), housegeneral[id].primarydoor[1].x, housegeneral[id].primarydoor[1].y, housegeneral[id].primarydoor[1].z)
                        TriggerServerEvent('instanceplayer:setNamed', 0)
                        Wait(1000)
                        while IsPedFalling(PlayerPedId()) == 1 do 
                            Wait(1000)
                            SetEntityCoords(PlayerPedId(), housegeneral[id].primarydoor[1].x, housegeneral[id].primarydoor[1].y, housegeneral[id].primarydoor[1].z)
                        end
                        DoScreenFadeIn(1000)
                        while IsScreenFadingIn() do
                          Wait(0)
                        end
                    end
                end
            end
            if iskeyholder(houseownership[id].keyholders, charid) or houseownership[id].buyercharidentifier == charid then
                if 1 >= distance and not inmenu  then
                    sleep = false 
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                    PromptSetActiveGroupThisFrame(prompts2, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,managehouse) then
                        houseidx = id
                        globalhouseid = activehomeid
                        checkinginmenu = true 
                        TriggerServerEvent("syn_housing:checkmenu",houseidx)
                        while checkinginmenu do 
                            Wait(100)
                        end
                        if allowmenu then
                            TriggerServerEvent("syn_housing:inmenu",houseidx)
                            FreezeEntityPosition(PlayerPedId(),true)
                            TaskStandStill(PlayerPedId(), -1)        
                            inmenu = true 
                            pricex = housegeneral[houseidx].price
                            rangex = 5000
                            housex = housegeneral[houseidx].primarydoor[1].x
                            housey = housegeneral[houseidx].primarydoor[1].y
                            housez = housegeneral[houseidx].primarydoor[1].z
                            taxx = housegeneral[houseidx].tax
                            furniturex = housegeneral[houseidx].furniture
                            invspacex = housegeneral[houseidx].invspace
                            upgradex = housegeneral[houseidx].upgrade
                            keyholdersx = houseownership[houseidx].keyholders
                            pendingjob = true 
                            TriggerServerEvent("syn_housing:findledger", houseidx)
                            while pendingjob do 
                                Wait(100)
                            end
                            Citizen.Wait(500)
                            managehomemenu()
                        else
                            TriggerEvent("vorp:TipBottom", Config.Language.menuinuse, 4000)
                        end
                    end
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,exithouse) then
                        local playerindex = NetworkGetPlayerIndexFromPed(PlayerPedId())                                
                        local serverid = GetPlayerServerId(playerindex)
                        if basiccontains(housedistance[id], serverid) then 
                            TriggerServerEvent("syn_housing:playersnearby",id,"remove")
                            for x,y in pairs(housedistance[id]) do 
                                if y == serverid then 
                                    despawnfurnitureevent(id)
                                    housedistance[id][x] = nil 
                                end
                            end
                        end 
                        PromptSetEnabled(exithouse, 0)
                        PromptSetVisible(exithouse, 0)
                        insidetelehome = false 
                        TriggerEvent("syn_scene:stopscene",true)
                        TriggerServerEvent("syn_housing:updatecharmotel",0,0,0,0)
                        DoScreenFadeOut(1000)
                        while IsScreenFadingOut() do
                          Wait(0)
                        end
                        SetEntityCoords(PlayerPedId(), housegeneral[id].primarydoor[1].x, housegeneral[id].primarydoor[1].y, housegeneral[id].primarydoor[1].z)
                        TriggerServerEvent('instanceplayer:setNamed', 0)
                        Wait(1000)
                        while IsPedFalling(PlayerPedId()) == 1 do 
                            Wait(1000)
                            SetEntityCoords(PlayerPedId(), housegeneral[id].primarydoor[1].x, housegeneral[id].primarydoor[1].y, housegeneral[id].primarydoor[1].z)
                        end
                        DoScreenFadeIn(1000)
                        while IsScreenFadingIn() do
                          Wait(0)
                        end
                    end
                end
            end
            if houseownership[id] ~= nil then 
                if iskeyholder(houseownership[id].keyholders, charid) or houseownership[id].buyercharidentifier == charid then
                    local houseinfo = housegeneral[id]
                    if not placefurniture and not inmenu then 
                        if next(houseinfo.changingroom) ~= nil then
                            local changingroomlocation = vector3(houseinfo.changingroom.x,houseinfo.changingroom.y,houseinfo.changingroom.z)
                            local distance = GetDistanceBetweenCoords(coords,changingroomlocation, true)
                            if 1 > distance then 
                                sleep = false  
                                local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.pressforchangingroom)
                                PromptSetActiveGroupThisFrame(prompts3, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,changingprompt) then
                                    inmenu = true 
                                    gettingoutfits = true 
                                    if Config.vorp then
                                        TriggerServerEvent("syn_housing:getskin")
                                    end
                                    TriggerServerEvent("syn_housing:getoutfits")
                                    while gettingoutfits do 
                                        Wait(100)
                                    end
                                    changingmenu()
                                end
                            end
                        end
                        if next(houseinfo.invlocation) ~= nil then
                            local inventorylocation = vector3(houseinfo.invlocation.x,houseinfo.invlocation.y,houseinfo.invlocation.z)
                            local distance = GetDistanceBetweenCoords(coords,inventorylocation, true)
                            if 1 > distance then 
                                sleep = false 
                                local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.pressforinvent)
                                PromptSetActiveGroupThisFrame(prompts4, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,invprompt) then
                                    globalhouseid = id
                                    checkinginmenu = true 
                                    if Config.vorp then
                                        TriggerServerEvent("syn_housing:checkmenu",globalhouseid)
                                        while checkinginmenu do 
                                            Wait(100)
                                        end
                                        if allowmenu then
                                            TriggerServerEvent("syn_housing:inmenu",globalhouseid) 
                                            inmenu = true
                                            TriggerServerEvent("syn_housing:ReloadHouseInventory", globalhouseid)
                                            TriggerEvent("vorp_inventory:OpenHouseInventory", "House Inventory", globalhouseid,houseinfo.invspace)
                                        else
                                            TriggerEvent("vorp:TipBottom", Config.Language.menuinuse, 4000)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function() -- near house logic 
    while true do
        Citizen.Wait(2)
        local sleep = true 
        for k,v in pairs(housegeneral) do 
            if v.type == 0 or v.type == 3 or v.type == 4 then
                if v.type == 3 then 
                    PromptSetEnabled(doorlock, 0)
                    PromptSetVisible(doorlock, 0)  
                end
                if v.type == 0 then 
                    PromptSetEnabled(doorlock, 1)
                    PromptSetVisible(doorlock, 1)  
                end
                local coords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(coords,v.primarydoor[1].x,v.primarydoor[1].y,v.primarydoor[1].z , true)
                if 3 >= distance  then
                    sleep = false 
                    if houseownership[k].owned == 0 then 
                        access = true
                        access1 = false
                        access2 = false 
                    elseif houseownership[k].owned == 1  then 
                        if v.type == 4 then 
                            access = false 
                            access1 = false
                            if houseownership[k].buyercharidentifier == charid then 
                                access2 = true
                                knock = false 
                                owner = true
                            elseif iskeyholder(houseownership[k].keyholders, charid) then 
                                access2 = true
                                knock = false 
                                owner = false
                            else
                                knock = true 
                                access2 = false
                                owner = false
                            end
                        end
                        if v.type == 0 or v.type == 3 then 
                            PromptSetEnabled(exithouse, 0)
                            PromptSetVisible(exithouse, 0)            
                            if houseownership[k].buyercharidentifier == charid then 
                                access = false 
                                access1 = true
                                access2 = false 
                                owner = true
                            elseif iskeyholder(houseownership[k].keyholders, charid) then 
                                access = false 
                                access1 = true
                                access2 = false 
                                owner = false
                            else
                                access = false 
                                access1 = false
                                access2 = false 
                                owner = false
                            end
                        end
                    end
                    if not placefurniture and not onhold and not inmenu then 
                        if access then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                            PromptSetActiveGroupThisFrame(prompts, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,buyhouse) then
                                houseidx = k
                                globalhouseid = k
                                checkinginmenu = true 
                                TriggerServerEvent("syn_housing:checkmenu",houseidx)
                                while checkinginmenu do 
                                    Wait(100)
                                end
                                if allowmenu then 
                                    TriggerServerEvent("syn_housing:inmenu",houseidx)
                                    pendingjob = true 
                                    TriggerServerEvent("syn_housing:getplayerjob")
                                    while pendingjob do 
                                        Wait(100)
                                    end
                                    pricex = v.price
                                    repo = houseownership[k].repo
                                    taxx = v.tax
                                    sellercharid = v.sellercharidentifier
                                    sellerid = v.selleridentifier
                                    invspacex = v.invspace
                                    FreezeEntityPosition(PlayerPedId(),true)
                                    TaskStandStill(PlayerPedId(), -1)        
                                    inmenu = true 
                                    buyhomemenu()
                                else
                                    TriggerEvent("vorp:TipBottom", Config.Language.menuinuse, 4000)
                                end
                            end
                        elseif knock then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                            PromptSetActiveGroupThisFrame(prompts12, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,knockprompt) then
                                TriggerServerEvent("syn_housing:asktoenter",k)
                                Wait(60000)
                            end
                        elseif access2 and not insidetelehome then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                            PromptSetActiveGroupThisFrame(prompts11, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,enterhouse) then
                                insidetelehome = true 
                                activetelehome = v.otherdoors[1]
                                activehomeid = k
                                doorlockanimation()
                                TriggerEvent("syn_scene:stopscene",false)
                                TriggerServerEvent("syn_housing:updatecharmotel",activetelehome,activehomeid,1,1)
                                DoScreenFadeOut(1000)
                                while IsScreenFadingOut() do
                                  Wait(0)
                                end
                                TriggerServerEvent('instanceplayer:setNamed', tonumber(activehomeid)+Config.bucketblock)
                                SetEntityCoords(PlayerPedId(), Config.teleporterhouses[activetelehome].location.x, Config.teleporterhouses[activetelehome].location.y, Config.teleporterhouses[activetelehome].location.z)
                                Wait(1000)
                                while IsPedFalling(PlayerPedId()) == 1 do 
                                    Wait(1000)
                                    SetEntityCoords(PlayerPedId(), Config.teleporterhouses[activetelehome].location.x, Config.teleporterhouses[activetelehome].location.y, Config.teleporterhouses[activetelehome].location.z)
                                end
                                DoScreenFadeIn(1000)
                                while IsScreenFadingIn() do
                                  Wait(0)
                                end
                                local playerindex = NetworkGetPlayerIndexFromPed(PlayerPedId())                                
                                local serverid = GetPlayerServerId(playerindex)
                                if housedistance[k] == nil then 
                                    housedistance[k] = {}
                                end
                                if not basiccontains(housedistance[k], serverid) then 
                                    TriggerServerEvent("syn_housing:playersnearby",k,"add")
                                    TriggerServerEvent("syn_housing:recclosehouse",k)
                                    spawnfurnitureevent(k)
                                    table.insert(housedistance[k],serverid)
                                end
                                PromptSetEnabled(exithouse, 1)
                                PromptSetVisible(exithouse, 1) 
                            end
                        elseif access1 then                        
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                            PromptSetActiveGroupThisFrame(prompts2, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,managehouse) then
                                houseidx = k
                                globalhouseid = k
                                checkinginmenu = true 
                                TriggerServerEvent("syn_housing:checkmenu",houseidx)
                                while checkinginmenu do 
                                    Wait(100)
                                end
                                if allowmenu then
                                    TriggerServerEvent("syn_housing:inmenu",houseidx)
                                        FreezeEntityPosition(PlayerPedId(),true)
                                        TaskStandStill(PlayerPedId(), -1)        
                                        inmenu = true 
                                        pricex = v.price
                                        rangex = v.range
                                        housex = v.primarydoor[1].x
                                        housey = v.primarydoor[1].y
                                        housez = v.primarydoor[1].z
                                        taxx = v.tax
                                        furniturex = v.furniture
                                        invspacex = v.invspace
                                        upgradex = v.upgrade
                                        keyholdersx = houseownership[k].keyholders
                                        pendingjob = true 
                                        TriggerServerEvent("syn_housing:findledger", houseidx)
                                        while pendingjob do 
                                            Wait(100)
                                        end
                                        Citizen.Wait(500)
                                        managehomemenu()
                                    
                                else
                                    TriggerEvent("vorp:TipBottom", Config.Language.menuinuse, 4000)
                                end
                            end
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()-- door locking
    while true do
        Citizen.Wait(2)
        local sleep = true 
        if next(housedistance) ~= nil then 
            for x,y in pairs(housedistance) do
                sleep = false  
                local id = x 
                if housegeneral[id] ~= nil then 
                    local type = housegeneral[id].type
                    if type == 0 then 
                        local primarydoor =  housegeneral[id].primarydoor[1]
                        local otherdoor = housegeneral[id].otherdoors
                        local primarydoorloc = vector3(housegeneral[id].primarydoor[1].x, housegeneral[id].primarydoor[1].y, housegeneral[id].primarydoor[1].z)
                        local coords = GetEntityCoords(PlayerPedId())
                        local distance = GetDistanceBetweenCoords(coords,primarydoorloc, true)
                        if primarydoor.locked then 
                       if DoorSystemGetOpenRatio(primarydoor.objc) ~= 0.0 then
                           DoorSystemSetOpenRatio(primarydoor.objc, 0.0, true)
                           local object = Citizen.InvokeNative(0xF7424890E4A094C0, primarydoor.objc, 0)
                           SetEntityRotation(object, primarydoor.objYaw1, primarydoor.objYaw2, primarydoor.objYaw3, 2, true)
                       end
                       if DoorSystemGetDoorState(primarydoor.objc) ~= 1 then
                           Citizen.CreateThread(function()
                               Citizen.InvokeNative(0xD99229FE93B46286,primarydoor.objc,1,1,0,0,0,0)
                           end) 
                           local object = Citizen.InvokeNative(0xF7424890E4A094C0, primarydoor.objc, 0)
                           SetEntityRotation(object, primarydoor.objYaw1, primarydoor.objYaw2, primarydoor.objYaw3, 2, true)
                           Citizen.InvokeNative(0x6BAB9442830C7F53,primarydoor.objc,1)
                       end 
                        else
                        if DoorSystemGetDoorState(primarydoor.objc) ~= 0 then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,primarydoor.objc,1,1,0,0,0,0)
                            end) 
                            local object = Citizen.InvokeNative(0xF7424890E4A094C0, primarydoor.objc, 0)
                            SetEntityRotation(object, primarydoor.objYaw1, primarydoor.objYaw2, primarydoor.objYaw3, 2, true)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,primarydoor.objc,0)
                        end 
                        end
                        if distance < 3 then 
                        typez = 1 
                        secid = 0 
                        drawicon(primarydoor.o, primarydoor.p, primarydoor.q, " " ,primarydoor.locked)
                        if placefurniture == false then
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,doorlock) then
                                TriggerServerEvent("syn_housing:updatedoorstate",id, typez ,secid)
                                doorlockanimation()
                                Wait(500)
                            end
                        end
                        end
                        if next(otherdoor) ~= nil then
                        for l,m in pairs(otherdoor) do 
                            if m.locked then
                                if DoorSystemGetOpenRatio(m.objc) ~= 0.0 then
                                   DoorSystemSetOpenRatio(m.objc, 0.0, true)
                                   local object = Citizen.InvokeNative(0xF7424890E4A094C0, m.objc, 0)
                                   SetEntityRotation(object, m.objYaw1, m.objYaw2, m.objYaw3, 2, true)
                               end
                               if DoorSystemGetDoorState(m.objc) ~= 1 then
                                   Citizen.CreateThread(function()
                                       Citizen.InvokeNative(0xD99229FE93B46286,m.objc,1,1,0,0,0,0)
                                   end) 
                                   local object = Citizen.InvokeNative(0xF7424890E4A094C0, m.objc, 0)
                                   SetEntityRotation(object, m.objYaw1, m.objYaw2, m.objYaw3, 2, true)
                                   Citizen.InvokeNative(0x6BAB9442830C7F53,m.objc,1)
                               end 
                           else
                               if DoorSystemGetDoorState(m.objc) ~= 0 then
                                   Citizen.CreateThread(function()
                                       Citizen.InvokeNative(0xD99229FE93B46286,m.objc,1,1,0,0,0,0)
                                   end) 
                                   local object = Citizen.InvokeNative(0xF7424890E4A094C0, m.objc, 0)
                                   SetEntityRotation(object, m.objYaw1, m.objYaw2, m.objYaw3, 2, true)
                                   Citizen.InvokeNative(0x6BAB9442830C7F53,m.objc,0)
                               end 
                           end
                            local otherdoorloc = vector3(m.x, m.y, m.z)
                            local distance2 = GetDistanceBetweenCoords(coords,otherdoorloc, true)
                            if distance2 < 3 then 
                                typez = 2 
                                secid = m.secondarydoorid      
                                drawicon(m.o, m.p, m.q, " " ,m.locked)
                                if placefurniture == false then
                                    if iskeyholder(houseownership[id].keyholders, charid) or houseownership[id].buyercharidentifier == charid then
                                        PromptSetEnabled(doorlock, 1)
                                        PromptSetVisible(doorlock, 1)                                    
                                        local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.house)
                                        PromptSetActiveGroupThisFrame(prompts2, label)
                                        if Citizen.InvokeNative(0xC92AC953F0A982AE,doorlock) then
                                            TriggerServerEvent("syn_housing:updatedoorstate",id, typez ,secid)
                                            doorlockanimation()
                                            Wait(500)
                                        end
                                    else
                                        PromptSetEnabled(doorlock, 0)
                                        PromptSetVisible(doorlock, 0)                                    
                                    end
                                end        
                            end
                        end
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function() -- loop to add player to list of near by players
    while true do
        Citizen.Wait(500)
        if next(housegeneral) ~= nil then 
            for k,v in pairs(housegeneral) do 
                if v.type == 0 or v.type == 3 then 
                    local coords = GetEntityCoords(PlayerPedId())
                    local distance = GetDistanceBetweenCoords(coords,v.primarydoor[1].x,v.primarydoor[1].y,v.primarydoor[1].z , true)
                    local playerindex = NetworkGetPlayerIndexFromPed(PlayerPedId())                                
                    local serverid = GetPlayerServerId(playerindex)
                    if housedistance[k] == nil then 
                        housedistance[k] = {}
                    end
                    if Config.renderdistance >= distance  then
                        if not basiccontains(housedistance[k], serverid) then 
                            TriggerServerEvent("syn_housing:playersnearby",k,"add")
                            TriggerServerEvent("syn_housing:recclosehouse",k)
                            spawnfurnitureevent(k)
                            table.insert(housedistance[k],serverid)
                        end
                    else
                        if basiccontains(housedistance[k], serverid) then 
                            TriggerServerEvent("syn_housing:playersnearby",k,"remove")
                            for x,y in pairs(housedistance[k]) do 
                                if y == serverid then 
                                    despawnfurnitureevent(k)
                                    housedistance[k][x] = nil 
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
function doorlockanimation()
    FreezeEntityPosition(PlayerPedId(),true)
    ped = PlayerPedId()
    ClearPedTasks(ped)
    prop_name = 'P_KEY02X'
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local key = false
    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        local waiting = 0
        RequestAnimDict("script_common@jail_cell@unlock@key")
        while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                break
            end
        end
        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        Wait(1000)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        key = true
        while key do
            if IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
                Wait(100)
            else
                ClearPedSecondaryTask(ped)
                DeleteObject(prop)
                RemoveAnimDict("script_common@jail_cell@unlock@key")
                key = false
                break
            end
        end
    end   
    FreezeEntityPosition(PlayerPedId(),false)
    ClearPedTasks(PlayerPedId())
end

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(2)
        local sleep = true 
        if next(housedistance) ~= nil then 
            for x,y in pairs(housedistance) do
                local id = x 
                if houseownership[id] ~= nil then 
                    if iskeyholder(houseownership[id].keyholders, charid) or houseownership[id].buyercharidentifier == charid then
                        local houseinfo = housegeneral[id]
                        local coords = GetEntityCoords(PlayerPedId())
                        if not placefurniture and not inmenu then 
                            if next(houseinfo.changingroom) ~= nil then
                                local changingroomlocation = vector3(houseinfo.changingroom.x,houseinfo.changingroom.y,houseinfo.changingroom.z)
                                local distance = GetDistanceBetweenCoords(coords,changingroomlocation, true)
                                if 3 > distance then 
                                    sleep = false  
                                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.pressforchangingroom)
                                    PromptSetActiveGroupThisFrame(prompts3, label)
                                    if Citizen.InvokeNative(0xC92AC953F0A982AE,changingprompt) then
                                        inmenu = true 
                                        gettingoutfits = true 
                                        if Config.vorp then
                                            TriggerServerEvent("syn_housing:getskin")
                                        end
                                        TriggerServerEvent("syn_housing:getoutfits")
                                        while gettingoutfits do 
                                            Wait(100)
                                        end
                                        changingmenu()
                                    end
                                end
                            end
                            if next(houseinfo.invlocation) ~= nil then
                                local inventorylocation = vector3(houseinfo.invlocation.x,houseinfo.invlocation.y,houseinfo.invlocation.z)
                                local distance = GetDistanceBetweenCoords(coords,inventorylocation, true)
                                if 3 > distance then 
                                    sleep = false 
                                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.pressforinvent)
                                    PromptSetActiveGroupThisFrame(prompts4, label)
                                    if Citizen.InvokeNative(0xC92AC953F0A982AE,invprompt) then
                                        globalhouseid = id
                                        checkinginmenu = true 
                                        if Config.vorp then
                                            TriggerServerEvent("syn_housing:checkmenu",globalhouseid)
                                            while checkinginmenu do 
                                                Wait(100)
                                            end
                                            if allowmenu then
                                                TriggerServerEvent("syn_housing:inmenu",globalhouseid) 
                                                inmenu = true
                                                TriggerServerEvent("syn_housing:ReloadHouseInventory", globalhouseid)
                                                TriggerEvent("vorp_inventory:OpenHouseInventory", "House Inventory", globalhouseid,houseinfo.invspace)
                                            else
                                                TriggerEvent("vorp:TipBottom", Config.Language.menuinuse, 4000)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true 
        if not inmenu then 
            for k,v in pairs(Config.Locations) do 
                local coords  = GetEntityCoords(PlayerPedId())
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2 then
                    sleep = false 
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.soldhomeledger)
                    PromptSetActiveGroupThisFrame(prompts5, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,homeledgerprompt) then
                        inmenu = true 
                        getsolehouseinfo = true 
                        TriggerServerEvent("syn_housing:findsoldhouseinfo")
                        while getsolehouseinfo do 
                            Wait(100)
                        end
                        soldhomeledger()
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

function contain(table, element)
    for k, v in pairs(table) do
          if v.type == element then
            return true
        end
    end
    return false
end

function hasmotelroom(moteltype)
    for k,v in pairs(playermotels) do
        if v == moteltype then 
            return true,k
        end
    end
    return false 
end

Citizen.CreateThread(function() -- motel
    while true do
      Citizen.Wait(0)
        local sleep = true 
        for k,v in pairs(Config.motellocation) do 
            if not processingmotel then 
                local coords = GetEntityCoords(PlayerPedId())
                if not insidemotel then 
                    if GetDistanceBetweenCoords(coords, v.PosEntrance.x, v.PosEntrance.y, v.PosEntrance.z, true) < 1 then
                        sleep = false 
                        local hasmotel,motelid = hasmotelroom(k) 
                        if hasmotel then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.motel)
                            PromptSetActiveGroupThisFrame(prompts6, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,entermotelprompt) then
                                insidemotel = true 
                                activemotel = k
                                motelident = motelid
                                doorlockanimation()
                                TriggerEvent("syn_scene:stopscene",false)
                                TriggerServerEvent("syn_housing:updatecharmotel",activemotel,motelident,1,0)
                                DoScreenFadeOut(1000)
                                while IsScreenFadingOut() do
                                  Wait(0)
                                end
                                SetEntityCoords(PlayerPedId(), v.PosExit.x, v.PosExit.y, v.PosExit.z)
                                TriggerServerEvent('instanceplayer:setNamed', tonumber(motelident)+Config.bucketblock)
                                Wait(1000)
                                while IsPedFalling(PlayerPedId()) == 1 do 
                                    Wait(1000)
                                    SetEntityCoords(PlayerPedId(), v.PosExit.x, v.PosExit.y, v.PosExit.z)
                                end
                                DoScreenFadeIn(1000)
                                while IsScreenFadingIn() do
                                  Wait(0)
                                end
                            end
                        elseif not hasmotel then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.motel..": $"..v.price)
                            PromptSetActiveGroupThisFrame(prompts7, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,buyroomprompt) then
                                processingmotel = true 
                                local price = v.price
                                local invspace = v.inventorylimit
                                TriggerServerEvent("syn_housing:createmotelroom",price,invspace,k)
                            end
                        end
                    end
                elseif insidemotel then 
                    local hasmotel,motelid = hasmotelroom(activemotel) 
                    local location = Config.motellocation[activemotel]
                    if GetDistanceBetweenCoords(coords, location.PosExit.x, location.PosExit.y, location.PosExit.z, true) < 1 then
                        sleep = false
                        local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.motel)
                        PromptSetActiveGroupThisFrame(prompts8, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,exitmotelprompt) then
                            doorlockanimation()
                            TriggerEvent("syn_scene:stopscene",true)
                            TriggerServerEvent("syn_housing:updatecharmotel",0,0,0,0)
                            DoScreenFadeOut(1000)
                            while IsScreenFadingOut() do
                              Wait(0)
                            end
                            SetEntityCoords(PlayerPedId(), location.PosEntrance.x, location.PosEntrance.y, location.PosEntrance.z)
                            TriggerServerEvent('instanceplayer:setNamed', 0)
                            Wait(1000)
                            while IsPedFalling(PlayerPedId()) == 1 do 
                                Wait(1000)
                                SetEntityCoords(PlayerPedId(), location.PosEntrance.x, location.PosEntrance.y, location.PosEntrance.z)
                            end
                            DoScreenFadeIn(1000)
                            while IsScreenFadingIn() do
                              Wait(0)
                            end
                            insidemotel = false
                            activemotel = nil
                            motelident = nil
                        end
                    end
                    if hasmotel and not inmenu then 
                        if motelident == motelid then 
                            if GetDistanceBetweenCoords(coords, location.PosInventory.x, location.PosInventory.y, location.PosInventory.z, true) < 1 then
                                sleep = false
                                local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.pressforinvent)
                                PromptSetActiveGroupThisFrame(prompts9, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,invprompt2) then
                                    inmenu = true 
                                    TriggerServerEvent("syn_housing:ReloadHouseInventory", motelident)
                                    TriggerEvent("vorp_inventory:OpenHouseInventory", Config.Language.pressforinvent, motelident,location.inventorylimit)                
                                end
                            end
                            if GetDistanceBetweenCoords(coords, location.PosChangingroom.x, location.PosChangingroom.y, location.PosChangingroom.z, true) < 1 then
                                sleep = false
                                local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.changingroom)
                                PromptSetActiveGroupThisFrame(prompts10, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,wardroveprompt) then
                                    inmenu = true 
                                    gettingoutfits = true 
                                    if Config.vorp then
                                        TriggerServerEvent("syn_housing:getskin")
                                    end
                                    TriggerServerEvent("syn_housing:getoutfits")
                                    while gettingoutfits do 
                                        Wait(100)
                                    end
                                    changingmenu()
                                end
                            end
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)



Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local sleep = true
        if findchangingroom then 
            sleep = false
            local coords = GetEntityCoords(PlayerPedId())
            drawtext(Config.Language.presstochangechangingroom, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            local x,y,z = table.unpack(coords)
            local dist = GetDistanceBetweenCoords(x,y,z, housex,housey,housez, 1)
            if rangex >= dist then
                if whenKeyJustPressed(Config.keys["G"]) then
                    local changingroomx = {x= x, y= y, z= z}
                    if Config.vorp then
                        TriggerEvent("vorp:TipBottom", Config.Language.changingset, 4000)
                    
                    end
                    TriggerServerEvent("syn_housing:registerchangingroom", houseidx, changingroomx,GetPlayers())
                    local type = 1
                    TriggerServerEvent("syn_housing:find", type)
                    findchangingroom = false
                end
            else
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.outofhouserange, 4000)
               
                end
            end
        end
        if sleep then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local sleep = true
        if findinventory then 
            sleep = false
            local coords = GetEntityCoords(PlayerPedId())
            drawtext(Config.Language.presstochangeinv, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            local x,y,z = table.unpack(coords)
            local dist = GetDistanceBetweenCoords(x,y,z, housex,housey,housez, 1)
            if rangex >= dist then
                if whenKeyJustPressed(Config.keys["G"]) then
                    local inventoryx = {x= x, y= y, z= z}
                    if Config.vorp then
                        TriggerEvent("vorp:TipBottom", Config.Language.invset, 4000)
                    
                    end
                    TriggerServerEvent("syn_housing:registerinventorylocation", houseidx, inventoryx,GetPlayers())
                    local type = 1
                    TriggerServerEvent("syn_housing:find", type)
                    findinventory = false
                end
            else
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.outofhouserange, 4000)
                
                end
            end
        end
        if sleep then
            Citizen.Wait(500)
        end
    end
end)

function checkownedhouses()
    local  num = 0 
    for k,v in pairs(houseownership) do 
        if v.buyercharidentifier == charid then 
            num = num +1
        end
    end
    return num
end
-- menus go here 

function confirmmenu(type,lastmenux) 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.yes, value = 'yes' , desc = ""},
        {label = Config.Language.no, value = 'no' , desc = ""}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.confirm,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = lastmenux,
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "yes" then
            if type == "cancelcreatehousemenu" or type == "confirmcreatehousemenu" or type == "confirmcreatehousemenu2"or type == "confirmcreatehousemenu3" then 
                if type == "confirmcreatehousemenu" then 
                    TriggerServerEvent("syn_housing:registerhouse", doorinfo,secondarydoors, range, price, tax, invspace,0) 
                elseif type == "confirmcreatehousemenu2" then 
                    TriggerServerEvent("syn_housing:registerhouse", doorinfo,{}, range, price, tax, invspace,3) 
                elseif type == "confirmcreatehousemenu3" then 
                    TriggerServerEvent("syn_housing:registerhouse", doorinfo,{typeoftele}, range, price, tax, invspace,4) 
                end
                doorlocksevent = false
                doorlocksevent2 = false
                show3d = false
                changeloc = false   
                changeloc2 = false
                range = 0   
                price = 0   
                tax = 0
                invspace = 0
                doorset = Config.Language.notset
                secondarydoors = {}
                doorinfo = {}
                inmenu = false
                MenuData.CloseAll()
            elseif type == "delhouse" then
                FreezeEntityPosition(PlayerPedId(),false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)  
                TriggerServerEvent("syn_housing:deletehouse", houseidx)
                MenuData.CloseAll()
                inmenu = false 
            elseif type == "buyhome" then 
                local numberofownedhouses = checkownedhouses()
                if Config.maxhouses > numberofownedhouses then 
                    TriggerServerEvent("syn_housing:buyhome", houseidx,pricex, sellercharid, sellerid, repo)
                else
                    TriggerEvent("vorp:TipBottom", Config.Language.cantownmore..Config.maxhouses, 4000)
                end
                FreezeEntityPosition(PlayerPedId(),false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
                inmenu = false
                MenuData.CloseAll()
            elseif type == "sellhome" then 
                TriggerServerEvent("syn_housing:sellhome", houseidx)
                FreezeEntityPosition(PlayerPedId(),false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
                inmenu = false
                MenuData.CloseAll()
            elseif type == "confirmfurniturebuy" then 
                if not Config.furnitureitems then 
                    TriggerServerEvent("syn_housing:buyfurni",globalhouseid,furnitemcost,xx, yy, zz,furniname,furnitem,hh)
                else
                    TriggerServerEvent("syn_housing:placefurniitem",globalhouseid,furnitemcost,xx, yy, zz,furniname,furnitem,hh,thefurniitem)
                end
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
                inmenu = false
                MenuData.CloseAll()
            end
        end
        if data.current.value == "no" then
            _G[data.trigger]()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function createhousemenu2() 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.nodoorhouse2, value = 'nodoorhouse' , desc = ""},
        {label = Config.Language.telehouse, value = 'telehouse' , desc = ""}
    }
    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if data.current then
            createhousemenu3(data.current.value)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function createhousemenu3(typeofhouse) 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.taxrate..tax, value = 'taxrate' , desc = ""},
        {label = Config.Language.price..": $"..price, value = 'price' , desc = ""},
        {label = Config.Language.inventoryspace..": "..invspace, value = 'inventoryspace' , desc = ""},
    }
    if typeofhouse == "nodoorhouse" then 
        table.insert(elements,{label = Config.Language.range..range, value = 'range' , desc = ""})
    else
        table.insert(elements,{label = Config.Language.typeoftele..typeoftele, value = 'typeoftele' , desc = ""})
    end
    if typeofhouse == "nodoorhouse" or typeoftele ~= " Not Set!" then 
        table.insert(elements,{label = Config.Language.confirm, value = 'confirm' , desc = ""})
    end
    table.insert(elements,{label = Config.Language.cancel, value = 'cancel' , desc = ""})
    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "createhousemenu2",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "typeoftele" then
            typeoftelemenu()
        end
        if data.current.value == "range" then
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.furnirange, function(cb)
                local testrange =     tonumber(cb)
                if testrange ~= nil and testrange ~= 0 and testrange > 0 then
                    range = testrange
                end
                createhousemenu3(typeofhouse) 
            end)
        end
        if data.current.value == "taxrate" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.taxrate2, function(cb)
                local testtax =     tonumber(cb)
                if testtax ~= nil and testtax ~= 0 and testtax > 0 then
                    tax = testtax
                end
                createhousemenu3(typeofhouse) 
           end)
        end
        if data.current.value == "price" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.price, function(cb)
                local testprice =     tonumber(cb)
                if testprice ~= nil and testprice ~= 0 and testprice > 0 then
                    price = testprice
                end
                createhousemenu3(typeofhouse) 
            end)
        end
        if data.current.value == "inventoryspace" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.inventoryspace, function(cb)
                local testinvspace =     tonumber(cb)
                if testinvspace ~= nil and testinvspace ~= 0 and testinvspace > 0 then
                    invspace = testinvspace
                end
                createhousemenu3(typeofhouse) 
            end)
        end
        if data.current.value == "confirm" then
            local coords = GetEntityCoords(PlayerPedId())
            local x,y,z = table.unpack(coords)
            table.insert(doorinfo, {
                x = x,
                y = y,
                z = z,
            })
            if typeofhouse == "nodoorhouse" then  
                confirmmenu("confirmcreatehousemenu2","createhousemenu2")
            else
                confirmmenu("confirmcreatehousemenu3","createhousemenu2")
            end
        end
        if data.current.value == "cancel" then
            confirmmenu("cancelcreatehousemenu","createhousemenu2")
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function typeoftelemenu() 
    MenuData.CloseAll()
    local elements = {
    }
    for k,v in pairs(Config.teleporterhouses) do 
        table.insert(elements,{label = k, value = k , desc = ""})
    end
    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "createhousemenu3",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]("telehouse")
        else
            typeoftele =  data.current.value
            createhousemenu3("telehouse") 
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function createhousemenu() 
    MenuData.CloseAll()
    local elements = {
    }
    if doorset == Config.Language.notset then
        table.insert( elements, {label = Config.Language.setupprimodoor..doorset, value = 'door' , desc = ""})
    else
        table.insert( elements,{label = Config.Language.setupotherdoors, value = 'door2' , desc = ""})
        table.insert( elements,{label = Config.Language.range..range, value = 'range' , desc = ""})
        table.insert( elements,{label = Config.Language.taxrate..tax, value = 'taxrate' , desc = ""})
        table.insert( elements,{label = Config.Language.price..": $"..price, value = 'price' , desc = ""})
        table.insert( elements,{label = Config.Language.inventoryspace..": "..invspace, value = 'inventoryspace' , desc = ""})
        table.insert( elements,{label = Config.Language.confirm, value = 'confirm' , desc = ""})
        table.insert( elements,{label = Config.Language.cancel, value = 'cancel' , desc = ""})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if data.current.value == "range" then
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.furnirange, function(cb)
                local testrange =     tonumber(cb)
                if testrange ~= nil and testrange ~= 0 and testrange > 0 then
                    range = testrange
                end
                createhousemenu()
            end)
        end
        if data.current.value == "taxrate" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.taxrate2, function(cb)
                local testtax =     tonumber(cb)
                if testtax ~= nil and testtax ~= 0 and testtax > 0 then
                    tax = testtax
                end
                createhousemenu()
           end)
        end
        if data.current.value == "price" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.price, function(cb)
                local testprice =     tonumber(cb)
                if testprice ~= nil and testprice ~= 0 and testprice > 0 then
                    price = testprice
                end
                createhousemenu()
            end)
        end
        if data.current.value == "inventoryspace" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.inventoryspace, function(cb)
                local testinvspace =     tonumber(cb)
                if testinvspace ~= nil and testinvspace ~= 0 and testinvspace > 0 then
                    invspace = testinvspace
                end
                createhousemenu()
            end)
        end
        if data.current.value == "door" then
            setdoormenu()
        end
        if data.current.value == "door2" then
            setdoormenu2()
        end
        if data.current.value == "confirm" then
            confirmmenu("confirmcreatehousemenu","createhousemenu")
        end
        if data.current.value == "cancel" then
            confirmmenu("cancelcreatehousemenu","createhousemenu")
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function setdoormenu() 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.doorname..doorname, value = 'none' , desc = ""},
        {label = Config.Language.changedooriconloc, value = 'changedooriconloc' , desc = ""},
        {label = Config.Language.confirmdoor.." : "..doorset, value = 'confirmdoor' , desc = ""},
        
    }
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "createhousemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "changedooriconloc" then
            changeloc = true
            MenuData.CloseAll()
        end
        if data.current.value == "confirmdoor" then
            show3d = false
            doorset = Config.Language.set
            local x,y,z = table.unpack(coord)
            table.insert(doorinfo, {
                o = o,
                p = p,
                q = q,
                x = x,
                y = y,
                z = z,
                doorname = doorname, 
                doorhash = doorhash,
                objc = objc,
                entit = entit,
                objYaw3 = objYaw3,
                objYaw1 = objYaw1,
                objYaw2 = objYaw2,  
                locked = true,
            })
            createhousemenu()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function setdoormenu2() 
    MenuData.CloseAll()
    local elements = {
    }
    if next(secondarydoors) == nil then
        table.insert( elements,{label = Config.Language.addadoor, value = 'addadoor' , desc = ""})
    else
        table.insert( elements,{label = Config.Language.confirm, value = 'confirm' , desc = ""})
        table.insert( elements,{label = Config.Language.addeditdoor, value = 'addeditdoor' , desc = ""})
        for k,v in pairs(secondarydoors) do 
            table.insert( elements,{label = Config.Language.otherdoor.." ("..k..") : "..v.doorname.." "..v.entit, value = 'none' , desc = ""})
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "createhousemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "addadoor" then
            doorlocksevent2 = true
            MenuData.CloseAll()
        end
        if data.current.value == "addeditdoor" then
            doorlocksevent2 = true
            MenuData.CloseAll()
        end
        if data.current.value == "confirm" then
            createhousemenu() 
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function setdoormenu3() 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.doorname..doorname, value = 'none' , desc = ""},
        {label = Config.Language.changedooriconloc, value = 'changedooriconloc' , desc = ""},
        {label = Config.Language.confirmdoor, value = 'confirmdoor' , desc = ""},
    }
    
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.createhousemenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "setdoormenu2",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "changedooriconloc" then
            changeloc2 = true
            MenuData.CloseAll()
        end
        if data.current.value == "confirmdoor" then
            if not contains2(doorinfo, entit) then
                if next(secondarydoors) == nil then
                    local x,y,z = table.unpack(coord)
                    table.insert(secondarydoors, {
                        doorname = doorname, 
                        doorhash = doorhash,
                        objc = objc,
                        entit = entit,
                        objYaw3 = objYaw3,
                        objYaw1 = objYaw1,
                        objYaw2 = objYaw2,
                        locked = true,
                        o = o,
                        p = p,
                        q = q,
                        x = x,
                        y = y,
                        z = z,
                        secondarydoorid = 1
                    })
                else
                    if contains2(secondarydoors, entit) then
                        for k,v in pairs(secondarydoors) do
                            if v.entit == entit then 
                                local x,y,z = table.unpack(coord)
                                v.doorname = doorname
                                v.doorhash = doorhash
                                v.objc = objc
                                v.entit = entit
                                v.objYaw3 = objYaw3
                                v.objYaw1 = objYaw1
                                v.objYaw2 = objYaw2
                                v.x = x
                                v.y = y
                                v.z = z
                                v.o = o
                                v.p = p
                                v.q = q
                                v.locked = true
                                v.secondarydoorid = v.secondarydoorid
                            end
                        end
                    else
                        local  x,y,z = table.unpack(coord)  
                        secondarydoors[#secondarydoors+1] = { 
                            o = o,
                            p = p,
                            q = q,
                            x = x,
                            y = y,
                            z = z,
                            objc = objc,
                            doorname = doorname, 
                            doorhash = doorhash,
                            entit = entit,
                            objYaw3 = objYaw3,
                            objYaw1 = objYaw1,
                            objYaw2 = objYaw2,
                            locked = true,
                            secondarydoorid = #secondarydoors+1
                        }
                    end
                end
            end
            setdoormenu2()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function buyhomemenu() 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.houseid..houseidx, value = 'none' , desc = ""},
        {label = Config.Language.price..": "..pricex, value = 'none' , desc = ""},
        {label = Config.Language.taxrate..taxx, value = 'none' , desc = ""},
    }
    if Config.vorp then
        table.insert( elements, {label = Config.Language.inventoryspace.." : "..invspacex, value = 'none' , desc = ""})
    end
    if (playerjob == Config.synsocietyjob and tonumber(playerrank) >= tonumber(Config.synsocietyjobrank)) or playergroup == "admin" or playergroup == "superadmin" then
        table.insert( elements, {label = Config.Language.delhouse,value = 'delhouse' , desc = ""})
    end
    table.insert( elements, {label = Config.Language.buyhouse,value = 'buyhome' , desc = ""})
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.buyhouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if data.current.value == "delhouse" then
            confirmmenu("delhouse","buyhomemenu")
        end
        if data.current.value == "buyhome" then
            confirmmenu("buyhome","buyhomemenu") 
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function managehomemenu() 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.houseid..houseidx, value = 'none' , desc = ""},
        {label = Config.Language.taxrate.."$"..taxx, value = 'none' , desc = ""},
    }
    if owner then
        if Config.taxledger then 
            if taxledger ~= 0 then 
                table.insert( elements, {label = Config.Language.taxledger..taxledger, value = 'taxledger' , desc = Config.Language.taxledger2})
            else
                table.insert( elements, {label = Config.Language.taxledger.."<span style=color:Red;> "..taxledger.."</span>", value = 'taxledger' , desc = Config.Language.taxledger2}) -- try to add color red to the 0
            end
        end 
        table.insert( elements, {label = Config.Language.givekey, value = 'givekey' , desc = ""})
        table.insert( elements, {label = Config.Language.takekey, value = 'takekey' , desc = ""})
        table.insert( elements, {label = Config.Language.ledger, value = 'ledger' , desc = ""})
        table.insert( elements, {label = Config.Language.sellhouse, value = 'sellhouse' , desc = ""})
    end
    table.insert( elements, {label = Config.Language.setchangeroomloc, value = 'setchangeroomloc' , desc = ""})
    table.insert( elements, {label = Config.Language.setinvloc, value = 'setinvloc' , desc = ""})
    table.insert( elements, {label = Config.Language.furni, value = 'furni' , desc = ""})
    table.insert( elements, {label = Config.Language.upstore, value = 'upstore' , desc = ""})

   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if data.current.value == "givekey" then
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs",Config.Language.confirm, Config.Language.id, function(cb)
                local testid =     tonumber(cb)
                if testid ~= nil and testid ~= 0 and testid > 0 then
                    local playerid = testid
                    TriggerServerEvent("syn_housing:givekey", playerid, houseidx, keyholdersx)
                end
                managehomemenu()
            end)
        end
        if data.current.value == "taxledger" then
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ledgerdepo, function(cb)
                local depositedcash =     tonumber(cb)
                if depositedcash ~= nil and depositedcash ~= 0 and depositedcash > 0 then
                    TriggerServerEvent("syn_housing:depositcashtax", depositedcash, houseidx)
                end
                FreezeEntityPosition(PlayerPedId(),false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
                inmenu = false
            end)
        end
        if data.current.value == "takekey" then
            takekey()
        end
        if data.current.value == "ledger" then
            ledgermenu()
        end
        if data.current.value == "setchangeroomloc" then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
            inmenu = false
            MenuData.CloseAll()
            findchangingroom = true
        end
        if data.current.value == "setinvloc" then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
            inmenu = false
            MenuData.CloseAll()
            findinventory = true
        end
        if data.current.value == "sellhouse" then
            confirmmenu("sellhome","managehomemenu")
        end
        if data.current.value == "furni" then
            furnimenu()
        end
        if data.current.value == "upstore" then
            upstoragemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function upstoragemenu() 
    MenuData.CloseAll()
    local elements = {
    }
    for k,v in pairs(Config.Storageupgrades) do 
        
        if v.num == upgradex + 1 then
            for l, m in pairs(v.materials) do
                table.insert( elements, {image = v.name ,label = m.label..": "..m.amount, value = "none" , desc = ""})
            end
            table.insert( elements, {label = v.title..Config.Language.increaseby..v.slotamount, value = v , desc = ""})
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "managehomemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        elseif data.current.value ~= "none" then
            TriggerServerEvent("syn_housing:inventoryupgradeslots",data.current.value.materials,data.current.value.slotamount,houseidx)
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
            inmenu = false
            MenuData.CloseAll()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function furnimenu() -- update furniture system starting here
    MenuData.CloseAll()
    local elements = {
    }
    if not Config.furnitureitems then 
        table.insert( elements, {label = Config.Language.buyfurni, value = 'buyfurni' , desc = ""})
        table.insert( elements, {label = Config.Language.sellfurni, value = 'sellfurni' , desc = ""})
    else
        table.insert( elements, {label = Config.Language.placefurniture, value = 'placefurni' , desc = ""})
        table.insert( elements, {label = Config.Language.removefurni, value = 'removefurni' , desc = ""})
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "managehomemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "buyfurni" then 
            buyfurnimenu()
        end
        if data.current.value == "sellfurni" then 
            sellfurnimenu()
        end
        if data.current.value == "removefurni" then 
            removefurnimenu()
        end
        if data.current.value == "placefurni" then 
            MenuData.CloseAll()
            TriggerServerEvent("syn_housing:checkfurniitems")
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function removefurnimenu() 
    MenuData.CloseAll()
    local elements = {
    }
    if next(furniturex) ~= nil then
        for k, v in pairs(furniturex) do 
            table.insert( elements, {label = v.name, value = v , desc = ""})
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "furnimenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            local furniid = data.current.value.id
            local label = data.current.value.name
            TriggerServerEvent("syn_housing:removefurniitem", furniid,houseidx,label)
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
            inmenu = false
            MenuData.CloseAll()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function recfurniitems() 
    MenuData.CloseAll()
    local elements = {
    }
    if next(furniitems) ~= nil then
        for k, v in pairs(furniitems) do 
            table.insert( elements, {label = v.label, value = v , desc = ""})
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "furnimenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            furnitem = data.current.value.hash
            furnitemcost = data.current.value.price
            furniname = data.current.value.label
            thefurniitem = data.current.value.item
            placefurniture = true
            MenuData.CloseAll()
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function sellfurnimenu() 
    MenuData.CloseAll()
    local elements = {
    }
    if next(furniturex) ~= nil then
        for k, v in pairs(furniturex) do 
            local price = v.price * Config.furnituresellrate
            table.insert( elements, {label = v.name..Config.Language.price2..price, value = v , desc = ""})
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "furnimenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            local furniid = data.current.value.id
            local label = data.current.value.name
            TriggerServerEvent("syn_housing:sellfurni", furniid,houseidx,label)
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
            inmenu = false
            MenuData.CloseAll()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function buyfurnimenu() 
    MenuData.CloseAll()
    local elements = {
    }
    for k,v in pairs(Config.furniture) do
        table.insert( elements, {label = k, value = v , desc = ""})
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "furnimenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            buyfurnimenu2(data.current.value) 
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function buyfurnimenu2(furnigroup) 
    MenuData.CloseAll()
    local elements = {
    }
    for k,v in pairs(furnigroup) do
        table.insert( elements, {label = k..Config.Language.cost2..v.cost.." $", value = v , desc = ""})
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "buyfurnimenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            furnitem = data.current.value.hash
            furnitemcost = data.current.value.cost
            furniname = k
            placefurniture = true
            MenuData.CloseAll()
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function ledgermenu() 
    MenuData.CloseAll()
    local elements = {
        {label = Config.Language.ledgercash..ledger..Config.Language.dollar, value = "none" , desc = ""},
        {label = Config.Language.ledgerdepo, value = "ledgerdepo" , desc = ""},
        {label = Config.Language.ledgerwithdraw, value = "ledgerwithdraw" , desc = ""}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "managehomemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "ledgerdepo" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ledgerdepo, function(cb)
                local depositedcash =     tonumber(cb)
                if depositedcash ~= nil and depositedcash ~= 0 and depositedcash > 0 then
                    TriggerServerEvent("syn_housing:depositcash", depositedcash, houseidx)
                end
                FreezeEntityPosition(PlayerPedId(),false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
                inmenu = false
            end)
        end
        if data.current.value == "ledgerwithdraw" then 
            MenuData.CloseAll()
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ledgerwithdraw, function(cb)
                local withdraw =     tonumber(cb)
                if withdraw ~= nil and withdraw ~= 0 and withdraw > 0 then
                    TriggerServerEvent("syn_housing:withdrawcash", withdraw, houseidx)
                end
                FreezeEntityPosition(PlayerPedId(),false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
                inmenu = false
            end)
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function takekey() 
    MenuData.CloseAll()
    local elements = {
    }
    if next(keyholdersx) ~= nil then 
        for k, v in pairs(keyholdersx) do 
            table.insert( elements, {label = v.name, value = v , desc = ""})
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.managehouse,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "managehomemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            local takeid = data.current.value.identifier
            local takecharid = data.current.value.charidentifier
            local name = data.current.value.name
            TriggerServerEvent("syn_housing:takekey",keyholdersx,houseidx,takeid,takecharid,name)
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent("syn_housing:closemenu",globalhouseid)            
            inmenu = false
            MenuData.CloseAll()
        end
    end,
	function(data, menu)
		menu.close()
	end)
end
function soldhomeledger() 
    MenuData.CloseAll()
    local elements = {
    }
    if soldhousing ~= 0 then
        for i = 1, #soldhousing do
            table.insert( elements, {label = Config.Language.soldhouseid..soldhousing[i].id..Config.Language.profit..soldhousing[i].amount..Config.Language.dollar, value = i , desc = ""})
        end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.soldhomeledger,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if data.current then 
            local id = soldhousing[data.current.value].id
            local amount = soldhousing[data.current.value].amount
            TriggerServerEvent("syn_housing:takecash", id, amount)
            MenuData.CloseAll()
            Wait(2000)
            inmenu = false
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function changingmenu() 
    MenuData.CloseAll()
    local elements = {
    }
    if poutifts ~= 0 then
        for i = 1, #poutifts do
            table.insert( elements, {label = poutifts[i].title, value = i , desc = ""})
        end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.soldhomeledger,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if data.current then 
            local jsonCloths = poutifts[data.current.value].comps
            TriggerEvent("vorpcharacter:loadPlayerSkin", playerskin, jsonCloths)
            TriggerServerEvent("syn_housing:setoutfit", jsonCloths)
            MenuData.CloseAll()
            inmenu = false
        end
	end,
	function(data, menu)
		menu.close()
	end)
end