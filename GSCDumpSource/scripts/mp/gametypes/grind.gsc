// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_07B3::init();
    _id_07B3::_id_D849();
    var_0[0] = scripts\mp\utility\game::getgametype();
    var_0[1] = "dom";
    _id_07AD::main( var_0 );

    if ( isusingmatchrulesdata() )
    {
        level._id_81CB = ::_id_81CB;
        [[ level._id_81CB ]]();
        level thread scripts\mp\utility\game::_id_C2DD();
    }
    else
    {
        scripts\mp\utility\game::_id_C29C( scripts\mp\utility\game::getgametype(), 0, 0, 9 );
        scripts\mp\utility\game::_id_C2B3( scripts\mp\utility\game::getgametype(), 600 );
        scripts\mp\utility\game::_id_C29F( scripts\mp\utility\game::getgametype(), 85 );
        scripts\mp\utility\game::_id_C29B( scripts\mp\utility\game::getgametype(), 1 );
        scripts\mp\utility\game::_id_C2C2( scripts\mp\utility\game::getgametype(), 1 );
        scripts\mp\utility\game::_id_C270( scripts\mp\utility\game::getgametype(), 0 );
        scripts\mp\utility\game::_id_C24F( scripts\mp\utility\game::getgametype(), 0 );
    }

    _id_FC7A();
    level._id_4CCA = [];
    scripts\mp\gametypes\obj_grindzone::init();
    level.teambased = 1;
    level._id_AB9A = ::_id_AB9A;
    level._id_AB46 = ::_id_AB46;
    level._id_6D2C = ::_id_6D2C;
    level._id_AB2C = ::_id_AB2C;
    level._id_9FD5 = ::_id_AB91;
    level._id_9FD6 = ::_id_ABA0;
    level._id_3B4E["vanish"] = loadfx( "vfx/core/impacts/small_snowhit" );
    game["dialog"]["gametype"] = "gametype_grind";

    if ( getdvarint( "#x33b8132c2bbd3f240" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "#x3863d66ab814c070" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];

    game["dialog"]["boost"] = "boost_grind";
    game["dialog"]["offense_obj"] = "boost_grind";
    game["dialog"]["defense_obj"] = "boost_grind";
    game["dialog"]["grind_enable_a"] = "grind_enable_a";
    game["dialog"]["grind_enable_b"] = "grind_enable_b";
    game["dialog"]["grind_disable_a"] = "grind_disable_a";
    game["dialog"]["grind_disable_b"] = "grind_disable_b";
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _func_01D2( "scr_grind_bankTime", getmatchrulesdata( "grindData", "bankTime" ) );
    _func_01D2( "scr_grind_bankRate", getmatchrulesdata( "grindData", "bankRate" ) );
    _func_01D2( "scr_grind_bankCaptureTime", getmatchrulesdata( "grindData", "bankCaptureTime" ) );
    _func_01D2( "scr_grind_bankDisable", getmatchrulesdata( "grindData", "bankDisable" ) );
    _func_01D2( "scr_grind_bankDisableTags", getmatchrulesdata( "grindData", "bankDisableTags" ) );
    _func_01D2( "scr_grind_bankDisableTime", getmatchrulesdata( "grindData", "bankDisableTime" ) );
    _func_01D2( "scr_grind_megaBankLimit", getmatchrulesdata( "grindData", "megaBankLimit" ) );
    _func_01D2( "scr_grind_megaBankBonusKS", getmatchrulesdata( "grindData", "megaBankBonusKS" ) );
    _func_01D2( "scr_grind_bankBonus", getmatchrulesdata( "grindData", "megaBankBonus" ) );
    _func_01D2( "scr_grind_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "grind", 0 );
    _func_01D2( "scr_grind_promode", 0 );
}

_id_AB9A()
{
    _func_01CE( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    scripts\mp\utility\game::_id_D610( "allies", &"OBJECTIVES/WAR" );
    scripts\mp\utility\game::_id_D610( "axis", &"OBJECTIVES/WAR" );

    if ( level._id_E427 )
    {
        scripts\mp\utility\game::_id_D60E( "allies", &"OBJECTIVES/WAR" );
        scripts\mp\utility\game::_id_D60E( "axis", &"OBJECTIVES/WAR" );
    }
    else
    {
        scripts\mp\utility\game::_id_D60E( "allies", &"OBJECTIVES/WAR_SCORE" );
        scripts\mp\utility\game::_id_D60E( "axis", &"OBJECTIVES/WAR_SCORE" );
    }

    scripts\mp\utility\game::_id_D609( "allies", &"OBJECTIVES/WAR_HINT" );
    scripts\mp\utility\game::_id_D609( "axis", &"OBJECTIVES/WAR_HINT" );
    _id_827A();
    _id_4039();
    level._id_4CC1 = ::_id_4CC1;
    _id_D8BA();
    thread _id_4051();
    level thread _id_C520();
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_21B4 = _id_0A66::_id_507A( "bankTime", 2, 0, 10 );
    level._id_21B1 = _id_0A66::_id_507C( "bankRate", 1, 1, 10 );
    level._id_21A5 = _id_0A66::_id_507C( "bankCaptureTime", 0, 0, 10 );
    level._id_21A6 = _id_0A66::_id_507C( "bankDisable", 1, 0, 1 );
    level._id_21A7 = _id_0A66::_id_507C( "bankDisableTags", 0, 0, 50 );
    level._id_21A8 = _id_0A66::_id_507C( "bankDisableTime", 0, 0, 120 );
    level._id_9D21 = _id_0A66::_id_507C( "megaBankLimit", 5, 5, 15 );
    level._id_9D20 = _id_0A66::_id_507C( "megaBankBonusKS", 1, 0, 10 );
    level._id_9D1F = _id_0A66::_id_507C( "megaBankBonus", 150, 0, 750 );
    var_0 = _id_0A66::_id_6E38( "scorelimit" );

    if ( level._id_21A7 == 0 && var_0 > 0 )
        level._id_21A7 = int( var_0 );
}

_id_AB91()
{
    self setclientomnvar( "ui_match_status_hint_text", 34 );

    if ( isdefined( self._id_ED71 ) )
        self setclientomnvar( "ui_grind_tags", self._id_ED71 );
}

_id_ABA0( var_0 )
{
    self setclientomnvar( "ui_grind_tags", 0 );
    level thread _id_5047( var_0 );
}

_id_4039()
{
    level._id_4CC7 = [];

    for ( var_0 = 0; var_0 < 50; var_0++ )
    {
        var_1 = spawn( "script_model", ( 0, 0, 0 ) );
        var_1 setmodel( "military_dogtags_iw8" );
        var_1 _meth_82CA( "mp_dogtag_spin" );
        var_1 setscriptablepartstate( "visibility", "hide", 0 );
        var_1 _meth_85A2();
        var_2 = spawn( "trigger_radius", ( 0, 0, 0 ), 0, 32, 32 );
        var_2._id_045A = "trigger_dogtag";
        var_2 hide();
        var_3 = spawnstruct();
        var_3._id_048F = "useObject";
        var_3._id_411F = var_2.origin;
        var_3._id_54F3 = var_2 getentitynumber();
        var_3._id_90A1 = 0;
        var_3._id_1042E = var_1;
        var_3._id_A96B = ( 0, 0, 16 );
        var_3._id_047A = var_2;
        var_3._id_047A _meth_80DB();
        var_3._id_F634 = "proximity";
        var_3 _id_07AD::_id_15B7( "none" );
        level._id_4CC7[level._id_4CC7.size] = var_3;
    }
}

_id_6D93()
{
    var_0 = level._id_4CC7[0];
    var_1 = gettime();

    foreach ( var_3 in level._id_4CC7 )
    {
        if ( !isdefined( var_3._id_90A1 ) )
            continue;

        if ( var_3._id_839C == "none" )
        {
            var_0 = var_3;
            break;
        }

        if ( var_3._id_90A1 < var_1 )
        {
            var_1 = var_3._id_90A1;
            var_0 = var_3;
        }
    }

    var_0 notify( "reset" );
    var_0 _id_07AD::_id_81D0();
    var_0._id_90A1 = gettime();
    return var_0;
}

_id_E388( var_0 )
{
    var_1 = var_0.origin;
    var_2 = var_0.team;
    var_3 = var_1 + ( 0, 0, 14 );
    var_4 = 35;
    var_5 = var_0 getstance();

    if ( var_5 == "prone" )
        var_4 = 14;

    if ( var_5 == "crouch" )
        var_4 = 25;

    var_6 = var_1 + ( 0, 0, var_4 );
    var_7 = ( 0, randomfloat( 360 ), 0 );
    var_8 = anglestoforward( var_7 );
    var_9 = randomfloatrange( 30, 150 );
    var_10 = 0.5;
    var_11 = var_3 + var_9 * var_8;
    var_12 = physicsexplosionsphere( var_3, var_11 );
    var_13 = _id_6D93();
    var_13._id_411F = var_6;
    var_13._id_047A.origin = var_6;
    var_13._id_1042E.origin = var_6;
    var_13.team = var_0.team;
    var_13._id_1042E.team = var_13.team;
    var_13._id_839C = "any";
    var_13._id_047A show();
    var_13._id_047A linkto( var_13._id_1042E, "tag_origin" );
    playsoundatpos( var_3, "mp_grind_token_drop" );
    var_13 thread _id_ED69( var_2, var_6, var_12, var_10 );
    return var_13;
}

_id_ED69( var_0, var_1, var_2, var_3 )
{
    _id_07AD::_id_15B7( "any" );
    self._id_1042E thread _id_DCF4( self, scripts\mp\utility\game::_id_6BC3( var_0 )[0] );
    self._id_1042E _meth_85A2();
    var_4 = getdvarint( "#x3f7e9b59e29bb9d7e" );
    var_5 = distance( var_1, var_2 );
    var_6 = var_2 - var_1;
    var_7 = 0.5 * var_4 * _func_0214( var_3 ) * -1;
    var_8 = ( var_6[0] / var_3, var_6[1] / var_3, ( var_6[2] - var_7 ) / var_3 );
    self._id_1042E _meth_8237( var_8, var_3 );
}

_id_DCF4( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    self setscriptablepartstate( "visibility", "show", 0 );
}

_id_A135( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "deleted" );
    var_0 endon( "reset" );

    for (;;)
    {
        var_0._id_047A waittill( "trigger", var_1 );

        if ( !scripts\mp\utility\player::isreallyalive( var_1 ) )
            continue;

        if ( var_1 scripts\mp\utility\player::_id_8AB5() || isdefined( var_1._id_E304 ) )
            continue;

        if ( isdefined( var_1.classname ) && var_1.classname == "script_vehicle" )
            continue;

        if ( isagent( var_1 ) && isdefined( var_1.owner ) )
            var_1 = var_1.owner;

        var_0._id_1042E setscriptablepartstate( "visibility", "hide", 0 );
        var_0._id_047A hide();
        var_0._id_411F = ( 0, 0, 1000 );
        var_0._id_047A.origin = ( 0, 0, 1000 );
        var_0._id_1042E.origin = ( 0, 0, 1000 );
        var_0 _id_07AD::_id_15B7( "none" );
        var_1 _id_B792( var_1._id_ED71 + 1 );
        var_1 thread _id_0A76::_id_6FE6( "tag_collected" );
        var_1 playsound( "mp_grind_token_pickup" );

        if ( isdefined( level._id_EB96 ) && level._id_EB96 )
        {
            if ( isdefined( var_1._id_3E37 ) && var_1._id_3E37 )
                var_1 _id_0798::_id_D4E1( "kill" );
            else
                var_1 _id_0798::_id_AA7E( undefined, var_1 );
        }

        break;
    }
}

_id_AB46( var_0 )
{
    var_0._id_89FD = 0;
    var_0 thread _id_A109();
}

_id_B792( var_0 )
{
    self._id_ED71 = var_0;
    self._id_01DB = var_0;

    if ( var_0 > 999 )
        var_0 = 999;

    self setclientomnvar( "ui_grind_tags", var_0 );
}

_id_A109()
{
    self endon( "disconnect" );

    for (;;)
    {
        scripts\engine\utility::waittill_any_2( "joined_team", "joined_spectators" );
        _id_B792( 0 );
    }
}

_id_78E7( var_0 )
{
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0.alpha = 0;
}

_id_4051()
{
    var_0 = getentarray( "grind_location", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = scripts\mp\gametypes\obj_grindzone::_id_D88B( var_2, 1, 1 );
        var_3 thread _id_CA71();
        level._id_A8D5[var_3._id_A8CE] = var_3;
    }

    if ( level.mapname == "mp_deadzone" )
    {
        var_5 = spawnstruct();
        var_5.origin = ( 1416, 1368, 300 );
        var_5.angles = ( 0, 0, 0 );
        var_5._id_CD8C = "b";
        var_3 = scripts\mp\gametypes\obj_grindzone::_id_D88B( var_5, 1, 1 );
        var_3 thread _id_CA71();
        level._id_A8D5[var_3._id_A8CE] = var_3;
    }

    if ( !_id_07A8::_id_609F( "prematch_done" ) )
        level scripts\engine\utility::waittill_any_2( "prematch_done", "start_mode_setup" );

    foreach ( var_3 in level._id_A8D5 )
    {
        var_7 = scripts\mp\gametypes\obj_grindzone::_id_6CCE( var_3._id_A8CE );
        var_3 _id_07AD::_id_C56B( 1, 1, var_7 );
        var_3 _id_07AD::_id_D8D5( "any" );
        var_3 scripts\mp\gametypes\obj_grindzone::_id_D608();
        var_3 scripts\mp\gametypes\obj_grindzone::_id_D5FB();
    }
}

_id_88BF( var_0, var_1 )
{
    if ( scripts\mp\utility\player::isreallyalive( var_0 ) && var_0 _meth_81EF( var_1._id_047A ) && var_1._id_AD9B == var_0.team )
        return 1;

    return 0;
}

_id_CA71()
{
    level endon( "game_ended" );
    self endon( "stop_trigger" + self._id_A8CE );

    for (;;)
    {
        self._id_047A waittill( "trigger", var_0 );

        if ( self._id_4A67 )
            continue;

        if ( self._id_E578 )
            continue;

        if ( isagent( var_0 ) )
            continue;

        if ( !isplayer( var_0 ) )
            continue;

        if ( var_0._id_89FD )
            continue;

        var_0._id_89FD = 1;
        level thread _id_BD6E( var_0, self );
    }
}

_id_C520()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_1._id_ED71 ) )
            continue;

        var_1._id_ED71 = 0;
    }
}

