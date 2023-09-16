local change
local changered = false
local changeadressbook = false
local deletedmsg = false
local viewedid = {}
local deletedid = {}
local adressbook = {}
local inshop = false
local mailingadress = 0
local sendto
local msgbody
local mail = {}
local showdate = 0 
local isalerted = false 
keys = {
    -- Letter E
    ["B"] = 0x4CC0E2FE,
    ["X"] = 0x8CC9CD42,
}

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

AddEventHandler(
    "onResourceStart",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            Citizen.Wait(5000)
			TriggerServerEvent("syn_mail:getadress")
        end
    end
)

if Config.vorp then
    RegisterNetEvent("vorp:SelectedCharacter")
    AddEventHandler("vorp:SelectedCharacter", function(charid)
        Citizen.Wait(1000)
        TriggerServerEvent("syn_mail:getadress")
    end)
end
if Config.redem then
    RegisterNetEvent("syn_mail:HasLoaded")
    AddEventHandler("syn_mail:HasLoaded", function(bool)
        Citizen.Wait(1000)
        TriggerServerEvent("syn_mail:getadress")
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isalerted then 
            drawtext(Config.Language.gotm, 0.15, 0.8, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.do1..Config.command..Config.Language.do2, 0.12, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
	if not Config.locationonly then
        RegisterCommand(Config.command, function(source, args, rawCommand)
            if isalerted then 
                isalerted = false 
            end
            local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId())
            if not hogtied then 
                if mailingadress ~= 0 then
                    if Config.showdate then 
                        showdate = 1 
                    end
                    TriggerServerEvent("syn_mail:getadress")
                    Citizen.Wait(500)
                    TriggerServerEvent("syn_mail:recievemail",mailingadress)
                    Citizen.Wait(500)
                    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_WRITE_NOTEBOOK"), 100000, true, false, false, false)
                    SetNuiFocus(true,true)
                    SendNUIMessage({
                        action = "show",
                        mail = mail,
                        mailingadress = mailingadress,
                        ad = adressbook,
                        showdate = showdate
                    })
                else
                    if Config.vorp then
                        TriggerEvent("vorp:TipBottom", Config.Language.registerplease, 4000)
                    elseif Config.redem then
                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.registerplease, 4000)
                    end
                end
            end
        end, false)
    end
end)
RegisterNetEvent("syn_mail:recalert")
AddEventHandler("syn_mail:recalert", function()
	isalerted = true 
end)
RegisterNetEvent("syn_mail:giveadress")
AddEventHandler("syn_mail:giveadress", function(adress,adressb)
	mailingadress = adress
    adressbook = adressb
end)
RegisterNetEvent("syn_mail:getmymail")
AddEventHandler("syn_mail:getmymail", function(stuff)
	mail = stuff
end)
RegisterNetEvent("syn_mail:getsadress")
AddEventHandler("syn_mail:getsadress", function()
	TriggerServerEvent("syn_mail:getadress")
end)

function playanimation()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_PLAYER_DYNAMIC_KNEEL'), 0, true, false, false, false)
	Wait(2500)
	farm2 = GetHashKey("A_C_Pigeon")       
	RequestModel(farm2)
	while not HasModelLoaded(farm2) do
		Wait(10)
	end
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
	farm2 = CreatePed("A_C_Pigeon", x, y, z, true, false, true)
	Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
	TaskFlyAway(farm2,true)
	Wait(1000)
	ClearPedTasks(PlayerPedId())
	Wait(30000)
	DeleteEntity(farm2)	
end

