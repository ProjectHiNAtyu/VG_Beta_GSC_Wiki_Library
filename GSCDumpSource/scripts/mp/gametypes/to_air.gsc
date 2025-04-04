// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_9964();
    _id_07B3::init();
    _id_07B3::_id_D849();

    if ( isusingmatchrulesdata() )
        scripts\mp\utility\game::_id_D4D3();

    _id_9965();
    level._id_E69E = 0;
    level._id_AB9A = ::_id_AB9A;
}

_id_9963()
{
    _id_9964();
    _id_9965();
    level._id_E69E = 1;
    _id_AB9A( 1 );
}

_id_9964()
{
    level._id_ED1F = "to_air";
    level._id_41B1 = "to_air";
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
        scripts\mp\utility\game::_id_C29C( "to_air", 0, 0, 9 );
        scripts\mp\utility\game::_id_C2B3( "to_air", 10 );
        scripts\mp\utility\game::_id_C29F( "to_air", 65 );
        scripts\mp\utility\game::_id_C29B( "to_air", 1 );
        scripts\mp\utility\game::_id_C2C2( "to_air", 1 );
        scripts\mp\utility\game::_id_C270( "to_air", 0 );
        scripts\mp\utility\game::_id_C24F( "to_air", 0 );
        scripts\mp\utility\game::_id_C242( "to_air", 0 );
        level._id_9BD4 = 0;
    }

    _id_FC7A();
    level.teambased = 1;
    level._id_AB2C = ::_id_AB2C;
    level._id_9FD5 = ::_id_AB91;
    level._id_ABAD = scripts\mp\gamelogic::_id_455F;
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _func_01D2( "scr_to_air_waverespawndelay", 5 );
    _func_01D2( "scr_to_air_waverespawndelay_alt", 10 );
    _func_01D2( "scr_conf_pointsPerConfirm", getmatchrulesdata( "confData", "pointsPerConfirm" ) );
    _func_01D2( "scr_conf_pointsPerDeny", getmatchrulesdata( "confData", "pointsPerDeny" ) );
    _func_01D2( "scr_conf_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "conf", 0 );
    _func_01D2( "scr_conf_promode", 0 );
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_5C21 = _id_0A66::_id_507C( "flagNeutralization", 0, 0, 1 );
    level._id_3C46 = 1;
}

_id_AB9A( var_0 )
{
    var_1[0] = "dd";
    var_1[1] = "dd_bombzone";
    var_1[2] = "blocker";
    var_1[3] = "grind";
    var_1[4] = "dom";
    var_1[5] = "conf";
    _id_07AD::main( var_1 );
    _id_D5A0();
    _id_D83B();
    thread _id_D88E();

    if ( !istrue( var_0 ) )
    {
        scripts\mp\gametypes\tac_ops::_id_3AC0();
        _id_0ED5();
        level._id_15B2 = 1;
    }

    level._id_5836 = 0;
    setclientnamemode( 0 );
    _id_0A66::_id_D627( "timelimit", 10 );
    _id_FBFA();
}

_id_827A()
{
    var_0 = level._id_ED1B;
    _id_07EE::_id_110D( "allies", "mp_toair_spawn_allies" );
    _id_07EE::_id_110D( "axis", "mp_toair_spawn_axis" );
    var_0._id_F2A1 = [];
    var_0._id_F2A1["allies"] = _id_07EE::_id_6D30( "mp_toair_spawn_allies" );
    var_0._id_F2A1["axis"] = _id_07EE::_id_6D30( "mp_toair_spawn_axis" );
}

