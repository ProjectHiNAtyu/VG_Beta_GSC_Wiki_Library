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
        scripts\mp\utility\game::_id_C2B3( level.gametype, 10 );
        scripts\mp\utility\game::_id_C29B( level.gametype, 1 );
        scripts\mp\utility\game::_id_C29F( level.gametype, 150 );
        scripts\mp\utility\game::_id_C2C2( level.gametype, 1 );
        scripts\mp\utility\game::_id_C270( level.gametype, 0 );
        scripts\mp\utility\game::_id_C24F( level.gametype, 0 );
        level._id_8C75 = 90;
    }

    _id_FC7A();
    level.teambased = 1;
    level._id_4E49 = 1;
    level._id_AB9A = ::_id_AB9A;
    level._id_AB46 = ::_id_AB46;
    level._id_6D2C = ::_id_6D2C;
    level._id_AB5D = ::_id_AB5D;
    game["dialog"]["gametype"] = "gametype_tjugg";

    if ( getdvarint( "#x33b8132c2bbd3f240" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "#x3863d66ab814c070" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];

    game["dialog"]["boost"] = "boost_tjugg";
    game["dialog"]["offense_obj"] = "boost_tjugg";
    game["dialog"]["defense_obj"] = "boost_tjugg";
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _func_01D2( "scr_tjugg_juggHealth", getmatchrulesdata( "tjuggData", "juggHealth" ) );
    _func_01D2( "scr_tjugg_juggswitchtime", getmatchrulesdata( "tjuggData", "juggSwitchTime" ) );
    _func_01D2( "scr_tjugg_ppkasjugg", getmatchrulesdata( "tjuggData", "ppkAsJugg" ) );
    _func_01D2( "scr_tjugg_ppkonjugg", getmatchrulesdata( "tjuggData", "ppkOnJugg" ) );
    _func_01D2( "scr_tjugg_ppkjuggonjugg", getmatchrulesdata( "tjuggData", "ppkJuggOnJugg" ) );
    _func_01D2( "scr_tjugg_roundswitch", 0 );
    scripts\mp\utility\game::_id_C29C( "tjugg", 0, 0, 9 );
    _func_01D2( "scr_tjugg_roundlimit", 1 );
    scripts\mp\utility\game::_id_C29B( "tjugg", 1 );
    _func_01D2( "scr_tjugg_winlimit", 1 );
    scripts\mp\utility\game::_id_C2C2( "tjugg", 1 );
    _func_01D2( "scr_tjugg_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "tjugg", 0 );
    _func_01D2( "scr_tjugg_playerrespawndelay", 0 );
    _func_01D2( "scr_tjugg_waverespawndelay", 0 );
    _func_01D2( "scr_player_forcerespawn", 1 );
    _func_01D2( "#x32b87090bf6ed2669", 0 );
    _func_01D2( "scr_tjugg_promode", 0 );
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

    scripts\mp\utility\game::_id_D610( "allies", &"OBJECTIVES/TJUGG" );
    scripts\mp\utility\game::_id_D610( "axis", &"OBJECTIVES/TJUGG" );

    if ( level._id_E427 )
    {
        scripts\mp\utility\game::_id_D60E( "allies", &"OBJECTIVES/TJUGG" );
        scripts\mp\utility\game::_id_D60E( "axis", &"OBJECTIVES/TJUGG" );
    }
    else
    {
        scripts\mp\utility\game::_id_D60E( "allies", &"OBJECTIVES/TJUGG_SCORE" );
        scripts\mp\utility\game::_id_D60E( "axis", &"OBJECTIVES/TJUGG_SCORE" );
    }

    scripts\mp\utility\game::_id_D609( "allies", &"OBJECTIVES/TJUGG_HINT" );
    scripts\mp\utility\game::_id_D609( "axis", &"OBJECTIVES/TJUGG_HINT" );
    _id_827A();
    scripts\mp\playeractions::_id_C22D( "tjugg", [ "usability", "killstreaks", "supers" ] );
    level._id_C6B5 = loadfx( "vfx/core/expl/bouncing_betty_explosion" );
    level._id_8BCC = [];
    level._id_8BCC["axis"] = 1;
    level._id_8BCC["allies"] = 1;
    level._id_8BCB = [];
    level._id_8BCB["axis"] = [];
    level._id_8BCB["allies"] = [];
    level._id_8BD5 = [];
    level._id_8BD5["axis"] = undefined;
    level._id_8BD5["allies"] = undefined;
    level._id_F298 = [];
    level._id_F298["allies"] = scripts\mp\hud_util::_id_4028( "objective", 1.4, "allies" );
    level._id_F298["allies"] scripts\mp\hud_util::setpoint( "TOPLEFT", "TOPLEFT", 55, 150 );
    level._id_F298["allies"]._id_024D = &"MP_JUGG_NEXT_JUGG_IN";
    level._id_F298["allies"].alpha = 0;
    level._id_F298["allies"].archived = 0;
    level._id_F298["allies"].hidewheninmenu = 1;
    level._id_F298["axis"] = scripts\mp\hud_util::_id_4028( "objective", 1.4, "axis" );
    level._id_F298["axis"] scripts\mp\hud_util::setpoint( "TOPLEFT", "TOPLEFT", 55, 150 );
    level._id_F298["axis"]._id_024D = &"MP_JUGG_NEXT_JUGG_IN";
    level._id_F298["axis"].alpha = 0;
    level._id_F298["axis"].archived = 0;
    level._id_F298["axis"].hidewheninmenu = 1;
    thread _id_78FE( level._id_F298["allies"] );
    thread _id_78FE( level._id_F298["axis"] );
    level._id_59CC = 5;
}

_id_FC7A()
{
    scripts\mp\gametypes\common::_id_FC36();
    level._id_8C6D = _id_0A66::_id_507C( "juggHealth", 1000, 1000, 10000 );
    level._id_8C75 = _id_0A66::_id_507A( "juggSwitchTime", 60, 10, 180 );
    level._id_BB1B = _id_0A66::_id_507C( "ppkAsJugg", 2, 1, 100 );
    level._id_BB1D = _id_0A66::_id_507C( "ppkOnJugg", 5, 1, 100 );
    level._id_BB1C = _id_0A66::_id_507C( "ppkJuggOnJugg", 10, 1, 100 );
}

_id_AB46( var_0 )
{
    var_0._id_7527 = 0;
    var_0._id_8BC6 = 0;
}

_id_827A()
{
    level._id_E324 = ( 0, 0, 0 );
    level._id_E321 = ( 0, 0, 0 );
    _id_07EE::_id_D454( "Default", "Crit_Frontline" );
    _id_07EE::_id_1111( "mp_tdm_spawn_allies_start" );
    _id_07EE::_id_1111( "mp_tdm_spawn_axis_start" );
    _id_07EE::_id_110D( "allies", "mp_tdm_spawn" );
    _id_07EE::_id_110D( "allies", "mp_tdm_spawn_secondary", 1, 1 );
    _id_07EE::_id_110D( "axis", "mp_tdm_spawn" );
    _id_07EE::_id_110D( "axis", "mp_tdm_spawn_secondary", 1, 1 );
    _id_07EE::_id_C2AB( "normal", "mp_tdm_spawn" );
    _id_07EE::_id_C2AB( "fallback", "mp_tdm_spawn_secondary" );
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

_id_AB5D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( var_3 == "MOD_SUICIDE" && var_4.basename == "none" && isdefined( self._id_10A1F ) )
        return;

    var_10 = self;

    if ( isdefined( var_10._id_88CB ) )
    {
        if ( isdefined( var_10._id_8C70 ) )
            var_10._id_8C70 destroy();

        var_10._id_B7D1 = undefined;
        var_10._id_A5CC = 0;
        var_10 scripts\mp\utility\player::_id_0CC7( "iw8_defaultsuit_mp" );
        _id_3871( var_10 );
    }

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        var_11 = 0;
        var_12 = 0;
        var_13 = 0;
        var_14 = 0;
        var_15 = 0;
        var_16 = 0;
        var_17 = 0;

        if ( var_1 == var_10 )
        {
            if ( isdefined( var_10._id_88CB ) )
                var_12 = 1;
        }
        else if ( var_1.team != var_10.team )
        {
            if ( isdefined( var_10._id_88CB ) )
            {
                var_12 = 1;

                if ( isdefined( var_1._id_88CB ) )
                    var_13 = 1;
                else
                    var_14 = 1;
            }
            else if ( isdefined( var_1._id_88CB ) )
                var_15 = 1;

            if ( level._id_8BCC[var_1.team] )
                var_11 = 1;
        }
        else if ( isdefined( var_10._id_88CB ) && var_1.team == var_10.team )
        {
            var_10 thread _id_6F8C();
            return;
        }

        if ( var_11 )
            _id_C60D( var_1 );

        if ( var_12 )
        {
            var_18 = _id_68FE( var_10.team, 0 );

            if ( !isdefined( var_18 ) )
                var_18 = _id_68FE( var_10.team, 1 );

            if ( !isdefined( var_18 ) )
                var_18 = var_10;

            _id_C60D( var_18, var_10 );
        }

        if ( var_11 || var_12 )
            _id_0A79::_id_B8DE( "mp_enemy_obj_captured" );

        if ( var_1 != var_10 && var_1.team != var_10.team && !isdefined( var_1._id_88CB ) )
        {
            if ( var_1._id_7527 )
            {
                var_1._id_8BC6 = var_1._id_8BC6 + 25;

                if ( var_14 )
                    var_1._id_8BC6 = var_1._id_8BC6 + 75;

                if ( isdefined( level._id_8BCB[var_1.team][var_10._id_723F] ) )
                {
                    var_16 = 1;
                    var_1._id_8BC6 = var_1._id_8BC6 + 50;
                    level._id_8BCB[var_1.team][var_10._id_723F] = undefined;
                }
            }
            else
            {
                var_1._id_8BC6 = var_1._id_8BC6 + 50;

                if ( var_14 )
                    var_1._id_8BC6 = var_1._id_8BC6 + 100;

                if ( isdefined( level._id_8BCB[var_1.team][var_10._id_723F] ) )
                {
                    var_16 = 1;
                    var_1._id_8BC6 = var_1._id_8BC6 + 100;
                    level._id_8BCB[var_1.team][var_10._id_723F] = undefined;
                }
            }
        }

        if ( var_14 )
        {
            var_1 thread _id_0A76::_id_6FE6( "kill_juggernaut" );
            var_17 = level._id_BB1D;
        }
        else if ( var_13 )
        {
            var_1 thread _id_0A76::_id_6FE6( "jugg_on_jugg" );
            var_17 = level._id_BB1C;
        }
        else if ( var_15 )
        {
            var_1 thread _id_0A76::_id_6FE6( "kill_as_juggernaut" );
            var_17 = level._id_BB1B;
        }

        if ( var_17 )
            var_1 scripts\mp\gamescore::_id_6FE4( var_1.pers["team"], var_17 );

        if ( var_1.team != var_10.team && game["state"] == "postgame" && game["teamScores"][var_1.team] > game["teamScores"][level._id_AC8A[var_1.team]] )
        {
            var_1._id_5A81 = 1;
            return;
        }
    }
    else if ( isdefined( var_10._id_88CB ) )
    {
        var_18 = _id_68FE( var_10.team, 0 );

        if ( !isdefined( var_18 ) )
            var_18 = _id_68FE( var_10.team, 1 );

        if ( !isdefined( var_18 ) )
            var_18 = var_10;

        _id_C60D( var_18, var_10 );
    }
}

