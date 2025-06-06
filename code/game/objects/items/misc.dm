/obj/item/bananapeel
	name = "banana peel"
	desc = "A peel from a banana."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "banana_peel"
	item_state = "banana_peel"
	w_class = SIZE_TINY
	throwforce = 0
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	garbage = TRUE

/obj/item/bananapeel/Crossed(AM as mob|obj)
	if (iscarbon(AM))
		var/mob/living/carbon/C = AM
		C.slip(name, 4, 2)

/*
/obj/item/game_kit
	name = "Gaming Kit"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "game_kit"
	var/selected = null
	var/board_stat = null
	var/data = ""
	var/base_url = "http://svn.slurm.us/public/spacestation13/misc/game_kit"
	item_state = "sheet-metal"
	w_class = SIZE_HUGE
*/

/obj/item/gift
	name = "gift"
	desc = "A wrapped item."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "gift3"
	var/size = 3
	var/obj/item/gift = null
	item_state = "gift"
	w_class = SIZE_LARGE

/obj/item/weapon/pole
	name = "wooden pole"
	desc = "A rough, cracked pole seemingly constructed on the field. You could probably whack someone with this."
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "wooden_pole"
	item_state = "wooden_pole"
	force = 20
	attack_speed = 1.5 SECONDS
	var/gripped = FALSE

/obj/item/weapon/pole/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("Activate on your hand to grip this tightly. Useful if you have a bad leg.")

/obj/item/weapon/pole/attack_self(mob/living/user)
	..()
	if(!gripped)
		user.visible_message(SPAN_NOTICE("[user] grips [src] tightly."), SPAN_NOTICE("You grip [src] tightly."))
		flags_item |= NODROP|FORCEDROP_CONDITIONAL
		ADD_TRAIT(user, TRAIT_HOLDS_CANE, TRAIT_SOURCE_ITEM)
		user.AddComponent(/datum/component/footstep, 6, 35, 4, 1, "cane_step")
		gripped = TRUE
	else
		user.visible_message(SPAN_NOTICE("[user] loosens \his grip on [src]."), SPAN_NOTICE("You loosen your grip on [src]."))
		flags_item &= ~(NODROP|FORCEDROP_CONDITIONAL)
		REMOVE_TRAIT(user, TRAIT_HOLDS_CANE, TRAIT_SOURCE_ITEM)
		// Ideally, this would be something like a component added onto every mob that prioritizes certain sounds, such as stomping over canes.
		var/component = user.GetComponent(/datum/component/footstep)
		qdel(component)
		// However, I'm not going to do that. :)
		gripped = FALSE

/obj/item/weapon/pole/pickup(mob/user, silent)
	. = ..()
	gripped = FALSE
	REMOVE_TRAIT(user, TRAIT_HOLDS_CANE, TRAIT_SOURCE_ITEM) // no fucking around with two canes
	var/component = user.GetComponent(/datum/component/footstep)
	qdel(component)

/obj/item/weapon/pole/dropped(mob/user)
	. = ..()
	gripped = FALSE
	REMOVE_TRAIT(user, TRAIT_HOLDS_CANE, TRAIT_SOURCE_ITEM) // in case their arm is chopped off or something
	var/component = user.GetComponent(/datum/component/footstep)
	qdel(component)

/obj/item/weapon/pole/wooden_cane
	name = "wooden cane"
	desc = "A bog standard wooden cane with a dark tip."
	icon_state = "wooden_cane"
	item_state = "wooden_cane"
	force = 15

/obj/item/weapon/pole/fancy_cane
	name = "fancy cane"
	desc = "An ebony cane with a fancy, seemingly-golden tip."
	icon_state = "fancy_cane"
	item_state = "fancy_cane"
	force = 30

