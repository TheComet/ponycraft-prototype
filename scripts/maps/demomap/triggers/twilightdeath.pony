// -----------------------------------------------------------------------------------
// This is executed when twilight dies
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// Pan camera to spawn coordinates and create twilight again
PanCamera 0 -15
RunScript 5

// Destroy all 4 pegasi
int i
for i = 1 to 4
	DestroyUnit i
next i

// never forget this
end