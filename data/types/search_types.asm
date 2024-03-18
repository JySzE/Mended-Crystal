PokedexTypeSearchConversionTable:
; entries correspond with PokedexTypeSearchStrings (see data/types/search_strings.asm)
	table_width 1, PokedexTypeSearchConversionTable
	db NORMAL
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db ICE
	db FIGHTING
	db POISON
	db GROUND
	db FLYING
	db PSYCHIC_TYPE
	db BUG
	db ROCK
	db DARK
	db DRAGON
	db GHOST
	db STEEL
	assert_table_length NUM_TYPES
