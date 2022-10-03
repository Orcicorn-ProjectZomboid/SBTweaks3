function SBTweaks_ShakeMagic8Ball(items, result, player)
    local random = ZombRand(1, 15)
    if random <= 6 then
        -- Positive
        HaloTextHelper.addTextWithArrow(getSpecificPlayer(0), getText("IGUI_Magic8Ball_" .. random), true, HaloTextHelper.getColorGreen());
    elseif random > 9 then
        -- Negative
        HaloTextHelper.addTextWithArrow(getSpecificPlayer(0), getText("IGUI_Magic8Ball_" .. random), false, HaloTextHelper.getColorRed());
    else
        -- Neutral
        HaloTextHelper.addText(getSpecificPlayer(0), getText("IGUI_Magic8Ball_" .. random), HaloTextHelper.getColorWhite());
    end
    HaloTextHelper.update();
end
