//--------------------------------------Blackgold---------------------------------------//
// Fore = West  | Aft = East //
// Port = South | Starboard = North //
// Bow = Western|Stern = Eastern //(those are the front and back small sections)
// Naming convention is to start by port or starboard then put eitheir (bow,fore,midship,aft,stern)
//---------------------------------------------------------------------------------------//
/area/blackgold
	icon = 'icons/turf/area_almayer.dmi'
	// Ambience = list('sound/ambience/shipambience.ogg')
	icon_state = "almayer"
	powernet_name = "blackgold"
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_interval = 30
	// Soundscape_playlist = list('sound/effects/xylophone1.ogg', 'sound/effects/xylophone2.ogg', 'sound/effects/xylophone3.ogg')
	ambience_exterior = AMBIENCE_SHIP
	ceiling_muffle = FALSE

	// Whether this area is used for hijack evacuation progress
	var/hijack_evacuation_area = FALSE

	// The weight this area gives towards hijack evacuation progress
	var/hijack_evacuation_weight = 0

	// Whether this area is additive or multiplicative towards evacuation progress
	var/hijack_evacuation_type = EVACUATION_TYPE_NONE

/area/blackgold/Initialize(mapload, ...)
	. = ..()

	if(hijack_evacuation_area)
		SShijack.progress_areas[src] = power_equip

/obj/structure/machinery/computer/shuttle_control/blackgold/hangar
	name = "Elevator Console"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "supply"
	unslashable = TRUE
	unacidable = TRUE
	explo_proof = TRUE
	density = TRUE
	req_access = null
	shuttle_tag = "Hangar"

/obj/structure/machinery/computer/shuttle_control/blackgold/maintenance
	name = "Elevator Console"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "shuttle"
	unslashable = TRUE
	unacidable = TRUE
	explo_proof = TRUE
	density = TRUE
	req_access = null
	shuttle_tag = "Maintenance"

//---------------------------------------------------------------------------------------//
//-------------------------------------Service Deck--------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/underdeck
	name = "USS blackgold - Under Deck"

/area/blackgold/underdeck/req
	name = "USS blackgold - Under Deck Cargo"
	icon_state = "req"

/area/blackgold/underdeck/vehicle
	name = "USS blackgold - Under Deck Vehicle Bay"
	icon_state = "req"

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/underdeck/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/underdeck/stairs/port
	icon_state = "stairs_lowerdeck"
	name = "\improper Underdeck Port Elevator Shaft"

/area/blackgold/underdeck/stairs/star
	icon_state = "stairs_upperdeck"
	name = "\improper Underdeck Starboard Elevator Shaft"

//---------------------------------------------------------------------------------------//
//--------------------------------------Lower Deck---------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/lower

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/lower/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/lower/stairs/port
	icon_state = "stairs_lowerdeck"

/area/blackgold/lower/stairs/star
	icon_state = "stairs_upperdeck"

/area/blackgold/lower/stairs/port/fore
	name = "\improper Lower Deck Port-Fore Stairs"

/area/blackgold/lower/stairs/port/mid
	name = "\improper Lower Deck Port-Midship Stairs"

/area/blackgold/lower/stairs/port/aft
	name = "\improper Lower Deck Port-Aft Stairs"

/area/blackgold/lower/stairs/star/fore
	name = "\improper Lower Deck Starboard-Fore Stairs"

/area/blackgold/lower/stairs/star/mid
	name = "\improper Lower Deck Starboard-Midship Stairs"

/area/blackgold/lower/stairs/star/aft
	name = "\improper Lower Deck Starboard-Aft Stairs"

//---------------------------------------Hallways----------------------------------------//

/area/blackgold/lower/hallways

/area/blackgold/lower/hallways/port
	icon_state = "port"

/area/blackgold/lower/hallways/star
	icon_state = "starboard"

/area/blackgold/lower/hallways/port/fore
	name = "\improper Lower Deck Port-Fore Hallway"

/area/blackgold/lower/hallways/port/mid
	name = "\improper Lower Deck Port-Midship Hallway"

/area/blackgold/lower/hallways/port/aft
	name = "\improper Lower Deck Port-Aft Hallway"

/area/blackgold/lower/hallways/star/fore
	name = "\improper Lower Deck Starboard-Fore Hallway"

/area/blackgold/lower/hallways/star/mid
	name = "\improper Lower Deck Starboard-Midship Hallway"