_id_C60D( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        var_1 notify( "lost_juggernaut" );
        var_1._id_88CB = undefined;
    }
    else
        level._id_8BCC[var_0.team] = 0;

    level._id_8BD5[var_0.team] = undefined;
    level._id_F298[var_0.team].alpha = 0;
    level._id_8BCB[var_0.team] = [];

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_0.team )
            var_3._id_8BC6 = 0;
    }

    var_0 thread _id_6F8C();
}

_id_6F8C()
{
    if ( !scripts\mp\utility\player::isreallyalive( self ) || scripts\mp\utility\player::_id_8AB5() )
    {
        self endon( "disconnect" );
        thread _id_C60F( 0 );

        while ( !scripts\mp\utility\player::isreallyalive( self ) || scripts\mp\utility\player::_id_8AB5() )
            waitframe();

        self notify( "end_resetJuggLoadoutOnDisconnect" );
    }

    if ( isdefined( self._id_878D ) && self._id_878D == 1 )
    {
        self notify( "force_cancel_placement" );
        waitframe();
    }

    while ( self _meth_81CD() )
        waitframe();

    while ( !self isonground() )
        waitframe();

    if ( istrue( self._id_88CB ) )
    {
        self notify( "lost_juggernaut" );
        waitframe();
    }

    self._id_88CB = 1;
    level._id_8BD5[self.team] = self;
    self._id_7527 = 1;
    _id_09EF::_id_E343( self.origin, self.angles );
    self notify( "faux_spawn" );
    self._id_59BF = self getstance();
    thread scripts\mp\playerlogic::_id_E334( 1 );
    _id_3FE2( self );
    thread _id_FC96();
    self._id_88C5 = 1;
    self.maxhealth = level._id_8C6D;
    self.health = self.maxhealth;
    self._id_A5CC = 1;
    scripts\mp\class::_id_960A( 1 );
    scripts\mp\playeractions::_id_156E( "tjugg", 0 );
    var_0 = scripts\mp\class::buildweapon( "s4_ar_stango44", [ "holo" ], "none", "none", -1 );
    self giveweapon( var_0 );
    scripts\cp_mp\utility\inventory_utility::_id_5EB7( var_0 );
    var_0 = scripts\mp\class::buildweapon( "s4_pi_mike1911", [], "none", "none", -1 );
    self giveweapon( var_0 );
    self givemaxammo( var_0 );
    scripts\mp\utility\perk::_id_6FA5( "specialty_stun_resistance" );
    scripts\mp\utility\perk::_id_6FA5( "specialty_sharp_focus" );
    scripts\mp\utility\player::_id_0CC7( "iw8_juggernaut_mp" );
    self._id_B7D1 = -0.2;
    scripts\mp\weapons::_id_FCCA();
    _id_07F7::_id_D5B6();
    self._id_8C70 = newclienthudelem( self );
    self._id_8C70.x = 0;
    self._id_8C70.y = 0;
    self._id_8C70.alignx = "left";
    self._id_8C70.aligny = "top";
    self._id_8C70.horzalign = "fullscreen";
    self._id_8C70.vertalign = "fullscreen";
    self._id_8C70 setshader( "gasmask_overlay_delta", 640, 480 );
    self._id_8C70.sort = -10;
    self._id_8C70.archived = 1;
    self._id_8C70.alpha = 1.0;
    self._id_5F9A = scripts\mp\utility\outline::_id_ACBF( self, self.team, "outlinefill_nodepth_cyan", "killstreak" );
    thread _id_C60F( 1 );
    thread _id_C60E();
    thread _id_C807();
    thread _id_9741();

    if ( level._id_8C75 != 0 )
        thread _id_A496();
}

