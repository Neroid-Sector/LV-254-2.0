/obj/structure/pallet
	name = "wooden pallet"
	desc = "A pallet made of cheap synthwood used for storing large amounts of items."
	icon = 'icons/obj/structures/crates.dmi'
	icon_state = "pallet"
	density = TRUE
	anchored = FALSE
	var/allowed_type
	var/fill_type
	var/max_stored = 18
	var/initial_stored = 0
	var/parts_type = /obj/item/stack/sheet/wood
	var/unpacking_sound = 'sound/effects/woodhit.ogg'

/obj/structure/pallet/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_OVER|PASS_AROUND

/obj/structure/pallet/Initialize()
	. = ..()
	if(!allowed_type)
		icon_state = "pallet_0"
		return

	if(initial_stored)
		var/i = 0
		while(i < initial_stored)
			contents += new fill_type(src)
			i++
	update_icon()

/obj/structure/pallet/attackby(obj/item/O, mob/user)
	if(istype(O, allowed_type) && contents.len < max_stored)
		user.drop_inv_item_to_loc(O, src)
		contents += O
		playsound(src, 'sound/effects/glassbash.ogg', 25, TRUE)
		update_icon()

/obj/structure/pallet/attack_hand(mob/living/user)
	if(!contents.len)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return

	var/obj/stored_obj = contents[contents.len]
	contents -= stored_obj
	user.put_in_hands(stored_obj)
	to_chat(user, SPAN_NOTICE("You grab a [stored_obj] from [src]."))
	playsound(src, "gun_rustle", 25, TRUE)
	update_icon()

/obj/structure/pallet/proc/unpack()
	var/turf/current_turf = get_turf(src) // Get the turf the crate is on

	playsound(src, unpacking_sound, 35)

	// Move the contents back to the turf
	for(var/atom/movable/moving_atom as anything in contents)
		moving_atom.forceMove(current_turf)

	if(parts_type) // Create the crate material
		new parts_type(current_turf, 3)

	deconstruct(TRUE)

/obj/structure/pallet/deconstruct(disassembled = TRUE)
	if(!disassembled)
		new parts_type(loc)
	return ..()

/obj/structure/pallet/ex_act(power)
	if(power >= EXPLOSION_THRESHOLD_VLOW)
		unpack()

/obj/structure/pallet/proc/take_damage(damage)
	health -= damage
	if(health <= 0)
		unpack()

/obj/structure/pallet/update_icon()
	if(contents.len)
		icon_state = "[initial(icon_state)]_[contents.len]"
	else
		icon_state = "[initial(icon_state)]_0"

/obj/structure/pallet/standard
	allowed_type = /obj/item
	fill_type = /obj/item/storage/box
	initial_stored = 18

/obj/structure/pallet/standard/empty
	initial_stored = 0

