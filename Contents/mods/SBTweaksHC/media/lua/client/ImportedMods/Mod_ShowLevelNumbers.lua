-- IMPORTED FROM "ShowExactLevelNumber" 2837506142
-- Show's a level number on character creation screen
-- so you don't need to count the bars anymore

CharacterCreationProfession = CharacterCreationProfession

function CharacterCreationProfession:drawXpBoostMap(y, item, alt)
    local dy = (self.itemheight - self.fontHgt) / 2

    local levelString = ' ('..item.item.level..')';
    self:drawText(item.text..levelString, 16, y + dy, 0, 1, 0, 1, UIFont.Small);

    local percentage = "+ 75%";
    if item.item.level == 2 then
    percentage = "+ 100%";
    elseif item.item.level >= 3 then
    percentage = "+ 125%";
    end

    local textWid = getTextManager():MeasureStringX(UIFont.Small, item.text)
    local greenBlitsX = self.width - (68 + 10 * 4)
    local yy = y
    if 16 + textWid > greenBlitsX - 4 then
        yy = y + self.fontHgt
    end

    for i = 1, item.item.level do
    self:drawTexture(CharacterCreationProfession.instance.greenBlits, self.width - (68 + 10 * 4) + (i * 4), (yy) + dy + 4
        , 1, 1, 1, 1);
    end
    if item.item.perk ~= Perks.Fitness and item.item.perk ~= Perks.Strength then
        self:drawTextRight(percentage, self.width - 16, yy + dy, 0, 1, 0, 1, UIFont.Small);
    end

    yy = yy + self.itemheight;

    self:drawRectBorder(0, (y), self:getWidth(), yy - y - 1, 0.5, self.borderColor.r, self.borderColor.g,
    self.borderColor.b);

    return yy;
end
