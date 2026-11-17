BattleIntroSlidingPics:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call .subfunction1
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	call .subfunction2
	xor a
	ldh [hLCDCPointer], a
	pop af
	ldh [rSVBK], a
	ret

.subfunction1
	call .subfunction4
	ld a, $90
	ldh [hSCX], a
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret

.subfunction2
	ld d, $90
	ld e, $72
	ld b, 3
	ld a, [wOptions2]
	bit BATTLE_ANIM_SPEED, a
	ld a, $49
	jr z, .loop1
	ld a, $25
.loop1
	push af
.loop2
	ldh a, [rLY]
	cp $60
	jr c, .loop2
	ld a, d
	ldh [hSCX], a
	call .subfunction5
	ld a, [wOptions2]
	bit BATTLE_ANIM_SPEED, a
	jr nz, .move_twice
	inc e
	inc e
	dec d
	dec d
	jr .move_sprites

.move_twice
	pop af
	push af
	cp $1
	jr z, .move_last_step
	ld a, e
	add 4
	ld e, a
	ld a, d
	sub 4
	ld d, a
	jr .move_sprites

.move_last_step
	inc e
	inc e
	dec d
	dec d

.move_sprites
	pop af
	push af
	cp $1
	jr z, .skip1
	push de
	call .subfunction3
	pop de

.skip1
	pop af
	push af
	cp $1
	jr z, .delay
	ld a, [wOptions2]
	bit BATTLE_ANIM_SPEED, a
	jr z, .delay
	inc b
	ld a, b
	and 3
	ld b, a
	jr nz, .next_frame

.delay
	call DelayFrame

.next_frame
	pop af
	dec a
	jr nz, .loop1
	ret

.subfunction3
	ld hl, wShadowOAMSprite00XCoord
	ld c, $12 ; 18
	ld de, SPRITEOAMSTRUCT_LENGTH
.loop3
	ld a, [wOptions2]
	bit BATTLE_ANIM_SPEED, a
	jr nz, .move_sprite_twice
	dec [hl]
	dec [hl]
	jr .next_sprite

.move_sprite_twice
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]

.next_sprite
	add hl, de
	dec c
	jr nz, .loop3
	ret

.subfunction4
	ld hl, wLYOverrides
	ld a, $90
	ld bc, SCREEN_HEIGHT_PX
	call ByteFill
	ret

.subfunction5
	ld hl, wLYOverrides
	ld a, d
	ld c, $3e ; 62
.loop4
	ld [hli], a
	dec c
	jr nz, .loop4
	ld a, e
	ld c, $22 ; 34
.loop5
	ld [hli], a
	dec c
	jr nz, .loop5
	xor a
	ld c, $30 ; 48
.loop6
	ld [hli], a
	dec c
	jr nz, .loop6
	ret