_id_A496()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    level._id_F298[self.team]._id_024D = &"MP_JUGG_NEXT_JUGG_IN";
    level._id_F298[self.team] _meth_8390( level._id_8C75 );
    level._id_F298[self.team].alpha = 1;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( level._id_8C75 );
    level._id_F298[self.team].alpha = 0;
    var_0 = _id_68FE( self.team, 0 );

    if ( !isdefined( var_0 ) )
        var_0 = _id_68FE( self.team, 1 );

    if ( !isdefined( var_0 ) )
        var_0 = self;

    _id_0A79::_id_B8DE( "mp_enemy_obj_captured" );
    _id_C60D( var_0, self );

    if ( var_0 != self )
        thread _id_C6B4();
}

_id_C6B4()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( !scripts\mp\utility\player::isreallyalive( self ) || scripts\mp\utility\player::_id_8AB5() )
        waitframe();

    if ( isdefined( self._id_878D ) && self._id_878D == 1 )
    {
        self notify( "force_cancel_placement" );
        waitframe();
    }

    _id_09EF::_id_E343( self.origin, self.angles );
    playfx( level._id_C6B5, self.origin );
    self notify( "lost_juggernaut" );
    waitframe();

    while ( !self isonground() )
        waitframe();

    self notify( "faux_spawn" );

    if ( isdefined( self._id_8C70 ) )
        self._id_8C70 destroy();

    self._id_59BF = self getstance();
    self._id_B7D1 = undefined;
    self._id_88C5 = 0;
    self._id_A5CC = 0;
    scripts\mp\utility\outline::outlinedisable( self._id_5F9A, self );
    self.maxhealth = _id_07FB::_id_6DF7( "player", "maxhealth" );
    thread scripts\mp\playerlogic::_id_E334( 1 );
    scripts\mp\utility\player::_id_0CC7( "iw8_defaultsuit_mp" );
    scripts\mp\weapons::_id_FCCA();
    _id_3871( self );
}

