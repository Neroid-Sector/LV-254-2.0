/datum/equipment_preset/colonist/civilian
	name = "civi"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_COLONIST
	rank = CIVILIAN_SURVIVOR
	faction = FACTION_COLONIST
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/civilian

/datum/equipment_preset/colonist/civilian/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/colonist/civilian/proc/spawn_random_civi_clothes(mob/living/carbon/human/new_human)
	var/i = rand(1,17)
	switch(i)
		if (1 , 6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist(new_human), WEAR_BODY)
		if (7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear(new_human), WEAR_BODY)
		if (8)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/khaki(new_human), WEAR_BODY)
		if (9)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/pink(new_human), WEAR_BODY)
		if (10)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/blue(new_human), WEAR_BODY)
		if (11)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/green(new_human), WEAR_BODY)
		if (12)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/charcoal(new_human), WEAR_BODY)
		if (13)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/utility(new_human), WEAR_BODY)
		if (14)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/yellow(new_human), WEAR_BODY)
		if (15)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/blue(new_human), WEAR_BODY)
		if (16)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/gray(new_human), WEAR_BODY)
		if (17)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/brown(new_human), WEAR_BODY)

/datum/equipment_preset/colonist/som/proc/spawn_som_rifle(mob/living/carbon/human/new_human)
	var/i = rand(1,10)
	switch(i)
		if (1 , 5)
			spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)
		if (5 , 6)
			spawn_weapon(/obj/item/weapon/gun/rifle/mar40, /obj/item/ammo_magazine/rifle/mar40/ap, new_human)
		if (7 , 8)
			spawn_weapon(/obj/item/weapon/gun/rifle/ak4047/som, /obj/item/ammo_magazine/rifle/ak4047, new_human)
		if (9 , 10)
			spawn_weapon(/obj/item/weapon/gun/rifle/kramer, /obj/item/ammo_magazine/rifle/kramer, new_human)

/datum/equipment_preset/colonist/som/proc/spawn_som_hat(mob/living/carbon/human/new_human)
	var/i = rand(1,10)
	switch(i)
		if (1 , 5)
			spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)
		if (5 , 6)
			spawn_weapon(/obj/item/weapon/gun/rifle/mar40, /obj/item/ammo_magazine/rifle/mar40/ap, new_human)
		if (7 , 8)
			spawn_weapon(/obj/item/weapon/gun/rifle/ak4047/som, /obj/item/ammo_magazine/rifle/ak4047, new_human)
		if (9 , 10)
			spawn_weapon(/obj/item/weapon/gun/rifle/kramer, /obj/item/ammo_magazine/rifle/kramer, new_human)

//====Generic-Civies====//

/datum/equipment_preset/colonist/civilian/generic
	name = "Civilian(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/civilian/survivor

/datum/equipment_preset/colonist/civilian/generic/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	spawn_random_civi_clothes(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)

//------
