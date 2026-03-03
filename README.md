
# This repository was created for academic research and educational purposes.
# I do not distribute any software such as Injector that can be used directly in the game.
# If you wish to use these works, you must create your own software and use it at your own risk.

[ About ]

This GSC Injector's source code is based on the GSC Injection process from Project Donetsk.
I would like to express my utmost respect and gratitude to Mr. Sku-111 for devising and implementing this injection process.
Thank you always, and I support you.

----------

[ Video ]

If you’d like to learn more about this GSC Mod Menu, please check out the YouTube video below.

https://youtu.be/ho9-UawtaNM

----------

[ Implemented ]

The following items are currently completed:

- dll Injector
- GSC Injector
- GSC Dumper
- GSCBIN Dump Data
- GSC Mod Menu - Project HiNAtyu ( Compiled )
- GSC Mod Menu - Project HiNAtyu ( Sourcecode )

----------

[ Caution ]

< Project HiNAtyu GSC Mod Menu >

The Project HiNAtyu GSC Mod Menu in VG Beta lags the first time you open the Mod Menu due to some kind of issue with the Hud elements engine.
Also, if you use a lot of functions from the Mod Menu, it becomes more prone to crashes.
As for the crash when using this GSC, I think that it is not me but the problem with the VG Beta Cr3ck system that created the .r4v3n (because there are so many DEV ERRORs in the console window).
Please contact .r4v3n for a fix for the GSC crash.

----------

< GSC Injector / dll Injector ( Face injector ) >

I am not distributing a dll injector for CoDV Beta.
Please create this yourself.

----------

< gsc-tool >

This app is a command-line tool operated via cmd.
HiNAtyu does not accept questions regarding the tool.
Please direct your questions to xensik.

Regarding the GSC compiler and decompiler functions, many of the instructions are incorrect because we have not analyzed all of the hash tokens.
Since I play Vanguard at Retail, I don't intend to make many modifications to the gsc-tool for the Beta build.
If you want to seriously create GSC for the Beta build, please modify the gsc-tool's hash tokens on your own.

----------

[ How to use ]

01. Install the CoD VG Beta released by .r4v3n on your PC and get it ready to launch the game.  

02. Download the file from this GitHub release page and extract the .zip archive.  

03. Place the "VG_BETA_GSC_CUSTOM" folder, which is included in the extracted files, directly into your Documents folder.  

04. Disable your antivirus system.  

05. Run "CoDV_dll_Face_Injector.exe" with administrator privileges.  

06. Once the driver initialization is complete, launch CoD VG Beta.  

07. When the game starts, the display on the DLL Injector screen will change. If it shows that the injection was successful, wait as is.  

08. Move to the lobby waiting screen and start a custom match with your preferred settings.  

09. After the game starts, confirm that "Project HiNAtyu" is displayed on the screen.  

10. After you’re done playing with the Mod Menu, be sure to restart your PC before playing any other games.

----------

[ Custom GSC ( gsc-tool ) ]

< dump >
* A "GSCBIN" folder containing the gscbin for s4 needs to be placed in the same directory hierarchy as gsc-tool_s4beta.exe.
gsc-tool_s4beta -m decomp -g s4 -s pc GSCBIN

< compile >
* A "GSCModSource" folder containing the custom GSC source for s4 needs to be placed in the same directory hierarchy as gsc-tool_s4beta.exe.
gsc-tool_s4beta -m comp -g s4 -s pc GSCModSource


Currently, the following GSC functions and tokens can be used.
All other commands are almost always incorrect and may cause a crash.

----------

s4_func