_id_6D2C()
{
    var_0 = level._id_ED1B;
    var_1 = self.pers["team"];
    var_2 = undefined;
    var_2 = var_0._id_F2A1[var_1];
    var_2 = _id_07F3::_id_5A34( var_2 );
    var_3 = undefined;

    if ( isdefined( self._id_ED15._id_5094 ) )
    {
        var_4 = isdefined( level._id_5608[0] ) && self._id_ED15._id_5094 == level._id_5608[0];
        var_5 = isdefined( level._id_5608[1] ) && self._id_ED15._id_5094 == level._id_5608[1];
        var_6 = isdefined( level._id_5608[2] ) && self._id_ED15._id_5094 == level._id_5608[2];

        if ( var_4 || var_5 && level._id_5608[1]._id_E32D || var_6 && level._id_5608[2]._id_E32D )
        {
            var_7 = scripts\engine\utility::_id_B420( self._id_ED15._id_5094.origin, 32, 0, -1500, ( 0, 0, 1 ) );
            self._id_ED15._id_5094._id_E32F = var_7;
        }
        else if ( isdefined( level._id_5608[1] ) && self._id_ED15._id_5094 == level._id_5608[1] )
        {
            self._id_ED15._id_5094._id_E32F = self._id_ED15._id_5094.origin;
            level._id_5608[1].owner thread _id_54AD( level._id_5608[1] );
        }
        else if ( isdefined( level._id_5608[2] ) && self._id_ED15._id_5094 == level._id_5608[2] )
        {
            self._id_ED15._id_5094._id_E32F = self._id_ED15._id_5094.origin;
            level._id_5608[2].owner thread _id_54AD( level._id_5608[2] );
        }

        var_8 = anglestoforward( self._id_ED15._id_5094.angles );
        var_8 = var_8 * ( 1, 1, 0 );
        var_9 = ( 0, 0, 1 );
        var_10 = _func_0256( var_8, var_9 );
        var_11 = _func_0017( var_8, var_10, var_9 );
        self._id_ED15._id_5094._id_E264 = var_11;
    }
    else
    {

    }

    return var_3;
}

_id_0ED5()
{
    _id_07EE::_id_D454( "TDM" );
    _id_07F3::_id_D452( "to_air", "allies" );
    _id_07F3::_id_D452( "to_air", "axis" );
    level._id_6D2C = ::_id_6D2C;
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::_id_AA76( var_0, var_1, var_2, var_3, var_4 );
}

_id_AB91()
{
    var_0 = 0;

    if ( self.team == "allies" )
    {
        var_0 = 1;

        if ( !istrue( level._id_E2B5 ) )
        {
            level._id_E2B5 = 1;
            thread _id_D872();
        }
    }
    else if ( self.team == "axis" )
        var_0 = 2;

    self setclientomnvar( "ui_tacops_team", var_0 );
    _id_0A4D::_id_8E13();
}

_id_D5A0()
{
    level._id_7C6F = "waypoint_hardpoint_target";
    level._id_7C59 = "koth_neutral";
    level._id_7C27 = "koth_enemy";
    level._id_7C30 = "koth_friendly";
    level._id_7C2D = "waypoint_hardpoint_contested";
    level._id_7C6C = "waypoint_taking_chevron";
    level._id_7C54 = "waypoint_hardpoint_losing";
    level._id_7C25 = "waypoint_target";
    level._id_7C26 = "waypoint_defend";
}

_id_D83B()
{
    level._id_138C = [];
    _id_3B6B( 0, "air_path_0" );
    _id_3B6B( 1, "air_path_1" );
    _id_3B6B( 2, "air_path_2" );
}

_id_3B6B( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );

    if ( isdefined( var_2 ) && isdefined( var_2.target ) )
    {
        var_3 = getentarray( var_2.target, "targetname" );

        if ( isdefined( var_3 ) && var_3.size > 0 )
        {
            level._id_138C[var_0] = [];

            foreach ( var_5 in var_3 )
            {
                var_6 = int( var_5._id_0375 );
                level._id_138C[var_0][var_6] = [];
                var_7 = var_5;

                for (;;)
                {
                    level._id_138C[var_0][var_6][level._id_138C[var_0][var_6].size] = var_7;

                    if ( !isdefined( var_7.target ) )
                        break;

                    var_7 = getent( var_7.target, "targetname" );
                }
            }
        }
    }
}

