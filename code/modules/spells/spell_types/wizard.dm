/obj/effect/proc_holder/spell/targeted/projectile/magic_missile
	name = "Magic Missile"
	desc = ""

	school = "evocation"
	charge_max = 200
	invocation = "FORTI GY AMA"
	invocation_type = "shout"
	range = 7
	cooldown_min = 60 //35 deciseconds reduction per rank
	max_targets = 0
	proj_type = /obj/projectile/magic/spell/magic_missile
	action_icon_state = "magicm"
	sound = 'sound/blank.ogg'

/obj/projectile/magic/spell/magic_missile
	name = "magic missile"
	icon_state = "magicm"
	range = 20
	speed = 5
	trigger_range = 0
	linger = TRUE
	nodamage = FALSE
	paralyze = 60
	hitsound = 'sound/blank.ogg'

	trail = TRUE
	trail_lifespan = 5
	trail_icon_state = "magicmd"

/obj/projectile/magic/spell/magic_missile/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK

/obj/effect/proc_holder/spell/targeted/genetic/mutate
	name = "Mutate"
	desc = ""

	school = "transmutation"
	charge_max = 400
	invocation = "BIRUZ BENNAR"
	invocation_type = "shout"
	range = -1
	include_user = TRUE

	mutations = list(LASEREYES, HULK)
	duration = 300
	cooldown_min = 300 //25 deciseconds reduction per rank

	action_icon_state = "mutate"
	sound = 'sound/blank.ogg'


/obj/effect/proc_holder/spell/targeted/smoke
	name = "Smoke"
	desc = ""

	school = "conjuration"
	charge_max = 120
	clothes_req = FALSE
	invocation = "none"
	invocation_type = "none"
	range = -1
	include_user = TRUE
	cooldown_min = 20 //25 deciseconds reduction per rank

	smoke_spread = 2
	smoke_amt = 4

	action_icon_state = "smoke"


/obj/effect/proc_holder/spell/targeted/smoke/lesser //Chaplain smoke book
	name = "Smoke"
	desc = ""

	school = "conjuration"
	charge_max = 360
	clothes_req = FALSE
	invocation = "none"
	invocation_type = "none"
	range = -1
	include_user = TRUE

	smoke_spread = 1
	smoke_amt = 2

	action_icon_state = "smoke"

/obj/effect/proc_holder/spell/targeted/emplosion/disable_tech
	name = "Disable Tech"
	desc = ""
	charge_max = 400
	invocation = "NEC CANTIO"
	invocation_type = "shout"
	range = -1
	include_user = TRUE
	cooldown_min = 200 //50 deciseconds reduction per rank

	emp_heavy = 6
	emp_light = 10
	sound = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/targeted/turf_teleport/blink
	name = "Blink"
	desc = ""

	school = "abjuration"
	charge_max = 20
	invocation = "none"
	invocation_type = "none"
	range = -1
	include_user = TRUE
	cooldown_min = 5 //4 deciseconds reduction per rank


	smoke_spread = 1
	smoke_amt = 0

	inner_tele_radius = 0
	outer_tele_radius = 6

	action_icon_state = "blink"
	sound1 = 'sound/blank.ogg'
	sound2 = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/targeted/turf_teleport/blink/cult
	name = "quickstep"

	charge_max = 100

/obj/effect/proc_holder/spell/targeted/area_teleport/teleport
	name = "Teleport"
	desc = ""

	school = "abjuration"
	charge_max = 600
	invocation = "SCYAR NILA"
	invocation_type = "shout"
	range = -1
	include_user = TRUE
	cooldown_min = 200 //100 deciseconds reduction per rank
	action_icon_state = "teleport"

	smoke_spread = 1
	smoke_amt = 2
	sound1 = 'sound/blank.ogg'
	sound2 = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/targeted/area_teleport/teleport/santa
	name = "Santa Teleport"

	invocation = "HO HO HO"
	clothes_req = FALSE
	say_destination = FALSE // Santa moves in mysterious ways

