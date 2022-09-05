require "TimedActions/ISBaseTimedAction"
local original_PillFunction = ISTakePillAction.perform

function ISTakePillAction:perform()
    local pillType = self.item:getType()
    local bodyDamage = self.character:getBodyDamage()
    local playerStats = self.character:getStats()

    -- If not our pills, run the other/default pill actions
    if not luautils.stringStarts(pillType, "PillsSB") then
        --print("Not our pills")
        original_PillFunction(self)
        return
    end

    -- **** HYDROCODONE ****
    --  - Immediate pain relief but a small amount
    --  - A lot of long lasting pain relief
    --  - Causes some impairment (Drunk and Fatigue)
    --  - Reduces boredom a bit too (you're high)
    --  - Not really hungry
    --  - No stress, No Panic, (again you're high)
    if pillType == "PillsSBOpioids" then
        -- bodyDamage:setPainReduction(15);
        -- bodyDamage:setPainReductionFromMeds(75);
        if bodyDamage:getPainReduction() < 70 then
            bodyDamage:setPainReduction(70);
        end
        playerStats:setDrunkenness(playerStats:getDrunkenness()+20);
        playerStats:setBoredom(playerStats:getBoredom()-10);
        playerStats:setHunger(playerStats:getHunger()-10);
        playerStats:setFatigue(playerStats:getFatigue()+0.5);
        playerStats:setStress(0)
        playerStats:setPanic(0)
    end

    -- **** COUGH SYRUP ****
    --  - Reduces cold value by a decent amount
    --  - Reduces thirst by a miniscule amount
    --  - Adds a miniscule amount of drunkenness
    if pillType == "PillsSBCoughSyrup" then
        if bodyDamage:isHasACold() then
            bodyDamage:setColdReduction(25);
            playerStats:setThirst(playerStats:getThirst()-5);
            playerStats:setDrunkenness(playerStats:getDrunkenness()+5);
        end
    end

    -- **** TUMS *****
    -- Reduces FoodSickness by a small amount
    if pillType == "PillsSBTums" then 
        if bodyDamage:getFoodSicknessLevel() > 0 then
            bodyDamage:setFoodSicknessLevel(bodyDamage:getFoodSicknessLevel()-10);
        end
    end

    -- Update the Tiem
    self.item:Use();
    self.item:setJobDelta(0.0);
	self.character:getBodyDamage():JustTookPill(self.item);
    ISBaseTimedAction.perform(self);
end