_id_BD6E( var_0, var_1 )
{
    while ( var_0._id_ED71 && _id_88BF( var_0, var_1 ) && !var_1._id_E578 && !var_1._id_4A67 )
    {
        if ( var_0._id_ED71 >= level._id_9D21 )
        {
            var_0 playsoundtoplayer( "mp_grind_token_banked_large", var_0 );
            _id_CBE7( var_0, level._id_9D21, var_1 );
            var_2 = scripts\mp\rank::_id_6CEE( "tag_score" );
            var_2 = var_2 * level._id_9D21;

            if ( !var_0 scripts\mp\utility\perk::_hasperk( "specialty_killstreak_to_scorestreak" ) )
                var_0 scripts\mp\killstreaks\killstreaks::_id_6FD8( "capture", level._id_9D20 );

            var_0 thread _id_0A76::_id_6FE6( "mega_bank", undefined, var_2 + level._id_9D1F );
            var_0 _id_0A7B::_id_7D93( "tagsMegaBanked", 1 );
        }
        else
        {
            var_0 playsoundtoplayer( "mp_grind_token_banked", var_0 );
            var_3 = level._id_21B1;

            if ( var_3 > var_0._id_ED71 )
                var_3 = var_0._id_ED71;

            _id_CBE7( var_0, var_3, var_1 );

            for ( var_4 = 0; var_4 < var_3; var_4++ )
                var_0 thread _id_0A76::_id_6FE6( "tag_score" );
        }

        if ( isdefined( level._id_EB96 ) && level._id_EB96 && isdefined( var_0._id_3E37 ) && var_0._id_3E37 )
            var_0 _id_0798::_id_D4E1( "kill" );

        wait( level._id_21B4 );
    }

    var_1 scripts\mp\gametypes\obj_grindzone::_id_D5FC();
    var_0._id_89FD = 0;
}