_id_D872()
{
    level._id_5608 = [];
    level._id_5608[0] = _id_E2DA( level._id_138C[0][0][0].origin );
    level._id_5608[0] thread _id_1FC8();
    level._id_5608[1] = _id_E2DA( level._id_138C[1][0][0].origin );
    level._id_5608[2] = _id_E2DA( level._id_138C[2][0][0].origin );
    _id_07F3::_id_107C( "to_air", level._id_5608[0], "allies", "to_air_allies_blackhawk" );
    _id_07F3::_id_107C( "to_air", level._id_5608[1], "allies", "to_air_allies_ah64_left" );
    _id_07F3::_id_107C( "to_air", level._id_5608[2], "allies", "to_air_allies_ah64_right" );
    level._id_5608[0]._id_E32D = 0;
    level._id_5608[1]._id_E32D = 0;
    level._id_5608[2]._id_E32D = 0;
    _id_FBFA();
    level._id_5608[0]._id_F3FB = level._id_5608[0] _id_07AD::_id_4047( level._id_5608[0], ( 0, 0, 0 ) );
    level._id_5608[0]._id_F3FB _id_07AD::_id_C2F2();
    level._id_5608[0]._id_F3FB _id_07AD::_id_C56B( 0, 1 );
    level._id_5608[0]._id_F3FB _id_07AD::_id_D62D( "allies" );
    level._id_5608[0]._id_F3FB _id_07AD::_id_D60F( level._id_7C30, level._id_7C27 );
    level._id_5608[0]._id_F3FB _id_07AD::_id_D8D5( "any" );
    level._id_138B = 0;
    level._id_5608[0] waittill( "goal" );
    _id_5E05();
}

_id_E2DA( var_0 )
{
    var_1 = var_0;
    var_2 = ( 0, 0, 0 );
    var_3 = 24000;
    var_4 = undefined;
    var_5 = var_0[2];
    var_6 = _id_0982::_id_6A02( var_5 );
    var_7 = 8000;
    var_8 = "jackal";
    var_9 = _id_0982::_id_6A2F( var_1, var_2, var_3, var_4, var_5, var_7, var_6, var_8 );
    var_10 = _id_5934();
    var_11 = _id_0A26::_id_2485( 0, var_9["startPoint"], var_1, var_10, undefined );
    return var_11;
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

_id_D88E()
{
    level._id_41BD = 0;
    level._id_41BB = undefined;
    level._id_A8D5 = [];
    wait 2.0;
    _id_D866();
}

_id_D866()
{
    var_0 = getentarray( "flag_primary", "targetname" );
    var_1 = getentarray( "flag_secondary", "targetname" );

    if ( var_0.size + var_1.size == 0 )
        return;

    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_2[var_2.size] = var_0[var_3];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_2[var_2.size] = var_1[var_3];

    var_4 = [];
    var_4[0] = 10;
    var_4[1] = 20;
    var_4[2] = 30;
    var_5 = [];
    var_5[0] = 0;
    var_5[1] = 0;
    var_5[2] = 0;
    level._id_A8D5 = [];

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_6 = 0;

        switch ( var_2[var_3]._id_CD8C )
        {
            case "_a":
                var_6 = 0;
                break;
            case "_b":
                var_6 = 1;
                break;
            case "_c":
                var_6 = 2;
                break;
        }

        var_2[var_3]._id_CD8C = undefined;
        level._id_A8D5[var_6] = var_2[var_3];
        var_7 = scripts\mp\gametypes\obj_dom::_id_D88B( level._id_A8D5[var_6] );
        var_7 _id_4D28();
        var_7._id_AA66 = ::_id_4D26;
        var_7._id_ABB8 = ::_id_4D2F;
        var_7._id_AAAF = ::_id_4D2A;
        var_7._id_AA7A = ::_id_4D27;
        var_7._id_ABB4 = ::_id_4D2C;
        var_7._id_AAA2 = ::_id_4D28;
        var_7._id_AAAE = ::_id_4D29;
        var_7._id_AA5B = ::_id_4D25;
        level._id_A8D5[var_6] = var_7;
        level._id_A8D5[var_6]._id_F1E2 = var_6;
        level._id_A8D5[var_6]._id_3207 = var_4[var_6];
        level._id_A8D5[var_6]._id_79B9 = var_5[var_6];

        if ( var_6 != 0 )
            level._id_A8D5[var_6] scripts\engine\utility::_id_46C3( 2.0, ::_id_4D28 );
    }
}

_id_4A84()
{
    scripts\mp\gametypes\obj_dom::_id_FC61( "off", 0 );
}

_id_5E05()
{
    level._id_41BB = level._id_A8D5[level._id_41BD];

    if ( isdefined( level._id_41BB ) )
        level._id_41BB [[ level._id_41BB._id_AAAE ]]();

    thread _id_779E( 0 );
    thread _id_779E( 1 );
    thread _id_779E( 2 );
}

