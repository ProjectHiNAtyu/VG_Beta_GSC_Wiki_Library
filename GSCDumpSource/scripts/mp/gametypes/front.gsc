// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "#x32ea5e908954bfea7" ) == "mp_background" )
        return;

    _id_07B3::init();
    _id_07B3::_id_D849();
    var_0[0] = scripts\mp\utility\game::getgametype();
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
        scripts\mp\utility\game::_id_C29F( scripts\mp\utility\game::getgametype(), 100 );
        scripts\mp\utility\game::_id_C29B( scripts\mp\utility\game::getgametype(), 2 );
        scripts\mp\utility\game::_id_C2C2( scripts\mp\utility\game::getgametype(), 0 );
        scripts\mp\utility\game::_id_C270( scripts\mp\utility\game::getgametype(), 0 );
        scripts\mp\utility\game::_id_C24F( scripts\mp\utility\game::getgametype(), 0 );
    }

    _id_FC7A();
    level.teambased = 1;
    level._id_AB9A = ::_id_AB9A;
    level._id_AB46 = ::_id_AB46;
    level._id_6D2C = ::_id_6D2C;
    level._id_AB2C = ::_id_AB2C;
    level._id_9FD5 = ::_id_AB91;
    game["dialog"]["gametype"] = "frontline";

    if ( getdvarint( "#x33b8132c2bbd3f240" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "#x3863d66ab814c070" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + scripts\mp\utility\game::getgametype() + "_promode" ) )
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";

    game["strings"]["overtime_hint"] = &"MP/FIRST_BLOOD";
    thread _id_E3AB();
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _func_01D2( "scr_front_enemyBaseKillReveal", getmatchrulesdata( "frontData", "enemyBaseKillReveal" ) );
    _func_01D2( "scr_front_friendlyBaseScore", getmatchrulesdata( "frontData", "friendlyBaseScore" ) );
    _func_01D2( "scr_front_midfieldScore", getmatchrulesdata( "frontData", "midfieldScore" ) );
    _func_01D2( "scr_front_enemyBaseScore", getmatchrulesdata( "frontData", "enemyBaseScore" ) );
    _func_01D2( "scr_front_promode", 0 );
}

_id_AB9A()
{
    _func_01CE( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    foreach ( var_3 in level._id_EF86 )
    {
        scripts\mp\utility\game::_id_D610( var_3, &"OBJECTIVES/FRONT" );

        if ( level._id_E427 )
            scripts\mp\utility\game::_id_D60E( var_3, &"OBJECTIVES/FRONT" );
        else
            scripts\mp\utility\game::_id_D60E( var_3, &"OBJECTIVES/FRONT_SCORE" );

        scripts\mp\utility\game::_id_D609( var_3, &"OBJECTIVES/FRONT_HINT" );
    }

    level._id_7C51 = "waypoint_capture_kill";
    level._id_7C50 = "waypoint_capture_kill";
    _id_827A();
    _id_227F();
    thread _id_D842();
    thread _id_D841();
    level._id_4A61 = 1;
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_53E6 = _id_0A66::_id_507A( "enemyBaseKillReveal", 5, 0, 60 );
    level._id_5F81 = _id_0A66::_id_507A( "friendlyBaseScore", 1, 0, 25 );
    level._id_9E73 = _id_0A66::_id_507A( "midfieldScore", 2, 0, 25 );
    level._id_53E8 = _id_0A66::_id_507A( "enemyBaseScore", 1, 0, 25 );
}

_id_827A()
{
    level._id_E324 = ( 0, 0, 0 );
    level._id_E321 = ( 0, 0, 0 );
    _id_07EE::_id_D454( "Default", "Crit_Default" );
    _id_07EE::_id_110D( "allies", "mp_front_spawn_allies" );
    _id_07EE::_id_110D( "axis", "mp_front_spawn_axis" );
    level._id_5FC2 = [];
    level._id_5FC2["allies"] = "allies";
    level._id_5FC2["axis"] = "axis";
    _id_07EE::_id_C2AB( "allies", "mp_front_spawn_allies" );
    _id_07EE::_id_C2AB( "axis", "mp_front_spawn_axis" );
    level._id_9A95 = _id_07EE::_id_5AC1( level._id_E324, level._id_E321 );
    setgameendtime( level._id_9A95 );
    _id_07EE::_id_0EBC();
}

_id_AB91()
{
    if ( isplayer( self ) )
    {
        self._id_7DEB = 0;
        self._id_7E91 = 0;
        self._id_ACF1 = 0;

        if ( isdefined( self._id_ACD2 ) )
            scripts\mp\utility\outline::outlinedisable( self._id_ACD2, self );

        self._id_FE9C = 0;
        self._id_ACD2 = undefined;
        thread _id_5F83();
        thread _id_53EA();

        foreach ( var_1 in level._id_110E7 )
            var_1 _id_DC86( self );
    }
}

_id_6D2C()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = scripts\mp\utility\game::_id_6BC3( var_0 )[0];

    var_1 = _id_07EE::_id_6D2C( self, var_0, level._id_5FC2[var_0] );
    return var_1;
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    scripts\mp\gametypes\common::_id_AA76( var_0, var_1, var_2, var_3, var_4, var_5 );
    var_6 = 0;

    if ( var_0._id_7E91 || var_1._id_7DEB )
    {
        var_1 thread _id_0A76::_id_6FE6( "enemy_base_kill", var_4 );
        var_6 = level._id_53E8;
    }
    else if ( var_1._id_7E91 || var_0._id_7DEB )
    {
        var_1 thread _id_0A76::_id_6FE6( "friendly_base_kill", var_4 );
        var_6 = level._id_5F81;
    }
    else
    {
        var_1 thread _id_0A76::_id_6FE6( "midfield_kill", var_4 );
        var_6 = level._id_9E73;
    }

    var_7 = game["teamScores"][var_1.pers["team"]] + var_6;
    var_8 = var_7 >= level._id_C93B;

    if ( var_8 && level._id_C93B != 0 )
        var_6 = level._id_C93B - game["teamScores"][var_1.pers["team"]];

    if ( var_6 > 0 )
    {
        scripts\mp\gamescore::_id_6FE4( var_1.pers["team"], var_6, 0 );
        var_1 thread scripts\mp\rank::_id_CBF3( "teamscore_notify_" + var_6 );
    }
}

