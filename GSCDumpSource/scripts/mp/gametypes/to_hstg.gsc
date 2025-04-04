// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_9964();
    _id_07B3::init();
    _id_07B3::_id_D849();
    _id_9965();
    level._id_E69E = 0;
    level._id_AB9A = ::_id_AB9A;
}

_id_9963()
{
    _id_9964();
    _id_9965();
    level._id_E69E = 1;
    _id_AB9A();
}

_id_9964()
{
    level._id_ED1F = "to_hstg";
    level._id_41B1 = "to_hstg";
    setomnvar( "ui_tac_ops_submode", level._id_41B1 );
}

_id_9965()
{
    if ( isusingmatchrulesdata() )
    {
        level._id_81CB = ::_id_81CB;
        [[ level._id_81CB ]]();
        level thread scripts\mp\utility\game::_id_C2DD();
    }
    else
    {
        scripts\mp\utility\game::_id_C29C( "to_hstg", 0, 0, 9 );
        scripts\mp\utility\game::_id_C2B3( "to_hstg", 10 );
        scripts\mp\utility\game::_id_C29F( "to_hstg", 85 );
        scripts\mp\utility\game::_id_C29B( "to_hstg", 1 );
        scripts\mp\utility\game::_id_C2C2( "to_hstg", 1 );
        scripts\mp\utility\game::_id_C270( "to_hstg", 0 );
        scripts\mp\utility\game::_id_C24F( "to_hstg", 0 );
        scripts\mp\utility\game::_id_C242( "to_hstg", 0 );
    }

    _id_FC7A();
    _id_D876();
    level._id_C632 = 1;
    level._id_E2B6 = 0;
    scripts\mp\gametypes\obj_grindzone::init();
    level.teambased = 1;
    level._id_AB46 = ::_id_AB46;
    level._id_AB2C = ::_id_AB2C;
    level._id_9FD5 = ::_id_AB91;
    level._id_ABA0 = ::_id_ABA0;
    level._id_ABAD = ::_id_ABAD;
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _func_01D2( "scr_to_hstg_bankTime", getmatchrulesdata( "grindData", "bankTime" ) );
    _func_01D2( "scr_to_hstg_bankRate", getmatchrulesdata( "grindData", "bankRate" ) );
    _func_01D2( "scr_to_hstg_bankCaptureTime", getmatchrulesdata( "grindData", "bankCaptureTime" ) );
    _func_01D2( "scr_to_hstg_megaBankLimit", getmatchrulesdata( "grindData", "megaBankLimit" ) );
    _func_01D2( "scr_to_hstg_bankBonus", getmatchrulesdata( "grindData", "megaBankBonus" ) );
    _func_01D2( "scr_to_hstg_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "to_hstg", 0 );
    _func_01D2( "scr_to_hstg_promode", 0 );
}

_id_D5A0()
{
    level._id_10CCB["waypoint_capture_recover"] = "neutral";
    level._id_10CCA["waypoint_capture_recover"] = 1;
    level._id_10CCB["koth_enemy"] = "enemy";
    level._id_10CCA["koth_enemy"] = 1;
    level._id_7C6F = "waypoint_hardpoint_target";
    level._id_7C59 = "koth_neutral";
    level._id_7C27 = "koth_enemy";
    level._id_7C30 = "koth_friendly";
    level._id_7C2D = "waypoint_hardpoint_contested";
    level._id_7C6C = "waypoint_taking_chevron";
    level._id_7C54 = "waypoint_hardpoint_losing";
    level._id_7C25 = "waypoint_target";
    level._id_7C26 = "waypoint_defend";
    level._id_7C65 = "waypoint_capture_recover";
    level._id_7C3A = "waypoint_escort";
    level._id_7C34 = "waypoint_defend_round";
    level._id_7C4F = "waypoint_capture_kill_round";
}

_id_AB9A()
{
    _id_4051();
    _id_D5A0();
    _id_0A4A::_id_7A85();
    setdvar( "#x379b22518a5fe8a76", 0.75 );
    level._id_110E1 = 120;
    level._id_7A82 = [];
    level._id_7A70 = [];
    level._id_44B4 = 1;
    _id_3FD4();
    level._id_5817 = getent( "hvtExtractionLoc", "targetname" );
    level._id_7A71 = [];
    level._id_7A71[0] = scripts\engine\utility::_id_6D7C( "hostage_waypoint_1", "targetname" );
    level._id_7A71[1] = scripts\engine\utility::_id_6D7C( "hostage_waypoint_2", "targetname" );
    level._id_7A71[2] = scripts\engine\utility::_id_6D7C( "hostage_waypoint_3", "targetname" );
    thread _id_3FD5();
    level._id_7A77 = [];
    level._id_7A77[0] = level._id_7C09;
    level._id_7A75 = [];
    level._id_7A75[0] = level._id_A8D5[0];
    _id_0A4A::_id_E25F();
    level._id_7A7B[0]._id_ACD2 = scripts\mp\utility\outline::_id_ACBF( level._id_7A7B[0]._id_25A4, level._id_7A7B[0].team, "outline_nodepth_cyan", "killstreak_personal" );
    setdvar( "#x379b22518a5fe8a76", 0.75 );
    level._id_110E1 = 120;
    level._id_7A82 = [];
    level._id_7A70 = [];
    level._id_44B4 = 1;
    level._id_A8D5[0] _id_07AD::_id_D5B8( level._id_7A7B[0] );
    level._id_5BCC = [];
    level._id_5BCC[0] = level._id_A8D5[0];
    _id_81C8();
    level thread _id_10BEA();

    if ( !istrue( level._id_E69E ) )
    {
        var_0[0] = "dom";
        _id_07AD::main( var_0 );
        scripts\mp\gametypes\tac_ops::_id_3AC0();
        _id_0ED5();
    }

    var_1 = scripts\mp\utility\game::_id_6DC7();
    level._id_5836 = 0;
    _id_0A66::_id_D627( "timelimit", 6 );
    level._id_ED20 = 1;
}

_id_D8C2( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2.team != var_0 )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        self _meth_80E0( var_2 );
    }
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_21B4 = _id_0A66::_id_507A( "bankTime", 2, 0, 10 );
    level._id_21B1 = _id_0A66::_id_507C( "bankRate", 1, 1, 10 );
    level._id_21A5 = _id_0A66::_id_507C( "bankCaptureTime", 0, 0, 10 );
    level._id_9D21 = _id_0A66::_id_507C( "megaBankLimit", 5, 5, 15 );
    level._id_9D1F = _id_0A66::_id_507C( "megaBankBonus", 150, 0, 750 );
}