_id_779E( var_0 )
{
    var_1 = level._id_5608[var_0];
    var_2 = level._id_138C[var_0][level._id_138B];

    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( var_2 ) )
        return;

    for ( var_3 = 1; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_1 ) )
            return;

        var_4 = var_2[var_3];
        var_5 = var_4.origin;
        var_1._id_0102 = "guard_location";
        var_1 notify( var_1._id_0102 );
        var_1 thread _id_0A26::_id_723A( var_5 );

        if ( isdefined( var_1 ) )
            var_1 waittill( "goal" );
    }

    if ( isdefined( level._id_41BB ) && isdefined( level._id_41BB._id_047A ) )
        var_1 thread _id_0A26::_id_723A( undefined, level._id_41BB._id_047A );

    if ( var_0 == 0 )
    {
        if ( isdefined( level._id_41BB ) )
            level._id_41BB [[ level._id_41BB._id_AA5B ]]();
        else
        {
            scripts\mp\gamescore::_id_0CC9( "allies", 1, 0 );
            thread scripts\mp\gamelogic::_id_52D7( "allies", game["end_reason"]["objective_completed"] );
        }

        level._id_138B++;
    }
}

_id_D597( var_0 )
{
    var_1 = distance( level._id_1DBE.origin, var_0 );
    var_2 = var_1 / 150;
    var_3 = 0.25;
    var_4 = 0.25;
    level._id_1DBE moveto( var_0, var_2, var_3, var_4 );
    var_5 = anglestoforward( level._id_1DBE.angles );
    var_6 = vectornormalize( var_0 - level._id_1DBE.origin );
    thread _id_33B8( var_5, var_6, 2.0 );
    return var_2;
}

_id_33B8( var_0, var_1, var_2 )
{
    var_3 = gettime();
    var_4 = var_3;
    var_2 = int( var_2 * 1000 );

    for ( var_5 = var_4 + var_2; var_3 < var_5; var_3 = gettime() )
    {
        var_6 = clamp( ( var_3 - var_4 ) / var_2, 0.0, 1.0 );
        var_7 = _func_0259( var_0, var_1, var_6 );
        level._id_1DBE.angles = _id_0A78::_id_FFE1( var_7, ( 0, 0, 1 ) );
        waitframe();
    }
}

_id_4D26( var_0 )
{
    scripts\mp\gametypes\obj_dom::_id_4D30( var_0 );
}

_id_4D2F( var_0 )
{
    scripts\mp\gametypes\obj_dom::_id_4D2F( var_0 );
    var_1 = _id_07AD::_id_6BE3();
    var_2 = scripts\mp\utility\game::_id_6BC3( var_1 )[0];
    thread _id_0A77::_id_BCFE( var_1, var_2, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_0 );
    thread _id_4D24( var_1 );
}

_id_4D2A( var_0, var_1, var_2 )
{
    if ( self != level._id_41BB )
        return;

    scripts\mp\gametypes\obj_dom::_id_4D31( var_0, var_1, var_2 );
}

_id_4D27()
{
    if ( self != level._id_41BB )
        return;

    scripts\mp\gametypes\obj_dom::_id_4D27();
}

_id_4D2C( var_0 )
{
    if ( self != level._id_41BB )
        return;

    scripts\mp\gametypes\obj_dom::_id_4D2C( var_0 );
}

_id_4D28()
{
    _id_07AD::_id_15B7( "none" );
    _id_07AD::_id_4AB0();
    _id_07AD::_id_C5FC();
    _id_07AD::_id_C2F2();
    scripts\engine\utility::_id_46C3( 0.1, ::_id_4A84 );
}

_id_4D29()
{
    _id_07AD::_id_C56B( 1, 1 );
    _id_07AD::_id_5240();
    _id_07AD::_id_D8D5( "friendly" );
    _id_07AD::_id_15B7( "none" );
    _id_07AD::_id_D60F( level._id_7C30, level._id_7C6F );
    _id_07AD::_id_D62D( "axis" );
    scripts\mp\gametypes\obj_dom::_id_FC61( "axis", 0 );
}

_id_4D25()
{
    level._id_5C1B = self._id_3207;
    _id_07AD::_id_D60F( level._id_7C30, level._id_7C27 );
    _id_07AD::_id_D8D5( "any" );
    _id_07AD::_id_15B7( "enemy" );
}

