local poisoned = false
local myrkky = 0
local tapahtunut = false
local tapahtunut2 = false
local tapahtunut3 = false
local tapahtunut4 = false
local antidote = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local size = GetNumberOfEvents(0)
		if size > 0 then
			for i = 0, size - 1 do

				local eventAtIndex = GetEventAtIndex(0, i)

				if eventAtIndex == GetHashKey("EVENT_ENTITY_DAMAGED") then

					local eventDataSize = 9 

					local eventDataStruct = DataView.ArrayBuffer(128)
					eventDataStruct:SetInt32(16 ,0)			-- 8*2 offset for 2 element of eventData
					eventDataStruct:SetInt32(24 ,0)			-- 8*3 offset for 3 element of eventData

					local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)

					if is_data_exists then
						if PlayerPedId() == eventDataStruct:GetInt32(0) then
							local weaponHash = eventDataStruct:GetInt32(16)
							local ammo = eventDataStruct:GetInt32(24)
							if ammo == GetHashKey("AMMO_THROWING_KNIVES_POISON") or ammo == GetHashKey("AMMO_ARROW_POISON") then
								Poison()
							end
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local size = GetNumberOfEvents(0)
		if size > 0 then
			for i = 0, size - 1 do

				local eventAtIndex = GetEventAtIndex(0, i)

				if eventAtIndex == GetHashKey("EVENT_ENTITY_DAMAGED") then

					local eventDataSize = 9 

					local eventDataStruct = DataView.ArrayBuffer(128)
					eventDataStruct:SetInt32(8 ,0)

					local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)

					if is_data_exists then
						if PlayerPedId() == eventDataStruct:GetInt32(0) then
							local snake = eventDataStruct:GetInt32(8)
							local model = GetEntityModel(snake)
							for i,v in pairs(Config.Snakes) do
								if model == GetHashKey(v.model) then
									Poison()
								end
							end
						end
					end
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	AnimpostfxStop("ODR3_Injured01Loop")
end)


RegisterNetEvent('Perry_Poison:UseAntidote')
AddEventHandler('Perry_Poison:UseAntidote', function()
	antidote = true
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if poisoned then
			if IsPedRunning(PlayerPedId()) then
				Citizen.Wait(5000)
				myrkky = myrkky + 5
			end
		end
	end
end)


function Poison()
	poisoned = true
	TriggerEvent('vorp:TipRight', 'Vous avez ete mordu par un serpent venimeux. Buvez un antidote ou allez voir un medecin.', 10000)
	AnimpostfxPlay("ODR3_Injured01Loop")
	while poisoned do
		Citizen.Wait(10000)
		if IsPedDeadOrDying(PlayerPedId()) then
			AnimpostfxStop("ODR3_Injured01Loop")
			myrkky = 0
			tapahtunut = false
			tapahtunut2 = false
			tapahtunut3 = false
			tapahtunut4 = false
			antidote = false
			poisoned = false
			break
		else
			if not antidote then
				myrkky = myrkky + 1
				if myrkky >= 20 and not tapahtunut then
					Citizen.Wait(500)
					tapahtunut = true
					TriggerEvent('vorp:TipRight', 'Vous commencez a avoir des difficultes a respirer.', 10000)
					RequestAnimDict("amb_misc@world_human_coughing@male_c@wip_base")
					while not HasAnimDictLoaded("amb_misc@world_human_coughing@male_c@wip_base") do
						Citizen.Wait(100)
					end
					TaskPlayAnim(PlayerPedId(), "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false) 
					Citizen.Wait(10000)
					TaskPlayAnim(PlayerPedId(), "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false) 
					Citizen.Wait(10000)
					TaskPlayAnim(PlayerPedId(), "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false) 
					Citizen.Wait(5000)
					SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 0, 0, 0)
				elseif myrkky >= 40 and not tapahtunut2 then
					tapahtunut2 = true
					TriggerEvent('vorp:TipRight', 'Vous remarquez comment vos membres commencent a defaillir.', 10000)
					AnimpostfxStop("ODR3_Injured01Loop")
					AnimpostfxPlay("PoisonDartPassOut")
					Citizen.Wait(7000)
					DoScreenFadeOut(2000) 
					Citizen.Wait(3000)
					AnimpostfxStop("PoisonDartPassOut")  
					Wait(5000)
					AnimpostfxPlay("ODR3_Injured01Loop")
					TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_SLEEP_GROUND_ARM'), -1, false, "test", 0, false)
					DoScreenFadeIn(5000)
					Wait(5000)
				elseif myrkky >= 60 and not tapahtunut3 then
					tapahtunut3 = true
					SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 0, 0, 0)
				elseif myrkky >= 80 and not tapahtunut4 then
					tapahtunut4 = true
					local pl = Citizen.InvokeNative(0x217E9DC48139933D)
					local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
					Citizen.InvokeNative(0x697157CED63F18D4, ped, 500000, false, true, true)
					AnimpostfxStop("ODR3_Injured01Loop")
					myrkky = 0
					tapahtunut = false
					tapahtunut2 = false
					tapahtunut3 = false
					tapahtunut4 = false
					antidote = false
					poisoned = false
					break
				end
			else
				AnimpostfxStop("ODR3_Injured01Loop")
				myrkky = 0
				tapahtunut = false
				tapahtunut2 = false
				tapahtunut3 = false
				tapahtunut4 = false
				antidote = false
				poisoned = false
				break
			end
		end
	end
end