_id_D876()
{
    level._id_7C39 = "waypoint_extract_enemy";
    level._id_7C38 = "waypoint_extract_enemy";
    level._id_7C44 = "waypoint_extract_friendly";
    level._id_7C43 = "waypoint_extract_friendly";
    level._id_7C46 = "waypoint_staging_friendly";
    level._id_7C45 = "waypoint_staging_friendly";
}

_id_FC5F()
{
    _id_07AD::_id_D60F( level._id_7C43 );
}

_id_AB91()
{
    if ( isdefined( self._id_ED71 ) )
        self setclientomnvar( "ui_grind_tags", self._id_ED71 );

    scripts\mp\playerlogic::_id_7DCD( self.team );
    self._id_7A6E = undefined;
    _id_0A4D::_id_8E13();
}

_id_AB46( var_0 )
{
    var_0._id_89FD = 0;
    var_0 thread _id_A109();
}

_id_A109()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        var_0 = 0;

        if ( self.team == "allies" )
            var_0 = 1;
        else if ( self.team == "axis" )
            var_0 = 2;

        self setclientomnvar( "ui_tacops_team", var_0 );

        if ( !isdefined( level._id_E69E ) )
        {
            scripts\mp\supers::_id_3963();
            _id_0A4D::_id_90BB();
        }
    }
}

