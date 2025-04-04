// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_07B3::init();
    _id_07B3::_id_D849();
    var_0[0] = scripts\mp\utility\game::getgametype();
    var_0[1] = "sd";
    var_0[2] = "bombzone";
    var_0[3] = "blocker";
    _id_07AD::main( var_0 );

    if ( isusingmatchrulesdata() )
    {
        level._id_81CB = ::_id_81CB;
        [[ level._id_81CB ]]();
        level thread scripts\mp\utility\game::_id_C2DD();
    }
    else
    {
        scripts\mp\utility\game::_id_C29C( scripts\mp\utility\game::getgametype(), 1, 0, 9 );
        scripts\mp\utility\game::_id_C2B3( scripts\mp\utility\game::getgametype(), 3.0 );
        scripts\mp\utility\game::_id_C29F( scripts\mp\utility\game::getgametype(), 1 );
        scripts\mp\utility\game::_id_C29B( scripts\mp\utility\game::getgametype(), 0 );
        scripts\mp\utility\game::_id_C2C2( scripts\mp\utility\game::getgametype(), 3 );
        scripts\mp\utility\game::_id_C270( scripts\mp\utility\game::getgametype(), 0 );
        scripts\mp\utility\game::_id_C24F( scripts\mp\utility\game::getgametype(), 0 );
    }

    var_1 = _id_0A66::_id_6E38( "timelimit" );
    _id_0A66::_id_C2BD( "addObjectiveTime", var_1 );
    _id_FC7A();
    level._id_A8C1 = 1;
    level.teambased = 1;
    level._id_A530 = 1;
    level._id_AB6C = ::_id_AB6C;
    level._id_AB9A = ::_id_AB9A;
    level._id_6D2C = ::_id_6D2C;
    level._id_9FD5 = ::_id_AB91;
    level._id_AB5D = ::_id_AB5D;
    level._id_ABAD = ::_id_ABAD;
    level._id_AB2C = ::_id_AB2C;
    level._id_AB2F = ::_id_AB2F;
    level._id_C643 = scripts\mp\gametypes\obj_bombzone::_id_C643;
    level._id_1596 = 0;
    game["dialog"]["offense_obj"] = "obj_destroy";
    game["dialog"]["defense_obj"] = "obj_defend";
    game["dialog"]["lead_lost"] = "null";
    game["dialog"]["lead_tied"] = "null";
    game["dialog"]["lead_taken"] = "null";
    game["dialog"]["lost_a"] = "lost_a";
    game["dialog"]["lost_b"] = "lost_b";
    game["dialog"]["lost_c"] = "lost_c";
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    var_0 = getmatchrulesdata( "assaultData", "roundLength" );
    _func_01D2( "scr_assault_timelimit", var_0 );
    scripts\mp\utility\game::_id_C2B3( "assault", var_0 );
    var_1 = getmatchrulesdata( "assaultData", "roundSwitch" );
    _func_01D2( "scr_assault_roundswitch", var_1 );
    scripts\mp\utility\game::_id_C29C( "assault", var_1, 0, 9 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    _func_01D2( "scr_assault_winlimit", var_2 );
    scripts\mp\utility\game::_id_C2C2( "assault", var_2 );
    _func_01D2( "scr_assault_bombtimer", getmatchrulesdata( "assaultData", "bombTimer" ) );
    _func_01D2( "scr_assault_planttime", getmatchrulesdata( "assaultData", "plantTime" ) );
    _func_01D2( "scr_assault_defusetime", getmatchrulesdata( "assaultData", "defuseTime" ) );
    _func_01D2( "scr_assault_multibomb", getmatchrulesdata( "assaultData", "multiBomb" ) );
    _func_01D2( "scr_assault_bombResetTimer", getmatchrulesdata( "assaultData", "bombResetTimer" ) );
    _func_01D2( "scr_assault_roundlimit", 0 );
    scripts\mp\utility\game::_id_C29B( "assault", 0 );
    _func_01D2( "scr_assault_scorelimit", 1 );
    scripts\mp\utility\game::_id_C29F( "assault", 1 );
    _func_01D2( "scr_assault_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "assault", 0 );
}

_id_AB6C()
{
    game["bomb_dropped_sound"] = "mp_war_objective_lost";
    game["bomb_recovered_sound"] = "mp_war_objective_taken";
}

_id_AB9A()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    _func_01CE( "manual_change" );
    level._effect["bomb_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["vehicle_explosion"] = loadfx( "vfx/core/expl/small_vehicle_explosion_new.vfx" );
    level._effect["building_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    scripts\mp\utility\game::_id_D610( game["attackers"], &"OBJECTIVES/SD_ATTACKER" );
    scripts\mp\utility\game::_id_D610( game["defenders"], &"OBJECTIVES/SD_DEFENDER" );

    if ( level._id_E427 )
    {
        scripts\mp\utility\game::_id_D60E( game["attackers"], &"OBJECTIVES/SD_ATTACKER" );
        scripts\mp\utility\game::_id_D60E( game["defenders"], &"OBJECTIVES/SD_DEFENDER" );
    }
    else
    {
        scripts\mp\utility\game::_id_D60E( game["attackers"], &"OBJECTIVES/SD_ATTACKER_SCORE" );
        scripts\mp\utility\game::_id_D60E( game["defenders"], &"OBJECTIVES/SD_DEFENDER_SCORE" );
    }

    scripts\mp\utility\game::_id_D609( game["attackers"], &"OBJECTIVES/SD_ATTACKER_HINT" );
    scripts\mp\utility\game::_id_D609( game["defenders"], &"OBJECTIVES/SD_DEFENDER_HINT" );
    _id_827A();
    _id_D6D5();
    thread _id_81CD();
}

_id_827A()
{
    level._id_E324 = ( 0, 0, 0 );
    level._id_E321 = ( 0, 0, 0 );
    _id_07EE::_id_1111( "mp_assault_spawn_attacker_start" );
    _id_07EE::_id_1111( "mp_assault_spawn_defender_start" );
    level._id_9A95 = _id_07EE::_id_5AC1( level._id_E324, level._id_E321 );
    setgameendtime( level._id_9A95 );
    level._id_1CC0 = [];
    _id_8136( "attacker" );
    _id_8136( "defender" );
    _id_07EE::_id_0EBC();
}

_id_8136( var_0 )
{
    level._id_1CC0[var_0] = [];
    var_1 = "mp_assault_spawn_" + var_0;
    var_2 = _id_07EE::_id_6D30( var_1 );

    foreach ( var_4 in var_2 )
    {
        var_5 = var_4._id_0375;

        if ( !isdefined( level._id_1CC0[var_0][var_5] ) )
            level._id_1CC0[var_0][var_5] = [];

        level._id_1CC0[var_0][var_5][level._id_1CC0[var_0][var_5].size] = var_4;
    }
}

_id_6D2C()
{
    var_0 = self.pers["team"];
    var_1 = "defender";

    if ( var_0 == game["attackers"] )
        var_1 = "attacker";

    if ( level._id_7E95 )
    {
        var_2 = _id_07EE::_id_6D30( "mp_assault_spawn_" + var_1 + "_start" );
        var_3 = _id_07EE::_id_6D2F( var_2 );
    }
    else
    {
        var_4 = level._id_411C._id_024D;
        var_5 = level._id_1CC0[var_1][var_4];
        var_3 = _id_07EE::_id_6D2E( var_5 );
    }

    return var_3;
}

_id_AB91()
{
    if ( _id_0A67::_id_885D( self ) )
    {
        self._id_896C = 0;
        self._id_87DD = 0;
        self._id_8769 = 0;
    }

    if ( level._id_A2E4 && self.pers["team"] == game["attackers"] )
        self setclientomnvar( "ui_carrying_bomb", 1 );
    else
        self setclientomnvar( "ui_carrying_bomb", 0 );

    _id_0A7B::_id_D543( 0 );

    if ( isdefined( self.pers["plants"] ) )
        _id_0A7B::_id_D543( self.pers["plants"] );

    level notify( "spawned_player" );
    _id_D894();
    var_0 = getdvarint( "#x36d4f984bd66ff5df" );
    self allowdodge( var_0 );
    self allowdodge( var_0 );
    self _meth_8468( var_0 );
}

_id_AB5D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    thread _id_34B9();
}

_id_34B9()
{
    waitframe();
    var_0 = 0;

    if ( !scripts\mp\utility\teams::_id_6DAC( game["attackers"], "aliveCount" ) )
    {
        level._id_E3DF[game["attackers"]]._id_158D = 1;
        var_0 = 1;
    }

    if ( !scripts\mp\utility\teams::_id_6DAC( game["defenders"], "aliveCount" ) )
    {
        level._id_E3DF[game["defenders"]]._id_158D = 1;
        var_0 = 1;
    }

    if ( var_0 )
        _id_07F1::_id_FD33();
}

_id_CF91( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isai( var_3 ) )
            var_3 setclientomnvar( "ui_objective_state", 0 );
    }

    level._id_5A83 = var_0;

    if ( var_1 == game["end_reason"]["target_destroyed"] || var_1 == game["end_reason"]["bomb_defused"] )
    {
        if ( !isdefined( level._id_5A82[var_0] ) || level._id_5A82[var_0] != level._id_411C._id_8D4C )
            _id_07A7::_id_5577();
    }

    thread scripts\mp\gamelogic::_id_52D7( var_0, var_1 );
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\mp\rank::_id_6CEE( "kill" );
    var_7 = var_0.team;

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
}

