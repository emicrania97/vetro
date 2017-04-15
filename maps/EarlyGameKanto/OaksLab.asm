OaksLabRB_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 5
	dw .Trigger0, $0000
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000
	dw .Trigger4, $0000

	; callback count
	db 1
	dbw 4, .SetSprites
; 0x19b3c7
.Trigger0:
	end

.Trigger1:
	priorityjump WalkUpWithOak
	end

.Trigger2:
	end

.Trigger3:
	end

.Trigger4:
	end

.SetSprites:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .skip
	spriteface $2, UP
	moveperson $2, $5, $a
.skip
	return

WalkUpWithOak:
	follow $2, $0
	applymovement $2, MovementData_OakWalksUp
	stopfollow
	spriteface $2, DOWN
	spriteface $6, UP
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_1
	writetext _OaksLabRivalWaitingTextF
	jump .done_text_1

.male_rival_1
	writetext _OaksLabRivalWaitingText
.done_text_1
	waitbutton
	closetext
	loadfont
	writetext _OaksLabChooseMonText
	waitbutton
	closetext
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_2
	writetext _OaksLabRivalInterjectionTextF
	jump .done_text_2

.male_rival_2
	writetext _OaksLabRivalInterjectionText
.done_text_2
	waitbutton
	closetext
	loadfont
	writetext _OaksLabBePatientText
	waitbutton
	closetext
	dotrigger $2
	end

CharmanderPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	spriteface $2, DOWN
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabCharmanderText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $7
	setevent EVENT_GOT_CHARMANDER_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 5
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .facing_right
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesThreeStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	jump .RivalPicksMon

.facing_right
	applymovement $6, Movement_RivalTakesOneStepDown
	applymovement $6, Movement_RivalTakesThreeStepsRight
	spriteface $6, UP
.RivalPicksMon
	scall OaksLab_PrintRivalPickingMonText
	pokenamemem SQUIRTLE, $1
	disappear $8
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

BulbasaurPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabBulbasaurText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $9
	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 5
	closetext
	applymovement $6, Movement_RivalTakesOneStepDown
	applymovement $6, Movement_RivalTakesTwoStepsRight
	spriteface $6, UP
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem CHARMANDER, $1
	disappear $7
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

SquirtlePokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabSquirtleText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $8
	setevent EVENT_GOT_SQUIRTLE_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 5
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesFourStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem BULBASAUR, $1
	disappear $9
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

OaksLab_PrintRivalPickingMonText:
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext _OaksLabRivalPickingMonTextF
	buttonsound
	end

.male_rival
	writetext _OaksLabRivalPickingMonText
	buttonsound
	end

OaksLabRB_DidntChooseStarterScript:
	closetext
	end

OaksLab_LastMonScript:
	jumptext _OaksLabLastMonText

OaksLab_LookAtPokeballScript:
	jumptext _OaksLabText39

OaksLab_RivalBattleTriggerLeft:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesFourStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepRight
	spriteface $0, RIGHT
	jump OaksLab_RivalFinishesLeaving

OaksLab_RivalBattleTriggerRight:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesOneStepLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepLeft
	spriteface $0, LEFT
	jump OaksLab_RivalFinishesLeaving
OaksLab_RivalBattleIntroScript:
	setlasttalked $6
	playmusic MUSIC_RIVAL_RB
	spriteface $6, DOWN
	spriteface $2, DOWN
	spriteface $0, UP
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext _OaksLabRivalChallengeTextF
	jump .done_text

.male_rival
	writetext _OaksLabRivalChallengeText
.done_text
	waitbutton
	closetext
	end

OaksLab_DoRivalBattle:
	winlosstext _OaksLabText_1d3be, _OaksLabText_1d3c3
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext _OaksLabText_1d3beF, _OaksLabText_1d3c3F
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	special RestartMapMusic
	special HealParty
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext _OaksLabRivalToughenUpTextF
	jump .done_text

