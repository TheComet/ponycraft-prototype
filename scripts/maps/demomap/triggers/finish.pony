// -----------------------------------------------------------------------------------
// This is executed when twilight reaches rescue4
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// create ending splash screen
GUICreateSplash "media\images\splashscreens\success.jpg"

// delete all triggers
int i
for i = 0 to 10
	DestroyTrigger i
next i

// delete mini map
DestroyMinimap 0

// delete all units
for i = 0 to 80
	DestroyUnit i
next i

// delete gui
for i = 1 to 15
	GUIDestroyElement i
next i

// never forget this
end