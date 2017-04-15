Route36_MapScriptHeader: ; 0x194000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x19400d, $0000
	dw UnknownScript_0x19400e, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, ArthurCallback

UnknownScript_0x19400d: ; 0x19400d
	end
; 0x19400e

UnknownScript_0x19400e: ; 0x19400e
	end
; 0x19400f

ArthurCallback:
	checkcode VAR_WEEKDAY
	if_equal THURSDAY, .ArthurAppears
	disappear $8
	return

.ArthurAppears
	appear $8
	return

UnknownScript_0x19401b: ; 0x19401b
	showemote $0, $0, 15
	pause 15
	playsound SFX_WARP_FROM
	spriteface $0, $1
	applymovement $a, MovementData_0x194262
	disappear $a
	spriteface $0, $0
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	domaptrigger GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $1
	end
; 0x19403c

WeirdTreeScript_0x19403c: ; 0x19403c
	checkitem SQUIRTBOTTLE
	iftrue UnknownScript_0x19404a
	waitsfx
	playsound SFX_SANDSTORM
	applymovement $4, MovementData_0x194249
	end
; 0x19404a

UnknownScript_0x19404a: ; 0x19404a
	loadfont
	writetext UnknownText_0x19426b
	yesorno
	iffalse UnknownScript_0x194079
	closetext
	; fallthrough
; 0x194053

WateredWeirdTreeScript:: ; 0x194053
	loadfont
	writetext UnknownText_0x194290
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement $4, MovementData_0x194249
	loadfont
	writetext UnknownText_0x1942aa
	waitbutton
	closetext
	loadpokedata SUDOWOODO, 35
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	if_equal $2, UnknownScript_0x19407b
	disappear $4
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	returnafterbattle
	end
; 0x194079

UnknownScript_0x194079: ; 0x194079
	closetext
	end
; 0x19407b

UnknownScript_0x19407b: ; 0x19407b
	returnafterbattle
	applymovement $4, MovementData_0x19424b
	disappear $4
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special Function14209
	special Function14168
	end
; 0x19408c

LassScript_0x19408c:
	faceplayer
	loadfont
	checkevent EVENT_SPOKE_TO_FLOWER_SHOP_GIRL_IN_FLOWER_SHOP
	iftrue UnknownScript_0x1940b3
	setevent EVENT_SPOKE_TO_FLOWER_SHOP_GIRL_AT_SUDOWOODO
	writetext UnknownText_0x1942f1
	waitbutton
	closetext
	clearevent EVENT_FLOWER_SHOP_LASS_IN_GOLDENROD_FLOWER_SHOP
	checkcode VAR_FACING
	if_equal UP, UnknownScript_0x1940ac
	applymovement $9, MovementData_0x19424e
	disappear $9
	end

UnknownScript_0x1940ac:
	applymovement $9, MovementData_0x194258
	disappear $9
	end

UnknownScript_0x1940b3:
	writetext UnknownText_0x1943ed
	waitbutton
	closetext
	end

; LassScript_0x19408c: ; 0x19408c
	; faceplayer
	; loadfont
	; checkevent EVENT_GOT_SQUIRTBOTTLE
	; iftrue UnknownScript_0x1940b3
	; checkevent EVENT_SPOKE_TO_FLOWER_SHOP_GIRL_IN_FLOWER_SHOP
	; iftrue UnknownScript_0x1940b3
	; setevent EVENT_SPOKE_TO_FLOWER_SHOP_GIRL_AT_SUDOWOODO
	; writetext UnknownText_0x1942f1
	; waitbutton
	; closetext
	; clearevent EVENT_FLOWER_SHOP_LASS_IN_GOLDENROD_FLOWER_SHOP
	; checkcode VAR_FACING
	; if_equal $1, UnknownScript_0x1940ac
	; applymovement $9, MovementData_0x19424e
	; disappear $9
	; end
; ; 0x1940ac

; UnknownScript_0x1940ac: ; 0x1940ac
	; applymovement $9, MovementData_0x194258
	; disappear $9
	; end
; ; 0x1940b3

; UnknownScript_0x1940b3: ; 0x1940b3
	; writetext UnknownText_0x1943ed
	; waitbutton
	; closetext
	; end
; ; 0x1940b9

FisherScript_0x1940b9: ; 0x1940b9
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM15_HYPER_BEAM
	iftrue UnknownScript_0x1940da
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x1940cd
	writetext UnknownText_0x19446f
	waitbutton
	closetext
	end
; 0x1940cd