/obj/effect/proc_holder/spell/aoe_turf/timestop
	name = "Stop Time"
	desc = ""
	charge_max = 500
	invocation = "TOKI YO TOMARE"
	invocation_type = "shout"
	range = 0
	cooldown_min = 100
	action_icon_state = "time"
	var/timestop_range = 2
	var/timestop_duration = 100

/obj/effect/proc_holder/spell/aoe_turf/timestop/cast(list/targets, mob/user = usr)
	new /obj/effect/timestop/magic(get_turf(user), timestop_range, timestop_duration, list(user))

/obj/effect/proc_holder/spell/aoe_turf/conjure/carp
	name = "Summon Carp"
	desc = ""

	school = "conjuration"
	charge_max = 1200
	invocation = "NOUK FHUNMM SACP RISSKA"
	invocation_type = "shout"
	range = 1

	summon_type = list(/mob/living/simple_animal/hostile/carp)
	cast_sound = 'sound/blank.ogg'


/obj/effect/proc_holder/spell/aoe_turf/conjure/construct
	name = "Artificer"
	desc = ""

	school = "conjuration"
	charge_max = 600
	clothes_req = FALSE
	invocation = "none"
	invocation_type = "none"
	range = 0

	summon_type = list(/obj/structure/constructshell)

	action_icon_state = "artificer"
	cast_sound = 'sound/blank.ogg'


/obj/effect/proc_holder/spell/aoe_turf/conjure/creature
	name = "Summon Creature Swarm"
	desc = ""

	school = "conjuration"
	charge_max = 1200
	clothes_req = FALSE
	invocation = "IA IA"
	invocation_type = "shout"
	summon_amt = 10
	range = 3

	summon_type = list(/mob/living/simple_animal/hostile/netherworld)
	cast_sound = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/targeted/trigger/blind
	name = "Blind"
	desc = ""

	school = "transmutation"
	charge_max = 300
	clothes_req = FALSE
	invocation = "STI KALY"
	invocation_type = "whisper"
	message = span_notice("My eyes cry out in pain!")
	cooldown_min = 50 //12 deciseconds reduction per rank

	starting_spells = list("/obj/effect/proc_holder/spell/targeted/inflict_handler/blind","/obj/effect/proc_holder/spell/targeted/genetic/blind")

	action_icon_state = "blind"

/obj/effect/proc_holder/spell/aoe_turf/conjure/creature/cult
	name = "Summon Creatures (DANGEROUS)"
	charge_max = 5000
	summon_amt = 2



/obj/effect/proc_holder/spell/targeted/inflict_handler/blind
	amt_eye_blind = 10
	amt_eye_blurry = 20
	sound = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/targeted/genetic/blind
	mutations = list(BLINDMUT)
	duration = 300
	charge_max = 400 // needs to be higher than the duration or it'll be permanent
	sound = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/aoe_turf/repulse
	name = "Repulse"
	desc = ""
	charge_max = 400
	invocation = "GITTAH WEIGH"
	invocation_type = "shout"
	range = 5
	cooldown_min = 150
	selection_type = "view"
	sound = 'sound/blank.ogg'
	var/maxthrow = 5
	var/sparkle_path = /obj/effect/temp_visual/gravpush
	var/anti_magic_check = TRUE
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

	action_icon_state = "repulse"