/area/blackgold/lower/hallways/star/aft
	name = "\improper Lower Deck Starboard-Aft Hallway"

//--------------------------------------Maintenance--------------------------------------//

/area/blackgold/lower/maint

/area/blackgold/lower/maint/port
	icon_state = "upperhull"

/area/blackgold/lower/maint/star
	icon_state = "lowerhull"

/area/blackgold/lower/maint/port/fore
	name = "\improper Lower Deck Port-Fore Maintenance"

/area/blackgold/lower/maint/port/mid
	name = "\improper Lower Deck Port-Midship Maintenance"

/area/blackgold/lower/maint/port/aft
	name = "\improper Lower Deck Port-Aft Maintenance"

/area/blackgold/lower/maint/star/fore
	name = "\improper Lower Deck Starboard-Fore Maintenance"

/area/blackgold/lower/maint/star/mid
	name = "\improper Lower Deck Starboard-Midship Maintenance"

/area/blackgold/lower/maint/star/aft
	name = "\improper Lower Deck Starboard-Aft Maintenance"

//-----------------------------------------Rooms-----------------------------------------//

/area/blackgold/lower/rooms

/area/blackgold/lower/rooms/engine_core
	name = "\improper Engine Reactor Core Room"
	icon_state = "coreroom"
	soundscape_playlist = SCAPE_PL_ENG
	soundscape_interval = 15
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 0.2
	hijack_evacuation_type = EVACUATION_TYPE_ADDITIVE

/area/blackgold/lower/rooms/aicore
	name = "\improper AI Core"
	icon_state = "airoom"
	soundscape_playlist = SCAPE_PL_ARES
	soundscape_interval = 120
	flags_area = AREA_NOTUNNEL|AREA_UNWEEDABLE
	can_build_special = FALSE
	is_resin_allowed = FALSE
	resin_construction_allowed = FALSE

/area/blackgold/lower/rooms/hangar
	name = "\improper Lower Hangar Bays"
	icon_state = "hangar"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50




//-----------------------------------------Brig------------------------------------------//

/area/blackgold/lower/rooms/brig
	name = "\improper Lower Brig"
	icon_state = "brig"

/area/blackgold/lower/rooms/brig/evidence_storage
	name = "\improper Lower Brig Evidence Storage"

/area/blackgold/lower/rooms/brig/execution
	name = "\improper Lower Brig Execution Room"

/area/blackgold/lower/rooms/brig/cells
	name = "\improper Lower Brig Cells"
	icon_state = "brigcells"

/area/blackgold/lower/rooms/brig/warden
	name = "\improper Lower Brig Warden Office"
	icon_state = "chiefmpoffice"

//---------------------------------------------------------------------------------------//
//--------------------------------------Middle Deck--------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/middle

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/middle/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/middle/stairs/port
	icon_state = "stairs_lowerdeck"

/area/blackgold/middle/stairs/star
	icon_state = "stairs_upperdeck"

/area/blackgold/middle/stairs/port/fore
	name = "\improper Middle Deck Port-Fore Stairs"

/area/blackgold/middle/stairs/port/mid
	name = "\improper Middle Deck Port-Midship Stairs"

/area/blackgold/middle/stairs/port/aft
	name = "\improper Middle Deck Port-Aft Stairs"

/area/blackgold/middle/stairs/star/fore
	name = "\improper Middle Deck Starboard-Fore Stairs"

/area/blackgold/middle/stairs/star/mid
	name = "\improper Middle Deck Starboard-Midship Stairs"

/area/blackgold/middle/stairs/star/aft
	name = "\improper Middle Deck Starboard-Aft Stairs"

//---------------------------------------Hallways----------------------------------------//

/area/blackgold/middle/hallways

/area/blackgold/middle/hallways/port
	icon_state = "port"

/area/blackgold/middle/hallways/star
	icon_state = "starboard"

/area/blackgold/middle/hallways/port/fore
	name = "\improper Middle Deck Port-Fore Hallway"

/area/blackgold/middle/hallways/port/mid
	name = "\improper Middle Deck Port-Midship Hallway"

/area/blackgold/middle/hallways/port/aft
	name = "\improper Middle Deck Port-Aft Hallway"

/area/blackgold/middle/hallways/star/fore
	name = "\improper Middle Deck Starboard-Fore Hallway"

/area/blackgold/middle/hallways/star/mid
	name = "\improper Middle Deck Starboard-Midship Hallway"