_id_4051()
{
    var_0 = scripts\engine\utility::_id_6D7C( "hostage_extract_zone_A", "targetname" );
    var_1 = scripts\engine\utility::_id_6D7C( "hostage_extract_zone_B", "targetname" );
    level._id_5BCC = scripts\engine\utility::array_combine( var_0, var_1 );
    level._id_A8D5 = [];
}

_id_110D1()
{
    _id_07AD::_id_4AB0();
    _id_07AD::_id_15B7( "none" );
}

_id_827A()
{
    var_0 = level._id_ED1B;
    _id_07EE::_id_110D( "allies", "mp_tohstg_spawn_allies", 1 );
    _id_07EE::_id_110D( "axis", "mp_tohstg_spawn_axis", 1 );
    var_0._id_F2AB = [];
    var_0._id_F2AB["allies"] = _id_07EE::_id_6D30( "mp_tohstg_spawn_allies" );
    var_0._id_F2AB["axis"] = _id_07EE::_id_6D30( "mp_tohstg_spawn_axis" );

    if ( var_0._id_F2AB["allies"].size <= 0 )
    {
        _id_07EE::_id_110D( "allies", "mp_front_spawn_allies" );
        var_0._id_F2AB["allies"] = _id_07EE::_id_6D30( "mp_front_spawn_allies" );
    }

    if ( var_0._id_F2AB["axis"].size <= 0 )
    {
        _id_07EE::_id_110D( "axis", "mp_front_spawn_axis" );
        var_0._id_F2AB["axis"] = _id_07EE::_id_6D30( "mp_front_spawn_axis" );
    }
}

_id_6D2C()
{
    var_0 = level._id_ED1B;
    var_1 = self.pers["team"];
    var_2 = _id_07F3::_id_5A34( var_0._id_F2AB[var_1] );
    var_3 = undefined;
    return var_3;
}

_id_0ED5()
{
    _id_07EE::_id_D454( "TDM" );
    _id_07F3::_id_D452( "to_hstg", "allies" );
    _id_07F3::_id_D452( "to_hstg", "axis" );
    level._id_6D2C = ::_id_6D2C;
}

_id_ABAD()
{
    _id_52E5( "allies" );
}

_id_52E5( var_0 )
{
    level._id_5836 = undefined;
    level notify( "switch_modes" );

    foreach ( var_2 in level._id_7A7B )
    {
        var_2 _id_0A4A::_id_C4DD();

        if ( isdefined( var_2._id_FE8E ) )
            var_2._id_FE8E delete();

        var_2._id_25A4 delete();
        var_2._id_75BF delete();
        var_2 delete();
    }

    level._id_7A7B = [];

    foreach ( var_5 in level._id_0F16 )
    {
        var_5 _id_386E( 0 );
        var_5 scripts\mp\gametypes\obj_grindzone::_id_4371();
    }

    if ( isdefined( level._id_AB39 ) )
        [[ level._id_AB39 ]]( var_0 );

    scripts\mp\gamescore::_id_0CC9( var_0, 1, 0 );
    thread scripts\mp\gamelogic::_id_52D7( var_0, game["end_reason"]["objective_completed"] );
}

_id_ABA0( var_0 )
{
    if ( isdefined( var_0._id_7A6E ) )
        _id_0A4A::_id_5012( var_0, var_0._id_7A6E, var_0.origin );
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::_id_AA76( var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_0._id_7A6E ) )
        _id_0A4A::_id_5012( var_0, var_0._id_7A6E, var_0.origin );

    if ( !isdefined( var_0._id_EC30 ) )
        var_0 scripts\mp\playerlogic::_id_4533( var_0.team );
}

_id_469E( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    level endon( "hostage_spawn_early" );
    wait( var_0 );
    _id_0A4A::_id_E356( var_1, var_2 );
}