_id_53E6()
{
    level endon( "game_ended" );
    self endon( "death" );
    self notify( "EnemyBaseKillReveal" );
    self endon( "EnemyBaseKillReveal" );

    if ( isdefined( self._id_2299 ) )
        scripts\mp\utility\outline::outlinedisable( self._id_2299, self );

    self._id_2299 = scripts\mp\utility\outline::_id_ACBF( self, scripts\mp\utility\game::_id_6BC3( self.team )[0], "outline_nodepth_orange", "perk" );

    if ( !isbot( self ) )
        scripts\mp\utility\outline::_id_0C05( "outline_nodepth_orange", 0 );

    self _meth_84C6( &"MP/FRONT_REVEALED" );
    wait( level._id_53E6 );
    scripts\mp\utility\outline::outlinedisable( self._id_2299, self );
    scripts\mp\utility\outline::_id_0C04();
    self sethudtutorialmessage( 0 );
}

_id_D842()
{
    level._id_110E7 = [];

    if ( game["switchedsides"] )
    {
        level._id_14F1 = getentarray( "frontline_zone_allies", "targetname" );

        foreach ( var_1 in level._id_14F1 )
        {
            var_1.team = "axis";
            var_1 thread _id_5F83();
            var_1 thread _id_53EA();
            var_1 thread _id_53E7();
        }

        thread _id_D8B5( level._id_14F1[0] );
        level._id_110E7[level._id_110E7.size] = level._id_14F1[0];
        level._id_1FC9 = getentarray( "frontline_zone_axis", "targetname" );

        if ( level.mapname == "mp_junk" )
        {
            var_3 = spawn( "trigger_radius", ( -1410, -2080, 240 ), 0, 1000, 600 );
            level._id_1FC9[level._id_1FC9.size] = var_3;
        }

        foreach ( var_1 in level._id_1FC9 )
        {
            var_1.team = "allies";
            var_1 thread _id_5F83();
            var_1 thread _id_53EA();
            var_1 thread _id_53E7();
        }

        thread _id_D8B5( level._id_1FC9[0] );
        level._id_110E7[level._id_110E7.size] = level._id_1FC9[0];
    }
    else
    {
        level._id_14F1 = getentarray( "frontline_zone_allies", "targetname" );

        foreach ( var_1 in level._id_14F1 )
        {
            var_1.team = "allies";
            var_1 thread _id_5F83();
            var_1 thread _id_53EA();
            var_1 thread _id_53E7();
        }

        thread _id_D8B5( level._id_14F1[0] );
        level._id_110E7[level._id_110E7.size] = level._id_14F1[0];
        level._id_1FC9 = getentarray( "frontline_zone_axis", "targetname" );

        if ( level.mapname == "mp_junk" )
        {
            var_3 = spawn( "trigger_radius", ( -1410, -2080, 240 ), 0, 1000, 600 );
            level._id_1FC9[level._id_1FC9.size] = var_3;
        }

        foreach ( var_1 in level._id_1FC9 )
        {
            var_1.team = "axis";
            var_1 thread _id_5F83();
            var_1 thread _id_53EA();
            var_1 thread _id_53E7();
        }

        thread _id_D8B5( level._id_1FC9[0] );
        level._id_110E7[level._id_110E7.size] = level._id_1FC9[0];
    }
}

