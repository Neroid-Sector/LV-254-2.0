/datum/faction/pktn
	name = "Pinkerton Private Security"
	faction_tag = FACTION_PINKERTON

/datum/faction/pkt/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_PKT, JOB_PKT_RIOT)
			hud_icon_state = "sec"
		if(JOB_PKT_TL, JOB_PKT_RIOT_TL)
			hud_icon_state = "tl"
		if(JOB_PKT_ENG)
			hud_icon_state = "engi"
		if(JOB_PKT_MED)
			hud_icon_state = "med"
		if(JOB_PKT_SYN)
			hud_icon_state = "syn"
		if(JOB_PKT_CO)
			hud_icon_state = "co"
		if(JOB_PKT_SPY)
			hud_icon_state = "spy"
		if(JOB_PKT_DET)
			hud_icon_state = "det"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "pkt_[hud_icon_state]")