.male_rival
	writetext _OaksLabRivalToughenUpText
.done_text
	waitbutton
	closetext
	setevent EVENT_RB_BEAT_RIVAL_IN_LAB
	playmusic MUSIC_RIVAL_AFTER_RB
	end

OaksLab_RivalFinishesLeaving:
	applymovement $6, Movement_RivalTakesTwoStepsDown
	spriteface $0, DOWN
	applymovement $6, Movement_RivalTakesFourStepsDown
	disappear $6
	playsound SFX_EXIT_BUILDING
	waitsfx
	special RestartMapMusic
	dotrigger $4
	end

OakScript_OaksLabRB:
	checkflag ENGINE_POKEDEX
	iftrue .RatePokedex
	checkevent EVENT_GOT_PARCEL
	iftrue .GivePokedex
	checkevent EVENT_RB_BEAT_RIVAL_IN_LAB
	iftrue .AfterRivalBattle
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .BeforeRivalBattle
	jumptextfaceplayer _OaksLabText_1d2f0
.BeforeRivalBattle
	jumptextfaceplayer _OaksLabText_1d2f5
.AfterRivalBattle
	jumptextfaceplayer _OaksLabText_1d2fa
.RatePokedex
	faceplayer
	loadfont
	checkevent EVENT_001_STD
	iftrue .AroundTheWorld
	writetext _OaksLabText_1d31d
	waitbutton
	special ProfOaksPCBoot
	closetext
	end

.AroundTheWorld
	writetext _OaksLabAroundWorldText
	waitbutton
	closetext
	end

.GivePokedex
	setevent EVENT_001_STD
	faceplayer
	loadfont
	writetext _OaksLabDeliverParcelText1
	playsound SFX_KEY_ITEM
	waitsfx
	buttonsound
	takeitem OAKS_PARCEL, 1
	writetext _OaksLabDeliverParcelText2
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_RB
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_1
	writetext _OaksLabText21F
	jump .done_text_1

.male_rival_1
	writetext _OaksLabText21
.done_text_1
	waitbutton
	closetext
	spriteface $2, DOWN
	checkcode VAR_FACING
	if_equal UP, .rivalwalksfivesteps
	if_equal DOWN, .rivalwalksthreesteps
	moveperson $6, 4, 7
	appear $6
	applymovement $6, Movement_RivalTakesFourStepsUp
	jump .continuewithdex
.rivalwalksthreesteps
	moveperson $6, 4, 6
	appear $6
	applymovement $6, Movement_RivalTakesThreeStepsUp
	jump .continuewithdex
.rivalwalksfivesteps
	moveperson $6, 4, 8
	appear $6
	applymovement $6, Movement_RivalTakesFiveStepsUp
.continuewithdex
	special RestartMapMusic
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_2
	writetext _OaksLabText22F
	jump .done_text_2

.male_rival_2
	writetext _OaksLabText22
.done_text_2
	waitbutton
	closetext
	loadfont
	writetext _OaksLabText23
	buttonsound
	writetext _OaksLabText24
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .right
	applymovement $2, OaksLabMovement_OakGrabsDexes
	pause 8
	disappear $a
	pause 2
	disappear $b
	pause 8
	applymovement $2, OaksLabMovement_OakReturnsWithDexes
	jump .finish_giving_dex

.right
	applymovement $2, OaksLabMovement_OakGrabsDexes2
	spriteface $0, LEFT
	spriteface $6, LEFT
	pause 8
	disappear $a
	pause 2
	disappear $b
	pause 8
	spriteface $2, RIGHT
