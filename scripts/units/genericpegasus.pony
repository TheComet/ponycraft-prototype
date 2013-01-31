// Rainbow Dash unit script
// by TheComet

// -----------------------------------------------------------------------------------
// Initial setups
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// Variables
int n

// -----------------------------------------------------------------------------------
// Load unit
// -----------------------------------------------------------------------------------

// create a unit
// position at 0,0,0
// control is by player
CreateUnit 4 0 0 UNITCONTROL_PLAYER "media\objects\units\players\DerpyHooves\DerpyHooves.x"
n = this
UnitScale n 3.5 3.5 3.5

// -----------------------------------------------------------------------------------
// set keyframes
// -----------------------------------------------------------------------------------

// gound keyframes
SetValue Unit.Anim.Idle.Start 135 n
SetValue Unit.Anim.Idle.End 265 n
SetValue Unit.Anim.Creep.Start 0 n
SetValue Unit.Anim.Creep.End 40 n
SetValue Unit.Anim.Walk.Start 41 n
SetValue Unit.Anim.Walk.End 71 n
SetValue Unit.Anim.Run.Start 72 n
SetValue Unit.Anim.Run.End 92 n

// die keyframes
SetValue Unit.Anim.GroundDie1.Start 266 n
SetValue Unit.Anim.GroundDie1.End 286 n
SetValue Unit.Anim.GroundDie2.Start 287 n
SetValue Unit.Anim.GroundDie2.End 300 n
SetValue Unit.Anim.GroundDieBurn.Start 301 n
SetValue Unit.Anim.GroundDieBurn.End 326 n

// fly keyframes
SetValue Unit.Anim.TakeOffJump.Start 351 n
SetValue Unit.Anim.TakeOffJump.End 373 n
SetValue Unit.Anim.TakeOffFlyUp.Start 373 n
SetValue Unit.Anim.TakeOffFlyUp.End 386 n
SetValue Unit.Anim.TakeOffArriveTop.Start 387 n
SetValue Unit.Anim.TakeOffArriveTop.End 399 n
SetValue Unit.Anim.FlyIdle.Start 400 n
SetValue Unit.Anim.FlyIdle.End 439 n
SetValue Unit.Anim.Fly.Start 459 n
SetValue Unit.Anim.Fly.End 478 n
SetValue Unit.Anim.FlyIdleToFly.Start 440 n
SetValue Unit.Anim.FlyIdleToFly.End 458 n
SetValue Unit.Anim.FlyToFlyIdle.Start 479 n
SetValue Unit.Anim.FlyToFlyIdle.End 499 n
SetValue Unit.Anim.LandPrepare.Start 500 n
SetValue Unit.Anim.LandPrepare.End 519 n
SetValue Unit.Anim.LandFlyDown.Start 520 n
SetValue Unit.Anim.LandFlyDown.End 539 n
SetValue Unit.Anim.LandArriveBottom.Start 540 n
SetValue Unit.Anim.LandArriveBottom.End 566 n

// -----------------------------------------------------------------------------------
// set speed for frames
// -----------------------------------------------------------------------------------

// ground speeds
SetValue Unit.Anim.Idle.Speed 0.84 n
SetValue Unit.Anim.Creep.Speed 0.84 n
SetValue Unit.Anim.Walk.Speed 0.84 n
SetValue Unit.Anim.Run.Speed 0.84 n

// fly speeds
SetValue Unit.Anim.TakeOffJump.Speed 0.84 n
SetValue Unit.Anim.TakeOffFlyUp.Speed 0.7 n
SetValue Unit.Anim.TakeOffArriveTop.Speed 0.84 n
SetValue Unit.Anim.Fly.Speed 0.84 n
SetValue Unit.Anim.FlyIdle.Speed 0.78 n
SetValue Unit.Anim.FlyToFlyIdle.Speed 0.84 n
SetValue Unit.Anim.FlyIdleToFly.Speed 0.84 n
SetValue Unit.Anim.LandPrepare.Speed 0.84 n
SetValue Unit.Anim.LandFlyDown.Speed 0.84 n
SetValue Unit.Anim.LandArriveBottom.Speed 0.84 n

// die speeds
SetValue Unit.Anim.GroundDie1.Speed 0.33 n
SetValue Unit.Anim.GroundDie2.Speed 0.33 n
SetValue Unit.Anim.GroundDieBurn.Speed 0.33 n

// -----------------------------------------------------------------------------------
// Movement settings
// -----------------------------------------------------------------------------------

// set speed values
SetValue Unit.GroundSpeed 0.112 n
SetValue Unit.AirSpeed 0.134 n

// -----------------------------------------------------------------------------------
// View ranges
// -----------------------------------------------------------------------------------

// ranges
SetValue Unit.GroundViewRange 15.0 n
SetValue Unit.AirViewRange 28.0 n

// -----------------------------------------------------------------------------------
// Stats
// -----------------------------------------------------------------------------------

// health bar
SetValue Unit.Stats.HealthEnable 1 n
SetValue Unit.Stats.MaxHealth 100 n
SetValue Unit.Stats.CurrentHealth 100 n

// -----------------------------------------------------------------------------------
// Abilities
// -----------------------------------------------------------------------------------

// Flying ability
UnitAddAbility n UNITABILITY_FLY 9
GUIBindButtonToUnit 9 n
UnitSetAbilityGlobal n UNITABILITY_FLY

// Landing ability
UnitAddAbility n UNITABILITY_LAND 10
GUIBindButtonToUnit 10 n
UnitSetAbilityGlobal n UNITABILITY_LAND
UnitLockAbility n UNITABILITY_LAND

// NEVER forget this
end