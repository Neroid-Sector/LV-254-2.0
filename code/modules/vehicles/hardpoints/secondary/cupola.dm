/obj/item/hardpoint/secondary/m56cupola
	name = "\improper M56 Cupola"
	desc = "A secondary weapon for tanks. It's a M56D that was adjusted to be permanently fixed to its mount. You swear you can still see some weld tacks."

	icon_state = "m56_cupola"
	disp_icon = "tank"
	disp_icon_state = "m56cupola"
	activation_sounds = list('sound/weapons/gun_smartgun1.ogg', 'sound/weapons/gun_smartgun2.ogg', 'sound/weapons/gun_smartgun3.ogg', 'sound/weapons/gun_smartgun4.ogg')

	health = 350
	firing_arc = 120

	ammo = new /obj/item/ammo_magazine/hardpoint/m56_cupola
	max_clips = 1

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/hardpoint/m56_cupola,
	)

	muzzle_flash_pos = list(
		"1" = list(8, -1),
		"2" = list(-7, -15),
		"4" = list(6, -10),
		"8" = list(-5, 7)
	)

	scatter = 2
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.4 SECONDS

/obj/item/hardpoint/secondary/m56cupola/jeep
	icon = 'icons/obj/vehicles/hardpoints/jeep.dmi'

	name = "\improper M56V Machinegun System"
	desc = "A vehicle-mounted version of the M56D, permanently fixed to its mount. You swear you can still see some weld tacks."

	icon_state = "jeep_m56"
	disp_icon = "jeep"
	disp_icon_state = "jeep_m56"
	fire_delay = 0.1 SECONDS

	px_offsets = list(
		"1" = list(0, 0),
		"2" = list(0, 0),
		"4" = list(0, 0),
		"8" = list(0, 0)
	)

	ammo = new /obj/item/ammo_magazine/hardpoint/m56_cupola/jeep
	max_clips = 1

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/hardpoint/m56_cupola,
	)

/obj/item/hardpoint/secondary/m56cupola/jeep/hmg
	name = "\improper M2CV Heavy Machinegun System"
	desc = "A vehicle-mounted version of the M2C, permanently fixed to its mount. Features a heavier barrel and stronger internals allowing serious suppressing fire."

	icon_state = "jeep_m2c"
	disp_icon = "jeep"
	disp_icon_state = "jeep_m2c"
	activation_sounds = 'sound/weapons/gun_m56d_auto.ogg'

	ammo = new /obj/item/ammo_magazine/hardpoint/m56_cupola/jeep/hmg
	max_clips = 1

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/hardpoint/m56_cupola/jeep/hmg,
	)