.finish_giving_dex
	loadfont
	writetext _OaksLabText25
	setflag ENGINE_POKEDEX
	setevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_LYING_DOWN
	clearevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_WALKING_ABOUT
	domaptrigger GROUP_ROUTE_22_RB, MAP_ROUTE_22_RB, $1
	domaptrigger GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB, $1
	clearevent EVENT_RIVAL_ROUTE_22_RB
	playsound SFX_DEX_FANFARE_80_109
	waitsfx
	writetext _OaksLabGivePokeballsText1
	giveitem POKE_BALL, 5
	playsound SFX_ITEM
	waitsfx
	waitbutton
	writetext _OaksLabGivePokeballsText2
	buttonsound
	itemnotify
	writetext _OaksLabText26
	waitbutton
	closetext
	faceperson $0, $6
	faceperson $6, $0
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_3
	writetext _OaksLabText27F
	jump .done_text_3

.male_rival_3
	writetext _OaksLabText27
.done_text_3
	waitbutton
	closetext
	spriteface $0, DOWN
	playmusic MUSIC_RIVAL_AFTER_RB
	applymovement $6, Movement_RivalTakesSixStepsDown
	disappear $6
	playsound SFX_EXIT_BUILDING
	waitsfx
	special RestartMapMusic
	end

BlueScript_OaksLabRB:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .MyMonIsTheBest
	checkevent EVENT_OAKS_LAB_OAK
	iffalse .HurryUpAndChoose
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male1
	jumptextfaceplayer _OaksLabGaryText1F
.male1
	jumptextfaceplayer _OaksLabGaryText1

.HurryUpAndChoose
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male2
	jumptextfaceplayer _OaksLabText40F
.male2
	jumptextfaceplayer _OaksLabText40

.MyMonIsTheBest
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male3
	jumptextfaceplayer _OaksLabText41F
.male3
	jumptextfaceplayer _OaksLabText41

OaksLabRB_WaitComeBack:
	spriteface $0, UP
	loadfont
	writetext _OaksLabLeavingText
	waitbutton
	closetext
	applymovement $0, Movement_PlayerTakesOneStepUp
	end

BlankEncyclopoediaScript:
	jumptext _OaksLabText_1d32c

Scientist1Script_OaksLabRB:
Scientist2Script_OaksLabRB:
	jumptextfaceplayer _OaksLabText_1d405

LassScript_OaksLabRB:
	jumptextfaceplayer _OaksLabText_1d340

MapOaksLabRBSignpost11Script:
	jumpstd difficultbookshelf

MapOaksLabRBSignpost15Script:
	jumptext _OakLabEmailText

MapOaksLabRBSignpost12Script:
	jumptext _PushStartText

MapOaksLabRBSignpost13Script:
	checkcode VAR_DEXCAUGHT
	if_less_than 2, .saveoption
	jumptext _StrengthsAndWeaknessesText
.saveoption
	jumptext _SaveOptionText

MapOaksLabRBSignpost14Script
	jumpstd trashcan


Movement_RivalTakesFiveStepsUp:
	slow_step_up
Movement_RivalTakesFourStepsUp:
	slow_step_up
Movement_RivalTakesThreeStepsUp:
	slow_step_up
Movement_RivalTakesTwoStepsUp:
	slow_step_up
Movement_RivalTakesOneStepUp:
	slow_step_up
	step_end

MovementData_OakWalksUp:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
Movement_PlayerTakesOneStepUp:
	step_up
	step_end

OaksLabMovement_OakGrabsDexes:
	step_left
	step_left
	turn_head_up
	step_end

OaksLabMovement_OakReturnsWithDexes:
	step_right
	step_right
	turn_head_down
	step_end

OaksLabMovement_OakGrabsDexes2:
	step_down
	step_down
	step_left
	step_left
	step_up
	step_up
	step_end

; OaksLabMovement_OakReturnsWithDexes2:
	; turn_head_right
	; step_end

Movement_RivalTakesFourStepsLeft:
	slow_step_left
Movement_RivalTakesThreeStepsLeft:
	slow_step_left
Movement_RivalTakesTwoStepsLeft:
	slow_step_left
Movement_RivalTakesOneStepLeft:
	slow_step_left
	step_end

Movement_RivalTakesFourStepsLeftOneStepDown:
	slow_step_left
Movement_RivalTakesThreeStepsLeftOneStepDown:
	slow_step_left