_id_ABAD()
{
    _id_CF91( game["defenders"], game["end_reason"]["time_limit_reached"] );

    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1._id_2642 ) )
        {
            var_1 scripts\cp_mp\utility\inventory_utility::_takeweapon( var_1._id_2642 );
            break;
        }
    }
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_B1C7 = _id_0A66::_id_507A( "planttime", 5, 0, 20 );
    level._id_4623 = _id_0A66::_id_507A( "defusetime", 5, 0, 20 );
    level._id_265C = _id_0A66::_id_507A( "bombtimer", 45, 1, 300 );
    level._id_A2E4 = _id_0A66::_id_507C( "multibomb", 0, 0, 1 );
    level._id_2651 = _id_0A66::_id_507C( "bombResetTimer", 60, 0, 180 );
}

_id_D6D5()
{
    if ( isusingmatchrulesdata() && scripts\mp\utility\game::_id_6B13( "defaultClasses", game["attackers"], 5, "class", "inUse" ) )
        level._id_CF92[game["attackers"]] = scripts\mp\utility\game::_id_6B14( game["attackers"], 5 );
}

_id_8981( var_0 )
{
    if ( isdefined( level._id_4114 ) )
        return self _meth_81EF( level._id_4114._id_047A );

    return 0;
}

_id_81CD()
{
    level._id_5BC1 = 1;
    var_0 = getentarray( "bombzone", "targetname" );
    level._id_A8D5 = var_0;
    level._id_411D = 0;
    level._id_411C = _id_D889( level._id_411D );
}

