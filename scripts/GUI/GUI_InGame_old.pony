// Standard GUI interface
// by TheComet

// disable iteration. This stops the program until the script has finished
DisableIteration

// variables
int i

// load background static images, store in 0 and 1
// GUIAddStaticImage 0 0 675 media\images\GUI\gui_static_2.png
GUIAddStaticImage 1 542 975 media\images\GUI\gui_static_1.png

// load default buttons
GUIAddButton 2 1252 998 16 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\move.png" 0
GUIAddButton 3 1320 998 17 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\stop.png" 1
GUIAddButton 4 1388 998 18 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\hold.png" 1
GUIAddButton 5 1456 998 19 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\patrol.png" 1
GUIAddButton 6 1524 998 20 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\attack.png" 1

// teleport button
GUIAddButton 7 1252 1134 44 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\teleport.png" 1

// force field button
GUIAddButton 8 1320 1135 45 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\forcefield.png" 1

// fly and land button
GUIAddButton 9 1252 1066 30 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\fly.png" 1
GUIAddButton 10 1320 1066 31 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\land.png" 1

// meteor shower button
GUIAddButton 11 1388 1135 46 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\meteorshower.png" 1
GUIButtonSetIconDiffuseOnLocked 11 0x808080

// Button for loading more Twilights
GUIAddButton 12 1500 50 0 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\empty.png" 1
GUIButtonEventClick 12 LoadTwilight

// Button for loading more Derpies (Derps?)
GUIAddButton 13 1500 120 0 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\empty.png" 1
GUIButtonEventClick 13 LoadRainbow

// Button for creating 10 units
GUIAddButton 14 1500 190 0 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\empty.png" 1
GUIButtonEventClick 14 MoreUnits

// Button for deleting all units
GUIAddButton 15 1500 260 0 "media\images\GUI\btn.png" "media\images\GUI\btn_g.png" "media\images\GUI\btn_p.png" "media\images\GUI\btn_l.png" "media\images\GUI\symbols\empty.png" 1
GUIButtonEventClick 15 DeleteUnits

GUISetPortraitPosition 50 50

// messages for help
CreateMessage 1200 50 "Twilight Sparkle --" 0 0xFFFFFFFF
CreateMessage 1200 120 "Derpy Hooves --" 0 0xFFFFFFFF
CreateMessage 1200 190 "Enemy --" 0 0xFFFFFFFF
CreateMessage 1200 260 "Delete All Units --" 0 0xFFFFFFFF

// NEVER forget this
end

// Grid Info for background
// ------------------------------------------
// x: 1252    1320    1388    1456    1524
// y: 998     1066    1134

event LoadTwilight
	RunScript 5
endevent

event LoadRainbow
	RunScript 6
endevent

event MoreUnits
	RunScript 7
endevent

event DeleteUnits
	for i = 0 to 50
		DestroyUnit i
	next i
endevent