Movement_RivalTakesTwoStepsLeftOneStepDown:
	slow_step_left
Movement_RivalTakesOneStepLeftOneStepDown:
	slow_step_left
	slow_step_down
	step_end

Movement_RivalTakesSevenStepsDown:
	slow_step_down
Movement_RivalTakesSixStepsDown:
	slow_step_down
	slow_step_down
Movement_RivalTakesFourStepsDown:
	slow_step_down
Movement_RivalTakesThreeStepsDown:
	slow_step_down
Movement_RivalTakesTwoStepsDown:
	slow_step_down
Movement_RivalTakesOneStepDown:
	slow_step_down
	step_end

Movement_RivalTakesFourStepsRight:
	slow_step_right
Movement_RivalTakesThreeStepsRight:
	slow_step_right
Movement_RivalTakesTwoStepsRight:
	slow_step_right
Movement_RivalTakesOneStepRight:
	slow_step_right
	step_end

_OaksLabGaryText1:
	text "<GREEN>: Ehi,"
	line "<PLAYER>! Nonno"
	cont "non é qui!"
	done

_OaksLabText40:
	text "<GREEN>: Ehi, non"
	line "vado di fretta"
	cont "come te!"

	para "Vai prima tu e"
	line "prendine uno,"
	cont "<PLAYER>!"
	done

_OaksLabText41:
	text "<GREEN>: Questo"
	line "Pokémon che ho"
	cont "preso sembra molto"
	cont "più forte del tuo."
	done

_OaksLabGaryText1F:
	text "<GREEN>: Oh, ciao"
	line "<PLAYER>."

	para "Il professore"
	line "non é qui."
	done

_OaksLabText40F:
	text "<GREEN>: Oh, io?"
	line "Non vado di"
	cont "fretta."

	para "Vai prima tu,"
	line "<PLAYER>."
	done

_OaksLabText41F:
	text "<GREEN>: Io volevo"
	line "comunque questo"
	cont "Pokémon<...>"
	done

_OaksLabText39:
	text "Sulla scrivania"
	line "ci sono delle"
	cont "Poké Ball."
	cont "Contengono dei"
	cont "Pokémon!"
	done

_OaksLabCharmanderText:
	text "Allora, hai"
	line "deciso?"
	cont "Vuoi il Pokémon di"
	cont "tipo fuoco,"
	cont "Charmander?"
	done

_OaksLabSquirtleText:
	text "Allora, hai"
	line "deciso?"
	cont "Vuoi il Pokémon di"
	cont "tipo acqua,"
	cont "Squirtle?"
	done

_OaksLabBulbasaurText:
	text "Allora, hai"
	line "deciso?"
	cont "Vuoi il Pokémon di"
	cont "tipo erba,"
	cont "Bulbasaur?"
	done

_OaksLabMonEnergeticText:
	text "Questo Pokémon é"
	line "davvero molto"
	cont "energico!"
	done

_OaksLabReceivedMonText:
	text "Hai ricevuto"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

_OaksLabLastMonText:
	text "È l'ultimo Pokémon"
	line "del professore!"
	done

_OaksLabText_1d2f0:
	text "Oak: Ora, <PLAYER>,"
	line "quale Pokémon vuoi"
	cont "prendere?"
	done

_OaksLabText_1d2f5:
	text "Oak: Se un Pokémon"
	line "selvatico appare,"
	cont "il tuo Pokémon"
	cont "può combatterlo!"
	done

_OaksLabText_1d2fa:
	text "Oak: <PLAYER>,"
	line "alleva il tuo"
	cont "giovane Pokémon"
	cont "facendolo combat-"
	cont "tere!"
	done

_OaksLabDeliverParcelText1:
	text "Oak: Oh, <PLAYER>!"

	para "Come sta il mio"
	line "Pokémon?"

	para "Sembra essersi già"
	line "affezionato molto."

	para "Hai sicuramente"
	line "del talento come"
	cont "allenatore di"
	cont "Pokémon!"

	para "Cosa? Hai qualcosa"
	line "per me?"

	para "<PLAYER> consegna"
	line "il pacco a Oak."
	done