UnknownScript_0x1940cd: ; 0x1940cd
	writetext UnknownText_0x1944d0
	buttonsound
	verbosegiveitem TM_HYPER_BEAM, 1
	iffalse UnknownScript_0x1940de
	setevent EVENT_GOT_TM15_HYPER_BEAM
UnknownScript_0x1940da: ; 0x1940da
	writetext UnknownText_0x19452c
	waitbutton
UnknownScript_0x1940de: ; 0x1940de
	closetext
	end
; 0x1940e0

LassScript_0x1940e0: ; 0x1940e0
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x1940ee
	writetext UnknownText_0x194626
	waitbutton
	closetext
	end
; 0x1940ee

UnknownScript_0x1940ee: ; 0x1940ee
	writetext UnknownText_0x19469e
	waitbutton
	closetext
	end
; 0x1940f4

TrainerSchoolboyAlan1: ; 0x1940f4
	; bit/flag number
	dw $46e

	; trainer group && trainer id
	db SCHOOLBOY, ALAN1

	; text when seen
	dw SchoolboyAlan1SeenText

	; text when trainer beaten
	dw SchoolboyAlan1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyAlan1Script
; 0x194100

SchoolboyAlan1Script: ; 0x194100
	writecode VAR_CALLERID, $18
	talkaftercancel
	loadfont
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0x194140
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue UnknownScript_0x1941b4
	checkcellnum $18
	iftrue UnknownScript_0x1941d5
	checkevent EVENT_ROUTE_36_285
	iftrue UnknownScript_0x194129
	writetext UnknownText_0x1947aa
	buttonsound
	setevent EVENT_ROUTE_36_285
	scall UnknownScript_0x1941c9
	jump UnknownScript_0x19412c
; 0x194129

UnknownScript_0x194129: ; 0x194129
	scall UnknownScript_0x1941cd
UnknownScript_0x19412c: ; 0x19412c
	askforphonenumber $18
	if_equal $1, UnknownScript_0x1941dd
	if_equal $2, UnknownScript_0x1941d9
	trainertotext SCHOOLBOY, ALAN1, $0
	scall UnknownScript_0x1941d1
	jump UnknownScript_0x1941d5
; 0x194140

UnknownScript_0x194140: ; 0x194140
	scall UnknownScript_0x1941e1
	winlosstext SchoolboyAlan1BeatenText, $0000
	copybytetovar wda02
	if_equal $4, UnknownScript_0x19415f
	if_equal $3, UnknownScript_0x194165
	if_equal $2, UnknownScript_0x19416b
	if_equal $1, UnknownScript_0x194171
	if_equal $0, UnknownScript_0x194177
UnknownScript_0x19415f: ; 0x19415f
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1941ab
UnknownScript_0x194165: ; 0x194165
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x19419e
UnknownScript_0x19416b: ; 0x19416b
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue UnknownScript_0x194191
UnknownScript_0x194171: ; 0x194171
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue UnknownScript_0x194184
UnknownScript_0x194177: ; 0x194177
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	returnafterbattle
	loadvar wda02, $1
	clearflag ENGINE_ALAN
	end
; 0x194184

UnknownScript_0x194184: ; 0x194184
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	returnafterbattle
	loadvar wda02, $2
	clearflag ENGINE_ALAN
	end
; 0x194191

UnknownScript_0x194191: ; 0x194191
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	returnafterbattle
	loadvar wda02, $3
	clearflag ENGINE_ALAN
	end
; 0x19419e

UnknownScript_0x19419e: ; 0x19419e
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	returnafterbattle
	loadvar wda02, $4
	clearflag ENGINE_ALAN
	end
; 0x1941ab

UnknownScript_0x1941ab: ; 0x1941ab
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	returnafterbattle
	clearflag ENGINE_ALAN
	end
; 0x1941b4

UnknownScript_0x1941b4: ; 0x1941b4
	scall UnknownScript_0x1941e5
	verbosegiveitem FIRE_STONE, 1
	iffalse UnknownScript_0x1941c6
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ROUTE_36_PHONE
	jump UnknownScript_0x1941d5
; 0x1941c6

UnknownScript_0x1941c6: ; 0x1941c6
	jump UnknownScript_0x1941e9
; 0x1941c9

UnknownScript_0x1941c9: ; 0x1941c9
	jumpstd asknumber1m
	end
; 0x1941cd

UnknownScript_0x1941cd: ; 0x1941cd
	jumpstd asknumber2m
	end
; 0x1941d1

UnknownScript_0x1941d1: ; 0x1941d1
	jumpstd registerednumberm
	end
; 0x1941d5

