// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_7E0A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !scripts\cp_mp\utility\script_utility::issharedfuncdefined( "infil", "get_all_infils" ) )
        scripts\cp_mp\utility\script_utility::registersharedfunc( "infil", "get_all_infils", ::_id_6312 );

    while ( !isdefined( level._id_EF86 ) )
        waitframe();

    if ( !isdefined( game["infil"] ) )
    {
        foreach ( var_9 in level._id_EF86 )
            game["infil"][var_9] = [];

        game["infil"]["types"] = [];
    }

    if ( isdefined( scripts\cp_mp\utility\game_utility::_id_6AF9() ) )
    {
        var_11 = _id_6312( var_0 );

        foreach ( var_13 in var_11 )
        {
            if ( var_13.name == var_1 )
            {
                if ( isdefined( var_13._id_CD8C ) && var_13._id_CD8C == level._id_96B5 )
                    break;
            }
        }
    }

    if ( isdefined( game["infil"]["types"][var_0] ) && isdefined( game["infil"]["types"][var_0][var_1] ) )
    {
        if ( isdefined( game["infil"]["types"][var_0][var_1]["persistentVehicle"] ) )
            self [[ game["infil"]["types"][var_0][var_1]["persistentVehicle"] ]]( var_0, var_1 );

        return;
    }

    game["infil"]["types"][var_0][var_1] = [];
    game["infil"]["types"][var_0][var_1]["spawn_func"] = var_5;
    game["infil"]["types"][var_0][var_1]["player_func"] = var_7;
    game["infil"]["types"][var_0][var_1]["get_length_func"] = var_6;
    game["infil"]["types"][var_0][var_1]["seats"] = var_2;
    game["infil"]["types"][var_0][var_1]["required_seats"] = var_3;
    game["infil"]["types"][var_0][var_1]["fill_order"] = var_4;
}

_id_7E2B()
{
    if ( !isdefined( level._id_838F ) )
        level._id_838F = getdvarint( "scr_infil_interactive", 0 ) == 1;

    return level._id_838F;
}

_id_7E28()
{
    var_0 = 0;

    if ( var_0 || level._id_C016 && !_func_010A() )
    {
        game["infil"] = undefined;
        _id_07A8::_id_60A2( "infil_setup_complete" );
        return;
    }

    if ( game["roundsPlayed"] > 0 || getdvarint( "scr_skip_infils", 0 ) == 1 || getdvarint( "scr_game_infilSkip", 0 ) == 1 || !_id_60D9() )
    {
        game["infil"] = undefined;
        _id_07A8::_id_60A2( "infil_setup_complete" );
        return;
    }

    if ( !isdefined( level._id_BBA0 ) || level._id_BBA0 == 0 )
    {
        game["infil"] = undefined;
        _id_07A8::_id_60A2( "infil_setup_complete" );
        return;
    }

    while ( !isdefined( level._id_EF86 ) )
        waitframe();

    waitframe();
    _id_0A65::_id_C277( ::_id_AB50 );
    level._id_BB91 = ::_id_7E33;
    var_1 = undefined;
    level._id_7E5A = 0;

    foreach ( var_3 in _id_6312() )
    {
        var_4 = var_3._id_0375;
        var_5 = var_3.name;

        if ( !var_3 _id_7E2A() )
            continue;

        if ( isdefined( scripts\cp_mp\utility\game_utility::_id_6AF9() ) )
        {
            if ( var_3.name == var_5 )
            {
                if ( !isdefined( var_3._id_CD8C ) || var_3._id_CD8C != level._id_96B5 )
                    continue;
            }
        }

        if ( var_3 _id_7E16() )
            _id_7E29();

        var_6 = var_3._id_CE70;

        if ( var_3 _id_7E2D( var_4 ) && var_3 _id_7E2C( var_5 ) && scripts\mp\utility\teams::_id_885E( var_3._id_CE70 ) )
        {
            level._id_7E5A++;
            var_7 = game["infil"]["types"][var_4][var_5];
            var_8 = var_5;
            var_9 = var_5;

            if ( issubstr( var_9, "alpha" ) )
                var_9 = "alpha";

            if ( issubstr( var_9, "bravo" ) )
                var_9 = "bravo";

            if ( !isdefined( var_7 ) )
                var_7 = game["infil"]["types"][var_4][var_9];

            var_10 = var_3 [[ var_7["spawn_func"] ]]( var_3._id_CE70, var_3.target, var_9, var_8 );
            var_10.players = [];
            var_10._id_048F = var_4;
            var_10._id_AC7F = var_8;
            var_10._id_EAC4 = var_9;
            var_10._id_7E56 = var_10 [[ var_7["get_length_func"] ]]( var_9 );

            if ( !isdefined( var_1 ) || var_1 < var_10._id_7E56 )
                var_1 = var_10._id_7E56 + 1.0;

            var_6 = var_3._id_CE70;
            game["infil"][var_6]["lanes"][var_4][var_5] = var_10;
            _id_C1DF( var_6, var_10, var_7["seats"], var_7["required_seats"], var_7["fill_order"], var_7["player_func"] );

            if ( var_3 _id_7E16() )
                _id_07F3::_id_107C( "to_infil", var_10, var_6, var_3._id_CD8C );
        }
    }

    if ( scripts\mp\utility\game::_id_60A4() && isdefined( var_1 ) )
    {
        level thread _id_AB65();
        level._id_BB9F = getdvarint( "scr_game_graceperiod", 15 );
        level._id_9B93 = var_1 + 2.0;
        level._id_BBA0 = var_1 + 2.0;
        thread scripts\mp\gamelogic::_id_9BDB( "match_starting_in", level._id_BB9F + level._id_BBA0 );
        level thread _id_7E3E();
        level thread _id_7E46();
        level thread _id_107DD();
        _id_07A8::_id_60A2( "infil_will_run" );
    }

    _id_07A8::_id_60A2( "infil_setup_complete" );
}