RegisterNUICallback('send', function(data)
    SetNuiFocus(false,false) 
    ClearPedTasksImmediately(PlayerPedId())
    adressbook = data.ad
    change = data.change
    changered = data.changered
    changeadressbook = data.changeadressbook
    deletedmsg = data.deletedmsg
    viewedid = data.viewedid
    deletedid = data.deletedid  
    sendto = data.sendto  
    msgbody = data.msgbody 
    mailingadress = data.mailingadress 
    TriggerServerEvent("syn_mail:sendletter",sendto,msgbody,GetPlayers(),mailingadress)
    if change then 
        if changered then
            TriggerServerEvent("syn_mail:registerasviewed",viewedid)
        end
        if changeadressbook then
            for k,v in pairs (adressbook) do
                if tonumber(v.inbox) == nil then
                    table.remove(adressbook, k)
                end
            end
            TriggerServerEvent("syn_mail:updateadressbook",mailingadress,adressbook)
        end
        if deletedmsg then
            TriggerServerEvent("syn_mail:deleteletter",deletedid)
        end
    end
    if not Config.locationonly then
        playanimation()
    end
    mail = {}
end)
RegisterNUICallback('closeui', function(data)
    ClearPedTasksImmediately(PlayerPedId())
    adressbook = data.ad
    change = data.change
    changered = data.changered
    changeadressbook = data.changeadressbook
    deletedmsg = data.deletedmsg
    viewedid = data.viewedid
    deletedid = data.deletedid  
    SetNuiFocus(false,false) 
    if change then 
        if changered then
            TriggerServerEvent("syn_mail:registerasviewed",viewedid)
        end
        if changeadressbook then
            for k,v in pairs (adressbook) do
                if tonumber(v.inbox) == nil then
                    table.remove(adressbook, k)
                end
            end
            TriggerServerEvent("syn_mail:updateadressbook",mailingadress,adressbook)
        end
        if deletedmsg then
            TriggerServerEvent("syn_mail:deleteletter",deletedid)
        end
    end
    mail = {}
end)


Citizen.CreateThread(function()
   	while true do
	  	Citizen.Wait(0)
	  	if not inshop then
   			local coords, letSleep = GetEntityCoords(PlayerPedId()), true
	  		for k, v in pairs(Config.mailregistery) do
				local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.Pos.x,v.Pos.y,v.Pos.z, 1)
				if dist < 2 then
					letSleep = false  
   	 		   		DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.presstoshop)
					if whenKeyJustPressed(Config.keys["G"]) then
						inshop = true
						WarMenu.OpenMenu('mail') 
					end
				end
			end
			if letSleep then
				Citizen.Wait(500)
			end	
		end
	end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local player = PlayerPedId()
        local Coords = GetEntityCoords(player)
        local sleep = true
        if Config.proptied then 
            local nearprop = DoesObjectOfTypeExistAtCoords(Coords.x, Coords.y, Coords.z, 1.5, GetHashKey(Config.prop), 0) -- prop required to interact
            if nearprop ~= false then 
                sleep = false
                DrawText3D(Coords.x, Coords.y, Coords.z, Config.Language.presstoshop)
                if whenKeyJustPressed(Config.keys["G"]) then
                    inshop = true
                    WarMenu.OpenMenu('mail')
                end
            end
            if letSleep then
                Citizen.Wait(500)
            end	
        end
    end
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)
	for k,v in pairs(Config.mailregistery) do 
		if v.showblip then
			blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    		SetBlipSprite(blip, v.blipsprite, 1)
    		SetBlipScale(blip, 0.2)
    		Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
		end
	end
end)

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225
	  DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
	end
end

Citizen.CreateThread( function()
	WarMenu.CreateMenu('mail', Config.Language.mailmenu)
    while true do
		if WarMenu.IsMenuOpened('mail') then
            if mailingadress == 0 then 
                if WarMenu.Button(Config.Language.rigster..Config.mailregisterprice..Config.Language.dollar) then 
                    TriggerServerEvent("syn_mail:registeradress")
                    inshop = false
                    WarMenu.CloseMenu()
                end
            else
                if Config.locationonly then
                    if WarMenu.Button(Config.Language.openmail) then 
                        WarMenu.CloseMenu()
                        if Config.showdate then 
                            showdate = 1 
                        end
                        TriggerServerEvent("syn_mail:getadress")
                        Citizen.Wait(500)
                        TriggerServerEvent("syn_mail:recievemail",mailingadress)
                        Citizen.Wait(500)
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_WRITE_NOTEBOOK"), 100000, true, false, false, false)
                        SetNuiFocus(true,true)
                        SendNUIMessage({
                            action = "show",
                            mail = mail,
                            mailingadress = mailingadress,
                            ad = adressbook,
                            showdate = showdate
                        })   
                        inshop = false 
                    end
                else
                    if WarMenu.Button(Config.Language.already..Config.command) then 
                    end
                end
            end

        end
		WarMenu.Display()
        Citizen.Wait(0)
	end
end)
RegisterNetEvent("syn_mail:refresh")
AddEventHandler("syn_mail:refresh", function()
    inshop = false 
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