; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 5, GEODUDE
	db 5, DUNSPARCE
	db 5, ZUBAT
	db 5, GEODUDE
	db 5, DUNSPARCE
	db 5, DUNSPARCE
	db 5, DUNSPARCE
	; day
	db 5, GEODUDE
	db 5, DUNSPARCE
	db 5, ZUBAT
	db 5, GEODUDE
	db 5, DUNSPARCE
	db 5, DUNSPARCE
	db 5, DUNSPARCE
	; nite
	db 5, GEODUDE
	db 5, DUNSPARCE
	db 5, ZUBAT
	db 5, GEODUDE
	db 5, DUNSPARCE
	db 5, DUNSPARCE
	db 5, DUNSPARCE

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 16, NIDORAN_M
	db 16, NIDORAN_F
	db 16, YANMA
	db 18, YANMA
	db 18, PIDGEY
	db 16, DITTO
	db 16, DITTO
	; day
	db 16, NIDORAN_M
	db 16, NIDORAN_F
	db 16, YANMA
	db 18, YANMA
	db 18, PIDGEY
	db 16, DITTO
	db 16, DITTO
	; nite
	db 16, NIDORAN_M
	db 16, NIDORAN_F
	db 16, YANMA
	db 18, YANMA
	db 18, HOOTHOOT
	db 16, DITTO
	db 16, DITTO

	db -1 ; end
