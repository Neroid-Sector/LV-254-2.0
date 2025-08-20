/datum/equipment_preset/other/merc
	name = "merc"
	faction = FACTION_FREELANCER
	rank = JOB_MAINT_TECH
	idtype = /obj/item/card/id/pkt
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
	minimap_background = "background_cmb"

/datum/equipment_preset/other/pinkerton/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME
