/obj/structure/pallet
	name = "wooden pallet"
	desc = "A pallet made of cheap synthwood used for storing large amounts of items. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
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
	var/type_icon = "overlay_none"
	var/initial_stored = 0
	var/heavy = FALSE
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
	check_weight()
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
				if(new_desc != desc) desc = "This pallet contains [new_desc].  <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
				to_chat(user, SPAN_NOTICE("You finish writing a list of the contents for the pallet."))
				return
	if(istype(O, /obj/item))
		if(HAS_TRAIT(O, TRAIT_TOOL_WRENCH))
			if(user.action_busy)
				return
			if(heavy == TRUE)
				to_chat(user, SPAN_NOTICE("\The [src], is too heavy to adjust."))
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
		if(pallet_label_choice == null) return
		switch(pallet_label_choice)
			if("None")
				type_icon = "overlay_none"
				to_chat(user, SPAN_NOTICE("You remove any label on the pallet."))
				update_icon()
			if("Supplies")
				type_icon = "overlay_storage"
				to_chat(user, SPAN_NOTICE("You finish stamping the <b>Supplies</b> label on the pallet."))
				update_icon()
			if("Ammo")
				type_icon = "overlay_ammo"
				to_chat(user, SPAN_NOTICE("You finish stamping the <b>Ammo</b> label on the pallet."))
				update_icon()
			if("Med")
				type_icon = "overlay_med"
				to_chat(user, SPAN_NOTICE("You finish stamping the <b>Meical</b> label on the pallet."))
				update_icon()
			if("Food")
				type_icon = "overlay_food"
				to_chat(user, SPAN_NOTICE("You finish stamping the <b>Food</b> label on the pallet."))
				update_icon()
			if("Construction")
				type_icon = "overlay_construction"
				to_chat(user, SPAN_NOTICE("You finish stamping the <b>Construction</b> label on the pallet."))
				update_icon()
		return
	if(istype(O, allowed_type) && contents.len < max_stored)
		user.drop_inv_item_to_loc(O, src)
		contents += O
		playsound(src, 'sound/effects/glassbash.ogg', 25, TRUE)
		update_icon()
		check_weight()

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
	check_weight()

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

/obj/structure/pallet/proc/check_weight()
	if(contents.len > 9)
		anchored = TRUE
		heavy = TRUE
		return
	if(contents.len < 8)
		anchored = FALSE
		heavy = FALSE
		return

/obj/structure/pallet/update_icon()
	if(contents.len)
		overlays.Cut()
		icon_state = "[initial(icon_state)]_[contents.len]"
		overlays += image(icon, type_icon)
	else
		icon_state = "[initial(icon_state)]_0"
		overlays += image(icon, type_icon)

//---Actual Pallet---\\

/obj/structure/pallet/standard
	name = "Pallet of - (Empty Boxes)"
	desc = "This pallet contains x18 empty boxes.<b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood
	initial_stored = 18

/obj/structure/pallet/standard/empty
	name = "wooden pallet"
	desc = "A pallet made of cheap synthwood used for storing large amounts of items. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	initial_stored = 0

/obj/structure/pallet/standard/med
	name = "Pallet of - (Empty Med Boxes)"
	desc = "This pallet contains x18 empty med boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/med
	type_icon = "overlay_med"

/obj/structure/pallet/standard/med/firstaid
	name = "Pallet of - (First Aid kit Boxes)"
	desc = "This pallet contains x18 med boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/med/full

/obj/structure/pallet/standard/engi
	name = "Pallet of - (Empty Engineering Boxes)"
	desc = "This pallet contains x18 empty engi boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/engi
	type_icon = "overlay_construction"

/obj/structure/pallet/standard/engi/fob
	name = "Pallet of - (FOB Mats Boxes)"
	desc = "This pallet contains x18 assorted FOB material engi boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/engi/full

/obj/structure/pallet/standard/food
	name = "Pallet of - (Empty Food Boxes)"
	desc = "This pallet contains x18 empty Food boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/food
	type_icon = "overlay_food"

/obj/structure/pallet/standard/food/groceries
	name = "Pallet of - (Asst. Food Boxes)"
	desc = "This pallet contains x18 assorted raw food boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/food/groceries

/obj/structure/pallet/standard/food/mres
	name = "Pallet of - (MRE Boxes)"
	desc = "This pallet contains x18 MRE Food boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/ammo_box/magazine/misc/mre

/obj/structure/pallet/standard/weapon
	name = "Pallet of - (Empty Weapon Boxes)"
	desc = "This pallet contains x18 empty Weapon boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/weapon
	type_icon = "overlay_ammo"

/obj/structure/pallet/standard/weapon/mk1
	name = "Pallet of - (Mk1 Pulse Rifle Boxes)"
	desc = "This pallet contains x54 Mk1 Pulse Rifles. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/wood/weapon/mk1

/obj/structure/pallet/standard/he_mortar
	name = "Pallet of - (HE Mortar Shells)"
	desc = "This pallet contains x288 HE mortar shells <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/storage/box/nade_box/mortar/he
	type_icon = "overlay_ammo"

/obj/structure/pallet/standard/ammo_mk1
	name = "Pallet of - (MK1 AP Magazine Boxes)"
	desc = "This pallet contains x18 M41A MK1 AP Magazine Boxes. <b>Use a Wrench to Unanchor Wrench to Dismantle Pen to re-lable Stamp to Mark and powerloader to move.</b>."
	fill_type = /obj/item/ammo_box/magazine/mk1/ap
	type_icon = "overlay_ammo"