_id_C807()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );

    for (;;)
    {
        wait 1.0;

        foreach ( var_1 in level.players )
        {
            if ( scripts\mp\utility\player::isreallyalive( var_1 ) && !var_1 scripts\mp\utility\player::_id_8AB5() && var_1 != self && var_1.team == self.team && distancesquared( var_1.origin, self.origin ) < 48400 )
            {
                if ( var_1._id_7527 )
                {
                    var_1._id_8BC6 = var_1._id_8BC6 + 15;
                    continue;
                }

                var_1._id_8BC6 = var_1._id_8BC6 + 25;
            }
        }
    }
}

_id_9741()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( isplayer( var_1 ) && var_1.team != self.team )
        {
            if ( !isdefined( level._id_8BCB[self.team][var_1._id_723F] ) )
                level._id_8BCB[self.team][var_1._id_723F] = 1;
        }
    }
}

_id_C60F( var_0 )
{
    level endon( "game_ended" );

    if ( var_0 )
        self endon( "death" );
    else
        self endon( "end_resetJuggLoadoutOnDisconnect" );

    var_1 = self.team;
    self waittill( "disconnect" );
    var_2 = _id_68FE( var_1, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = _id_68FE( var_1, 1 );

    if ( isdefined( var_2 ) )
    {
        _id_0A79::_id_B8DE( "mp_enemy_obj_captured" );
        _id_C60D( var_2 );
    }
    else
    {
        level._id_8BCC[var_1] = 1;
        level._id_8BD5[var_1] = undefined;
        level._id_F298[var_1].alpha = 0;
        level._id_8BCB[var_1] = [];

        foreach ( var_4 in level.players )
        {
            if ( var_4.team == var_1 )
                var_4._id_8BC6 = 0;
        }
    }
}

_id_C60E()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = self.team;
    scripts\engine\utility::waittill_any_2( "joined_team", "joined_spectators" );
    self._id_88CB = undefined;
    var_1 = _id_68FE( var_0, 0 );

    if ( !isdefined( var_1 ) )
        var_1 = _id_68FE( var_0, 1 );

    if ( isdefined( var_1 ) )
    {
        _id_0A79::_id_B8DE( "mp_enemy_obj_captured" );
        _id_C60D( var_1 );
    }
    else
    {
        level._id_8BCC[var_0] = 1;
        level._id_8BD5[var_0] = undefined;
        level._id_F298[var_0].alpha = 0;
        level._id_8BCB[var_0] = [];

        foreach ( var_3 in level.players )
        {
            if ( var_3.team == var_0 )
                var_3._id_8BC6 = 0;
        }
    }
}

