// -----------------------------------------------------------------------------------
// Demo Map
// by TheComet
// -----------------------------------------------------------------------------------

// disable iteration. This stops the program until the script has finished
DisableIteration

// -----------------------------------------------------------------------------------
// Set up world
// -----------------------------------------------------------------------------------

// Clean up world
DestroyWorld

// load terrain into world
WorldAddTerrainObject "media\objects\maps\derp\derp.x"

//WorldAddSceneryObject "media\objects\maps\derp\derp_pf.x" "media\objects\maps\derp\derp"

// Add ruins
//RunScript 2

// Create the mini map
// Must be created right after world is loaded, otherwise unwanted objects will be visible on it (such as Fog of War)
CreateMinimap 20 930 270 1180 -120 -29 81 156

// load pathfinder
WorldCreatePathfinder -126 -33 89 159 200 200 5 "media\objects\maps\derp\derp_pf.x"

// create fog of war
WorldCreateFogOfWar -142 -47 112 170

// -----------------------------------------------------------------------------------
// Camera settings
// -----------------------------------------------------------------------------------

// Set camera limits
SetValue Camera.MinPos.x -117
SetValue Camera.MaxPos.x 74
SetValue Camera.MinPos.z -39
SetValue Camera.MaxPos.z 139

// pan camera to beginning
PanCamera 0 -15

// -----------------------------------------------------------------------------------
// Settings
// -----------------------------------------------------------------------------------

// map settings
//RunScript 3

// NEVER forget this
END