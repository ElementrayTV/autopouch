_addon.name = 'autopouch'
_addon.author = 'Elementray'
_addon.version = '1.5'
_addon.commands = {'autopouch'}

require('packets')
config = require('config')
res_items = require('resources').items

defaults = {
    threshold = 20,
    pairs = {
        -- Ninja Tools
        {main = "Shihei", pouch = "Toolbag (shihe)", job = "NIN"},
        {main = "Jusatsu", pouch = "Toolbag (jusa)", job = "NIN"},
        {main = "Sairui-Ran", pouch = "Toolbag (sai)", job = "NIN"},
        {main = "Kaginawa", pouch = "Toolbag (kagi)", job = "NIN"},
        {main = "Kodoku", pouch = "Toolbag (kodo)", job = "NIN"},
        {main = "Mokujin", pouch = "Toolbag (moku)", job = "NIN"},
        {main = "Furusumi", pouch = "Toolbag (furu)", job = "NIN"},
        {main = "Uchitake", pouch = "Toolbag (uchi)", job = "NIN"},
        {main = "Mizu-Deppo", pouch = "Toolbag (mizu)", job = "NIN"},
        {main = "Ryuno", pouch = "Toolbag (ryuno)", job = "NIN"},
        {main = "Shikanofuda", pouch = "Toolbag (shika)", job = "NIN"},
        {main = "Chonofuda", pouch = "Toolbag (cho)", job = "NIN"},
        {main = "Inoshishinofuda", pouch = "Toolbag (ino)", job = "NIN"},
		{main = "Tsurara", pouch = "Toolbag (Tsura)", job = "NIN"},
		{main = "Kawahori-ogi", pouch = "Toolbag (Kawa)", job = "NIN"},
		{main = "Makibishi", pouch = "Toolbag (Maki)", job = "NIN"},
		{main = "Hiraishin", pouch = "Toolbag (Hira)", job = "NIN"},
		{main = "Shinobi-tabi", pouch = "Toolbag (Shino)", job = "NIN"},
		{main = "Sanjaku-tenugui", pouch = "Toolbag (Sanja)", job = "NIN"},
		{main = "Soshi", pouch = "Toolbag (Soshi)", job = "NIN"},
		{main = "Kabenro", pouch = "Toolbag (Kaben)", job = "NIN"},
		{main = "Jinko", pouch = "Toolbag (Jinko)", job = "NIN"},
		{main = "Ranka", pouch = "Toolbag (Ranka)", job = "NIN"},
				

        -- Arrows
        {main = "Stone Arrow", pouch = "Stone Quiver", job = "RNG"},
		{main = "Bone Arrow", pouch = "Bone Quiver", job = "RNG"},
		{main = "Beetle Arrow", pouch = "Beetle Quiver", job = "RNG"},
		{main = "Horn Arrow", pouch = "Horn Quiver", job = "RNG"},
		{main = "Demon Arrow", pouch = "Demon Quiver", job = "RNG"},
		{main = "Antlion Arrow", pouch = "Antlion Quiver", job = "RNG"},
        {main = "Iron Arrow", pouch = "Iron Quiver", job = "RNG"},
		{main = "Ruszor Arrow", pouch = "Ruszor Quiver", job = "RNG"},
		{main = "Gargouille Arrow", pouch = "Gargou. Quiver", job = "RNG"},
		{main = "Mantid Arrow", pouch = "Mantid Quiver", job = "RNG"},
		{main = "Tulfaire Arrow", pouch = "Tulfaire Quiver", job = "RNG"},
		{main = "Raaz Arrow", pouch = "Raaz Quiver", job = "RNG"},
		{main = "Adlivun Arrow", pouch = "Adlivun Quiver", job = "RNG"},
		{main = "Ra'Kaznar Arrow", pouch = "Ra'Kaznar Quiver", job = "RNG"},
		{main = "Eminent Arrow", pouch = "Eminent Quiver", job = "RNG"},
        {main = "Scorpion Arrow", pouch = "Scorpion Quiver", job = "RNG"},
        {main = "Sleep Arrow", pouch = "Sleep Quiver", job = "RNG"},
        {main = "Kabura Arrow", pouch = "Kabura Quiver", job = "RNG"},

        -- Bolts
        {main = "Acid Bolt", pouch = "Ac. Bolt Quiver", job = "RNG"},
        {main = "Bronze Bolt", pouch = "B. Bolt Quiver", job = "RNG"},
        {main = "Blind Bolt", pouch = "Bln. Bolt Quiver", job = "RNG"},
        {main = "Bloody Bolt", pouch = "Bld. Bolt Quiver", job = "RNG"},
        {main = "Holy Bolt", pouch = "Hol. Bolt Quiver", job = "RNG"},
		{main = "Mythril Bolt", pouch = "M. Bolt Quiver", job = "RNG"},
		{main = "Darksteel Bolt", pouch = "D. Bolt Quiver", job = "RNG"},
		{main = "Darkling Bolt", pouch = "Dkl. Bolt Quiver", job = "RNG"},
		{main = "Fusion Bolt", pouch = "Fsn. Bolt Quiver", job = "RNG"},
		{main = "Adaman Bolt", pouch = "A. Bolt Quiver", job = "RNG"},
		{main = "Midrium Bolt", pouch = "Mid. Bolt Quiver", job = "RNG"},
		{main = "Damascus Bolt", pouch = "Dm. Bolt Quiver", job = "RNG"},
		{main = "Titanium Bolt", pouch = "T. Bolt Quiver", job = "RNG"},
		{main = "Bismuth Bolt", pouch = "Bi. Bolt Quiver", job = "RNG"},
		{main = "Quelling Bolt", pouch = "Quelling B. Quiver", job = "RNG"},
		{main = "Adlivun Bolt", pouch = "Ad. Bolt Quiver", job = "RNG"},
		{main = "Gashing Bolt", pouch = "Gash. Bolt Quiver", job = "RNG"},
		{main = "Ra'Kaznar Bolt", pouch = "Ra. Bolt Quiver", job = "RNG"},
		{main = "Abrasion Bolt", pouch = "Abr. Bolt Quiver", job = "RNG"},
		{main = "Righteous Bolt", pouch = "Rig. Bolt Quiver", job = "RNG"},
		{main = "Eminent Bolt", pouch = "Em. Bolt Quiver", job = "RNG"},
        {main = "Sleep Bolt", pouch = "Slp. Bolt Quiver", job = "RNG"},
        {main = "Venom Bolt", pouch = "Vn. Bolt Quiver", job = "RNG"},

        -- Bullets
        {main = "Silver Bullet", pouch = "Silv. Bul. Pouch", job = "COR"},
        {main = "Bronze Bullet", pouch = "Brz. Bull. Pouch", job = "COR"},
		{main = "Steel Bullet", pouch = "Stl. Bull. Pouch", job = "COR"},
		{main = "Dweomer Bullet", pouch = "Dwm. Bul. Pouch", job = "COR"},
		{main = "Oberon's Bullet", pouch = "Obr. Bull. Pouch", job = "COR"},
		{main = "Drk. Adm. Bullet", pouch = "D.A. Bull. Pouch", job = "COR"},
		{main = "Orichalc. Bullet", pouch = "O. Bull. Pouch", job = "COR"},
		{main = "Adaman Bullet", pouch = "A. Bull. Pouch", job = "COR"},
		{main = "Midrium Bullet", pouch = "Mid. Bul. Pouch", job = "COR"},
		{main = "Damascus Bullet", pouch = "Dm. Bul. Pouch", job = "COR"},
		{main = "Titanium Bullet", pouch = "Ti. Bull. Pouch", job = "COR"},
		{main = "Bismuth Bullet", pouch = "Bi. Bull. Pouch", job = "COR"},
		{main = "Adlivun Bullet", pouch = "Ad. Bull. Pouch", job = "COR"},
		{main = "Decimating Bullet", pouch = "Dec. Bul. Pouch", job = "COR"},
		{main = "Ra'Kaznar Bullet", pouch = "Ra. Bul. Pouch", job = "COR"},
		{main = "Eminent Bullet", pouch = "Em. Bul. Pouch", job = "COR"},
		{main = "Spartan Bullet", pouch = "Spar. Bul. Pouch", job = "COR"},
        {main = "Corsair Bullet", pouch = "Cor. Bull. Pouch", job = "COR"},
        {main = "Iron Bullet", pouch = "Iron Bull. Pouch", job = "COR"},
		{main = "Bullet", pouch = "Bullet Pouch", job = "COR"},
        {main = "Chrono Bullet", pouch = "Chr. Bul. Pouch", job = "COR"},

        -- Cards
        {main = "Fire Card", pouch = "Fire Card Case", job = "COR"},
        {main = "Ice Card", pouch = "Ice Card Case", job = "COR"},
        {main = "Wind Card", pouch = "Wind Card Case", job = "COR"},
        {main = "Earth Card", pouch = "Earth Card Case", job = "COR"},
        {main = "Thunder Card", pouch = "Thnd. Card Case", job = "COR"},
        {main = "Water Card", pouch = "Water Card Case", job = "COR"},
        {main = "Light Card", pouch = "Light Card Case", job = "COR"},
        {main = "Dark Card", pouch = "Dark Card Case", job = "COR"},
        {main = "Trump Card", pouch = "Trump Card Case", job = "COR"},
		
		-- Shurikens
		{main = "Shuriken", pouch = "Sh. Pouch", job = "NIN"},
		{main = "Juji Shuriken", pouch = "Juji Sh. Pouch", job = "NIN"},
		{main = "Manji Shuriken", pouch = "Manji Sh. Pouch", job = "NIN"},
		{main = "Fuma Shuriken", pouch = "Fuma Sh. Pouch", job = "NIN"},
		{main = "Iga Shuriken", pouch = "Iga Sh. Pouch", job = "NIN"},
		{main = "Roppo Shuriken", pouch = "Rop. Sh. Pouch", job = "NIN"},
		{main = "Happo Shuriken", pouch = "Hap. Sh. Pouch", job = "NIN"},
		{main = "Hachiya Shuriken", pouch = "Hac. Sh. Pouch", job = "NIN"},
		{main = "Suppa Shuriken", pouch = "Sup. Sh. Pouch", job = "NIN"},
    }
}

