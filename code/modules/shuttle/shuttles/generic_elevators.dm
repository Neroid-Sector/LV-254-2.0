/obj/docking_port/mobile/generic_elevator
	name="Elevator"
	id=MOBILE_GENERIC_ELEVATOR

	// Map information
	height=6
	width=7
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/shuttle/generic_shuttle/elevator

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 4 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/generic_elevator/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/generic_elevator/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/generic_elevator/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/generic_elevator
	dir=NORTH
	width=7
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network

/obj/docking_port/stationary/generic_elevator/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/generic_elevator/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/generic_elevator))
		var/obj/docking_port/mobile/generic_elevator/elevator = arriving_shuttle
		elevator.door_control.control_doors("open", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("open", FALSE, FALSE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/generic_elevator/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/generic_elevator/occupied
	name = "occupied"
	id = STAT_GENERIC_OCCUPIED
	airlock_exit = "west"
	roundstart_template = /datum/map_template/shuttle/generic_elevator

/obj/docking_port/stationary/generic_elevator/empty
	name = "empty"
	id = STAT_GENERIC_EMPTY
	airlock_exit = "west"

/obj/docking_port/stationary/generic_elevator/lz1
	name="Lz1 Elevator"
	id=STAT_GENERIC_LZ1
	airlock_area=/area/shuttle/generic_shuttle/lz1
	airlock_exit="west"
	roundstart_template = /datum/map_template/shuttle/generic_elevator

/obj/docking_port/stationary/generic_elevator/lz2
	name="Lz2 Elevator"
	id=STAT_GENERIC_LZ2
	airlock_area=/area/shuttle/generic_shuttle/lz2
	airlock_exit="west"