- { 0x20F, "spawnstruct" },
- { 0x205, "spawn" },
- { 0x1D0, "setdvar" },
- { 0x1D1, "setdvarifuninitialized" },
- { 0x091, "getdvarint" },
- { 0x0FE, "int" },
- { 0x100, "iprintln" },
- { 0x101, "iprintlnbold" },
- { 0x040, "clamp" },
- { 0x00E, "anglestoforward" },
- { 0x0A2, "getgroundposition" },
- { 0x25B, "vectortoangles" },
- { 0x196, "playfx" },
- { 0x19D, "playsoundatpos" },
- { 0x218, "stopfxontag" },
- { 0x05C, "earthquake" },
- { 0x19C, "playrumbleonposition" },
- { 0x197, "playfxontag" },
- { 0x143, "magicgrenademanual" },
- { 0x34D, "getcompleteweaponname" },
- { 0x121, "issubstr" },
- { 0x243, "tolower" },
- { 0x00D, "anglestoaxis" },
- { 0x0D3, "getstartorigin" },
- { 0x00F, "anglestoright" },
- { 0x010, "anglestoup" },
- { 0x301, "anglestoleft" },
- { 0x1B7, "randomfloatrange" },
- { 0x05A, "distancesquared" },
- { 0x207, "spawnfx" },
- { 0x24B, "triggerfx" },
- { 0x117, "isplayer" },
- { 0x36D, "isweapon" },
- { 0x36F, "isnullweapon" },
- { 0x26B, "weaponclipsize" },
- { 0x21F, "tablelookupgetnumrows" },
- { 0x276, "weaponmaxammo" },
- { 0x147, "max" },
- { 0x1B9, "randomintrange" },
- { 0x25A, "vectornormalize" },
- { 0x257, "vectordot" },
- { 0x059, "distance2dsquared" },
- { 0x21A, "strtok" },
- { 0x04B, "cos" },
- { 0x1EA, "setsaveddvar" },
- { 0x1FE, "sin" },
- { 0x1B8, "randomint" },
- { 0x265, "visionsetpain" },
- { 0x266, "visionsetthermal" },
- { 0x262, "visionsetmissilecam" },
- { 0x139, "loadfx" },
- { 0x378, "makeweaponfromstring" },
- { 0x0EA, "getweaponattachments" },
- { 0x102, "isagent" },
- { 0x34C, "makeweapon" },
- { 0x105, "isalive" },
- { 0x1C2, "rotatevector" },
- { 0x1A1, "playrumbleonposition" },
- { 0x2DA, "isvector" },
- { 0x148, "min" },
- { 0x2C4, "physics_createcontents" },
- { 0x107, "isbot" },
- { 0x104, "isai" },
- { 0x36E, "issameweapon" },
- { 0x130, "length" },
- { 0x153, "newhudelem" },
- { 0x152, "newclienthudelem" },
- { 0x154, "newteamhudelem" },
- { 0x0EC, "getweaponbasename" },
- { 0x09B, "getfirstarraykey" },
- { 0x1E4, "setomnvar" },

----------

s4_mesh