_OaksLabDeliverParcelText2:
	text "Ah! Questa é la"
	line "ball speciale che"
	cont "ho ordinato!"
	cont "Grazie!"
	done

_OaksLabAroundWorldText:
	text "I Pokémon di tutto"
	line "il mondo stanno"
	cont "aspettando soltan-"
	cont "to te, <PLAYER>!"
	done

_OaksLabGivePokeballsText1:
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAYER> received"
	line "# BALL!"
	done

_OaksLabGivePokeballsText2:
	text "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	cont "to catch it!"

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

_OaksLabPleaseVisitText:
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

_OaksLabText_1d31d:
	text "Oak: Mi fa piacere"
	line "rivederti! Come va"
	cont "il tuo Pokédex?"
	cont "Dai, fammi dare"
	cont "un'occhiata!"
	done

_OaksLabText_1d32c:
	text "Sembra un'enciclo-"
	line "pedia, ma le pagi-"
	cont "ne sono vuote!"
	done

_OaksLabText_1d340:
	text "Il professor Oak é"
	line "un'autorità nello"
	cont "studio dei Poké-"
	cont "mon!"

	para "Molti allenatori"
	line "di Pokémon nutrono"
	cont "grande stima per"
	cont "lui!"
	done

_OaksLabRivalWaitingText:
	text "<GREEN>: Dai"
	line "Nonno! Non ce"
	cont "la faccio più"
	cont "ad aspettare!"
	done

_OaksLabRivalWaitingTextF:
	text "<GREEN>: Oh,"
	line "eccovi!"
	cont "Avremo dei Pokémon"
	cont "ora?"
	done

_OaksLabChooseMonText:
	text "Oak: <GREEN>?"
	line "Fammi pensare<...>"

	para "Oh, giusto,"
	line "ti ho detto di"
	cont "venire! Aspetta"
	cont "un attimo!"

	para "Ecco, <PLAYER>!"

	para "Qui ci sono 3"
	line "Pokémon!"

	para "Haha!"

	para "Sono dentro le"
	line "Pokéball."

	para "Quando ero giova-"
	line "ne, ero un esper-"
	cont "to allenatore di"
	cont "Pokémon!"

	para "Ma ora che sono"
	line "diventato vecchio,"
	cont "me ne sono rimasti"
	cont "soltanto 3."
	cont "Puoi prenderne"
	cont "uno, avanti!"
	done

_OaksLabRivalInterjectionText:
	text "<GREEN>: Ehi!"
	line "Nonno! E io?"
	done

_OaksLabRivalInterjectionTextF:
	text "<GREEN>: Dopo"
	line "potrò averne uno"
	cont "anch'io?"
	done

_OaksLabBePatientText:
	text "Oak: Sii paziente!"
	line "<GREEN>, anche"
	cont "tu ne avrai uno!"
	done

_OaksLabLeavingText:
	text "Oak: Ehi! Non an-"
	line "dartene adesso!"
	done

_OaksLabRivalPickingMonText:
	text "<GREEN>: Prenderò"
	line "questo, allora!"
	done

_OaksLabRivalPickingMonTextF:
	text "<GREEN>: Allora"
	line "prenderò questo"
	cont "qui<...>"
	done

_OaksLabRivalReceivedMonText:
	text "<GREEN> riceve"
	line "@"
	text_from_ram StringBuffer4
	text "!"
	done

_OaksLabRivalChallengeText:
	text "<GREEN>: Ehi!"
	line "<PLAYER>!"

	para "Ora che abbiamo"
	line "dei Pokémon, lot-"
	cont "tiamo!"

	para "In guardia!"
	done

_OaksLabText_1d3be:
	text "EH!?"
	line "Com'é possibile?"
	done

