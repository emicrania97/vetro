Route29_MapScriptHeader: ; 0x1a0f4c
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a0f59, $0000
	dw UnknownScript_0x1a0f5a, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, TuscanyCallback

UnknownScript_0x1a0f59: ; 0x1a0f59
	end
; 0x1a0f5a

UnknownScript_0x1a0f5a: ; 0x1a0f5a
	end
; 0x1a0f5b

TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears
	disappear $8
	return

.DoesTuscanyAppear
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, .TuscanyDisappears
	appear $8
	return

UnknownScript_0x1a0f6d: ; 0x1a0f6d
	spriteface $2, $1
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1a108d
	spriteface $0, $2
	setevent EVENT_DUDE_TALKED_TO_YOU
	loadfont
	writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fd9
	closetext
	follow $2, $0
	applymovement $2, MovementData_0x1a109a
	stopfollow
	loadpokedata SENTRET, 18
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface $2, $1
	loadfont
	writetext UnknownText_0x1a114d
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end
; 0x1a0fa3

UnknownScript_0x1a0fa3: ; 0x1a0fa3
	spriteface $2, $1
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1a1094
	spriteface $0, $2
	setevent EVENT_DUDE_TALKED_TO_YOU
	loadfont
	writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fe5
	closetext
	follow $2, $0
	applymovement $2, MovementData_0x1a10a1
	stopfollow
	loadpokedata SENTRET, 18
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface $2, $1
	loadfont
	writetext UnknownText_0x1a114d
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end
; 0x1a0fd9

UnknownScript_0x1a0fd9: ; 0x1a0fd9
	writetext UnknownText_0x1a1197
	waitbutton
	closetext
	applymovement $2, MovementData_0x1a109a
	dotrigger $0
	end
; 0x1a0fe5

UnknownScript_0x1a0fe5: ; 0x1a0fe5
	writetext UnknownText_0x1a1197
	waitbutton
	closetext
	applymovement $2, MovementData_0x1a10a1
	dotrigger $0
	end
; 0x1a0ff1

CooltrainerMScript_0x1a0ff1: ; 0x1a0ff1
	faceplayer
	loadfont
	checkcode VAR_BOXSPACE
	if_equal $0, UnknownScript_0x1a101c
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue UnknownScript_0x1a101c
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse UnknownScript_0x1a101c
	writetext UnknownText_0x1a11e3
	yesorno
	iffalse UnknownScript_0x1a1022
	closetext
	loadpokedata SENTRET, 15
	catchtutorial BATTLETYPE_TUTORIAL
	loadfont
	writetext UnknownText_0x1a114d
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end
; 0x1a101c

UnknownScript_0x1a101c: ; 0x1a101c
	writetext UnknownText_0x1a10a7
	waitbutton
	closetext
	end
; 0x1a1022

UnknownScript_0x1a1022: ; 0x1a1022
	writetext UnknownText_0x1a1197
	waitbutton
	closetext
	end
; 0x1a1028

YoungsterScript_0x1a1028: ; 0x1a1028
	jumptextfaceplayer UnknownText_0x1a1214
; 0x1a102b

TeacherScript_0x1a102b: ; 0x1a102b
	jumptextfaceplayer UnknownText_0x1a126c
; 0x1a102e

FisherScript_0x1a102e: ; 0x1a102e
	jumptextfaceplayer UnknownText_0x1a12d9
; 0x1a1031

CooltrainerMScript_0x1a1031: ; 0x1a1031
	faceplayer
	loadfont
	checktime $2
	iftrue UnknownScript_0x1a103d
	checktime $4
	iftrue UnknownScript_0x1a1043
UnknownScript_0x1a103d: ; 0x1a103d
	writetext UnknownText_0x1a134c
	waitbutton
	closetext
	end
; 0x1a1043

UnknownScript_0x1a1043: ; 0x1a1043
	writetext UnknownText_0x1a137c
	waitbutton
	closetext
	end
; 0x1a1049

TuscanyScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem POLKADOT_BOW, 1
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

MapRoute29Signpost0Script: ; 0x1a1083
	jumptext UnknownText_0x1a158e
; 0x1a1086

MapRoute29Signpost1Script: ; 0x1a1086
	jumptext UnknownText_0x1a15b9
; 0x1a1089

FruitTreeScript_0x1a1089: ; 0x1a1089
	fruittree $1
; 0x1a108b

ItemFragment_0x1a108b: ; 0x1a108b
	db SUPER_POTION, 1
; 0x1a108d

MovementData_0x1a108d: ; 0x1a108d
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end
; 0x1a1094

MovementData_0x1a1094: ; 0x1a1094
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end
; 0x1a109a

MovementData_0x1a109a: ; 0x1a109a
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x1a10a1

MovementData_0x1a10a1: ; 0x1a10a1
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end
; 0x1a10a7

UnknownText_0x1a10a7: ; 0x1a10a7
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out<...>"
	done
; 0x1a10df

UnknownText_0x1a10df: ; 0x1a10df
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done
; 0x1a114d

UnknownText_0x1a114d: ; 0x1a114d
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done
; 0x1a1197

UnknownText_0x1a1197: ; 0x1a1197
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done
; 0x1a11e3

UnknownText_0x1a11e3: ; 0x1a11e3
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done
; 0x1a1214

UnknownText_0x1a1214: ; 0x1a1214
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done
; 0x1a126c

UnknownText_0x1a126c: ; 0x1a126c
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done
; 0x1a12d9

UnknownText_0x1a12d9: ; 0x1a12d9
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done
; 0x1a1316

; possibly unused
;UnknownText_0x1a1316: ; 0x1a1316
;	text "I'm waiting for"
;	line "#MON that"

;	para "appear only in the"
;	line "daytime."
;	done
; 0x1a134c

UnknownText_0x1a134c: ; 0x1a134c
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done
; 0x1a137c

UnknownText_0x1a137c: ; 0x1a137c
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done
; 0x1a13b2

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a POLKADOT BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate<...>"
	done

UnknownText_0x1a158e: ; 0x1a158e
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done
; 0x1a15b9

UnknownText_0x1a15b9: ; 0x1a15b9
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done
; 0x1a15e4

Route29_MapEventHeader: ; 0x1a15e4
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $1b, 3, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE

	; xy triggers
	db 0
	;xy_trigger 1, $8, $35, $0, UnknownScript_0x1a0f6d, $0, $0
	;xy_trigger 1, $9, $35, $0, UnknownScript_0x1a0fa3, $0, $0

	; signposts
	db 2
	signpost 7, 51, $0, MapRoute29Signpost0Script
	signpost 5, 3, $0, MapRoute29Signpost1Script

	; people-events
	db 8
	person_event SPRITE_COOLTRAINER_M, 16, 54, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, CooltrainerMScript_0x1a0ff1, -1
	person_event SPRITE_YOUNGSTER, 20, 31, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, YoungsterScript_0x1a1028, -1
	person_event SPRITE_TEACHER, 15, 19, $5, 0, 1, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TeacherScript_0x1a102b, -1
	person_event SPRITE_FRUIT_TREE, 6, 16, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x1a1089, -1
	person_event SPRITE_FISHER, 7, 29, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FisherScript_0x1a102e, -1
	person_event SPRITE_COOLTRAINER_M, 8, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_TEACHER, 16, 33, $3, 0, 0, -1, -1, 0, 0, 0, TuscanyScript, EVENT_TUSCANY_OF_TUESDAY
	person_event SPRITE_POKE_BALL, 6, 52, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x1a108b, EVENT_ITEM_ROUTE_29_POTION