_id_D889( var_0 )
{
    var_1 = level._id_A8D5[var_0];
    var_2 = var_1._id_0375;

    if ( !isdefined( var_2 ) )
        var_2 = "bombzone";

    var_3 = undefined;

    switch ( var_2 )
    {
        case "bombzone":
            if ( isdefined( level._id_5BC1 ) )
            {
                scripts\mp\gametypes\obj_bombzone::_id_266E( "sd_bomb" );
                level._id_5BC1 = undefined;
            }
            else
                scripts\mp\gametypes\obj_bombzone::_id_11AC();

            var_3 = scripts\mp\gametypes\obj_bombzone::_id_D88B( var_0 );
            _id_0A64::_id_911F( "offense_obj", game["attackers"] );
            _id_0A64::_id_911F( "defense_obj", game["defenders"] );
            break;
        case "dompoint":
            var_3 = scripts\mp\gametypes\obj_dom::_id_D88B( level._id_A8D5[var_0] );
            break;
        case "payload":
            break;
        case "ctf":
            break;
    }

    return var_3;
}

_id_AB2F( var_0, var_1, var_2, var_3, var_4 )
{
    switch ( var_0 )
    {
        case "dompoint":
            _id_AAA5( var_1, var_2, var_3, var_4 );
            break;
        case "bombzone":
            _id_AA69( var_1, var_2, var_3, var_4 );
            break;
    }

    if ( var_3 == game["attackers"] )
    {
        level._id_411D++;

        if ( level._id_411D < level._id_A8D5.size )
        {
            var_5 = _id_0A66::_id_6E38( "addObjectiveTime" );
            _id_0A66::_id_D627( "timelimit", scripts\mp\utility\game::_id_6DC7() + var_5 );
            _id_C6D6();
            level._id_411C = _id_D889( level._id_411D );
        }
        else
        {
            setclientnamemode( 0 );
            wait 3;
            _id_CF91( game["attackers"], game["end_reason"]["target_destroyed"] );
        }
    }
}

