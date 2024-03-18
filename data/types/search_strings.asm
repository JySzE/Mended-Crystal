PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "  ----  @"
	db " NORMAL @"
	db "  FIRE  @"
	db " WATER  @"
	db " GRASS  @"
	db "ELECTRIC@"
	db "  ICE   @"
	db "FIGHTING@"
	db " POISON @"
	db " GROUND @"
	db " FLYING @"
	db "PSYCHIC @"
	db "  BUG   @"
	db "  ROCK  @"
	db " DARK   @"
	db " DRAGON @"
	db " GHOST  @"
	db " STEEL  @"
	assert_table_length NUM_TYPES + 1