_id_CBE7( var_0, var_1, var_2 )
{
    var_0 _id_B792( var_0._id_ED71 - var_1 );
    scripts\mp\gamescore::_id_6FE4( var_0.team, var_1, 0 );
    var_0 _id_0A7B::_id_7D93( "confirmed", var_1 );
    var_0 _id_07D5::_id_E76D( "round", "confirmed", var_0.pers["confirmed"] );
    var_0 _id_0A7B::_id_D543( var_0.pers["confirmed"] );

    if ( level._id_21A6 )
    {
        var_2._id_ED72 = var_2._id_ED72 + var_1;

        if ( var_2._id_ED72 >= level._id_21A7 )
        {
            var_2 _id_07AD::_id_15B7( "none" );
            var_2 thread _id_1086D();
            var_2._id_4A67 = 1;
            var_2._id_0383 setscriptablepartstate( "flag", "off" );
            var_2._id_0383 setscriptablepartstate( "pulse", "off" );

            if ( isdefined( var_2._id_A8CE ) )
            {
                foreach ( var_4 in level._id_EF86 )
                    _id_0A64::_id_E772( "grind_disable_" + var_2._id_A8CE, var_4 );
            }

            if ( level._id_21A8 == 0 )
                return;

            var_2 thread _id_10865();
            return;
        }
    }
}

