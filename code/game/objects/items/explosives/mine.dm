///***MINES***///
//Mines have an invisible "tripwire" atom that explodes when crossed
//Stepping directly on the mine will also blow it up
/obj/item/explosive/mine
	name = "\improper M20 Claymore anti-personnel mine"
	desc = "The M20 Claymore is a directional anti-personnel smart mine of the USCMC. Generates 120 degree cone of shrapnel if a valid target crosses before or over it. On its face, it reads \"FRONT TOWARD ENEMY\"."
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "m20"
	force = 5
	w_class = SIZE_SMALL
	// whoever commented that they wanted to prevent claymores from being hidden was a dork (derogatory).
	throwforce = 5
	throw_range = 6
	throw_speed = SPEED_VERY_FAST
	// claymores are now acidable.
	flags_atom = FPRINT|CONDUCT
	// antigrief off. kino fragging rp.
	allowed_sensors = list(/obj/item/device/assembly/prox_sensor)
	max_container_volume = 120
	reaction_limits = list( "max_ex_power" = 105, "base_ex_falloff" = 60, "max_ex_shards" = 32,
							"max_fire_rad" = 5, "max_fire_int" = 12, "max_fire_dur" = 18,
							"min_fire_rad" = 2, "min_fire_int" = 3, "min_fire_dur" = 3
	)
	angle = 60
	use_dir = TRUE
	var/iff_signal = FACTION_MARINE
	var/triggered = FALSE
	var/hard_iff_lock = FALSE
	var/obj/effect/mine_tripwire/tripwire

	var/map_deployed = FALSE

/obj/item/explosive/mine/Initialize()
	. = ..()
	if(map_deployed)
		deploy_mine(null)

/obj/item/explosive/mine/Destroy()
	QDEL_NULL(tripwire)
	. = ..()

/obj/item/explosive/mine/ex_act()
	prime() //We don't care about how strong the explosion was.

/obj/item/explosive/mine/emp_act()
	. = ..()
	prime() //Same here. Don't care about the effect strength.


