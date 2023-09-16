local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem("headbucket", function(data)
	TriggerClientEvent('lto_headbucket:Verification', data.source)
    VORP.CloseInv(data.source) -- this make close the inventory when using the bucket
end)

RegisterServerEvent('lto_headbucket:PutBucket')
AddEventHandler('lto_headbucket:PutBucket', function(target)
    local _source = source
	TriggerClientEvent('lto_headbucket:BucketActif', target)
end)