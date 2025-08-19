/datum/equipment_preset/other/pinkerton
	name = "pinkerton"
	faction = FACTION_PINKERTON
	faction_group = list(FACTION_PINKERTON, FACTION_MARINE)
	rank = JOB_PKT
	idtype = /obj/item/card/id/pkt
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
	minimap_background = "background_cmb"

/datum/equipment_preset/other/pinkerton/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/other/pinkerton/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_colonist)] [pick(GLOB.last_names_colonist)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		random_name = "[pick(GLOB.first_names_female_colonist)] [pick(GLOB.last_names_colonist)]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

//*****************************************************************************************************/

/datum/equipment_preset/other/pinkerton/standard
	name = "pinkerton (Standard)"
	assignment = JOB_PKT
	rank = JOB_PKT
	paygrades = list(PAY_SHORT_PKT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Pkt"
	skills = /datum/skills/cmb
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/standard/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/large, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/attachments(new_human), WEAR_IN_BACK)