_id_AAA5( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1.team;

    if ( var_3 == "neutral" )
    {
        var_5 = scripts\mp\utility\game::_id_6BC3( var_4 )[0];
        thread _id_0A77::_id_BCFE( var_4, var_5, undefined, undefined, "mp_dom_flag_captured", undefined, var_1 );
        _id_0A64::_id_E772( "secured" + self._id_024D, var_4, 1 );
        _id_0A64::_id_E772( "lost_" + self._id_024D, var_5, 1 );
    }
}

_id_AA69( var_0, var_1, var_2, var_3 )
{
    if ( var_2 == game["defenders"] )
    {
        _id_C6D6();
        thread scripts\mp\gametypes\obj_bombzone::_id_C681();
        level._id_411C = scripts\mp\gametypes\obj_bombzone::_id_D88B( level._id_411D );
    }
}

_id_C6D6()
{
    scripts\mp\gamelogic::resumetimer();
    level._id_F239 = gettime() - level._id_F23A;
    level._id_F217 = 0;
}

_id_D894()
{
    if ( isai( self ) )
        return;

    self notifyonplayercommand( "playerPing", "+breath_sprint" );
    thread _id_1081A();
}

_id_1081A()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "playerPing" );

        if ( scripts\mp\utility\player::isreallyalive( self ) && !scripts\mp\utility\player::_id_8AB5() )
        {
            if ( self adsbuttonpressed() )
            {
                _id_4E44();
                wait 0.5;
            }
        }

        wait 0.1;
    }
}

_id_4E44()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = self geteye();
    var_1 = var_0 + anglestoforward( self getplayerangles() ) * 2000;
    var_2 = scripts\engine\trace::ray_trace( var_0, var_1, self );
    var_3 = var_2["entity"];
    var_4 = "WAYPOINT";
    var_5 = ( 1, 1, 1 );

    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3.team ) && var_3.team != self.team )
        {
            var_5 = ( 1, 0, 0 );

            if ( isplayer( var_3 ) )
            {
                var_4 = "KILL";
                self notify( "enemy_sighted" );
            }
            else
                var_4 = "DESTROY";
        }
        else if ( isdefined( var_3._id_CD5C ) )
        {
            if ( var_3._id_CD5C == "bombzone" )
            {
                if ( self.team == game["attackers"] )
                {
                    var_4 = "ATTACK";
                    var_5 = ( 1, 1, 0 );
                }
                else
                {
                    var_4 = "DEFEND";
                    var_5 = ( 0, 0, 1 );
                }
            }
            else if ( var_3._id_CD5C == "sd" )
            {
                if ( self.team == game["attackers"] )
                {
                    var_4 = "OBJECTIVE";
                    var_5 = ( 1, 1, 0 );
                }
            }
        }
    }
}