settings = config.load(defaults, true)  -- the `true` disables automatic saving


-- Coroutine to equip and use an item
function equip_and_use_item(pouch_name, slot, main_name)
    windower.send_command('input /equip ' .. slot .. ' "' .. pouch_name .. '"')
    coroutine.sleep(1.5)
    windower.chat.input('/item "' .. pouch_name .. '" <me>')
    windower.add_to_chat(207, '[AutoPouch] Used ' .. pouch_name .. ' to refill ' .. main_name .. '.')
end

-- Determine if item must be equipped before use
function should_equip_item(item_name)
    local waist_items = {
        ["Chr. Bul. Pouch"] = "waist",
   }
    return waist_items[item_name], waist_items[item_name] ~= nil
end


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
            break
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
            local slot, needs_equip = should_equip_item(pouch_name)
            if needs_equip then
                coroutine.schedule(function() equip_and_use_item(pouch_name, slot, pair.main) end, 0)
            else
            local pouch_name = res_items[pouch_id].name:gsub('"', '\"')
            windower.chat.input('/item "'..pouch_name..'" <me>')
            windower.add_to_chat(207, '[AutoPouch] Using '..res_items[pouch_id].name..' to refill '..res_items[main_id].name..'.')
                        end
            last_used[main_id] = now
        end

    until true
end

end)
