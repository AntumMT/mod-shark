-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
-- Converted to 'mobs_redo' mod by Jordan Irwin (AntumDeluge)
--
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice.
-- And of course you are NOT allow to pretend you have written it.
--
--! @file init.lua
--! @brief shark implementation
--! @copyright Sapier
--! @author Sapier
--! @date 2014-05-30
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------


-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.global_exists('intllib') then
	dofile(minetest.get_modpath('intllib') .. '/intllib.lua')
	if intllib.make_gettext_pair then
		-- New method using gettext.
		S = intllib.make_gettext_pair(minetest.get_current_modname())
	else
		-- Old method using text files.
		S = intllib.Getter(minetest.get_current_modname())
	end
else
	S = function ( s ) return s end
end

local version = '0.2.0'
local variant = 'mobs_redo'
local variant_version = '0.1'
local version_full = version .. '-' .. variant .. '-' .. variant_version

minetest.log('action','MOD: mob_shark loading ...')


local mobname = 'mobs:shark'
--local shark_collisionbox = {-0.75, -0.5, -0.75, 0.75, 0.5, 0.75}
local shark_collisionbox = {-0.38, -0.25, -0.38, 0.38, 0.25, 0.38}
local shark_drop = {
	{name='animalmaterials:fish_shark', chance=1, min=3, max=3},
	{name='animalmaterials:shark_tooth', chance=4, min=1, max=3},  -- FIXME: Original 'chance' value was 0.01
	{name='animalmaterials:shark_skin', chance=4, min=1, max=1},  --FIXME: Original 'chance' value was 0.01
}

mobs:register_mob(':' .. mobname, {
	type = 'monster',
	--passive = nil,
	--docile_by_day = nil,
	--attacks_monsters = nil,
	--group_attack = nil,
	owner_loyal = true,
	attack_animals = true,
	--specific_attack = nil,
	hp_min = 10,  -- CHANGED (ORIGINAL: 5)
	hp_max = 15,  -- CHANGED (ORIGINAL: 5)
	--physical = nil,
	collisionbox = shark_collisionbox,
	visual = 'mesh',
	visual_size = {x=0.5, y=0.5},  -- CHANGED (ORIGINAL: {x=1, y=1, z=1})
	mesh = 'mob_shark.b3d',
	textures = {
		{'mob_shark_shark_mesh.png'},
	},
	--gotten_texture = nil,
	--child_texture = nil,
	--gotten_mesh = nil,
	makes_footstep_sound = false,
	--follow = nil,
	view_range = 10,
	--walk_chance = nil,
	walk_velocity = 2,
	run_velocity = 3,
	--runaway = nil,
	stepheight = 0.1,
	jump = false,
	jump_height = 0,
	fly = true,
	fly_in = 'default:water_source',  -- FIXME: Should be able to swim in 'default:water_flowing' as well
	damage = 6,
	--recovery_time = nil,
	--knock_back = nil,
	--immune_to = nil,
	--blood_amount = nil,
	--blood_texture = nil,
	drops = shark_drop,
	armor = 100,
	--drawtype = nil,
	rotate = 270,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	--suffocation = nil,
	--fall_damage = nil,
	fall_speed = -9,
	--fear_height = nil,
	--on_die = nil,
	--floats = nil,
	--on_rightclick = nil,
	--pathfinding = nil,
	attack_type = 'dogfight',
	--custom_attack = nil,
	--double_melee_attack = nil,
	--on_blast = nil,
	reach = 2,
	--sounds = nil,
	animation = {
		speed_normal = 24,
		speed_run = 24,
		stand_start = 1,
		stand_end = 80,
		walk_start = 80,
		walk_end = 160,
		run_start = 80,
		run_end = 160,
	},
})


-- SPAWNING
local interval = tonumber(minetest.settings:get('mobs:shark_interval'))
local chance = tonumber(minetest.settings:get('mobs:shark_chance'))
local min_light = tonumber(minetest.settings:get('mobs:shark_min_light'))
local max_light = tonumber(minetest.settings:get('mobs:shark_max_light'))
local min_height = tonumber(minetest.settings:get('mobs:shark_min_height'))
local max_height = tonumber(minetest.settings:get('mobs:shark_max_height'))
local day_toggle = minetest.settings:get('mobs:shark_spawn_time')

if interval == nil then
	interval = 60
end
if chance == nil then
	chance = 9000
end
if min_light == nil then
	min_light = 4
end
if max_light == nil then
	max_light = 20
end
if min_height == nil then
	min_height = -30
end
if max_height == nil then
	max_height = -3
end
if day_toggle ~= nil then
	if day_toggle == 'day' then
		day_toggle = true
	elseif day_toggle == 'night' then
		day_toggle = false
	else
		day_toggle = nil
	end
end

mobs:spawn({
	name = mobname,
	nodes = {'ethereal:seaweed'},
	neighbors = {'default:water_source', 'default:water_flowing'},
	interval = interval,
	chance = chance,
	min_light = min_light,
	max_light = max_light,
	min_height = min_height,
	max_height = max_height,
	day_toggle = day_toggle,
})

mobs:register_egg(':' .. mobname, S('Shark'), 'mob_shark_shark_item.png', 0, false)


minetest.log('action','MOD: mob_shark mod version ' .. version_full .. ' loaded')