/obj/item/weapon/pole/fancy_cane/this_is_a_knife
	name = "fancy cane"
	desc = "An ebony cane with a fancy, seemingly-golden tip. Feels hollow to the touch."
	force = 15 // hollow
	var/obj/item/stored_item
	var/list/allowed_items = list(/obj/item/weapon, /obj/item/attachable/bayonet)

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/Destroy()
	if(stored_item)
		QDEL_NULL(stored_item)
	. = ..()

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/attack_hand(mob/living/mobber)
	if(stored_item && src.loc == mobber && !mobber.is_mob_incapacitated()) //Only allow someone to take out the stored_item if it's being worn or held. So you can pick them up off the floor
		if(mobber.put_in_active_hand(stored_item))
			mobber.visible_message(SPAN_DANGER("[mobber] slides [stored_item] out of [src]!"), SPAN_NOTICE("You slide [stored_item] out of [src]."))
			playsound(mobber, 'sound/weapons/gun_shotgun_shell_insert.ogg', 15, TRUE)
			stored_item = null
			update_icon()
		return
	..()

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/update_icon()
	if(stored_item == null)
		icon_state = initial(icon_state) + "_open"
	else
		icon_state = initial(icon_state)

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/attackby(obj/item/object, mob/living/mobber)
	if(length(allowed_items))
		for (var/i in allowed_items)
			if(istype(object, i))
				if(stored_item)
					return
				stored_item = object
				mobber.drop_inv_item_to_loc(object, src)
				to_chat(mobber, SPAN_NOTICE("You slide [object] into [src]."))
				playsound(mobber, 'sound/weapons/gun_shotgun_shell_insert.ogg', 15, TRUE)
				update_icon()
				break
	. = ..()

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/machete
	stored_item = new /obj/item/weapon/sword/machete

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/ceremonial_sword
	stored_item = new /obj/item/weapon/sword/ceremonial

/obj/item/weapon/pole/fancy_cane/this_is_a_knife/katana
	stored_item = new /obj/item/weapon/sword/katana

// IN SHOTGUNS.DM!!

/*obj/item/weapon/pole/fancy_cane/gun
	name = "fancy cane"
	desc = "An ebony cane with a fancy, seemingly-golden tip. Feels hollow to the touch."
	force = 15 // hollow
*/

/obj/item/research//Makes testing much less of a pain -Sieve
	name = "research"
	icon = 'icons/obj/items/stock_parts.dmi'
	icon_state = "capacitor"
	desc = "A debug item for research."

/obj/item/moneybag
	icon = 'icons/obj/items/storage/bags.dmi'
	name = "Money bag"
	icon_state = "moneybag"
	force = 10
	throwforce = 2
	w_class = SIZE_LARGE





/obj/item/evidencebag
	name = "evidence bag"
	desc = "An empty evidence bag."
	icon = 'icons/obj/items/storage/bags.dmi'
	icon_state = "evidenceobj"
	item_state = ""
	w_class = SIZE_SMALL
	var/obj/item/stored_item = null

/obj/item/evidencebag/MouseDrop(obj/item/I as obj)
	if (!ishuman(usr))
		return

	var/mob/living/carbon/human/user = usr

	if (!(user.l_hand == src || user.r_hand == src))
		return //bag must be in your hands to use

	if (isturf(I.loc))
		if (!user.Adjacent(I))
			return
	else
		//If it isn't on the floor. Do some checks to see if it's in our hands or a box. Otherwise give up.
		if(istype(I.loc,/obj/item/storage)) //in a container.
			var/depth = I.get_storage_depth_to(user)
			if (!depth || depth > 2)
				return //too deeply nested to access or not being carried by the user.

			var/obj/item/storage/U = I.loc
			user.client.remove_from_screen(I)
			U.contents.Remove(I)
		else if(user.l_hand == I) //in a hand
			user.drop_l_hand()
		else if(user.r_hand == I) //in a hand
			user.drop_r_hand()
		else
			return

	if(!istype(I) || I.anchored)
		return

	if(istype(I, /obj/item/evidencebag))
		to_chat(user, SPAN_NOTICE("You find putting an evidence bag in another evidence bag to be slightly absurd."))
		return

	if(I.w_class > SIZE_MEDIUM)
		to_chat(user, SPAN_NOTICE("[I] won't fit in [src]."))
		return

	if(length(contents))
		to_chat(user, SPAN_NOTICE("[src] already has something inside it."))
		return

	user.visible_message("[user] puts [I] into [src]", "You put [I] inside [src].",\
	"You hear a rustle as someone puts something into a plastic bag.")

	icon_state = "evidence"
	/// save the offset of the item
	var/xx = I.pixel_x
	var/yy = I.pixel_y
	/// then remove it so it'll stay within the evidence bag
	I.pixel_x = 0
	I.pixel_y = 0
	/// take a snapshot. (necessary to stop the underlays appearing under our inventory-HUD slots) ~Carn
	var/image/img = image("icon"=I, "layer"=FLOAT_LAYER)
	/// and then return it
	I.pixel_x = xx
	I.pixel_y = yy
	overlays += img
	/// should look nicer for transparent stuff. not really that important, but hey.
	overlays += "evidence"

	desc = "An evidence bag containing [I]."
	I.forceMove(src)
	stored_item = I
	w_class = I.w_class
	return