/area/blackgold/middle/hallways/star/aft
	name = "\improper Middle Deck Starboard-Aft Hallway"

//--------------------------------------Maintenance--------------------------------------//

/area/blackgold/middle/maint

/area/blackgold/middle/maint/port
	icon_state = "upperhull"

/area/blackgold/middle/maint/star
	icon_state = "lowerhull"

/area/blackgold/middle/maint/port/fore
	name = "\improper Middle Deck Port-Fore Maintenance"

/area/blackgold/middle/maint/port/mid
	name = "\improper Middle Deck Port-Midship Maintenance"

/area/blackgold/middle/maint/port/aft
	name = "\improper Middle Deck Port-Aft Maintenance"

/area/blackgold/middle/maint/star/fore
	name = "\improper Middle Deck Starboard-Fore Maintenance"

/area/blackgold/middle/maint/star/mid
	name = "\improper Middle Deck Starboard-Midship Maintenance"

/area/blackgold/middle/maint/star/aft
	name = "\improper Middle Deck Starboard-Aft Maintenance"

//-----------------------------------------Rooms-----------------------------------------//

/area/blackgold/middle/rooms

/area/blackgold/middle/rooms/aientrance
	name = "\improper AI Core Entrance"
	icon_state = "airoom"
	soundscape_playlist = SCAPE_PL_ARES
	soundscape_interval = 120
	flags_area = AREA_NOTUNNEL|AREA_UNWEEDABLE
	can_build_special = FALSE
	is_resin_allowed = FALSE
	resin_construction_allowed = FALSE

/area/blackgold/middle/rooms/hangar
	name = "\improper Hangar Bay"
	icon_state = "hangar"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50









//---------------------------------------------------------------------------------------//
//--------------------------------------Upper Deck---------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/upper

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/upper/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/upper/stairs/port
	icon_state = "stairs_lowerdeck"

/area/blackgold/upper/stairs/star
	icon_state = "stairs_upperdeck"

/area/blackgold/upper/stairs/port/fore
	name = "\improper Upper Deck Port-Fore Stairs"

/area/blackgold/upper/stairs/port/mid
	name = "\improper Upper Deck Port-Midship Stairs"

/area/blackgold/upper/stairs/port/aft
	name = "\improper Upper Deck Port-Aft Stairs"

/area/blackgold/upper/stairs/star/fore
	name = "\improper Upper Deck Starboard-Fore Stairs"

/area/blackgold/upper/stairs/star/mid
	name = "\improper Upper Deck Starboard-Midship Stairs"

/area/blackgold/upper/stairs/star/aft
	name = "\improper Upper Deck Starboard-Aft Stairs"

//---------------------------------------Hallways----------------------------------------//

/area/blackgold/upper/hallways

/area/blackgold/upper/hallways/port
	icon_state = "port"

/area/blackgold/upper/hallways/star
	icon_state = "starboard"

/area/blackgold/upper/hallways/port/fore
	name = "\improper Upper Deck Port-Fore Hallway"

/area/blackgold/upper/hallways/port/mid
	name = "\improper Upper Deck Port-Midship Hallway"

/area/blackgold/upper/hallways/port/aft
	name = "\improper Upper Deck Port-Aft Hallway"

/area/blackgold/upper/hallways/star/fore
	name = "\improper Upper Deck Starboard-Fore Hallway"

/area/blackgold/upper/hallways/star/mid
	name = "\improper Upper Deck Starboard-Midship Hallway"

/area/blackgold/upper/hallways/star/aft
	name = "\improper Upper Deck Starboard-Aft Hallway"

//--------------------------------------Maintenance--------------------------------------//

/area/blackgold/upper/maint

/area/blackgold/upper/maint/port
	icon_state = "upperhull"

/area/blackgold/upper/maint/star
	icon_state = "lowerhull"

/area/blackgold/upper/maint/port/fore
	name = "\improper Upper Deck Port-Fore Maintenance"

/area/blackgold/upper/maint/port/mid
	name = "\improper Upper Deck Port-Midship Maintenance"

/area/blackgold/upper/maint/port/aft
	name = "\improper Upper Deck Port-Aft Maintenance"

/area/blackgold/upper/maint/star/fore
	name = "\improper Upper Deck Starboard-Fore Maintenance"

/area/blackgold/upper/maint/star/mid
	name = "\improper Upper Deck Starboard-Midship Maintenance"

