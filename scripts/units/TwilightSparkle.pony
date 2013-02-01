// Twilight Sparkle unit script
// by TheComet

// -----------------------------------------------------------------------------------
// Notes
// -----------------------------------------------------------------------------------

/*

	Buttons IDs are as follows
	-------------------------------
		2 - move
		3 - stop
		4 - hold
		5 - patrol
		6 - attack
		7 - teleport
		8 - force field
		9 - fly
		10 - land
		11 - meteor shower
	

*/

// -----------------------------------------------------------------------------------
// Initial setups
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// variables
int n
int unitID

// -----------------------------------------------------------------------------------
// Load unit
// -----------------------------------------------------------------------------------

// create a unit
CreateUnit 0 0 0 UNITCONTROL_PLAYER "media\objects\units\players\TwilightSparkle\TwilightSparkle.x"
UnitScale this 3 3 3

// store unit ID
unitID = this

// -----------------------------------------------------------------------------------
// set keyframes
// -----------------------------------------------------------------------------------

// gound keyframes
SetValue Unit.Anim.Idle.Start 135
SetValue Unit.Anim.Idle.End 165
SetValue Unit.Anim.Creep.Start 0
SetValue Unit.Anim.Creep.End 40
SetValue Unit.Anim.Walk.Start 41
SetValue Unit.Anim.Walk.End 71
SetValue Unit.Anim.Run.Start 72
SetValue Unit.Anim.Run.End 92

// attack keyframes
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare1.Start 5
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare1.End 10
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare2.Start 5
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare2.End 10
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare3.Start 5
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare3.End 10
SetValue Unit.Anim.UnicornGroundMagicAttackRelease1.Start 8
SetValue Unit.Anim.UnicornGroundMagicAttackRelease1.End 12
SetValue Unit.Anim.UnicornGroundMagicAttackRelease2.Start 8
SetValue Unit.Anim.UnicornGroundMagicAttackRelease2.End 12
SetValue Unit.Anim.UnicornGroundMagicAttackRelease3.Start 8
SetValue Unit.Anim.UnicornGroundMagicAttackRelease3.End 12
SetValue Unit.Anim.ForceFieldPrepare.Start 5
SetValue Unit.Anim.ForceFieldPrepare.End 10
SetValue Unit.Anim.ForceFieldRelease.Start 5
SetValue Unit.Anim.ForceFieldRelease.End 10
SetValue Unit.Anim.MeteorShowerPrepare.Start 5
SetValue Unit.Anim.MeteorShowerPrepare.End 10
SetValue Unit.Anim.MeteorShowerRelease.Start 5
SetValue Unit.Anim.MeteorShowerRelease.End 10

// die keyframes
SetValue Unit.Anim.GroundDie1.Start 266
SetValue Unit.Anim.GroundDie1.End 286
SetValue Unit.Anim.GroundDie2.Start 287
SetValue Unit.Anim.GroundDie2.End 300
SetValue Unit.Anim.GroundDieBurn.Start 301
SetValue Unit.Anim.GroundDieBurn.End 326

// -----------------------------------------------------------------------------------
// set speed for frames
// -----------------------------------------------------------------------------------

// ground speeds
SetValue Unit.Anim.Idle.Speed 0.84
SetValue Unit.Anim.Creep.Speed 0.84
SetValue Unit.Anim.Walk.Speed 0.84
SetValue Unit.Anim.Run.Speed 0.84

// attack speeds
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare1.Speed 0.14
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare2.Speed 0.14
SetValue Unit.Anim.UnicornGroundMagicAttackPrepare3.Speed 0.14
SetValue Unit.Anim.UnicornGroundMagicAttackRelease1.Speed 0.14
SetValue Unit.Anim.UnicornGroundMagicAttackRelease2.Speed 0.14
SetValue Unit.Anim.UnicornGroundMagicAttackRelease3.Speed 0.14
SetValue Unit.Anim.ForceFieldPrepare.Speed 2.2
SetValue Unit.Anim.ForceFieldRelease.Speed 0.9
SetValue Unit.Anim.MeteorShowerPrepare.Speed 2.2
SetValue Unit.Anim.MeteorShowerRelease.Speed 0.9

// die speeds
SetValue Unit.Anim.GroundDie1.Speed 0.34
SetValue Unit.Anim.GroundDie2.Speed 0.34
SetValue Unit.Anim.GroundDieBurn.Speed 0.34

// -----------------------------------------------------------------------------------
// Movement settings
// -----------------------------------------------------------------------------------

// set speed values
SetValue Unit.GroundSpeed 0.1

// -----------------------------------------------------------------------------------
// View ranges
// -----------------------------------------------------------------------------------

// set ranges
SetValue Unit.GroundViewRange 20.0

// -----------------------------------------------------------------------------------
// Limb attachments
// -----------------------------------------------------------------------------------

// spell casting limb
SetValue Unit.SpellCastLimb 86

// -----------------------------------------------------------------------------------
// Stats
// -----------------------------------------------------------------------------------

// health bar
SetValue Unit.Stats.HealthEnable 1
SetValue Unit.Stats.MaxHealth 200
SetValue Unit.Stats.CurrentHealth 200

// Mana bar
SetValue Unit.Stats.ManaEnable 1
SetValue Unit.Stats.MaxMana 200
SetValue Unit.Stats.CurrentMana 200

