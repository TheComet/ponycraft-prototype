////////////////////////////////
// Standard GUI interface     //
// by TheComet                //
////////////////////////////////
// Edited by nonZero          //
// Beautified by nonZero      //
////////////////////////////////

///////////
// Notes //
////////////////////////////////////////////////////////////////////////
//                                                                    //
// Changed in script:                                                 //
//      "GUI\btn.png" ---> "GUI\btNormal_01.png"                      //
//      "GUI\btn_l.png" ---> "GUI\btLocked.png"                       //
//      "GUI\btn_g.png" ---> "GUI\btMouseOver_01.png"                 //
//      "GUI\btn_p.png" ---> "GUI\btClicked_01.png"                   //
//      "symbols\%[iconName].png" ---> "symbols\ico%[iconName]%.png"  //
//      Button declaration order sorted by y-position                 //
//      Blank buttons added to fill gap                               //
//      GUISetPortraitPosition changed to align portrait              //
//      Added GUIStaticImage to show info panel placement.            //
//                                                                    //
////////////////////////////////////////////////////////////////////////
//                                                                    //
// [Bug] Buttons show when not attached to a unit                     //
//       Fix by hiding the buttons                                    //
//                                                                    //
////////////////////////////////////////////////////////////////////////


/*
		*********************************
		*	Developer Alignment Info	*
		*********************************

Element					Size			xPos	yPos	Tested		Status
Mini Map				 250 x  250		  20	 930	Y			Green
Info Panel				 745 x  194		 295	 985	N			Orange. Could only test with GUIAddStaticImage (Image gets scaled funny)
Portrait				 162 x  194		1068	 985	Y			Green
Buttons					  64 x   64		1252	 985	Y			Green
GUI Background			2400 x  345		-300	 855	Y			Yellow. Cannot get image down to 300px. Apologies for 45px over.

*/




//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Initialization      *|
//                                                                                                                                \* * * * * * * * * * * */

// disable iteration. This stops the program until the script has finished
	DisableIteration

// variables
	int i
	int j


//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Make GUI backdrop   *|
//                                                                                                                                \* * * * * * * * * * * */


// Don't ever change the x-position offset ever. Using 2400px wide image at -300 is the best for multiple AR and "future-proofing"
	GUIAddStaticImage 1 -300 855 media\images\GUI\GUI_Background.png




//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Make Mane Buttons   *|
//                                                                                                                                \* * * * * * * * * * * */

// load default buttons
	GUIAddButton 2 1252 985 16 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoMove.png" 0
	GUIAddButton 3 1320 985 17 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoStop.png" 0
	GUIAddButton 4 1388 985 18 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoHold.png" 0
	GUIAddButton 5 1456 985 19 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoPatrol.png" 0
	GUIAddButton 6 1524 985 20 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoAttack.png" 0
// ^990


// fly and land button
	GUIAddButton 9 1252 1053 30 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoFly.png" 0
	GUIAddButton 10 1320 1053 31 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoLand.png" 0

// Blank Buttons (One day they'll get their Icon-Mark)
	GUIAddButton 1003 1388 1053 27 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoNull.png" 0
	GUIAddButton 1004 1456 1053 27 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoNull.png" 0
	GUIAddButton 1005 1524 1053 27 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoNull.png" 0

// teleport button
	GUIAddButton 7 1252 1121 44 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoTeleport.png" 0

// meteor shower button
	GUIAddButton 11 1388 1121 46 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoMeteorshower.png" 0

// force field button
	GUIAddButton 8 1320 1121 45 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoForcefield.png" 0

// Blank Buttons (One day they'll get their Icon-Mark)
	GUIAddButton 1001 1456 1121 27 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoNull.png" 0
	GUIAddButton 1002 1524 1121 27 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoNull.png" 0



//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Make Dev Buttons    *|
//                                                                                                                                \* * * * * * * * * * * */

// Button for loading more Twilights
	GUIAddButton 12 1500 50 0 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoAddTwi.png" 1
	GUIButtonEventClick 12 LoadTwilight

// Button for loading more Derpies (Derps?)
	GUIAddButton 13 1500 120 0 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoAddDerpy.png" 1
	GUIButtonEventClick 13 LoadRainbow

// Button for creating 10 units
	GUIAddButton 14 1500 190 0 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoAddEnemy.png" 1
	GUIButtonEventClick 14 MoreUnits

// Button for deleting all units
	GUIAddButton 15 1500 260 0 "media\images\GUI\btNormal_01.png" "media\images\GUI\btMouseOver_01.png" "media\images\GUI\btClicked_01.png" "media\images\GUI\btLocked.png" "media\images\GUI\symbols\icoDeleteAllUnits.png" 1
	GUIButtonEventClick 15 DeleteUnits

// comment this out for dev mode
	GUIHideElement 12
	GUIHideElement 13
	GUIHideElement 14
	GUIHideElement 15

//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Hide all buttons    *|
//                                                                                                                                \* * * * * * * * * * * */

// This is to fix the bug where buttons are visible when not bound to units (see notes)
	GUIHideElement 2
	GUIHideElement 3
	GUIHideElement 4
	GUIHideElement 5
	GUIHideElement 6
	GUIHideElement 7
	GUIHideElement 8
	GUIHideElement 9
	GUIHideElement 10
	GUIHideElement 11
	GUIHideElement 1001
	GUIHideElement 1002
	GUIHideElement 1003
	GUIHideElement 1004
	GUIHideElement 1005

//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Button Animations   *|
//                                                                                                                                \* * * * * * * * * * * */
//	REMOVED DUE TO ENGINE HASSLES

//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Setup Icons         *|
//                                                                                                                                \* * * * * * * * * * * */


/* Set icons diffuse for all states (needs to be done maunually because for-loops don't work for these) */




// Set MouseOver diffuse
	GUIButtonSetIconDiffuseOnMouseOver 2 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 3 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 4 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 5 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 6 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 7 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 8 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 9 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 10 0x000001
	GUIButtonSetIconDiffuseOnMouseOver 11 0x000001

// Set PresssedState diffuse
	GUIButtonsetIconDiffuseOnPress 2 0x007070
	GUIButtonsetIconDiffuseOnPress 3 0x007070
	GUIButtonsetIconDiffuseOnPress 4 0x007070
	GUIButtonsetIconDiffuseOnPress 5 0x007070
	GUIButtonsetIconDiffuseOnPress 6 0x007070
	GUIButtonsetIconDiffuseOnPress 7 0x007070
	GUIButtonsetIconDiffuseOnPress 8 0x007070
	GUIButtonsetIconDiffuseOnPress 9 0x007070
	GUIButtonsetIconDiffuseOnPress 10 0x007070
	GUIButtonsetIconDiffuseOnPress 11 0x007070

// Set NormalState diffuse (not necessary since it's default but I believe in being implicit)
	GUIButtonSetIconDiffuseOnNormal 2 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 3 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 4 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 5 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 6 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 7 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 8 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 9 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 10 0xFFFFFF
	GUIButtonSetIconDiffuseOnNormal 11 0xFFFFFF

// Set ButtonLocked diffuse
	GUIButtonSetIconDiffuseOnLocked 2 0x707070
	GUIButtonSetIconDiffuseOnLocked 3 0x707070
	GUIButtonSetIconDiffuseOnLocked 4 0x707070
	GUIButtonSetIconDiffuseOnLocked 5 0x707070
	GUIButtonSetIconDiffuseOnLocked 6 0x707070
	GUIButtonSetIconDiffuseOnLocked 7 0x707070
	GUIButtonSetIconDiffuseOnLocked 8 0x707070
	GUIButtonSetIconDiffuseOnLocked 9 0x707070
	GUIButtonSetIconDiffuseOnLocked 10 0x707070
	GUIButtonSetIconDiffuseOnLocked 11 0x707070



//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Create Portrait     *|
//                                                                                                                                \* * * * * * * * * * * */

// Create portrait for selected units
// Portraits must be 194x162. Paste this line below to the "TwilightSparkle.pony" script where the button was
// UnitAddPortraitFrame unitID media\images\GUI\portTwilight.png