_OaksLabText_1d3c3:
	text "<GREEN>: Grande!"
	line "Sono troppo forte!"
	done

_OaksLabRivalToughenUpText:
	text "<GREEN>: Bene,"
	line "la prossima volta"
	cont "il mio Pokémon"
	cont "sarà molto più"
	cont "forte!"

	para "<PLAYER>! Nonno!"
	line "Ci vediamo!"
	done

_OaksLabRivalChallengeTextF:
	text "<GREEN>: Aspetta"
	line "un secondo,"
	cont "<PLAYER>!"

	para "Proviamo a fare"
	line "una lotta con i"
	cont "nostri Pokémon,"

	para "come abbiamo"
	line "sempre voluto!"

	para "Bene, iniziamo!"
	done

_OaksLabText_1d3beF:
	text "Oh cavolo<...>"
	line "Pare abbia ancora"
	cont "molto da imparare<...>"
	done

_OaksLabText_1d3c3F:
	text "<GREEN>: Oh, hm<...>"
	line "Sono stata troppo"
	cont "dura?"
	done

_OaksLabRivalToughenUpTextF:
	text "<GREEN>: Okay!"
	line "Lavorerò sodo"
	cont "per allenare il"
	cont "mio Pokémon con"
	cont "cura e amore!"

	para "<PLAYER>!"
	line "Professore!"
	cont "Io vado!"
	done

_OaksLabText21:
	text "<GREEN>: Nonno!"
	done

_OaksLabText22:
	text "<GREEN>: Perché"
	line "mi hai chiamato?"
	done

_OaksLabText21F:
	text "<GREEN>: Mi"
	line "scusi<...>!"
	done

_OaksLabText22F:
	text "<GREEN>: Mi"
	line "avete chiamato?"
	done

_OaksLabText23:
	text "Oak: Oh giusto! Ho"
	line "un favore da chie-"
	cont "dervi."
	done

_OaksLabText24:
	text "Lì sulla scrivania"
	line "potete vedere una"
	cont "mia invenzione,"
	cont "il Pokédex!"

	para "Registra automati-"
	line "camente dati sui"
	cont "Pokémon che avete"
	cont "visto o catturato!"

	para "È un prodotto di"
	line "alta tecnologia!"
	done

_OaksLabText25:
	text "Oak: <PLAYER> e"
	line "<GREEN>! Portate-"
	cont "li con voi!"

	para "<PLAYER> riceve"
	line "il Pokédex da Oak!"
	done

_OaksLabText26:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world<...>"

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

_OaksLabText27:
	text "<GREEN>: Alright"
	line "Pappy! Leave the"
	cont "catching to me!"

	para "<PLAYER>, I hate"
	line "saying this, but I"

	para "don't need your"
	line "help here!"

	para "Heh, I know! I'll"
	line "borrow a MAP CARD"
	cont "from my sis!"

	para "I'll ask her not"
	line "to give you one,"
	cont "<PLAYER>! Haha!"
	done

_OaksLabText27F:
	text "<GREEN>: Okay,"
	line "this sounds like"
	cont "fun."

	para "Oh, I know!"
	line "<PLAYER>, I'll"
	cont "race you to"
	cont "completing one!"

	para "I don't want"
	line "things to be"
	cont "unfair for you<...>"

	para "<...>so I'll ask my"
	line "sister to lend you"
	cont "a MAP CARD."

	para "I'll be seeing"
	line "you!"
	done

_OaksLabText_1d405:
	text "Io sono un assis-"
	line "tente del Profes-"
	cont "sor Oak, e studio"
	cont "i Pokémon con lui."
	done

_OakLabEmailText:
	text "C'é un'e-mail"
	line "aperta!"

	para "<...>"

	para "A tutti gli alle-"
	line "natori di Pokémon!"

	para "The elite trainers"
	line "of #MON LEAGUE"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "#MON and see"
	cont "how you rate as a"
	cont "trainer!"

	para "#MON LEAGUE HQ"
	line "INDIGO PLATEAU"

	para "PS: PROF.OAK,"
	line "please visit us!"
	cont "<...>"
	done

