local inTable = false
local playerCards = {}
local otherplayersCards = {}
local dealerCards = {}
local playerCount = 0
local dealerCount = 0
local textWinLosePush = ""
local gameFinished = false
local waiting = false
local alreadyPressed = false
local stopBet = false
local cardsGiven = false
local bet = 0
local maxbet = 0
local target_table
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
end)

ESX	= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

function startPlay()
    resetGameVariables()
    inTable = true
    TriggerServerEvent('ak_blackjack:Request_Sit' , target_table)
    SendNUIMessage({type = 'show'})
end

function stopPlay()
	print("stoplay")
    resetGameVariables()
    inTable = false
    TriggerServerEvent('ak_blackjack:Request_Leave', target_table)
    SendNUIMessage({type = 'hide'})
	target_table = nil
end

function resetGameVariables()
	print("reset")
    playerCards = {}
    otherplayersCards = {}
    dealerCards = {}
    playerCount = 0
    dealerCount = 0
    textWinLosePush = ""
    gameFinished = false
    waiting = false
    alreadyPressed = false
    stopBet = false
    cardsGiven = false
    SendNUIMessage({type = 'clear'})
    maxbet = 0
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", " ", Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end



-- PROMPT
local BlackJackGroup = GetRandomIntInRange(0, 0xffffff)

local StartBlackJackGroup = GetRandomIntInRange(0, 0xffffff)


local _StartPrompt
function StartPrompt()
    Citizen.CreateThread(function()
        local str = "Jouer au Blackjack"
        _StartPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_StartPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_StartPrompt, str)
        PromptSetEnabled(_StartPrompt, true)
        PromptSetVisible(_StartPrompt, true)
        PromptSetStandardMode(_StartPrompt, true)
        PromptSetGroup(_StartPrompt, StartBlackJackGroup)
        PromptRegisterEnd(_StartPrompt)
        PromptSetPriority(_StartPrompt , true)
    end)
end





local _BetPrompt
function BetPrompt()
    Citizen.CreateThread(function()
        local str = "Votre Pari"
        _BetPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_BetPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_BetPrompt, str)
        PromptSetEnabled(_BetPrompt, false)
        PromptSetVisible(_BetPrompt, false)
        PromptSetStandardMode(_BetPrompt, true)
        PromptSetGroup(_BetPrompt, BlackJackGroup)
        PromptRegisterEnd(_BetPrompt)
        PromptSetPriority(_BetPrompt , true)
    end)
end

local _BetPromptAmmount
function BetPromptAmmount()
    Citizen.CreateThread(function()
        local str = "MONTANT: " .. bet.."$"
        _BetPromptAmmount = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_BetPromptAmmount, 0x6319DB71)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_BetPromptAmmount, str)
        PromptSetEnabled(_BetPromptAmmount, false)
        PromptSetVisible(_BetPromptAmmount, false)
        PromptSetStandardMode(_BetPromptAmmount, true)
        PromptSetGroup(_BetPromptAmmount, BlackJackGroup)
        PromptRegisterEnd(_BetPromptAmmount)
        PromptSetPriority(_BetPromptAmmount , true)
    end)
end

