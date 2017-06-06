-- SWEET FOODS
-- A mod written by rubenwardy that adds
-- sweet food to the minetest game
-- =====================================
-- >> food_sweet/init.lua
-- Adds cakes, pies, waffles, and sweet
-- things
-- =====================================

print("Sweet Foods - Version 0.2")

if not food or not food.version or food.version < 2.3 then
	error("You need to update your version of the Food mod - it is too old")
end

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function ( s ) return s end
end

food.support("strawberry", {
		"farming_plus:strawberry_item",
		"plantlib:strawberry",
		"bushes:strawberry",
		"ethereal:strawberry"
})

food.support("blueberry", "bushes:blueberry")
food.support("rhubarb", "farming_plus:rhubarb_item")
food.support("blackberry", "bushes:blackberry")
food.support("raspberry", "bushes:raspberry")

if farming and farming.mod == "redo" then
	food.support("rhubarb", "farming:rhubarb")
	food.support("blueberry", "farming:blueberries")
end

if minetest.setting_get("food_sweet_use_2d")==nil then
	minetest.setting_set("food_sweet_use_2d", "1")
end

food.module("walnut",function()
	minetest.register_craftitem("food_sweet:walnut", {
		description = S("Walnut"),
		inventory_image = "food_sweet_walnut.png",
		groups = {food_walnut = 1, food_nut = 1}
	})
	food.craft({
		output = "food_sweet:walnut 4",
		recipe = {
			{"default:sand","","default:sand"},
			{"","default:sand",""},
			{"default:sand","","default:sand"}
		}
	})
end, true)
food.module("strawberry",function()
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
end, true)
food.module("blueberry",function()
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
end, true)
food.module("rhubarb",function()
	minetest.register_craftitem("food_sweet:rhubarb", {
		description = S("Rhubard"),
		inventory_image = "farming_rhubarb.png",
		groups = {food_rhubarb = 1}
	})
	food.craft({
		output = "food_sweet:rhubarb 10",
		recipe = {
			{"wool:red"},
			{"wool:red"},
			{"wool:red"}
		}
	})
end, true)
food.module("lemon",function()
	minetest.register_craftitem("food_sweet:lemon", {
		description = S("Lemon"),
		inventory_image = "food_lemon.png",
		groups = {food_lemon = 1}
	})
	food.craft({
		output = "food_sweet:lemon 4",
		recipe = {
			{"","default:sand",""},
			{"default:sand","","default:sand"},
			{"","default:sand",""}
		}
	})
end, true)

-- Ice
food.module("ice-bowl", function()
	minetest.register_craftitem(":food:icebowl",{
		description = S("Ice-Bowl"),
		inventory_image = "food_sweet_ice_bowl.png",
		groups = {food_bowl=1, food_ice=1}
	})
	food.craft({
		output = "food:icebowl",
		recipe = {
			{"default:clay_lump","default:snow","default:clay_lump"},
			{"","default:clay_lump",""}
		}
	})
end, true)

food.module("wafer", function()
	minetest.register_craftitem(":food:wafer", {
		description = S("Wafer"),
		inventory_image = "food_sweet_ice_wafer.png",
		on_use = food.item_eat(2),
		groups = {food_wafer=1, food_ice=1}
	})
	food.craft({
		output = "food:wafer",
		recipe = {
			{"group:food_flour","group:food_sugar","group:food_flour"},
			{"","group:food_flour",""},
		}
	})
end, true)

food.module("ice_ball_chocolate",function()
	minetest.register_craftitem("food_sweet:ice_ball_chocolate", {
		description = S("Iceball Chocolate"),
		inventory_image = "food_sweet_ice_ball_chocolate.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_ball_chocolate",
		recipe = {
			{"default:snow"},
			{"group:food_milk_chocolate"}
		}
	})
end, true)