_id_60D9()
{
    if ( scripts\mp\utility\game::getgametype() == "br" )
        return 0;

    if ( scripts\mp\utility\game::getgametype() == "war" && level._id_036A == "mp_donetsk" )
        return 0;

    if ( scripts\mp\utility\game::getgametype() == "sd" )
        return 0;

    return 1;
}

_id_AB65()
{
    level endon( "infil_started" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );
        var_0 thread _id_1082C();
    }
}

_id_1082C()
{
    level endon( "infil_started" );
    self endon( "death_or_disconnect" );

    if ( isdefined( self.team ) )
    {
        _id_07A8::_id_60A3( "infil_setup_complete" );

        if ( _id_07A8::_id_609F( "infil_will_run" ) && !_id_07A8::_id_609F( "prematch_done" ) )
        {
            var_0 = ( 0, 0, 0 );
            var_1 = 0;

            if ( isdefined( game["infil"] ) && isdefined( game["infil"][self.team] ) && isdefined( game["infil"][self.team]["lanes"] ) )
            {
                foreach ( var_7, var_3 in game["infil"][self.team]["lanes"] )
                {
                    foreach ( var_5 in var_3 )
                    {
                        var_0 = var_0 + var_5.origin;
                        var_1++;
                    }
                }
            }

            if ( var_1 > 0 )
                var_0 = var_0 / var_1;

            self _meth_8281( var_0 );
        }
    }

    while ( !istrue( self.pers["streamSyncComplete"] ) )
        waitframe();

    var_8 = _id_675E( self, scripts\mp\utility\game::_id_6BC3( self.team )[0] );

    if ( isdefined( var_8 ) )
        _id_B46C( self, scripts\mp\utility\game::_id_6BC3( self.team )[0] );

    _id_B516();
}

_id_AAF2( var_0 )
{
    if ( _id_07A8::_id_609F( "infil_will_run" ) && !_id_07A8::_id_609F( "infil_started" ) )
    {
        if ( isdefined( var_0.team ) && var_0.team == "spectator" )
            var_0 thread _id_7E5D();
    }
}

_id_7E5D()
{
    self endon( "joined_team" );
    self endon( "disconnect" );
    self notify( "infilSpectatorView" );
    self endon( "infilSpectatorView" );
    thread _id_7E3D( 0.0, 0.55 );
}

_id_AB50( var_0 )
{
    if ( !isdefined( var_0._id_7E09 ) )
        return;

    if ( _id_07A8::_id_609F( "prematch_done" ) )
        return;

    _id_B46C( var_0, var_0.team );
}

_id_AB45()
{
    level endon( "prematch_over" );
    self endon( "player_free_spot" );
    var_0 = self.team;
    scripts\engine\utility::waittill_any_2( "joined_team", "joined_spectators" );
    _id_B46C( self, var_0 );
}

_id_6312( var_0 )
{
    if ( isdefined( var_0 ) )
        return scripts\engine\utility::_id_6D7C( var_0, "script_noteworthy" );
    else
        var_1 = scripts\engine\utility::_id_6D7C( "mp_infil", "targetname" );

    return scripts\engine\utility::_id_6D7C( "mp_infil", "targetname" );
}

_id_7E2D( var_0 )
{
    return self._id_0375 == var_0;
}

_id_7E2C( var_0 )
{
    return self.name == var_0;
}