_id_1086D()
{
    foreach ( var_1 in level.players )
        _id_07D0::_id_A8BC( self._id_A8F5, var_1 );

    waitframe();
    _id_07AD::_id_D8D5( "none" );
}

_id_10865()
{
    level endon( "game_ended" );
    wait( level._id_21A8 );
    self._id_4A67 = 0;
    self._id_0383 setscriptablepartstate( "flag", "idle" );
    _id_07AD::_id_15B7( "any" );
    _id_07AD::_id_D8D5( "any" );

    if ( isdefined( self._id_A8CE ) )
    {
        foreach ( var_1 in level._id_EF86 )
            _id_0A64::_id_E772( "grind_enable_" + self._id_A8CE, var_1 );
    }
}

_id_827A()
{
    _id_07EE::_id_D454( "Default", "Crit_Frontline" );
    level._id_E324 = ( 0, 0, 0 );
    level._id_E321 = ( 0, 0, 0 );
    _id_07EE::_id_1111( "mp_tdm_spawn_allies_start" );
    _id_07EE::_id_1111( "mp_tdm_spawn_axis_start" );
    _id_07EE::_id_110D( game["attackers"], "mp_tdm_spawn_allies_start" );
    _id_07EE::_id_110D( game["defenders"], "mp_tdm_spawn_axis_start" );
    var_0 = _id_07EE::_id_6D30( "mp_tdm_spawn_allies_start" );
    var_1 = _id_07EE::_id_6D30( "mp_tdm_spawn_axis_start" );
    _id_07EE::_id_C2AB( "start_attackers", var_0 );
    _id_07EE::_id_C2AB( "start_defenders", var_1 );
    _id_07EE::_id_110D( "allies", "mp_tdm_spawn" );
    _id_07EE::_id_110D( "axis", "mp_tdm_spawn" );
    _id_07EE::_id_110D( "allies", "mp_tdm_spawn_secondary", 1, 1 );
    _id_07EE::_id_110D( "axis", "mp_tdm_spawn_secondary", 1, 1 );
    var_2 = _id_07EE::_id_6D30( "mp_tdm_spawn" );
    var_3 = _id_07EE::_id_6D30( "mp_tdm_spawn_secondary" );
    _id_07EE::_id_C2AB( "normal", var_2 );
    _id_07EE::_id_C2AB( "fallback", var_3 );
    level._id_9A95 = _id_07EE::_id_5AC1( level._id_E324, level._id_E321 );
    setgameendtime( level._id_9A95 );
    _id_07EE::_id_0EBC();
}

