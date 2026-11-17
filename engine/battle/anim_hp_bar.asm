_AnimateHPBar:
	call .IsMaximumMoreThan48Pixels
	jr c, .MoreThan48Pixels
	call .ComputePixels
.ShortAnimLoop:
	push bc
	push hl
	call ShortAnim_UpdateVariables
	pop hl
	pop bc
	push af
	push bc
	push hl
	call ShortHPBarAnim_UpdateTiles
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	jr nc, .ShortAnimLoop
	ret

.MoreThan48Pixels:
	call .ComputePixels
.LongAnimLoop:
	push bc
	push hl
	call LongAnim_UpdateVariables
	pop hl
	pop bc
	ret c
	push af
	push bc
	push hl
	call LongHPBarAnim_UpdateTiles
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	jr nc, .LongAnimLoop
	ret

.IsMaximumMoreThan48Pixels:
	ld a, [wCurHPAnimMaxHP + 1]
	and a
	jr nz, .player
	ld a, [wCurHPAnimMaxHP]
	cp HP_BAR_LENGTH_PX
	jr nc, .player
	and a
	ret

.player
	scf
	ret

.ComputePixels:
	push hl
	ld hl, wCurHPAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	call ComputeHPBarPixels
	ld a, e
	ld [wCurHPBarPixels], a

	ld a, [wCurHPAnimNewHP]
	ld c, a
	ld a, [wCurHPAnimNewHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld a, e
	ld [wNewHPBarPixels], a

	push hl
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .negative
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimLowHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimHighHP], a
	ld bc, 1
	jr .got_direction

.negative
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimHighHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimLowHP], a
	ld a, e
	xor $ff
	inc a
	ld e, a
	ld a, d
	xor $ff
	ld d, a
	ld bc, -1
.got_direction
	ld a, d
	ld [wCurHPAnimDeltaHP], a
	ld a, e
	ld [wCurHPAnimDeltaHP + 1], a
	ret

ShortAnim_UpdateVariables:
	ld hl, wCurHPBarPixels
	ld a, [wNewHPBarPixels]
	cp [hl]
	jr nz, .not_finished
	scf
	ret

.not_finished
	ld a, c
	add [hl]
	ld [hl], a
	ld a, [wOptions2]
	bit BATTLE_ANIM_SPEED, a
	jr z, .calculate
	ld a, [wNewHPBarPixels]
	cp [hl]
	jr z, .calculate
	ld a, c
	add [hl]
	ld [hl], a

.calculate
	call ShortHPBar_CalcPixelFrame
	and a
	ret

LongAnim_UpdateVariables:
.loop
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	cp [hl]
	jr nz, .next
	inc hl
	ld a, d
	cp [hl]
	jr nz, .next
	scf
	ret

.next
	ld l, e
	ld h, d
	add hl, bc
	ld a, l
	ld [wCurHPAnimOldHP], a
	ld a, h
	ld [wCurHPAnimOldHP + 1], a
	ld a, [wOptions2]
	bit BATTLE_ANIM_SPEED, a
	jr z, .updated
	ld hl, wCurHPAnimOldHP + 2
	ld a, [wCurHPAnimOldHP]
	cp [hl]
	jr nz, .advance_again
	inc hl
	ld a, [wCurHPAnimOldHP + 1]
	cp [hl]
	jr z, .updated

.advance_again
	push de
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld l, e
	ld h, d
	add hl, bc
	ld a, l
	ld [wCurHPAnimOldHP], a
	ld a, h
	ld [wCurHPAnimOldHP + 1], a
	pop de

.updated
	ld a, [wCurHPAnimOldHP]
	ld l, a
	ld a, [wCurHPAnimOldHP + 1]
	ld h, a
	push hl
	push de
	push bc
	ld hl, wCurHPAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; BUG: HP bar animation is slow for high HP (see docs/bugs_and_glitches.md)
	call ComputeHPBarPixels
	ld a, e
	pop bc
	pop de
	pop hl
	ld hl, wCurHPBarPixels
	cp [hl]
	jr z, .loop
	ld [hl], a
	and a
	ret

ShortHPBarAnim_UpdateTiles:
	call HPBarAnim_UpdateHPRemaining
	ld d, HP_BAR_LENGTH
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	ld a, [wCurHPBarPixels]
	ld e, a
	ld c, a
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	call HPBarAnim_PaletteUpdate
	ret