//checks for things that would prevent us from placing the mine.
/obj/item/explosive/mine/proc/check_for_obstacles(mob/living/user)
	if(locate(/obj/item/explosive/mine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return TRUE
	if(user.loc && (user.loc.density || locate(/obj/structure/fence) in user.loc))
		to_chat(user, SPAN_WARNING("You can't plant a mine here."))
		return TRUE
	if(SSinterior.in_interior(user))
		to_chat(user, SPAN_WARNING("It's too cramped in here to deploy \a [src]."))
		return TRUE



//Arming
/obj/item/explosive/mine/attack_self(mob/living/user)
	if(!..())
		return

	if(check_for_obstacles(user))
		return

	if(active || user.action_busy)
		return

	if(antigrief_protection && user.faction == FACTION_MARINE && explosive_antigrief_check(src, user))
		to_chat(user, SPAN_WARNING("\The [name]'s safe-area accident inhibitor prevents you from planting!"))
		msg_admin_niche("[key_name(user)] attempted to plant \a [name] in [get_area(src)] [ADMIN_JMP(src.loc)]")
		return

	user.visible_message(SPAN_NOTICE("[user] starts deploying [src]."),
		SPAN_NOTICE("You start deploying [src]."))
	if(!do_after(user, 40, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
		user.visible_message(SPAN_NOTICE("[user] stops deploying [src]."), \
			SPAN_NOTICE("You stop deploying \the [src]."))
		return

	if(active)
		return

	if(check_for_obstacles(user))
		return

	user.visible_message(SPAN_NOTICE("[user] finishes deploying [src]."), \
		SPAN_NOTICE("You finish deploying [src]."))

	deploy_mine(user)

/obj/item/explosive/mine/proc/deploy_mine(mob/user)
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	anchored = TRUE
	playsound(loc, 'sound/weapons/mine_armed.ogg', 25, 1)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()


//Disarming
/obj/item/explosive/mine/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts disarming [src]."), \
				SPAN_NOTICE("You start disarming [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts fiddling with \the [src], trying to disarm it."), \
				SPAN_NOTICE("You start disarming [src], but you don't know its IFF data. This might end badly..."))
			if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming [src]."), \
					SPAN_WARNING("You stop disarming [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(5))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming [src]."), \
			SPAN_NOTICE("You finish disarming [src]."))
			disarm()

	else
		return ..()

/obj/item/explosive/mine/proc/disarm()
	if(customizable)
		activate_sensors()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	update_icon()
	QDEL_NULL(tripwire)

/obj/item/explosive/mine/activate_sensors()
	if(active)
		return

	if(!customizable)
		set_tripwire()
		return;

	if(!detonator)
		active = TRUE
		return

	if(customizable && assembly_stage == ASSEMBLY_LOCKED)
		if(isigniter(detonator.a_right) && isigniter(detonator.a_left))
			set_tripwire()
			use_dir = TRUE
			return
		else
			..()
			// that's stupid. also prevents people from triggering it manually which is cool.
			//use_dir = FALSE // Claymore defaults to radial in these case. Poor man C4
			triggered = TRUE // Delegating the tripwire/crossed function to the sensor.


/obj/item/explosive/mine/proc/set_tripwire()
	if(!active && !tripwire)
		var/tripwire_loc = get_turf(get_step(loc, dir))
		tripwire = new(tripwire_loc)
		tripwire.linked_claymore = src
		active = TRUE


//Mine can also be triggered if you "cross right in front of it" (same tile)
/obj/item/explosive/mine/Crossed(atom/A)
	..()
	if(isliving(A))
		var/mob/living/L = A
		if(!L.stat == DEAD)//so dragged corpses don't trigger mines.
			return
		else
			try_to_prime(A)

/obj/item/explosive/mine/Collided(atom/movable/AM)
	try_to_prime(AM)


/obj/item/explosive/mine/proc/try_to_prime(mob/living/L)
	if(!active || triggered || (customizable && !detonator))
		return
	if(!istype(L))
		return
	if(L.stat == DEAD)
		return
	if(L.get_target_lock(iff_signal))
		return
	if(HAS_TRAIT(L, TRAIT_ABILITY_BURROWED))
		return
	L.visible_message(SPAN_DANGER("[icon2html(src, viewers(src))] The [name] clicks as [L] moves in front of it."), \
	SPAN_DANGER("[icon2html(src, L)] The [name] clicks as you move in front of it."), \
	SPAN_DANGER("You hear a click."))

	triggered = TRUE
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 25, 1)
	prime()



//Note : May not be actual explosion depending on linked method
/obj/item/explosive/mine/prime()
	set waitfor = 0

	if(!customizable)
		create_shrapnel(loc, 30, dir, angle, /datum/ammo/bullet/shrapnel/claymore, cause_data, def_zones = MOVEMENT_LIMBS)
		// a claymore is essentially a block of C4 with metal in the front. Shit's fuckin nasty.
		cell_explosion(loc, 70, 30, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
		qdel(src)
	else
		. = ..()
		if(!QDELETED(src))
			disarm()

/obj/item/explosive/mine/attack_alien(mob/living/carbon/xenomorph/M)
	if(triggered) //Mine is already set to go off
		return XENO_NO_DELAY_ACTION

	if(M.a_intent == INTENT_HELP)
		to_chat(M, SPAN_XENONOTICE("If you hit this hard enough, it would probably explode."))
		return XENO_NO_DELAY_ACTION

	M.animation_attack_on(src)
	M.visible_message(SPAN_DANGER("[M] has slashed [src]!"), \
		SPAN_DANGER("You slash [src]!"))
	playsound(loc, 'sound/weapons/slice.ogg', 25, 1)

	//We move the tripwire randomly in either of the four cardinal directions
	triggered = TRUE
	if(tripwire)
		var/direction = pick(GLOB.cardinals)
		var/step_direction = get_step(src, direction)
		tripwire.forceMove(step_direction)
	prime()
	if(!QDELETED(src))
		disarm()
	return XENO_ATTACK_ACTION

/obj/item/explosive/mine/flamer_fire_act(damage, flame_cause_data) //adding mine explosions
	cause_data = flame_cause_data
	prime()
	if(!QDELETED(src))
		disarm()


/obj/effect/mine_tripwire
	name = "claymore tripwire"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	invisibility = 101
	unacidable = TRUE //You never know
	var/obj/item/explosive/mine/linked_claymore

/obj/effect/mine_tripwire/Destroy()
	if(linked_claymore)
		if(linked_claymore.tripwire == src)
			linked_claymore.tripwire = null
		linked_claymore = null
	. = ..()

//immune to explosions.
/obj/effect/mine_tripwire/ex_act(severity)
	return

/obj/effect/mine_tripwire/Crossed(atom/movable/AM)
	if(!linked_claymore)
		qdel(src)
		return

	if(linked_claymore.triggered) //Mine is already set to go off
		return

	if(linked_claymore)
		linked_claymore.try_to_prime(AM)

/obj/item/explosive/mine/active
	icon_state = "m20_active"
	base_icon_state = "m20"
	map_deployed = TRUE

/obj/item/explosive/mine/no_iff
	iff_signal = null

/obj/item/explosive/mine/active/no_iff
	iff_signal = null

//low lethality claymore.
/obj/item/explosive/mine/confetti

/obj/item/explosive/mine/confetti/prime()
	set waitfor = 0

	if(!customizable)
		create_shrapnel(loc, 15, dir, angle, /datum/ammo/bullet/shrapnel/claymore/confetti, cause_data, def_zones = MOVEMENT_LIMBS)
		// low lethality edition
		cell_explosion(loc, 60, 25, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
		qdel(src)
	else
		. = ..()
		if(!QDELETED(src))
			disarm()

//ditto, but armed.
/obj/item/explosive/mine/confetti/active
	icon_state = "m20_active"
	base_icon_state = "m20"
	map_deployed = TRUE

/obj/item/explosive/mine/pmc
	name = "\improper M20P Claymore anti-personnel mine"
	desc = "The M20P Claymore is a directional anti-personnel smart mine modified for corporate PMC use. Generates 120 degree cone of shrapnel if a valid target crosses before or over it. On its face, it reads \"FRONT TOWARD ENEMY\"."
	icon_state = "m20p"
	iff_signal = FACTION_PMC
	hard_iff_lock = TRUE

/obj/item/explosive/mine/pmc/active
	icon_state = "m20p_active"
	base_icon_state = "m20p"
	map_deployed = TRUE

//low lethality claymore the second, PMC version
/obj/item/explosive/mine/pmc/confetti

/obj/item/explosive/mine/pmc/confetti/prime()
	set waitfor = 0

	if(!customizable)
		create_shrapnel(loc, 15, dir, angle, /datum/ammo/bullet/shrapnel/claymore/confetti, cause_data, def_zones = MOVEMENT_LIMBS)
		// low lethality edition
		cell_explosion(loc, 60, 25, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
		qdel(src)
	else
		. = ..()
		if(!QDELETED(src))
			disarm()

/obj/item/explosive/mine/custom
	name = "custom mine"
	desc = "A custom chemical mine built from an M20 casing."
	icon_state = "m20_custom"
	customizable = TRUE
	matter = list("metal" = 3750)
	has_blast_wave_dampener = TRUE

/obj/item/explosive/mine/sharp
	name = "\improper P9 SHARP explosive dart"
	desc = "An experimental P9 SHARP proximity triggered explosive dart designed by Armat Systems for use by the United States Colonial Marines. This one has full 360 detection range."
	icon_state = "sonicharpoon_g"
	angle = 360
	var/disarmed = FALSE
	var/explosion_size = 200
	var/explosion_falloff = 100

/obj/item/explosive/mine/sharp/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/sharp/attackby(obj/item/W, mob/user)
	return

/obj/item/explosive/mine/sharp/set_tripwire()
	if(!active && !tripwire)
		for(var/direction in CARDINAL_ALL_DIRS)
			var/tripwire_loc = get_turf(get_step(loc,direction))
			tripwire = new(tripwire_loc)
			tripwire.linked_claymore = src
			active = TRUE

/obj/item/explosive/mine/sharp/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	cell_explosion(loc, explosion_size, explosion_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/weapons/gun_sharp_explode.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/sharp/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	icon_state = base_icon_state + "_disarmed"
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/sharp/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/sharp/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/sharp/attack_alien()
	if(disarmed)
		..()
	else
		return
/obj/item/explosive/mine/sebb
	name = "\improper G2 Electroshock grenade"
	icon_state = "grenade_sebb_planted"
	desc = "A G2 electroshock grenade planted as a landmine."
	pixel_y = -5
	anchored = TRUE // this is supposed to be planeted already when spawned

/obj/item/explosive/mine/sebb/disarm()
	. = ..()
	new /obj/item/explosive/grenade/sebb(get_turf(src))
	qdel(src)

/obj/item/explosive/mine/sebb/prime()
	new /obj/item/explosive/grenade/sebb/primed(get_turf(src))
	qdel(src)

/obj/item/explosive/mine/sebb/active
	icon_state = "grenade_sebb_planted_active"
	base_icon_state = "grenade_sebb"
	map_deployed = TRUE
