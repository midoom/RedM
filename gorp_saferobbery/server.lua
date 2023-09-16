VorpInv = exports.vorp_inventory:vorp_inventoryApi()
VorpCore = {}
data = {}

TriggerEvent("getCore", function(core) VorpCore = core end)

Citizen.CreateThread(function()
    Citizen.Wait(2000) 
    VorpInv.RegisterUsableItem("lockpick", function(data)
        TriggerClientEvent('gorp:saferobbery', data.source)
    end)
end)

local Items = {
    {item = "alliance", name = "alliance", amountToGive = math.random(1,4)},
    {item = "pepite_or", name = "pepite_or", amountToGive = math.random(1,2)},
    {item = "pocket_watch", name = "pocket_watch", amountToGive = math.random(1,4)},
    {item = "pipe", name = "pipe", amountToGive = math.random(1,4)},
    {item = "diamond", name = "diamond", amountToGive = math.random(1,3)},
    {item = "goldring", name = "goldring", amountToGive = math.random(1,3)},
    {item = "goldbar", name = "goldbar", amountToGive = math.random(1,3)},
    {item = "bague_rubis", name = "estimulantes equino", amountToGive = math.random(1,3)}
}

function payLoot(source)
    local Loot = {}
    for k, v in pairs(items) do 
        table.insert(Loot,v.item)
    end
    if Loot[1] ~= nil then
        local value = math.random(1,#Loot)
        local picked = Loot[value]
        return picked
    end
end


RegisterServerEvent('gorp:robberycomplete')
AddEventHandler('gorp:robberycomplete', function()
	local FinalLoot = LootToGive(source)
    local User = VorpCore.getUser(source).getUsedCharacter
    local chance = math.random(1,100)
    if chance <= 50 then
        for k,v in pairs(Items) do
                if v.item == FinalLoot then
                    VorpInv.subItem(source, "lockpick", 1)
                    VorpInv.addItem(source, FinalLoot, v.amountToGive)
                    LootsToGive = {}
                    TriggerClientEvent("vorp:TipRight", source, 'Vous avez trouvé '..v.amountToGive..' ' ..v.name, 3000)
                end
            end
        else
        TriggerClientEvent("vorp:TipRight", source, 'Votre crochet de verrouillage s\'est cassé et vous n\'avez pas pu l\'ouvrir', 3000)
        VorpInv.subItem(source, "lockpick", 1)
    end
end)

function LootToGive(source)
	local LootsToGive = {}
	for k,v in pairs(Items) do
		table.insert(LootsToGive,v.item)
	end
	if LootsToGive[1] ~= nil then
		local value = math.random(1,#LootsToGive)
		local picked = LootsToGive[value]
		return picked
	end
end