_id_7A72()
{
    for ( var_0 = 0; var_0 < level._id_0F16.size; var_0++ )
    {
        var_1 = level._id_0F16[var_0];

        if ( distancesquared( self.origin, var_1.origin ) < 14400 )
        {
            iprintlnbold( "OPFOR EXTRACTED A HOSTAGE" );
            _id_0A4A::_id_CBF9( var_1.team, 3 );
            return 1;
        }
    }

    return 0;
}

_id_81C8()
{
    level endon( "game_ended" );
    level endon( "switch_modes" );
    level._id_581A = "allies";

    for ( var_0 = 0; var_0 < level._id_5BCC.size; var_0++ )
        level._id_7D69[var_0] = level._id_5BCC[var_0];

    thread _id_10857();
}

_id_81C7()
{
    level endon( "game_ended" );
    level endon( "switch_modes" );
    level._id_581A = "axis";

    for ( var_0 = 0; var_0 < 2; var_0++ )
    {
        level._id_7D69[var_0] = level._id_A850[var_0];
        level._id_7D69[var_0] _id_FC5F();
        level._id_7D69[var_0] _id_07AD::_id_D8D5( "none" );
    }

    thread _id_10857();
}

_id_10857()
{
    _id_07A8::_id_60A3( "prematch_done" );
}

_id_3FD0( var_0, var_1 )
{
    var_2 = level._id_7D69.size;
    var_3 = level._id_7D69[var_2 - 1];
    var_3._id_9B36 = var_0;
    level._id_7D69[var_2 - 1] = undefined;
    var_4 = level._id_0F16.size;
    level._id_0F16[var_4] = var_3;
    level._id_0F17[var_4] = self;
    var_5 = int( gettime() + 119000 );

    if ( istrue( var_1 ) )
        _id_99E3( var_3 );
}

_id_99E3( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._id_5819;

    var_0.origin = var_1;

    if ( isdefined( var_0._id_047A ) )
        var_0._id_047A.origin = var_1;

    var_0._id_411F = var_1;
    var_0 _id_07AD::_id_C56B( 1, 1 );
    var_0 _id_FC5F();
    var_0 scripts\mp\gametypes\obj_grindzone::_id_0EDC();
    var_0._id_0026 = 1;
    var_0 _id_07AD::_id_D8D5( "friendly" );
    var_0._id_0383 = scripts\mp\gametypes\obj_grindzone::_id_D8A2( var_1, var_0 );
    var_0 scripts\mp\gametypes\obj_grindzone::_id_FC61( var_0.team, 0 );

    if ( isdefined( var_0.team ) )
        _id_FD22( var_0.team, 0 );

    level notify( "zone_moved" );
    _id_0A79::_id_B8DE( "mp_killstreak_radar" );
    var_2 = spawnfx( level._effect["vfx_smk_signal"], var_1 );

    if ( isdefined( var_2 ) )
        triggerfx( var_2 );

    var_0._id_607F = var_2;
}

_id_E2E0( var_0, var_1 )
{
    self endon( "game_ended" );
    self endon( "switch_modes" );
    wait( var_1 );
    var_2 = level._id_5819;
    var_3 = ( 0, 0, 0 );
    var_4 = 24000;
    var_5 = scripts\cp_mp\utility\killstreak_utility::_id_6ABC();
    var_6 = var_5.origin[2];
    var_7 = _id_6A02( var_6 );
    var_8 = 4000;
    var_9 = "jackal";
    var_10 = _id_0982::_id_6A2F( var_2, var_3, var_4, var_5, var_6, var_8, var_7, var_9 );
    var_11 = _id_5934();
    var_12 = _id_0A26::_id_2484( 0, var_10["startPoint"], var_2, var_11, var_0 );
    return var_12;
}

_id_5934()
{
    var_0 = spawnstruct();
    var_0._id_1F5C = 1;
    var_0._id_5B50 = "offhand_fired";
    var_0._id_8862 = 1;
    var_0._id_8CD4 = 5;
    var_0._id_9355 = 0;
    var_0._id_990E = gettime();
    var_0._id_CF8A = "gesture_script_weapon";
    var_0._id_EA0F = "jackal";
    var_0.streakname = undefined;
    var_0._id_04A4 = -1;
    var_0._id_04D6 = "s4_ks_gesture_generic_mp";
    var_0.objweapon = makeweapon( var_0._id_04D6 );
    return var_0;
}

