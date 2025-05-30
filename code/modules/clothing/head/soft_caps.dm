/obj/item/clothing/head/soft
	name = "cargo cap"
	desc = "It's a baseball hat in a tasteless yellow color."
	icon_state = "cargosoft"
	flags_inventory = COVEREYES
	item_state = "helmet"
	var/cap_color = "cargo"
	var/flipped = 0
	siemens_coefficient = 0.9
	flags_armor_protection = 0

/obj/item/clothing/head/soft/dropped()
	icon_state = "[cap_color]soft"
	flipped=0
	..()

/obj/item/clothing/head/soft/verb/flip()
	set category = "Object"
	set name = "Flip cap"
	set src in usr
	if(!usr.is_mob_incapacitated())
		src.flipped = !src.flipped
		if(src.flipped)
			icon_state = "[cap_color]soft_flipped"
			to_chat(usr, "You flip the hat backwards.")
		else
			icon_state = "[cap_color]soft"
			to_chat(usr, "You flip the hat back in normal position.")
		update_clothing_icon() //so our mob-overlays update

/obj/item/clothing/head/soft/red
	name = "red cap"
	desc = "It's a baseball hat in a tasteless red color."
	icon_state = "redsoft"
	cap_color = "red"

/obj/item/clothing/head/soft/blue
	name = "blue cap"
	desc = "It's a baseball hat in a tasteless blue color."
	icon_state = "bluesoft"
	cap_color = "blue"

/obj/item/clothing/head/soft/green
	name = "green cap"
	desc = "It's a baseball hat in a tasteless green color."
	icon_state = "greensoft"
	cap_color = "green"

/obj/item/clothing/head/soft/yellow
	name = "yellow cap"
	desc = "It's a baseball hat in a tasteless yellow color."
	icon_state = "yellowsoft"
	cap_color = "yellow"

/obj/item/clothing/head/soft/grey
	name = "grey cap"
	desc = "It's a baseball hat in a tasteful grey color."
	icon_state = "greysoft"
	cap_color = "grey"

/obj/item/clothing/head/soft/orange
	name = "orange cap"
	desc = "It's a baseball hat in a tasteless orange color."
	icon_state = "orangesoft"
	cap_color = "orange"

/obj/item/clothing/head/soft/mime
	name = "white cap"
	desc = "It's a baseball hat in a tasteless white color."
	icon_state = "mimesoft"
	cap_color = "mime"

/obj/item/clothing/head/soft/purple
	name = "purple cap"
	desc = "It's a baseball hat in a tasteless purple color."
	icon_state = "purplesoft"
	cap_color = "purple"

/obj/item/clothing/head/soft/rainbow
	name = "rainbow cap"
	desc = "It's a baseball hat in a bright rainbow of colors."
	icon_state = "rainbowsoft"
	cap_color = "rainbow"

/obj/item/clothing/head/soft/ferret
	name = "\improper Ferret Heavy Industries trucker hat"
	desc = "It's a trucker hat. They're becoming collector items since Ferret went under in 2180."
	icon_state = "ferretsoft"
	cap_color = "ferret"
	black_market_value = 25

/obj/item/clothing/head/soft/trucker
	name = "\improper blue trucker hat"
	desc = "It's a blue trucker hat."
	icon_state = "truckercap_bluesoft"
	cap_color = "truckercap_blue"

/obj/item/clothing/head/soft/trucker/red
	name = "\improper red trucker hat"
	desc = "It's a red trucker hat."
	icon_state = "truckercap_redsoft"
	cap_color = "truckercap_red"

/obj/item/clothing/head/soft/sec
	name = "security cap"
	desc = "It's baseball hat in tasteful red color."
	icon_state = "secsoft"
	cap_color = "sec"

/obj/item/clothing/head/cmcap/wy_cap
	name = "\improper Weyland-Yutani cap"
	desc = "A dark cap enscribed with the Weyland-Yutani 'Wings' logo, representing corporate justice."
	icon = 'icons/obj/items/clothing/hats.dmi'
	icon_state = "newcorpo_cap"
	item_state = "newcorpo_cap"
	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = NO_FLAGS
	flags_atom = FPRINT

/obj/item/clothing/head/soft/sec/corp
	name = "corporate security cap"
	desc = "It's baseball hat in corporate colors."
	icon_state = "corpsoft"
	cap_color = "corp"



//marine cap

/obj/item/clothing/head/soft/marine
	name = "marine sergeant cap"
	desc = "It's a soft cap made from advanced ballistic-resistant fibres. Fails to prevent lumps in the head."
	icon_state = "greysoft"
	cap_color = "grey"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_inventory = BLOCKSHARPOBJ

/obj/item/clothing/head/soft/marine/alpha
	name = "alpha squad sergeant cap"
	icon_state = "redsoft"
	cap_color = "red"

/obj/item/clothing/head/soft/marine/beta
	name = "beta squad sergeant cap"
	icon_state = "yellowsoft"
	cap_color = "yellow"

/obj/item/clothing/head/soft/marine/charlie
	name = "charlie squad sergeant cap"
	icon_state = "purplesoft"
	cap_color = "purple"

/obj/item/clothing/head/soft/marine/delta
	name = "delta squad sergeant cap"
	icon_state = "bluesoft"
	cap_color = "blue"

/obj/item/clothing/head/soft/marine/mp
	name = "marine police sergeant cap"
	icon_state = "greensoft"
	cap_color = "green"
