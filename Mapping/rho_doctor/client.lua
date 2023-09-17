Citizen.CreateThread(function()
	RemoveImap(GetHashKey("rho_03__strm_1"))
	RequestImap(GetHashKey("rho_03__strm_1_edit"))


    --occluded
    RemoveImap(GetHashKey("rho_01__strm_0"))
    RemoveImap(GetHashKey("rho_01__strm_1"))
    RemoveImap(GetHashKey("rho_01__strm_2"))
    RemoveImap(GetHashKey("rho_01__long_0"))
    RemoveImap(GetHashKey("rho_01_"))

    RequestImap(GetHashKey("rho_01_edit"))
	RequestImap(GetHashKey("rho_01__long_0_edit"))
    RequestImap(GetHashKey("rho_01__strm_0_edit"))
    RequestImap(GetHashKey("rho_01__strm_1_edit"))
    RequestImap(GetHashKey("rho_01__strm_2_edit"))
end)