/area/blackgold/upper/maint/star/aft
	name = "\improper Upper Deck Starboard-Aft Maintenance"

//-----------------------------------------Rooms-----------------------------------------//

/area/blackgold/upper/rooms

//----------------------------------------Command----------------------------------------//

/area/blackgold/upper/rooms/cic
	name = "\improper Combat Information Center"
	icon_state = "cic"
	soundscape_playlist = SCAPE_PL_CIC
	soundscape_interval = 50
	flags_area = AREA_NOTUNNEL

/area/blackgold/upper/rooms/cic/conference
	name = "\improper CIC Conference Room"
	icon_state = "cic"

/area/blackgold/upper/rooms/captain_mess
	name = "\improper Captain's Mess"
	icon_state = "briefing"

/area/blackgold/upper/rooms/companycommand
	soundscape_playlist = SCAPE_PL_CIC

/area/blackgold/upper/rooms/companycommand/alpha
	name = "\improper Alpha Company Command Office"
	icon_state = "alpha"

/area/blackgold/upper/rooms/companycommand/alpha/cc
	name = "\improper Alpha Company Commander's Office"

/area/blackgold/upper/rooms/companycommand/bravo
	name = "\improper Bravo Company Command Office"
	icon_state = "bravo"

/area/blackgold/upper/rooms/companycommand/bravo/cc
	name = "\improper Bravo Company Commander's Office"

/area/blackgold/upper/rooms/companycommand/charlie
	name = "\improper Charlie Company Command Office"
	icon_state = "charlie"

/area/blackgold/upper/rooms/companycommand/charlie/cc
	name = "\improper Charlie Company Commander's Office"

/area/blackgold/upper/rooms/companycommand/delta
	name = "\improper Delta Company Command Office"
	icon_state = "delta"

/area/blackgold/upper/rooms/companycommand/delta/cc
	name = "\improper Delta Company Commander's Office"

/area/blackgold/upper/rooms/staffbunks
	name = "\improper Staff Officer Bunks"
	icon_state = "livingspace"

/area/blackgold/upper/rooms/commandbunks
	name = "\improper Commanding Officer's Office"
	icon_state = "livingspace"

/area/blackgold/upper/rooms/commandbunks/adjunct
	name = "\improper Adjunct's Quarters"

/area/blackgold/upper/rooms/evacuation
	name = "\improper Upper Deck Evacuation Lounge"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttle2"

/area/blackgold/upper/rooms/xobunks
	name = "\improper Executive Officer's Office"
	icon_state = "livingspace"

/area/blackgold/upper/rooms/synthcloset
	name = "\improper Upper Deck Synthetic Storage"
	icon_state = "livingspace"

/area/blackgold/upper/rooms/intel
	name = "\improper Upper Deck Computer Lab"
	icon_state = "ceroom"

/area/blackgold/upper/rooms/intel/storage
	name = "\improper Computer Lab Secure Storage"
	icon_state = "corporatespace"

/area/blackgold/upper/rooms/telecomms
	name = "\improper Upper Deck Telecommunications"
	icon_state = "tcomms"
	flags_area = AREA_NOTUNNEL

//------------------------------------------Brig-----------------------------------------//

/area/blackgold/upper/rooms/brig
	name = "\improper Upper Brig"
	icon_state = "brig"

/area/blackgold/upper/rooms/brig/lobby
	name = "\improper Upper Brig Lobby"

/area/blackgold/upper/rooms/brig/armory
	name = "\improper Upper Brig Armory"

/area/blackgold/upper/rooms/brig
	name = "\improper Upper Brig MP Bunks"

/area/blackgold/upper/rooms/brig/cryo
	name = "\improper Upper Brig Cryo Pods"

/area/blackgold/upper/rooms/brig/medical
	name = "\improper Upper Brig Medical"

/area/blackgold/upper/rooms/brig/processing
	name = "\improper Upper Brig Processing and Holding"

/area/blackgold/upper/rooms/brig/chief
	name = "\improper Upper Brig Chief MP Office"
	icon_state = "chiefmpoffice"

/area/blackgold/upper/rooms/brig/stairs
	name = "\improper Brig Stairwell"
	icon_state = "stairs_lowerdeck"




//------------------------------------------Misc-----------------------------------------//

/area/blackgold/upper/rooms/hangar
	name = "\improper Upper Hangar Catwalk"
	icon_state = "hangar"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50


















