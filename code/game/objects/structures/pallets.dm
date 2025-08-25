/obj/structure/pallet
	name = "wooden pallet"
	desc = "A pallet made of cheap synthwood used for storing large amounts of items."
	icon = 'icons/obj/structures/crates.dmi'
	icon_state = "pallet"
	density = TRUE
	anchored = FALSE
	climbable = TRUE
	climb_delay = CLIMB_DELAY_SHORT
	throwpass = 1
	projectile_coverage = PROJECTILE_COVERAGE_NONE
	var/allowed_type = /obj/item
	var/fill_type = /obj/item/storage/box
	var/max_stored = 18
	var/initial_stored = 0
	var/parts_type = /obj/item/stack/sheet/wood
	var/unpacking_sound = 'sound/effects/woodhit.ogg'

//Label pallet
	var/list/labels = list(
		"None",
		"Supplies",
		"Ammo",
		"Medical",
		"Food",
		"Construction",
	)

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

/obj/structure/pallet/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_OVER|PASS_AROUND

/obj/structure/pallet/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/tool/pen))
		var/pallet_action_choice = tgui_input_list(user,"Label this pallet","Pallet Info",list("Change Manifest","Change Name"))

		if(pallet_action_choice == null) return
		switch(pallet_action_choice)
			if("Change Name")
				var/new_name = tgui_input_text(user,"Enter New Label","Pallet")
				if(new_name== null) return
				if(new_name != name) name = "Pallet of - ([new_name])"
				to_chat(user, SPAN_NOTICE("You finish writing the label [new_name] on the pallet."))
				return
			if("Change Manifest")
				var/new_desc = tgui_input_text(user,"Enter New Content Manifest","Pallet")
				if(new_desc == null) return
				if(new_desc != desc) desc = "This pallet contains [new_desc]."
				to_chat(user, SPAN_NOTICE("You finish writing a list of the contents for the pallet."))
				return
	if(istype(O, /obj/item))
		if(HAS_TRAIT(O, TRAIT_TOOL_WRENCH))
			if(user.action_busy)
				return
			else
				playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
				anchored = !anchored
				to_chat(user, SPAN_NOTICE("You [anchored ? "wrench" : "unwrench"] \the [src]."))
				return
	if(istype(O, /obj/item))
		if(HAS_TRAIT(O, TRAIT_TOOL_CROWBAR))
			if(user.action_busy)
				return
			else
				playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
				to_chat(user, SPAN_NOTICE("You dismantle \the [src]."))
				unpack()
			return
	if(istype(O, /obj/item/powerloader_clamp))
		return
	if(istype(O, /obj/item/tool/stamp))
		var/pallet_label_choice= tgui_input_list(user, "Which supply label", "Supply Type", labels)
		//Change Overlay Icon?
		to_chat(user, SPAN_NOTICE("You finish stamping the (WIP) label on the pallet."))
		return
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
		new parts_type(current_turf, 2)

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

//---Actual Pallet---\\

/obj/structure/pallet/standard
	name = "Pallet of - (Empty Boxes)"
	desc = "This pallet contains empty boxes."
	fill_type = /obj/item/storage/box
	initial_stored = 18

/obj/structure/pallet/standard/he_mortar
	name = "Pallet of - (HE Mortar Shells)"
	desc = "This pallet contains HE mortar shells"
	fill_type = /obj/item/storage/box/nade_box/mortar/he
	initial_stored = 18

/obj/structure/pallet/standard/empty
	name = "wooden pallet"
	desc = "A pallet made of cheap synthwood used for storing large amounts of items."
	initial_stored = 0

