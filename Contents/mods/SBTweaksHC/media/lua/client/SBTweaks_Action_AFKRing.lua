require "TimedActions/ISBaseTimedAction"
ISGhostRingAFK = ISBaseTimedAction:derive("ISGhostRingAFK");              

function ISGhostRingAFK:isValid() 
	-- return self.character:getInventory():contains(self.ring);
    -- Required, so if the ring is equipped then this action is valid
    return self.ring:isEquipped()
end

function ISGhostRingAFK:update()
    -- We're basically resting
	self.character:setMetabolicTarget(Metabolics.SeatedResting);
    -- Every 2 seconds flash "AFK MODE" above your head
    if getTimestampMs() % 2000 == 0 then
        HaloTextHelper.addText(getSpecificPlayer(0), getText("IGUI_SBTweaks_HaloAFKActive"), HaloTextHelper.getColorRed());
    end
end

function ISGhostRingAFK:start()  
    -- Beginning of the AFK Animation. 
    -- Gently caress the clock while you're away
    self:setAnimVariable("ReadType", "newspaper")
    self:setActionAnim(CharacterActionAnims.Read);
    self:setOverrideHandModels(nil, "AlarmClock")
end

function ISGhostRingAFK:stop()  
    -- You hit escape or moved to cancedl
    if self.ring:isEquipped() then
        self.ring:Unwear();
        self.ring:getContainer():setDrawDirty(true);
    end 
    ISBaseTimedAction.stop(self);
end

function ISGhostRingAFK:perform()     
    -- Continue to perform (kinda do nothing)
	ISBaseTimedAction.perform(self);
end

function ISGhostRingAFK:new(character, ring)     
    -- New request. Max time is forever (-1)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.ring = ring;
	o.stopOnWalk = true;
	o.stopOnRun = true;
    o.stopOnAim = false;
	o.maxTime = -1;
    return o;
end
