	object_const_def
	const SILVERCAVEROOM1_MEWTWO
	const SILVERCAVEROOM1_POKE_BALL1
	const SILVERCAVEROOM1_POKE_BALL2
	const SILVERCAVEROOM1_POKE_BALL3
	const SILVERCAVEROOM1_POKE_BALL4

SilverCaveRoom1_MapScripts:
	def_scene_scripts

	def_callbacks
	
	callback MAPCALLBACK_OBJECTS, .CheckRed

.CheckRed:
    checkevent EVENT_MEWTWO_IN_CAVE
    iftrue .CheckMewtwo
	sjump .NoAppear

.CheckMewtwo:
    checkevent EVENT_FOUGHT_MEWTWO
    iftrue .NoAppear
    sjump .Appear

.Appear
	appear SILVERCAVEROOM1_MEWTWO
	endcallback
	
.NoAppear
	disappear SILVERCAVEROOM1_MEWTWO
	endcallback
	
Mewtwo:
	faceplayer
	cry PARAS
	opentext
	writetext MewtwoText
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
    loadwildmon MEWTWO, 75
    startbattle
    disappear SILVERCAVEROOM1_MEWTWO
    reloadmapafterbattle
	pause 15
	cry PARAS
	opentext
	writetext WildMewText
	pause 30
	closetext
	end
	
SilverCaveRoom1MaxElixer:
	itemball MAX_ELIXER

SilverCaveRoom1Protein:
	itemball PROTEIN

SilverCaveRoom1EscapeRope:
	itemball ESCAPE_ROPE

SilverCaveRoom1UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom1HiddenDireHit:
	hiddenitem DIRE_HIT, EVENT_SILVER_CAVE_ROOM_1_HIDDEN_DIRE_HIT

SilverCaveRoom1HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_SILVER_CAVE_ROOM_1_HIDDEN_ULTRA_BALL

MewtwoText:
	text "Mew!"
	line "Mewtwo seems"
	cont "distracted by" 
	cont "something nearby."
	done
	
WildMewText:
	text "Mew!"
	para "You hear a"
	line "faint but similiar" 
	cont "cry from inside"
	cont "the mountain."
	done


SilverCaveRoom1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_OUTSIDE, 2
	warp_event 15,  1, SILVER_CAVE_ROOM_2, 1

	def_coord_events

	def_bg_events
	bg_event 16, 23, BGEVENT_ITEM, SilverCaveRoom1HiddenDireHit
	bg_event 17, 12, BGEVENT_ITEM, SilverCaveRoom1HiddenUltraBall

	def_object_events
	object_event  8,  3, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_SILVER_CAVE_ROOM_1_MEWTWO
	object_event  4,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1MaxElixer, EVENT_SILVER_CAVE_ROOM_1_MAX_ELIXER
	object_event 15, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1Protein, EVENT_SILVER_CAVE_ROOM_1_PROTEIN
	object_event  5, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1EscapeRope, EVENT_SILVER_CAVE_ROOM_1_ESCAPE_ROPE
	object_event  7, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1UltraBall, EVENT_SILVER_CAVE_ROOM_1_ULTRA_BALL