_id_6A02( var_0 )
{
    var_1 = 850;
    var_2 = 1500;
    var_3 = var_1 / var_0;
    var_4 = var_3 * var_2;
    return var_4;
}

_id_1084E( var_0 )
{
    level endon( "game_ended" );
    level endon( "switch_modes" );
    self endon( "extraction_destroyed" );
    thread _id_5828();
    wait 119;

    foreach ( var_2 in level._id_8B3A )
    {
        if ( !isdefined( var_2._id_9908 ) || !isdefined( var_2._id_9908._id_9B36 ) )
            continue;

        if ( self._id_9B36 == var_2._id_9908._id_9B36 )
            var_2 notify( "extract_hostages" );
    }

    if ( level._id_A8D5[0]._id_AD9B == "allies" )
    {
        scripts\mp\gamescore::_id_0CC9( "allies", 1, 0 );
        thread scripts\mp\gamelogic::_id_52D7( "allies", game["end_reason"]["objective_completed"] );
    }
    else
    {
        scripts\mp\gamescore::_id_0CC9( "axis", 1, 0 );
        thread scripts\mp\gamelogic::_id_52D7( "axis", game["end_reason"]["objective_completed"] );
    }
}

_id_5828()
{
    level endon( "switch_modes" );
    self endon( "game_ended" );
    self endon( "extract_hostages" );
    self waittill( "extraction_destroyed" );
    _id_386E( 0 );
}

_id_386E( var_0 )
{
    if ( var_0 )
        _id_34F5();

    _id_386F();
    level._id_7D69[level._id_7D69.size] = self;
    level._id_0F17 = scripts\engine\utility::array_remove_index( level._id_0F17, 0 );
    level._id_0F16 = scripts\engine\utility::array_remove_index( level._id_0F16, 0 );
}

_id_386F()
{
    if ( isdefined( self._id_0383 ) )
    {
        scripts\mp\gametypes\obj_grindzone::_id_FC61( "off", 0 );
        self._id_0383 delete();
    }

    if ( isdefined( self._id_607F ) )
        self._id_607F delete();

    if ( isdefined( self._id_9B36 ) && isdefined( self._id_9B36._id_04C5 ) )
    {
        self._id_9B36._id_04C5 delete();
        _id_07AD::_id_15B7( "none" );
        _id_07AD::_id_C2F2();
    }

    self._id_0026 = 0;
    _id_FD22( "zone_shift", 0 );
    scripts\mp\gametypes\obj_grindzone::_id_4371();
    self._id_0026 = 1;
    self._id_8F6B = gettime();
}

_id_34F5()
{
    var_0 = [];
    var_1 = "none";

    foreach ( var_3 in level._id_7A7B )
    {
        if ( var_3 _id_7A72() )
            var_0[var_0.size] = var_3;

        var_1 = var_3.team;
    }

    level._id_7A7B = scripts\engine\utility::_id_1B97( level._id_7A7B, var_0 );
    _id_F746( var_1 );
}

_id_F746( var_0 )
{
    if ( level._id_7A7B.size == 0 )
    {
        level notify( "hostage_spawn_early" );
        _id_0A4A::_id_E356( 2, var_0 );
        waitframe();
        var_1 = scripts\mp\gametypes\tac_ops::_id_6D8F() / 1000;
        thread _id_469E( var_1 * 0.2, 2 );
        thread _id_469E( var_1 * 0.4, 2 );
        thread _id_469E( var_1 * 0.6, 2 );
    }
}

_id_743C( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    var_1 = scripts\mp\hostmigration::_id_10956();

    if ( var_1 > 0 )
        return;

    return;
}

