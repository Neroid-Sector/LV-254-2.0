// APC cannons
/obj/item/hardpoint/primary/chaingun
	name = "\improper PARS 40/70 Boyars Chaingun"
	desc = "A devastating automatic chain-driven cannon for the LAV that shoots 40mm rounds, not IFF-Friendly, ouch."
	icon = 'icons/obj/vehicles/hardpoints/lav.dmi'

	icon_state = "chaingun"
	disp_icon = "lav_turret"
	disp_icon_state = "lav_turret_0"
	activation_sounds = list('sound/weapons/vehicles/autocannon_fire.ogg')

	damage_multiplier = 0.15

	health = 500
	firing_arc = 90

	origins = list(0, 1)

	ammo = new /obj/item/ammo_magazine/hardpoint/chaingun

	max_clips = 0

	use_muzzle_flash = TRUE
	angle_muzzleflash = FALSE
	muzzleflash_icon_state = "muzzle_flash"

	muzzle_flash_pos = list(
		"1" = list(11, -29),
		"2" = list(-11, 10),
		"4" = list(-14, 9),
		"8" = list(14, 9)
	)

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.6 SECONDS