_id_D8B5( var_0 )
{
    var_1 = [];
    var_1[0] = var_0;

    if ( isdefined( var_0.target ) )
    {
        var_2 = getentarray( var_0.target, "targetname" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_1[var_1.size] = var_2[var_3];
    }

    var_1 = _id_9AA9( var_1, var_0.target );
    var_0._id_1042E = var_1;
}

_id_9AA9( var_0, var_1 )
{
    if ( level.mapname == "mp_parkour" && var_1 == "front_vis_axis" )
    {
        var_2 = spawn( "script_origin", ( -1088, -1504, 136 ) );
        var_2.angles = ( 0, 180, 0 );
        var_2._id_045A = var_1;
        var_0[var_0.size] = var_2;
        var_3 = spawn( "script_origin", ( -1088, -1440, 136 ) );
        var_3.angles = ( 0, 180, 0 );
        var_2._id_045A = var_1;
        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_5F83()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isplayer( var_0 ) )
            continue;

        if ( var_0.team != self.team )
            continue;

        if ( var_0._id_7E91 )
            continue;

        var_0 thread _id_5F82( self );
    }
}

_id_5F82( var_0 )
{
    self notify( "friendlyTriggerWatcher" );
    self endon( "friendlyTriggerWatcher" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    if ( game["switchedsides"] )
    {
        if ( self.team == "allies" )
            var_1 = level._id_1FC9;
        else
            var_1 = level._id_14F1;
    }
    else if ( self.team == "allies" )
        var_1 = level._id_14F1;
    else
        var_1 = level._id_1FC9;

    for (;;)
    {
        self._id_7E91 = 0;

        foreach ( var_0 in var_1 )
        {
            if ( self _meth_81EF( var_0 ) )
            {
                self._id_7E91 = 1;
                break;
            }
        }

        if ( !self._id_7E91 || _id_0784::_id_889C() )
        {
            if ( istrue( self._id_E352 ) )
                scripts\mp\gametypes\common::_id_C515();

            break;
        }

        waitframe();
    }
}

_id_53EA()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0.team ) && var_0.team == self.team )
            continue;

        if ( isalive( var_0 ) && isdefined( var_0.sessionstate ) && var_0.sessionstate != "spectator" || _id_B670( var_0 ) )
        {
            var_0._id_7DEB = 1;
            var_0 thread _id_53E9( self );
        }
    }
}

_id_53E9( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( istrue( self._id_FE9C ) )
        return;

    for (;;)
    {
        if ( isdefined( self ) && self _meth_81EF( var_0 ) )
        {
            if ( !istrue( self._id_FE9C ) )
                thread _id_522C();
        }
        else
        {
            self._id_FE9C = 0;
            self._id_7DEB = 0;
            thread _id_4A8E();
            break;
        }

        waitframe();
    }
}

_id_522C()
{
    self._id_FE9C = 1;
    self._id_ACF1 = gettime();
    self._id_ACD2 = scripts\mp\utility\outline::_id_ACBF( self, scripts\mp\utility\game::_id_6BC3( self.team )[0], "outline_nodepth_orange", "perk" );

    if ( !isbot( self ) )
    {
        if ( isplayer( self ) )
            scripts\mp\utility\outline::_id_0C05( "outline_nodepth_orange", 0 );
    }
}

_id_4A8E()
{
    self._id_FE9C = 0;
    scripts\mp\utility\outline::outlinedisable( self._id_ACD2, self );
    self._id_ACD2 = undefined;

    if ( !isbot( self ) && isplayer( self ) )
        scripts\mp\utility\outline::_id_0C04();
}

