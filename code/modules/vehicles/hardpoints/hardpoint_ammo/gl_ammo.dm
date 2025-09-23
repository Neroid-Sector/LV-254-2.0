/obj/item/ammo_magazine/hardpoint/grenade
	name = "Grenade Launcher Magazine"
	desc = "A magazine loaded with M40 grenades. Used to reload the magazine-fed M92T or FRA9 Grenade launcher."
	caliber = "grenade"
	icon_state = "glauncher_2"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/USCM/vehicles.dmi'
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/grenade_container/grenade
	max_rounds = 20
	gun_type = /obj/item/hardpoint/secondary/grenade_launcher || /obj/item/hardpoint/secondary/grenade_launcher/jeep

/obj/item/ammo_magazine/hardpoint/grenade/update_icon()
	if(current_rounds >= max_rounds)
		icon_state = "glauncher_2"
	else if(current_rounds <= 0)
		icon_state = "glauncher_0"
	else
		icon_state = "glauncher_1"

/obj/item/ammo_magazine/hardpoint/grenade/teargas
	name = "Dispersal System Magazine (Teargas)"
	desc = "A magazine loaded with M66 Teargas grenades. Used to reload the magazine-fed R10T Dispersal System."
	caliber = "grenade"
	icon_state = "rlauncher_2"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/USCM/vehicles.dmi'
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/grenade_container/teargas
	max_rounds = 20
	gun_type = /obj/item/hardpoint/secondary/grenade_launcher/jeep/riot

/obj/item/ammo_magazine/hardpoint/grenade/teargas/update_icon()
	if(current_rounds >= max_rounds)
		icon_state = "rlauncher_2"
	else if(current_rounds <= 0)
		icon_state = "rlauncher_0"
	else
		icon_state = "rlauncher_1"

/obj/item/ammo_magazine/hardpoint/grenade/slug
	name = "Dispersal System Magazine (Baton Slugs)"
	desc = "A magazine loaded with HIRR Baton Slugs. Used to reload the magazine-fed R10T Dispersal System."
	caliber = "grenade"
	icon_state = "rlauncher_2"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/USCM/vehicles.dmi'
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/grenade_container/slug
	max_rounds = 20
	gun_type = /obj/item/hardpoint/secondary/grenade_launcher/jeep/riot

/obj/item/ammo_magazine/hardpoint/grenade/slug/update_icon()
	if(current_rounds >= max_rounds)
		icon_state = "rlauncher_2"
	else if(current_rounds <= 0)
		icon_state = "rlauncher_0"
	else
		icon_state = "rlauncher_1"
