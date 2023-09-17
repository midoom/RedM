VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}
TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterNetEvent('lezd_inv_outfits:buyOutfit')
AddEventHandler('lezd_inv_outfits:buyOutfit', function(outfit)
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local userMoney = Character.money
    if userMoney >= Config.buyOutfitPrice then
        TriggerEvent("vorp:removeMoney", _source, 0, Config.buyOutfitPrice)
        TriggerEvent("lezd_inv_outfits:addOutfitInventory", _source, outfit)
    end
end)

RegisterNetEvent('lezd_inv_outfits:addOutfitInventory')
AddEventHandler('lezd_inv_outfits:addOutfitInventory', function(source, outfit)
    local _source = source
	local User = VorpCore.getUser(_source)
	local CharInfo = User.getUsedCharacter
    local name = CharInfo.firstname.." "..CharInfo.lastname
    local metadata = {}
    metadata["outfit"] = outfit
    metadata["label"] = outfit.label
    metadata["description"] = "Réalisé par".." "..name
    metadata["durability"] = Config.outfitDurability
 	VorpInv.addItem(source, Config.outfitItemName, 1, metadata)
end)

VorpInv.RegisterUsableItem(Config.outfitItemName, function(data)
    local newMetadata = data.item.metadata

    -- VorpInv.subItem(data.source, Config.outfitItemName, 1, data.item.metadata)

    -- newMetadata.durability = newMetadata.durability-1
    -- if newMetadata.durability > 0 then
    --     VorpInv.addItem(data.source, Config.outfitItemName, 1, newMetadata)
    -- else
    --     TriggerClientEvent("vorp:TipRight", _source, "Vos habits sont usés et se déchirent...", 3000)
    -- end

	TriggerClientEvent("syn_clothing:setoutfit", data.source, data.item.metadata.outfit)
end)

-- VorpInv.RegisterOnItemDrop(Config.outfitItemName, function(data)
--     -- todo: get naked if it's the current outfit
-- end)
