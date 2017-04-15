Route36RuinsofAlphgate_MapScriptHeader: ; 0x6aa18
	; trigger count
	db 0

	; callback count
	db 0
; 0x6aa1a

OfficerScript_0x6aa1a: ; 0x6aa1a
	jumptextfaceplayer UnknownText_0x6aa20
; 0x6aa1d

GrampsScript_0x6aa1d: ; 0x6aa1d
	jumptextfaceplayer UnknownText_0x6aa5b
; 0x6aa20

UnknownText_0x6aa20: ; 0x6aa20
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done
; 0x6aa5b

UnknownText_0x6aa5b: ; 0x6aa5b
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done
; 0x6aac9

Route36RuinsofAlphgate_MapEventHeader: ; 0x6aac9
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 3, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $0, $5, 4, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $7, $4, 9, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $5, 9, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_OFFICER, 8, 4, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, OfficerScript_0x6aa1a, -1
	person_event SPRITE_GRAMPS, 9, 11, $2, 2, 1, -1, -1, 8 + PAL_OW_BROWN, 0, 0, GrampsScript_0x6aa1d, -1
; 0x6aafd

