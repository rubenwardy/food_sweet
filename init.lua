-- SWEET FOOD MOD
-- A mod written by rubenwardy that adds
-- sweet food to the minetest game
-- =====================================
-- >> food_sweet/init.lua
-- Adds cakes, pies, waffles, and sweet
-- things
-- =====================================

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
	S = function ( s ) return s end
end

food.support("strawberry","farming_plus","farming_plus:strawberry_item")
food.support("strawberry","plantlib","plantlib:strawberry")
food.support("rhubarb","farming_plus","farming_plus:rhubarb_item")

food.asupport("walnut",function()
	minetest.register_craftitem("food_sweet:walnut", {
		description = S("Walnut"),
		inventory_image = "food_sweet_walnut.png",
		groups = {food_walnut = 1, food_nut = 1}
	})
	food.craft({
		output = "food_sweet:walnut 4",
		recipe = {
			{"","default:sand",""},
			{"default:sand","","default:sand"},
			{"","default:sand",""}
		}
	})
end)
food.asupport("strawberry",function()
	minetest.register_alias("food:strawberry", "food_sweet:strawberry")
	minetest.register_craftitem("food_sweet:strawberry", {
		description = S("Strawberry"),
		inventory_image = "food_strawberry.png",
		on_use = food.item_eat(2),
		groups = {food_strawberry=1}
	})
	food.craft({
		output = "food_sweet:strawberry",
		recipe = {
			{"default:apple"},
		}
	})
end)
food.asupport("blueberry",function()
	minetest.register_craftitem("food_sweet:blueberry", {
		description = S("Blueberry"),
		inventory_image = "food_sweet_blueberry.png",
		groups = {food_blueberry = 1}
	})
	food.craft({
		output = "food_sweet:blueberry 4",
		recipe = {
			{"","wool:blue",""},
			{"wool:blue","","wool:blue"},
			{"","wool:blue",""}
		}
	})
end)
food.asupport("rhubarb",function()
	minetest.register_craftitem("food_sweet:rhubarb", {
		description = S("Rhubard"),
		inventory_image = "farming_rhubarb.png",
		groups = {food_rhubarb = 1}
	})
	food.craft({
		output = "food_sweet:rhubarb 4",
		recipe = {
			{"wool:red"},
			{"wool:red"},
			{"wool:red"}
		}
	})
end)

-- Walnut and Coffee cake
food.register("food_sweet:cake_walnut_coffee",{
	description = S("Walnut and Coffee Cake"),
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3},
	walkable = false,
	sunlight_propagates = true,
	inventory_image = "food_sweet_cake_walnut_coffee_2d.png",
	tiles = {
		"food_sweet_cake_walnut_coffee_3d_top.png",
		"food_sweet_cake_walnut_coffee_3d_bottom.png",
		"food_sweet_cake_walnut_coffee_3d.png",
		"food_sweet_cake_walnut_coffee_3d.png",
		"food_sweet_cake_walnut_coffee_3d.png",
		"food_sweet_cake_walnut_coffee_3d.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.4375,-0.5,0.5,0,0.5}, --NodeBox1
			{-0.4375,-0.5,-0.4375,0.438462,-0.4375,0.426923}, --NodeBox2
			{-0.4375,0,-0.4375,0.45,0.0625,0.426923}, --NodeBox3
			{-0.3125,0.0625,0.1875,-0.1875,0.1875,0.3125}, --NodeBox4
			{0.1875,0.0625,-0.3125,0.3125,0.1875,-0.1875}, --NodeBox5
		}
	}
})
minetest.register_craftitem("food_sweet:cakemix_walnut_coffee",{
	description = S("Walnut and Coffee Cake Mix"),
	inventory_image = "food_sweet_cakemix_walnut_coffee.png"
})
food.craft({
	type = "cooking",
	output = "food_sweet:cake_walnut_coffee",
	recipe = "food_sweet:cakemix_walnut_coffee",
	cooktime = 10
})
food.craft({
	output = "food_sweet:cakemix_walnut_coffee",
	recipe = {
		{"","group:food_walnut",""},
		{"group:food_flour","group:food_sugar","group:food_egg"}
	}
})