_PushStartText:
	text "Premi Start per"
	line "aprire il menu!"
	done

_SaveOptionText:
	text "L'opzione Salva"
	line "é nel menu."
	done

_StrengthsAndWeaknessesText:
	text "Tutti i tipi di"
	line "Pokémon hanno pun-"
	para "ti di forza e di"
	line "debolezza contro"
	cont "altri tipi."
	done


OaksLabRB_MapEventHeader: ; 0x19ba33
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $b, $5, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB

	; xy triggers
	db 4
	xy_trigger 2, 6, 4, 0, OaksLabRB_WaitComeBack, 0, 0
	xy_trigger 2, 6, 5, 0, OaksLabRB_WaitComeBack, 0, 0
	xy_trigger 3, 6, 4, 0, OaksLab_RivalBattleTriggerLeft, 0, 0
	xy_trigger 3, 6, 5, 0, OaksLab_RivalBattleTriggerRight, 0, 0

	; signposts
	db 17
	signpost 1, 6, $0, MapOaksLabRBSignpost11Script
	signpost 1, 7, $0, MapOaksLabRBSignpost11Script
	signpost 1, 8, $0, MapOaksLabRBSignpost11Script
	signpost 1, 9, $0, MapOaksLabRBSignpost11Script
	signpost 7, 0, $0, MapOaksLabRBSignpost11Script
	signpost 7, 1, $0, MapOaksLabRBSignpost11Script
	signpost 7, 2, $0, MapOaksLabRBSignpost11Script
	signpost 7, 3, $0, MapOaksLabRBSignpost11Script
	signpost 7, 6, $0, MapOaksLabRBSignpost11Script
	signpost 7, 7, $0, MapOaksLabRBSignpost11Script
	signpost 7, 8, $0, MapOaksLabRBSignpost11Script
	signpost 7, 9, $0, MapOaksLabRBSignpost11Script
	signpost 0, 4, $0, MapOaksLabRBSignpost12Script
	signpost 0, 5, $0, MapOaksLabRBSignpost13Script
	signpost 3, 9, $0, MapOaksLabRBSignpost14Script
	signpost 1, 0, $0, MapOaksLabRBSignpost15Script
	signpost 1, 1, $0, MapOaksLabRBSignpost15Script

	; people-events
	db 10
	person_event SPRITE_OAK, 6, 9, $6, 0, 0, -1, -1, 0, 0, 0, OakScript_OaksLabRB, EVENT_OAKS_LAB_OAK
	person_event SPRITE_SCIENTIST, 12, 6, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist1Script_OaksLabRB, -1
	person_event SPRITE_SCIENTIST, 13, 12, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist2Script_OaksLabRB, -1
	person_event SPRITE_TEACHER, 15, 5, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, LassScript_OaksLabRB, -1
	person_event SPRITE_EGK_RIVAL, 7, 8, $3, 0, 0, -1, -1, 0, 0, 0, BlueScript_OaksLabRB, EVENT_RB_RIVAL_IN_LAB
	person_event SPRITE_POKE_BALL, 7, 10, $0, 0, 0, -1, -1, 0, 0, 0, CharmanderPokeballScript, EVENT_SOMEONE_GOT_CHARMANDER_FROM_OAK
	person_event SPRITE_POKE_BALL, 7, 11, $0, 0, 0, -1, -1, 0, 0, 0, SquirtlePokeballScript, EVENT_SOMEONE_GOT_SQUIRTLE_FROM_OAK
	person_event SPRITE_POKE_BALL, 7, 12, $0, 0, 0, -1, -1, 0, 0, 0, BulbasaurPokeballScript, EVENT_SOMEONE_GOT_BULBASAUR_FROM_OAK
	person_event SPRITE_POKEDEX, 5, 6, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
	person_event SPRITE_POKEDEX, 5, 7, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
; 0x19bac7