_id_68FE( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = -1;

    foreach ( var_5 in level.players )
    {
        if ( ( var_1 || !var_5 scripts\mp\utility\player::_id_8AB5() ) && var_5 != self && var_5.team == var_0 && var_5._id_8BC6 > var_3 )
        {
            var_2 = var_5;
            var_3 = var_5._id_8BC6;
        }
    }

    return var_2;
}

_id_78FE( var_0 )
{
    level waittill( "game_ended" );
    var_0.alpha = 0;
}

_id_3FE2( var_0 )
{
    var_1 = _id_07D0::_id_C56F( 99 );
    var_0._id_8C6F = var_1;
    var_0._id_A96B = ( 0, 0, 90 );
    var_0._id_10418 = "any";
    var_0._id_AD9B = var_0.team;
    _id_07D0::_id_A854( var_1, "current", var_0.origin, "icon_minimap_juggernaut" );
    _id_07D0::_id_A89E( var_1, 0 );
    _id_07D0::_id_A89F( var_1, 0 );
    _id_07D0::_id_A88F( var_1 );
    _id_07D0::_id_FB90( var_1, var_0 );
    _id_07D0::_id_FB9A( var_1, var_0._id_A96B[2] );
    _func_017D( var_1, var_0.team );
    _func_0163( var_1, "MP_INGAME_ONLY/OBJ_DEFEND_CAPS" );
    _func_0164( var_1, "MP_INGAME_ONLY/OBJ_KILL_CAPS" );
}

