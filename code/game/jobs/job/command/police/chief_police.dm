//Chief MP
#define CMP_WO1 "WO"
#define CMP_WO2 "CWO2"
#define CMP_WO3 "CWO3"
#define CMP_WO4 "CWO4"
#define CMP_WO5 "CWO5"
#define CMP_O1 "2ndLT"
#define CMP_O2 "1stLT"

/datum/job/command/warrant
	title = JOB_CHIEF_POLICE
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/uscm_police/cmp
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You</a> are held by a higher standard and are required to obey not only the server rules but the <a href='"+LAW_PLACEHOLDER+"'>Marine Law</a>. Failure to do so may result in a job ban or server ban. You lead the Military Police, ensure your officers maintain peace and stability aboard the ship. Marines can get rowdy after a few weeks of cryosleep! In addition, you are tasked with the security of high-ranking personnel, including the command staff. Keep them safe!"
	var/mob/living/carbon/human/active_cmp

		job_options = list(CMP_WO2 = "CWO2", CMP_WO3 = "CWO3", CMP_WO4 = "CWO4", CMP_WO5 = "CWO5", CMP_O1 = "2ndLT")

/datum/job/uscm/mudskipper/msio/handle_job_options(option)
	if(option == CMP_WO1)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp
	else if(option == CMP_WO2)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/wo2
	else if(option == CMP_WO3)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/wo3
	else if(option == CMP_WO4)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/wo4
	else if(option == CMP_WO5)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/wo5
	else if(option == CMP_O1)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/o1
	else if(option == CMP_O2)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/o2
	else if(option == CMP_O2)
		gear_preset = /datum/equipment_preset/uscm_ship/cmp/o2
	else


/datum/job/command/warrant/generate_entry_conditions(mob/living/cmp, whitelist_status)
	. = ..()
	active_cmp = cmp
	RegisterSignal(cmp, COMSIG_PARENT_QDELETING, PROC_REF(cleanup_active_cmp))

/datum/job/command/warrant/proc/cleanup_active_cmp(mob/cmp)
	SIGNAL_HANDLER
	active_cmp = null

/obj/effect/landmark/start/warrant
	name = JOB_CHIEF_POLICE
	icon_state = "cmp_spawn"
	job = /datum/job/command/warrant