_id_53E7()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( level._id_F894.size > 0 )
        {
            foreach ( var_1 in level._id_F894 )
                _id_745E( var_1 );
        }

        wait 0.1;
    }
}

_id_745E( var_0 )
{
    if ( var_0.owner.team == self.team )
        return;

    if ( var_0 _meth_81EF( self ) )
    {
        if ( !isdefined( var_0._id_ACD2 ) )
            var_0._id_ACD2 = scripts\mp\utility\outline::_id_ACBF( var_0, self.team, "outline_nodepth_orange", "lowest" );
    }
    else if ( isdefined( var_0._id_ACD2 ) )
    {
        scripts\mp\utility\outline::outlinedisable( var_0._id_ACD2, var_0 );
        var_0._id_ACD2 = undefined;
    }
    else
    {

    }
}

_id_B670( var_0 )
{
    if ( isdefined( var_0._id_EA0F ) )
    {
        switch ( var_0._id_EA0F )
        {
            default:
                return 0;
        }
    }

    return 0;
}

_id_DC86( var_0 )
{
    var_1 = self.team;
    var_2 = undefined;
    var_3 = var_0.team;

    if ( !isdefined( var_3 ) )
        var_3 = "allies";

    var_4 = var_0 _meth_81D2();

    if ( var_4 )
        var_3 = var_0 _meth_8154();
    else if ( var_3 == "spectator" )
        var_3 = "allies";

    var_5 = level._id_2292["friendly"];
    var_6 = level._id_2292["enemy"];

    if ( var_3 == var_1 )
    {
        _id_DCAB( self._id_0B3B, var_0 );
        _id_78E1( self._id_0B3A, var_0 );
    }
    else
    {
        _id_DCAB( self._id_0B3A, var_0 );
        _id_78E1( self._id_0B3B, var_0 );
    }
}

_id_DCAB( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] showtoplayer( var_1 );
}

_id_78E1( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] hidefromplayer( var_1 );
}

_id_E2EE()
{
    self._id_0B3B = [];
    self._id_0B3A = [];

    for ( var_0 = 1; var_0 < self._id_1042E.size; var_0++ )
    {
        var_1 = anglestoforward( self._id_1042E[var_0].angles );
        self._id_0B3B[self._id_0B3B.size] = spawnfx( level._id_2292["friendly"], self._id_1042E[var_0].origin, var_1 );
        self._id_0B3B[self._id_0B3B.size - 1] _meth_8321();
        triggerfx( self._id_0B3B[self._id_0B3B.size - 1] );
    }

    for ( var_0 = 1; var_0 < self._id_1042E.size; var_0++ )
    {
        var_1 = anglestoforward( self._id_1042E[var_0].angles );
        self._id_0B3A[self._id_0B3A.size] = spawnfx( level._id_2292["enemy"], self._id_1042E[var_0].origin, var_1 );
        self._id_0B3A[self._id_0B3A.size - 1] _meth_8321();
        triggerfx( self._id_0B3A[self._id_0B3A.size - 1] );
    }
}

_id_227F()
{
    level._id_2292["friendly"] = loadfx( "vfx/core/mp/core/vfx_front_border_cyan.vfx" );
    level._id_2292["enemy"] = loadfx( "vfx/core/mp/core/vfx_front_border_orng.vfx" );
}

_id_E3AB()
{
    waitframe();

    foreach ( var_1 in level._id_110E7 )
        var_1 _id_E2EE();
}

_id_AB46( var_0 )
{
    foreach ( var_2 in level._id_110E7 )
        var_2 _id_DC86( var_0 );
}

_id_D841()
{
    var_0 = _id_68DC( "front_zone_visual_allies_contest" );
    var_1 = _id_68DC( "front_zone_visual_axis_contest" );
    var_2 = _id_68DC( "front_zone_visual_allies_friend" );
    var_3 = _id_68DC( "front_zone_visual_axis_friend" );
    var_4 = _id_68DC( "front_zone_visual_allies_enemy" );
    var_5 = _id_68DC( "front_zone_visual_axis_enemy" );
    _id_78D1( var_0 );
    _id_78D1( var_1 );
    _id_78D1( var_2 );
    _id_78D1( var_3 );
    _id_78D1( var_4 );
    _id_78D1( var_5 );
}

_id_78D1( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] hide();
    }
}

_id_68DC( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return undefined;

    return var_1;
}
