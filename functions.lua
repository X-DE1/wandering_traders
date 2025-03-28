
-- translation and mod check

local S = minetest.get_translator("wandering_traders")
local mcl = minetest.get_modpath("mcl_core") ~= nil

-- check for simple_dialogs mod and setup

local context = {}

minetest.register_on_leaveplayer(function(player)
	context[player:get_player_name()] = nil
end)

-- Kilarin's formspec functions

function wandering_traders.get_controls_formspec(name, self)

	self.id = set_npc_id(self) -- make sure id is set

	local currentordermode = self.order
	local npcId = self.id
	local orderArray = {"wander", "stand", "follow"}
	local currentorderidx = 1

	for i = 1, 3 do  --this seems like a clumsy way to do this
		if orderArray[i] == currentordermode then
			currentorderidx = i
			break
		end
	end

	-- Make npc controls formspec
	local text = "NPC Controls"
	local size = "size[3.85,2.8]"
	local formspec = {
		size,
		"label[0.375,0.5;", minetest.formspec_escape(text), "]",
		"dropdown[0.375,1.25; 3,0.6;ordermode;wander,stand,follow;", currentorderidx, "]",
		"button[0.375,2;3,0.8;exit;Exit]"
	}

	table.concat(formspec, "")

	--store npc id in local context so we can use it when the form is returned
	context[name] = npcId

	return table.concat(formspec, "")
end

-- receive and do orders given through form

minetest.register_on_player_receive_fields(function(player, formname, fields)

	local pname = player:get_player_name()

	if formname ~= "wandering_traders:controls" then

		if context[pname] then context[pname] = nil end

		return
	end

	local npcId = context[pname] or nil --get the npc id from local context
	local npcself = get_npcself_from_id(npcId)

	if npcself ~= nil then

		if fields["exit"] then

			minetest.close_formspec(pname, "wandering_traders:controls")

		elseif fields["ordermode"] then

			local pname = player:get_player_name()

			npcself.order = fields["ordermode"]

			if npcself.order == "wander" then

--				minetest.chat_send_player(pname, S("NPC will wander."))

			elseif npcself.order == "stand" then

				npcself.state = "stand"
				npcself.attack = nil
				npcself:set_animation("stand")
				npcself:set_velocity(0)

--				minetest.chat_send_player(pname, S("NPC stands still."))

			elseif npcself.order == "follow" then
--				minetest.chat_send_player(pname, S("NPC will follow you."))
			end
		end
	end
end)

-- check if npc has id set otherwise create one

function set_npc_id(npcself)

	if not npcself.id then
		npcself.id = (math.random(1, 1000) * math.random(1, 10000))
			.. npcself.name .. (math.random(1, 1000) ^ 2)
	end

	return npcself.id
end

--this function finds an npcself in the luaentities list given an npcId

function get_npcself_from_id(npcId)

	if npcId == nil then return nil end

	for k, v in pairs(minetest.luaentities) do

		if v.object and v.id and v.id == npcId then
			return v
		end
	end
end

