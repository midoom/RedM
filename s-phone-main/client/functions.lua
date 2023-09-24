VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)

TriggerEvent("menuapi:getData", function(call)
    MenuData = call
  end)
  
xSound = exports.xsound

function valincomingcalls ()
exports['pma-voice']:setCallChannel(1.5)
end

function bwincomingcalls ()
    exports['pma-voice']:setCallChannel(1.7)
end

function stincomingcalls ()
    exports['pma-voice']:setCallChannel(1.9)
end

function valsherrif ()
    exports['pma-voice']:setCallChannel(2.0)
end

function bwsherrif ()
    exports['pma-voice']:setCallChannel(2.1)
end

function stsherrif ()
    exports['pma-voice']:setCallChannel(2.2)
end

function disconnect ()
    exports['pma-voice']:setCallChannel(0)
end

function anim ()
    RequestAnimDict("script_proc@robberies@coach@rhodes")
    while not HasAnimDictLoaded("script_proc@robberies@coach@rhodes") do
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "script_proc@robberies@coach@rhodes","waiting_01_alden", 8.0, 8.0, 100000000000000, 1, 0, true, 0, false, 0, false)
end