- { 0x8005, "adsbuttonpressed" },
- { 0x8021, "attackbuttonpressed" },
- { 0x822E, "meleebuttonpressed" },
- { 0x80FF, "fragbuttonpressed" },
- { 0x82CC, "secondaryoffhandbuttonpressed" },
- { 0x841E, "usebuttonpressed" },
- { 0x874F, "reloadbuttonpressed" },
- { 0x8639, "stancebuttonpressed" },
- { 0x81F7, "jumpbuttonpressed" },
- { 0x82F6, "setclientomnvar" },
- { 0x81D8, "isonladder" },
- { 0x81D7, "isonground" },
- { 0x809A, "delete" },
- { 0x8105, "freezecontrols" },
- { 0x8427, "usinggamepad" },
- { 0x826C, "playerlinktodelta" },
- { 0x8373, "setscriptablepartstate" },
- { 0x8132, "geteye" },
- { 0x816B, "getplayerangles" },
- { 0x8350, "setmodel" },
- { 0x847B, "hidefromplayer" },
- { 0x83CA, "showtoplayer" },
- { 0x823B, "moveto" },
- { 0x817B, "gettagorigin" },
- { 0x83C3, "show" },
- { 0x8275, "playlocalsound" },
- { 0x8276, "playloopsound" },
- { 0x83F0, "stoploopsound" },
- { 0x827B, "playsound" },
- { 0x8226, "makeuseable" },
- { 0x8305, "setcursorhint" },
- { 0x832B, "sethintstring" },
- { 0x84CF, "setuseholdduration" },
- { 0x84D5, "sethintdisplayfov" },
- { 0x8488, "disableoffhandsecondaryweapons" },
- { 0x8489, "enableoffhandsecondaryweapons" },
- { 0x848A, "sprintbuttonpressed" },
- { 0x817A, "gettagangles" },
- { 0x80BE, "dontinterpolate" },
- { 0x8199, "getxuid" },
- { 0x819B, "givemaxammo" },
- { 0x83B5, "setweaponammoclip" },
- { 0x81E4, "issprinting" },
- { 0x825D, "playerads" },
- { 0x81E6, "issprintsliding" },
- { 0x8179, "getstance" },
- { 0x8126, "getcurrentweapon" },
- { 0x82F0, "setcandamage" },
- { 0x808C, "clonebrushmodeltoscriptmodel" },
- { 0x824C, "notsolid" },
- { 0x83CE, "solid" },
- { 0x801E, "attach" },
- { 0x81A9, "hidepart" },
- { 0x8356, "setneargoalnotifydist" },
- { 0x83A3, "setvehgoalpos" },
- { 0x8518, "loadweaponsforplayer" },
- { 0x85A4, "enablemissilehint" },
- { 0x84CE, "setuserange" },
- { 0x8225, "makeunusable" },
- { 0x80AC, "disableplayeruse" },
- { 0x81A4, "hasweapon" },
- { 0x8125, "getcurrentprimaryweapon" },
- { 0x818F, "getweaponammostock" },
- { 0x818E, "getweaponammoclip" },
- { 0x837C, "setspawnweapon" },
- { 0x849F, "earthquakeforplayer" },
- { 0x834A, "setmaxpitchroll" },
- { 0x8436, "vehicle_setspeed" },
- { 0x83BA, "setyawspeed" },
- { 0x8287, "radiusdamage" },
- { 0x8312, "setentityowner" },
- { 0x8456, "visionsetthermalforplayer" },
- { 0x85BA, "visionsetkillstreakforplayer" },
- { 0x8415, "unlink" },
- { 0x8252, "painvisionon" },
- { 0x8232, "missile_settargetent" },
- { 0x820B, "linkto" },
- { 0x8400, "switchtoweaponimmediate" },
- { 0x8402, "takeweapon" },
- { 0x835F, "setotherent" },
- { 0x818A, "getvelocity" },
- { 0x809F, "detonate" },
- { 0x834B, "setmissileminimapvisible" },
- { 0x81A5, "hide" },
- { 0x841D, "useanimtree" },
- { 0x826B, "playerlinktoblend" },
- { 0x8382, "setstance" },
- { 0x835E, "setorigin" },
- { 0x84D4, "setusefov" },
- { 0x8013, "allowsprint" },
- { 0x8011, "allowprone" },
- { 0x826A, "playerlinktoabsolute" },
- { 0x8260, "playerhide" },
- { 0x827E, "playsoundtoplayer" },
- { 0x8498, "playershow" },
- { 0x80DF, "enableoffhandweapons" },
- { 0x80E3, "enableusability" },
- { 0x80AB, "disableoffhandweapons" },
- { 0x80AF, "disableusability" },
- { 0x8196, "getweaponslistprimaries" },
- { 0x83B6, "setweaponammostock" },
- { 0x809B, "destroy" },
- { 0x8269, "playerlinkto" },
- { 0x8477, "allowmovement" },
- { 0x8353, "setmovespeedscale" },
- { 0x824A, "notifyonplayercommand" },
- { 0x80B1, "disableweapons" },
- { 0x80E5, "enableweapons" },
- { 0x80E6, "enableweaponswitch" },
- { 0x80B2, "disableweaponswitch" },
- { 0x80E4, "enableweaponpickup" },
- { 0x80B0, "disableweaponpickup" },
- { 0x85A6, "enableoffhandprimaryweapons" },
- { 0x85A5, "disableoffhandprimaryweapons" },
- { 0x800B, "allowcrouch" },
- { 0x8014, "allowstand" },
- { 0x84B3, "allowmantle" },
- { 0x800D, "allowfire" },
- { 0x800A, "allowads" },
- { 0x800E, "allowjump" },
- { 0x8478, "allowwallrun" },
- { 0x8476, "allowdoublejump" },
- { 0x8010, "allowmelee" },
- { 0x8479, "allowslide" },
- { 0x800F, "allowlean" },
- { 0x84B1, "allowmounttop" },
- { 0x84B2, "allowmountside" },
- { 0x84B0, "allowreload" },
- { 0x8568, "cancelreload" },
- { 0x80D3, "enableautoreload" },
- { 0x80A2, "disableautoreload" },
- { 0x82D0, "setactionslot" },
- { 0x816D, "getplayerdata" },
- { 0x8254, "physicslaunchserver" },
- { 0x84FB, "physics_registerforcollisioncallback" },
- { 0x82A5, "rotateto" },
- { 0x8124, "getcurrentoffhand" },
- { 0x8625, "getaltweapon" },
- { 0x825B, "player_recoilscaleoff" },
- { 0x825C, "player_recoilscaleon" },
- { 0x8570, "getheldoffhand" },
- { 0x849A, "launchgrenade" },
- { 0x83A9, "setviewkickscale" },
- { 0x818B, "getviewkickscale" },
- { 0x84A6, "setcamerathirdperson" },
- { 0x83FD, "suicide" },
- { 0x83C8, "showpart" },
- { 0x81EA, "isswitchingweapon" },
- { 0x81B7, "iprintln" },
- { 0x81B8, "iprintlnbold" },
- { 0x81C3, "ishost" },
- { 0x808D, "cloneplayer" },
- { 0x83D0, "spawn" },
- { 0x83E4, "startragdoll" },
- { 0x809C, "detach" },
- { 0x83A7, "setvelocity" },
- { 0x8378, "setshader" },
- { 0x83BC, "shellshock" },
- { 0x80C2, "dropitem" },
- { 0x80EB, "fadeovertime" },
- { 0x813A, "getguid" },
- { 0x8401, "takeallweapons" },
- { 0x8166, "getnormalizedmovement" },
- { 0x8130, "getentitynumber" },
- { 0x80B7, "dodamage" },
- { 0x82A4, "rotateroll" },
- { 0x82A8, "rotateyaw" },
- { 0x8278, "playrumbleonentity" },
- { 0x82A3, "rotatepitch" },