// This will set the global position of all portraits
	GUISetPortraitPosition 1068 985



//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Create Infopanel    *| >> TODO
//                                                                                                                                \* * * * * * * * * * * */

// Create info panel - no command was found, using a GUIStaticImg
// GUIAddStaticImage 1050 295 985 media\images\GUI\infoPanel.png



//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * END                 *|
//                                                                                                                                \* * * * * * * * * * * */

// NEVER forget this
	end                                                                                                                               



//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * Events              *|
//                                                                                                                                \* * * * * * * * * * * */

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






//                                                                                                                                /* * * * * * * * * * * *\
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< * End Of File (EOF)   *|
//                                                                                                                                \* * * * * * * * * * * */

























































/*
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                    ```````                                                                                                                                                         
                                                                         `                                                                                                                          ````...------...```                                                                                                                         `..--::/:::-.``                                                                                                                                                     
                                                                     `-::.`         ```                                                                                                          `.--://////+++++////:-``  `                                                                                                                 ``./+osssssssso+/:-.                                                                                                                                                   
                                                                ``.:/ooss-`    `    `:++:-.`                                                                                                 ``.:////++++////+++//++++/--...``                                                       `                                                      `-/ossyyssssssyssoo+/:``                                                                                                                                                
                                                              `.:+ooosyss-`          `-+ooo/:-`                                                                                            `.-///++++///+++///++////+++/:---..`                                                             `                                               -/ossssyssyssssssssso+-.`                                                                                                                                               
                                                           `.-+osssssssss/.           `-osssso+-.`                                                                                      ``.:///////+////+++++++++++////+/:-----``                                                         `.`                                              `/+ossssysssssssssssssso:.                                                                                                                                               
                                                         `./+ossssssssssso:.          `.osssssso+:.                              ``.....```                                            `.:/+++/////////++++/++//++///++++/----/-.`                                  `.-:-.               ./oo.`                                            `/ossssssssyyssssssssssyo:`                                                                                                                                              
                                                       `-/osssssssssssyssso/.`` `  ``.-ossssssssso+-.                     ``..-:///+///////::-.```                                   `.:/+++++++++++/////++/+//+sso/+++++/:---+::-```                            ``-+syhy+.`           `.oyhh/.                                          ```:ossssssssssssssssssssss+-`                                                                                                                                             
                                                      `/+osssssssssssssssssso/::---:/ossssssssssssso/.                  `.-:+++++++o+++o+++ooo+//:``                                .-//+++//+++++++++//////+/+oNmho///++/:--:+://::-.`                         `-/syhddhy:```       ``-+yhhho:-..........````                       `..---.:ossyyyysssossssssssssoso/..````                                                           ```                                                                          
                                                    `-+ssssssssssssssssssssssssssssssssyssssssssssssoo.`           ```-:/+++///+ooo+++++oosssssssso+/-``        `                 `.:/+//////////////+//+//://ohNNmy+//++/:--:+:/+ydmdo:.                      `/oyhhdddhy+.``````````-+shhhhsoo+/:-----:----..``                   `/+ossso/osysssssooooooossssssssoo+++//:-.``                                        `  ```.-::/++++oooo+++//:-.```                                                              
                                                   `:+ssssssssssssssssssssssssssssssssssssssssssssssss+.`         ``-/+oo+:.-/++ooo+ooossssssssssydmdy+:.`   `.:/:.`             `.//////////////////////+++//odNNmdo+/++/:--:+/+smNNNmy+.                    `/shdhhdhddho-.......--:oyhhddhssysso/:-----------..`                `-osssyysssssooooosssssssssssssyssosssssss+/-``                                    ``..:/oyyhhdddmmmmmdddddhhyyyso+-.``                                                          
                                                 ``+ossssssssssssssssssssssssssssssssssssssssssssssssss/-         .-:syhdyo/++++ooooossssssssssyhmNNNNmdy+-.`:ohdhs/``          `.:////+++//++//////////////++smNNNNso/++/--:///ohNNNNNNd+`                  .:yhhhhhddddho----------:+shhhhyssssssy+/:-------::--.````  ``..------:/osssssssss+osysyyyssssssssoosyysossyyyyhhys+-.`                               ``-/+yhdmmmdmmmmmmmdddhhhddddddmmmmhys/.`                                                        
                                                `-/sssssssssssssssssssssssssssssssssssssssssssssssssssso/`    ``  `-+hhhyoo+oo+oooosyssssssssyhmNNNNNNNNmmhs+shddddh+-`         -://+++///:+syhhy+:-::://////+ymNNNNhs+++/:-:/:/sdNNNNmNNd/.                `:ohhhyhdddhhh+--:---------/ohhhhoooysssyo/--------:---.`` `.-/++osssssssooooossysoosssyssssyyyssssssosssossyyhdmdddho/.`                           ``:+shhdmmmmmmmdmmmmdddhddmmmmmmmmmmmmmmdhy+-`                                                      
                                                -+sssssssssssssssssssssssssssyyyyyyyyyyssssssssssssssssso:        ./hhyo++++oooossssssssssssydmNNNNNNNNNNNNmhydddddddo:        .:/+++//::/hmNNNNmh+/:----////oymNNNNms++osssso//smNNNNdmNNy/`              `.+hdyyydddddhy:------:-------oyhhs+/osssyso/------------..-:+osssssssssssssssooosoosyssysssssssssssssoossosyyhdmmmmmdhs+-`                        .-/yddddddmmmmmmmmmmdddddmmmmmmmmmmdmmmmmmmdmdy/.`                                                    
                                               .+ssssssyyysssssssssssssyyhhhhdddddddddddhhhyssssssssssysso`      `/syoo++oooosssssyyysossssdmmNNNNNNNNNNNNNmydddddddhho-      `-/+///::-/sNNNNNNNmy+-::/oso//shmNNNNmdhmNNNNNNmhdmNNNNmmmNms-              `/shdyyhhddddy+.---:---::----.-/oho+//ossssso:-:----:-----.-+sssssyssyysssssssssssossssssssysssssssssssossossyddmmmmdddhy+-`            ```    ``.:yhdmmdddmmmmmmmddmdddddmmmmmmmmmmmmmmmmmmmmmmmddo:`                                                   
                                              `+sssssyhhhhssssssssyyyhhddmmmmNNNmNNNNNNNmmmddhyyssssssssso.`    `.+s++oosssssssssssssssssydmNNNNNNNNNNmNNmmdhdddddddhdyo`    `.:++/::-::+yNNNNNNNNds/oydmNmh/shmmNNNmmdMNNNNNNNNNmNNNNmmmMNy/               +shdyhdhdhy+:.--::----::-------:oo+:/+osyyss/:-----:------.+oyssssssssssssssssssssssssssyssssssssssssy+ssssyydmmmmmddddhs/-`         .-o+/.`` -+shmmmmmddmmmmmmmmmdddddmmmmmmmmmmmmmmmmmmmmmmmmmmmho-                                                   
                                             .:sssysyhddhhyssssyyydddmmmmmmNNNNNNNNNNNNNNNNmmmmdhyssssssss-.    `/+++oossyyysssssssssssshdNNNNNNNNNNNNNNNmysydddddddhddh.`   `-///---:::odMmmNNNNNNdymNNNNNNmhdmNNNNNmmMNNNNNNMNNNNNNMmmmNNho               oyhhhhhyo/-.---:-----.----------://///+syysso/---:---------:+yssysssssssssssssssssssssssyyssssssssssss+ydhyyymmmmmmddmmdyo/.        :ommmmy::/hdddmmmmmddmmmmmmmmmdhdmmmmmmmmmmmmmmmmmmmmmmmmmmdmmmhs`                                                  
                                             -+sssshhdhddhhysyhddmmmNNNNNmmmmmNNNNNNmNNNNNNNNNNNmmdhyyssss:.    `++ossssssssssssssssssshmNNNNNNmmNNNNNNmdosyddddddddyhdh:.  `.:/:--::::/smMmmMNNNNNNmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNMNNMmmNNNds               +syoo+:--------------:--:-------:::////oyssss+:-:::--:------:sssssssysssssssssssssssssssssssssssssssssohdmddhmmmmmmdhdmdhs+:```    .sdmNNNNdhhdddddmmmmdhmmmmmmmmddhmmmmmmmmmmmmmmmmmmmmmmmmmdmmmmmdd-`                                                 
                                            ./syssydhhdddddyhdmNNNNNNNNNNNNNmmmNNNNNNmmmNNNNNNNNNNNmdhssss/.  `.:osssssssssssssssssssydNNNNddhhyhmNNNmhsohddddddddddyhdh+.  `-:::--::::/smNmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNMNNNNmho               -+o-..----:---:---.os/.-:-::----:::////+ssssyo/--::--:----:.-osssysssssssssssssyyyyyyssssssssssssssssohdmmmmmmmmmmmdhdddhyo/``    `odNNNNNNmdhddddmmmmmmddmmmmmmmhdmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmdddds-                                                 
                                            -+sssydhhhdhdddyhmmmNNNNNNNNNNNNNmmmmNNNNNmmmmNNNNNNNNNNmmhyss/.  .:osooosssssssssssssssyhmmdhyyyysyhNNNdyoyddddddddddddyddd+-  `-:-:::-::::omNNmdNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmdNyhMymNNmy+               ./sh+:.------:---.oyy+..-----------:/://sssssso--::-::----:.-/sssyyyyoooshhddddmmmmddddhssssssssssssssmmmmmmmdmmmdmmdddddyso.``   `hmmmNNNNNmddddhmmdmmdddmmmmmmhdmmmmmmmmmmmmmmmmmmmmmmmmmmmmmddmmmmh/`                                                
                                            +osyyhhyhddhhddhhdNNNNNNNNNNNNNNNNNNdNNNNNNNmmNNmmmNNNNNNNmdhs:.  :+o+++osssyyyssssyssssyysshddhyoymNmdysydddhyyhddddyhhhddh/.  .--::----:::+hNNNmmNNmdmNdmNNMNNNNNNNNNNMNNNNNNNNmmds+y++soydddo.                `-osoomy+....-:-.yhy/..-:------:-::---::::////----:::-------:ssssyso+ydmdddmmmmdmmmmmmmmdhsssyssssyhdmddmdmmmmmmddddmmddyso.``  `:mNNdNNNmNNNmdhhdddddddddddmddhmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmd+.                                                
                                            +ossyhhyhdhhhddhdmNNNNNNNNNNNNNNNNNNmmNNNNNNNNmNNNmmmmNNNNmmdh-` .++/./oosyyssssssssoooyhhdddhssyhmhysyyhdds/+oo+/ss:oyhdddh.`  .--::::---:-/smNNNmyoN/oN/hmdmNNNNNMNNNNNNNNNNNNdyy+:..--.:/+dy/ `               `.oohNNo:..../hhy+hhsssssyyyyyyyhs++yhdhyo-+/-/:--.--:-------ssssssohddmmmmmmmddmmmmmmmddddysssssddmmmmmmmmmmmmmhyydmmmhyso``   ./NNmdNNNNNNNmmmmmmmmmmmdhhdmmdhdmdddddhhdddddddmmmmmmmmmmmmmmmmmmmmdo-                                                
                                            oosshhhyhdhddddddmNNNmNNNNNNNNNNNNNNNmmNNNNNNmmmNNNmmmmNNNNNmd.``:/-`:+osssssyssssosho/oddhsoosyyssyhddddh/ohNMNNmo:yhddddy+`   `.::::::::--:/hmmhhs+.---.:/oohNNNNNMNNNNNNNNNNNy+..-:oydmmmds-.`                `-ydmNo:.-` `/mNN+hdddddhdddhhhd//:::/odNNm:+yhsoyo/-..------syysoydmddmshmmdhhdhdmmmmmmmmmdhshdmmddmmddhoooosydosymhddyyo+`    .+NNmmmNNNNNNNNNNNNNNNNNNNmddddhhddmmmNmmddhddmmdmmmmmmmmmmmmmmmmmmmms/                                                
                                            ossshddyhdhhddhhddNNNmNNNNNNNNNNNNNNNmmNNNNNNNNmNNNNNmmdmmNmmh` `:.``+ossssysssoossyhdh:shhyyhhhhdddddddh:yysshdNNmy./+oos+.    `.-:::::::::--+hmNysosyyy/:-..odNNNNNNNNNNNNNNNd/-sho:-:/sho+y.                  .:ymNN-:-` ``-ymMoydhhddhdddhdh+...`/oo:ymMo+/+osdy/-./+/-...ssssoymdddm+ydysyhyys+ddmmmddmmddmmmmmmdms+ymNMNmho:ydsshdhs+:`    ./NNNmmNNNNNNNNNNNNNNNNNNNNNmdddmNNNNNNNNNNmmdddmmmmmmmmmmmmdmmmmmmmmy+                                                
                                            ossshddhhhsyhdddhhmmmdNNNNNNNNNNNNNNNmmNNNNNNNNmmmNNNNmdddddy+`  ` `-+sssssssooso:-..-:/:omdddddddddddms/--...-::mNm+yhdy/.      `.-::::::::--:/oyyhdNMdosdNm-`.ymNNNNNNNNNNNNN:/oMmo`.:::+hdd:`                 ./smmh-:-  `-h//o:yddhhhdddhhy+..`` yNMhosMhsoyyso.```:+sso+/sssooshmyshdo:ymNNNmdh/odmmmmdmmddmmmmmm/ooooshmNNNo+/sdhss+:.     `-mNNNmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNms//+sydmmmmmmmmmmmdmmmmmmmdy+                                                
                                            ossshhhyhho+shoo++ohmdmmNNNNNNNNNNNNNmmmNNNNNNNmmmNNNNNmmdys+.     .:osyssssoyyy....`+hdooydddddddddddd/`....shhy/hNd+/+-`        `.-:::::--::-:::++ohmy+MMNN`  `ymNNNNMNNNNNNN sNNs/:`-:/+oss-`                 .:+mmh::-`       -ydhddddddhd+-`  `-ohMMsoNmy+:-.`   ``:oyysoyyso:+yddyo++sMMmh++osy+/dmmmmmmmmmdmmdh....dmdyhdNNs/s+/+o:.``     `hmNNNmmNNNNNNNmNNNNNNNmNNNNNNNNNNNNNNNs:osyyosymmmmmmmmmmmdmmmmmmdmy+                                                
                                            +ossyhd/oyh--/hdddddddddmmNNNmNNmNNNNmmmNNNNNNNmmmNNNNNNmmhy+.``` `-+sssssoohNy--.`  +mNmh+mdddddddddds:`.` `ymMMhdmNdo-`           ``.-:::::::---/shmhyoNNdo+-  :sMNNNNNNNNNNm :/.o+: .:/+yhd:`                 .:ommmos+.`    ``:ydhddddddhy:`   `+//+y+oMNdy/`       `.osyyssso/-.++od+yNMds/+-/NMmhodmmmmmmmmmmmy/`  `dNMNhhmMdy+ossyo+:```   `/hNNNNNmNmmNNmmo+//oshmNNmNNmNNNNNNNN+/+mmmNNmdhdmmmmmmmmmmmmmmmddmy/                                                
                                            /osssssho///yNMmdhhhhdyhdmmNmdmmmNNNNmmNNNNmNNNNNNmmNNNNNNmmdhyo++oshhyssoshMNs-.`  `/osys:mdddddddddm/-`` ``oyhmdhhMms:              ``..-:::::--:+syhs:+:-:/-  `/NNNNNNNNMMNd   ``  `-:/oooo.`    `            `-+mNMdhs/.```..-oyddhhddddd+-``   ````/+sNmhs.`         ./ossyyso:``:/+odMNyso.`-sNMNohdmmmmmmmmmms.  `./hNNdhhMMmyyssysss/-.`    ohNNNNNNNNNms-/shdyo//hmNNNNNNNNNNNN./s+///ydmdddmmmddmmddmmmmmmdms/                                                
                                            -+ssso/+ss:mNNdhs+/++o+oyddmmdddmmmNNNNNNNNNNNNNNNNmmNNNNNNNNmmmmmmddyso+oydMms-.`` `-/``..ddddddddddm:-.   `/---:odMdo-`            ```.-:::-::--:+syhy/:. `   ` :yNNNNNNNNMNm   `` `.+oodmmh-`                  .ohmMNs///::-//:hhhddddhhdd:-.`    `.-/sdNyo+            `-+sssss+-`:ohmNNmyso  ./ohdosymmmmmmmmmms`` .oo/:+yyhMMNysyyssssso/``   .+mNNNNNNNN+/yNNmhssys/+mmNNNNNNNNmh.:odds--/sNhddmmmmdmmdmmmmmmmdo:                                                
                                            `/ssssyo+sdNNNMMmy```--:/hddddddddmmmNmmNNNNNNNNNNNNNmmmNNNNNNNNmmhsos+:`:ohNNy:-.`      `-ddddhhddddm:-.      `-:smMd+`         ``.--://+++/:-::--/+ymmho/.  ````-+MNNNNNNNNNN...``.-++oyyys+.`                  `/ydmNmdo++oshyodhhhhhhhhhh:/:.````:+ssdmy+:-         `.````/ossss+.-+hNNNmhs+ `-y````/smmmmmmmmmms    ``  `oyhMMNhysssssssys:`   .+dmmmNNNNooyMms+so+-://:mNNNNNNNNms-sNMNs .-+hdddmmmmdmmmmmmmmmmd+.                                                
                                             -+ssssydmNNNNMNy-    ``-dhhddhhdddddmmmNNNmNNNNNNNNNmmmmmNNNmmdho--/+-.`.+hmNds+-`     `..ddddddddddd+:. `   `-+odMNy/         `.://:::://+//----::/hhhhso/:---::/+MNNmmNNNNMM////////shNNdy:.`                   `+yhmmmmmmmNmdyddhhhhhhdhyy+//::::+ydNmho+-`         `./:-`.-/syys:-/dmNNNdyo`       -ommmmmmmmmms`        ohhMNmssssysssssso.`  /sddddmNmm:hNN+ymNNs`..-.odNNNNNNNmy-sNNo:. -/omdhmmmmmdmmmmmmmmmd/`                                                
                                             `.ssssydNMyyhy/.       .dhhhdddhhhy-hdyhdmNmmmNNNNNNNmNmmddhy+:.``.:.`  `/shNNmdy+`  ``.:/mmddddddddmo/-.````:odmNNm+-         .://::-----:-------.`.+ymNhs++++sdhoMNNNNNNNNNNdhydhhhmNNNNhs-`` `                  ./ydddddddhhddhhhddddhddhNdyo+++ohdNNdy+-`            -/os+//+ssso--shmNNdhs`       :smmmmmmmmmmy/      `.ymdMmy++sysssysyss:.``ohmmmdddyoomNdsdNMho-` `:.sNNNNNNNmh-..`/// .:oNmhmmmdmmdmmmdmmmmy:                                                 
                                              `/ssssdNMso+/o/       .dddddddddy+:+/.::+shddmmmddmmddhs+/:.`    ``     ./ydNMds/-----/ohdddddhhddddho/:----:odNNNh-`         .-//::------------``  /ymNNNmddmNNmdNNNNNNNNNNNNmmNMNNNNNNds/-.`                     ./yhhhdddhhhhhddhddhyddhmNNmmmmNNNmhy+-`             `.:+ssssssso-.:oydMmdd.`      +ymmmmddmmmmdy-`   `.sdNNMhsoossssssysss:.`:ydmmdddho:dNNdoyho/os  `..odNNNNNNNm:..  ```-/yNmhmmddmmmdmmmmmmmo-                                                 
                                               .+ssydNNys+```      `-dddddhhhdo.`oo.  ``-+smmmhyss/..`                `.oydmNdy++++ohddddddddddddddddo++++ydNNmh/`          `.-::::--------..`    `-omNNNNNNNNNNMNNNNNNNNNNNNNNNNNNNmdo/:/``                      `:+shdddhdhydddddddhhddhdddmddddhyo:.               ` `.:/+ooo+/.``:oymNNNh/.```.ohddmmmddmmmdmmhs+:/oyhdNMmyosssysssyysoo/-`oydmmdhs/:/NNNm++/````  ``-+hNNNNNNNNo/:``  `/sdNmddddmmmmmdmmmmmd:.                                                 
                                                -+yshmMdho``       -+ddddhddhd+` ``    `:+sNNdss+/`                     .+yhmNNNmmmmmdddddddddhhddddmNmmmmNNNdy+`            ``..-----...```      ```/ymNNNNNNNNMNNNNNNNNNmNNNNNNNNdhs////`                      ```:/oyhhhdhhyhhhhhhhhddhddhdhhyyo/.`                    ``.-...`   ./syNMMdys++osmmmmmmmmmmmmmmmmmddddmmNNNhyyssssyssssooo:.`syhmmdy+/ohNNNNso+.`  ` `-:ohNNNNmNNNdys/--./oyNMmdddmmdmmmmddmmdh.`                                                 
                                                 -sshdNNmd+.`     `/ydddddddhd+`       `osyNmdso:`                       .:ohhdmmmmdddddddddddddddddddmmmNmdho:`                ```````          `  ``.:sdmNNMNNNNNmmmNmmmNNNNNNmdyo+/:///`                     `.-----/+oyyhhhhyhhhhhhhhhhhhhyo+:.`   `                       ``     `-ymNNNNmmmNNmmmdddmmmmmddmmmmmNNNNNNmdyysssssosoosss+-..hhddddhhyysdNMMmdys-..`.-+sydNNNNmNNNNNmdysoydmMNmddmmmdmmmmmdmmho`                                                  
                                                 -+yyhNNmhs/:.```-+ydhhhhhddhdo-     `.+yhmNdys.`                         `.+syddddddddhdddddddhddddddddddhys:.                                       ```:oydmNNNNNNmmmNNNNNNmmhys://////:`                  ``..-----.--:yyyyyyyyyhhyyyyyso+/:.``                                     `:shmNNNNNNmdmddmmmmdmdmddmmmmmmmNmddhsssssssssssyso:.`.hdddddmmyssydmMNNmyo+//+oydmmNNNNNNNNNNNNNNmNNNNNdhdmmmmmmmmmmmdy:                                                   
                                                 .:dyyhNNmhyssoooyddddddhhhdddhs-.``.:omdmNmyo:`                        ` ```:+syhdddddhdddhhhhhddddddhhhyso+/.                                    ```````:odddmdmmmmmmmmmmddyo++/::////:.``                `..-------.-.-yddhhhhyyyyyyyyyo:`                                           `./yddmmmmmmmmdyhddmddshdmmmmmmmdhyyssssssssossss+:``.-hddhmmmmhdmhyhMMMNNdhhhdmNNNNNNNNNNNNNNNNNNNNNNNyo+dmmmmmmmmmmdh+`                                                   
                                                 `.ddhydmNNmdddddddhhdddddhhdhhhyoo+osydNNmyo:``                     ``..-:::////+osyhdhhddddddddhdhhyyysso++/.`                               ``.--::::::+ymNNNNNNmmmmmmNNNdy++/:::::::-.---``            `..----:---.---/ysoohdddddhhddho:`                                   `  ``.--:/+oyhddmmmmmmmsossysoohdmdmmmmdhhyssyyysyssssso/-` `.:hdmdmmmdmmmhddNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNdy-:/mmmmmmmmmmmdo-                                                    
                                                   sdmhyhdmmNNmmddhhhhdddhhhddddddddhdmNmhyo-`                    ``.::////::::::::/syhhhhhhhhhhhdhhyooooo++++-`                            ``.-:/++++///+sdNNNNNNNNNNNNNNNNmh++/--:::/::////:.`          `..--.-:://:.--------sddhddddhdhs/.`                                   `.:/osssssssyyhddmmmmmdysosooydmmmmdhsoosssssssosssso+:.`   `-hdddddmmmmmmmddmmNNNNNNNNNNNNNNNNNNNNmmNNNNNmho.`:sNmmmmmmmmmmy-`                                                    
                                                   :hNmyyhddddhhddyhhddddddhhddhddmmNmmdhs+.`                    `-///::::::::::/+++shdddddddddhdddys+o++++++/-                           ``.-:/++++////:+ydNNNNNNNNNNNNNNNNmds/:-:::/://::/+:-.`        ``.---.:+os+:-------:.ohdhhdddhdhs+-..`                               `./osssssyysssyyhhhhddddmddddddddddddy/..-/osssoossso+:-``    `-hdddddmmmmmmmmmdmmNNNNNNNNNNNmmmmmmmNNNNmmdh/-`  :ymmmmmmmmddh:`                                                     
                                                   .ymmmdhhhhdddddysshhhhhyyhhdhhdhhdhhy/-`                   `.-///::::::::///+ooosyhddddddddddddho+++++++++/.                         ``.-://+++///////ohmMNNNNNNNNNNNNNNNNmh/::::::///:-:/::-.        `.-:--/ossy/:/:------.+ydhhhdhddhs/--.``                             `-+ysssyysssssyhhhhhdddddddddddddhhdddy/-:/osyysooysso+/:.`    `.hdmmddmmddmmddmmdddmmmmNNNNNNNNNNNNNmmmdy+:.`   `/hmmmmmddmdho`                                                      
                                                   :hNmmmmmhhyddddhyo+oooooydddddhhhys+-`                    `-/+/::::::::/++++ossssyhdddddddddddho+++++++++o:.                         `-:::+++//++////:sdNNNNNMNNNNNNNNNNNNms:-:-:::://:--:///-`       `.--:/syyyo::s/:-::--.+yddddddddds+----``                          ``:+ssssssssssyyhdddhhdmmmmddddddmdmmmmdh++osssyysoosssssso+``    `ydmmmddmmmmdmmmmmdymmmmmmmmmmmmmmmmmmdo-.`      -odmmmmmdmmd+.                                                       
                                              `   `sdNNmmmNNmdhhhhhhysssssyhdhhhhys+-.`                   ```-//://////::/+++osssyhhhhddddddddddhy+++++++++++.`   ``                   `-:/:/++++/++////+ydNNNNNNNNNNNNNNNNNNmo--:-----::/:::///:.`      `.-:/osyys+::so+/:::-.+ydddddddhhs+/---.``                         `.+syssssssssyhhdddhhdmmmmmmmmmmmmmmmdmhsossssssysoosysssyso.`    `ydmmdddmmmmmmmmmmmymNNNmmmmmmmmmmmmmmdo:---.````+ydmmmmmmmmo:                                                        
                                                 `.dmNNNmmmmNNmdhhhhhyyyyyyyyyyhy/-`                       `-+:::/::+///+++ossssshdhhhddddddddddyo+oo+++++//o/-``                     `-:/://++///////+shhmNNNNNNNNNNNNNNNNNNNh:--------:////+//:-`      `.-/oyysyh/--+so+////.ohddddddhhhyss/:--.`                        ``-osysssssssyhhdddhdhdmdmmmmmmmmmmmmmdhsosyysyyyysosssssssso``    `ohdmdddddmmmmmmdmmhdmNNNNNNNNNNNNNNNNmdhhhyyo+/.yhdmmmmmmdh-`                                                        
                                                 -+NNNNmNNNmmmNNmdddhddddhhhhhhhy/-` ``                   `-+//-.`-:::/+++ossssyyyhhhhddddddddddy+oyy/+++/:+yyso/.`                  `.:/+://++//////+ydmdmNNNNNNNNNNNNNNNNNNNmy+------:::/++///:/.`     `.-+syssyd+:-:oso+///-sdhhhhdddddhhho/-:-.`            ``..---...```.oysssssssyyhddhhdmddmmmmmmmmmmmmmmmmsooyssssyssossssssss+:``    `+hdmdmmddddmmmmmmdhdmNNNNNNNNNNNNNNNNmdddmmmddhshdmdmmmmdho`                                                         
                                                .+mNNNNNNNNNNmmNmmdhhddddddhddddyo:`                      -:/-```-:/:/++osssysydyhhdhhddddddddddy+hhy++++:/sddhhdy+.                `.-/++-/++//+///+ydNNmmNNNNNNNNNNNNNNNNNNNNNho:///+///////////-`     `.-osysyhds:--/osss+::ydhddhdddhddddy+:---.          `.-/+ossssso//:-+sssssssyyhddhhddmddmmmmmmmmmmmmmmmmsooyssssssoosssysss+:..`     -shdmmmddddmmmmmmmdhdNNNNNNNNNNNNNNNNmmmmmmmmmdhhdmmmmmdhy:`                                                         
                                               `ohNNNNNNNNNNNNmNNNmdddddhdhhdddhhso/``                    :-.` ``+::/++ossssyhhdyhddhhddddddddddhyddy++/::syddhhdhyo.`              `.:++/-/++//+///odmNNNNNNNNNNNNNNNNNNNNNNNNNNd/////::///////++-`     `.-syyohhdh+:-:/+os+-oyddddhdddhhhhhyo/----`` `     `-+osysssyssssssoosssssssyyhdhhdmmmmmmmmmmmmmmmmmmmmmhsosssssoooosssyso+:-/-`     `ohdmmmmdddmdmmmmmdhdNNNNNNNNNNNNNNNNmmmNNNNmmdhdmmmmmmhhs`                                                          
                                              `/dNmNNNNNNNNNNNNmNNmmdhddddhdddddhyyy/-`                   .`  `.:/:/++osssssdddhhdddddddddddddddddddh+:::/ydddddhhddy-`           ` .-/+++-/+//////+smNNNNNNNNNNNNNNNNNNNNNNNNNNNNy/:////++++////+:.      .:sssshhhdhs----:/:-ddhhdddddhhhhddyo/---:.``    `.:osssssssssssssssyssysossyhddhhmmmmmmmmmmmmmmmmmmmmmmmdhsssss/--osssso/:+os.`     `+ydddmmmmdmdmmmmmmhdNNNNNNNNNNNNNNNmmNNNNNNNNmhdmmmmmddy+       `                                                   
                                              .dmmmNNNmmmNNNNNNNNmNmdhdddhhdddhhhhhhy/.                      ``-+::/++ossssyhddyhdddddddddddddddddddho/::ohddddddhhhd:``           `.:/+++-///////:+ymNNNNNNNNNNNNNNNNNNNNNNMMNNNNN+/++//++///////:-      `:sssshddhdhs:---.:sdddhdddddhhhdddys+---:-.`    `:+syyysssyyyyssssssyyyssosyhdhhhmmmmmmmmmmmmmmmmmmmmmmmmmmddmd/-:sssso++oss+``      /sddddmmmmdmmmmmmmhdmNNNNNNNNNNNNNNNNNNNNNNNNmhdmmdmdhds/                                                           
                                             -+NmmNNdyooshdmmmmmmmmmdhhdddddddhhdhhdds/`                      -/+-/++ossssyhhddydddddddddddddddddddddy///hdddddddhddh-`            `-:++++::////:/-+hmNNNNNNNNNNNNNNNNNNNNNNNNNNNNMho:+++////++///:.      `-yysshddhhddy+:./sdhhddhhdddddddddys+---:--.   `-+ssyyyssssssssssssssssssosyhdhhdmmmmmmdmmmmmmmmmmmmmmmmmmmmmddo++sssyssyss+:`       -+dmddmmmmdddmmmmmdddNNNNNNNNNNNNNNNNNNNNNNNNmymmmmdddd+-  `````                                                    
                                             :sNmmmNhssddmmmmmmmmmmddhhdddddhddddhhdhyo.`                     //::+++osssyhdhddyhdddddddddddddddddddddo+odddddddhddh/.             .-:++++/::///:/-/ymNNNNNNNNNNNNNNNNNNNNNNNNNNNNNms-////+++///:/-.      ``syyshhhhhhhddhoyhhddddddhddddhdddyo/----:-.` ``/osssssyssssssssssssssssoooyhdhhhmmmmmmmmmmmmmmmmmmmmmmmmmmmmddo++sssyssso+:`        `:hddddmmmddddmmmdddhNNNNNNNNNNNNNNNNNNNNNNNNmymmmmhdmd+. ./osso+``                                                 
                                             /yNNmmmddmNNNNNNNNNNNNmmdddddddhddhdddddhs:`                   `.//-++++ssyshdmhddyhhddddddddddddddddddddhysdddddhhhhs:`              .-//+++/:::////.:sdNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmy-/////////:-``         osyyyyhddddhhddhhdhddddhhddddhhhhs+:----:--.```/osssssyssssssssssssssssssosyddhhmmmmmmmmmmmmmmmmmmmmmmdmmmdmmd/--+++oo++:.``         -oddmddmmmdddmmmdmdhNNNNNNNNNNNNNNNNNNNNNNmmmhdmmmhdmd+.`shhhddds:                                                 
                                             -+mmNNmmNNNNNNNNNNNNNNNmmdddddhdddddddddhy/`                   `:/::+++ossssdmmdddyyhdddddddddddddddddddddhhdddddddh/-`               `-///+++/:-//:/.-/dNNNmNNNNNNNNNNNNNNNNNNNNNNNNNds-/++///:-.``           /syysyydhhddddhhdhddhdddddddhhhhyo/---------```/osysyysyssssssssssssyssyyssyddhhdmmmmmmdmmmmmmmmmmmmmmmmmddddy:``..----.``           `:hdmdddmmmmdddmmmdyNNNNNNNNNNNNNNNNNNNNNNmmmhddmmhdmd+.`o/-:ydmd+.                                                
                                              .+hmmdmNNNNNNNNNNNNNNNmmmddddddddddddhdhs/`                   `/::/+++oysssmNNNmhyyhddddddddddddddddddddddddddhhhyo.`                .-:+//+++/::::+:.`ymNmdmNNNNNNNNNNNNNNNNNNNhNNNmhs+/:--...``             .+ysyyshddhhhdddhhddddhhddddhhyyo/:---------.``:ossssysyssssyyssssssyssyyssyhdhhddmmddmmmmmmmmmmmmmmmmmmdhmdh+.                      `.yhdmdddmmmmdddmmdymNNNNNNNNNNNNNNNNNNNNmmmdhddmdddmmy/`..``ohdmo-                                                
                                                -/smmNNNNNNNNNNNNNNNmddddhddddddhddhdhs-`                  `.+::/+++osssymNNNdhssyhdddddddddddddddddddddddhhhhhy:`                 `-:+//+///+::-::-`:ydddmMNNNMNNMMNNNNNNNNNNdmmmdmmmo-                   ` :oyysssyyyhhddddhddhhhdddddhhso:-----------.```/oossssysoyysssssyssssssssssydddhddmhdmmmmmmmmmmmmmmmmdddhdhs`                         oydmmddmmmmmdddmdhdmNNNNNNNNNNNNNNNmmmmdmdddhdmdddmmdh+-..:ydmdo-                                                
                                              `-.-/mmmmmNNNNNNNNNNNNmddddddddddddhhddho.                   `.+::/+++osssymNNmhysoosdddddddddddddddddddddhhhyyhys.                  `.://///++/+/:::-.`:ohmNMMNNNNmmmmmmNNNNNNNddddmmmh.`                    `-/yyyyysssddhdhddhyyyddddhdddyo-------------.``.:ossysssoyysssssysoosssssssshhdddddhdmmmmmmmddddmmmmmmmdhy+.`                         -sdmmmddmmmmdddmdhdmNNNNNNNNNNNmmNmmdddmmmdmhhdmddmmmmdhhhdddmh/.                                                
                                              `+yysdmmNmmmmmNNNNNNNmmddddddddddhdhyhhs/                   `.:/:/++++sssshmNNmysy+osdddddddddddddddddddhhhhhhhhyo`                  `.-+///////+++////:/odNNNMNNNNNmhhmNMNNNNNNdhdmmmds                    `-/+osyyyyyssddhhhddhyssdddhhdddhs:--:---:-----.` `.:+sssssosssssssssssyyysssyyhhdddhhhdmdmmmmmdhhdmmmmmdmdds+-`                         `+hdmmmhdmmmmddddhdmNNNNNNNNNNNNmmddmddmdmmmhhdmdddmmdmmmmmmmdo-                                                 
                                              `.hmmmmmNNNNNNNNmmmmNmmdhhhddddddhdhyyy/.                   `-/::/+/++ssssdNNNdysy+sydddddddhhhhhdddddddhhyyhhhys+                    .-/////////+++/++/oydmNNNNNMNNNhhmNNNNNNNNmhdmmmdy/.`                 -osyyyyyyyssyhhddddddysshddhddhdhy/--:---:------`  ``:+sssssosyyssssssossysyyhhhhddddhhdmmmmmmmdhhdmmmmmddddhhy-`                         /ymmmmhdddmmmmddhdmNmmmNNNNNNNNmddmdmmmdmmdddddddhmmmmmmdmdhy.`                                                 
                                              ``+ymmmmmmmmmNmmdmNNmmdhhhhhhddddddhhy-.                     :+::/++++ssssdmNNhyssoyhddddddddhhyhddddddddhyhhhhhyo+:.                 `.:////++///////+/shmNNNNNNNNNmhdmNNMNNNNNNhdmmmmmmds``             `:+yyyyyyyyysshddddddhdysshdhdddddhys:-:::--------.`   `.:+ssssssssssssssssssyhhdddddddhdmmmmmmmmmdhdmmmmmmmmdhhhy-`                        :oddmmdddmmmmmddhdmNNmmNNNNNNNNmmmmdmmmmmmhmmmddhymmmmdddho/.                                                   
                                        `     `:hddmddmmmmmddhdmmmdddhhhyyhhdhddddhy-`                    `:+::/++++sssydmNNhysosydddddddddyyyhddddddddhyhhhhhyyhy+.                 `.:/+///++++/////sdmNNNNNNNNNmhdmNNNNNNNNMdddmmmmmmh+`             .+syyyyyyyyysyhddddddhdysshdhdddddhhs::-:----------``  `.-+ssssssossyyyyssssyhhddddddddhdmmmmmmmmmdhdmmmmmmmmdhhhd+-               `   `    -+dmmmdddmmmmmddhdmNNdmNNNNNNNNmdmmddddmmddmmmmdhdhhyso+/.``                                                    
                                             ./dmmmmmdhhhyyyhhdddddddddhsyhddddddddh:.                    .:/::/++++sssymNNNyso+yhdddddddddyyyhddddddddhyhhhhhhhhyys`                 `.:++//////++++oydNNNNNNNNNNmhdmNNNNNNNNNdddmmmmmmmd-`           `+syyyyyyyyyyyyhddddddhdysshddddddddhy+:-:--:---:-.````./+syssssyssooosyssyyyyhdddddddddhdmmmmmmmmmdhdmmmmmmmmmdhhdh+`             `:syho-`  ./dmmmdddmmmmmddhdmNNdmNNNNNNNNNdmmmdddddddmmmdddmds/```                                                        
                                     `      .+hmNNmmmdshhhhhhhdhhhdddddhsyhddddddddh/.                    -:/::/++++sssymNNNyso+yddddddddddo+ohddddddddhhyhhhyhhhhhy/.                 `.:////+///+++shmNNNNNNNNNNmhdmNNNNNNNNNmddmmmmmmmd+-          `.ssyyyyyyyyysyhdddddddhdysshddddhhddhho/-:--:----.`  `-+sssssyyssssssoosssyyyhdddddddddhhdmmmmmmmmmdhdmmmmmmmmmdhydhs-            `:dddhs/-  ./dmmmdddmmmmmdhymmNNmmNNNNNNNNNdmmmmmddddmmdddmmddo-                                                           
                             ```  ``....```-ydmNmmNmhyhhhhhyyhdddddddhdhyyhdddddddhho-                    //:::/+++osssymNNmysoohdddddddddd:-:hdddddddddhyhhhhhhhhhyy:`               `.--:/+/+////++ydNNNNNNNNNNNmhdNMNNNNNNNNmddmmmmmmmmy/          ./syyyyyyyyyysyhddhdddhhdysshddddhhhddhs+::-----.``  `-/syysssssssssyssssoosyhdddddhddhdhhdmmmmmmmmmdhdmmmmmmmmmmdhddyo            -+mh+.```  -/dmmmdddmmmmmmhymNNNdmNNNNNNNNNmmmmmmmdddmdddmmmmh/`                                                           
                         `  `/-. -+shdhhsooymmmNmmmdyyhhhhhyyhdddddddddhyyhddddddhhdy:`                  `/::://+++osssyNNmmysosddddddddddm-.-ddddddddddhyhhhhhhhhhhyo:             ``-:::-::/+++//++hmNNNNNNNNNNNmhdNMNNNNNNNNmddmmmmmmmmdo.         -osyyyyyyyyyyshhdddddddhdysshhdddhhdddhy+:::--..``   `:+sysssysssssssssyssssyhdddddddddhhhdmmmmmmmmmmhhdmmmmmmmmmdhhdhh```         -+my/``   `:odmmmdddmmmmmdhyNNNNmmNNNNNNNNNmmmmmmmddddddmmmmdo-                                                            
                           ./mo-`hmNmNNNNdddNmmNmmmyyhhhhhhyyddddddddddhyyhddddddhhdy/.                 `./::::/+++osssyNNmdsssyddddddddddd-.:dddddddddddyyhhhhhhhhhhy+.            .-://:---://///+odmNNNNNNNNNNmddmNNMNNNNNNNNmdmmmmmmmmds/        `:syyyyyyyyyysshdhdddhddddyssyhdddhhdddhys+--..``     `:+sysssssssssssssssssyhddddddddddhhdmmmmmmmmmmmhhdmmmmmmmmmmdyhdd-.`       ` `:mhs/````:ohmmmmdddmdmmmhhdNNNNmmNNNNNNNNNmmdmmmmmdddmmmmddh.`                                                            
                           :hNdy+NNNNmmmmddmmNNNNmdshhhhhhyyyddddddddddhyyhdddddddddho-                 ./:::`:/+++ossyhNNmdssshddddddddddd-.:dddddddddddyyyhhhhhhhhhys/           .:/://:------://oymNNNNNNNNNNNmddmNNNNNNNNNNNmdmmmmmmmmdho        -+syyyyyyyyyysyhdddddhddddyssyhddddhdddhhso-.``        .:ssssssssssssssssyssyhddddddddddhhdmmmmmmmmmmmhhdmmmmdmmdmmdhhdd+-           .sddhsooshdmmddddddddmmdhdNNNNNmmNNNNNNNNNNmdmmmmmddmmmmmds:                                                              
                          `+mmNmdNmmmNNmddmNmNNNNmhyhhhhhhyyhddddddddddhyyhdddhhddddds/                `-+/-.`/++++ossyhNNdyosydddddddddddd-.:dddddddddddhyyhhhhhhhhhhys`   ````` `-//////--------:ohmNNNNNNNNNNNmddmNNNNNNNNNNNmddmmmmmmmddy`       /oyyyyyyyyyysshhhddddhddddyssyhddhdddddhhys-`          `./sssosoossssssssyyyhhddddddddddhhdmmmmmmmmmmmhhdmmmmdmmdmmmhhddy:           `.ydmdddddddmmmmhdmmdddhmmNNNNNmmNNNNNNNNNNmdmmmmmmddmmdh+-`                                                              
                          `+dNNNmmmmNNmhddmNNNNNmdyhhhhhhhyhhddddhdddddhyyhddhhhdddhdho`              `-/+-.`./+++osssydNmhsoshdddddddddddd..:ddddddddddddyyhhhhhhhhhhhy-``..---.``//////+--------:odNNNNNNNNNNNNmddmNNNNNNNNNNNmmdmmmmmmmmdh.`     `+syyyyyyyyyyssdhhddddhhdddyssyhdhhdddddhdhs:`           ``:+oossssysssssssyyhdddddddddddhhmmmmmmmmmmmmhhdmmmmmmmmmmmdhhdh/`            ./yddmmmmmmddmddmmdddmNNNNNNNmmNNNNNNNNNNmmmmmmmmmddhs-`  `                                                             
                           :ymNNNmmmNmh+ddmmNNNNmhyhhhhhhhshhddddhdddddhyyhddhdddddhhhs-`            `.//-```-+++/ossshdNdyo+yhdddddddddddh../ddddddddddddyyhhhhhhhhhhyy+-`------..///+//+:------.+ymNNNNNNNNNNNNmddmNNNNNNNNNNNNmdmmmmmmmmmd:`    `.+syyyyyyyyyyssddhhddhhhdddyssyhdhhddddhddhy+.            ``:osssssssssssssyhhddddddddddhhdmmmmmmmmmmmmhhdmmmmmmmmmmmdhhdd+-      `     ``./oyhddmmddhddddmmmNNNNNNNNmmNNNNNNNNNNmmmmmmmmmd+:.                                                                  
                          `.:mmmmmmmmmh+ydmmNNNNdhyhhhhhhyshddhdddddddhhyyhddhhddddhdhy+`           ``:-. ``.+++++ossshmmyo/+yhdddddddddddh.-/ddddddddddddhyyhhhyhhhhhhhs:.-:::-..-///+//+/:------sdNNNNNNNNNNNNNmddmNNNNNNNNNNNNNhdmmmmmmmmdo.    `:ssyyyyyyyyyssydddhdddhddddyssyhddddddddddhho-`           ``/ssssssssssssssyhhddddddddddhhdmmmmmmmmmmmmhhdmmmmmmmmmmmdhhdds:                `..--/ydddmmddNNNNNNNNNNNmmNNNNNNNNNNNmdmmmmmmm:`                           `                                       
                        ` -:/sdmNmmmmNmhshddmNNNhhhhhhhhhyydddddddddddhhyyhhdddddddhddho.            ```   .:+++++ossydmh+:.shdmdddddddmddh.:oddddddddddddhhyhhhyhhhhhhdy/.-//:...-///+//++/:----:ydNNNNNNNNNNNNNmddmNNNNNNNNNNNNNhdmmmmmmmmds-    `:syyyyyyyyyysyhdddhdddhddddyssyhdddddddddddhs/.        `````/osssssssysyysyhhhddddddddddhddmmmmmmmmmmmmhhdmmmmmmmmmmmmdhhds/                  `  .ymmmmmmmNNNNNNNNNNNmmNNNNNNNNNNNNdmmmmmmm/.                                                                   
                          .+dhdmNNNmmNNNmmmdmmNmyydhhhhhyyhddhddhdddddhhyyhhdddddddhddhy-`                .:++++++sssddd+...hdddddddddddddy-/yddddddddddddhhyhhhhhhhhhyhyo/::::-::-///+////+/:---+hmNNNNNNNNNNNNNmddmNNNNNNNNNNNNNddmmmmmmmmmy-    `/syyyyyyyyyysyhdddddddhddddyssshddddddddddddy+:    `   .-..`.-+ssysssssoo:+sddddddddddddhddmmmmmmmmmmmmhhdmmmmmmmmmmmmdhydy+                    `-dmmmmmmmNNNNNNNNNNNmmNNNNNNNNNNNNdmmmmmmms:``...-:/oosssso+:-``                                               
                           ./dmNNNNmmNNNmNNmmhyyyyhhhhhhyyhdddddhdddddhhyshhdddddddddddh/.               `:/+++++ssyydy+``./hddddddddddddhy+oyhddddddddddddhyhhhhhhhhhhhyso//////:-///++///++//::sdNNNNNNNNNNNNNNmddmNNNNNNNNNNNNNmddmmmmmmmmh-    `+syyyyyyyyyysydddddhddhddhdyssshddddddddddddhs/`       `/+/--..:+ossssyso::oddddddddddddhdmmmmmmmmmmmmmhhdmmmmmmmmmmmmmdydyo                    `:mmmmmddmNNNNNNNNNNNmmNNNNNNNNNNNNmmmmmmmmhsosyyhddddddddmmmdhy/.``                                            
                            `-+syhddddddmmNmd+-:yhhhhhhhyydddddddhddddhhyshhdddddddddddho:`            `.:+++++++ssyh+-` `:shddddddddddddhyyyyhdddddddddddddyyhhhhhhhhhhhs+://///:-////++/////:-:hmNNNNNNNNNNNNNNmddmNNNNNNNNNNNNNmddmmmmmmmmd:`   .osyyyyyyyyysyhddddddddhddhdyssshdddddddddddhdy+.       `-/oso+//++sssssss+/sdddddddddddhhdmmmmmmmmmmmmmhhdmmmmmmmmmmmmmdhhyo                    ./mmmmmddmNNNNNNNNNNNmmNNNNNNNNNNNNmddmmmmmmddmmmdddhyysssyyhddmmy/.                                            
                              ``.-----+hdhhy:.`:yhhhhhhyyydddddddhddddhhyshhddddddddddhhs/`         ```-/++++++oosso/.`  `:ydddddddddddddhyhhyhdddddddddddddhyyhhhhhhhhhhyo::///-..://////:-.``.:dNNNNNNNNNNNNNNNmddmNNNNNNNNNNNNNNddmmmmmmmmd:`   .osyyyyyyyyysyhdddddhddhddddyssshdddddddddddddyo:        `.:osysssssssssso/:oddddhhdddddhddmmmmmmmmmmmmmhhhmmmmmmmmmmmmmmdhyo                    -+mmmmmmmmNNNNNNNNNNNmmNNNNNNNNNNNNmddmmmmmddddhso/-..````.../oydmhs`                                           
                                     .-:/-.`  `:yhhhhhhsyhhdddddddddddhyyyhhddddddddddddy+.       ``.-/+++////+oo+:.`   `-+ydddddddddddddhyhyydddddddddddddddyyhhhhhhhhhhyo::::-.``.://:-.     -omNNNNNNNNNNNNNNmmddNNNNNNNNNNNNNNNddmmmmmmmmd:`   .+ssyyyyyyyyshhdddddhddhhdddysssyddddhhhdddddhhs+         ``-:/ooososso+/:`-oddddhdddhddhdmmmmmmmmmmdmmmdhhmmmmmmmmmmmmmmmys+                    -+mmmmmdmNNNNNNNNNNNmmmNNNNNNNNNNNNNddmmmmmdy+:.`            ``.+hmm-`                                          
                                              `:yhhhhhhyyhddddddddddddhyyyhhddddddddddddho: `` ``..:/+++//---/+/:.`      /shdddddddddddddhyhyydddddddddddddddyyhhhhhhhhhhs+`...``  `---``      /ymNNNNNNNNNNNNNNmmddmNNNNNNNNNNNNNNmddmmmmmmmh-    `:osyyyyyyyyshddhddhdddhddddysysyddhhhhhhddhhddyo``          ``.--:::-..```.+hdddddddhddhdmmmmmmmmmmdmmmhhhmmmmmmmmmmmmmmmho:                    -+mmmmmdmNNNNNNNNNNNmmmNNNNNNNNNNNNNddmmmmmdo.                 ``hmd-`                                          
                                              `-shhhhhhyhhddddhdddddddhyyyhhddddddddddddhyo...-:////::-.``-:::.`        `ohddddddddddddddhyhyyhddddddddddddddyhhyhhhhhhhho:        ```        `+dNNNNNNNNNNNNNNNmmddmNNMNNMNNNNNNNNmdhmmmmmmmo.     `/+ssyysyssydddhddhdddhddhhysysydddddddddddhhdhy-``                        :sdddddddddhhdmmmmmmmmmmmmmmhhhmmmmmmmmmmmmmmmdo-   `                .+mmmmmdmNNNNNNNNNNNmmmNNNNNNNNNNNNNmmdmmmmmo`              ```.:ys/   `                                        
                                              `.syhhhhhyhdddddhdddddhdhyyyyhddddddddddddhys........``````.-..`         `.shddddddddddddddhyhyyhddddddddddddddyhhhhhhhhhhy/.                   -smNNNNNNNNNNNNNNNmdhymNNNNNNNNMNNNMNmdhmmmmmdy-`      `.-::///+oydddhddhdddddhhhso+oyhhhdddddddddhdhy-.                         `-syhhhhddhhhdmmmmmmmmmmmmmmhhhdmmmmmmmmmmmmmmds/                    `:mmmmmdmNNNNNNNNNNNmmmNNNNNNNNNNNNNmmdmmmmd+              ``..-::.``                                           
                                               `oyhhhhyyhdddddhdddddhdhyyyyhddddddddddddhhy:`                          `:yhddddddddddddddhsyyshddddddddddddddhyyhhhhyhhy/-`                   :ymNNNNNNNNNNNNNNNms++mNNNNNNNNNNNNNNNmhyyys+/- `           ```-+hhdddddhhddhddhhs/.:oyyhhhhhhhhhhhyso``                          ``.-:////+shdmmmmmmmmmmmmmmhhhddmmmmmmmmmmmmddo:                     .sdmmdmmNNNNNNNNNNNmmmNNNNNNNNNNNNNNmdmmmmh/ `                         `                                       
                                               `+shhhhyhhdddddhhddddddhyhsyhhddddddddddddhy+.     `             `      `ohdddddddddddddddyo:+shdddddddddddddddyssssso+/:`                     .+hNNNNNNNNNNNNNNNy:`.ymNNNNNMNNMNNNNNds-.``                   .:shhhhhddhddhhhdyo:``-://+oooo+++//:-.                                     `:syhddddddddddddhs+/osyhhhhdhhhhhys+-`                      .+shdmmNNNNNNNNNNNmmmNNNNNmNNNNNNNNmdmmmm/- `                                                                 
                                                ./syyyshhdddddddddddddyyyyyhddddddhhdddddhho-`                         .ohddddddddddddddhy+.:sddddddddddddddddy+.`````                         `-+syhhhdhddhyys+-`  :+shdddddddddhyo/-                        `-/++osssssssooo/-.   ``````````                                            ``.://++++++++/:-.````.---:::::-..``                         ``./hmNNNNNNNNNNNmdmNNNNNNNNNNNNNNmdhys+`                                                                    
                                                 `.:/+yhhdddddddddddddys//sydddddddddddddhyo-`                         `-+osyhhhhhhhhhhys+-`:ohddddddddddddddhs/`  `                               ``.......``        ``..------..`                              ```........``                                                                            `                                               `-/+osyhhddhhhhmmmNNNNNNNNNNNNmmd-.``                                                                     
                                                   ``-shhhdddddddddddhy+``:oyhhhhhhhhhhhys+-`                            ```..-::///:--.``` .:oyyyyyyyyyyyyyso:`                                                                                                                                                                                                                                              ```.......-shddmmmmmmdmdddho-`                                                                        
                                                     `-+oosyyyyyyyyss+:.````-::///////::-.`                                                  ` ``.---::---..`                                                                                                                                                                                                                                                             `.:::/+////:-.`                                                                           
                                                       ``............``          ```              `                                                                                                                                                                                                                                                                                                                            `                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

*/
// Congratulations, looks like somepony found this easter egg!  <Yay>

// [TheComet] Yay, more emotional support for when debugging is going attrociously!