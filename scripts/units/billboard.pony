// billboard script
// by TheComet

// -----------------------------------------------------------------------------------
// Initial setups
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// -----------------------------------------------------------------------------------
// Load unit
// -----------------------------------------------------------------------------------

// create a unit
CreateUnit 0 0 0 UNITCONTROL_STATIC "media\objects\units\billboard\billboard.x"
UnitScale this 500 500 500
UnitRotate this 20

SetValue Unit.Anim.Idle.Start 135
SetValue Unit.Anim.Idle.End 165
SetValue Unit.Anim.Idle.Speed 0

// set speed values
SetValue Unit.GroundSpeed 0

// -----------------------------------------------------------------------------------
// Stats
// -----------------------------------------------------------------------------------

// health bar
SetValue Unit.Stats.HealthEnable 1
SetValue Unit.Stats.MaxHealth 2000
SetValue Unit.Stats.CurrentHealth 2000

// NEVER forget
end