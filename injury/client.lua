local display = false
local ragdoll = false
local injuredSound = false
local toggleEffect = true

local serverControl = false
local bleedingEffect = false
local screenOverlay = false
local clumsiness = false
local soundEffect = false
local injuredAnimation = false
local canBeKnockedOut = false
local threshold, knockoutChance = 0, 0
local lowHealth = false

local toggleBleed = false

local particle_dict = ""
local particle_name = ""		
local particle_effect = false	
local current_particle_id = false

local fxName = "PlayerHealthPoor"

RegisterNetEvent('nic_injury:on')
AddEventHandler('nic_injury:on', function()
  AnimpostfxPlay(fxName)
SendNUIMessage({
  type = "ui",
  display = true
})
end)

RegisterNetEvent('nic_injury:off')
AddEventHandler('nic_injury:off', function()
  AnimpostfxStop(fxName)
SendNUIMessage({
  type = "ui",
  display = false
})
end)

RegisterNetEvent('nic_injury:useBleedEffect')
AddEventHandler('nic_injury:useBleedEffect', function(source)
    toggleBleed = true
end)

-- configuration

Citizen.CreateThread(function()
  while true do
    Wait(5)
    
    for key, value in pairs(Config.settings) do     
        bleedingEffect = value.bleedingEffect
        screenOverlay = value.screenOverlay
        clumsiness = value.clumsiness
        soundEffect = value.soundEffect
        canBeKnockedOut = value.canBeKnockedOut
        threshold = value.injuryThreshold

        if threshold > 200 then
          threshold = 200
        end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(5)
    local ped = PlayerPedId()
    local hp = GetEntityHealth(ped)
    local max = GetEntityMaxHealth(ped)

    if not IsEntityDead(ped) then
      if hp <= threshold then
        lowHealth = true
        
      elseif hp >= threshold then
        lowHealth = false
        stopEffect()
        
      end
    else
      stopEffect()
    end
    
  end
end)

-- screen effects

Citizen.CreateThread(function()
  while true do
    Wait(5)
    local ped = PlayerPedId()

    if not IsEntityDead(ped) then
      if lowHealth then

        if screenOverlay then
          TriggerEvent("nic_injury:on")
          AnimpostfxPlay("Downed")
          AnimpostfxPlay("PlayerHealthLow")
        end

      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(5)
    local ped = PlayerPedId()

    if not IsEntityDead(ped) then
      if lowHealth then

        if clumsiness then
          if IsPedSprinting(ped) then
            Citizen.InvokeNative(0xF0A4F1BBF4FA7497, ped, 5000, 0, 0)
            Citizen.InvokeNative(0xDF993EE5E90ABA25, ped, true)
            Wait(3000)
          end
        end

        if soundEffect and not injuredSound then
          injuredSound = true
          playInjuredAudio()
        end

      else
        Citizen.InvokeNative(0x66B1CB778D911F49, ped, 0.0)
        stopEffect()

        if IsEntityPlayingAnim(ped, animation, anim, 31) then
          injuredSound = false
          ClearPedTasks(ped)
        end

      end 
    else
      Citizen.InvokeNative(0x66B1CB778D911F49, ped, 0.0)
      stopEffect()       
    end
  end
end)

-- knockout

CreateThread(function()
	while true do
		Wait(5)
        local ped = PlayerPedId()
        local hp = GetEntityHealth(ped)
        local max = GetPedMaxHealth(ped)
        local ragdoll = math.random(2000, 7000)
        local stumble = math.random(0, 1)
        local pos = GetEntityForwardVector(ped)

        if canBeKnockedOut then
          if Citizen.InvokeNative(0x9E2D5D6BC97A5F1E, ped, 0xA2719263, 100) then
            local hurt = math.random(0, 50)
  
            if hurt == 2 then
  
                if stumble == 0 and IsPedInMeleeCombat(ped) then
                    Citizen.InvokeNative(0xD76632D99E4966C8, ped, ragdoll, ragdoll, 1, -pos, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                else
                    Citizen.InvokeNative(0xAE99FB955581844A, ped, ragdoll, 0, 0, 0, 0, 0)
                end
                
                AnimpostfxPlay("CamTransition01")
            end
         end
      end
    end
end)

-- bleeding

Citizen.CreateThread(function()
  while true do
    Wait(5)
    local ped = PlayerPedId()
    local bloodDuration = math.random(200, 700)
    local bloodInterval = math.random(800, 3000)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_Head")

    if lowHealth then
        Citizen.InvokeNative(0xFFD54D9FE71B966A,  ped, 2, 14411, 0.0, 0.1,0.0, 0.0,3.0,-1.0, 0.1) -- Blood Fountain Player
      Citizen.Wait(bloodDuration)
      Citizen.InvokeNative(0x66B1CB778D911F49, ped, 0.0)
      Citizen.Wait(bloodInterval)
    else
      Citizen.InvokeNative(0x66B1CB778D911F49, ped, 0.0)
      stopEffect()
    end
    
  end
end)

function stopEffect()
  toggleBleed = false
  current_particle_id = false
  particle_effect = false
  lowHealth = false
  serverControl = false
  AnimpostfxStop("MP_Downed")
  AnimpostfxStop("PlayerHealthLow")
  TriggerEvent("nic_injury:off")
end

function playInjuredAudio()
  local is_shrink_sound_playing = false
  local shrink_soundset_ref = "Objective_Sounds"
  local shrink_soundset_name =  "FAIL"

  if not is_shrink_sound_playing then
    if shrink_soundset_ref ~= 0 then
      Citizen.InvokeNative(0x0F2A2175734926D8, shrink_soundset_name, shrink_soundset_ref);   -- load sound frontend
    end
    Citizen.InvokeNative(0x67C540AA08E4A6F5, shrink_soundset_name, shrink_soundset_ref, true, 0);  -- play sound frontend
    is_shrink_sound_playing = true
  else
    Citizen.InvokeNative(0x9D746964E0CF2C5F, shrink_soundset_name, shrink_soundset_ref)  -- stop audio
    is_shrink_sound_playing = false
  end
end