-- Strawberry Cheese cake
minetest.register_alias("food:cake_cheese", "food_sweet:cake_cheese")
minetest.register_alias("food:cakemix_cheese", "food_sweet:cakemix_cheese")
minetest.register_craftitem("food_sweet:cake_cheese",{
	description = S("Strawberry Cheese Cake"),
	inventory_image = "food_sweet_cake_cheese.png",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3}
})
minetest.register_craftitem("food_sweet:cakemix_cheese",{
	description = S("Strawberry Cheese Cake Mix"),
	inventory_image = "food_sweet_cakemix_cheese.png"
})
food.craft({
	type = "cooking",
	output = "food_sweet:cake_cheese",
	recipe = "food_sweet:cakemix_cheese",
	cooktime = 10
})
food.craft({
	output = "food_sweet:cakemix_cheese",
	recipe = {
		{"group:food_cheese","group:food_strawberry",""},
		{"group:food_flour","group:food_sugar","group:food_egg"}
	}
})

-- Blueberry Cheese Cake
minetest.register_craftitem("food_sweet:cake_cheese_blueberry",{
	description = S("Blueberry Cheese Cake"),
	inventory_image = "food_sweet_cake_cheese_blueberry.png",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3}
})
minetest.register_craftitem("food_sweet:cakemix_cheese_blueberry",{
	description = S("Blueberry Cheese Cake Mix"),
	inventory_image = "food_sweet_cakemix_cheese_blueberry.png"
})
food.craft({
	type = "cooking",
	output = "food_sweet:cake_cheese_blueberry",
	recipe = "food_sweet:cakemix_cheese_blueberry",
	cooktime = 10
})
food.craft({
	output = "food_sweet:cakemix_cheese",
	recipe = {
		{"group:food_cheese","group:food_blueberry",""},
		{"group:food_flour","group:food_sugar","group:food_egg"}
	}
})

-- Triple chocolate cake
minetest.register_craftitem("food_sweet:cake_triple_choco",{
	description = S("Triple Chocolate Cake"),
	inventory_image = "food_sweet_cake_triple_choco.png",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3}
})
minetest.register_craftitem("food_sweet:cakemix_triple_choco",{
	description = S("Triple Chocolate Cake Mix"),
	inventory_image = "food_sweet_cakemix_triple_choco.png"
})
food.craft({
	type = "cooking",
	output = "food_sweet:cake_triple_choco",
	recipe = "food_sweet:cakemix_triple_choco",
	cooktime = 10
})
food.craft({
	output = "food_sweet:cakemix_triple_choco",
	recipe = {
		{"group:food_milk_chocolate","group:food_milk_chocolate","group:food_milk_chocolate"},
		{"group:food_flour","group:food_sugar","group:food_egg"}
	}
})

-- Wedding Cake
minetest.register_craftitem("food_sweet:cake_wedding",{
	description = S("Wedding Cake"),
	inventory_image = "food_sweet_cake_wedding.png",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3}
})

food.craft({
	output = "food_sweet:cake_wedding",
	recipe = {
		{"food:cake"},
		{"food:cake"},
		{"food:cake"}
	}
})

-- Rhubarb Crumble
minetest.register_craftitem("food_sweet:crumble_rhubarb",{
	description = S("Rhubarb Crumble"),
	inventory_image = "food_sweet_crumble_rhubarb.png",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3}
})
minetest.register_craftitem("food_sweet:crumble_rhubarb_raw",{
	description = S("Raw Rhubarb Crumble"),
	inventory_image = "food_sweet_crumble_rhubarb_raw.png"
})
food.craft({
	type = "cooking",
	output = "food_sweet:crumble_rhubarb",
	recipe = "food_sweet:crumble_rhubarb_raw",
	cooktime = 10
})
food.craft({
	output = "food_sweet:crumble_rhubarb_raw",
	recipe = {
		{"","group:food_rhubarb",""},
		{"group:food_flour","group:food_sugar","group:food_egg"}
	}
})
