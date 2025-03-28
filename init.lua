
-- translation and get mod path
local S = minetest.get_translator("wandering_traders")
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

-- Global
wandering_traders = {}
wandering_traders.nametag = minetest.settings:get_bool("wandering_traders_nametag") or false
wandering_traders.dialogs = minetest.settings:get_bool("wandering_traders_dialogs") or false
-- Check for custom mob spawn file

local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_npc = true
	input:close()
	input = nil
end

dofile(path .. "functions.lua") -- useful functions
dofile(path .. "trader.lua")

-- Load custom spawning if found

if mobs.custom_spawn_npc then
	dofile(path .. "spawn.lua")
end