_id_3871( var_0 )
{
    _id_07D0::_id_C78C( var_0._id_8C6F );
    var_0._id_8C6F = undefined;
}

_id_FC95()
{
    self endon( "death_or_disconnect" );
    self endon( "lost_juggernaut" );

    for (;;)
    {
        self._id_411F = self.origin + ( 0, 0, 90 );
        waitframe();
    }
}

_id_FC96()
{
    self endon( "death_or_disconnect" );
    self endon( "lost_juggernaut" );
    thread _id_FC95();

    if ( !isdefined( self._id_A8FF ) )
        self._id_A8FF = 4.0;

    for (;;)
    {
        foreach ( var_1 in level._id_EF86 )
        {
            if ( !_id_07AD::_id_8855( var_1 ) )
            {
                _func_018C( self._id_8C6F, var_1 );
                _func_018A( self._id_8C6F );
            }
        }

        scripts\engine\utility::_id_108AC( self._id_A8FF );
    }
}

_id_D6D6()
{
    level._id_F297["default"]["loadoutArchetype"] = "archetype_assault";
    level._id_F297["default"]["loadoutPrimary"] = "s4_ar_stango44";
    level._id_F297["default"]["loadoutPrimaryAttachment"] = "none";
    level._id_F297["default"]["loadoutPrimaryAttachment2"] = "none";
    level._id_F297["default"]["loadoutPrimaryCamo"] = "none";
    level._id_F297["default"]["loadoutPrimaryReticle"] = "none";
    level._id_F297["default"]["loadoutSecondary"] = "s4_la_m1bravo";
    level._id_F297["default"]["loadoutSecondaryAttachment"] = "none";
    level._id_F297["default"]["loadoutSecondaryAttachment2"] = "none";
    level._id_F297["default"]["loadoutSecondaryCamo"] = "none";
    level._id_F297["default"]["loadoutSecondaryReticle"] = "none";
    level._id_F297["default"]["loadoutMeleeSlot"] = "s4_me_fists_mp_ls";
    level._id_F297["default"]["loadoutEquipmentPrimary"] = "equip_frag";
    level._id_F297["default"]["loadoutEquipmentSecondary"] = "equip_smoke";
    level._id_F297["default"]["loadoutStreakType"] = "assault";
    level._id_F297["default"]["loadoutKillstreak1"] = "none";
    level._id_F297["default"]["loadoutKillstreak2"] = "none";
    level._id_F297["default"]["loadoutKillstreak3"] = "none";
    level._id_F297["default"]["loadoutSuper"] = "none";
    level._id_F297["default"]["loadoutPerks"] = [ "specialty_scavenger", "specialty_blastshield" ];
    level._id_F297["default"]["loadoutGesture"] = "playerData";
}
