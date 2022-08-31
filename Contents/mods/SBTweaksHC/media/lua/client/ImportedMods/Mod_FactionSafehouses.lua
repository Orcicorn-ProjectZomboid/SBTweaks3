
------------------------------------------------------------------------------------------
--
-- @author Jab
-- 2717575749
--
------------------------------------------------------------------------------------------


-- Set this to true to remove non-faction players from safehouses.
local REMOVE_NON_FACTION_MEMBERS = false;


------------------------------------------------------------------------------------------
-- Grabs a player's safehouse if the player is in one.
--
-- @param {String} username - The player in a safehouse.
--
-- @return {?SafeHouse} - Returns the safehouse the player is in. If the player is not
--    in a safehouse, nil is returned.
------------------------------------------------------------------------------------------
local getSafehouse = function(username, must_be_owner)

  -- ArrayList<String>
  local safehouses       = SafeHouse:getSafehouseList();
  local safehouses_count = safehouses:size()           ;

  -- Make sure that we have factions on the server before trying to locate the
  ---  instance of the player's faction.
  if safehouses_count == 0 then return nil end

  -- Go through all safehouses and compare usernames of members to the player.
  for index = 1, safehouses_count, 1 do

    local safehouse = safehouses:get(index - 1);

    -- If the player is the owner, return the safehouse.
    if safehouse:getOwner() == username then return safehouse end

    if not must_be_owner then

        -- ArrayList<String>
        local safehouse_members       = safehouse:getPlayers()  ;
        local safehouse_members_count = safehouse_members:size();

        -- Go through the members to see if the username of the player is present.
        for member_index = 1, safehouse_members_count, 1 do

            -- If the username is found in the members list, return the safehouse.
            if safehouse_members:get(member_index - 1) == username then return safehouse end
        end

    end
  end

  -- No Safehouse has the player's name in it. Return nil.
  return nil;

end

------------------------------------------------------------------------------------------
--- Grabs a player's faction if the player is in one.
---
--- @param {String} username - The player in a faction.
---
--- @return {?Faction} - Returns the faction the player is in. If the player is not
---    in a faction, nil is returned.
------------------------------------------------------------------------------------------
local getFaction = function(username)

  -- ArrayList<Faction>
  local factions      = Faction:getFactions();
  local faction_count = factions:size()      ;

  -- Make sure that we have factions on the server before trying to locate the
  ---  instance of the player's faction.
  if faction_count == 0 then return nil end

  -- Go through all factions and compare usernames of members to the player.
  for index = 1, faction_count, 1 do

    local faction = factions:get(index - 1);

    if faction
    then
        local faction_owner_username = faction:getOwner();

        if faction_owner_username == username then return faction end

        -- ArrayList<String>
        local faction_members       = faction:getPlayers()  ;
        local faction_members_count = faction_members:size();

        -- Go through the members to see if the username of the player is present.
        for member_index = 1, faction_members_count, 1 do

          -- If the username is found in the members list, return the faction.
          if faction_members:get(member_index - 1) == username then return faction end
        end
    end

  end

  -- No faction has the player's name in it. Return nil.
  return nil;

end

------------------------------------------------------------------------------------------
-- @param {SafeHouse} safehouse -
-- @param {String} username -
--
-- @return {boolean} -
------------------------------------------------------------------------------------------
local isInSafehouse = function(safehouse, username)

    -- If the player is the owner, return true.
    if safehouse:getOwner() == username then return true end

    -- ArrayList<String>
    local safehouse_members       = safehouse:getPlayers()     ;
    local safehouse_members_count = safehouse_members:size();

    -- Go through the members to see if the username of the player is present.
    for member_index = 1, safehouse_members_count, 1 do

        -- If the username is found in the members list, return true.
        if safehouse_members:get(member_index - 1) == username then return true end
    end

    -- The username is not in the safehouse.
    return false;

end