_id_7E2A()
{
    if ( !isdefined( self._id_03C3 ) || self._id_03C3 == 0 )
        return 0;

    if ( !level.teambased )
        return 0;

    if ( self._id_03C3 & 1 )
    {
        if ( level.gametype == "sd" && level.mapname == "mp_petrograd" || level.gametype == "sd" && level.mapname == "mp_piccadilly" )
            return 0;
        else
            return 1;
    }

    if ( self._id_03C3 & 2 )
    {
        switch ( level.gametype )
        {
            case "grind":
            case "war":
            case "pill":
            case "conf":
            case "tjugg":
                return 1;
        }
    }

    if ( self._id_03C3 & 4 )
    {
        switch ( level.gametype )
        {
            case "dd":
            case "sr":
            case "sd":
                if ( level.mapname == "mp_petrograd" || level.mapname == "mp_piccadilly" )
                    return 0;
                else
                    return 1;
        }
    }

    if ( self._id_03C3 & 8 )
    {
        switch ( level.gametype )
        {
            case "siege":
            case "dom":
                return 1;
        }
    }

    if ( self._id_03C3 & 16 )
    {
        switch ( level.gametype )
        {
            case "grnd":
            case "koth":
            case "hq":
                return 1;
        }
    }

    if ( self._id_03C3 & 32 )
    {
        switch ( level.gametype )
        {
            case "ctf":
                return 1;
        }
    }

    if ( self._id_03C3 & 64 )
    {
        switch ( level.gametype )
        {
            case "cyber":
                return 1;
        }
    }

    if ( self._id_03C3 & 128 )
    {
        switch ( level.gametype )
        {
            case "cmd":
            case "base":
            case "arm":
                return 1;
        }
    }

    return 0;
}

_id_7E16()
{
    return isdefined( self._id_CD8C ) && level.gametype == "tac_ops";
}

_id_7E29()
{
    if ( level.gametype == "tac_ops" && !isdefined( game["infil"]["map_config"] ) )
    {
        _id_07F3::init();
        _id_07F3::_id_D452( "to_infil", "allies" );
        _id_07F3::_id_D452( "to_infil", "axis" );
        game["infil"]["map_config"] = 1;
    }
}

_id_7E33( var_0, var_1 )
{
    if ( self ishost() && getdvarint( "scr_infil_spectator" ) == 1 )
    {
        scripts\common\utility::_id_1565( var_0 );
        return;
    }

    if ( !scripts\mp\utility\game::_id_EF73( self.team ) && !istrue( var_1 ) )
    {
        scripts\mp\playerlogic::_id_B748( var_0 );
        return;
    }

    self allowmovement( var_0 );
    scripts\common\utility::_id_1548( var_0 );
    scripts\common\utility::_id_1508( var_0 );
    scripts\common\utility::_id_1526( var_0 );
    scripts\common\utility::_id_1516( var_0 );
    scripts\common\utility::_id_14F7( var_0 );
    scripts\common\utility::_id_1559( var_0 );
    scripts\common\utility::_id_152C( var_0 );
    scripts\common\utility::_id_154D( var_0 );
    scripts\common\utility::_id_1529( var_0 );
    scripts\common\utility::_id_1557( var_0 );
    scripts\common\utility::allow_equipment( var_0 );
    scripts\common\utility::_id_156B( var_0 );
    scripts\common\utility::_id_1562( var_0 );
}

_id_C1DF( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( game["infil"][var_0]["spots"] ) )
        game["infil"][var_0]["spots"] = [];

    var_6 = game["infil"][var_0]["spots"].size;

    for ( var_7 = 0; var_7 < var_2; var_7++ )
    {
        var_8 = game["infil"][var_0]["spots"].size;

        if ( isdefined( var_4 ) )
        {
            var_9 = 0;

            foreach ( var_15, var_11 in var_4 )
            {
                foreach ( var_13 in var_11 )
                {
                    if ( var_13 == var_8 - var_6 )
                    {
                        game["infil"][var_0]["spots"][var_8]["priority"] = var_15;
                        var_9 = 1;
                        break;
                    }
                }

                if ( var_9 )
                    break;
            }
        }
        else
            game["infil"][var_0]["spots"][var_8]["priority"] = -1;

        game["infil"][var_0]["spots"][var_8]["seat"] = var_7;
        game["infil"][var_0]["spots"][var_8]["infil"] = var_1;
        game["infil"][var_0]["spots"][var_8]["callback"] = var_5;
    }

    if ( !istrue( level._id_C579 ) )
        level._id_C578[var_0] = level._id_C578[var_0] + var_3;
}

_id_B557( var_0, var_1 )
{
    if ( !isdefined( game["infil"][var_0.team]["spots"] ) )
    {

    }

    if ( !isdefined( game["infil"][var_0.team]["spots"][var_1] ) )
    {

    }

    if ( isdefined( game["infil"][var_0.team]["spots"][var_1]["player"] ) )
    {

    }

    game["infil"][var_0.team]["spots"][var_1]["player"] = var_0;
    return game["infil"][var_0.team]["spots"][var_1];
}

_id_B46C( var_0, var_1 )
{
    var_0 setclientomnvar( "ui_player_in_infil", 0 );

    if ( !isdefined( var_1 ) )
        var_1 = var_0.team;

    if ( !isdefined( game["infil"][var_1]["spots"] ) )
    {

    }

    foreach ( var_4, var_3 in game["infil"][var_1]["spots"] )
    {
        if ( _id_86B4( var_1, var_4 ) && var_3["player"] == var_0 )
        {
            game["infil"][var_1]["spots"][var_4]["player"] = undefined;
            var_0 notify( "player_free_spot" );
            return;
        }
    }
}