UnknownScript_0x1941d5: ; 0x1941d5
	jumpstd numberacceptedm
	end
; 0x1941d9

UnknownScript_0x1941d9: ; 0x1941d9
	jumpstd numberdeclinedm
	end
; 0x1941dd

UnknownScript_0x1941dd: ; 0x1941dd
	jumpstd phonefullm
	end
; 0x1941e1

UnknownScript_0x1941e1: ; 0x1941e1
	jumpstd rematchm
	end
; 0x1941e5

UnknownScript_0x1941e5: ; 0x1941e5
	jumpstd giftm
	end
; 0x1941e9

UnknownScript_0x1941e9: ; 0x1941e9
	jumpstd packfullm
	end
; 0x1941ed

TrainerPsychicMark: ; 0x1941ed
	; bit/flag number
	dw $440

	; trainer group && trainer id
	db PSYCHIC_T, MARK

	; text when seen
	dw PsychicMarkSeenText

	; text when trainer beaten
	dw PsychicMarkBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicMarkScript
; 0x1941f9

PsychicMarkScript: ; 0x1941f9
	talkaftercancel
	loadfont
	writetext UnknownText_0x19471e
	waitbutton
	closetext
	end
; 0x194201

ArthurScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue ArthurThursdayScript
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE, 1
	iffalse ArthurDoneScript
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

ArthurThursdayScript:
	writetext ArthurThursdayText
	waitbutton
ArthurDoneScript:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

MapRoute36Signpost2Script: ; 0x19423b
	jumptext UnknownText_0x194924
; 0x19423e

MapRoute36Signpost1Script: ; 0x19423e
	jumptext UnknownText_0x19492e
; 0x194241

MapRoute36Signpost3Script: ; 0x194241
	jumptext UnknownText_0x19494c
; 0x194244

MapRoute36Signpost0Script: ; 0x194244
	jumptext UnknownText_0x1949ee
; 0x194247

FruitTreeScript_0x194247: ; 0x194247
	fruittree $d
; 0x194249

MovementData_0x194249: ; 0x194249
	db $56 ; movement
	step_end
; 0x19424b

MovementData_0x19424b: ; 0x19424b
	fast_jump_step_up
	fast_jump_step_up
	step_end
; 0x19424e

MovementData_0x19424e: ; 0x19424e
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x194258

MovementData_0x194258: ; 0x194258
	step_left
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x194262

MovementData_0x194262: ; 0x194262
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end
; 0x19426b

UnknownText_0x19426b: ; 0x19426b
	text "It's a weird tree."
	line "Use SQUIRTBOTTLE?"
	done
; 0x194290

UnknownText_0x194290: ; 0x194290
	text "<PLAYER> used the"
	line "SQUIRTBOTTLE."
	done
; 0x1942aa

UnknownText_0x1942aa: ; 0x1942aa
	text "The weird tree"
	line "doesn't like the"
	cont "SQUIRTBOTTLE!"

	para "The weird tree"
	line "attacked!"
	done
; 0x1942f1

UnknownText_0x1942f1: ; 0x1942f1
	text "I'm the FLOWER"
	line "SHOP's FLORIA!"

	para "Listen, listen!"

	para "When I sprinkled"
	line "water on that"

	para "wiggly tree, it"
	line "jumped right up!"

	para "It just has to be"
	line "a #MON."

	para "I bet it would be"
	line "shocked out of its"

	para "disguise if you"
	line "soaked it!"

	para "I know! I'll tell"
	line "my sis and borrow"
	cont "her water bottle!"
	done
; 0x1943ed

UnknownText_0x1943ed: ; 0x1943ed
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she said"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle<...>"
	done
; 0x19446f

UnknownText_0x19446f: ; 0x19446f
	text "Wa-hey!"

	para "I was going to"
	line "snap that tree"

	para "with my straight-"
	line "arm punch."

	para "But I couldn't!"
	line "I'm a failure!"
	done
; 0x1944d0

UnknownText_0x1944d0: ; 0x1944d0
	text "Did you clear that"
	line "wretched tree?"

	para "I'm impressed!"
	line "I want you to"
	cont "have this."
	done
; 0x19451a

UnknownText_0x19451a: ; 0x19451a
	text "<PLAYER> received"
	line "TM15."
	done
; 0x19452c

UnknownText_0x19452c: ; 0x19452c
	text "That happens to be"
	line "HYPER BEAM."

	para "It's a very strong"
	line "attack, but your"
	para "#MON needs a"
	line "rest afterwards."
	done
; 0x1945b8