/area/blackgold/command/corporateliaison
	name = "\improper Corporate Liaison Office"
	icon_state = "corporatespace"
	fake_zlevel = 1 // upperdeck

/area/blackgold/command/combat_correspondent
	name = "\improper Upper Deck Combat Correspondent Office"
	icon_state = "selfdestruct"
	fake_zlevel = 1 // upperdeck

// engineering

/area/blackgold/engineering
	minimap_color = MINIMAP_AREA_ENGI

// lower deck

/area/blackgold/engineering/lower
	name = "\improper Lower Deck Engineering"
	icon_state = "lowerengineering"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/engineering/lower/engine_monitoring//this is not used  so could be remove?
	name = "\improper Lower Deck Engine Reactor Monitoring"
	icon_state = "lowermonitoring"

/area/blackgold/engineering/lower/workshop
	name = "\improper Lower Deck Engineering Workshop"
	icon_state = "workshop"

/area/blackgold/engineering/lower/engine_core
	name = "\improper Engine Reactor Core Room"
	icon_state = "coreroom"
	soundscape_playlist = SCAPE_PL_ENG
	soundscape_interval = 15
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 0.2
	hijack_evacuation_type = EVACUATION_TYPE_ADDITIVE

// upper deck

/area/blackgold/engineering/upper_engineering
	name = "\improper Upper Deck Engineering"
	icon_state = "upperengineering"
	fake_zlevel = 1 // upperdeck

/area/blackgold/engineering/upper_engineering/starboard
	name = "\improper Upper Deck Starboard Engineering"

/area/blackgold/engineering/upper_engineering/port
	name = "\improper Upper Deck Port Engineering"

/area/blackgold/engineering/upper_engineering/notunnel
	flags_area = AREA_NOTUNNEL
	requires_power = FALSE

/area/blackgold/engineering/ce_room
	name = "\improper Upper Deck Chief Engineer Office"
	icon_state = "ceroom"
	fake_zlevel = 1 // upperdeck

/area/blackgold/engineering/starboard_atmos
	name = "\improper Upper Deck Starboard Atmospherics"
	icon_state = "starboardatmos"
	fake_zlevel = 1 // upperdeck

/area/blackgold/command/intel_bunks
	name = "\improper Upper Deck Intel Officer's Bunks"
	icon_state = "blue"
	fake_zlevel = 1 // upperdeck

/area/blackgold/engineering/laundry
	name = "\improper Upper Deck Laundry Room"
	icon_state = "laundry"
	fake_zlevel = 1 // upperdeck

/area/blackgold/shipboard
	minimap_color = MINIMAP_AREA_SEC

/area/blackgold/shipboard/navigation
	name = "\improper Astronavigational Deck"
	icon_state = "astronavigation"
	fake_zlevel = 2 // lowerdeck
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 1.1
	hijack_evacuation_type = EVACUATION_TYPE_MULTIPLICATIVE

/area/blackgold/shipboard/panic
	name = "\improper Hangar Panic Room"
	icon_state = "brig"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/shipboard/starboard_missiles
	name = "\improper Upper Deck Starboard Missile Tubes"
	icon_state = "starboardmissile"
	fake_zlevel = 1 // upperdeck

/area/blackgold/shipboard/port_missiles
	name = "\improper Upper Deck Port Missile Tubes"
	icon_state = "portmissile"
	fake_zlevel = 1 // upperdeck

/area/blackgold/shipboard/weapon_room
	name = "\improper Lower Deck Weapon Control"
	icon_state = "weaponroom"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/shipboard/weapon_room/notunnel
	flags_area = AREA_NOTUNNEL
	requires_power = FALSE

/area/blackgold/shipboard/starboard_point_defense
	name = "\improper Lower Deck Starboard Point Defense"
	icon_state = "starboardpd"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/shipboard/port_point_defense
	name = "\improper Lower Deck Port Point Defense"
	icon_state = "portpd"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/shipboard/stern_point_defense
	name = "\improper Lower Deck Stern Point Defense"
	icon_state = "portpd"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/shipboard/firing_range_north
	name = "\improper Starboard Firing Range"
	icon_state = "firingrange"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/shipboard/firing_range_south
	name = "\improper Port Firing Range"
	icon_state = "firingrange"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/hallways/hangar
	name = "\improper Hangar"
	icon_state = "hangar"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/blackgold/hallways/lower
	fake_zlevel = 2 // lowerdeck

