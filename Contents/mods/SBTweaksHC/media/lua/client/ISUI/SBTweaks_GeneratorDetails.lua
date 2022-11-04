-- Generator Time Remaining (2883397918)
-- Appends the Days/Hours to the side of the remaining fuel

GeneratorDays = GeneratorDays or {
    days  = 0,
    hours = 0
}
  
function GeneratorDays:_calcFuelLeft(generator, fuel)
    local fuelConsumption = luautils.round(generator:getTotalPowerUsing(), 2)
    self.hours            = 100 / fuelConsumption * (fuel / 100)
    self.days             = GeneratorDays.hours / 24

    if self.days > 0 then
    self.hours = self.hours % 24
    end
end
  
function GeneratorDays:toString(generator, fuel)
    local hasNoFuel   = fuel == 0
    local isNotActive = not generator:isActivated()
    
    -- if hasNoFuel or generator:getTotalPowerUsing() <= 0.0 then
    if hasNoFuel or isNotActive then
        return ""
    end
    self:_calcFuelLeft(generator, fuel)

    local str           = ""
    local isMoreThanDay = self.days > 0

    if isMoreThanDay then
        str = string.format(" (%0.0f days, %0.0f hours)", self.days, self.hours)
    else
        str = string.format(" (%0.0f hours)", self.hours)
    end
    return str
end

-- Overwrite the Original Generator Rich Text Window
function ISGeneratorInfoWindow.getRichText(object, displayStats)
    local square = object:getSquare()
    if not displayStats then
        local text = " <INDENT:10> "
        if square and not square:isOutside() and square:getBuilding() then
            text = text .. " <RED> " .. getText("IGUI_Generator_IsToxic")
        end
        return text
    end
    local fuel = math.ceil(object:getFuel())
    local condition = object:getCondition()
    -- Original fuel display
    -- local text = getText("IGUI_Generator_FuelAmount", fuel) .. " <LINE> " .. getText("IGUI_Generator_Condition", condition) .. " <LINE> "

    -- New Fuel Display
    local fuelLeft  = GeneratorDays:toString(object, fuel)
    local text = getText("IGUI_Generator_FuelAmount", fuel) .. fuelLeft .. " <LINE> " .. getText("IGUI_Generator_Condition", condition) .. " <LINE> "

    -- Back to original details added
    if object:isActivated() then
        text = text ..  " <LINE> " .. getText("IGUI_PowerConsumption") .. ": <LINE> ";
        text = text .. " <INDENT:10> "
        local items = object:getItemsPowered()
        for i=0,items:size()-1 do
            text = text .. "   " .. items:get(i) .. " <LINE> ";
        end
        text = text .. getText("IGUI_Total") .. ": " .. luautils.round(object:getTotalPowerUsing(), 2) .. " L/h <LINE> ";
    end
    if square and not square:isOutside() and square:getBuilding() then
        text = text .. " <LINE> <RED> " .. getText("IGUI_Generator_IsToxic")
    end
    return text
end