--This code comes almost exclusively from the trader and inventory of mobf, by Sapier.
--The copyright notice below is from mobf:
-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
--
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice.
-- And of course you are NOT allow to pretend you have written it.
--
--! @file inventory.lua
--! @brief component containing mob inventory related functions
--! @copyright Sapier
--! @author Sapier
--! @date 2013-01-02
--
--! @defgroup Inventory Inventory subcomponent
--! @brief Component handling mob inventory
--! @ingroup framework_int
--! @{
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

-- This code has been heavily modified by isaiah658.
-- Trades are saved in entity metadata so they always stay the same after
-- initially being chosen.  Also the formspec uses item image buttons instead of
-- inventory slots.

local function add_goods(self, race)

	local trade_index = 1
	local trades_already_added = {}
	local trader_pool_size = 10
	local item_pool_size = #race.items -- get number of items on list

	self.trades = {}

	if item_pool_size < trader_pool_size then
		trader_pool_size = item_pool_size
	end

	for i = 1, trader_pool_size do

		-- If there are more trades than the amount being added, they are
		-- randomly selected.  If they are equal, there is no reason to randomly
		-- select them
		local random_trade = nil

		if item_pool_size == trader_pool_size then
			random_trade = i
		else
			while random_trade == nil do

				local num = math.random(item_pool_size)

				if trades_already_added[num] == nil then
					trades_already_added[num] = true
					random_trade = num
				end
			end
		end

		if math.random(0, 100) > race.items[random_trade][3] then

			self.trades[trade_index] = {
				race.items[random_trade][1],
				race.items[random_trade][2]
			}

			trade_index = trade_index + 1
		end
	end
end


function wandering_traders.shop_trade(self, clicker, race)

	self.id = set_npc_id(self) -- make sure id is set

	if not self.game_name then

		self.game_name = tostring(race.names[math.random(1, #race.names)])
		
		if wandering_traders.nametag then
			self.nametag = S("Trader @1", self.game_name)

			self.object:set_properties({
				nametag = self.nametag,
				nametag_color = "#00FF00"
			})
		end
	end

	if self.trades == nil then
		add_goods(self, race)
	end

	local player = clicker:get_player_name() or ""
	
	if wandering_traders.dialogs then
		minetest.chat_send_player(player,
		S("[NPC] <Trader @1> Hello, @2, have a look at my wares.",
		self.game_name, player))
	end

	-- Make formspec trade list
	local formspec_trade_list = ""
	local x, y

	for i = 1, 10 do

		if self.trades[i] and self.trades[i] ~= "" then

			if i < 6 then
				x = mcl and 1 or 0.5
				y = i - 0.5
			else
				x = mcl and 5 or 4.5
				y = i - 5.5
			end

			formspec_trade_list = formspec_trade_list
			.. "item_image_button[".. x ..",".. y ..";1,1;"
				.. self.trades[i][2] .. ";prices#".. i .."#".. self.id ..";]"
			.. "item_image_button[".. x + 2 ..",".. y ..";1,1;"
				.. self.trades[i][1] .. ";goods#".. i .."#".. self.id ..";]"
			.. "image[".. x + 1 ..",".. y ..";1,1;gui_arrow_blank.png]"
		end
	end

	local bg = mcl and mcl_vars.gui_bg_img or default.gui_bg_img or ""
	local sl = mcl and mcl_vars.gui_slots or default.gui_slots or ""
	local lc = mcl and "listcolors[#9d9d9d;#FFF7;#474747]" or ""

	minetest.show_formspec(player, "wandering_traders:trade", "size[" .. (mcl and 9 or 8) .. ",10]"
		.. bg
		.. sl
		.. "label[0.5,-0.1;" .. S("Trader @1's stock:", self.game_name) .. "]"
		.. formspec_trade_list
		.. lc
		.. "list[current_player;main;0,6;" .. (mcl and 9 or 8) .. ",4;]"
	)
end


minetest.register_on_player_receive_fields(function(player, formname, fields)

	if formname ~= "wandering_traders:trade" then return end

	if fields then

		local trade = ""

		for k, v in pairs(fields) do
			trade = tostring(k)
		end

		local id = trade:split("#")[3]
		local self = nil

		if id ~= nil then

			for k, v in pairs(minetest.luaentities) do

				if v.object and v.id and v.id == id then
					self = v
					break
				end
			end
		end

		if self ~= nil then

			local trade_number = tonumber(trade:split("#")[2])

			if trade_number ~= nil and self.trades[trade_number] ~= nil then

				local price = self.trades[trade_number][2]
				local goods = self.trades[trade_number][1]
				local inv = player:get_inventory()

				if inv:contains_item("main", price) then

					inv:remove_item("main", price)

					local leftover = inv:add_item("main", goods)

					if leftover:get_count() > 0 then

						-- drop item(s) in front of player
						local droppos = player:get_pos()
						local dir = player:get_look_dir()

						droppos.x = droppos.x + dir.x
						droppos.z = droppos.z + dir.z

						minetest.add_item(droppos, leftover)
					end
				end
			end
		end
	end
end)
