/obj/item/ammo_magazine/hardpoint/chaingun
	name = "PARS-159 Dualcannon IFF Magazine"
	desc = "A magazine for 40/70 Boyars Chaingun filled with explosive 40mm rounds. Slightly contuses targets upon hit. Non-IFF, watch your fire."
	caliber = "40mm"
	icon_state = "chaingun_1"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/USCM/vehicles.dmi'
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/bullet/lav
	max_rounds = 100
	gun_type = /obj/item/hardpoint/primary/chaingun

/obj/item/ammo_magazine/hardpoint/chaingun/update_icon()
	if(current_rounds > 0)
		icon_state = "chaingun_1"
	else
		icon_state = "chaingun_0"
