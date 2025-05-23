/obj/effect/overlay
	name = "overlay"
	unacidable = TRUE
	var/i_attached //Added for possible image attachments to objects. For hallucinations and the like.

/obj/effect/overlay/palmtree_r
	name = "Palm tree"
	icon = 'icons/turf/beach2.dmi'
	icon_state = "palm1"
	density = TRUE
	layer = FLY_LAYER
	anchored = TRUE

/obj/effect/overlay/palmtree_l
	name = "Palm tree"
	icon = 'icons/turf/beach2.dmi'
	icon_state = "palm2"
	density = TRUE
	layer = FLY_LAYER
	anchored = TRUE

/obj/effect/overlay/coconut
	name = "Coconuts"
	icon = 'icons/turf/floors/beach.dmi'
	icon_state = "coconuts"

/obj/effect/overlay/danger
	name = "Danger"
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "danger"
	layer = ABOVE_FLY_LAYER

	appearance_flags = RESET_COLOR|KEEP_APART

/obj/effect/overlay/temp
	anchored = TRUE
	layer = ABOVE_FLY_LAYER //above mobs
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT //can't click to examine it
	var/effect_duration = 10 //in deciseconds

	var/start_on_spawn = TRUE

/obj/effect/overlay/temp/New()
	..()
	flick(icon_state, src)
	if(start_on_spawn)
		QDEL_IN(src, effect_duration)

/obj/effect/overlay/temp/point
	name = "arrow"
	desc = "It's an arrow hanging in mid-air. There may be a wizard about."
	icon = 'icons/mob/hud/screen1.dmi'
	icon_state = "arrow"
	anchored = TRUE
	effect_duration = 2.5 SECONDS
	var/glide_time = 0.5 SECONDS

	start_on_spawn = FALSE

/obj/effect/overlay/temp/point/Initialize(mapload, mob/M, atom/actual_pointed_atom)
	. = ..()

	if(!M)
		return INITIALIZE_HINT_QDEL

	var/turf/T1 = loc
	var/turf/T2 = M.loc

	if(T2.x && T2.y)
		var/dist_x = (T2.x - T1.x)
		var/dist_y = (T2.y - T1.y)

		pixel_x = dist_x * 32
		pixel_y = dist_y * 32

		var/offset_x = actual_pointed_atom ? get_pixel_position_x(actual_pointed_atom, relative = TRUE) : 0
		var/offset_y = actual_pointed_atom ? get_pixel_position_y(actual_pointed_atom, relative = TRUE) : 0

		animate(src, pixel_x = offset_x, pixel_y = offset_y, time = glide_time, easing = QUAD_EASING)

	QDEL_IN(src, effect_duration + glide_time)

/obj/effect/overlay/temp/point/big
	icon_state = "big_arrow"
	effect_duration = 4 SECONDS

/obj/effect/overlay/temp/point/big/greyscale
	icon_state = "big_arrow_grey"

/obj/effect/overlay/temp/point/big/observer
	icon_state = "big_arrow_grey"
	color = "#1c00f6"
	invisibility = INVISIBILITY_OBSERVER
	plane = GHOST_PLANE

/obj/effect/overlay/temp/point/big/queen
	icon_state = "big_arrow_grey"
	invisibility = INVISIBILITY_MAXIMUM

	var/list/client/clients
	var/image/self_icon

/obj/effect/overlay/temp/point/big/queen/proc/show_to_client(client/C)
	if(!C)
		return

	C.images |= self_icon
	clients |= C


/obj/effect/overlay/temp/point/big/queen/Initialize(mapload, mob/owner)
	. = ..()

	if(!owner)
		return INITIALIZE_HINT_QDEL

	self_icon = image(icon, src, icon_state = icon_state)
	LAZYINITLIST(clients)

	show_to_client(owner.client)

	for(var/i in GLOB.observer_list)
		var/mob/M = i
		show_to_client(M.client)

	for(var/i in GLOB.living_xeno_list)
		var/mob/M = i
		show_to_client(M.client)

/obj/effect/overlay/temp/point/big/queen/Destroy()
	for(var/i in clients)
		var/client/C = i
		if(!C) continue

		C.images -= self_icon
		LAZYREMOVE(clients, C)

	clients = null
	self_icon = null

	return ..()

//Special laser for coordinates, not for CAS
/obj/effect/overlay/temp/laser_coordinate
	name = "laser"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_ICON
	light_range = 2
	icon = 'icons/obj/items/weapons/projectiles.dmi'
	icon_state = "laser_target_coordinate"
	effect_duration = 600
	var/obj/item/device/binoculars/range/designator/source_binoc