_id_6D2C()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = scripts\mp\utility\game::_id_6BC3( var_0 )[0];

    if ( _id_07EE::_id_DC03() )
    {
        var_1 = _id_07EE::_id_6D30( "mp_tdm_spawn_" + var_0 + "_start" );
        var_2 = _id_07EE::_id_6D2F( var_1 );
    }
    else
        var_2 = _id_07EE::_id_6D2C( self, var_0, "normal", "fallback" );

    return var_2;
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    scripts\mp\gametypes\common::_id_AA76( var_0, var_1, var_2, var_3, var_4, var_5 );
    level thread _id_5047( var_0, var_1 );
}

_id_5047( var_0, var_1 )
{
    if ( isagent( var_0 ) )
        return;

    if ( var_0._id_ED71 > 49 )
        var_2 = 49;
    else if ( var_0._id_ED71 > 0 )
        var_2 = var_0._id_ED71;
    else
        var_2 = 0;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = _id_E388( var_0 );
        var_4.team = var_0.team;
        var_4._id_103C0 = var_0;
        var_4.attacker = var_1;
        level notify( "new_tag_spawned", var_4 );
        level thread _id_A135( var_4 );
    }

    var_5 = var_0._id_ED71 - var_2;
    var_5 = int( max( 0, var_5 ) );
    var_0 _id_B792( var_5 );
}

