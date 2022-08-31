-- Adapted from "Time to Cook": 2718642011
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2718642011
-- https://github.com/FocusPunch/time-to-cook

require 'ISUI/ISInventoryPane'

timeToCook = {}
timeToCook.ISInventoryPaneDrawItemDetails = ISInventoryPane.drawItemDetails

function ISInventoryPane:drawItemDetails(item, y, xoff, yoff, red)
    timeToCook.ISInventoryPaneDrawItemDetails(self, item, y, xoff, yoff, red)
    if instanceof(item, "Food") then
        -- Item is cooking, show that information
        if(item:isCookable() and item:getCookingTime() < item:getMinutesToCook() and item:getHeat() > 1.6) then
            local player = getSpecificPlayer(self.player)
            if player:getPerkLevel(Perks.Cooking) >= 3 then
                local top = self.headerHgt + y * self.itemHgt + yoff
                local fgBar = {r=0.0, g=0.6, b=0.0, a=0.7}
                local fgText = {r=0.6, g=0.8, b=0.5, a=0.6}
                self:drawText("Ready in " .. (math.ceil((item:getMinutesToCook()-item:getCookingTime())/2)) .. " Minutes", 40 + 30 + xoff + 200, top + (self.itemHgt - self.fontHgt) / 2, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
            end
        end
    end
end