_id_FD22( var_0, var_1 )
{
    var_2 = -1;

    if ( var_1 )
        var_2 = -2;
    else
    {
        switch ( var_0 )
        {
            case "axis":
            case "allies":
                var_3 = thread _id_6BE4( var_0 );

                if ( isdefined( var_3 ) )
                    var_2 = var_3 getentitynumber();

                break;
            case "zone_activation_delay":
                var_2 = -3;
                break;
            case "zone_shift":
            default:
                break;
        }
    }
}

_id_6BE4( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_0 )
        {
            var_1 = var_3;
            break;
        }
    }

    return var_1;
}

_id_D862( var_0 )
{
    var_1 = 1;
    level._id_581A = var_0;

    if ( !isdefined( level._id_581A ) )
        var_1 = 2;
    else if ( level._id_581A == "allies" )
        var_1 = 0;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_1 ) )
            var_3 setclientomnvar( "ui_hp_callout_id", var_1 );
    }
}

_id_F739( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( level._id_0F16.size < 2 )
    {
        level._id_5819 = var_0;
        _id_3FD0( var_1, var_2 );
        self iprintlnbold( "Extraction copter deployed, hold out!" );
        return 1;
    }
    else
    {
        self iprintlnbold( "Request Denied - All copters already en route!" );
        return 0;
    }
}

_id_6A0B()
{
    return 120;
}

_id_3FD4()
{
    var_0 = getent( "hvtSpawnLoc", "targetname" );
    level._id_7C09 = var_0;
}

_id_3FD5()
{
    var_0 = getent( "hvtExtractionLoc", "targetname" );
    level._id_A8D5 = [];
    level._id_A8D5[0] = var_0;
    var_1 = scripts\mp\gametypes\obj_dom::_id_D88B( level._id_A8D5[0] );
    scripts\engine\utility::_id_46C3( 3.0, ::_id_46B9 );
    var_1._id_ABB8 = ::_id_7A73;
    level._id_A8D5[0] = var_1;
    level._id_5C1B = 0.1;
    level._id_5C21 = 0;
    waitframe();
    var_1 _id_07AD::_id_D62D( "neutral" );
    var_1 _id_07AD::_id_D8D5( "any" );
    var_1 _id_07AD::_id_15B7( "enemy" );
    var_1 _id_07AD::_id_3144( 1 );
    var_1 _id_07AD::_id_D60F( level._id_7C30, level._id_7C44 );
}

_id_46B9()
{
    level._id_A8D5[0] _id_07AD::_id_D62D( "axis" );
    level._id_A8D5[0] _id_07AD::_id_15B7( "enemy" );
    level._id_A8D5[0] scripts\mp\gametypes\obj_dom::_id_FC61( "axis", 0 );
    level._id_A8D5[0] _id_07AD::_id_D60F( level._id_7C30, level._id_7C44 );
}

_id_10BEA()
{
    level endon( "game_ended" );
    level endon( "hostage_phase_ended" );
    var_0 = getentarray( "to_hstg_push_trigger", "targetname" );

    if ( !isdefined( var_0 ) || var_0.size <= 0 )
        return;

    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = int( var_3._id_0375 );
        var_1[var_4] = var_3;
    }

    var_6 = 0;

    for (;;)
    {
        wait 1.0;
        var_7 = var_1[var_6 + 1];

        if ( isdefined( var_7 ) )
        {
            foreach ( var_9 in level._id_7A7B )
            {
                if ( var_9 _meth_81EF( var_7 ) )
                {
                    var_6++;
                    var_10 = "to_hstg_" + var_6;
                    _id_07F3::_id_D452( var_10, "allies" );
                    _id_07F3::_id_D452( var_10, "axis" );
                    level notify( "hostage_spawns_pushed" );
                }
            }
        }
    }
}