_id_6645( var_0, var_1 )
{
    return game["infil"][var_0]["spots"][var_1]["player"];
}

_id_675E( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0.team;

    if ( !isdefined( game["infil"][var_1]["spots"] ) )
        return undefined;

    foreach ( var_4, var_3 in game["infil"][var_1]["spots"] )
    {
        if ( isdefined( var_3["player"] ) && var_3["player"] == var_0 )
            return var_4;
    }

    return undefined;
}

_id_86B4( var_0, var_1 )
{
    if ( !isdefined( game["infil"][var_0]["spots"] ) )
    {

    }

    if ( !isdefined( game["infil"][var_0]["spots"][var_1] ) )
    {

    }

    return isdefined( game["infil"][var_0]["spots"][var_1]["player"] );
}

_id_6760( var_0 )
{
    if ( !isdefined( game["infil"][var_0]["spots"] ) )
    {

    }

    var_1 = 0;

    foreach ( var_4, var_3 in game["infil"][var_0]["spots"] )
    {
        if ( _id_86B4( var_0, var_4 ) )
            var_1++;
    }

    return var_1;
}

_id_675D( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in game["infil"][var_0]["spots"] )
    {
        if ( !_id_86B4( var_0, var_4 ) )
            var_1[var_1.size] = var_4;
    }

    if ( var_1.size == 0 )
        return undefined;

    var_5 = getdvarint( "scr_infil_force_seat", -1 );

    if ( scripts\engine\utility::array_contains( var_1, var_5 ) )
        return var_5;

    var_6 = [];
    var_7 = -1;

    foreach ( var_3 in var_1 )
    {
        var_9 = game["infil"][var_0]["spots"][var_3]["priority"];

        if ( var_6.size == 0 || var_9 < var_7 )
        {
            var_6 = [];
            var_6[var_6.size] = var_3;
            var_7 = var_9;
            continue;
        }

        if ( var_9 == var_7 )
            var_6[var_6.size] = var_3;
    }

    return var_6[randomint( var_6.size )];
}

_id_675F( var_0 )
{
    while ( !isdefined( self._id_5E6B ) )
        waitframe();

    var_1 = scripts\engine\utility::ter_op( var_0 == "allies", "a", "b" ) + _func_00D6( self._id_5E6B, 5, 6 );
    var_2 = [];

    foreach ( var_5, var_4 in game["infil"][var_0]["spots"] )
    {
        if ( issubstr( var_4["infil"]._id_8E8F, var_1 ) && !_id_86B4( var_0, var_5 ) )
            var_2[var_2.size] = var_5;
    }

    if ( var_2.size == 0 )
        return undefined;

    var_6 = [];
    var_7 = -1;

    foreach ( var_4 in var_2 )
    {
        var_9 = game["infil"][var_0]["spots"][var_4]["priority"];

        if ( var_6.size == 0 || var_9 < var_7 )
        {
            var_6 = [];
            var_6[var_6.size] = var_4;
            var_7 = var_9;
            continue;
        }

        if ( var_9 == var_7 )
            var_6[var_6.size] = var_4;
    }

    return var_6[randomint( var_6.size )];
}

_id_66C4( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in game["infil"][var_0]["spots"] )
    {
        if ( !_id_86B4( var_0, var_5 ) )
            var_2[var_2.size] = var_5;
    }

    if ( var_2.size == 0 )
        return undefined;

    if ( isdefined( var_1 ) )
        var_2 = scripts\engine\utility::array_remove( var_2, var_1 );

    var_4 = scripts\engine\utility::random( var_2 );
    return var_4;
}

_id_6788( var_0 )
{
    if ( !isdefined( game["infil"][var_0]["spots"] ) )
        return 0;

    var_1 = 0;

    foreach ( var_4, var_3 in game["infil"][var_0]["spots"] )
    {
        if ( _id_86B4( var_0, var_4 ) )
            var_1++;
    }

    return var_1;
}

_id_6789( var_0 )
{
    if ( !isdefined( game["infil"][var_0]["spots"] ) )
        return 0;

    var_1 = 0;
    var_2 = 0;

    foreach ( var_5, var_4 in game["infil"][var_0]["spots"] )
    {
        var_1++;

        if ( _id_86B4( var_0, var_5 ) )
            var_2++;
    }

    return var_2 / var_1;
}

_id_66C5( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in game["infil"][var_0]["spots"] )
    {
        if ( var_5["infil"] != var_1 )
            continue;

        if ( !_id_86B4( var_0, var_5 ) )
            var_2[var_2.size] = var_5;
    }

    if ( var_2.size == 0 )
        return undefined;

    var_4 = scripts\engine\utility::random( var_2 );
    return var_4;
}

