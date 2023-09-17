-- Pulls vorp core for the notify
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)
--ends pulling vorp core

--Menu Setup
Citizen.CreateThread(function()
    WarMenu.CreateMenu('hd_itemswapper:menu', Config.Language.Mainmenuname) --creates the main menu
    WarMenu.CreateSubMenu('hd_itemswapper:itemsneededtomake', 'hd_itemswapper:menu', Config.Language.Submenuname) --creates a sub menu
    repeat --repeates until it ends/breaks
        if WarMenu.IsMenuOpened('hd_itemswapper:menu') then --if the menu is opened then
            for k, e in pairs(Config.crafting) do --opens the table and creates for loop
                for i, a in pairs(e.GivenItem) do --opens table and creates for loop
                    if WarMenu.Button(a.displayname, '', Config.Language.Bottomtext) then --creates menu button for table in e.givenitems
                        Citizen.Wait(0)
                        Selectedtable = e --sets the variable to the table for easy passing to client event
                        WarMenu.OpenMenu('hd_itemswapper:itemsneededtomake')
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('hd_itemswapper:itemsneededtomake') then -- if the menu is opened then
            for k, v in pairs(Selectedtable.TakenItems) do --opens table and creates loop
                if WarMenu.Button(Config.Language.Itemshow .. ' ' .. v.count .. ' '.. v.displayname, '', '') then --creates the button(No code will be run if selected'Just used to show the items needed)
                end
            end
            if WarMenu.Button(Config.Language.Craftitembutton) then --Creates the craft item button if it is selected then
                Citizen.Wait(0)
                local myInput = {
                    type = "enableinput", -- dont touch
                    inputType = "input", -- or text area for sending messages
                    button = "confirm", -- button name
                    placeholder = "insertamount", --placeholdername
                    style = "block", --- dont touch
                    attributes = {
                        inputHeader = "amount", -- header
                        type = "number", -- inputype text, number,date.etc if number comment out the pattern
                        pattern = "[0-9]{1,20}", -- regular expression validated for only numbers "[0-9]", for letters only [A-Za-z]+   with charecter limit  [A-Za-z]{5,20}     with chareceter limit and numbers [A-Za-z0-9]{5,}
                        title = "must be only numbers min 1 max 20", -- if input doesnt match show this message
                        style = "border-radius: 10px; background-color: ; border:none;", -- style  the inptup
                    }
                }
                TriggerEvent("vorpinputs:advancedInput", json.encode(myInput),function(result)
                    local qty = tonumber(result)
                    if qty == nil then --if qty is nil then
                        VORPcore.NotifyBottomRight(Config.Language.Invalidamount, 4000) --prints on screen
                    elseif qty > 0 then --elseif qty is greater than one then
                        TriggerServerEvent('hd_itemswapper:qtycatcher', qty) --Triggers server event and passes variable(the qty or input)
                    end
                end)
                WarMenu.CloseMenu() --close menu(prevents bugs, and looks cleaner)
            end
        end
    WarMenu.Display() --makes the menu stay on screen
    Citizen.Wait(0) --prevents crashing
    until false
end)

RegisterNetEvent('hd_itemswapepr:qtyclientcatch') -- Registers a client event to send the table to the server
AddEventHandler('hd_itemswapepr:qtyclientcatch', function(qty)
    TriggerServerEvent('hd_itemswapper:craftitem', qty, Selectedtable) --triggers the server event and passes the variables
end)

RegisterCommand(Config.Craftingcommand, function() --creates a command to open the menu(command name set in config)
    WarMenu.OpenMenu('hd_itemswapper:menu') --opens the menu
end)

RegisterNetEvent('hd_itemswapper:itemcreated') --creates event to be triggered from server if you make the item
AddEventHandler('hd_itemswapper:itemcreated', function()
    VORPcore.NotifyBottomRight(Config.Language.Itemcreated, 4000) --prints on screen
end)

RegisterNetEvent('hd_itemswapper:youdonothavetheitemsneeded') --creates event to be triggered from server if you do not have the required items
AddEventHandler('hd_itemswapper:youdonothavetheitemsneeded', function()
    VORPcore.NotifyBottomRight(Config.Language.Notenoughitems, 4000) --prints on screen
end)