/obj/effect/proc_holder/spell/aoe_turf/repulse/cast(list/targets,mob/user = usr, stun_amt = 40)
	var/list/thrownatoms = list()
	var/atom/throwtarget
	var/distfromcaster
	playMagSound()
	for(var/turf/T in targets) //Done this way so things don't get thrown all around hilariously.
		for(var/atom/movable/AM in T)
			thrownatoms += AM

	for(var/am in thrownatoms)
		var/atom/movable/AM = am
		if(AM == user || AM.anchored)
			continue

		if(ismob(AM))
			var/mob/M = AM
			if(M.anti_magic_check(anti_magic_check, FALSE))
				continue

		throwtarget = get_edge_target_turf(user, get_dir(user, get_step_away(AM, user)))
		distfromcaster = get_dist(user, AM)
		if(distfromcaster == 0)
			if(isliving(AM))
				var/mob/living/M = AM
				M.Paralyze(100)
				M.adjustBruteLoss(5)
				to_chat(M, span_danger("You're slammed into the floor by [user]!"))
		else
			new sparkle_path(get_turf(AM), get_dir(user, AM)) //created sparkles will disappear on their own
			if(isliving(AM))
				var/mob/living/M = AM
				M.Paralyze(stun_amt)
				to_chat(M, span_danger("You're thrown back by [user]!"))
			AM.safe_throw_at(throwtarget, ((CLAMP((maxthrow - (CLAMP(distfromcaster - 2, 0, distfromcaster))), 3, maxthrow))), 1,user, force = repulse_force)//So stuff gets tossed around at the same time.

/obj/effect/proc_holder/spell/aoe_turf/repulse/xeno //i fixed conflicts only to find out that this is in the WIZARD file instead of the xeno file?!
	name = "Tail Sweep"
	desc = ""
	sound = 'sound/blank.ogg'
	charge_max = 150
	clothes_req = FALSE
	antimagic_allowed = TRUE
	range = 2
	cooldown_min = 150
	invocation_type = "none"
	sparkle_path = /obj/effect/temp_visual/dir_setting/tailsweep
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "tailsweep"
	action_background_icon_state = "bg_alien"
	anti_magic_check = FALSE

/obj/effect/proc_holder/spell/aoe_turf/repulse/xeno/cast(list/targets,mob/user = usr)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		playsound(C.loc, 'sound/blank.ogg', 80, TRUE, TRUE)
		C.spin(6,1)
	..(targets, user, 60)

/obj/effect/proc_holder/spell/targeted/sacred_flame
	name = "Sacred Flame"
	desc = ""
	charge_max = 60
	clothes_req = FALSE
	invocation = "FI'RAN DADISKO"
	invocation_type = "shout"
	max_targets = 0
	range = 6
	include_user = TRUE
	selection_type = "view"
	action_icon_state = "sacredflame"
	sound = 'sound/blank.ogg'

/obj/effect/proc_holder/spell/targeted/sacred_flame/cast(list/targets, mob/user = usr)
	for(var/mob/living/L in targets)
		if(L.anti_magic_check(TRUE, TRUE))
			continue
		L.adjust_fire_stacks(20)
	if(isliving(user))
		var/mob/living/U = user
		if(!U.anti_magic_check(TRUE, TRUE))
			U.IgniteMob()

/obj/effect/proc_holder/spell/targeted/conjure_item/spellpacket
	name = "Thrown Lightning"
	desc = ""
	item_type = /obj/item/spellpacket/lightningbolt
	charge_max = 10
	action_icon_state = "thrownlightning"

/obj/effect/proc_holder/spell/targeted/conjure_item/spellpacket/cast(list/targets, mob/user = usr)
	..()
	for(var/mob/living/carbon/C in targets)
		C.throw_mode_on()

/obj/item/spellpacket/lightningbolt
	name = "\improper Lightning bolt Spell Packet"
	desc = ""
	icon = 'icons/obj/toy.dmi'
	icon_state = "snappop"
	w_class = WEIGHT_CLASS_TINY

/obj/item/spellpacket/lightningbolt/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..())
		if(isliving(hit_atom))
			var/mob/living/M = hit_atom
			if(!M.anti_magic_check())
				M.electrocute_act(80, src, flags = SHOCK_ILLUSION)
		qdel(src)

/obj/item/spellpacket/lightningbolt/throw_at(atom/target, range, speed, mob/thrower, spin=TRUE, diagonals_first = FALSE, datum/callback/callback, force = INFINITY)
	. = ..()
	if(ishuman(thrower))
		var/mob/living/carbon/human/H = thrower
		H.say("LIGHTNINGBOLT!!", forced = "spell")