UnknownText_0x1945b8: ; 0x1945b8
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "I wanted to go see"
	line "the huge #MON"

	para "CENTER they just"
	line "opened<...>"
	done
; 0x194626

UnknownText_0x194626: ; 0x194626
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "It's preventing"
	line "me from shopping."

	para "Something should"
	line "be done about it."
	done
; 0x19469e

UnknownText_0x19469e: ; 0x19469e
	text "That odd tree dis-"
	line "appeared without a"
	cont "trace."

	para "Oh! That tree was"
	line "really a #MON?"
	done
; 0x1946ed

PsychicMarkSeenText: ; 0x1946ed
	text "I'm going to read"
	line "your thoughts!"
	done
; 0x19470e

PsychicMarkBeatenText: ; 0x19470e
	text "I misread you!"
	done
; 0x19471e

UnknownText_0x19471e: ; 0x19471e
	text "I'd be strong if"
	line "only I could tell"

	para "what my opponent"
	line "was thinking."
	done
; 0x194760

SchoolboyAlan1SeenText: ; 0x194760
	text "Thanks to my stud-"
	line "ies, I'm ready for"
	cont "any #MON!"
	done
; 0x194790

SchoolboyAlan1BeatenText: ; 0x194790
	text "Oops! Computation"
	line "error?"
	done
; 0x1947aa

UnknownText_0x1947aa: ; 0x1947aa
	text "Darn. I study five"
	line "hours a day too."

	para "There's more to"
	line "learning than just"
	cont "reading books."
	done
; 0x194800

MeetArthurText:
	text "ARTHUR: Who are"
	line "you?"

	para "I'm ARTHUR of"
	line "Thursday."
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "ARTHUR: A #MON"
	line "that uses rock-"

	para "type moves should"
	line "hold on to that."

	para "It pumps up rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "ARTHUR: I'm ARTHUR"
	line "of Thursday. I'm"

	para "the fourth son out"
	line "of seven children."
	done

ArthurNotThursdayText:
	text "ARTHUR: Today's"
	line "not Thursday. How"
	cont "disappointing."
	done

UnknownText_0x194924: ; 0x194924
	text "ROUTE 36"
	done
; 0x19492e

UnknownText_0x19492e: ; 0x19492e
	text "RUINS OF ALPH"
	line "NORTH ENTRANCE"
	done
; 0x19494c

UnknownText_0x19494c: ; 0x19494c
	text "TRAINER TIPS"

	para "#MON stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#MON grow."
	done
; 0x1949ee

UnknownText_0x1949ee: ; 0x1949ee
	text "TRAINER TIPS"

	para "Use DIG to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done
; 0x194a66

Route36_MapEventHeader: ; 0x194a66
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $8, $12, 3, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $9, $12, 4, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $d, $2f, 1, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE
	warp_def $d, $30, 2, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE

	; xy triggers
	db 2
	xy_trigger 1, $7, $14, $0, UnknownScript_0x19401b, $0, $0
	xy_trigger 1, $7, $16, $0, UnknownScript_0x19401b, $0, $0

	; signposts
	db 4
	signpost 1, 29, $0, MapRoute36Signpost0Script
	signpost 11, 45, $0, MapRoute36Signpost1Script
	signpost 7, 55, $0, MapRoute36Signpost2Script
	signpost 7, 21, $0, MapRoute36Signpost3Script

	; people-events
	db 9
	person_event SPRITE_YOUNGSTER, 16, 24, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerPsychicMark, -1
	person_event SPRITE_YOUNGSTER, 18, 35, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 5, TrainerSchoolboyAlan1, -1
	person_event SPRITE_WEIRD_TREE, 13, 39, $17, 0, 0, -1, -1, 0, 0, 0, WeirdTreeScript_0x19403c, EVENT_SUDOWOODO_ON_ROUTE_36
	person_event SPRITE_LASS, 12, 55, $5, 0, 2, -1, -1, 0, 0, 0, LassScript_0x1940e0, -1
	person_event SPRITE_FISHER, 13, 48, $8, 0, 0, -1, -1, 0, 0, 0, FisherScript_0x1940b9, -1
	person_event SPRITE_FRUIT_TREE, 8, 25, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x194247, -1
	person_event SPRITE_YOUNGSTER, 10, 50, $2, 1, 1, -1, -1, 0, 0, 0, ArthurScript, EVENT_ARTHUR_OF_THURSDAY
	person_event SPRITE_LASS, 16, 37, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, LassScript_0x19408c, EVENT_FLOWER_SHOP_LASS_ON_ROUTE_36
	person_event SPRITE_SUICUNE, 10, 25, $1, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