_id_7A73( var_0 )
{
    scripts\mp\gametypes\obj_dom::_id_4D2F( var_0 );

    if ( var_0.team == "allies" )
    {
        if ( isdefined( var_0._id_7A6E ) )
        {
            var_1 = _id_0A4A::_id_5012( var_0, var_0._id_7A6E, var_0.origin );
            var_1._id_F3FB _id_07AD::_id_4778();
            var_1 makeunusable();
            var_1._id_FE8E unlink();
            var_1._id_FE8E makeunusable();
        }

        var_0 thread _id_F739( var_0.origin, undefined, 0 );
        var_2 = scripts\mp\gametypes\tac_ops::_id_6D91();

        if ( var_2 < _id_6A0B() * 1000 )
            scripts\mp\gametypes\tac_ops::_id_57DA( _id_6A0B() * 1000 - var_2 );
        else
            scripts\mp\gametypes\tac_ops::_id_C171( var_2 - _id_6A0B() * 1000 );

        level._id_A8D5[0]._id_ABB8 = scripts\mp\gametypes\obj_dom::_id_4D2F;
        level._id_A8D5[0] _id_07AD::_id_D5B8( undefined );
        level._id_A8D5[0] _id_07AD::_id_D8D5( "any" );
        level._id_A8D5[0] _id_07AD::_id_15B7( "enemy" );

        if ( scripts\mp\utility\teams::_id_6DAC( "allies", "teamCount" ) )
        {
            level._id_F345 = scripts\engine\utility::_id_1BAE( scripts\mp\utility\teams::_id_6DAC( "allies", "players" ), ::_id_3AD2 );
            var_3 = level._id_F345[0] _id_E2E0( self, 0 );
            var_4 = scripts\mp\utility\teams::_id_6DAC( "axis", "players" );
            var_5 = var_4.size;
            var_5 = max( var_5, 1 );
            var_6 = 1666.67;
            var_3.health = int( var_5 * var_6 );
            var_3.maxhealth = var_3.health;
            level._id_A8D5[0] thread _id_3D29();
            var_3 thread _id_3D2A();
            setomnvar( "ui_tacops_helo_health_percent", 1.0 );
            thread _id_79B5();
        }
    }
}

_id_79B6()
{
    wait 7;
    scripts\mp\gametypes\tac_ops::_id_EF90( &"MISC_MESSAGES_MP/TO_ALLY_HSTG_DEFEND_1", &"MISC_MESSAGES_MP/TO_AXIS_HSTG_DEFEND_1" );
}

_id_3D2A()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "damage", var_0 );
        setomnvar( "ui_tacops_helo_health_percent", self.health / self.maxhealth );
    }
}

_id_3D29()
{
    level endon( "game_ended" );
    self waittill( "extraction_destroyed" );
    scripts\mp\gametypes\tac_ops::_id_AF61();
    wait 5;
    _id_52E5( "axis" );
}

_id_79B5()
{
    level endon( "game_ended" );
    self endon( "extraction_destroyed" );
    level notify( "hostage_holdout_phase_begun" );
    thread _id_79B6();
    _id_E68F();
    wait( _id_6A0B() - 110.0 );
    _id_0A4C::_id_BEB3( "dx_mpb_us1_phase1_wina", "allies" );
    _id_0A4C::_id_BEB3( "dx_mpb_aqcm_lz_capture", "axis" );
    wait 10.0;
    _id_0A4C::_id_BEB3( "dx_mpb_ovl_lz_hold", "allies" );
    wait 20.0;
    _id_0A4C::_id_BEB3( "dx_mpb_us2_phase3_introa4", "allies" );
    wait 55.0;
    _id_0A4C::_id_BEB3( "dx_mpb_us2_phase1_infila6", "allies" );
    _id_0A4C::_id_BEB3( "dx_mpb_aqcm_phase1_lesstimeb", "axis" );
}

_id_E68F()
{
    var_0 = getentarray( "holdout_outofbounds", "targetname" );
    var_1 = scripts\mp\utility\teams::_id_6DAC( "allies", "players" );

    foreach ( var_3 in var_1 )
    {
        foreach ( var_5 in var_0 )
            var_3 _id_E707( var_5, "copterHoldOut" );
    }
}

_id_E707( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "switch_modes" );
}

_id_3AD2( var_0, var_1 )
{
    return var_0._id_0369 >= var_1._id_0369;
}
