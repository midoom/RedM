
local BONES = {
	--[[Pelvis]][11816] = true,
	--[[SKEL_L_Thigh]][65478] = true, --done
	--[[SKEL_L_Calf]][55120] = true, --done
	--[[SKEL_L_Foot]][45454] = true, --done
	--[[SKEL_L_Toe0]][53081] = true, --done
	--[[IK_L_Foot]][65245] = true, --done
	--[[PH_L_Foot]][2718] = true, --done
	--[[MH_L_KneeBack]][22173] = true, --done
	--[[SKEL_R_Thigh]][6884] = true, --done
	--[[SKEL_R_Calf]][43312] = true, --done
	--[[SKEL_R_Foot]][33646] = true, --done
	--[[SKEL_R_Toe0]][41273] = true, --done
	--[[IK_R_Foot]][35502] = true, --done
	--[[PH_R_Foot]][38142] = true, --done
	--[[MH_R_KneeBack]][63133] = true, --done
	--[[RB_L_ThighRoll]][61747] = true, --done
	--[[RB_R_ThighRoll]][58057] = true, --done
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
			--if IsShockingEventInSphere(102, 235.497,2894.511,43.339,999999.0) then
			if HasEntityBeenDamagedByAnyPed(ped) then
			--if GetPedLastDamageBone(ped) = 
					Disarm(ped)
			end
			ClearEntityLastDamageEntity(ped)
	 end
end)



function Bool (num) return num == 1 or num == true end

-- WEAPON DROP OFFSETS
local function GetDisarmOffsetsForPed (ped)
	local v

	if IsPedWalking(ped) then v = { 0.6, 4.7, -0.1 }
	elseif IsPedSprinting(ped) then v = { 0.6, 5.7, -0.1 }
	elseif IsPedRunning(ped) then v = { 0.6, 4.7, -0.1 }
	else v = { 0.4, 4.7, -0.1 } end

	return v
end

function Disarm (ped)
	if IsEntityDead(ped) then return false end

	local boneCoords
	local hit, bone = GetPedLastDamageBone(ped)

	hit = Bool(hit)

	if hit then
		if BONES[bone] then
			

			boneCoords = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, bone))
			SetPedToRagdoll(PlayerPedId(), 5000, 5000, 0, 0, 0, 0)
			

			return true
		end
	end

	return false
end

	