----------

s4_token

- { 0x698D, "getcurrentsuper" },
- { 0x003A, "alignx" } ,
- { 0x003B, "aligny" } ,
- { 0x0047, "alpha" } ,
- { 0x0054, "angles" },
- { 0x005E, "archived" },
- { 0x006E, "attacker" } ,
- { 0x0084, "basename" },
- { 0x00DE, "classname" },
- { 0x01B6, "fontscale" } ,
- { 0x01B5, "font" } ,
- { 0x021D, "init" },
- { 0x0205, "hidewheninmenu" } ,
- { 0x020C, "horzalign" } ,
- { 0x0271, "main" },
- { 0x02AE, "model" } ,
- { 0x02EA, "origin" },
- { 0x02F2, "owner" } ,
- { 0x030F, "player" },
- { 0x0B4C, "_bullet_trace" } ,
- { 0xC042, "ray_trace" },
- { 0xE20C, "spawn_tag_origin" } ,
- { 0x6A40, "getfx" },
- { 0xD288, "set_movement_speed" },
- { 0x04DE, "x" } ,
- { 0x04B8, "vertalign" },
- { 0x04E1, "y" } ,
- { 0x04D5, "weaponinfo" },
- { 0x759F, "hastag" },
- { 0x0BA3, "_effect" },
- { 0x0BF6, "_hasperk" },
- { 0x045B, "team" } ,
- { 0x6E58, "getweaponfullname" },
- { 0x1B63, "array_add" },
- { 0x2CEE, "buildweapon_blueprint" },
- { 0xF07F, "ter_op" },
- { 0xFF25, "v" } ,
- { 0x7A8B, "hostmigration_waitlongdurationwithpause" },
- { 0x1B78, "array_contains" },
- { 0x1B96, "array_remove" } ,
- { 0x1B9C, "array_remove_index" },
- { 0x2CEB, "buildweapon" },
- { 0x8926, "isnightmap" },
- { 0xBFC7, "random" } ,
- { 0x6CB6, "getrandomweaponfromgroup" },
- { 0x6CA0, "getrandomgraverobberattachment" } ,
- { 0x1065, "addattachmenttoweapon" },
- { 0x89D3, "isreallyalive" },
- { 0x0D6A, "_takeweapon" },
- { 0x0327, "primaryweapons" } ,
- { 0x0BEB, "_giveweapon" },
- { 0x0D67, "_switchtoweaponimmediate" } ,
- { 0x8A10, "issharedfuncdefined" },
- { 0x6D05, "getsharedfunc" } ,
- { 0x027F, "maxhealth" },
- { 0x0134, "damage" },
- { 0xA90B, "objweapon" },
- { 0xACB7, "outlinedisable" },
- { 0x0D66, "_switchtoweapon" } ,
- { 0xBCD3, "primaryweaponobj" } ,
- { 0xCFDE, "secondaryweaponobj" } ,
- { 0x0309, "pers" } ,
- { 0x0C2D, "_magicbullet" } ,
- { 0xEA0B, "streakinfo" } ,
- { 0xB758, "players" },
- { 0xEF62, "teambased" },
- { 0x01FF, "health" } ,
- { 0x0457, "target" },
- { 0xC047, "ray_trace_passed" } ,
- { 0x6CA4, "getrandomkillstreak" },
- { 0x3F96, "createcrate" },
- { 0xDCE0, "showsplash" },
- { 0x37D9, "class" },
- { 0x3A02, "cointoss" } ,
- { 0xEA55, "string_starts_with" },
- { 0x0392, "sessionstate" } ,
- { 0x864F, "is_player_gamepad_enabled" } ,
- { 0xC2A5, "registersharedfunc" },
- { 0x60D1, "gametype" } ,
- { 0x5242, "enableoobimmunity" },
- { 0xC4EF, "removeperk" },
- { 0x88BC, "isinvehicle" },
- { 0xD95C, "shader" },
- { 0x5102, "elemtype" } ,
- { 0x04DB, "width" } ,
- { 0x0201, "height" } ,
- { 0x5E0F, "fontheight" },
- { 0x21B7, "bar" },
- { 0x00FF, "color" } ,
- { 0x7866, "hidden" },
- { 0x3556, "children" } ,
- { 0xD634, "setparent" },
- { 0xD675, "setpoint" } ,
- { 0x03BD, "sort" } ,
- { 0x6E1B, "getvehicle" } ,
- { 0x7E78, "inflictor" },
- { 0x02BA, "name" } ,
- { 0x4AB4, "disableoobimmunity" },
- { 0xACBD, "outlineenableforplayer" },
- { 0x6F8E, "givekillstreak" } ,
- { 0xE39A, "spawntype" },
- { 0xAF63, "pausetimer" },
- { 0xC725, "resumetimer" },
- { 0xC6CB, "restart" },
- { 0x5E7E, "forceend" },
- { 0x1B72, "array_combine" },
- { 0x8803, "isenemy" },
- { 0x0B4D, "_bullet_trace_passed" },
- { 0x6ABF, "getkillstreakcratedatabystreakname" },
- { 0x10FD2, "xoffset" },
- { 0x10FF0, "yoffset" },
- { 0x10DC7, "weapons" },
- { 0x1028C, "vehicle_spawn_spawnvehicle" },
- { 0x10893, "waittill_any_return" },
- { 0x1087E, "waittill_any_2" },
- { 0x1084D, "waitlongdurationwithhostmigrationpause" },
- { 0x06BB, "scripts/common/utility" },
- { 0x077A, "scripts/engine/trace" } ,
- { 0x0A74, "scripts/mp/utility/player" },
- { 0x09B4, "scripts/cp_mp/vehicles/vehicle" },
- { 0x09BA, "scripts/cp_mp/vehicles/vehicle_occupancy" },
- { 0x077B, "scripts/engine/utility" },
- { 0x0013, "scripts/mp/weapons" } ,
- { 0x0786, "scripts/mp/art" } ,
- { 0x0794, "scripts/mp/class" },
- { 0x06BD, "scripts/common/vehicle" },
- { 0x000D, "scripts/common/interactive" } ,
- { 0x0999, "scripts/cp_mp/utility/game_utility" } ,
- { 0x0A7E, "scripts/mp/utility/usability" } ,
- { 0x099C, "scripts/cp_mp/utility/player_utility" },
- { 0x099A, "scripts/cp_mp/utility/inventory_utility" },
- { 0x099D, "scripts/cp_mp/utility/script_utility" },
- { 0x0A72, "scripts/mp/utility/outline" },
- { 0x07CD, "scripts/mp/movers" } ,
- { 0x07B7, "scripts/mp/hostmigration" },
- { 0x09A2, "scripts/cp_mp/utility/weapon_utility" } ,
- { 0x076B, "scripts/cp_mp/hostmigration" },
- { 0x099B, "scripts/cp_mp/utility/killstreak_utility" },
- { 0x09BC, "scripts/cp_mp/vehicles/vehicle_tracking" } ,
- { 0x06B0, "scripts/common/input_allow" },
- { 0x0980, "scripts/cp_mp/killstreaks/airdrop" } ,
- { 0x07B9, "scripts/mp/hud_message" },
- { 0x07B4, "scripts/mp/healthoverlay" },
- { 0x07A3, "scripts/mp/equipment" },
- { 0x07D7, "scripts/mp/playeractions" },
- { 0x07E1, "scripts/mp/rank" },
- { 0x07D9, "scripts/mp/playerlogic" },
- { 0x07D3, "scripts/mp/outofbounds" },
- { 0x0A7C, "scripts/mp/utility/teams" },
- { 0x0A28, "scripts/mp/killstreaks/killstreaks" },
- { 0x07AC, "scripts/mp/gamelogic" },
- { 0x07AE, "scripts/mp/gamescore" },