/obj/item/evidencebag/attack_self(mob/user)
	..()

	if(length(contents))
		var/obj/item/I = contents[1]
		user.visible_message("[user] takes [I] out of [src]", "You take [I] out of [src].",\
		"You hear someone rustle around in a plastic bag, and remove something.")
		overlays.Cut() //remove the overlays

		user.put_in_hands(I)
		stored_item = null

		w_class = initial(w_class)
		icon_state = "evidenceobj"
		desc = "An empty evidence bag."
	else
		to_chat(user, "[src] is empty.")
		icon_state = "evidenceobj"
	return

/obj/item/evidencebag/get_examine_text(mob/user)
	. = ..()
	if(stored_item)
		. += stored_item.get_examine_text(user)

/obj/item/storage/box/evidence
	name = "evidence bag box"
	desc = "A box claiming to contain evidence bags."

/obj/item/storage/box/evidence/New()
	..()
	new /obj/item/evidencebag(src)
	new /obj/item/evidencebag(src)
	new /obj/item/evidencebag(src)
	new /obj/item/evidencebag(src)
	new /obj/item/evidencebag(src)
	new /obj/item/evidencebag(src)

/obj/item/parachute
	name = "parachute"
	desc = "A surprisingly small yet bulky pack with just enough safety straps to make RnD pass health and safety. The label says the pack comes with two parachutes - main and reserve, but you doubt the pack can fit even one."
	icon = 'icons/obj/items/clothing/backpacks.dmi'
	icon_state = "parachute_pack"
	item_state = "parachute_pack"
	w_class = SIZE_MASSIVE
	flags_equip_slot = SLOT_BACK
	flags_item = SMARTGUNNER_BACKPACK_OVERRIDE

/obj/item/rappel_harness
	name = "rappel harness"
	desc = "A simple, uncomfortable rappel harness with just enough safety straps to make RnD pass health and safety. It comes with an in-built descender, but has no pouches for ammunition."
	icon = 'icons/obj/items/clothing/belts.dmi'
	icon_state = "rappel_harness"
	item_state = "rappel_harness"
	w_class = SIZE_MASSIVE
	flags_equip_slot = SLOT_WAIST

/obj/item/rappel_harness/extract
	name = "dual purpose rappel-fulton harness"
	desc = "A fulton Surface To Air Recovery System (STARS). Special latch/hook assembly allows for aircraft on flyby equipped with a rappel system to pick up the attached item or person. The complex assembly of venlar rigging and secured buckles takes some time to set up though."
	icon_state = "rappel_harness_adv"
	var/shuttle_id
	actions_types = list(/datum/action/item_action/STARS)

/obj/item/rappel_harness/extract/proc/try_extract(mob/living/carbon/human/user)
	var/obj/docking_port/mobile/marine_dropship/shuttle = SSshuttle.getShuttle(shuttle_id)

	if(!shuttle)
		return

	if(!shuttle.in_flyby)
		to_chat(user, SPAN_WARNING("No shuttle detected in lower orbit, aborting extraction."))
		return

	var/obj/structure/dropship_equipment/paradrop_system/rapsys = locate() in shuttle.equipments
	if(!rapsys)
		to_chat(user, SPAN_WARNING("No rappel system detected in shuttle, aborting extraction."))
		return

	user.visible_message(SPAN_DANGER("[user] gets snatched off the ground with a tremendous force!"))
	if(prob(50))
		user.emote("scream")
	user.apply_effect(10, STUN)
	animate(user, time = 2, pixel_x = 360, pixel_y = 360, flags = ANIMATION_PARALLEL)
	playsound(user,'sound/effects/bamf.ogg', 50, 1)
	addtimer(CALLBACK(src, PROC_REF(on_extract), user, rapsys), 1.5 SECONDS)

