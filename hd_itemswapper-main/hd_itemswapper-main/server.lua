--Pulls vorp core and inventory
local VORPcore = {}
TriggerEvent("getCore", function(core)
  VORPcore = core
end)
local VorpInv = {}
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
--End of pulling VORP Inventory, and core

--Handles the crafting part
RegisterServerEvent('hd_itemswapper:craftitem') --creates a server event
AddEventHandler('hd_itemswapper:craftitem', function(qty, Selectedtable) --catches the table and qty variables
  local youhadtheitems = false --is a catch variable
  local itemremoveamount = 0 -- catch varibale
  local itemaddamount = 0 --catch variable
  for p, a in pairs(Selectedtable.TakenItems) do --creates a loop that will repeat once for each table
    itemremoveamount = a.count * qty --multiplies the amount in the table by the qty (does not need an if qty = 1 and a qty > 1 as if qty is 1 then 1  times anything is that number)
    local itemCount = VorpInv.getItemCount(source, a.name) --checks how many of an item you have
    if itemCount >= itemremoveamount then --if you have more or equal to the item needed then
      VorpInv.subItem(source, a.name, itemremoveamount) --removes the items
      youhadtheitems = true --sets the catch to true
    elseif itemCount < itemremoveamount then
      TriggerClientEvent('hd_itemswapper:youdonothavetheitemsneeded', source) break --if you do not have all the items trigger event and break loop
    end
  end
  if youhadtheitems == true then --if variable is true(if items have been removed then)
    for i, e in pairs(Selectedtable.GivenItem) do --creates for loop
      itemaddamount = e.count * qty --multiplies the table variable by the qty(no need for if qty > or = as anything times 1 is that number so)
      VorpInv.addItem(source, e.name, itemaddamount) --adds the item or items
    end
    TriggerClientEvent('hd_itemswapper:itemcreated', source) --if you succesfully make the item trigger client event to print on screen
  end
  youhadtheitems = false --resets the variable so this code can run again and work
end)

RegisterServerEvent('hd_itemswapper:qtycatcher') --creates a server event used to catch and pass qty back to the client
AddEventHandler('hd_itemswapper:qtycatcher', function(qty)
  TriggerClientEvent('hd_itemswapepr:qtyclientcatch', source, qty) --triggers the client and passes the variable
end)

--Handles the converter aspect of the script.
Citizen.CreateThread(function()
  for k, v in pairs(Config.converter) do --Sets the table Config.converter to varible v and opens it in the for loop
    VorpInv.RegisterUsableItem(v.TakenItem, function(data) --registers the item usable
      VorpInv.subItem(data.source, v.TakenItem, v.Amount) --takes the item listed in the config and the listed amount
      for u, p in pairs(v.GivenItems) do --opens table GivenItems from Config.converter table or varible v
        VorpInv.addItem(data.source, p.name, p.count) --Adds the items specified in config and the specified amount
      end
      local webhook = Webhooklink --Gets your webhook link
      local _source = source or data.source  --gets the players info
      local Character = VORPcore.getUser(_source).getUsedCharacter --Pulls the character info
      VORPcore.AddWebhook(Character.identifier, webhook, v.webhookdesc) --Sends the webhook with the players steam id and the webhookdesc specified in the config
    end)
  end
end)
--end of converter