/obj/effect/overlay/temp/laser_coordinate/Destroy()
	if(source_binoc)
		source_binoc.laser_cooldown = world.time + source_binoc.cooldown_duration
		source_binoc.coord = null
		source_binoc = null
	. = ..()

/obj/effect/overlay/temp/laser_target
	name = "laser"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_ICON
	light_range = 2
	icon = 'icons/obj/items/weapons/projectiles.dmi'
	icon_state = "laser_target2"
	effect_duration = 600
	var/target_id
	var/obj/item/device/binoculars/range/designator/source_binoc
	var/datum/cas_signal/signal
	var/mob/living/carbon/human/user

/obj/effect/overlay/temp/laser_target/New(loc, squad_name, _user, tracking_id)
	..()
	user = _user
	if(squad_name)
		name = "[squad_name] laser"
	if(user && user.faction && GLOB.cas_groups[user.faction])
		signal = new(src)
		signal.name = name
		signal.target_id = tracking_id
		signal.linked_cam = new(loc, name)
		GLOB.cas_groups[user.faction].add_signal(signal)


/obj/effect/overlay/temp/laser_target/Destroy()
	if(signal)
		GLOB.cas_groups[user.faction].remove_signal(signal)
		if(signal.linked_cam)
			qdel(signal.linked_cam)
			signal.linked_cam = null
		qdel(signal)
		signal = null
	if(source_binoc)
		source_binoc.laser_cooldown = world.time + source_binoc.cooldown_duration
		source_binoc.laser = null
		source_binoc = null

	. = ..()

/obj/effect/overlay/temp/laser_target/ex_act(severity) //immune to explosions
	return

/obj/effect/overlay/temp/laser_target/get_examine_text(mob/user)
	. = ..()
	if(ishuman(user))
		. += SPAN_DANGER("It's a laser to designate artillery targets, get away from it!")


//used to show where dropship ordnance will impact.
/obj/effect/overlay/temp/blinking_laser
	name = "blinking laser"
	anchored = TRUE
	light_range = 2
	effect_duration = 10
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'icons/obj/items/weapons/projectiles.dmi'
	icon_state = "laser_target3"

/obj/effect/overlay/temp/plasma_impact
	name = "plasma impact"
	icon = 'icons/effects/effects.dmi'
	icon_state = "impact_laser_purple"
	light_range = 2
	effect_duration = 8
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/effect/overlay/temp/emp_sparks
	icon = 'icons/effects/effects.dmi'
	icon_state = "empdisable"
	name = "emp sparks"
	effect_duration = 10
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/effect/overlay/temp/emp_sparks/New(loc)
	setDir(pick(GLOB.cardinals))
	..()

/obj/effect/overlay/temp/emp_pulse
	name = "emp pulse"
	icon = 'icons/effects/effects.dmi'
	icon_state = "emppulse"
	effect_duration = 20

/obj/effect/overlay/temp/elec_arc
	icon = 'icons/effects/effects.dmi'
	icon_state = "electricity"
	name = "electric arc"
	effect_duration = 3 SECONDS
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

//gib animation

/obj/effect/overlay/temp/gib_animation
	icon = 'icons/mob/mob.dmi'
	effect_duration = 14

/obj/effect/overlay/temp/gib_animation/New(Loc, mob/source_mob, gib_icon)
	if(!source_mob)
		return

	pixel_x = source_mob.pixel_x
	pixel_y = source_mob.pixel_y
	icon_state = gib_icon
	..()

/obj/effect/overlay/temp/gib_animation/ex_act(severity)
	return


/obj/effect/overlay/temp/gib_animation/animal
	icon = 'icons/mob/animal.dmi'
	effect_duration = 12


/obj/effect/overlay/temp/gib_animation/xeno
	icon = 'icons/mob/xenos/effects.dmi'
	effect_duration = 10

/obj/effect/overlay/temp/gib_animation/xeno/Initialize(mapload, mob/source_mob, gib_icon, new_icon)
	. = ..()
	if(new_icon)
		icon = new_icon

//dust animation

/obj/effect/overlay/temp/dust_animation
	icon = 'icons/mob/mob.dmi'
	effect_duration = 12

/obj/effect/overlay/temp/dust_animation/New(Loc, mob/source_mob, gib_icon)
	if(!source_mob)
		return

	pixel_x = source_mob.pixel_x
	pixel_y = source_mob.pixel_y
	icon_state = gib_icon
	..()

//acid pool splash animation

/obj/effect/overlay/temp/acid_pool_splash
	name = "acid splash"
	icon = 'icons/mob/xenos/effects.dmi'
	icon_state = "pool_splash"
	effect_duration = 10 SECONDS
