/obj/docking_port/mobile/elevator_small
	name="Service Elevator"
	id=MOBILE_SMALL_ELEVATOR

	// Map information
	height=4
	width=4
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/shuttle/elevator_small/elevator

	// Shuttle timings
	callTime = 5 SECONDS
	rechargeTime = 10 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/elevator.mp3'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/elevator_small/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/elevator_small/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/elevator_small/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/elevator_small
	dir=NORTH
	height=4
	width=4
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network

	//elevator effects (four so the entire elevator doesn't vanish when there's one opaque obstacle between you and the actual elevator loc).
	//var/obj/effect/elevator/cargo/SW
	//var/obj/effect/elevator/cargo/SE
	//var/obj/effect/elevator/cargo/NW
	v//ar/obj/effect/elevator/cargo/NE

/obj/docking_port/stationary/elevator_small/Initialize(mapload)
	. = ..()
	// Create and offset some effects for the elevator shaft sprite.
	//SW = new(locate(src.x - 2, src.y - 2, src.z))
	//SW.pixel_x = 0
	//SW.pixel_y = 0

	//SE = new(locate(src.x + 2, src.y - 2, src.z))
	//SE.pixel_x = 0
	//SE.pixel_y = 0

	//NW = new(locate(src.x - 2, src.y + 2, src.z))
	//NW.pixel_x = 0
	//NW.pixel_y = 0

	//NE = new(locate(src.x + 2, src.y + 2, src.z))
	//NE.pixel_x = 0
	//NE.pixel_y = 0

	//SW.invisibility = INVISIBILITY_ABSTRACT
	//SE.invisibility = INVISIBILITY_ABSTRACT
	//NW.invisibility = INVISIBILITY_ABSTRACT
	//NE.invisibility = INVISIBILITY_ABSTRACT

// Make the elevator shaft visible when the elevator leaves.
/obj/docking_port/stationary/elevator_small/on_departure(obj/docking_port/mobile/departing_shuttle)
    . = ..() // Call parent departure logic

    // 1. Make lift corners visible again
    //if(SW) SW.invisibility = 0
    //if(SE) SE.invisibility = 0
    //if(NW) NW.invisibility = 0
    //if(NE) NE.invisibility = 0

    // 2. Lock dock doors for launch
    var/datum/door_controller/single/door_control = new()
    door_control.doors = get_doors()
    if(length(door_control.doors))
        door_control.control_doors("force-lock-launch")
    qdel(door_control)

/obj/docking_port/stationary/elevator_small
    /// Cached list of dock doors to avoid repeated world scans
    var/list/cached_doors

//obj/docking_port/stationary/elevator_small/proc/reset_invisibility()
    //if(SW) SW.invisibility = INVISIBILITY_ABSTRACT
    //if(SE) SE.invisibility = INVISIBILITY_ABSTRACT
    //if(NW) NW.invisibility = INVISIBILITY_ABSTRACT
    //if(NE) NE.invisibility = INVISIBILITY_ABSTRACT

/obj/docking_port/stationary/elevator_small/proc/get_doors()
    // Return cached list if available
    if(cached_doors && length(cached_doors))
        return cached_doors

    var/list/found_doors = list()
    for(var/area/target_area in world)
        if(istype(target_area, airlock_area))
            for(var/obj/structure/machinery/door/door in target_area)
                found_doors += door

    cached_doors = found_doors
    return cached_doors

/obj/docking_port/stationary/elevator_small/on_arrival(obj/docking_port/mobile/arriving_shuttle)
    . = ..() // Call parent arrival logic

    // 1. Reset lift corner invisibility
    //reset_invisibility()

    // 2. Open elevator doors if this is a cargo lift
    if(istype(arriving_shuttle, /obj/docking_port/mobile/elevator_small))
        var/obj/docking_port/mobile/elevator_small/elevator = arriving_shuttle
        if(elevator.door_control)
            elevator.door_control.control_doors("open", airlock_exit)

    // 3. Open dock doors using cached list
    var/datum/door_controller/single/door_control = new()
    door_control.doors = get_doors()
    if(length(door_control.doors))
        door_control.control_doors("open", FALSE, FALSE)
    qdel(door_control)

    // 4. Play arrival sounds
    playsound(src, 'sound/machines/ping.ogg', 25, 1)
    playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/elevator_small/occupied
	name = "Lower Deck"
	id = STAT_SMALL_OCCUPIED
	airlock_area=/area/shuttle/elevator_small/star_upper
	airlock_exit = "south"
	roundstart_template = /datum/map_template/shuttle/elevator_small

/obj/docking_port/stationary/elevator_small/occupied/north
	airlock_area=/area/shuttle/elevator_small/port_upper
	airlock_exit = "north"

/obj/docking_port/stationary/elevator_small/empty
	name = "Middle Deck"
	id = STAT_SMALL_EMPTY
	airlock_exit = "south"
	airlock_area=/area/shuttle/elevator_small/star_lower

/obj/docking_port/stationary/elevator_small/empty/north
	airlock_exit = "north"
	airlock_area=/area/shuttle/elevator_small/port_lower
