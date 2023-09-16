

--------------------------------------------------
-- Cleanup ---------------------------------------
-- Always leave a space cleaner than you found it.
-------------------------------------------------- 
AddEventHandler('onResourceStop', function(resource) 
    if resource == GetCurrentResourceName() then 
        DeleteAnimationHeadbandProps()    
        ClearPedTasksImmediately(PlayerPedId())  
    end
end)
   
AddEventHandler('playerDropped', function (reason)
    DeleteAnimationHeadbandProps()
end)

----------------------------------------------------------------------------------
function MakeEntityFaceEntity(entity1, entity2)
    if Config.debug ==1 then print(Config.ScriptName,"MakeEntityFaceEntity") end 
    local p1 = GetEntityCoords(entity1)
    local p2 = GetEntityCoords(entity2)

    local dx = p2.x - p1.x
    local dy = p2.y - p1.y

    local heading = GetHeadingFromVector_2d(dx, dy)

    SetEntityHeading(entity1, heading)
end 
----------------------------------------------------------------------------------
 
DeleteAnimationHeadbandProps = function()

    for _k, v in pairs (AttachedHeadbands) do
		for i, entity in pairs(v.entities) do

			local retval =	DoesEntityExist( entity )

			if retval or retval == 1 then 
				DeleteObject(entity)
			end
		end 
	end

end 

DeleteAnimationHeadbandTypeProps = function(type)

    for _k, v in pairs (AttachedHeadbands) do

		if v.type == type then

			for i, entity in pairs(v.entities) do
				Wait(100)

				local retval =	DoesEntityExist( entity )

				if retval or retval == 1 then 
					DeleteObject(entity)
				end 
			end

			
			Wait(1000)
			table.remove(AttachedHeadbands, _k)
		end
	end 

end 