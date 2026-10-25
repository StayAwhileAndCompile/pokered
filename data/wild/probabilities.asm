DEF wild_chance_slot = 0
DEF wild_chance_total = 0

MACRO wild_chance
	DEF wild_chance_total += \1
	db wild_chance_total - 1
	db wild_chance_slot * 2
	DEF wild_chance_slot += 1
ENDM

WildMonEncounterSlotChances:
; There are 10 slots for wild pokemon, and this is the list that defines how common each of
; those 10 slots is. A random number is generated and then the cumulative chance value up to the current
; slot (included) is compared against that random number. If the random number is less than or equal
; to said cumulative value, then that slot is chosen.
	table_width 2
	wild_chance 51 ; 51/256 = 19.9% chance of slot 0
	wild_chance 51 ; 51/256 = 19.9% chance of slot 1
	wild_chance 39 ; 39/256 = 15.2% chance of slot 2
	wild_chance 25 ; 25/256 =  9.8% chance of slot 3
	wild_chance 25 ; 25/256 =  9.8% chance of slot 4
	wild_chance 25 ; 25/256 =  9.8% chance of slot 5
	wild_chance 13 ; 13/256 =  5.1% chance of slot 6
	wild_chance 13 ; 13/256 =  5.1% chance of slot 7
	wild_chance 11 ; 11/256 =  4.3% chance of slot 8
	wild_chance  3 ;  3/256 =  1.2% chance of slot 9
	assert_table_length NUM_WILDMONS
	ASSERT wild_chance_total == 256, "WildMonEncounterSlotChances sum to {d:wild_chance_total}, not 256!"

DEF wild_chance_slot = 0
DEF wild_chance_total = 0

SafariZoneEncounterSlotChances:
; Used instead of WildMonEncounterSlotChances in the four Safari Zone areas.
; The rare Pokemon sit in slots 8 and 9 (and slot 7 in Blue's Center area),
; so those slots are boosted while staying below every common slot.
	table_width 2
	wild_chance 36 ; 36/256 = 14.1% chance of slot 0
	wild_chance 34 ; 34/256 = 13.3% chance of slot 1
	wild_chance 30 ; 30/256 = 11.7% chance of slot 2
	wild_chance 26 ; 26/256 = 10.2% chance of slot 3
	wild_chance 24 ; 24/256 =  9.4% chance of slot 4
	wild_chance 24 ; 24/256 =  9.4% chance of slot 5
	wild_chance 24 ; 24/256 =  9.4% chance of slot 6
	wild_chance 22 ; 22/256 =  8.6% chance of slot 7
	wild_chance 20 ; 20/256 =  7.8% chance of slot 8
	wild_chance 16 ; 16/256 =  6.3% chance of slot 9
	assert_table_length NUM_WILDMONS
	ASSERT wild_chance_total == 256, "SafariZoneEncounterSlotChances sum to {d:wild_chance_total}, not 256!"