local _CallPrompt
function CallPrompt()
    Citizen.CreateThread(function()
        local str = "Demander une Carte"
        _CallPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_CallPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_CallPrompt, str)
        PromptSetEnabled(_CallPrompt, false)
        PromptSetVisible(_CallPrompt, false)
        PromptSetStandardMode(_CallPrompt, true)
        PromptSetGroup(_CallPrompt, BlackJackGroup)
        PromptRegisterEnd(_CallPrompt)
        PromptSetPriority(_CallPrompt , true)
    end)
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, 3290.09, -1317.84, 42.56) < 1.3) then
			DrawText3Ds(3290.09, -1317.84, 42.56, "Appuyez sur [G] pour vous asseoir")
            if IsControlJustPressed(0, 0x760A9C6F) then
				stopPlay()
				SetEntityCoords(PlayerPedId(), 3291.01, -1317.83, 41.94)
				Citizen.Wait(2000)
				local player = PlayerPedId()
				TaskStartScenarioAtPosition(player, GetHashKey("PROP_HUMAN_SEAT_CHAIR"), 3290.09, -1317.84, 42.56, 93.15, 0, false)
				Citizen.Wait(2000)
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, 3289.59, -1318.89, 42.48) < 1.3) then
			DrawText3Ds(3289.59, -1318.89, 42.48, "Appuyez sur [G] pour vous asseoir")
            if IsControlJustPressed(0, 0x760A9C6F) then
				stopPlay()
				SetEntityCoords(PlayerPedId(), 3290.08, -1319.49, 41.94)
				Citizen.Wait(2000)
				local player = PlayerPedId()
				TaskStartScenarioAtPosition(player, GetHashKey("PROP_HUMAN_SEAT_CHAIR"), 3289.59, -1318.89, 42.48, 30.14, 0, false)
				Citizen.Wait(2000)
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, 3288.53, -1318.98, 42.48) < 1.3) then
			DrawText3Ds(3288.53, -1318.98, 42.48, "Appuyez sur [G] pour vous asseoir")
            if IsControlJustPressed(0, 0x760A9C6F) then
				stopPlay()
				SetEntityCoords(PlayerPedId(), 3288.76, -1319.87, 41.95)
				Citizen.Wait(2000)
				local player = PlayerPedId()
				TaskStartScenarioAtPosition(player, GetHashKey("PROP_HUMAN_SEAT_CHAIR"), 3288.53, -1318.98, 42.48, 4.13, 0, false)
				Citizen.Wait(2000)
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, 3287.66, -1318.85, 42.45) < 1.3) then
			DrawText3Ds(3287.66, -1318.85, 42.45, "Appuyez sur [G] pour vous asseoir")
            if IsControlJustPressed(0, 0x760A9C6F) then
				stopPlay()
				SetEntityCoords(PlayerPedId(), 3287.38, -1319.72, 41.95)
				Citizen.Wait(2000)
				local player = PlayerPedId()
				TaskStartScenarioAtPosition(player, GetHashKey("PROP_HUMAN_SEAT_CHAIR"), 3287.66, -1318.85, 42.45, 353.39, 0, false)
				Citizen.Wait(2000)
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, 3286.80, -1318.10, 42.45) < 1.3) then
			DrawText3Ds(3286.80, -1318.10, 42.45, "Appuyez sur [G] pour vous asseoir")
            if IsControlJustPressed(0, 0x760A9C6F) then
				stopPlay()
				SetEntityCoords(PlayerPedId(), 3286.03, -1318.13, 41.94)
				Citizen.Wait(2000)
				local player = PlayerPedId()
				TaskStartScenarioAtPosition(player, GetHashKey("PROP_HUMAN_SEAT_CHAIR"), 3286.80, -1318.10, 42.45, 272.57, 0, false)
				Citizen.Wait(2000)
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)

