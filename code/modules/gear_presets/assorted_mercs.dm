/datum/equipment_preset/other/merc
	name = "merc"
	faction = FACTION_FREELANCER
	rank = JOB_MAINT_TECH
	idtype = /obj/item/card/id/centcom
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
	minimap_background = "background_cmb"

/datum/equipment_preset/other/merc/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/other/merc/load_name(mob/living/carbon/human/new_human, randomise)
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

//----------------------lasalle----------------------\\


//-----standard

/datum/equipment_preset/other/merc/lasalle
	name = "Lasalle Bio Merc(Standard)"
	assignment = JOB_LBM
	rank = JOB_LBM
	paygrades = list(PAY_SHORT_FL_S = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Merc"
	skills = /datum/skills/freelancer
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/merc/lasalle/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/lasallle, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/biomerc_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/biomerc, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/commando/cbrn/biomerc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/biomerc, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/biomerc_patch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/biomerc, WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/fp9000/pmc, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)

//-----tl

/datum/equipment_preset/other/merc/lasalle/tl
	name = "Lasalle Bio Merc(Team Lead)"
	assignment = JOB_LBM_TL
	rank = JOB_LBM_TL
	paygrades = list(PAY_SHORT_FL_WL = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Ldr."
	skills = /datum/skills/freelancer/SL
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/merc/lasalle/tl/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/lasallle, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/biomerc_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/biomerc, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/commando/cbrn/biomerc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/biomerc, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/biomerc_patch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/biomerc/ldr, WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/fp9000/pmc, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)


//----------------------lasalle----------------------\\


//-----standard

/datum/equipment_preset/other/merc/trauma
	name = "Trauma team merc(Standard)"
	assignment = JOB_LBM
	rank = JOB_LBM
	paygrades = list(PAY_SHORT_FL_S = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Merc"
	skills = /datum/skills/freelancer
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/merc/trauma/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/trauma_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/trauma, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/equipped(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/odst/trauma_team, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/odst/trauma_team/alt, WEAR_JACKET)

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/odst/trauma_team, WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/odst/trauma_team/alt, WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/fp9000/pmc, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_BELT)