_id_7E35( var_0 )
{
    self endon( "death" );
    self.players = scripts\engine\utility::array_add( self.players, var_0 );
    var_0 waittill( "death_or_disconnect" );
    self.players = scripts\engine\utility::array_remove( self.players, var_0 );
}

_id_B516()
{
    if ( _id_07A8::_id_609F( "infil_started" ) )
        return;

    if ( game["infil"][self.team].size == 0 )
        return;

    if ( self ishost() && getdvarint( "scr_infil_spectator" ) == 1 )
    {
        _id_B393();
        return;
    }

    var_0 = 0;
    var_1 = game["infil"][self.team]["spots"][0]["priority"] != -1;

    if ( level.gametype == "tac_ops" && isdefined( self._id_ED15._id_5094 ) )
        var_2 = _id_66C5( self.team, self._id_ED15._id_5094 );
    else if ( var_0 )
        var_2 = _id_6760( self.team );
    else if ( var_1 )
        var_2 = _id_675D( self.team );
    else
        var_2 = _id_66C4( self.team );

    var_3 = getdvarint( "scr_infil_reserve_seat", -1 );

    if ( var_3 != -1 )
    {
        if ( scripts\engine\utility::is_equal( self, level.player ) )
            var_2 = var_3;
        else
            var_2 = _id_66C4( self.team, var_3 );
    }

    if ( !isdefined( var_2 ) )
        return;

    var_4 = _id_B557( self, var_2 );
    var_4["infil"] thread _id_7E35( self );
    self notify( "player_added_to_infil" );
    self._id_7E09 = var_4["infil"];
    self thread [[ var_4["callback"] ]]( var_4["infil"], var_4["seat"] );
    self setclientomnvar( "ui_player_in_infil", 1 );
    thread _id_AB45();
    thread _id_3922();
    _id_B393();
}

_id_3922()
{
    self endon( "disconnect" );
    level waittill( "prematch_done" );
    self _meth_8636( "iw8_playermotion_mp" );
    self _meth_84AB( "normal" );
}

_id_257F()
{
    self endon( "disconnect" );
    self._id_46C1 = 1;
    level waittill( "prematch_over" );
    self._id_46C1 = 0;
}

_id_B393()
{

}

_id_7E3E()
{
    setomnvar( "ui_in_infil", 3 );
    level waittill( "infil_started" );
    var_0 = _func_00BE( "ui_always_show_nameplates" );
    setomnvar( "ui_always_show_nameplates", 1 );

    if ( !isdefined( level._id_2DCE ) )
    {
        _func_01E5( "ui_skip_loadout", 0 );
        level._id_2DCE = undefined;
    }

    level thread _id_7E3F();
    var_1 = getdvarint( "#x32ffe930f83bee667" );
    var_2 = getdvarint( "#x3c7ddb09585c5a055" );
    var_3 = getdvarint( "#x3ab3d8fbdc5691bb" );
    setdvar( "#x32ffe930f83bee667", 0 );
    setdvar( "#x3c7ddb09585c5a055", 1 );
    setdvar( "#x3ab3d8fbdc5691bb", 1 );
    level waittill( "prematch_done" );
    var_4 = scripts\mp\utility\player::_id_1634();

    foreach ( var_6 in level.players )
    {
        if ( var_4 )
        {
            if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "showMiniMap" ) )
                var_6 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "showMiniMap" ) ]]();

            continue;
        }

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "hideMiniMap" ) )
            var_6 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "hideMiniMap" ) ]]();
    }

    setomnvar( "ui_in_infil", -1 );
    setomnvar( "ui_always_show_nameplates", var_0 );
    setdvar( "#x32ffe930f83bee667", var_1 );
    setdvar( "#x3c7ddb09585c5a055", var_2 );
    setdvar( "#x3ab3d8fbdc5691bb", var_3 );
}

_id_7E3F()
{
    wait( level._id_BBA0 - 5 );
    setomnvar( "ui_in_infil", 2 );
}

_id_1631()
{
    var_0 = self _meth_8586();

    if ( var_0 == "AR" )
        var_1 = "default1";
    else if ( var_0 == "SMG" )
        var_1 = "default2";
    else if ( var_0 == "LMG" )
        var_1 = "default3";
    else
    {
        var_2 = [];
        var_2[0] = "default1";
        var_2[1] = "default2";
        var_2[2] = "default3";
        var_1 = scripts\engine\utility::random( var_2 );
    }

    self.pers["class"] = var_1;
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self._id_8F98 = self.pers["lastClass"];
    return var_1;
}

#using_animtree("script_model");