food.module("ice_ball_blueberry",function()
	minetest.register_craftitem("food_sweet:ice_ball_blueberry", {
		description = S("Iceball Blueberry"),
		inventory_image = "food_sweet_ice_ball_blueberry.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_ball_blueberry",
		recipe = {
			{"default:snow"},
			{"group:food_blueberry"}
		}
	})
end, true)

food.module("ice_ball_blackberry",function()
	minetest.register_craftitem("food_sweet:ice_ball_blackberry", {
		description = S("Iceball Blackberry"),
		inventory_image = "food_sweet_ice_ball_blackberry.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_ball_blackberry",
		recipe = {
			{"default:snow"},
			{"group:food_blackberry"}
		}
	})
end, true)

food.module("ice_ball_strawberry",function()
	minetest.register_craftitem("food_sweet:ice_ball_strawberry", {
		description = S("Iceball Strawberry"),
		inventory_image = "food_sweet_ice_ball_strawberry.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_ball_strawberry",
		recipe = {
			{"default:snow"},
			{"group:food_strawberry"}
		}
	})
end, true)

food.module("ice_ball_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_ball_vanilla", {
		description = S("Iceball Vanilla"),
		inventory_image = "food_sweet_ice_ball_vanilla.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_ball_vanilla",
		recipe = {
			{"default:snow","",""},
			{"group:food_milk","group:food_butter",""},
			{"group:food_sugar","",""}
		}
	})
end, true)

food.module("ice_ball_pistachio",function()
	minetest.register_craftitem("food_sweet:ice_ball_pistachio", {
		description = S("Iceball Pistachio"),
		inventory_image = "food_sweet_ice_ball_pistachio.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_ball_pistachio",
		recipe = {
			{"default:snow"},
			{"default:papyrus"}
		}
	})
end, true)

food.module("ice_cream_pistachio_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_cream_pistachio_vanilla", {
		description = S("Icecream Pistachio Vanilla"),
		inventory_image = "food_sweet_ice_cream_pistachio_vanilla.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cream_pistachio_vanilla",
		recipe = {
			{"default:snow","group:food_milk"},
			{"default:papyrus","group:food_butter"}
		}
	})
end, true)

food.module("ice_cream_strawberry_raspberry",function()
	minetest.register_craftitem("food_sweet:ice_cream_strawberry_raspberry", {
		description = S("Icecream Strawberry Raspberry"),
		inventory_image = "food_sweet_ice_cream_strawberry_raspberry.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cream_strawberry_raspberry",
		recipe = {
			{"default:snow","group:food_milk"},
			{"group:food_strawberry","group:food_raspberry"}
		}
	})
end, true)

food.module("ice_cream_blueberry_raspberry",function()
	minetest.register_craftitem("food_sweet:ice_cream_blueberry_raspberry", {
		description = S("Icecream Blueberry Raspberry"),
		inventory_image = "food_sweet_ice_cream_blueberry_raspberry.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cream_blueberry_raspberry",
		recipe = {
			{"default:snow","group:food_milk"},
			{"group:food_blueberry","group:food_raspberry"}
		}
	})
end, true)

food.module("ice_cream_blueberry_lemon",function()
	minetest.register_craftitem("food_sweet:ice_cream_blueberry_lemon", {
		description = S("Icecream Blueberry Lemon"),
		inventory_image = "food_sweet_ice_cream_blueberry_lemon.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cream_blueberry_lemon",
		recipe = {
			{"default:snow","group:food_milk"},
			{"group:food_blueberry","group:food_lemon"}
		}
	})
end, true)

food.module("ice_cream_blackberry_lemon",function()
	minetest.register_craftitem("food_sweet:ice_cream_blackberry_lemon", {
		description = S("Icecream Blackberry Lemon"),
		inventory_image = "food_sweet_ice_cream_blackberry_lemon.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cream_blackberry_lemon",
		recipe = {
			{"default:snow","group:food_milk"},
			{"group:food_blackberry","group:food_lemon"}
		}
	})
end, true)

