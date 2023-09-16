local prompt = GetRandomIntInRange(0, 0xffffff)
local menubutton
local active = false
local city = ""
local poster_table = {}
local charidentifier
local group
Citizen.CreateThread(function()
    Citizen.Wait(500)
	local str = "View"
	menubutton = PromptRegisterBegin()
	PromptSetControlAction(menubutton, 0x760A9C6F)
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(menubutton, str)
	PromptSetEnabled(menubutton, 1)
	PromptSetVisible(menubutton, 1)
	PromptSetStandardMode(menubutton,1)
	PromptSetGroup(menubutton, prompt)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,menubutton,true)
	PromptRegisterEnd(menubutton)
end)


function Send_Poster(bool)
    SetNuiFocus(bool, bool)

    guiEnabled = bool
    SendNUIMessage({
		resourceName = GetCurrentResourceName(),
        type = "ui",
        status = bool,
    })
end

function Show_Poster(bool)
    SetNuiFocus(bool, bool)
    guiEnabled = bool
    SendNUIMessage({
		resourceName = GetCurrentResourceName(),
        type = "poster_table",
        status = bool,
		charidentifier = charidentifier,
		group = group,
		table_for_json = poster_table
		})
end

	Citizen.CreateThread(function()
		while true do
			Wait(1)
			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.Posters) do
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.coords[1], v.coords[2], v.coords[3], false) < 1.0 then 
					local label  = CreateVarString(10, 'LITERAL_STRING', "Pinboard")
					PromptSetActiveGroupThisFrame(prompt, label)
					if active == false then
						if Citizen.InvokeNative(0xC92AC953F0A982AE,menubutton) then
							city = v.city
							TriggerServerEvent("syn_pinboard:get_posters", v.city)
							active = true
							Citizen.Wait(1000)
							Show_Poster(true)
						end
					end
				end
			end
		end
	end)

RegisterNetEvent('syn_pinboard:send_list')
AddEventHandler('syn_pinboard:send_list', function(table,x,y)
	poster_table = table
	charidentifier = x
	if y == "admin" then 
		group = true 
	else
		group = false 
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.Posters) do
		local blips = N_0x554d9d53f696d002(1664425300, v.coords[1], v.coords[2], v.coords[3])
		SetBlipSprite(blips, 1735233562, 1)
		SetBlipScale(blips, 1.0)
		Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Notice Board")
	end
end)


RegisterNUICallback('send_to_poster', function(data, cb)
    for k,v in pairs(Config.Posters) do
		local coords = GetEntityCoords(PlayerPedId())
		if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.coords[1], v.coords[2], v.coords[3], false) < 10.0 then
			if data.Title ~= "" then
				local s = data.Link
				TriggerEvent("vorp:TipBottom", "You pinned a paper to the notice board", 4000)
				TriggerServerEvent("syn_pinboard:set_link", data.Title, s:gsub("%'", ""), v.city)
				Citizen.Wait(1000)
				TriggerServerEvent("syn_pinboard:get_posters", v.city)
				Send_Poster(false, false)
				Show_Poster(false, false)
				SetNuiFocus(false, false)
				guiEnabled = false
				active = false
			else
				Send_Poster(false, false)
				Show_Poster(false, false)
				SetNuiFocus(false, false)
				guiEnabled = false
				active = false
			end
		end
	end
end)

RegisterNUICallback('exit', function(data, cb)
    Send_Poster(false, false)
	Show_Poster(false, false)
    SetNuiFocus(false, false)
    guiEnabled = false
	active = false
	cb('ok')
end)


RegisterNUICallback('removepin', function(data, cb)
    Send_Poster(false, false)
	Show_Poster(false, false)
    SetNuiFocus(false, false)
    guiEnabled = false
	active = false
	cb('ok')
	TriggerServerEvent("syn_pinboard:removeposter", data.id)
end)
