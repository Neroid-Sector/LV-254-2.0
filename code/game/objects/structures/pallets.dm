/obj/structure/pallet
	name = "wooden pallet"
	desc = "A pallet made of cheap synthwood used for storing large amounts of items."
	icon = 'icons/obj/structures/crates.dmi'
	icon_state = "pallet"
	density = TRUE
	anchored = FALSE
	var/allowed_type
	var/populate_type
	var/max_stored = 18
	var/initial_stored = 0

/obj/structure/pallet/Initialize()
	. = ..()
	if(!allowed_type)
		icon_state = "pallet_0"
		return

	if(initial_stored)
		var/i = 0
		while(i < initial_stored)
			contents += new populate_type(src)
			i++
	update_icon()

/obj/structure/pallet/attackby(obj/item/O, mob/user)
	if(istype(O, allowed_type) && contents.len < max_stored)
		user.drop_inv_item_to_loc(O, src)
		contents += O
		update_icon()

/obj/structure/pallet/attack_hand(mob/living/user)
	if(!contents.len)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return

	var/obj/stored_obj = contents[contents.len]
	contents -= stored_obj
	user.put_in_hands(stored_obj)
	to_chat(user, SPAN_NOTICE("You grab [stored_obj] from [src]."))
	playsound(src, "gunequip", 25, TRUE)
	update_icon()

/obj/structure/pallet/update_icon()
	if(contents.len)
		icon_state = "[initial(icon_state)]_[contents.len]"
	else
		icon_state = "[initial(icon_state)]_0"

/obj/structure/pallet/standard
	allowed_type = /obj/item
	populate_type = /obj/item/storage/box
	initial_stored = 18

/obj/structure/pallet/standard/empty
	initial_stored = 0

