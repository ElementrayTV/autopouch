_addon.name = 'autopouch'
_addon.author = 'Elementray'
_addon.version = '1.4'
_addon.commands = {'autopouch'}

require('packets')
config = require('config')
res_items = require('resources').items

defaults = {
    threshold = 20,
    pairs = {
        {main = 'Shihei', pouch = 'Toolbag (shihe)', job = 'NIN'},
        {main = 'Silver Bullet', pouch = 'Bullet Pouch', job = 'COR'},
    }
}

settings = config.load(defaults)

function get_item_id_by_name(name)
    if not name then return nil end
    for id, item in pairs(res_items) do
        if item.name:lower() == name:lower() then
            return id
        end
    end
    return nil
end

function get_inventory_item_count_and_index(item_id)
    local inv = windower.ffxi.get_items().inventory
    if not inv then return 0, nil end

    for index, item in ipairs(inv) do
        if item and item.id == item_id then
            return item.count, index
        end
    end
    return 0, nil
end

local last_used = {}

local job_map = {
    [1] = 'WAR', [2] = 'MNK', [3] = 'WHM', [4] = 'BLM',
    [5] = 'RDM', [6] = 'THF', [7] = 'PLD', [8] = 'DRK',
    [9] = 'BST', [10] = 'BRD', [11] = 'RNG', [12] = 'SAM',
    [13] = 'NIN', [14] = 'DRG', [15] = 'SMN', [16] = 'BLU',
    [17] = 'COR', [18] = 'PUP', [19] = 'DNC', [20] = 'SCH',
    [21] = 'GEO', [22] = 'RUN',
}

windower.register_event('prerender', function()
    local now = os.clock()
    local inv = windower.ffxi.get_items().inventory
    if not inv then return end

    local player_info = windower.ffxi.get_player()
    local main_job = player_info and player_info.main_job_id and job_map[player_info.main_job_id] or 'UNKNOWN'
    local sub_job = player_info and player_info.sub_job_id and job_map[player_info.sub_job_id] or 'UNKNOWN'

    for _, pair in ipairs(settings.pairs) do
    repeat
        if pair.job and pair.job:upper() ~= main_job and pair.job:upper() ~= sub_job then
            break  -- skip this iteration (acts like continue)
        end

        local main_id = get_item_id_by_name(pair.main)
        local pouch_id = get_item_id_by_name(pair.pouch)

        if not main_id then
            windower.add_to_chat(123, '[AutoPouch] Invalid main item name: '..tostring(pair.main))
            break
        elseif not pouch_id then
            windower.add_to_chat(123, '[AutoPouch] Invalid pouch item name: '..tostring(pair.pouch))
            break
        end

        local count, _ = get_inventory_item_count_and_index(main_id)
        local _, pouch_index = get_inventory_item_count_and_index(pouch_id)

        local last = last_used[main_id] or 0
        local cooldown = 30

        if count > 0 and count < settings.threshold and pouch_index and (now - last >= cooldown) then
            local pouch_name = res_items[pouch_id].name:gsub('"', '\\"')
            windower.chat.input('/item "'..pouch_name..'" <me>')
            windower.add_to_chat(207, '[AutoPouch] Using '..res_items[pouch_id].name..' to refill '..res_items[main_id].name..'.')
            last_used[main_id] = now
        end

    until true
end

end)
