	object_const_def 
	const SILVERCAVEROOM3_MEW
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks
	
	callback MAPCALLBACK_OBJECTS, .CheckMewtwoInCave
	
.CheckMewtwoInCave:
    checkevent EVENT_MEWTWO_IN_CAVE
    iftrue .CheckMewTwoFight
	sjump .NoAppear

.CheckMewTwoFight:
    checkevent EVENT_FOUGHT_MEWTWO
    iftrue .CheckMew
    sjump .NoAppear

.CheckMew:
    checkevent EVENT_FOUGHT_MEW
    iftrue .NoAppear
    sjump .Appear

.Appear
	appear SILVERCAVEROOM3_MEW
	endcallback
	
.NoAppear
	disappear SILVERCAVEROOM3_MEW
	endcallback

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	setevent EVENT_MEWTWO_IN_CAVE
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
Mew:
	faceplayer
	cry PARAS
	opentext
	writetext MewText
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
    loadwildmon MEW, 75
    startbattle
    disappear SILVERCAVEROOM3_MEW
    reloadmapafterbattle
	end

RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "<……>"
	line "<……>"
	done

MewText:
	text "Mew!"
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Mew, EVENT_SILVER_CAVE_ROOM_3_MEW
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
