require 'Maps/ISMapDefinitions'

local MINZ = 0
local MAXZ = 24

local function overlayPNG(mapUI, x, y, scale, layerName, tex, alpha)
	local texture = getTexture(tex)
	if not texture then return end
	local mapAPI = mapUI.javaObject:getAPIv1()
	local styleAPI = mapAPI:getStyleAPI()
	local layer = styleAPI:newTextureLayer(layerName)
	layer:setMinZoom(MINZ)
	layer:addFill(MINZ, 255, 255, 255, (alpha or 1.0) * 255)
	layer:addTexture(MINZ, tex)
	layer:setBoundsInSquares(x, y, x + texture:getWidth() * scale, y + texture:getHeight() * scale)
end

-- Blank Personal Notes
LootMaps.Init.SBTweaks_PersonalNotes = function(mapUI)
	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(0, 0, 850, 475)
	overlayPNG(mapUI, 0, 0, 0.666, "lootMapPNG", "media/ui/LootableMaps/SBTweaks_Blank.png", 1)
end

-- The Skillbook Catalog
LootMaps.Init.SBTweaks_BooksList = function(mapUI)
	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(0, 0, 850, 475)
	overlayPNG(mapUI, 0, 0, 0.666, "lootMapPNG", "media/ui/LootableMaps/SBTweaks_BooksList.png", 1)
end
