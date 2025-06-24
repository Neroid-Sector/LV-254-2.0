/obj/item/clothing/suit/storage/marine/boomvest
	name = "tactical explosive vest"
	desc = "Obviously someone just strapped a bomb to a marine harness and called it tactical. The light has been removed, and its switch used as the detonator.<br><span class='notice'>Control-Click to set a warcry.</span> <span class='warning'>This harness has no light, toggling it will detonate the vest! Riot shields prevent detonation of the tactical explosive vest!!</span>"
	icon_state = "boom_vest"
	armor_melee = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	slowdown = 0
	flags_atom = NO_GAMEMODE_SKIN|NO_NAME_OVERRIDE
	actions_types = list(/datum/action/item_action/toggle/suit_toggle/boom)
	///Warcry to yell upon detonation
	var/bomb_message
	///Time it takes to detonate
	var/detonate_time = 2 SECONDS

/obj/item/clothing/suit/storage/marine/boomvest/equipped(mob/user, slot)
	. = ..()
	RegisterSignal(user,)

/obj/item/clothing/suit/storage/marine/boomvest/unequipped(mob/unequipper, slot)
	. = ..()
	UnregisterSignal(unequipper, )

///Overwrites the parent function for activating a light. Instead it now detonates the bomb.
/obj/item/clothing/suit/storage/marine/boomvest/attack_self(mob/user)
	var/mob/living/carbon/human/activator = user
	if(issynth(activator) && !CONFIG_GET(flag/allow_synthetic_gun_use))
		balloon_alert(user, "Can't wear this")
		return TRUE
	if(user.alpha != 255)
		balloon_alert(user, "Can't, your cloak prevents you")
		return TRUE
	if(activator.wear_suit != src)
		balloon_alert(user, "Can only be detonated while worn")
		return FALSE
	if(LAZYACCESS(user.do_actions, src))
		return
	if(bomb_message)
		activator.say("[bomb_message]!!")
	if(!do_after(user, detonate_time, IGNORE_USER_LOC_CHANGE, src, BUSY_ICON_DANGER))
		return FALSE
	var/turf/target = get_turf(loc)
	if(bomb_message) //Checks for a non null bomb message.
		message_admins("[activator] has detonated an explosive vest with the warcry \"[bomb_message]\" at [ADMIN_VERBOSEJMP(target)]") //Incase disputes show up about marines killing themselves and others.
		log_game("[activator] has detonated an explosive vest with the warcry \"[bomb_message]\" at [AREACOORD(target)]")
	else
		message_admins("[activator] has detonated an explosive vest with no warcry at [ADMIN_VERBOSEJMP(target)]")
		log_game("[activator] has detonated an explosive vest with no warcry at [AREACOORD(target)]")

	activator.record_tactical_unalive()

	for(var/datum/limb/appendage AS in activator.limbs) //Oops we blew all our limbs off
		if(istype(appendage, /datum/limb/chest) || istype(appendage, /datum/limb/groin) || istype(appendage, /datum/limb/head))
			continue
		appendage.droplimb()
	explosion(target, 2, 2, 6, 7, 5, 5, explosion_cause=activator)
	qdel(src)

/obj/item/clothing/suit/storage/marine/boomvest/attack_hand_alternate(mob/living/user)
	. = ..()
	var/new_bomb_message = stripped_input(user, "Select Warcry", "Warcry", null, 50)
	bomb_message = new_bomb_message
	to_chat(user, SPAN_INFO("Warcry set to: \"[bomb_message]\"."))

//admin only
/obj/item/clothing/suit/storage/marine/boomvest/ob_vest
	name = "orbital bombardment vest"
	desc = "This is your lieutenant speaking, I know exactly what those coordinates are for."
	detonate_time = 1 SECONDS

/obj/item/clothing/suit/storage/marine/boomvest/ob_vest/attack_self(mob/user)
	var/mob/living/carbon/human/activator = user
	if(activator.wear_suit != src)
		balloon_alert(user, "Can only be detonated while worn")
		return FALSE
	if(LAZYACCESS(user.do_actions, src))
		return
	if(!do_after(user, detonate_time, IGNORE_USER_LOC_CHANGE, src, BUSY_ICON_DANGER))
		return FALSE
	var/turf/target = get_turf(loc)
	activator.say("I'M FIRING IT AS AN OB!!")
	message_admins("[activator] has detonated an Orbital Bombardment vest at [ADMIN_VERBOSEJMP(target)]")
	log_game("[activator] has detonated an Orbital Bombardment vest at [AREACOORD(target)]")

	for(var/datum/limb/appendage AS in activator.limbs) //Oops we blew all our limbs off
		if(istype(appendage, /datum/limb/chest) || istype(appendage, /datum/limb/groin) || istype(appendage, /datum/limb/head))
			continue
		appendage.droplimb()
	explosion(target, 15, 0, 0, 0, 15, 15, explosion_cause=activator)
	qdel(src)

/obj/item/clothing/suit/storage/marine/boomvest/fast
	detonate_time = 0.5 SECONDS
