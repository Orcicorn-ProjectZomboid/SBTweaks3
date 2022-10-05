-- Only load of DrHyde is loaded
if getActivatedMods():contains("DrHyde1Vaccine") == false then return; end
require 'functions/LabModEngine.lua'

-- Embed infection rate into Syringe With Blood
function LabRecipes.ProcessBloodForAnalysis(items, result, player)
    result:getModData().IsInfected = player:getBodyDamage():isInfected();
	result:getModData().InfectionRate = LabRecipes.InfectionRate(player);
	player:getBodyDamage():ReduceGeneralHealth(5);
    print(result:getModData().IsInfected);
	LabRecipes.PrintTestInfo(player,result);
end--function

-- Change test result item if result is positive
function LabRecipes.CreateBloodTestResult(items, result, player)
	for i = 0, items:size()-1 do
		local item = items:get(i);
		if item:getType() == "CmpSyringeWithBlood" then
			if not(item:getModData().IsInfected) then
				local playerdata = player:getModData();
				if playerdata.Cobaye == false then
                    -- Positive Guinea Pig (Not sure what this means)
				    player:getInventory():AddItem("LabItems.LabTestResultPositive");
                else local testResult = player:getInventory():AddItem("LabItems.LabTestResultNegative") ;
                    -- You are not infected
				    testResult:setName(testResult:getName() .. " (100 %)") ;
				end
			else
                -- You are infected
				local testResult = player:getInventory():AddItem("LabItems.LabTestResultPositive");
				testResult:setName(testResult:getName().." ("..math.floor(item:getModData().InfectionRate*100).."%)");
			end--if
		end--if
	end--for
end--function

-- Change test result item if result is positive Syringe Reusable
function LabRecipes.CreateBloodTestResultTwo(items, result, player)
	for i = 0, items:size()-1 do
		local item = items:get(i);
		if item:getType() == "CmpSyringeReusableWithBlood" then
			if not(item:getModData().IsInfected) then
				local playerdata = player:getModData();
				if playerdata.Cobaye == false then
				    player:getInventory():AddItem("LabItems.LabTestResultPositive");
				else local testResult = player:getInventory():AddItem("LabItems.LabTestResultNegative") ;
					testResult:setName(testResult:getName() .. " (100 %)") ;
				end
			else
				local testResult = player:getInventory():AddItem("LabItems.LabTestResultPositive");
				testResult:setName(testResult:getName().." ("..math.floor(item:getModData().InfectionRate*100).."%)");
			end--if
		end--if
	end--for
end--function


-- -------------------------------- --
-- USED IN VIRUS TEST KITS -------- --
-- -------------------------------- --
--Used to test for zombie infection via the Virus Kits
function TestForInfection(items, result, player)
    local bodyDamage = player:getBodyDamage();
    local infectionProgress = (player:getHoursSurvived() - bodyDamage:getInfectionTime()) / bodyDamage:getInfectionMortalityDuration();
	local playerdata = player:getModData();

    -- If you're the guniea pig use the default settings
	if playerdata.Cobaye == false then
		if infectionProgress <= 0 then
		player:Say("The virus is not present in my bloodstream.");
		elseif infectionProgress <= 0.2 then
		player:Say("The virus is present in my blood stream.");
		elseif infectionProgress <= 0.75 then
		player:Say("The virus is in the first stage of mutation.");
		elseif infectionProgress <= 0.9 then
		player:Say("The virus is in the middle stage of mutation.");	
		else
		player:Say("The virus is in the final stage of mutation.");
		end
	else
    --Otherwise lets use Tyler's random sistuation
    -- Test should be 80% effective/reliable
    -- Doctor score determines your chance of determining if it's wrong
        local isFalsePositive = false
        local isInfected = player:getBodyDamage():isInfected();
        if ZombRand(1, 10) <= 2 then
            -- Defective Test, invert the results
            isFalsePositive = true;
            isInfected = not(isInfected)
        end
        if isFalsePositive and ZombRand(0, 10) < player:getPerkLevel(Perks.Doctor) then
            -- If Defective then Random Chance you detect it based on your First Aid Skill
            player:Say("This test appears defective");
        else
            -- Not Defective, or Not Detected as Defective
            if isInfected then
                player:Say("The test appears to be positive");
            else
                player:Say("The test appears to be negative");
            end
        end
	end 
	--Debug command:
	--player:Say("My infection progress: " .. math.ceil(infectionProgress * 100.0) .."%");
end