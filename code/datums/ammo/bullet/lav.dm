/*
//======
					Chaingun Ammo
//======
*/


// Normal limited-AP, non-explosive rounds
/datum/ammo/bullet/lav
	name = "40mm Chaingun round"
	icon_state = "autocannon"
	sound_hit  = 'sound/weapons/sting_boom_small1.ogg'
	damage_falloff = 2
	flags_ammo_behavior = AMMO_BALLISTIC
	accurate_range_min = 2
	accuracy = HIT_ACCURACY_TIER_8
	scatter = 1
	damage = 90
	damage_var_high = PROJECTILE_VARIANCE_TIER_8
	penetration = ARMOR_PENETRATION_TIER_6
	accurate_range = 8
	max_range = 24
	shell_speed = AMMO_SPEED_TIER_8

/datum/ammo/bullet/lav/ap
	name = "40mm AP Chaingun round"
	damage = 65
	penetration = ARMOR_PENETRATION_TIER_10

/datum/ammo/bullet/lav/he
	name = "40mm HE Chaingun round"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_EXPLOSIVE
	damage = 75
	penetration = ARMOR_PENETRATION_TIER_6

/datum/ammo/bullet/lav/he/on_hit_mob(mob/mob, obj/projectile/projectile)
	cell_explosion(get_turf(mob), 25, 100, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)

	for(var/mob/living/carbon/L in get_turf(mob))
		if(L.stat == CONSCIOUS && L.mob_size <= MOB_SIZE_XENO)
			shake_camera(L, 1, 1)

/datum/ammo/bullet/lav/he/on_hit_obj(obj/obj,obj/projectile/projectile)
	cell_explosion(get_turf(obj), 25, 100, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)

	for(var/mob/living/carbon/L in get_turf(obj))
		if(L.stat == CONSCIOUS && L.mob_size <= MOB_SIZE_XENO)
			shake_camera(L, 1, 1)

/datum/ammo/bullet/lav/he/on_hit_turf(turf/turf,obj/projectile/projectile)
	cell_explosion(get_turf(turf), 25, 100, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)

	for(var/mob/living/carbon/L in turf)
		if(L.stat == CONSCIOUS && L.mob_size <= MOB_SIZE_XENO)
			shake_camera(L, 1, 1)
