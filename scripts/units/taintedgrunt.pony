// Tainted Grunt unit script
// by TheComet

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
CreateUnit 0 0 0 UNITCONTROL_ENEMY "media\objects\units\players\Grunt\Grunt.x"
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
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare1.Start 355
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare1.End 372
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease1.Start 372
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease1.End 400
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare2.Start 405
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare2.End 422
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease2.Start 422
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease2.End 445
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare3.Start 355
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare3.End 372
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease3.Start 372
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease3.End 400

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
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare1.Speed 1.3
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease1.Speed 1.3
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare2.Speed 1.3
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease2.Speed 1.3
SetValue Unit.Anim.ChangelingGroundMeleeAttackPrepare3.Speed 1.3
SetValue Unit.Anim.ChangelingGroundMeleeAttackRelease3.Speed 1.3

// die speeds
SetValue Unit.Anim.GroundDie1.Speed 0.34
SetValue Unit.Anim.GroundDie2.Speed 0.34
SetValue Unit.Anim.GroundDieBurn.Speed 0.34

// -----------------------------------------------------------------------------------
// Movement settings
// -----------------------------------------------------------------------------------

// set speed values
SetValue Unit.GroundSpeed 0.07

// -----------------------------------------------------------------------------------
// View ranges
// -----------------------------------------------------------------------------------

// set ranges
SetValue Unit.GroundViewRange 20

// -----------------------------------------------------------------------------------
// Stats
// -----------------------------------------------------------------------------------

// health bar
SetValue Unit.Stats.HealthEnable 1
SetValue Unit.Stats.MaxHealth 80
SetValue Unit.Stats.CurrentHealth 80

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
SetValue Unit.Ability.Automatic UNITABILITY_CHANGELING_MELEE_ATTACK

// set abilities to trigger all units and not just one
UnitSetAbilityGlobal this UNITABILITY_MOVE
UnitSetAbilityGlobal this UNITABILITY_STOP
UnitSetAbilityGlobal this UNITABILITY_HOLD
UnitSetAbilityGlobal this UNITABILITY_PATROL
UnitSetAbilityGlobal this UNITABILITY_ATTACK

// Ability settings
UnitSetAbilityRange this UNITABILITY_CHANGELING_MELEE_ATTACK 2.5
UnitSetAbilityHealthDamage this UNITABILITY_CHANGELING_MELEE_ATTACK 10
UnitSetAbilityAutomatic this UNITABILITY_CHANGELING_MELEE_ATTACK

// -----------------------------------------------------------------------------------
// Effects
// -----------------------------------------------------------------------------------

// 3D Smoke
GetUnitObject this n
CreateSmoke 0 6 0 0 0.4 n 5
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 0.01 0
CreateSmoke 0 6 0 0 0.4 n 6
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 0.01 0
CreateSmoke 0 6 0 0 0.4 n 7
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 0.01 0
CreateSmoke 0 6 0 0 0.4 n 5
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 0.01 0

CreateSmoke 0 6 0 0 0.5 n 37
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 -0.02 0
CreateSmoke 0 6 0 0 0.5 n 38
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 -0.01 0
CreateSmoke 0 6 0 0 0.5 n 38
UnitAddEffectToList unitID 0 this
SetSmokeForce this 0 0.01 0

// Eye glow
CreateEyeGlow 0 0 0 0 0.4 n 34
UnitAddEffectToList unitID 1 this
CreateEyeGlow 0 0 0 0 0.4 n 35
UnitAddEffectToList unitID 1 this

// NEVER forget
end