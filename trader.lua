
-- translation and mod check
local S = minetest.get_translator("wandering_traders")
local mcl = minetest.get_modpath("mcl_core") ~= nil

-- define table containing names for use and shop items for sale

mobs.human = {

	names = {
		"Ainsley", "Alex", "Aubrey", "Casey", "Dakota", "Dallas", "Francis",
		"Gaby", "Quinn", "Riley", "Zane"
	},

	items = {
		--{item for sale, price, chance of appearing in trader's inventory}
		{mcl and "mcl_core:apple 10" or "default:apple 10",
				mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2", 10},
		{mcl and "mcl_farming:bread 10" or "farming:bread 10",
				mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4", 5},
		{mcl and "mcl_core:clay 10" or "default:clay 10",
				mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2", 12},
		{mcl and "mcl_core:stonebrick 10" or "default:brick 10",
				mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4", 17},
		{mcl and "mcl_core:glass 10" or "default:glass 10",
				mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4", 17},
		{mcl and "mcl_farming:wheat_item 10" or "farming:wheat 10",
				mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2", 17},
		{mcl and "mcl_core:tree 5" or "default:tree 5",
				mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4", 20},
		{mcl and "mcl_core:stone 10" or "default:stone 10",
				mcl and "mcl_core:gold_ingot 8" or "default:gold_ingot 8", 17},
		{mcl and "mcl_core:stonebrick 10" or "default:desert_stone 10",
				mcl and "mcl_core:gold_ingot 8" or "default:gold_ingot 8", 27},
		{mcl and "mcl_core:sapling 1" or "default:sapling 1",
				mcl and "mcl_core:gold_ingot 1" or "default:gold_ingot 1", 7},
		{mcl and "mcl_core:cactus 2" or "default:cactus 2",
				mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2", 40},
		{mcl and "mcl_core:paper 2" or "default:papyrus 2",
				mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2", 40},
		{mcl and "mcl_core:iron_nugget 1" or "default:mese_crystal_fragment 1",
				mcl and "mcl_core:dirt_with_grass 10" or "default:dirt_with_grass 10", 90},
		{mcl and "mcl_copper:raw_copper 1" or "default:mese_crystal_fragment 1",
				mcl and "mcl_core:gold_ingot 5" or "default:gold_ingot 5", 90},
		--For gold
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_core:apple 10" or "default:apple 10",
			10
		},
		{
			mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4",
			mcl and "mcl_farming:bread 10" or "farming:bread 10",
			5
		},
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_core:clay 10" or "default:clay 10",
			12
		},
		{
			mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4",
			mcl and "mcl_core:stonebrick 10" or "default:brick 10",
			17
		},
		{
			mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4",
			mcl and "mcl_core:glass 10" or "default:glass 10",
			17
		},
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_farming:wheat_item 10" or "farming:wheat 10",
			17
		},
		{
			mcl and "mcl_core:gold_ingot 4" or "default:gold_ingot 4",
			mcl and "mcl_core:tree 5" or "default:tree 5",
			20
		},
		{
			mcl and "mcl_core:gold_ingot 8" or "default:gold_ingot 8",
			mcl and "mcl_core:stone 10" or "default:stone 10",
			17
		},
		{
			mcl and "mcl_core:gold_ingot 8" or "default:gold_ingot 8",
			mcl and "mcl_core:stonebrick 10" or "default:desert_stone 10",
			27
		},
		{
			mcl and "mcl_core:gold_ingot 1" or "default:gold_ingot 1",
			mcl and "mcl_core:sapling 1" or "default:sapling 1",
			7
		},
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_core:cactus 2" or "default:cactus 2",
			40
		},
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_core:paper 2" or "default:papyrus 2",
			40
		},
		{
			mcl and "mcl_core:gold_ingot 5" or "default:gold_ingot 5",
			mcl and "mcl_copper:raw_copper 1" or "default:mese_crystal_fragment 1",
			90
		},
				{
			mcl and "mcl_core:gold_ingot 15" or "default:gold_ingot 15",
			mcl and "mcl_core:obsidian 10" or "default:obsidian 10",
			50
		},
		{
			mcl and "mcl_core:gold_ingot 5" or "default:gold_ingot 5",
			mcl and "mcl_core:diamond 1" or "default:diamond 1",
			40
		},
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_tools:pick_iron 1" or "default:pick_steel 1",
			7
		},
		{
			mcl and "mcl_core:gold_ingot 2" or "default:gold_ingot 2",
			mcl and "mcl_tools:sword_iron 1" or "default:sword_steel 1",
			17
		},
		{
			mcl and "mcl_core:gold_ingot 1" or "default:gold_ingot 1",
			mcl and "mcl_tools:shovel_iron 1" or "default:shovel_steel 1",
			17
		},
	}
}

-- Trader (same as NPC but with right-click shop)

mobs:register_mob("wandering_traders:trader", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attack_monsters = true,
	attack_animals = false,
	attack_npcs = false,
	pathfinding = true,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	textures = {
		{"mobs_trader.png"}, -- by Frerin
		{"mobs_trader2.png"},
		{"mobs_trader3.png"},
		{"mobs_trader4.png"}, -- female by Astrobe
		{"mobs_npc.png"},
		{"mobs_npc2.png"}, -- female by nuttmeg20
		{"mobs_npc3.png"}, -- male by swagman181818
		{"mobs_npc4.png"}, -- female by Sapphire16
		{"mobs_npc5.png"}, -- male by Astrobe
		{"mobs_npc6.png"} -- female by Astrobe
	},
	child_texture = {
		{"mobs_npc_baby.png"} -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = mcl and "mcl_core:wood" or "default:wood", chance = 1, min = 1, max = 3},
		{name = mcl and "mcl_core:apple" or "default:apple", chance = 2, min = 1, max = 2},
		{name = mcl and "mcl_tools:axe_stone" or "default:axe_stone", chance = 5, min = 1, max = 1}
	},
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	follow = {
		mcl and "mcl_farming:bread" or "farming:bread",
		mcl and "mcl_mobitems:cooked_beef"or "group:food_meat", --"mobs:meat",
		mcl and "mcl_core:diamond" or "default:diamond"
	},
	view_range = 7,
	owner = "",
	order = "wander",
	fear_height = 3,
	animation = {
		speed_normal = 30, speed_run = 30,
		stand_start = 0, stand_end = 79,
		walk_start = 168, walk_end = 187,
		run_start = 168, run_end = 187,
		punch_start = 189, punch_end = 198 -- was 200 and 219
	},

	-- stop attacking on right-click and open shop
	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		-- stop trader from moving or attacking
		self.attack = nil
		self:set_velocity(0)
		self:set_animation("stand")

		-- owner can right-click with stick to show control formspec
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		if item:get_name() == (mcl and "mcl_core:stick" or "default:stick")
		and (self.owner == name or
		minetest.check_player_privs(clicker, {protection_bypass = true}) )then

			minetest.show_formspec(name, "wandering_traders:controls",
					wandering_traders.get_controls_formspec(name, self))

			return
		end

		-- open shop
		wandering_traders.shop_trade(self, clicker, mobs.human)
	end,
	-- show that npc is a trader once spawned
	on_spawn = function(self)
		if wandering_traders.nametag then
			self.nametag = S("Trader")

			self.object:set_properties({
				nametag = self.nametag,
				nametag_color = "#FFFFFF"
			})
		end

		return true -- return true so on_spawn is run once only
	end
})

-- spawn egg

mobs:register_egg("wandering_traders:trader", S("Trader"),
		mcl and "mcl_core_sandstone_top.png" or "default_sandstone.png", 1)

-- compatibility with older mobs mod
mobs:alias_mob("mobs:trader", "wandering_traders:trader")

wandering_traders.add_to_traders = function(index, def)
	table.insert(mobs.human[index], def)
end

--Spawn
if not mobs.custom_spawn_monster then
	mobs:spawn({
		name = "wandering_traders:trader",
		nodes = {mcl and "mcl_core:stonebrick" or "group:grass"},
		min_light = 10,
		interval = 60,
		chance = 10000,
		min_height = 0,
		max_height = 300,
		day_toggle = true
	})
end
