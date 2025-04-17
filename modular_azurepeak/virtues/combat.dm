/datum/virtue/combat/magical_potential
	name = "Arcyne Potential"
	desc = "I grasped the basics of arcyne magic at an early age, and have been able to prestidigitate for as long as I can remember."
	added_skills = list(/datum/skill/magic/arcane = 1)

/datum/virtue/combat/magical_potential/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
		recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

	var/skill_level = recipient.mind?.get_skill_level(/datum/skill/magic/arcane)
	if (skill_level == 0) // we can do this because apply_to is always called first
		recipient.mind?.adjust_spellpoints(-6) // no martial-arcyne for you - not the intent of this virtue!
	if (skill_level >= 1)
		if (!HAS_TRAIT(recipient, TRAIT_MEDIUMARMOR) && !HAS_TRAIT(recipient, TRAIT_HEAVYARMOR) && !HAS_TRAIT(recipient, TRAIT_DODGEEXPERT))
			recipient.mind?.adjust_spellpoints(1) // 1 extra spellpoint if you're already arcane
		else
			to_chat(recipient, span_notice("I'm too trained in defensive tactics for my Virtue to benefit my spell knowledge any further."))

/datum/virtue/combat/devotee
	name = "Devotee"
	desc = "Though not officially of the Church, my relationship with my chosen Patron is strong enough to grant me the most minor of their blessings."
	added_skills = list(/datum/skill/magic/holy = 1)

/datum/virtue/combat/devotee/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind)
		return
	if (!recipient.devotion)
		// only give non-devotionists orison... and t0 for some reason (this is probably a bad idea)
		var/datum/devotion/new_faith = new /datum/devotion(recipient, recipient.patron)
		var/datum/patron/our_patron = new_faith.patron
		new_faith.max_devotion = CLERIC_REQ_1 - 20
		new_faith.max_progression = CLERIC_REQ_1 - 20
		recipient.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
		recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/orison)
		if (!HAS_TRAIT(recipient, TRAIT_MEDIUMARMOR) && !HAS_TRAIT(recipient, TRAIT_HEAVYARMOR) && !HAS_TRAIT(recipient, TRAIT_DODGEEXPERT) && !HAS_TRAIT(recipient, TRAIT_CRITICAL_RESISTANCE))
			recipient.mind?.AddSpell(new our_patron.t0)
	else
		// for devotionists, bump up their maximum 1 tier and give them a TINY amount of passive devo gain
		var/datum/devotion/our_faith = recipient.devotion
		our_faith.passive_devotion_gain += 0.15
		switch (our_faith.max_progression)
			if (CLERIC_REQ_0)
				our_faith.max_progression = CLERIC_REQ_1
			if (CLERIC_REQ_1)
				our_faith.max_progression = CLERIC_REQ_2
			if (CLERIC_REQ_2)
				our_faith.max_progression = CLERIC_REQ_3
			if (CLERIC_REQ_3)
				our_faith.max_progression = CLERIC_REQ_4
			if (CLERIC_REQ_4)
				our_faith.passive_devotion_gain += 1

/datum/virtue/combat/duelist
	name = "Duelist Apprentice"
	desc = "I have trained under a duelist of considerable skill, and always have my trusty rapier close at hand."
	custom_text = "+1 to Swords and Knives, Up to Journeyman, Minimum Apprentice."
	added_stashed_items = list("Rapier" = /obj/item/rogueweapon/sword/rapier)

/datum/virtue/combat/duelist/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/swords) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/swords, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/knives) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else	
		added_skills = list(list(/datum/skill/combat/knives, 1, 3))
		handle_skills(recipient)
	
/datum/virtue/combat/militia
	name = "Militiaman Apprentice"
	desc = "I have trained under a skilled militiaman, and always have my trusty billhook close at hand."
	custom_text = "+1 to Maces and Polearms, Up to Journeyman, Minimum Apprentice."
	added_stashed_items = list("Billhook" = /obj/item/rogueweapon/spear/billhook)

/datum/virtue/combat/militia/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/polearms) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/polearms, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/maces) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/maces, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/brawler
	name = "Brawler Apprentice"
	desc = "I have trained under a skilled brawler, and have some experience fighting with my fists."
	custom_text = "+1 to Unarmed and Wrestling, Up to Journeyman, Minimum Apprentice."
	added_stashed_items = list("Katar" = /obj/item/rogueweapon/katar)
	
/datum/virtue/combat/brawler/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/unarmed) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/unarmed, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/wrestling) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/wrestling, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/archer
	name = "Archer's Apprentice"
	desc = "I have trained under a skilled archer, and always have my trusty bow close at hand."
	custom_text = "+1 to bows and crossbows, Up to Journeyman, Minimum Apprentice."
	added_stashed_items = list("Recurve Bow" = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve,
								"Quiver (Arrows)" = /obj/item/quiver/arrows)

/datum/virtue/combat/archer/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/bows) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/bows, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/crossbows) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/crossbows, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/crossbows, 1, 3))
		handle_skills(recipient)


/datum/virtue/combat/axeman
	name = "Warden's Apprentice"
	desc = "I have studied underneath an axeman of considerable skill, and always have my axe close to hand and have some basic tracking ability."
	custom_text = "Increases axe skill by 1, minimum apprentice. Increases tracking by 1, minimum apprentice. Capped at journeyman."
	added_stashed_items = list("Iron Axe" = /datum/supply_pack/rogue/weapons/axe,
								)
/datum/virtue/combat/archer/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/axes) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/axes, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/misc/tracking) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/misc/tracking, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/misc/tracking, 1, 3))
		handle_skills(recipient)


/*/datum/virtue/combat/tavern_brawler
	name = "Tavern Brawler"
	desc = "I've never met a problem my fists couldn't solve."
	added_traits = list(TRAIT_CIVILIZEDBARBARIAN)*/

/datum/virtue/combat/guarded
	name = "Guarded"
	desc = "I have long kept my true capabilities a secret. Sometimes being deceptively weak can save one's life."
	added_traits = list(TRAIT_DECEIVING_MEEKNESS)

/datum/virtue/combat/impervious
	name = "Impervious"
	desc = "I've spent years shoring up my weakspots, and have become difficult to wound with critical blows."
	added_traits = list(TRAIT_CRITICAL_RESISTANCE)

/datum/virtue/combat/rotcured
	name = "Rotcured"
	desc = "I was once afflicted with the accursed rot, and was cured. It has left me changed: my limbs are weaker, but I feel no pain and have no need to breathe..."
	// below is functionally equivalent to dying and being resurrected via astrata T4 - yep, this is what it gives you.
	added_traits = list(TRAIT_EASYDISMEMBER, TRAIT_NOPAIN, TRAIT_NOPAINSTUN, TRAIT_NOBREATH, TRAIT_TOXIMMUNE, TRAIT_ZOMBIE_IMMUNE, TRAIT_ROTMAN)

/datum/virtue/combat/rotcured/apply_to_human(mob/living/carbon/human/recipient)
	recipient.update_body() // applies the rot skin tone stuff