// Regeneration rates
SetValue Unit.Stats.ManaRegenerationRate 0.025
SetValue Unit.Stats.HealthRegenerationRate 0.005

// -----------------------------------------------------------------------------------
// Abilities
// -----------------------------------------------------------------------------------

// standard abilities (move, stop, hold, patrol, attack)
UnitAddAbility this UNITABILITY_MOVE 2
GUIBindButtonToUnit 2 this
UnitAddAbility this UNITABILITY_STOP 3
GUIBindButtonToUnit 3 this
UnitAddAbility this UNITABILITY_HOLD 4
GUIBindButtonToUnit 4 this
UnitAddAbility this UNITABILITY_PATROL 5
GUIBindButtonToUnit 5 this
UnitAddAbility this UNITABILITY_ATTACK 6
GUIBindButtonToUnit 6 this
SetValue Unit.Ability.Automatic UNITABILITY_MAGIC_MISSILE

// set abilities to trigger all units and not just one
UnitSetAbilityGlobal this UNITABILITY_MOVE
UnitSetAbilityGlobal this UNITABILITY_STOP
UnitSetAbilityGlobal this UNITABILITY_HOLD
UnitSetAbilityGlobal this UNITABILITY_PATROL
UnitSetAbilityGlobal this UNITABILITY_ATTACK

// teleport
UnitAddAbility this UNITABILITY_TELEPORT 7
GUIBindButtonToUnit 7 this
UnitSetAbilityLocal this UNITABILITY_TELEPORT

// force field
UnitAddAbility this UNITABILITY_FORCE_FIELD 8
GUIBindButtonToUnit 8 this
UnitSetAbilityLocal this UNITABILITY_FORCE_FIELD

// meteor shower
UnitAddAbility this UNITABILITY_METEOR_SHOWER 11
GUIBindButtonToUnit 11 this
UnitSetAbilityLocal this UNITABILITY_METEOR_SHOWER

// -----------------------------------------------------------------------------------
// Ability Settings
// -----------------------------------------------------------------------------------

// Magic Missile
UnitSetAbilityRange this UNITABILITY_MAGIC_MISSILE 17.0
UnitSetAbilityHealthDamage this UNITABILITY_MAGIC_MISSILE 18
UnitSetAbilityAutomatic this UNITABILITY_MAGIC_MISSILE
UnitSetAbilityManaDrain this UNITABILITY_MAGIC_MISSILE 200

// Teleport
UnitSetAbilityRange this UNITABILITY_TELEPORT 11.0
UnitSetAbilityManaDrain this UNITABILITY_TELEPORT 50
UnitSetAbilityGlobal this UNITABILITY_TELEPORT

// Force Field
UnitSetAbilityRange this UNITABILITY_FORCE_FIELD 14.0
UnitSetAbilityManaDrain this UNITABILITY_FORCE_FIELD 25

// Meteor Shower
UnitSetAbilityRange this UNITABILITY_METEOR_SHOWER 10.0
UnitSetAbilityManaDrain this UNITABILITY_METEOR_SHOWER 100
UnitSetAbilityHealthDamage this UNITABILITY_METEOR_SHOWER 2.5

// -----------------------------------------------------------------------------------
// Sounds
// -----------------------------------------------------------------------------------

// select
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select1.wav" UNITSOUND_SELECT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select2.wav" UNITSOUND_SELECT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select3.wav" UNITSOUND_SELECT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select4.wav" UNITSOUND_SELECT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select5.wav" UNITSOUND_SELECT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select6.wav" UNITSOUND_SELECT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_select7.wav" UNITSOUND_SELECT

// annoyed
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_annoyed1.wav" UNITSOUND_ANNOYED
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_annoyed2.wav" UNITSOUND_ANNOYED
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_annoyed3.wav" UNITSOUND_ANNOYED
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_annoyed4.wav" UNITSOUND_ANNOYED
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_annoyed5.wav" UNITSOUND_ANNOYED

// movement
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move1.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move2.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move3.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move4.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move5.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move6.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move7.wav" UNITSOUND_MOVE
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_move8.wav" UNITSOUND_MOVE

// target
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_target1.wav" UNITSOUND_TARGET
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_target2.wav" UNITSOUND_TARGET
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_target3.wav" UNITSOUND_TARGET
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_target4.wav" UNITSOUND_TARGET
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_target5.wav" UNITSOUND_TARGET
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_target6.wav" UNITSOUND_TARGET

// teleport
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_teleport1.wav" UNITSOUND_TELEPORT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_teleport2.wav" UNITSOUND_TELEPORT
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_teleport3.wav" UNITSOUND_TELEPORT

// force field
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_shield1.wav" UNITSOUND_FORCEFIELD
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_shield2.wav" UNITSOUND_FORCEFIELD
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_shield3.wav" UNITSOUND_FORCEFIELD

// meteor shower
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_meteorshower1.wav" UNITSOUND_METEOR_SHOWER
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_meteorshower2.wav" UNITSOUND_METEOR_SHOWER
UnitAddSound unitID "media\sounds\units\TwilightSparkle\twi_meteorshower3.wav" UNITSOUND_METEOR_SHOWER

// -----------------------------------------------------------------------------------
// Portrait
// -----------------------------------------------------------------------------------

UnitAddPortraitFrame unitID media\images\GUI\portTwilight.png

// NEVER forget
end