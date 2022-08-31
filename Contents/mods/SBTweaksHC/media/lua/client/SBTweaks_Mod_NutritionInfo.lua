-- Mod: Nutrition Window (2830099097)
-- Show nutritional information on the health info window

local NutritionInfo_HasSetup = false

local function NutritionInfo_Setup()
    if not NutritionInfo_HasSetup then
        NutritionInfo_HasSetup = true

        local old_render = ISCharacterScreen.render
        function ISCharacterScreen:render()
            local result = old_render(self)
            self:render_NutritionInfo()
            return result
        end

    end
end
Events.OnGameStart.Add(NutritionInfo_Setup);

function ISCharacterScreen:render_NutritionInfo()
    --local stringFormat = "%0.2f";
    local stringFormat = "%0.0f";
    local cal = string.format(stringFormat, self.char:getNutrition():getCalories());
    local carb = string.format(stringFormat, self.char:getNutrition():getCarbohydrates());
    local lip = string.format(stringFormat, self.char:getNutrition():getLipids());
    local prot = string.format(stringFormat, self.char:getNutrition():getProteins());

    -- local x = self.xOffset;
    local x = self.width - 65;
    local z = self.height - 70;

    self:drawTextRight("Cal", x, z, 1, 1, 1, 1, UIFont.Small);
    self:drawText(cal, x + 10, z, 1, 1, 1, 0.5, UIFont.Small);
    z = z + 14
    self:drawTextRight("Carb", x, z, 1, 1, 1, 1, UIFont.Small);
    self:drawText(carb, x + 10, z, 1, 1, 1, 0.5, UIFont.Small);
    z = z + 14
    self:drawTextRight("Lip", x, z, 1, 1, 1, 1, UIFont.Small);
    self:drawText(lip, x + 10, z, 1, 1, 1, 0.5, UIFont.Small);
    z = z + 14
    self:drawTextRight("Prot", x, z, 1, 1, 1, 1, UIFont.Small);
    self:drawText(prot, x + 10, z, 1, 1, 1, 0.5, UIFont.Small);
end
