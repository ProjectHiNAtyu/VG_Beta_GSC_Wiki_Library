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
    level._id_ED1F = "to_dd";
    level._id_41B1 = "to_dd";
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
        scripts\mp\utility\game::_id_C29C( "to_dd", 0, 0, 9 );
        scripts\mp\utility\game::_id_C2B3( "to_dd", 3 );
        scripts\mp\utility\game::_id_C29F( "to_dd", 0 );
        scripts\mp\utility\game::_id_C29B( "to_dd", 1 );
        scripts\mp\utility\game::_id_C2C2( "to_dd", 1 );
        scripts\mp\utility\game::_id_C270( "to_dd", 0 );
        scripts\mp\utility\game::_id_C24F( "to_dd", 0 );
        scripts\mp\utility\game::_id_C242( "to_dd", 0 );
        scripts\mp\utility\game::_id_D629( 2 );
        level._id_9BD4 = 0;
        level._id_9BD9 = 0;
    }

    _id_FC7A();
    level._id_A8C1 = 1;
    level.teambased = 1;
    level._id_AB6C = ::_id_AB6C;
    level._id_9FD5 = ::_id_AB91;
    level._id_AA90 = ::_id_AA90;
    level._id_ABAD = ::_id_ABAD;
    level._id_60B1 = scripts\mp\utility\game::_id_8980;

    if ( level._id_9BD4 || level._id_9BD9 )
        level._id_9FF8 = _id_079A::_id_60B2;

    level._id_4348 = 1;
    level._id_2658 = 0;
    level._id_434A = [];
    level._id_1988 = 0;
    level._id_29C4 = 0;
    level._id_1593 = 0;
    level._id_7C05 = 0;
    level._id_2637 = 0;
    scripts\mp\gametypes\obj_bombzone::_id_D493();
    game["dialog"]["gametype"] = "manhunt";

    if ( getdvarint( "#x33b8132c2bbd3f240" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "#x3863d66ab814c070" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_to_dd_promode" ) )
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";

    game["dialog"]["offense_obj"] = "";
    game["dialog"]["defense_obj"] = "";
    setomnvar( "ui_bomb_timer_endtime_a", 0 );
    setomnvar( "ui_bomb_timer_endtime_b", 0 );
    setomnvar( "ui_bomb_planted_a", 0 );
    setomnvar( "ui_bomb_planted_b", 0 );
    level._effect["vfx_smk_signal"] = loadfx( "vfx/_requests/mp_gameplay/vfx_smk_signal" );
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _id_0A66::_id_D627( "timelimit", 6 );
    _func_01D2( "scr_to_dd_waverespawndelay", 20 );
    _func_01D2( "scr_to_dd_waverespawndelay_alt", 20 );
    _func_01D2( "scr_to_dd_bombtimer", getmatchrulesdata( "bombData", "bombTimer" ) );
    _func_01D2( "scr_to_dd_planttime", getmatchrulesdata( "bombData", "plantTime" ) );
    _func_01D2( "scr_to_dd_defusetime", getmatchrulesdata( "bombData", "defuseTime" ) );
    _func_01D2( "scr_to_dd_silentPlant", getmatchrulesdata( "bombData", "silentPlant" ) );
    _func_01D2( "scr_to_dd_extratime", getmatchrulesdata( "demData", "extraTime" ) );
    _func_01D2( "scr_to_dd_overtimeLimit", getmatchrulesdata( "demData", "overtimeLimit" ) );
    _func_01D2( "scr_to_dd_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "to_dd", 0 );
    _func_01D2( "scr_to_dd_promode", 0 );
    _func_01D2( "scr_to_dd_defusetime", 5 );
    _func_01D2( "scr_to_dd_extraTime", 1 );
}

_id_AB6C()
{
    game["bomb_dropped_sound"] = "mp_war_objective_lost";
    game["bomb_recovered_sound"] = "mp_war_objective_taken";
}

_id_AB9A( var_0 )
{
    scripts\cp_mp\utility\game_utility::_id_6B0E();
    _id_D5A0();

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    game["attackers"] = "allies";
    game["defenders"] = "axis";
    level._id_FED2 = 1;
    level._id_F2A8 = 1;
    _func_01CE( "manual_change" );

    if ( scripts\mp\utility\game::_id_82B7() )
        game["dialog"]["defense_obj"] = "obj_destroy";

    scripts\mp\utility\game::_id_D610( game["attackers"], &"OBJECTIVES/DD_ATTACKER" );
    scripts\mp\utility\game::_id_D610( game["defenders"], &"OBJECTIVES/DD_DEFENDER" );

    if ( level._id_E427 )
    {
        scripts\mp\utility\game::_id_D60E( game["attackers"], &"OBJECTIVES/DD_ATTACKER" );
        scripts\mp\utility\game::_id_D60E( game["defenders"], &"OBJECTIVES/DD_DEFENDER" );
    }
    else
    {
        scripts\mp\utility\game::_id_D60E( game["attackers"], &"OBJECTIVES/DD_ATTACKER_SCORE" );
        scripts\mp\utility\game::_id_D60E( game["defenders"], &"OBJECTIVES/DD_DEFENDER_SCORE" );
    }

    if ( scripts\mp\utility\game::_id_82B7() )
    {
        scripts\mp\utility\game::_id_D609( game["attackers"], &"OBJECTIVES/DD_OVERTIME_HINT" );
        scripts\mp\utility\game::_id_D609( game["defenders"], &"OBJECTIVES/DD_OVERTIME_HINT" );
    }
    else
    {
        scripts\mp\utility\game::_id_D609( game["attackers"], &"OBJECTIVES/DD_ATTACKER_HINT" );
        scripts\mp\utility\game::_id_D609( game["defenders"], &"OBJECTIVES/DD_DEFENDER_HINT" );
    }

    thread _id_1080B();

    if ( !istrue( var_0 ) )
    {
        scripts\mp\gametypes\tac_ops::_id_3AC0();
        _id_0ED5();
    }

    var_1 = _id_0A66::_id_6E38( "winlimit" );
    var_2[0] = "dd";
    var_2[1] = "dd_bombzone";
    var_2[2] = "blocker";
    var_2[3] = "grind";
    var_2[4] = "dom";
    var_2[5] = "conf";
    _id_07AD::main( var_2 );
    level._id_ED20 = 1;
    var_3 = randomfloat( 1.0 );

    if ( var_3 < 0.5 )
        level._id_7C07 = "_a";
    else
        level._id_7C07 = "_b";

    var_4 = "veh_jackal_mp";
    var_5 = "veh8_mil_air_ahotel64_ks";
    level thread _id_106B3();
    _id_8135();
    thread _id_3F7B();
}

_id_3F7B()
{
    var_0 = getent( "to_dd_bridge_flag", "targetname" );

    if ( !isdefined( level._id_A8D5 ) )
        level._id_A8D5 = [];

    level._id_2BAA = level._id_A8D5.size;
    level._id_A8D5[level._id_2BAA] = var_0;
    var_1 = scripts\mp\gametypes\obj_dom::_id_D88B( level._id_A8D5[level._id_2BAA] );
    scripts\engine\utility::_id_46C3( 3.0, ::_id_46B9 );
    var_1._id_ABB8 = ::_id_2BA9;
    level._id_A8D5[level._id_2BAA] = var_1;
    level._id_5C1B = 10.0;
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
    level._id_A8D5[level._id_2BAA] _id_07AD::_id_D62D( "axis" );
    level._id_A8D5[level._id_2BAA] _id_07AD::_id_15B7( "enemy" );
    level._id_A8D5[level._id_2BAA] scripts\mp\gametypes\obj_dom::_id_FC61( "axis", 0 );
    level._id_A8D5[level._id_2BAA] _id_07AD::_id_D60F( level._id_7C30, level._id_7C44 );
}

_id_2BA9( var_0 )
{
    scripts\mp\gametypes\obj_dom::_id_4D2F( var_0 );

    if ( var_0.team == "allies" )
    {
        level._id_A8D5[level._id_2BAA]._id_ABB8 = scripts\mp\gametypes\obj_dom::_id_4D2F;
        level._id_A8D5[level._id_2BAA] _id_07AD::_id_D5B8( undefined );
        level._id_A8D5[level._id_2BAA] _id_07AD::_id_D8D5( "any" );
        level._id_A8D5[level._id_2BAA] _id_07AD::_id_15B7( "enemy" );
        _id_E67F();
    }
}

_id_E67F()
{
    level._id_AB2C = ::_id_AB2C;
    iprintlnbold( "Bridge Captured" );
    level._id_A8D5[level._id_2BAA] _id_07AD::_id_D5F1( 0 );
    level._id_A8D5[level._id_2BAA] _id_07AD::_id_4AB0();
    level._id_A8D5[level._id_2BAA]._id_0383 setscriptablepartstate( "flag", "off" );
    level._id_F2A8 = 0;
    _id_07F3::_id_D452( "to_dd", "allies" );
    thread _id_2654();
}

_id_106B3()
{
    wait 10;
    _id_0A4C::_id_BEB3( "dx_mpb_us1_phase1_enemya", "allies" );
    _id_0A4C::_id_BEB3( "dx_mpb_aq1_phase1_enemyb", "axis" );
    scripts\mp\gametypes\tac_ops::_id_ED11( 30 );
    _id_0A4C::_id_BEB3( "dx_mpb_us1_phase1_lesstimea", "allies" );
    _id_0A4C::_id_BEB3( "dx_mpb_aqcm_phase2_lesstime", "axis" );
}

_id_827A()
{
    var_0 = level._id_ED1B;
    var_0._id_F2A9 = [];
    var_0._id_F2A9["allies_start"] = _id_07EE::_id_6D30( "mp_todd_spawn_allies_start" );
    var_0._id_F2A9["axis_start"] = _id_07EE::_id_6D30( "mp_todd_spawn_axis_start" );
    _id_07EE::_id_110D( "allies", "mp_todd_spawn_allies" );
    var_0._id_F2A9["allies"] = _id_07EE::_id_6D30( "mp_todd_spawn_allies" );
    _id_07EE::_id_110D( "axis", "mp_todd_spawn_axis" );
    var_0._id_F2A9["axis"] = _id_07EE::_id_6D30( "mp_todd_spawn_axis" );
    _id_07EE::_id_110D( "allies_bridge", "mp_toddbridge_spawn_allies" );
    var_0._id_F2A9["allies_bridge"] = _id_07EE::_id_6D30( "mp_toddbridge_spawn_allies" );
    _id_07EE::_id_110D( "axis_bridge", "mp_toddbridge_spawn_axis" );
    var_0._id_F2A9["axis_bridge"] = _id_07EE::_id_6D30( "mp_toddbridge_spawn_axis" );
}

_id_6D31( var_0, var_1 )
{
    var_2 = _func_00C4( var_0.origin, var_1, 16000 );

    if ( var_2 < 0 )
        var_2 = distance( var_0.origin, var_1 );

    return var_2;
}

_id_6D2C()
{
    var_0 = level._id_ED1B;
    var_1 = self.pers["team"];

    if ( level._id_FED2 && !isdefined( self._id_ED15 ) )
        var_2 = _id_07EE::_id_6D2F( var_0._id_F2A9[var_1 + "_start"] );
    else if ( istrue( level._id_F2A8 ) )
    {
        var_3 = var_1 + "_bridge";
        var_4 = var_0._id_F2A9[var_3];
        var_4 = _id_07F3::_id_5A34( var_4 );
        var_2 = undefined;
    }
    else
    {
        var_4 = var_0._id_F2A9[var_1];
        var_4 = _id_07F3::_id_5A34( var_4 );
        var_2 = undefined;
    }

    return var_2;
}

_id_0ED5()
{
    _id_07EE::_id_D454( "TDM" );
    thread _id_FED8();
    level._id_6D2C = ::_id_6D2C;
}

_id_FED8()
{
    _id_07A8::_id_60A3( "prematch_done" );
    _id_07F3::_id_D452( "to_dd", "axis" );
    _id_07F3::_id_D452( "dirttown_allies_bridge", "allies" );
}

_id_10807()
{
    level endon( "dd_phase_ended" );
    level endon( "game_end" );
    scripts\mp\gametypes\tac_ops::_id_ED11( 45 );
    scripts\mp\gametypes\tac_ops::_id_EF90( &"MISC_MESSAGES_MP/TO_ALLY_DD_ESCAPE_1", &"MISC_MESSAGES_MP/TO_AXIS_DD_ESCAPE_1" );

    if ( level._id_7C07 == "_a" )
        level._id_5819 = scripts\engine\utility::_id_6D7C( "hostage_extraction_a", "targetname" )[0].origin;
    else
        level._id_5819 = scripts\engine\utility::_id_6D7C( "hostage_extraction_b", "targetname" )[0].origin;

    level._id_434B = spawn( "trigger_radius", level._id_5819, 0, 90, 128 );
    level._id_434B.angles = ( 0, 0, 0 );
    level._id_21A5 = _id_0A66::_id_507C( "bankCaptureTime", 0, 0, 10 );
    level._id_434B._id_FE8E = scripts\mp\gametypes\obj_grindzone::_id_D88B( 0, "allies", level._id_434B );
    level._id_434B.team = "allies";
    level._id_434B._id_AD9B = "allies";
    level._id_434B._id_10418 = "any";
    level._id_434B._id_FE8E scripts\mp\gametypes\to_hstg::_id_FC5F();
    level._id_434B._id_FE8E _id_07AD::_id_D8D5( "none" );
    level._id_434B._id_A96B = ( 0, 0, 16 );
    scripts\mp\gametypes\to_hstg::_id_99E3( level._id_434B );
    level._id_434B._id_96B8 = level._id_5819;

    if ( scripts\mp\utility\teams::_id_6DAC( "axis", "teamCount" ) )
    {
        level._id_F345 = scripts\engine\utility::_id_1BAE( scripts\mp\utility\teams::_id_6DAC( "axis", "players" ), ::_id_3AD2 );
        var_0 = level._id_F345[0] scripts\mp\gametypes\to_hstg::_id_E2E0( level._id_434B, 30 );
        level._id_434B thread scripts\mp\gametypes\to_hstg::_id_5828();
        var_0 thread _id_107E9();
    }
}

_id_3AD2( var_0, var_1 )
{
    return var_0._id_0369 >= var_1._id_0369;
}

_id_107E9()
{
    level endon( "dd_phase_ended" );
    scripts\mp\gametypes\tac_ops::_id_ED11( 15 );
    scripts\mp\gametypes\tac_ops::_id_EF90( &"MISC_MESSAGES_MP/TO_ALLY_DD_ESCAPE_2", &"MISC_MESSAGES_MP/TO_AXIS_DD_ESCAPE_2" );

    foreach ( var_1 in level._id_A8D5 )
        _id_C485( var_1._id_A8CE );

    foreach ( var_1 in level._id_A8D5 )
    {
        if ( isdefined( var_1._id_AAA2 ) )
            var_1 [[ var_1._id_AAA2 ]]();
    }

    level._id_F2AA._id_8514 = 0;
    level._id_F2AA thread _id_7C0B();
    scripts\mp\gametypes\tac_ops::_id_ED11( 1 );

    if ( isdefined( level._id_F2AA ) )
        _id_0A4B::_id_7BFF( level._id_F2AA );

    level._id_434B scripts\mp\gametypes\to_hstg::_id_386F();
    self notify( "extract_hostages" );
}

_id_7C0B()
{
    level endon( "dd_phase_ended" );
    level endon( "game_end" );
    self endon( "death" );
    self _meth_8057( level._id_5819, 20, "critical" );
    var_0 = _id_09D1::_id_28F6();
}

_id_1080B()
{
    level endon( "game_end" );
    _id_07A8::_id_60A3( "prematch_done" );
    level._id_FED2 = 0;
}

_id_AB91()
{
    if ( scripts\mp\utility\game::_id_82B7() || self.pers["team"] == game["attackers"] )
    {
        self setclientomnvar( "ui_carrying_bomb", 1 );
        self._id_896C = 0;
        self._id_87DD = 0;
        self._id_8769 = 1;
    }
    else
    {
        self._id_896C = 0;
        self._id_87DD = 0;
        self._id_8769 = 0;
    }

    if ( isdefined( self.pers["plants"] ) )
        _id_0A7B::_id_D543( self.pers["plants"] );
    else
        _id_0A7B::_id_D543( 0 );

    if ( isdefined( self.pers["defuses"] ) )
        _id_0A7B::_id_D544( self.pers["defuses"] );
    else
        _id_0A7B::_id_D544( 0 );

    level notify( "spawned_player" );
    var_0 = 0;

    if ( self.team == "allies" )
        var_0 = 1;
    else if ( self.team == "axis" )
        var_0 = 2;

    self setclientomnvar( "ui_tacops_team", var_0 );

    if ( !isagent( self ) )
        scripts\mp\playerlogic::_id_7DCD( self.team );

    _id_0A4D::_id_8E13();
}

_id_4349( var_0, var_1 )
{
    thread scripts\mp\gamelogic::_id_52D7( var_0, var_1 );
}

_id_AA90( var_0 )
{
    if ( level._id_2636 > 0 || level._id_260F )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_263D )
            _id_4349( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            _id_4349( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level._id_263D )
            return;

        level thread _id_4349( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread _id_4349( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::_id_AA76( var_0, var_1, var_2, var_3, var_4 );
    var_5 = var_0.team;

    if ( var_0._id_896C )
    {
        var_1 _id_0A7B::_id_7D93( "defends", 1 );
        var_1 _id_07D5::_id_E76D( "round", "defends", var_1.pers["defends"] );
    }
    else if ( var_0._id_87DD )
    {
        var_1 _id_0A7B::_id_7D93( "defends", 1 );
        var_1 _id_07D5::_id_E76D( "round", "defends", var_1.pers["defends"] );
    }

    scripts\mp\gametypes\obj_bombzone::_id_265F( var_1, var_0 );

    if ( !isagent( var_0 ) )
    {
        if ( !isdefined( var_0._id_EC30 ) )
            var_0 scripts\mp\playerlogic::_id_4533( var_0.team );
    }
}

_id_ABAD()
{
    foreach ( var_1 in level._id_A8D5 )
    {
        if ( isdefined( var_1._id_AAA2 ) )
            var_1 [[ var_1._id_AAA2 ]]();
    }

    if ( isdefined( level._id_AB39 ) )
    {
        game["attackers"] = "allies";
        game["defenders"] = "axis";
        [[ level._id_AB39 ]]( "axis" );
    }
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_B1C7 = _id_0A66::_id_507A( "planttime", 5, 0, 20 );
    level._id_4623 = _id_0A66::_id_507A( "defusetime", 5, 0, 20 );
    level._id_265C = _id_0A66::_id_507C( "bombtimer", 30, 1, 300 );
    level._id_434C = _id_0A66::_id_507A( "extraTime", 2, 0, 5 );
    level._id_AD5C = _id_0A66::_id_507A( "overtimeLimit", 1, 0, 5 );
    scripts\mp\utility\game::_id_D629( level._id_AD5C );
    level._id_DD41 = _id_0A66::_id_507C( "silentPlant", 0, 0, 1 );
}

_id_103A7( var_0 )
{
    var_1 = "";

    if ( var_0.size != 3 )
    {
        var_2 = 0;
        var_3 = 0;
        var_4 = 0;

        foreach ( var_6 in var_0 )
        {
            if ( issubstr( tolower( var_6._id_CD8C ), "a" ) )
            {
                var_2 = 1;
                continue;
            }

            if ( issubstr( tolower( var_6._id_CD8C ), "b" ) )
            {
                var_3 = 1;
                continue;
            }

            if ( issubstr( tolower( var_6._id_CD8C ), "c" ) )
                var_4 = 1;
        }

        if ( !var_2 )
            var_1 = var_1 + " A ";

        if ( !var_3 )
            var_1 = var_1 + " B ";

        if ( !var_4 )
            var_1 = var_1 + " C ";
    }

    if ( var_1 != "" )
        return;
}

_id_8135()
{
    level._id_263D = 0;
    level._id_260F = 0;
    level._id_2636 = 0;
    level._id_A2E4 = 1;
    level._id_A8D5 = [];
}

_id_2654()
{
    var_0 = getentarray( "dd_bombzone", "targetname" );

    if ( var_0.size == 0 )
        return;

    wait 0.5;
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = scripts\mp\gametypes\obj_bombzone::_id_D88B( var_3 );
        var_4._id_AA66 = ::_id_AA66;
        var_4._id_AAAF = ::_id_AAAF;
        var_4._id_ABB8 = ::_id_ABBF;
        var_4._id_AAA2 = ::_id_2667;
        level._id_A8D5[var_4._id_A8CE] = var_4;
    }
}

_id_AA66( var_0 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2664( var_0 );
}

_id_AAAF( var_0, var_1, var_2 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2669( var_0, var_1, var_2 );
}

_id_ABBF( var_0 )
{
    scripts\mp\gametypes\obj_bombzone::_id_266B( var_0 );
}

_id_C5F8()
{
    if ( scripts\mp\utility\game::_id_82B7() )
    {
        _id_07AD::_id_D62D( "neutral" );
        _id_07AD::_id_15B7( "any" );
        var_0 = "waypoint_target_b";
        var_1 = "waypoint_target_b";
    }
    else
    {
        _id_07AD::_id_15B7( "enemy" );
        var_0 = "waypoint_defend" + self._id_024D;
        var_1 = "waypoint_target" + self._id_024D;
    }

    self._id_7C71 = "bomb_zone";
    _id_07AD::_id_D8C7( level._id_B1C7 );
    _id_07AD::_id_D8C6( &"MP/PLANTING_EXPLOSIVE" );
    _id_07AD::_id_D8C5( &"MP/HOLD_TO_PLANT_EXPLOSIVES" );
    _id_07AD::_id_D60F( var_0, var_1 );
    _id_07AD::_id_D8D5( "any" );
    self._id_FEF0 = makeweapon( "briefcase_bomb_mp" );
    self._id_2636 = undefined;
}

_id_2638( var_0, var_1, var_2 )
{
    level._id_2658 = level._id_2658 - 1;

    if ( self._id_024D == "_a" )
        level._id_1988 = 0;
    else
        level._id_29C4 = 0;

    scripts\mp\gametypes\obj_bombzone::_id_D493();

    if ( level._id_609B )
        return;

    if ( var_1 == "explode" )
    {
        self._id_2636 = 1;
        _id_0A64::_id_E772( "enemy_ident", game["defenders"], 1 );
        _id_0A64::_id_E772( "target_ident", game["attackers"], 1 );

        foreach ( var_4 in level._id_A8D5 )
        {
            _id_C485( var_4._id_A8CE );

            if ( isdefined( var_4._id_AAA2 ) )
                var_4 [[ var_4._id_AAA2 ]]();
        }

        wait 2;
        _id_C6D6();

        if ( level._id_434C > 0 )
            level thread scripts\mp\hud_util::_id_EF8A( "callout_time_added", var_0 );

        waitframe();
        level._id_2637++;

        if ( level._id_2658 == 1 )
            level notify( "bombs_canceled" );

        _id_C6D6();
        level._id_2658 = level._id_2658 - 1;
        setomnvar( "ui_bomb_planted_a", 0 );
        setomnvar( "ui_bomb_planted_b", 0 );
        scripts\mp\gametypes\tac_ops::_id_57DA( 30000 );

        if ( isdefined( level._id_AB39 ) && level._id_2637 == 1 )
        {
            [[ level._id_AB39 ]]( "allies" );
            return;
        }
    }
    else
    {
        _id_C6D6();
        var_0 notify( "bomb_defused" + self._id_024D );
        self notify( "defused" );
        _id_C5F8();
    }
}

_id_C485( var_0 )
{
    var_1 = getent( "dd_bombzone_clip" + var_0, "targetname" );
    var_1 delete();
}

_id_C6D6()
{
    scripts\mp\gametypes\tac_ops::_id_C724();

    if ( level._id_2658 <= 0 )
        level._id_F217 = 0;
}

_id_2667()
{
    _id_07AD::_id_4AB0();
    _id_07AD::_id_15B7( "none" );
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
    level._id_7C3A = "waypoint_escort";
}

_id_D87B()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = self.angles;
    var_0 rotateyaw( -45, 0.05 );
    waitframe();
    var_1 = self.origin + ( 0, 0, 5 );
    var_2 = self.origin + anglestoforward( var_0.angles ) * 100 + ( 0, 0, 128 );
    var_3 = scripts\engine\trace::ray_trace( var_1, var_2, self, scripts\engine\trace::_id_3ED4( 1 ) );
    self.killcament = spawn( "script_model", var_3["position"] );
    self.killcament _meth_8374( "explosive" );
    var_0 delete();
}