/obj/item/rappel_harness/extract/attack(mob/living/carbon/human/H, mob/living/carbon/human/user)
	if(H.belt)
		to_chat(user, SPAN_WARNING("Remove their belt first!"))
		return

	if(!is_ground_level(H.z))
		return

	var/area/location_area = get_area(H)
	if(CEILING_IS_PROTECTED(location_area.ceiling, CEILING_PROTECTION_TIER_1))
		to_chat(H, SPAN_WARNING("There's no space for fulton balloon to fly in this area."))
		return

	user.visible_message(SPAN_DANGER("[user] begins to adjust the fulton device on [H] for extraction!"))
	playsound(H, 'sound/items/fulton.ogg', 50, 1)
	if(!do_after(user, (10 SECONDS), INTERRUPT_ALL, BUSY_ICON_HOSTILE, H))
		return

	if(H.belt)
		to_chat(user, SPAN_WARNING("Remove their belt!"))
		return
	user.drop_inv_item_to_loc(src, H)
	H.equip_to_slot_if_possible(src, WEAR_WAIST)
	try_extract(H)

/obj/item/rappel_harness/extract/proc/on_extract(mob/living/carbon/human/user, obj/structure/dropship_equipment/paradrop_system/system)
	flick("rappel_hatch_opening", system)
	user.pixel_x = 0
	user.pixel_y = 0
	user.forceMove(get_turf(system))
	user.apply_effect(5, WEAKEN)
	if(prob(25))
		user.do_vomit()

/datum/action/item_action/STARS/New(Target, obj/item/holder)
	. = ..()
	name = "Attempt Extraction"
	action_icon_state = "extract"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/STARS/action_activate()
	. = ..()
	var/obj/item/rappel_harness/extract/harness = holder_item
	var/mob/living/carbon/human/H = usr
	if(H.belt != harness)
		to_chat(H, SPAN_WARNING("You have to equip the harness on your belt!"))
		return
	if(!is_ground_level(H.z))
		return

	var/area/location_area = get_area(H)
	if(CEILING_IS_PROTECTED(location_area.ceiling, CEILING_PROTECTION_TIER_1))
		to_chat(H, SPAN_WARNING("There's no space for fulton balloon to fly in this area."))
		return
	H.visible_message(SPAN_DANGER("[H] begins to adjust the fulton device for self-extraction!"))
	playsound(H, 'sound/items/fulton.ogg', 50, 1)
	if(!do_after(H, (10 SECONDS), INTERRUPT_ALL, BUSY_ICON_HOSTILE, harness))
		return

	harness.try_extract(H)

/obj/item/rappel_harness/extract/midway
	shuttle_id = DROPSHIP_MIDWAY

/obj/item/rappel_harness/extract/cyclone
	shuttle_id = DROPSHIP_CYCLONE

/obj/item/rappel_harness/extract/typhoon
	shuttle_id = DROPSHIP_TYPHOON

/obj/item/rappel_harness/extract/tornado
	shuttle_id = DROPSHIP_TORNADO

/obj/item/rappel_harness/extract/tripoli
	shuttle_id = DROPSHIP_TRIPOLI

/obj/item/rappel_harness/extract/alamo
	shuttle_id = DROPSHIP_ALAMO

/obj/item/rappel_harness/extract/normandy
	shuttle_id = DROPSHIP_NORMANDY

/obj/item/rappel_harness/extract/somme
	shuttle_id = DROPSHIP_SOMME

/obj/item/rappel_harness/extract/bastogne
	shuttle_id = DROPSHIP_BASTOGNE

/obj/item/rappel_harness/extract/nauk
	shuttle_id = DROPSHIP_UPP
