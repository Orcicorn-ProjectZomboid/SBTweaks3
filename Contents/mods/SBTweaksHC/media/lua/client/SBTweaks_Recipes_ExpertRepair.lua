-- Super Repair Weapons
function SBTweaks_SuperRepairGuns(items, result, player)
    for i=0, items:size() -1 do
        -- Set Condition to Max Condition
        if items:get(i):getType() ~= "Screwdriver" then
            if items:get(i):getType() ~= "Cleaning" then
                items:get(i):setCondition( items:get(i):getConditionMax() );
            end
        end
    end
    -- result:setWeight(0)
    -- result:setCondition(0)
    -- result:setName("Metal Shavings")
end
