// -----------------------------------------------------------------------------------
// Map settings
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// -----------------------------------------------------------------------------------
// Units
// -----------------------------------------------------------------------------------

// Create Twilight, unit index is stored in 0 if done correctly
RunScript 5

// Create 4 pegasi to be rescued, indexes stored in 1-4 if done correctly
int i
for i = 1 to 4
	RunScript 6
next i

// Position 4 pegasi
UnitPosition 1 51.8 0 45.4
UnitPosition 2 48.8 0 118.7
UnitPosition 3 -20.9 0 70.4
UnitPosition 4 -80.9 0 121.8

// Create 20 enemies
for i = 1 to 20
	RunScript 7
next i

// position enemies
UnitPosition 5 -16 0 54
UnitPosition 6 2 0 84
UnitPosition 7 18 0 84
UnitPosition 8 24 0 83
UnitPosition 9 60 0 59
UnitPosition 10 61 0 79
UnitPosition 11 61 0 79
UnitPosition 12 47 0 5
UnitPosition 13 33 0 50
UnitPosition 14 24 0 142
UnitPosition 15 -9 0 110
UnitPosition 16 -39 0 83
UnitPosition 17 -35 0 49
UnitPosition 18 -65 0 27
UnitPosition 19 -86 0 73
UnitPosition 20 -74 0 147
UnitPosition 21 -99 0 122
UnitPosition 22 -108 0 80
UnitPosition 23 -108 0 80
UnitPosition 24 -11 0 -20

// -----------------------------------------------------------------------------------
// Billboard easter egg
// -----------------------------------------------------------------------------------

RunScript 20
UnitPosition 25 71 -5 100
UnitRotate 25 20

CreateTrigger 76 -5 103 2 1 "scripts\maps\demomap\triggers\easteregg.pony" 19
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT_CONTROL UNITCONTROL_PLAYER

// -----------------------------------------------------------------------------------
// Set up triggers
// -----------------------------------------------------------------------------------

// Twilight dies
CreateTrigger 0 0 0 0 0 "scripts\maps\demomap\triggers\twilightdeath.pony" 9
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT_DEATH 0

// Twilight reaches rescue point 1
CreateTrigger 51.8 0 45.4 6 0 "scripts\maps\demomap\triggers\rescue1.pony" 10
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT 0
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 1

// Twilight reaches rescue point 2
CreateTrigger 48.8 0 118.7 6 0 "scripts\maps\demomap\triggers\rescue2.pony" 11
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT 0
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 2

// Twilight reaches rescue point 3
CreateTrigger -20.9 0 70.4 6 0 "scripts\maps\demomap\triggers\rescue3.pony" 12
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT 0
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 3

// Twilight reaches rescue point 4
CreateTrigger -80.9 0 121.8 6 0 "scripts\maps\demomap\triggers\rescue4.pony" 13
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT 0
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 4

// Rescue1 pony dies
CreateTrigger 0 0 0 0 0 "scripts\maps\demomap\triggers\rescue1_death.pony" 14
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT_DEATH 1

// Rescue2 pony dies
CreateTrigger 0 0 0 0 0 "scripts\maps\demomap\triggers\rescue2_death.pony" 15
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT_DEATH 2

// Rescue3 pony dies
CreateTrigger 0 0 0 0 0 "scripts\maps\demomap\triggers\rescue3_death.pony" 16
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT_DEATH 3

// Rescue4 pony dies
CreateTrigger 0 0 0 0 0 "scripts\maps\demomap\triggers\rescue4_death.pony" 17
AddTriggerCondition this TRIGGER_JUNCTION_OR TRIGGER_TYPE_UNIT_DEATH 4

// Finish
CreateTrigger -80 0 2 10 1 "scripts\maps\demomap\triggers\finish.pony" 18
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 0
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 1
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 2
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 3
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT 4
AddTriggerCondition this TRIGGER_JUNCTION_AND TRIGGER_TYPE_UNIT_CONTROL UNITCONTROL_PLAYER

// never forget this
end

/*
Start : 0,0
derp1 : 51.8,45.4
derp2 : 48.8,118.7
derp3 : -20.5,70.4
derp4 : -80.9,121.8
finish : -80.0,2.0
*/