function DrawText3Ds(x, y, z, text)
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
    	--DrawSprite("feeds", "toast_bg", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
    end
end

function StartBlackJack()
    Wait(1000)
    CallPrompt()
    BetPromptAmmount()
    BetPrompt()
    StartPrompt()
    while true do
        Wait(0)
        local ped = PlayerPedId()
		 for i, v in ipairs(Config.Tables) do
		 local distance = Vdist(GetEntityCoords(ped) , v ) < 2
        while distance do
            Citizen.Wait(0)
			distance = Vdist(GetEntityCoords(ped) , v ) < 2
			target_table = i

            if not inTable then				
				TriggerEvent("vorp:TipRight", "Lorsque vous jouez au BlackJack Vous ne devez pas depasser un total de 21 ou celui qui s\'approche le plus de 21 gagne", 10000) -- from client side
                TriggerEvent("vorp:NotifyLeft", "~t7~ BlackJack","Lorsque vous jouez au BlackJack Vous ne devez pas depasser un total de 21 ou celui qui s\'approche le plus de 21 gagne", "toast_challenges_gambler", "challenge_gambler_1", 2000)
                PlaySoundFrontend("show_info", "Study_Sounds", true, 0)
                startPlay()
            elseif inTable then
                local BlackJackGroupName  = CreateVarString(10, 'LITERAL_STRING', "BlackJack")
                PromptSetActiveGroupThisFrame(BlackJackGroup, BlackJackGroupName)

            elseif inTable and not distance then
                inTable = false
                textWinLosePush = ""
                stopPlay()
            end

            if inTable and waiting and not alreadyPressed then
                PromptSetEnabled(_CallPrompt, true)
                PromptSetVisible(_CallPrompt, true)
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", " ", Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
                if PromptHasStandardModeCompleted(_CallPrompt) and waiting then
                    TriggerServerEvent('ak_blackjack:Choice', true , i)
                    alreadyPressed = true
                    PromptSetEnabled(_CallPrompt, false)
                    PromptSetVisible(_CallPrompt, false)
                end
            elseif (inTable and not alreadyPressed and cardsGiven) then
                PromptSetEnabled(_CallPrompt, false)
                PromptSetVisible(_CallPrompt, false)
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", "Attendez votre tour", Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
            end
            if maxbet ~= 0 and not stopBet then
                PromptSetEnabled(_BetPromptAmmount, true)
                PromptSetVisible(_BetPromptAmmount, true)
                PromptSetEnabled(_BetPrompt, true)
                PromptSetVisible(_BetPrompt, true)
            end
            if PromptHasStandardModeCompleted(_BetPromptAmmount) and not stopBet  then
                bet = bet + 0.50
                if bet > maxbet then
                    bet = 0
                    PlaySoundFrontend("BET_MIN_MAX", "HUD_POKER", true, 0)
                end
                if bet ~= 0 then
                    PlaySoundFrontend("BET_AMOUNT", "HUD_POKER", true, 0)
                end
                PromptDelete(_BetPromptAmmount)
                BetPromptAmmount()
            end
            if PromptHasStandardModeCompleted(_BetPrompt) and not stopBet then
                if not stopBet then
                    TriggerServerEvent("ak_blackjack:Get_Bet", bet , i)
                    PlaySoundFrontend("menu_select_bet", "RDRO_Poker_Sounds", true, 0)
                    PromptSetEnabled(_BetPromptAmmount, false)
                    PromptSetVisible(_BetPromptAmmount, false)
                    PromptSetEnabled(_BetPrompt, false)
                    PromptSetVisible(_BetPrompt, false)
                end
                stopBet = true
            end



            if not distance then
                stopPlay()
            end
        end
		end
		break
    end
end







RegisterNetEvent('ak_blackjack:ReceiveCard')
AddEventHandler('ak_blackjack:ReceiveCard', function(card, type , target)
    cardsGiven = true
	if inTable then
		PlaySoundFrontend("enter", "RDRO_Winners_Screen_Sounds", true, 0)
	end
    if type == "player" then
        print(card)
		print(target)
        if target == GetPlayerServerId(PlayerId()) then
            table.insert(playerCards, card)
            SendNUIMessage({type = 'player' , cards = playerCards})
        else
            local test = false
            for k ,v in pairs (otherplayersCards) do
                if v.source == target then
                    print("mam juz ")
                    test = true
                    table.insert(v.card , card)
                end
            end
            if not test then
                local test2 = {}
                table.insert(test2 , card)
                otherplayersCards[#otherplayersCards + 1] = {source = target,  card = test2}
            end
			print(json.encode(otherplayersCards))
            SendNUIMessage({type = 'other' , cards = otherplayersCards})
        end
    else
        table.insert(dealerCards, card)
        SendNUIMessage({type = 'dealer' , cards = dealerCards})

    end
end)



Citizen.CreateThread(function()
 for i, v in ipairs(Config.Tables) do
    local blip = N_0x554d9d53f696d002(1664425300, v)
    SetBlipSprite(blip, 595820042, 1)
    SetBlipScale(blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Casino")
end
end)

RegisterNetEvent('ak_blackjack:ReceiveWin')
AddEventHandler('ak_blackjack:ReceiveWin', function(gameResolution)
    textWinLosePush = gameResolution
    PlaySoundFrontend("show_info", "Study_Sounds", true, 0)
	TriggerEvent("vorp:TipRight", textWinLosePush..' !', 3000) -- from client side
    TriggerEvent("vorp:NotifyLeft", "~t7~ BlackJack", textWinLosePush..' !', "toast_challenges_gambler", "challenge_gambler_1", 2000)
end)

RegisterNetEvent('ak_blackjack:ReceiveCountedCards')
AddEventHandler('ak_blackjack:ReceiveCountedCards', function(count,type)
    if type == "player" then
        playerCount=count
    else
        dealerCount=count
    end
end)



RegisterNetEvent('ak_blackjack:GameFinished')
AddEventHandler('ak_blackjack:GameFinished', function(status)
    gameFinished = status
end)

RegisterNetEvent('ak_blackjack:WaitingForResponse')
AddEventHandler('ak_blackjack:WaitingForResponse', function(status)
    alreadyPressed = false
    waiting = status
end)

RegisterNetEvent('ak_blackjack:Reset_Game_Var')
AddEventHandler('ak_blackjack:Reset_Game_Var', function()
    resetGameVariables()
end)

RegisterNetEvent('ak_blackjack:Bet')
AddEventHandler('ak_blackjack:Bet', function(max)
    maxbet = max


end)

RegisterNetEvent("ak_blackjack:Stop_Bet")
AddEventHandler("ak_blackjack:Stop_Bet", function()
    if not stopBet then
        stopBet = true
        PromptSetEnabled(_BetPromptAmmount, false)
        PromptSetVisible(_BetPromptAmmount, false)
        PromptSetEnabled(_BetPrompt, false)
        PromptSetVisible(_BetPrompt, false)
        TriggerServerEvent("ak_blackjack:Get_Bet", 0 , target_table)
    end
end)

Citizen.CreateThread(function()
	
	-- NPC St-Denis Port to go on the Boat
	while not HasModelLoaded( GetHashKey("S_M_M_STGSAILOR_01") ) do
    Wait(500)
    RequestModel( GetHashKey("S_M_M_STGSAILOR_01") )
    end
    local Sailor = CreatePed(GetHashKey("S_M_M_STGSAILOR_01"), 2670.83, -1552.58, 45.47, 5.00, false, false, 0, 0) -- st-denis port
    while not DoesEntityExist(Sailor) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Sailor, true)
    FreezeEntityPosition(Sailor, true)
    SetEntityInvincible(Sailor, true)
    TaskStandStill(Sailor, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Sailor, false, `PLAYER`)
    SetEntityAsMissionEntity(Sailor, true, true)
	SetBlockingOfNonTemporaryEvents(Sailor, true)
    SetModelAsNoLongerNeeded(GetHashKey("S_M_M_STGSAILOR_01"))
	-- NPC Sailor on Boat to Go to st-denis
	while not HasModelLoaded( GetHashKey("S_M_M_STGSAILOR_01") ) do
    Wait(500)
    RequestModel( GetHashKey("S_M_M_STGSAILOR_01") )
    end
    local Sailor = CreatePed(GetHashKey("S_M_M_STGSAILOR_01"), 3288.52, -1271.35, 43.83, 180.00, false, false, 0, 0) -- st-denis port
    while not DoesEntityExist(Sailor) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Sailor, true)
    FreezeEntityPosition(Sailor, true)
    SetEntityInvincible(Sailor, true)
    TaskStandStill(Sailor, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Sailor, false, `PLAYER`)
    SetEntityAsMissionEntity(Sailor, true, true)
	SetBlockingOfNonTemporaryEvents(Sailor, true)
    SetModelAsNoLongerNeeded(GetHashKey("S_M_M_STGSAILOR_01"))
	
	while not HasModelLoaded( GetHashKey("mp_fm_stakeout_poker_males_01") ) do
    Wait(500)
    RequestModel( GetHashKey("mp_fm_stakeout_poker_males_01") )
    end
    local Dealer = CreatePed(GetHashKey("mp_fm_stakeout_poker_males_01"), 3288.39, -1317.14, 41.83, 183.25, false, false, 0, 0) -- st-denis port
    while not DoesEntityExist(Dealer) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Dealer, true)
    FreezeEntityPosition(Dealer, true)
    SetEntityInvincible(Dealer, true)
    TaskStandStill(Dealer, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Dealer, false, `PLAYER`)
    SetEntityAsMissionEntity(Dealer, true, true)
	SetBlockingOfNonTemporaryEvents(Dealer, true)
    SetModelAsNoLongerNeeded(GetHashKey("mp_fm_stakeout_poker_males_01"))
	
	while not HasModelLoaded( GetHashKey("mp_fm_stakeout_poker_males_01") ) do
    Wait(500)
    RequestModel( GetHashKey("mp_fm_stakeout_poker_males_01") )
    end
    local Dealer = CreatePed(GetHashKey("mp_fm_stakeout_poker_males_01"), 3288.48, -1325.44, 41.83, 1.23, false, false, 0, 0) -- st-denis port
    while not DoesEntityExist(Dealer) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Dealer, true)
    FreezeEntityPosition(Dealer, true)
    SetEntityInvincible(Dealer, true)
    TaskStandStill(Dealer, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Dealer, false, `PLAYER`)
    SetEntityAsMissionEntity(Dealer, true, true)
	SetBlockingOfNonTemporaryEvents(Dealer, true)
    SetModelAsNoLongerNeeded(GetHashKey("mp_fm_stakeout_poker_males_01"))
	
	
	while true do
      	local ped = GetPlayerPed(-1)
      	local coords = GetEntityCoords(PlayerPedId())
		-- St-Denis Port Teleport
		if (Vdist(coords.x, coords.y, coords.z, 2670.83, -1552.58, 46.47) < 2.0) then
		DrawTxt("Appuyez sur [~e~Espace~q~] pour aller au Casino ( ~e~50$~q~ )", 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)   
		if IsControlJustReleased(0,0xD9D0E1C0) then
        TriggerServerEvent("lto_roulette:BoatMoney")
		end
		-- Casino Boat Teleport
		elseif (Vdist(coords.x, coords.y, coords.z, 3288.52, -1271.35, 43.83) < 2.0) then
		DrawTxt("Appuyez sur [~e~Espace~q~] pour vous rendre à Saint-Denis ( ~e~Gratuit~q~ )", 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
		if IsControlJustReleased(0,0xD9D0E1C0) then
        TriggerEvent("lto_roulette:TeleportBack")
		end
		end
	Citizen.Wait(0)
	end
end)

RegisterNetEvent('lto_roulette:Teleport')
AddEventHandler('lto_roulette:Teleport', function()
	local ped = PlayerPedId()
	DoScreenFadeOut(2000)
	Wait(5000)
	DoScreenFadeIn(3000)
	SetEntityCoords(ped, 3288.48, -1276.25, 44.33)
    SetEntityHeading(ped, 180.00)
end)

RegisterNetEvent('lto_roulette:TeleportBack')
AddEventHandler('lto_roulette:TeleportBack', function()
	local ped = PlayerPedId()
	DoScreenFadeOut(2000)
	Wait(5000)
	DoScreenFadeIn(3000)
	SetEntityCoords(ped, 2670.40, -1546.66, 45.96)
	SetEntityHeading(ped, 360.00)
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