food.module("ice_cream_walnut_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_cream_walnut_vanilla", {
		description = S("Icecream Walnut Vanilla"),
		inventory_image = "food_sweet_ice_cream_walnut_vanilla.png",
		on_use = food.item_eat(1),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cream_walnut_vanilla",
		recipe = {
			{"default:snow","group:food_milk"},
			{"group:food_walnut","group:food_butter"}
		}
	})
end, true)

food.module("ice_wafer_blackberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_blackberry", {
		description = S("Icewafer Blackberry"),
		inventory_image = "food_sweet_ice_wafer_blackberry.png",
		on_use = food.item_eat(2),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_blackberry",
		recipe = {
			{"food_sweet:ice_ball_blackberry"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafer_blueberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_blueberry", {
		description = S("Icewafer Blueberry"),
		inventory_image = "food_sweet_ice_wafer_blueberry.png",
		on_use = food.item_eat(2),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_blueberry",
		recipe = {
			{"food_sweet:ice_ball_blueberry"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafer_chocolate",function()
	minetest.register_craftitem("food_sweet:ice_wafer_chocolate", {
		description = S("Icewafer Chocolate"),
		inventory_image = "food_sweet_ice_wafer_chocolate.png",
		on_use = food.item_eat(2),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_chocolate",
		recipe = {
			{"food_sweet:ice_ball_chocolate"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafer_strawberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_strawberry", {
		description = S("Icewafer Strawberry"),
		inventory_image = "food_sweet_ice_wafer_strawberry.png",
		on_use = food.item_eat(2),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_strawberry",
		recipe = {
			{"food_sweet:ice_ball_strawberry"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafer_pistachio",function()
	minetest.register_craftitem("food_sweet:ice_wafer_pistachio", {
		description = S("Icewafer Pistachio"),
		inventory_image = "food_sweet_ice_wafer_pistachio.png",
		on_use = food.item_eat(2),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_pistachio",
		recipe = {
			{"food_sweet:ice_ball_pistachio"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafer_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_wafer_vanilla", {
		description = S("Icewafer Vanilla"),
		inventory_image = "food_sweet_ice_wafer_vanilla.png",
		on_use = food.item_eat(2),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_vanilla",
		recipe = {
			{"food_sweet:ice_ball_vanilla"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafer_blackberry_pistachio",function()
	minetest.register_craftitem("food_sweet:ice_wafer_blackberry_pistachio", {
		description = S("Icewafer Blackberry Pistachio"),
		inventory_image = "food_sweet_ice_wafer_blackberry_pistachio.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_blackberry_pistachio",
		recipe = {
			{"food_sweet:ice_ball_blackberry","food_sweet:ice_ball_pistachio"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_blackberry_strawberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_blackberry_strawberry", {
		description = S("Icewafer Blackberry Strawberry"),
		inventory_image = "food_sweet_ice_wafer_blackberry_strawberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_blackberry_strawberry",
		recipe = {
			{"food_sweet:ice_ball_blackberry","food_sweet:ice_ball_strawberry"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_blueberry_chocolate",function()
	minetest.register_craftitem("food_sweet:ice_wafer_blueberry_chocolate", {
		description = S("Icewafer Blueberry Chocolate"),
		inventory_image = "food_sweet_ice_wafer_blueberry_chocolate.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_blueberry_chocolate",
		recipe = {
			{"food_sweet:ice_ball_blueberry","food_sweet:ice_ball_chocolate"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_blueberry_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_wafer_blueberry_vanilla", {
		description = S("Icewafer Blueberry Vanilla"),
		inventory_image = "food_sweet_ice_wafer_blueberry_vanilla.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_blueberry_vanilla",
		recipe = {
			{"food_sweet:ice_ball_blueberry","food_sweet:ice_ball_vanilla"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_chocolate_strawberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_chocolate_strawberry", {
		description = S("Icewafer Chocolate Strawberry"),
		inventory_image = "food_sweet_ice_wafer_chocolate_strawberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_chocolate_strawberry",
		recipe = {
			{"food_sweet:ice_ball_chocolate","food_sweet:ice_ball_strawberry"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_pistachio_blackberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_pistachio_blackberry", {
		description = S("Icewafer Pistachio Blackberry"),
		inventory_image = "food_sweet_ice_wafer_pistachio_blackberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_pistachio_blackberry",
		recipe = {
			{"food_sweet:ice_ball_pistachio","food_sweet:ice_ball_blackberry"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_pistachio_blueberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_pistachio_blueberry", {
		description = S("Icewafer Pistachio Blueberry"),
		inventory_image = "food_sweet_ice_wafer_pistachio_blueberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_pistachio_blueberry",
		recipe = {
			{"food_sweet:ice_ball_pistachio","food_sweet:ice_ball_blueberry"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_strawberry_blueberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_strawberry_blueberry", {
		description = S("Icewafer Strawberry Blueberry"),
		inventory_image = "food_sweet_ice_wafer_strawberry_blueberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_strawberry_blueberry",
		recipe = {
			{"food_sweet:ice_ball_strawberry","food_sweet:ice_ball_blueberry"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_strawberry_pistachio",function()
	minetest.register_craftitem("food_sweet:ice_wafer_strawberry_pistachio", {
		description = S("Icewafer Strawberry Pistachio"),
		inventory_image = "food_sweet_ice_wafer_strawberry_pistachio.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_strawberry_pistachio",
		recipe = {
			{"food_sweet:ice_ball_strawberry","food_sweet:ice_ball_pistachio"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_strawberry_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_wafer_strawberry_vanilla", {
		description = S("Icewafer Strawberry Vanilla"),
		inventory_image = "food_sweet_ice_wafer_strawberry_vanilla.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_strawberry_vanilla",
		recipe = {
			{"food_sweet:ice_ball_strawberry","food_sweet:ice_ball_vanilla"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_vanilla_blackberry",function()
	minetest.register_craftitem("food_sweet:ice_wafer_vanilla_blackberry", {
		description = S("Icewafer Vanilla Blackberry"),
		inventory_image = "food_sweet_ice_wafer_vanilla_blackberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_vanilla_blackberry",
		recipe = {
			{"food_sweet:ice_ball_vanilla","food_sweet:ice_ball_blackberry"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafer_vanilla_pistachio",function()
	minetest.register_craftitem("food_sweet:ice_wafer_vanilla_pistachio", {
		description = S("Icewafer Vanilla Pistachio"),
		inventory_image = "food_sweet_ice_wafer_vanilla_pistachio.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafer_vanilla_pistachio",
		recipe = {
			{"food_sweet:ice_ball_vanilla","food_sweet:ice_ball_pistachio"},
			{"food:wafer",""}
		}
	})
end, true)

food.module("ice_wafercream_blackberry_lemon",function()
	minetest.register_craftitem("food_sweet:ice_wafercream_blackberry_lemon", {
		description = S("Icewafercream Blackberry Lemon"),
		inventory_image = "food_sweet_ice_wafercream_blackberry_lemon.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafercream_blackberry_lemon",
		recipe = {
			{"food_sweet:ice_cream_blackberry_lemon"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafercream_blueberry_raspberry",function()
	minetest.register_craftitem("food_sweet:ice_wafercream_blueberry_raspberry", {
		description = S("Icewafercream Blueberry Raspberry"),
		inventory_image = "food_sweet_ice_wafercream_blueberry_raspberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafercream_blueberry_raspberry",
		recipe = {
			{"food_sweet:ice_cream_blueberry_raspberry"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafercream_pistachio_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_wafercream_pistachio_vanilla", {
		description = S("Icewafercream Pistachio Vanilla"),
		inventory_image = "food_sweet_ice_wafercream_pistachio_vanilla.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafercream_pistachio_vanilla",
		recipe = {
			{"food_sweet:ice_cream_pistachio_vanilla"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafercream_strawberry_raspberry",function()
	minetest.register_craftitem("food_sweet:ice_wafercream_strawberry_raspberry", {
		description = S("Icewafercream Strawberry Raspberry"),
		inventory_image = "food_sweet_ice_wafercream_strawberry_raspberry.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafercream_strawberry_raspberry",
		recipe = {
			{"food_sweet:ice_cream_strawberry_raspberry"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafercream_walnut_vanilla",function()
	minetest.register_craftitem("food_sweet:ice_wafercream_walnut_vanilla", {
		description = S("Icewafercream Walnut Vanilla"),
		inventory_image = "food_sweet_ice_wafercream_walnut_vanilla.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafercream_walnut_vanilla",
		recipe = {
			{"food_sweet:ice_cream_walnut_vanilla"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_wafercream_blueberry_lemon",function()
	minetest.register_craftitem("food_sweet:ice_wafercream_blueberry_lemon", {
		description = S("Icewafercream Blueberry Lemon"),
		inventory_image = "food_sweet_ice_wafercream_blueberry_lemon.png",
		on_use = food.item_eat(3),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_wafercream_blueberry_lemon",
		recipe = {
			{"food_sweet:ice_cream_blueberry_lemon"},
			{"food:wafer"}
		}
	})
end, true)

food.module("ice_cup_french",function()
	minetest.register_craftitem("food_sweet:ice_cup_french", {
		description = S("Icecup French"),
		inventory_image = "food_sweet_ice_cup_french.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_french",
		recipe = {
			{"food_sweet:ice_cream_blackberry_lemon","food_sweet:ice_cream_walnut_vanilla","food_sweet:ice_cream_blueberry_raspberry"},
			{"","group:food_bowl",""}
		}
	})
end, true)

food.module("ice_cup_america",function()
	minetest.register_craftitem("food_sweet:ice_cup_america", {
		description = S("Icecup America"),
		inventory_image = "food_sweet_ice_cup_america.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_america",
		recipe = {
			{"food_sweet:ice_cream_blackberry_lemon","food_sweet:ice_cream_blueberry_raspberry","food_sweet:ice_cream_pistachio_vanilla"},
			{"","group:food_bowl",""}
		}
	})
end, true)

food.module("ice_cup_german",function()
	minetest.register_craftitem("food_sweet:ice_cup_german", {
		description = S("Icecup German"),
		inventory_image = "food_sweet_ice_cup_german.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_german",
		recipe = {
			{"food_sweet:ice_cream_walnut_vanilla","food_sweet:ice_cream_blueberry_lemon","food_sweet:ice_cream_blackberry_lemon"},
			{"","group:food_bowl",""}
		}
	})
end, true)

food.module("ice_cup_new_zealand",function()
	minetest.register_craftitem("food_sweet:ice_cup_new_zealand", {
		description = S("Icecup New Zealand"),
		inventory_image = "food_sweet_ice_cup_new_zealand.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_new_zealand",
		recipe = {
			{"food_sweet:ice_cream_pistachio_vanilla","food_sweet:ice_cream_strawberry_raspberry","food_sweet:ice_cream_blueberry_lemon"},
			{"","group:food_bowl",""}
		}
	})
end, true)

food.module("ice_cup_england",function()
	minetest.register_craftitem("food_sweet:ice_cup_england", {
		description = S("Icecup England"),
		inventory_image = "food_sweet_ice_cup_england.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_england",
		recipe = {
			{"food_sweet:ice_cream_blueberry_raspberry","food_sweet:ice_cream_blackberry_lemon","food_sweet:ice_cream_strawberry_raspberry"},
			{"","group:food_bowl",""}
		}
	})
end, true)

food.module("ice_cup_japan",function()
	minetest.register_craftitem("food_sweet:ice_cup_japan", {
		description = S("Icecup Japan"),
		inventory_image = "food_sweet_ice_cup_japan.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_japan",
		recipe = {
			{"food_sweet:ice_cream_blueberry_lemon","food_sweet:ice_cream_strawberry_raspberry","food_sweet:ice_cream_walnut_vanilla"},
			{"","group:food_bowl",""}
		}
	})
end, true)

food.module("ice_cup_zaire",function()
	minetest.register_craftitem("food_sweet:ice_cup_zaire", {
		description = S("Icecup Zaire"),
		inventory_image = "food_sweet_ice_cup_zaire.png",
		on_use = food.item_eat(4),
		groups = {food_ice = 1}
	})
	food.craft({
		output = "food_sweet:ice_cup_zaire",
		recipe = {
			{"food_sweet:ice_cream_strawberry_raspberry","food_sweet:ice_cream_pistachio_vanilla","food_sweet:ice_cream_blueberry_lemon"},
			{"","group:food_bowl",""}
		}
	})
end, true)

-- Walnut and Coffee cake
food.module("cake_walnut_coffee", function()
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
	},"sweet")
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
end)

-- Strawberry Cheese cake
food.module("cake_cheese", function()
	minetest.register_alias("food:cake_cheese", "food_sweet:cake_cheese")
	minetest.register_alias("food:cakemix_cheese", "food_sweet:cakemix_cheese")
	minetest.register_craftitem("food_sweet:cake_cheese",{
		description = S("Strawberry Cheese Cake"),
		inventory_image = "food_sweet_cake_cheese.png",
		on_use = food.item_eat(4),
		groups={food=3}
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
end)

-- Blueberry Cheese Cake
food.module("cake_cheese_blueberry", function()
	minetest.register_craftitem("food_sweet:cake_cheese_blueberry",{
		description = S("Blueberry Cheese Cake"),
		inventory_image = "food_sweet_cake_cheese_blueberry.png",
		on_use = food.item_eat(4),
		groups={food=3}
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
		output = "food_sweet:cakemix_cheese_blueberry",
		recipe = {
			{"group:food_cheese","group:food_blueberry",""},
			{"group:food_flour","group:food_sugar","group:food_egg"}
		}
	})
end)

-- Triple chocolate cake
food.module("cake_triple_choco", function()
	minetest.register_craftitem("food_sweet:cake_triple_choco",{
		description = S("Triple Chocolate Cake"),
		inventory_image = "food_sweet_cake_triple_choco.png",
		on_use = food.item_eat(4),
		groups={food=3}
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
end)

-- Wedding Cake
food.module("cake_wedding", function()
	minetest.register_craftitem("food_sweet:cake_wedding",{
		description = S("Wedding Cake"),
		inventory_image = "food_sweet_cake_wedding.png",
		on_use = food.item_eat(4),
		groups={food=3}
	})

	food.craft({
		output = "food_sweet:cake_wedding",
		recipe = {
			{"food:cake"},
			{"food:cake"},
			{"food:cake"}
		}
	})
end)

-- Rhubarb Crumble
food.module("crumble_rhubarb", function()
	minetest.register_craftitem("food_sweet:crumble_rhubarb",{
		description = S("Rhubarb Crumble"),
		inventory_image = "food_sweet_crumble_rhubarb.png",
		on_use = food.item_eat(4),
		groups={food=3}
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
end)

-- Cup cake
food.module("cupcake", function()
	minetest.register_craftitem("food_sweet:cupcake",{
		description = S("Cupcake"),
		inventory_image = "food_sweet_cupcake.png",
		on_use = food.item_eat(2),
		groups={food=1}
	})
	minetest.register_craftitem("food_sweet:cupcake_mix",{
		description = S("Cupcake Mix"),
		inventory_image = "food_sweet_cupcake_mix.png"
	})
	food.craft({
		type = "cooking",
		output = "food_sweet:cupcake",
		recipe = "food_sweet:cupcake_mix",
		cooktime = 1
	})
	food.craft({
		output = "food_sweet:cupcake_mix 6",
		recipe = {
			{"group:food_flour","","group:food_egg"},
			{"","group:food_sugar",""}
		}
	})
end)

-- Chocolate Cupcake
food.module("cupcake_choco", function()
	minetest.register_craftitem("food_sweet:cupcake_choco",{
		description = S("Chocolate Cupcake"),
		inventory_image = "food_sweet_cupcake_choco.png",
		on_use = food.item_eat(2),
		groups={food=1}
	})
	minetest.register_craftitem("food_sweet:cupcake_choco_mix",{
		description = S("Chocolate Cupcake Mix"),
		inventory_image = "food_sweet_cupcake_choco_mix.png"
	})
	food.craft({
		type = "cooking",
		output = "food_sweet:cupcake_choco",
		recipe = "food_sweet:cupcake_choco_mix",
		cooktime = 1
	})
	food.craft({
		output = "food_sweet:cupcake_choco_mix 6",
		recipe = {
			{"group:food_flour","group:food_milk_chocolate","group:food_egg"},
			{"","group:food_sugar",""}
		}
	})
end)

-- Fairy Cake
food.module("cupcake_fairy", function()
	minetest.register_craftitem("food_sweet:cupcake_fairy",{
		description = S("Fairy Cake"),
		inventory_image = "food_sweet_cupcake_fairy.png",
		on_use = food.item_eat(2),
		groups={food=1}
	})
	food.craft({
		output = "food_sweet:cupcake_fairy",
		recipe = {
			{"group:food_sugar"},
			{"food_sweet:cupcake"}
		}
	})
end)

-- Lemon Cake
food.module("cupcake_lemon", function()
	minetest.register_craftitem("food_sweet:cupcake_lemon",{
		description = S("Lemon Drizzle Cupcake"),
		inventory_image = "food_sweet_cupcake_lemon.png",
		on_use = food.item_eat(2),
		groups={food=1}
	})
	food.craft({
		output = "food_sweet:cupcake_lemon",
		recipe = {
			{"group:food_lemon"},
			{"food_sweet:cupcake"}
		}
	})
end)

-- Blueberry Muffin
food.module("muffin_blueberry", function()
	minetest.register_craftitem("food_sweet:muffin_blueberry",{
		description = S("Blueberry Muffin"),
		inventory_image = "food_sweet_muffin_blueberry.png",
		on_use = food.item_eat(2),
		groups={food=1}
	})
	minetest.register_craftitem("food_sweet:muffin_blueberry_mix",{
		description = S("Blueberry Muffin Mix"),
		inventory_image = "food_sweet_cupcake_mix.png"
	})
	food.craft({
		type = "cooking",
		output = "food_sweet:muffin_blueberry",
		recipe = "food_sweet:muffin_blueberry_mix",
		cooktime = 1
	})
	food.craft({
		output = "food_sweet:muffin_blueberry_mix 6",
		recipe = {
			{"group:food_flour","group:food_blueberry","group:food_egg"},
			{"","group:food_sugar",""}
		}
	})
end)

-- Chocolate Chip Muffin
food.module("muffin_choco", function()
	minetest.register_craftitem("food_sweet:muffin_choco",{
		description = S("Chocolate Chip Muffin"),
		inventory_image = "food_sweet_muffin_choco.png",
		on_use = food.item_eat(2),
		groups={food=1}
	})
	minetest.register_craftitem("food_sweet:muffin_choco_mix",{
		description = S("Chocolate Chip Muffin Mix"),
		inventory_image = "food_sweet_cupcake_choco_mix.png"
	})
	food.craft({
		type = "cooking",
		output = "food_sweet:muffin_choco",
		recipe = "food_sweet:muffin_choco_mix",
		cooktime = 1
	})
	food.craft({
		output = "food_sweet:muffin_choco_mix 6",
		recipe = {
			{"","group:food_milk_chocolate",""},
			{"group:food_flour","group:food_milk_chocolate","group:food_egg"},
			{"","group:food_sugar",""}
		}
	})
end)

