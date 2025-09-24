/obj/item/hardpoint/secondary/towlauncher
	name = "\improper TOW Launcher"
	desc = "A secondary weapon for tanks that shoots rockets. It loads multiple rockets at once."

	icon_state = "tow_launcher"
	disp_icon = "tank"
	disp_icon_state = "towlauncher"
	activation_sounds = list('sound/machines/terminal_success.ogg')

	health = 500
	firing_arc = 60

	ammo = new /obj/item/ammo_magazine/hardpoint/towlauncher
	max_clips = 1

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/hardpoint/towlauncher,
	)

	px_offsets = list(
		"1" = list(1, 10),
		"2" = list(-1, 5),
		"4" = list(0, 0),
		"8" = list(0, 18)
	)

	muzzle_flash_pos = list(
		"1" = list(8, -1),
		"2" = list(-8, -16),
		"4" = list(5, -8),
		"8" = list(-5, 10)
	)

	use_muzzle_flash = FALSE

	scatter = 4
	fire_delay = 15.0 SECONDS

/obj/item/hardpoint/secondary/towlauncher/jeep
	icon = 'icons/obj/vehicles/hardpoints/jeep.dmi'
	icon_state = "jeep_tow"
	disp_icon = "jeep"
	disp_icon_state = "jeep_tow"

	px_offsets = list(
		"1" = list(0, 0),
		"2" = list(0, 0),
		"4" = list(0, 0),
		"8" = list(0, 0)
	)

	use_muzzle_flash = TRUE
	angle_muzzleflash = FALSE
	muzzleflash_icon_state = "muzzle_flash_backwards"

	muzzle_flash_pos = list(
		"1" = list(-12, 50),
		"2" = list(-20, -10),
		"4" = list(-35, -35),
		"8" = list(10, -32)
	)
