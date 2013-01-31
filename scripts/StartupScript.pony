// startup script
// this is executed when the program first starts running
// by TheComet

// disable iteration. this stops the program until the script has finished
DisableIteration

// turn all logging on and force all debug information to be written to debug log
TurnAllLoggingOn
ForceOutput 1

// load necessary scripts
LoadScript "scripts\maps\demomap\demomap.pony" 1
LoadScript "scripts\maps\demomap\scenery.pony" 2
LoadScript "scripts\maps\demomap\settings.pony" 3
LoadScript "scripts\gui\gui_ingame.pony" 4
LoadScript "scripts\units\twilightsparkle.pony" 5
LoadScript "scripts\units\genericpegasus.pony" 6
LoadScript "scripts\units\taintedgrunt.pony" 7
LoadScript "scripts\units\gak.pony" 8

// NOTE: script indexes 9-19 are used in map triggers. DON'T USE THEM.

// create in-game gui
RunScript 4

// create world
RunScript 1

// enables the drag box so units can be selected
GUIDragBoxEnable

// reset game timer - This is to exclude loading times from influencing how much of the game has progressed
ResetGameTimer

// turn all logging off
TurnAllLoggingOff
ForceOutput 0

// always use this command
end