_id_7E36( var_0, var_1, var_2 )
{
    self._id_1887 = var_0;
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3.player = self;
    self._id_B591 = var_3;
    self._id_B591 setmodel( var_1 );
    self._id_B591 hide();
    self._id_B591._id_1887 = var_0;
    self._id_B591 useanimtree( #animtree );
    self._id_B591._id_10D17 = _id_0A6B::_id_7498;
    self._id_B591._id_36F3 = _id_0A6B::_id_740B;
    self._id_B591._id_4C7B = _id_0A6B::_id_741A;
    self playerlinktodelta( self._id_B591, "tag_player", 1.0, 0, 0, 0, 0, 1 );

    if ( isdefined( var_2 ) && var_2 )
        self _meth_8271( self._id_B591 );

    self notify( "rig_created" );
    scripts\engine\utility::waittill_any_2( "remove_rig", "player_free_spot" );

    if ( isdefined( self ) )
    {
        if ( isdefined( var_2 ) && var_2 )
            self _meth_8271( undefined );

        self unlink();
    }

    if ( isdefined( var_3 ) )
        var_3 delete();
}

_id_7E32( var_0, var_1, var_2 )
{
    foreach ( var_4 in self.players )
        var_4 playsoundtoplayer( var_0, var_4 );
}

_id_7E46()
{
    level endon( "game_ended" );
    level endon( "force_end" );
    level waittill( "match_start_real_countdown" );
    setomnvar( "ui_in_infil", 1 );
    wait 2.0;
    _id_07A8::_id_60A2( "infil_started" );

    if ( getdvarint( "scr_infil_interactive_slowmo", 0 ) == 1 )
        level thread _id_9A08();

    if ( getdvarint( "scr_infil_print_start", 0 ) == 1 )
    {
        foreach ( var_1 in level.players )
            iprintlnbold( "!-!-!-!-!-INFIL BEGIN-!-!-!-!-!" );
    }
}

_id_7E3D( var_0, var_1 )
{
    if ( _id_07A8::_id_609F( "infil_started" ) )
        return;

    self notify( "infil_scene_fade_in" );
    self endon( "infil_scene_fade_in" );
    self setclientomnvar( "ui_world_fade", 1.0 );
    self endon( "disconnect" );
    _id_07A8::_id_60A3( "infil_started" );

    if ( isdefined( var_0 ) && var_0 > 0.0 )
        wait( var_0 );

    var_2 = 1.0;

    while ( var_2 > 0.0 )
    {
        var_2 = var_2 - level._id_5F1B;
        var_2 = max( var_2, 0.0 );
        self setclientomnvar( "ui_world_fade", var_2 );
        waitframe();
    }
}

_id_76E1( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_0 endon( "death" );

    if ( isdefined( var_0._id_759C ) )
        return;
    else
        var_0._id_759C = 1;

    var_0 scripts\engine\utility::_id_036D();
    var_0 notify( "start_vehiclepath" );
    var_0 notify( "start_dynamicpath" );
}

_id_1022B( var_0, var_1, var_2 )
{
    self notify( "newpath" );
    self endon( "newpath" );
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( isdefined( var_0 ) )
        self._id_1D5B = var_0;

    var_3 = self._id_1D5B;
    self._id_41B7 = self._id_1D5B;

    if ( !isdefined( var_3 ) )
        return;

    var_4 = var_3;

    if ( var_1 )
        self waittill( "start_dynamicpath" );

    if ( isdefined( var_2 ) )
    {
        var_5 = spawnstruct();
        var_5.origin = ( self.origin[0], self.origin[1], self.origin[2] + var_2 );
        _id_7742( var_5, undefined );
    }

    var_6 = undefined;
    var_7 = var_3;
    var_8 = _id_6626( var_3 );

    while ( isdefined( var_7 ) )
    {
        if ( isdefined( var_7._id_CE0B ) )
            _id_C097( var_7 );

        if ( isdefined( var_7._id_0373 ) )
            _id_D273( var_7 );

        _id_7742( var_7, var_6, var_2 );

        if ( !isdefined( self ) )
            return;

        self._id_41B7 = var_7;
        var_7 notify( "trigger", self );

        if ( isdefined( var_7._id_CD74 ) )
        {
            self _meth_83BB( var_7._id_CD74 );

            if ( var_7._id_CD74 == "faster" )
                self setmaxpitchroll( 25, 50 );
        }

        if ( !isdefined( self ) )
            return;

        if ( isdefined( var_7._id_CE70 ) )
            self._id_CE70 = var_7._id_CE70;

        if ( isdefined( var_7._id_CE98 ) )
        {
            self notify( "unload" );
            scripts\engine\utility::_id_108F3( "unloaded", self._id_F974 );
        }

        if ( self _meth_8433() )
        {
            if ( isdefined( var_7._id_CE0C ) )
                self._id_04AE = var_7._id_CE0C;
        }

        if ( isdefined( var_7._id_CD3E ) )
        {
            scripts\engine\utility::_id_5C04( var_7._id_CD3E );

            if ( isdefined( var_7._id_CCF2 ) )
                wait( var_7._id_CCF2 );

            self notify( "delay_passed" );
        }

        if ( isdefined( self._id_D274 ) )
        {
            self._id_D274 = undefined;
            self _meth_807D();
        }

        var_6 = var_7;

        if ( !isdefined( var_7.target ) )
            break;

        var_7 = [[ var_8 ]]( var_7.target );

        if ( !isdefined( var_7 ) )
        {
            var_7 = var_6;
            break;
        }
    }

    self notify( "reached_dynamic_path_end" );

    if ( isdefined( self._id_CEA1 ) )
        self delete();
}

_id_7742( var_0, var_1, var_2 )
{
    self endon( "newpath" );

    if ( isdefined( var_0._id_CE98 ) || isdefined( var_0._id_CD8D ) )
    {
        var_3 = 0;

        if ( isdefined( var_0._id_CD8D ) )
        {
            scripts\engine\utility::_id_5454( "landed" );

            if ( isdefined( self._id_F96D ) )
                var_3 = self._id_F96D;
        }
        else if ( isdefined( var_0._id_CE98 ) && isdefined( self._id_F96B ) )
            var_3 = self._id_F96B;
        else if ( isdefined( var_0._id_CE98 ) && isdefined( self._id_F96C ) )
        {
            var_4 = scripts\common\utility::_id_71B7( var_0.origin );
            var_3 = var_0.origin[2] - var_4[2];

            if ( var_3 >= self._id_F96C )
                var_3 = self._id_F96C;
            else if ( isdefined( self._id_F96A ) && var_3 < self._id_F96A )
                var_3 = self._id_F96A;
        }

        var_0._id_0333 = 2;

        if ( isdefined( var_0._id_718C ) )
            var_0.origin = var_0._id_718C + ( 0, 0, var_3 );
        else
        {
            var_5 = scripts\common\utility::_id_71B7( var_0.origin ) + ( 0, 0, var_3 );

            if ( var_5[2] > var_0.origin[2] - 2000 )
                var_0.origin = scripts\common\utility::_id_71B7( var_0.origin ) + ( 0, 0, var_3 );
        }

        self _meth_832C( 0, 0, 0 );
    }

    if ( isdefined( var_1 ) )
    {
        var_6 = var_1._id_CC82;
        var_7 = var_1._id_03C7;
        var_8 = var_1._id_CC7C;
        var_9 = var_1._id_CCE9;
    }
    else
    {
        var_6 = undefined;
        var_7 = undefined;
        var_8 = undefined;
        var_9 = undefined;
    }

    var_10 = isdefined( var_0._id_CE62 ) && var_0._id_CE62;
    var_11 = isdefined( var_0._id_CE98 );
    var_12 = isdefined( var_0._id_CD3E ) && !scripts\engine\utility::_id_5BE0( var_0._id_CD3E );
    var_13 = !isdefined( var_0.target );
    var_14 = isdefined( var_0._id_036D );

    if ( isdefined( var_0.angles ) )
        var_15 = var_0.angles[1];
    else
        var_15 = 0;

    if ( self.health <= 0 )
        return;

    var_16 = var_0.origin;

    if ( isdefined( var_2 ) )
        var_16 = ( var_16[0], var_16[1], var_16[2] + var_2 );

    if ( isdefined( self._id_77A3 ) )
        var_16 = ( var_16[0], var_16[1], self._id_77A3 );

    self _meth_8432( var_16, var_7, var_8, var_9, var_0._id_CD6A, var_0._id_CC8F, var_15, var_6, var_14, var_10, var_11, var_12, var_13 );

    if ( isdefined( var_0._id_0333 ) )
    {
        self setneargoalnotifydist( var_0._id_0333 );
        scripts\engine\utility::waittill_any_2( "near_goal", "goal" );
    }
    else
        self waittill( "goal" );

    if ( isdefined( var_0._id_CD35 ) )
    {
        if ( !isdefined( level._id_776A ) )
        {

        }

        thread [[ level._id_776A ]]( var_0 );
    }

    var_0 scripts\engine\utility::_id_036D();

    if ( isdefined( self._id_AEB6 ) )
        scripts\engine\utility::_id_4773( var_0 );

    self notify( "continuepath" );
}

_id_6626( var_0 )
{
    var_1 = ::_id_6499;

    if ( isdefined( var_0.target ) )
    {
        if ( isdefined( _id_6497( var_0.target ) ) )
            var_1 = ::_id_6497;

        if ( isdefined( _id_6498( var_0.target ) ) )
            var_1 = ::_id_6498;
    }

    return var_1;
}

_id_6499( var_0 )
{
    return _func_00E5( var_0, "targetname" );
}

_id_6498( var_0 )
{
    return scripts\engine\utility::_id_6D7A( var_0, "targetname" );
}

_id_6497( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        return var_1[randomint( var_1.size )];

    return undefined;
}

_id_D273( var_0 )
{
    var_1 = getent( var_0._id_0373, "script_linkname" );

    if ( !isdefined( var_1 ) )
        return;

    self setlookat( var_1 );
    self._id_D274 = 1;
}

_id_AE5D()
{
    if ( !isdefined( self._id_AEB4 ) )
        return 0.0;

    if ( isdefined( self._id_AEC7 ) )
        return self._id_AEC7;

    self._id_AEC7 = 0.0;
    var_0 = self._id_AEB4;
    var_1 = var_0._id_03C7;

    for (;;)
    {
        if ( isdefined( var_0._id_CE98 ) )
            break;

        if ( !isdefined( var_0.target ) )
            break;

        var_2 = scripts\engine\utility::_id_6D7A( var_0.target, "targetname" );

        if ( !isdefined( var_2 ) )
            break;

        var_3 = distance( var_0.origin, var_2.origin );

        if ( isdefined( var_0._id_03C7 ) )
            var_1 = var_0._id_03C7;

        var_4 = 17.6;
        var_5 = 1.1;
        self._id_AEC7 = self._id_AEC7 + var_3 * var_5 / ( var_1 * var_4 );
        var_0 = var_2;
    }

    return self._id_AEC7;
}

_id_C097( var_0 )
{
    var_1 = strtok( var_0._id_CE0B, "," );

    foreach ( var_3 in var_1 )
    {
        var_4 = strtok( var_3, ":" );

        if ( !isdefined( var_4 ) )
            return;

        if ( var_4.size != 2 )
            return;

        thread _id_BD74( var_4[0], float( var_4[1] ) );
    }
}

_id_BD74( var_0, var_1 )
{
    if ( !isdefined( self._id_F219 ) )
        self._id_F219 = [];

    if ( var_1 > 0 )
        wait( var_1 );

    switch ( var_0 )
    {
        case "shake_low":
            self._id_F219["shake"] = "low";

            foreach ( var_3 in self._id_7E09.players )
                _id_0A6B::_id_2FC6( var_3 );

            break;
        case "shake_off":
            self._id_F219["shake"] = "off";

            foreach ( var_3 in self._id_7E09.players )
                _id_0A6B::_id_2FC7( var_3 );

            break;
        case "event_intro":
            self._id_7E09 notify( "event_intro" );
            break;
        case "event_shootingWindow_open":
            self._id_7E09 notify( "event_shootingWindow_open" );
            break;
        case "event_shootingWindow_closed":
            self._id_7E09 notify( "event_shootingWindow_closed" );
            break;
    }
}

_id_9A08()
{
    if ( !isdefined( level._id_8390 ) || !isdefined( level._id_8392 ) )
        return;

    wait( level._id_8390 );
    _func_01EB( 1, 0.5, 1 );
    wait( level._id_8392 );
    _func_01EB( 0.5, 1, 0.5 );
}

_id_107DD()
{
    _id_07A8::_id_60A3( "prematch_done" );

    while ( level._id_7E5A != 0 )
        waitframe();

    _func_039B();
}

_id_7E38( var_0, var_1 )
{
    if ( !isdefined( level._id_5DDB ) )
    {
        level._id_5DDB = [];
        setdvar( "scr_spawnbots", 11 );
    }

    level._id_5DDB[var_0] = var_1;
    _id_0A7A::_id_C27F( ::_id_5DDA );
}

_id_5DDA()
{
    var_0 = self;

    if ( isdefined( var_0._id_7E59 ) )
        return;

    if ( isdefined( var_0._id_7E09 ) )
        var_1 = var_0._id_7E09._id_048F;
    else
        var_1 = "infil_stairs";

    if ( getdvar( "scr_force_player_infil_team", "" ) != "" )
    {
        var_2 = getdvar( "scr_force_player_infil_team", "" );

        if ( scripts\engine\utility::is_equal( var_2, "axis" ) )
            var_1 = "infil_para";
        else
            var_1 = "infil_stairs";
    }

    var_3 = spawn( "script_model", level._id_5DDB[var_1] );
    var_3 setmodel( "tag_origin" );
    var_0 _meth_805E( var_3, "tag_origin", 1, 1 );
    var_0._id_7E59 = var_3;
    var_0 thread _id_C9BD( var_3, var_1 );
}

_id_C9BD( var_0, var_1 )
{
    if ( !isdefined( var_0._id_AC76 ) )
        var_0._id_AC76 = var_0.origin;

    for (;;)
    {
        var_2 = [];
        wait 0.25;

        foreach ( var_4 in level.players )
        {
            if ( !isdefined( self._id_7E09 ) )
                continue;

            if ( !isdefined( var_4._id_7E09 ) )
                continue;

            if ( scripts\engine\utility::is_equal( var_4._id_7E09._id_048F, var_1 ) )
                var_2[var_2.size] = var_4.origin;
        }

        if ( var_2.size == 0 )
            continue;

        var_6 = _func_0016( var_2 );
        var_7 = vectortoangles( var_6 - var_0.origin );
        var_0 rotateto( var_7, 0.5, 0.1, 0.1 );
    }
}
