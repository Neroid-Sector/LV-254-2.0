/obj/vehicle/multitile/van/jeep
	name = "M48 Utility Vehicle"
	desc = "An Armat designed light utility vehicle based around providing more protection and upgradeability compared to older jeeps."

	layer = ABOVE_XENO_LAYER
	vehicle_flags = VEHICLE_CLASS_LIGHT
	vehicle_pen_armor = VEHICLE_ARMOR_HEAVY

	icon = 'icons/obj/vehicles/jeep.dmi'
	icon_state = "jeep"
	pixel_x = -16
	pixel_y = -16

	bound_width = 64
	bound_height = 64

	bound_x = 0
	bound_y = 0

	interior_map = /datum/map_template/interior/jeep
	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0),
		"left_rear" = list(2, 1),
		"right_rear" = list(-1, 1),
		"rear" = list(0, 2)
	)

	movement_sound = 'sound/vehicles/jeep_driving.mp3'
	honk_sound = 'sound/vehicles/honk_4_light.ogg'
	passengers_slots = 6
	xenos_slots = 4

	misc_multipliers = list(
		"move" = 0.75, // fucking annoying how this is the only way to modify speed
		"accuracy" = 1,
		"cooldown" = 1
	)

	luminosity = 5

	health = 500

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/jeep,
		/obj/item/hardpoint/holder/jeep_turret
	)

// Flatbed Version
/obj/vehicle/multitile/van/jeep/flatbed
	desc = "An Armat designed light utility vehicle based around providing more protection and upgradeability compared to older jeeps, this one is configured with a flatbed to store pallets."
	icon_state = "jeep_bed"
	interior_map = /datum/map_template/interior/jeep_bed

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/jeep,
		/obj/item/hardpoint/holder/jeep_turret
	)

// Medical Version
/obj/vehicle/multitile/van/jeep/medical
	desc = "An Armat designed light utility vehicle based around providing more protection and upgradeability compared to older jeeps, this one has been retrofitted into an ambulance."
	icon_state = "jeep_med"
	interior_map = /datum/map_template/interior/jeep_med

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/jeep
	)

// Command Version
/obj/vehicle/multitile/van/jeep/command
	desc = "An Armat designed light utility vehicle based around providing more protection and upgradeability compared to older jeeps, this one is configured with a sensor tower instead of a hardpoint."

	icon_state = "jeep_cmd"
	interior_map = /datum/map_template/interior/jeep_cmd

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/jeep
	)

// Police Version
/obj/vehicle/multitile/van/jeep/police
	desc = "An Armat designed light utility vehicle based around providing more protection and upgradeability compared to older jeeps, this one is used by military police units."

	icon_state = "jeep_mp"
	interior_map = /datum/map_template/interior/jeep_mp

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/jeep,
		/obj/item/hardpoint/holder/jeep_turret
	)

/*
** PRESETS SPAWNERS
*/