_id_4D24( var_0 )
{
    level endon( "gameEnded" );
    self notify( "domPoint_HoldTimer" );
    self endon( "domPoint_HoldTimer" );
    var_1 = level._id_41BB._id_79B9;

    if ( var_1 > 0 )
    {
        wait( var_1 );

        if ( istrue( level._id_3C46 ) )
        {
            var_2 = scripts\mp\utility\game::_id_6BC3( var_0 )[0];

            for (;;)
            {
                if ( level._id_41BB._id_F393[var_2].size == 0 )
                    break;

                waitframe();
            }
        }
    }

    if ( var_0 == "allies" )
    {
        level._id_41BB [[ level._id_41BB._id_AAA2 ]]();
        level._id_41BD++;
        _id_FBFA();
        _id_5E05();
    }
}

_id_FBFA()
{
    if ( !isdefined( level._id_1588 ) )
        level._id_1588 = [];

    level._id_1588["allies"] = [];
    level._id_1588["axis"] = [];

    if ( isdefined( level._id_5608 ) )
    {
        level._id_1588["allies"][level._id_1588["allies"].size] = "to_air_allies_blackhawk";

        if ( isdefined( level._id_5608[1] ) && !istrue( level._id_5608[1]._id_E32D ) )
            level._id_1588["allies"][level._id_1588["allies"].size] = "to_air_allies_ah64_left";

        if ( isdefined( level._id_5608[2] ) && !istrue( level._id_5608[2]._id_E32D ) )
            level._id_1588["allies"][level._id_1588["allies"].size] = "to_air_allies_ah64_right";
    }

    switch ( level._id_41BD )
    {
        case 0:
            level._id_1588["allies"][level._id_1588["allies"].size] = "to_air_allies_0";
            level._id_1588["axis"][level._id_1588["axis"].size] = "to_air_axis_0";
            break;
        case 1:
            level._id_1588["axis"][level._id_1588["axis"].size] = "to_air_axis_1";
            break;
        case 2:
            level._id_1588["axis"][level._id_1588["axis"].size] = "to_air_axis_2";
            break;
    }

    foreach ( var_9, var_1 in level._id_1588 )
    {
        foreach ( var_3 in level._id_ED13._id_0F10[var_9]._id_E266[var_9] )
        {
            var_4 = 0;

            foreach ( var_6 in level._id_1588[var_9] )
            {
                if ( var_6 == var_3._id_0375 )
                {
                    var_4 = 1;
                    break;
                }
            }

            var_3._id_521F = var_4;
        }
    }

    level notify( "tac_ops_map_changed" );
}

_id_54AD( var_0 )
{
    self waittill( "spawned_player" );
    self playerlinkto( var_0, "tag_origin" );
    self _meth_828E( var_0._id_F81C );
    var_0._id_E32D = 1;
    _id_FBFA();
    thread _id_10AD3( var_0 );
    thread _id_10B79( var_0 );
}

_id_10AD3( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    self endon( "leaving" );
    var_0 thread scripts\mp\killstreaks\killstreaks::_id_15A7();
    var_0 waittill( "killstreakExit" );
    self _meth_828F( var_0._id_F81C );
    var_1 = scripts\engine\utility::_id_B420( var_0.origin, 32, 0, -1500, ( 0, 0, 1 ) );
    self unlink();
    self dontinterpolate();
    self setorigin( var_1 );
    var_2 = anglestoforward( var_0.angles );
    var_2 = var_2 * ( 1, 1, 0 );
    var_3 = ( 0, 0, 1 );
    var_4 = _func_0256( var_2, var_3 );
    var_5 = _func_0017( var_2, var_4, var_3 );
    self setplayerangles( var_5 );
    var_0._id_E32D = 0;
    _id_FBFA();
    self notify( "exited_heli" );
}

_id_10B79( var_0 )
{
    self endon( "exited_heli" );
    var_0 waittill( "death" );
    self suicide();
    _id_FBFA();
}

_id_1FC8()
{
    level endon( "game_ended" );
    self waittill( "death" );
    wait 5.0;
    scripts\mp\gamescore::_id_0CC9( "axis", 1, 0 );
    thread scripts\mp\gamelogic::_id_52D7( "axis", game["end_reason"]["objective_completed"] );
}