LongHPBarAnim_UpdateTiles:
	call HPBarAnim_UpdateHPRemaining
	ld a, [wCurHPAnimOldHP]
	ld c, a
	ld a, [wCurHPAnimOldHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld c, e
	ld d, HP_BAR_LENGTH
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	call HPBarAnim_PaletteUpdate
	ret

HPBarAnim_RedrawHPBar:
	ld a, [wWhichHPBar]
	cp $2
	jr nz, .skip
	ld a, 2 * SCREEN_WIDTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
.skip
	call DrawBattleHPBar
	ret

HPBarAnim_UpdateHPRemaining:
	ld a, [wWhichHPBar]
	and a
	ret z
	cp $1
	jr z, .load_15
	ld de, SCREEN_WIDTH + 2
	jr .loaded_de

.load_15
	ld de, SCREEN_WIDTH + 1
.loaded_de
	push hl
	add hl, de
	ld a, " "
	ld [hli], a
	ld [hli], a
	ld [hld], a
	dec hl
	ld a, [wCurHPAnimOldHP]
	ld [wStringBuffer2 + 1], a
	ld a, [wCurHPAnimOldHP + 1]
	ld [wStringBuffer2], a
	ld de, wStringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ret

HPBarAnim_PaletteUpdate:
	ldh a, [hCGB]
	and a
	ret z
	ld hl, wCurHPAnimPal
	call SetHPPal
	ld a, [wCurHPAnimPal]
	ld c, a
	farcall ApplyHPBarPals
	ret

HPBarAnim_BGMapUpdate:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	call DelayFrame
	call DelayFrame
	ret

.cgb
	ld a, [wWhichHPBar]
	and a
	jr z, .load_0
	cp $1
	jr z, .load_1
	ld a, [wCurPartyMon]
	cp $3
	jr nc, .bottom_half_of_screen
	ld c, $0
	jr .got_third

.bottom_half_of_screen
	ld c, $1
.got_third
	push af
	cp $2
	jr z, .skip_delay
	cp $5
	jr z, .skip_delay
	ld a, $2
	ldh [hBGMapMode], a
	ld a, c
	ldh [hBGMapThird], a
	call DelayFrame
.skip_delay
	ld a, $1
	ldh [hBGMapMode], a
	ld a, c
	ldh [hBGMapThird], a
	call DelayFrame
	pop af
	cp $2
	jr z, .two_frames
	cp $5
	jr z, .two_frames
	ret

.two_frames
	inc c
	ld a, $2
	ldh [hBGMapMode], a
	ld a, c
	ldh [hBGMapThird], a
	call DelayFrame
	ld a, $1
	ldh [hBGMapMode], a
	ld a, c
	ldh [hBGMapThird], a
	call DelayFrame
	ret

.load_0
	ld c, $0
	jr .finish

.load_1
	ld c, $1
.finish
	call DelayFrame
	ld a, c
	ldh [hBGMapThird], a
	call DelayFrame
	ret

ShortHPBar_CalcPixelFrame:
	ld a, [wCurHPAnimMaxHP]
	ld c, a
	ld b, 0
	ld hl, 0
	ld a, [wCurHPBarPixels]
	cp HP_BAR_LENGTH_PX
	jr nc, .return_max
	and a
	jr z, .return_zero
	call AddNTimes

	ld b, 0
.loop
	ld a, l
	sub HP_BAR_LENGTH_PX
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr z, .done
	jr c, .done
	inc b
	jr .loop

.done
	push bc
	ld bc, $80
	add hl, bc
	pop bc
	ld a, l
	sub HP_BAR_LENGTH_PX
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .no_carry
	inc b
.no_carry
	ld a, [wCurHPAnimLowHP]
	cp b
	jr nc, .finish
	ld a, [wCurHPAnimHighHP]
	cp b
	jr c, .finish
	ld a, b
.finish
	ld [wCurHPAnimOldHP], a
	ret

.return_zero
	xor a
	ld [wCurHPAnimOldHP], a
	ret

.return_max
	ld a, [wCurHPAnimMaxHP]
	ld [wCurHPAnimOldHP], a
	ret

AnimateFastExpBar::
.loop
	inc b
	inc b
	ld a, b
	cp c
	jr c, .draw
	ld b, c

.draw
	farcall DrawExpBar
	ld a, b
	cp c
	jr nz, .loop
	ret

TextCommand_SOUND_Banked::
	push bc
	ld h, d
	ld l, e
	dec hl
	ld a, [hli]
	ld b, a
	push hl
	ld hl, TextSFX
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr z, .play
	inc hl
	inc hl
	jr .loop

.play
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlaySFX
	ld a, [wTextboxFlags]
	bit SKIP_TEXT_SFX_WAIT_F, a
	jr nz, .skip_wait
	call WaitSFX
.skip_wait
	pop de

.done
	pop hl
	pop bc
	ret

TextSFX:
	dbw TX_SOUND_DEX_FANFARE_50_79,  SFX_DEX_FANFARE_50_79
	dbw TX_SOUND_FANFARE,            SFX_FANFARE
	dbw TX_SOUND_DEX_FANFARE_20_49,  SFX_DEX_FANFARE_20_49
	dbw TX_SOUND_ITEM,               SFX_ITEM
	dbw TX_SOUND_CAUGHT_MON,         SFX_CAUGHT_MON
	dbw TX_SOUND_DEX_FANFARE_80_109, SFX_DEX_FANFARE_80_109
	dbw TX_SOUND_SLOT_MACHINE_START, SFX_SLOT_MACHINE_START
	db -1

PlayEnemyVictoryAnimation::
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wEnemyMonHP]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	or b
	ret z
	ld a, [wEnemyMonStatus]
	and 1 << FRZ | SLP_MASK
	ret nz
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	hlcoord 12, 0
	ld d, 0
	ld e, ANIM_MON_SLOW
	predef AnimateFrontpic
	call WaitBGMap
	ret

PlayEnemyMonFrontpicAndCry::
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wEnemyMonHP]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	or b
	ret z
	ld a, [wEnemyMonStatus]
	and 1 << FRZ | SLP_MASK
	ret nz
	farcall CheckBattleScene
	jr c, .cry_no_anim
	hlcoord 12, 0
	ld d, 0
	ld e, ANIM_MON_SLOW
	predef AnimateFrontpic
	ret

.cry_no_anim
	ld a, $f
	ld [wCryTracks], a
	ld a, [wTempEnemyMonSpecies]
	jp PlayStereoCry