_id_4CC1( var_0 )
{
    if ( isplayer( var_0 ) )
        var_0 _id_0A7B::_id_D544( var_0.pers["denied"] );
}

_id_D8BA()
{
    scripts\mp\gamelogic::_id_D8DA( "waypoint_bank_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_BANK_CAPS", "icon_waypoint_dom_a", 0 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_bank_b", 0, "neutral", "MP_INGAME_ONLY/OBJ_BANK_CAPS", "icon_waypoint_dom_b", 0 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_scoring_foe_a", 2, "enemy", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_a", 1 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_scoring_foe_b", 2, "enemy", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_b", 1 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_scoring_friend_a", 2, "friendly", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_a", 1 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_scoring_friend_b", 2, "friendly", "MP_INGAME_ONLY/OBJ_SCORING_CAPS", "icon_waypoint_dom_b", 1 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_a", 1 );
    scripts\mp\gamelogic::_id_D8DA( "waypoint_contested_b", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_b", 1 );
}

_id_C4FF()
{
    self endon( "game_ended" );

    for (;;)
    {
        if ( getdvar( "scr_devRemoveDomFlag", "" ) != "" )
        {
            var_0 = getdvar( "scr_devRemoveDomFlag", "" );

            foreach ( var_2 in level._id_A8D5 )
            {
                if ( isdefined( var_2._id_A8CE ) && var_2._id_A8CE == var_0 )
                {
                    var_2 notify( "stop_trigger" + var_2._id_A8CE );
                    var_2 _id_07AD::_id_15B7( "none" );
                    var_2._id_047A = undefined;
                    var_2 notify( "deleted" );
                    var_2._id_10418 = "none";
                    var_2 _id_07AD::_id_D60F( undefined, undefined );
                    var_3 = [];

                    foreach ( var_5 in level._id_A8D5 )
                    {
                        if ( var_5._id_A8CE != var_0 )
                            var_3[var_5._id_A8CE] = var_5;
                    }

                    level._id_A8D5 = var_3;
                    break;
                }
            }

            _func_01D2( "scr_devRemoveDomFlag", "" );
        }

        wait 1;
    }
}

_id_B167()
{
    self endon( "game_ended" );

    for (;;)
    {
        if ( getdvar( "scr_devPlaceDomFlag", "" ) != "" )
        {
            var_0 = getdvar( "scr_devPlaceDomFlag", "" );
            var_1 = undefined;
            var_2 = getentarray( "grind_location", "targetname" );

            foreach ( var_4 in var_2 )
            {
                if ( "_" + var_4._id_CD8C == var_0 )
                    var_1 = var_4;
            }

            var_1.origin = level.players[0].origin;
            var_1._id_AD9B = "neutral";
            var_6 = var_1.origin + ( 0, 0, 32 );
            var_7 = var_1.origin + ( 0, 0, -32 );
            var_8 = scripts\engine\trace::ray_trace( var_6, var_7, undefined, scripts\engine\trace::_id_3ED4( 1 ) );
            var_1.origin = var_8["position"];
            var_1._id_FB2C = vectortoangles( var_8["normal"] );
            var_1._id_01C1 = anglestoforward( var_1._id_FB2C );
            var_1._id_034F = anglestoright( var_1._id_FB2C );
            var_9[0] = spawn( "script_model", var_1.origin );
            var_9[0].angles = var_1.angles;
            var_10 = spawn( "trigger_radius", var_1.origin, 0, 90, 128 );
            var_10._id_CD8C = var_1._id_CD8C;
            var_1 = var_10;
            var_11 = _id_07AD::_id_404C( "neutral", var_1, var_9, ( 0, 0, 100 ) );

            if ( isdefined( var_1._id_A8CE ) )
                var_11._id_A8CE = var_1._id_A8CE;
            else
                var_11._id_A8CE = var_11 _id_07AD::_id_6AD2();

            if ( isdefined( var_1._id_7C58 ) )
                var_11._id_7C58 = var_1._id_7C58;
            else
                var_11._id_7C58 = var_11 _id_07AD::_id_6AD2();

            var_11 thread _id_CA71();
            var_11 _id_07AD::_id_15B7( "enemy" );
            var_11 _id_07AD::_id_D8C7( level._id_21A5 );
            var_11 _id_07AD::_id_D60F( "waypoint_defend", "waypoint_bank" );
            var_11 _id_07AD::_id_D8D5( "any" );
            var_11 _id_07AD::_id_3144( 1 );
            var_11._id_ABB8 = scripts\mp\gametypes\obj_grindzone::_id_110D6;
            var_11._id_AA66 = scripts\mp\gametypes\obj_grindzone::_id_110D7;
            var_11._id_ABB5 = scripts\mp\gametypes\obj_grindzone::_id_110D4;
            var_11._id_AA7A = scripts\mp\gametypes\obj_grindzone::_id_110D0;
            var_11._id_ABB4 = scripts\mp\gametypes\obj_grindzone::_id_110D3;
            var_11._id_37CF = level._id_21A5 * 1000;
            var_6 = var_11._id_1042E[0].origin + ( 0, 0, 32 );
            var_7 = var_11._id_1042E[0].origin + ( 0, 0, -32 );
            var_12 = scripts\engine\trace::_id_3EC3( 1, 1, 1, 1, 0, 1, 1 );
            var_13 = [];
            var_8 = scripts\engine\trace::ray_trace( var_6, var_7, var_13, var_12 );
            var_11._id_228F = var_8["position"];
            var_14 = vectortoangles( var_8["normal"] );
            var_14 = -1 * var_14;
            var_11._id_228E = anglestoforward( var_14 );
            var_11 scripts\mp\gametypes\obj_grindzone::_id_D5FB();
            level._id_A8D5[var_11._id_A8CE] = var_11;
            _func_01D2( "scr_devPlaceDomFlag", "" );
        }

        wait 1;
    }
}