/area/blackgold/hallways/lower/repair_bay
	name = "\improper Lower Deck Deployment Workshop"
	icon_state = "dropshiprepair"

/area/blackgold/hallways/lower/starboard_umbilical
	name = "\improper Lower Deck Starboard Umbilical Hallway"
	icon_state = "starboardumbilical"

/area/blackgold/hallways/lower/port_umbilical
	name = "\improper Lower Deck Port Umbilical Hallway"
	icon_state = "portumbilical"

/area/blackgold/living
	minimap_color = MINIMAP_AREA_COLONY

/area/blackgold/living/tankerbunks
	name = "\improper Lower Deck Vehicle Crew Bunks"
	icon_state = "livingspace"
	fake_zlevel = 2

/area/blackgold/living/cryo_cells
	name = "\improper Lower Deck Cryo Cells"
	icon_state = "cryo"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/briefing
	name = "\improper Briefing Area"
	icon_state = "briefing"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/port_emb
	name = "\improper Lower Deck Port Extended Mission Bunks"
	icon_state = "portemb"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/starboard_emb
	name = "\improper Lower Deck Starboard Extended Mission Bunks"
	icon_state = "starboardemb"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/port_garden
	name = "\improper Port Garden"
	icon_state = "portemb"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/starboard_garden
	name = "\improper Starboard Garden"
	icon_state = "starboardemb"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/basketball
	name = "\improper Basketball Court"
	icon_state = "basketball"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/grunt_rnr
	name = "\improper Lounge"
	icon_state = "gruntrnr"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/officer_rnr
	name = "\improper Upper Deck Officer's Lounge"
	icon_state = "officerrnr"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/officer_study
	name = "\improper Upper Deck Officer's Study"
	icon_state = "officerstudy"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/auxiliary_officer_office
	name = "\improper Upper Deck Auxiliary Support Officer office"
	icon_state = "livingspace"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/intel
	name = "\improper Intelligence Officer's Bunks"
	icon_state = "livingspace"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/cafeteria_port
	name = "\improper Cafeteria Port"
	icon_state = "food"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/cafeteria_starboard
	name = "\improper Cafeteria Starboard"
	icon_state = "food"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/gym
	name = "\improper Lower Deck Gym"
	icon_state = "officerrnr"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/cafeteria_officer
	name = "\improper Upper Deck Officer Cafeteria"
	icon_state = "food"
	fake_zlevel = 1 // upperdeck

/area/blackgold/living/offices
	name = "\improper Lower Deck Conference Office"
	icon_state = "briefing"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/offices/cryo
	name = "\improper Support Crew Cryogenics Bay"
	icon_state = "cryo"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/living/offices/flight
	name = "\improper Flight Office"

/area/blackgold/living/pilotbunks
	name = "\improper Pilot's Bunks"
	icon_state = "livingspace"
	fake_zlevel = 1

/area/blackgold/living/chapel
	name = "\improper blackgold Chapel"
	icon_state = "officerrnr"
	fake_zlevel = 1 // upperdeck

/area/blackgold/medical
	minimap_color = MINIMAP_AREA_MEDBAY

/area/blackgold/medical/lower_medical_lobby
	name = "\improper Medical Lower Lobby"
	icon_state = "medical"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/upper_medical
	name = "\improper Medical Upper"
	icon_state = "medical"
	fake_zlevel = 1 // upperdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/morgue
	name = "\improper Morgue"
	icon_state = "operating"
	fake_zlevel = 1 // upperdeck

/area/blackgold/medical/operating_room_one
	name = "\improper Medical Operating Room 1"
	icon_state = "operating"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/operating_room_two
	name = "\improper Medical Operating Room 2"
	icon_state = "operating"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/operating_room_three
	name = "\improper Medical Operating Room 3"
	icon_state = "operating"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/operating_room_four
	name = "\improper Medical Operating Room 4"
	icon_state = "operating"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/medical_science
	name = "\improper Medical Research laboratories"
	icon_state = "science"
	fake_zlevel = 1 // upperdeck

/area/blackgold/medical/hydroponics
	name = "\improper Medical Research hydroponics"
	icon_state = "science"
	fake_zlevel = 1 // upperdeck

/area/blackgold/medical/containment
	name = "\improper Medical Research containment"
	icon_state = "science"
	fake_zlevel = 1 // upperdeck

