config = {}
config.HANGING_PED = {
    dict = 'script_re@public_hanging@criminal_male',
    name = 'intro_idle',
    requestDict = function()
        RequestAnimDict(config["HANGING_PED"].dict)
        while not HasAnimDictLoaded(config["HANGING_PED"].dict) do
            Citizen.Wait(5)
        end
    end
}

config.hanging_locations = {
    {
        ropeHang = vector3(0.0, 0.0, 2.5), 
        location = vector3(-315.134, 733.651, 120.606),
        heading = 100.645,
        lever = -1539465244,
        floorboard = -1923741333
    }
}