------------------------------------------------------------------------------------------
-- @param {String} username -
--
-- @return {boolean} -
------------------------------------------------------------------------------------------
local playerIsOnline = function(username)
    --print(" - checking " .. tostring(username));

    -- mr crabby legs was here
    local onlinePlayers = getOnlinePlayers();

    for i = 1, onlinePlayers:size()
    do
        local onlinePlayer = onlinePlayers:get(i - 1);

        if onlinePlayer and onlinePlayer:getUsername() == username
        then
            --print(" -> player is online");

            return true;
        end
    end

    --print(" -> player is offline");

    return false;
end


------------------------------------------------------------------------------------------
--
-- @param {SafeHouse} safehouse -
-- @param {Faction} faction -
--
-- @return {Void}
------------------------------------------------------------------------------------------
local processFactionSafehouse = function(safehouse, faction, username)
	--print("processFactionSafehouse");

    -- ArrayList<String>
    local faction_members       = faction:getPlayers()  ;
    local faction_members_count = faction_members:size();

    if faction_members_count == 0 then return end

    -- Go through the members to see if the username of the player is present.
    for member_index = 1, faction_members_count, 1 do

        local member_username = faction_members:get(member_index - 1);
        local isOnline = playerIsOnline(member_username);

        if isOnline and not isInSafehouse(safehouse, member_username) then

            --print(
                --'### Adding player "'..tostring(member_username)..'" to "'
                --..tostring(safehouse:getOwner())..'"\'s safehouse for being in the same faction. '
                --..'(Faction: '..tostring(faction:getName())..')'
            --);

            safehouse:addPlayer(member_username);

        end

    end

    local leader = faction:getOwner()
    if playerIsOnline(leader) and not isInSafehouse(safehouse, leader) then
        --print(
            --'### Adding Faction leader "'..tostring(leader)..'" to "'
            --..tostring(safehouse:getOwner())..'"\'s safehouse for being in the same faction. '
            --..'(Faction: '..tostring(faction:getName())..')'
        --);

        safehouse:addPlayer(leader);
    end

    -- Only remove members who aren't in the faction if the flag is set.
    if REMOVE_NON_FACTION_MEMBERS == true then

        local safehouse_members       = safehouse:getPlayers()  ;
        local safehouse_members_count = safehouse_members:size();

        -- Go through the members to see if the username of the player is present.
        for member_index = 1, safehouse_members_count, 1 do

            local member_username = safehouse_members:get(member_index - 1);

            if member_username ~= username
                and not faction:isOwner(member_username)
                and not faction:isMember(member_username) then

                --print(
                    --'### Removing player "'..tostring(member_username)..'" from "'
                    --..tostring(safehouse:getOwner())..'"\'s safehouse for not being in the owner\'s faction. '
                    --..'(Faction: '..tostring(faction:getName())..')'
                --);

                if not getServerOptions():getBoolean("SafehouseAllowTrepass") then

                    local other_player = getPlayerFromUsername(member_username);

                    if other_player ~= nil then
                        if other_player:getX() >= safehouse:getX() - 1
                            and other_player:getX() <  safehouse:getX2() + 1
                            and other_player:getY() >= safehouse:getY()  - 1
                            and other_player:getY() <  safehouse:getY2() + 1 then
                            safehouse:kickOutOfSafehouse(other_player);
                        end
                    end
                end

                safehouse:removePlayer(member_username);

            end
        end
    end
end

------------------------------------------------------------------------------------------

local function checkFactionSafehouses()

    if not isClient() then return end

    local player = getPlayer();
    local username = player:getUsername();

    local safehouse = getSafehouse(username, true);

    if safehouse ~= nil then

        local faction = getFaction(username);

        -- print('Safehouse: '..tostring(safehouse));
        -- print('\tFaction: '..tostring(faction));

        -- If the owner is in a faction then we will check all players for the
        --   faction and place them into the safehouse.
        if faction ~= nil then
            processFactionSafehouse(safehouse, faction);

            safehouse:syncSafehouse();
            ISSafehouseUI.OnSafehousesChanged();
        end

    end
end

------------------------------------------------------------------------------------------

-- Events.SyncFaction.Add(checkFactionSafehouses);
Events.EveryHours.Add(checkFactionSafehouses);

-- checkFactionSafehouses();