/area/blackgold/medical/containment/cell
	name = "\improper Medical Research containment cells"
	icon_state = "science"
	fake_zlevel = 1 // upperdeck
	flags_area = AREA_AVOID_BIOSCAN|AREA_NOTUNNEL|AREA_CONTAINMENT

/area/blackgold/medical/containment/cell/cl
	name = "\improper Storage Room"

/area/blackgold/medical/chemistry
	name = "\improper Medical Chemical laboratory"
	icon_state = "chemistry"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/medical/lockerroom
	name = "\improper Medical Locker Room"
	icon_state = "science"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/medical/cryo_tubes
	name = "\improper Medical Cryogenics Tubes"
	icon_state = "medical"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/medical/lower_medical_medbay
	name = "\improper Medical Lower Medbay"
	icon_state = "medical"
	fake_zlevel = 2 // lowerdeck
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/squads/alpha
	name = "\improper Squad Alpha Preparation"
	icon_state = "alpha"


	name = "\improper Requisitions"
	icon_state = "req"
	fake_zlevel = 2 // lowerdeck

/area/blackgold/powered //for objects not intended to lose power
	name = "\improper Powered"
	icon_state = "selfdestruct"
	requires_power = 0

/area/blackgold/powered/agent
	name = "\improper Unknown Area"
	icon_state = "selfdestruct"
	fake_zlevel = 2 // lowerdeck
	flags_area = AREA_AVOID_BIOSCAN|AREA_NOTUNNEL

/area/blackgold/engineering/airmix
	icon_state = "selfdestruct"
	requires_power = 0
	flags_area = AREA_NOTUNNEL

/area/blackgold/lifeboat_pumps
	name = "Lifeboat Fuel Pumps"
	icon_state = "lifeboat_pump"
	requires_power = 1
	fake_zlevel = 1
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 0.1
	hijack_evacuation_type = EVACUATION_TYPE_ADDITIVE

/area/blackgold/lifeboat_pumps/north1
	name = "Starboard-Fore Lifeboat Fuel Pump"

/area/blackgold/lifeboat_pumps/north2
	name = "Starboard-Aft Lifeboat Fuel Pump"

/area/blackgold/lifeboat_pumps/south1
	name = "Port-Fore Lifeboat Fuel Pump"

/area/blackgold/lifeboat_pumps/south2
	name = "Port-Aft Lifeboat Fuel Pump"

/area/blackgold/command/lifeboat
	name = "\improper Lifeboat Docking Port"
	icon_state = "selfdestruct"
	fake_zlevel = 1 // upperdeck

/area/space/blackgold/lifeboat_dock
	name = "\improper Port Lifeboat Docking"
	icon_state = "lifeboat"
	fake_zlevel = 1 // upperdeck
	flags_area = AREA_NOTUNNEL

/area/blackgold/evacuation/pod1
/area/blackgold/evacuation/pod2
/area/blackgold/evacuation/pod3
/area/blackgold/evacuation/pod4
/area/blackgold/evacuation/pod5
/area/blackgold/evacuation/pod6
/area/blackgold/evacuation/pod7
/area/blackgold/evacuation/pod8
/area/blackgold/evacuation/pod9
/area/blackgold/evacuation/pod10
/area/blackgold/evacuation/pod11
/area/blackgold/evacuation/pod12
/area/blackgold/evacuation/pod13
/area/blackgold/evacuation/pod14
/area/blackgold/evacuation/pod15
/area/blackgold/evacuation/pod16
/area/blackgold/evacuation/pod17
/area/blackgold/evacuation/pod18

/area/blackgold/evacuation/stranded

/area/blackgold/evacuation/stranded/pod1
/area/blackgold/evacuation/stranded/pod2
/area/blackgold/evacuation/stranded/pod3
/area/blackgold/evacuation/stranded/pod4
/area/blackgold/evacuation/stranded/pod5
/area/blackgold/evacuation/stranded/pod6
/area/blackgold/evacuation/stranded/pod7
/area/blackgold/evacuation/stranded/pod8
/area/blackgold/evacuation/stranded/pod9
/area/blackgold/evacuation/stranded/pod10
/area/blackgold/evacuation/stranded/pod11
/area/blackgold/evacuation/stranded/pod12
/area/blackgold/evacuation/stranded/pod13
/area/blackgold/evacuation/stranded/pod14
/area/blackgold/evacuation/stranded/pod15
/area/blackgold/evacuation/stranded/pod16
/area/blackgold/evacuation/stranded/pod17
/area/blackgold/evacuation/stranded/pod18
