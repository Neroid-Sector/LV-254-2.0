//=========QM
#define QM_WO1 "WO"
#define QM_WO2 "CWO2"
#define QM_WO3 "CWO3"
#define QM_WO4 "CWO4"
#define QM_WO5 "CWO5"
#define QM_O1 "2ndLT"

/datum/job/logistics/requisition
	title = JOB_CHIEF_REQUISITION
	selection_class = "job_qm"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/qm
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job</a> is to dispense supplies to the marines, including weapon attachments. Your cargo techs can help you out, but you have final say in your department. Make sure they're not goofing off. While you may request paperwork for supplies, do not go out of your way to screw with marines, unless you want to get deposed. A happy ship is a well-functioning ship."

	job_options = list(QM_WO1 = "WO", QM_WO2 = "CWO2", QM_WO3 = "CWO3", QM_WO4 = "CWO4", QM_WO5 = "CWO5", QM_O1 = "2ndLT")

/datum/job/logistics/requisition/handle_job_options(option)
	if(option == QM_WO1)
		gear_preset = /datum/equipment_preset/uscm_ship/qm
	else if(option == QM_WO2)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/wo2
	else if(option == QM_WO3)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/wo3
	else if(option == QM_WO4)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/wo4
	else if(option == QM_WO5)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/wo5
	else if(option == QM_O1)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/o1
	else
		gear_preset = /datum/equipment_preset/uscm_ship/qm


/obj/effect/landmark/start/requisition
	name = JOB_CHIEF_REQUISITION
	icon_state = "ro_spawn"
	job = /datum/job/logistics/requisition
