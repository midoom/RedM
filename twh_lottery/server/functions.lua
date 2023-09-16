local VORPcore = {}
local VORPInv = {}

VORPInv = exports.vorp_inventory:vorp_inventoryApi()

TriggerEvent("getCore", function(core)
    VORPcore = core
end)


function InsertionSort(array)
    local len = #array
    local j
    for j = 2, len do
        local key = array[j].chance
        local key2 = array[j].price
        local i = j - 1
        while i > 0 and array[i].chance > key do
            array[i + 1].chance = array[i].chance
            array[i + 1].price = array[i].price
            i = i - 1
        end
        array[i + 1].chance = key
        array[i + 1].price = key2
    end
    return array
end


function CheckData(v,data)
    local card = VORPInv.getItem(data.source, tostring(v.item))
	local meta =  card["metadata"]
    if not meta.price then 
        VORPInv.CloseInv(data.source)
        VORPInv.subItem(data.source, v.item, 1)
        TriggerEvent("twh_lottery:scratchS", data.source, v)
    else
        TriggerClientEvent("vorp:NotifyLeft",data.source, _U("title"),_U("alreadyUsed"), "generic_textures", "lock", 2000)
    end

           
end

function GetIdentity(source, identity)
    local num = 0
    local num2 = GetNumPlayerIdentifiers(source)

    if GetNumPlayerIdentifiers(source) > 0 then
        local ident = nil
        while num < num2 and not ident do
            local a = GetPlayerIdentifier(source, num)
            if string.find(a, identity) then ident = a end
            num = num + 1
        end
        return ident;
    end
end





