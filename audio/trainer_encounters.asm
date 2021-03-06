; Currently, must be in the same bank as the sound engine.

PlayTrainerEncounterMusic:: ; e900a
; input: e = trainer type
	; turn fade off
	callba SaveMusic
	xor a
	ld [MusicFade], a
	; play nothing for one frame
	push de
	ld de, $0000 ; id: Music_Nothing
	call PlayMusic
	call DelayFrame
	; play new song
	call MaxVolume
	pop de
	ld d, $00
	ld hl, TrainerEncounterMusic
	add hl, de
	ld a, [hl]
	cp MUSIC_ROCKET_ENCOUNTER
	jr nz, .play
	call RocketMusicCheck
	jr c, .play
	ld a, MUSIC_HIKER_ENCOUNTER
.play
	ld e, a
	call PlayMusic
	ret
; e9027

TrainerEncounterMusic: ; e9027
	db MUSIC_HIKER_ENCOUNTER
	db MUSIC_YOUNGSTER_ENCOUNTER	; falkner
	db MUSIC_LASS_ENCOUNTER			; whitney
	db MUSIC_YOUNGSTER_ENCOUNTER	; bugsy
	db MUSIC_OFFICER_ENCOUNTER		; morty
	db MUSIC_OFFICER_ENCOUNTER		; pryce
	db MUSIC_LASS_ENCOUNTER			; jasmine
	db MUSIC_OFFICER_ENCOUNTER		; chuck
	db MUSIC_BEAUTY_ENCOUNTER		; clair
	db MUSIC_RIVAL_ENCOUNTER		; rival1
	db MUSIC_HIKER_ENCOUNTER		; pokemon_prof
	db MUSIC_HIKER_ENCOUNTER		; will
	db MUSIC_HIKER_ENCOUNTER		; cal
	db MUSIC_OFFICER_ENCOUNTER		; bruno
	db MUSIC_HIKER_ENCOUNTER		; karen
	db MUSIC_HIKER_ENCOUNTER		; koga
	db MUSIC_OFFICER_ENCOUNTER		; champion
	db MUSIC_YOUNGSTER_ENCOUNTER	; brock
	db MUSIC_LASS_ENCOUNTER			; misty
	db MUSIC_OFFICER_ENCOUNTER		; lt_surge
	db MUSIC_ROCKET_ENCOUNTER		; scientist
	db MUSIC_OFFICER_ENCOUNTER		; erika
	db MUSIC_YOUNGSTER_ENCOUNTER	; youngster
	db MUSIC_YOUNGSTER_ENCOUNTER	; schoolboy
	db MUSIC_YOUNGSTER_ENCOUNTER	; bird_keeper
	db MUSIC_LASS_ENCOUNTER			; lass
	db MUSIC_LASS_ENCOUNTER			; janine
	db MUSIC_HIKER_ENCOUNTER		; cooltrainerm
	db MUSIC_BEAUTY_ENCOUNTER		; cooltrainerf
	db MUSIC_BEAUTY_ENCOUNTER		; beauty
	db MUSIC_POKEMANIAC_ENCOUNTER	; pokemaniac
	db MUSIC_ROCKET_ENCOUNTER		; gruntm
	db MUSIC_HIKER_ENCOUNTER		; gentleman
	db MUSIC_BEAUTY_ENCOUNTER		; skier
	db MUSIC_BEAUTY_ENCOUNTER		; teacher
	db MUSIC_BEAUTY_ENCOUNTER		; sabrina
	db MUSIC_YOUNGSTER_ENCOUNTER	; bug_catcher
	db MUSIC_HIKER_ENCOUNTER		; fisher
	db MUSIC_HIKER_ENCOUNTER		; swimmerm
	db MUSIC_BEAUTY_ENCOUNTER		; swimmerf
	db MUSIC_HIKER_ENCOUNTER		; sailor
	db MUSIC_POKEMANIAC_ENCOUNTER	; super_nerd
	db MUSIC_RIVAL_ENCOUNTER		; rival2
	db MUSIC_HIKER_ENCOUNTER		; guitarist
	db MUSIC_HIKER_ENCOUNTER		; hiker
	db MUSIC_HIKER_ENCOUNTER		; biker
	db MUSIC_OFFICER_ENCOUNTER		; blaine
	db MUSIC_POKEMANIAC_ENCOUNTER	; burglar
	db MUSIC_HIKER_ENCOUNTER		; firebreather
	db MUSIC_POKEMANIAC_ENCOUNTER	; juggler
	db MUSIC_HIKER_ENCOUNTER		; blackbelt_t
	db MUSIC_ROCKET_ENCOUNTER		; executivem
	db MUSIC_YOUNGSTER_ENCOUNTER	; psychic_t
	db MUSIC_LASS_ENCOUNTER			; picnicker
	db MUSIC_YOUNGSTER_ENCOUNTER	; camper
	db MUSIC_ROCKET_ENCOUNTER		; executivef
	db MUSIC_SAGE_ENCOUNTER			; sage
	db MUSIC_SAGE_ENCOUNTER			; medium
	db MUSIC_HIKER_ENCOUNTER		; boarder
	db MUSIC_HIKER_ENCOUNTER		; pokefanm
	db MUSIC_KIMONO_ENCOUNTER		; kimono_girl
	db MUSIC_LASS_ENCOUNTER			; twins
	db MUSIC_BEAUTY_ENCOUNTER		; pokefanf
	db MUSIC_HIKER_ENCOUNTER		; red
	db MUSIC_RIVAL_ENCOUNTER		; blue
	db MUSIC_HIKER_ENCOUNTER		; officer
	db MUSIC_ROCKET_ENCOUNTER		; gruntf
	db MUSIC_MYSTICALMAN_ENCOUNTER	; mysticalman
	db MUSIC_OFFICER_ENCOUNTER      ; bill
	db MUSIC_POKEMANIAC_ENCOUNTER	; tppPc
	db MUSIC_OFFICER_ENCOUNTER		; elm
	db MUSIC_ROCKET_ENCOUNTER		; giovanni
	db MUSIC_OFFICER_ENCOUNTER		; coolsiblings
; e906e
