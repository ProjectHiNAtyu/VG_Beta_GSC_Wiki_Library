// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_4034( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_EA0F = var_0;
    var_2.owner = var_1;
    var_2._id_7C71 = _id_6E05( var_1 );
    var_2._id_9355 = _id_6988();
    var_2._id_0369 = 0;
    var_2._id_DA5E = 0;
    var_2._id_799A = 0;
    var_2.damage = 0;
    var_2._id_024B = 0;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "createCustomStreakData" ) )
        var_2 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "createCustomStreakData" ) ]]( var_2, var_0 );

    return var_2;
}

_id_6E05( var_0 )
{
    if ( !isdefined( var_0.pers["nextKillstreakID"] ) )
        var_0.pers["nextKillstreakID"] = 0;

    var_1 = var_0.pers["nextKillstreakID"];
    var_0.pers["nextKillstreakID"]++;
    return var_1;
}

_id_6988()
{
    if ( !isdefined( self.pers["deaths"] ) )
        return 0;

    return self.pers["deaths"];
}

_id_6AC7( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 1; var_2 <= 3; var_2++ )
    {
        var_3 = self._id_E9FC._id_EA11[var_2];

        if ( isdefined( var_3 ) && var_3._id_EA0F == var_0 )
        {
            var_1 = var_3;
            break;
        }
    }

    if ( isdefined( var_1 ) )
        return var_1._id_9355;

    return undefined;
}

_id_C2BA( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_8DAB ) )
        level._id_8DAB = [];

    if ( isdefined( level._id_8DAB[var_0] ) && isdefined( level._id_8DAB[var_0][var_1] ) )
        return;

    var_3 = 0;

    foreach ( var_5 in level._id_8DAB )
    {
        foreach ( var_7 in var_5 )
        {
            if ( var_2 == var_7 )
            {
                var_3 = 1;
                break;
            }
        }

        if ( istrue( var_3 ) )
            return;
    }

    level._id_8DAB[var_0][var_1] = var_2;
}

_id_0CCF( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_1 == "off" )
        var_2 = 0;
    else
        var_2 = level._id_8DAB[var_0][var_1];

    self setclientomnvar( "ui_killstreak_controls", var_2 );
}

_id_8DAE( var_0 )
{
    switch ( var_0 )
    {
        case "weapondrop":
        case "dronedrop":
        case "radar_drone_overwatch":
        case "scrambler_drone_guard":
        case "uav":
        case "directional_uav":
        case "counter_uav":
            return 1;
        default:
            return 0;
    }
}

_id_89EE( var_0 )
{
    switch ( var_0 )
    {
        case "pac_sentry":
        case "cruise_predator":
        case "radar_drone_recon":
        case "gunship":
        case "chopper_gunner":
            return 1;
        default:
            return 0;
    }
}

_id_8904( var_0 )
{
    switch ( var_0 )
    {
        case "multi_airstrike":
        case "nuke":
        case "scrambler_drone_guard":
        case "white_phosphorus":
            return 1;
        default:
            return 0;
    }
}

_id_89E0( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "ks_remote_device_mp":
        case "ks_remote_gunship_mp":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_E727( var_0, var_1 )
{
    var_2 = int( _func_021D( "mp/killstreakTable.csv", 1, var_0, 0 ) );
    self setclientomnvar( "ui_remote_control_sequence", var_2 );
    thread _id_EC81( var_1 );
}

_id_E93E( var_0, var_1 )
{
    self setclientomnvar( "ui_remote_control_sequence", -1 );
    thread _id_EC81( var_0, 1, var_1 );
}

_id_EC81( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self notify( "dof_set_tablet" );
    self endon( "dof_set_tablet" );

    if ( istrue( var_1 ) && !istrue( var_2 ) )
    {
        self _meth_865B();
        self _meth_865E( 1.8, 15, 20, 20 );
        self _meth_8660( 30, 5 );
    }

    if ( isdefined( var_0 ) && var_0 > 0 )
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_0 );

    if ( istrue( var_1 ) )
        self _meth_865C();
    else
    {
        self _meth_865B();
        self _meth_865E( 1.8, 15, 20, 20 );
        self _meth_8660( 30, 5 );
    }
}

_id_8DA5()
{
    if ( !isdefined( self.pers["useNVG"] ) )
        return;

    if ( self _meth_8630() )
    {
        self.pers["useNVG"] = 1;
        self.pers["killstreak_forcedNVGOff"] = 1;
        self _meth_8245( 1 );
    }
    else
    {
        self.pers["useNVG"] = 0;
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
}

_id_8DA1()
{
    if ( !isdefined( self.pers["useNVG"] ) )
        return;

    if ( istrue( self.pers["useNVG"] ) )
    {
        self _meth_8248( 1 );
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
}

_id_B85C( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isplayer( self ) )
        var_3 = self;
    else if ( isdefined( self.owner ) )
        var_3 = self.owner;

    if ( isdefined( var_2 ) && var_2 > 0 )
    {
        var_3 endon( "disconnect" );
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_2 );
    }

    if ( isdefined( var_3 ) )
    {
        if ( !isdefined( var_3._id_41AB ) || istrue( var_1 ) )
        {
            var_3 _id_0998::_id_AC2B( var_0 );
            var_3._id_41AB = var_0;
            var_3 thread _id_3962( 5 );
        }
    }
}

_id_3962( var_0 )
{
    self endon( "disconnect" );
    self notify( "clear_stored_dialog" );
    self endon( "clear_stored_dialog" );
    wait( var_0 );

    if ( isdefined( self._id_41AB ) )
        self._id_41AB = undefined;
}

_id_8D95( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "lpcFeatureGated" ) && [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "lpcFeatureGated" ) ]]() )
        return;

    _id_8D99();
    var_6 = undefined;

    if ( isdefined( var_4 ) && isdefined( var_5 ) )
        var_6 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "spawn", "addSpawnDangerZone" ) ]]( var_0, var_1, var_2, var_5, var_3, var_4, 1 );
    else if ( isdefined( var_5 ) )
        var_6 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "spawn", "addSpawnDangerZone" ) ]]( var_0, var_1, var_2, var_5, var_3, undefined, 1 );
    else
        var_6 = _id_8DA9( var_0, var_1, var_2, var_3 );

    self._id_4328 = var_6;
    return var_6;
}

_id_8DA9( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\cp_mp\utility\script_utility::issharedfuncdefined( "spawn", "addSpawnDangerZone" ) )
        return;

    var_4 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "spawn", "addSpawnDangerZone" ) ]]( var_0, var_1, var_2, undefined, var_3, level.players[randomint( level.players.size )], 1 );
    self._id_4328 = var_4;
    return var_4;
}

_id_8D99( var_0 )
{
    if ( !isdefined( var_0 ) && !isdefined( self._id_4328 ) )
        return;

    if ( !scripts\cp_mp\utility\script_utility::issharedfuncdefined( "spawn", "isSpawnDangerZoneAlive" ) || !scripts\cp_mp\utility\script_utility::issharedfuncdefined( "spawn", "removeSpawnDangerZone" ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_4328;

    if ( isdefined( var_0 ) && [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "spawn", "isSpawnDangerZoneAlive" ) ]]( var_0 ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "spawn", "removeSpawnDangerZone" ) ]]( var_0 );

    self._id_4328 = undefined;
}

_id_E9FA( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = scripts\engine\trace::_id_3EC3( 0, 1, 0, 1, 1, 0 );

    if ( scripts\engine\trace::ray_trace_passed( var_0, var_1, var_2, var_4 ) )
        var_3 = 1;

    return var_3;
}

_id_EF74( var_0 )
{
    foreach ( var_2 in level._id_EF86 )
    {
        if ( var_2 == var_0 )
            continue;

        if ( isdefined( level._id_F8F5 ) && isdefined( level._id_F8F5[var_2] ) && level._id_F8F5[var_2].size > 0 )
        {
            foreach ( var_4 in level._id_F8F5[var_2] )
            {
                if ( !isdefined( var_4 ) )
                    continue;

                if ( var_4._id_F901 == "counter_uav" )
                    return 0;
            }
        }
    }

    if ( isdefined( level._id_F8F5 ) && isdefined( level._id_F8F5[var_0] ) && level._id_F8F5[var_0].size > 0 )
    {
        foreach ( var_4 in level._id_F8F5[var_0] )
        {
            if ( !isdefined( var_4 ) )
                continue;

            if ( var_4._id_F901 == "uav" || var_4._id_F901 == "directional_uav" )
                return 1;
        }
    }

    return 0;
}

_id_EF75( var_0 )
{
    if ( isdefined( level._id_F8F5 ) && isdefined( level._id_F8F5[var_0] ) && level._id_F8F5[var_0].size > 0 )
    {
        foreach ( var_2 in level._id_F8F5[var_0] )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( var_2._id_F901 == "uav" || var_2._id_F901 == "directional_uav" )
                return 1;
        }
    }

    return 0;
}

_id_53F3( var_0 )
{
    if ( isdefined( level._id_EB97 ) && level._id_EB97.size > 0 )
    {
        foreach ( var_2 in level._id_EB97 )
        {
            if ( level.teambased && var_2.team == var_0 )
                continue;

            if ( var_2._id_7854 == "scrambler_drone_guard" )
                return 1;
        }
    }

    return 0;
}

_id_FD6F()
{
    var_0 = [];

    foreach ( var_2 in level._id_EF86 )
        var_0[var_2] = _id_EF74( var_2 );

    foreach ( var_5 in level.players )
    {
        if ( !isdefined( var_5.team ) || var_5.team == "spectator" || var_5.team == "follower" || var_5.team == "free" )
        {
            var_5 setclientomnvar( "ui_show_hardcore_minimap", 0 );
            continue;
        }

        var_5 setclientomnvar( "ui_show_hardcore_minimap", var_0[var_5.team] );
    }
}

_id_8AA3( var_0 )
{
    if ( !isdefined( level._id_F8F5 ) )
        return 0;

    if ( !isdefined( level._id_F8F5[var_0] ) )
        return 0;

    return level._id_F8F5[var_0].size > 0;
}

_id_6AC0( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "airdrop_multiple":
        case "airdrop":
            var_1 = "s4_deploy_airdrop_mp";
            break;
        case "juggernaut":
            var_1 = "s4_ks_deploy_flamenaut_mp";
            break;
        case "bradley":
        case "radar_drone_overwatch":
        case "white_phosphorus":
        case "uav":
        case "directional_uav":
        case "chopper_support":
            var_1 = "s4_ks_gesture_generic_mp";
            break;
        case "toma_strike":
            var_1 = "s4_ks_targeting_radio_mp";
            break;
        case "precision_airstrike":
            var_1 = "s4_binoculars_mp";
            break;
        case "cruise_predator":
        case "gunship":
        case "chopper_gunner":
            var_1 = "ks_remote_device_mp";
            break;
        case "pac_sentry":
            var_1 = "s4_ks_remote_goliath_mp";
            break;
        case "hover_jet":
        case "scrambler_drone_guard":
            var_1 = "ks_remote_map_mp";
            break;
        case "manual_turret":
            var_1 = "deploy_manual_turret_mp";
            break;
        case "sentry_gun":
            var_1 = "deploy_sentry_mp";
            break;
        case "nuke":
            var_1 = "ks_remote_nuke_mp";
            break;
    }

    return var_1;
}

_id_6AC3( var_0 )
{
    var_1 = [];

    switch ( var_0 )
    {
        case "juggernaut":
            var_1 = [ "s4_gw_flima35_mp" ];
            break;
        case "manual_turret":
            var_1 = [ "manual_turret_mp" ];
            break;
        case "sentry_gun":
            var_1 = [ "sentry_turret_mp" ];
            break;
    }

    return var_1;
}

_id_6B8D( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4.team == var_0 )
            var_2++;
    }

    return var_2;
}

_id_6ABC()
{
    if ( isdefined( scripts\cp_mp\utility\game_utility::_id_6AF9() ) )
        return scripts\cp_mp\utility\game_utility::_id_6AF8( "airstrikeheight" );

    var_0 = getentarray( "airstrikeheight", "targetname" );

    if ( var_0.size > 1 )
    {

    }

    return var_0[0];
}

_id_C6FF( var_0 )
{
    var_0 endon( "death_or_disconnect" );
    level endon( "game_ended" );

    if ( !var_0 scripts\cp_mp\utility\player_utility::_id_0C14() )
        return;

    var_1 = 0.5;

    if ( !isdefined( var_0._id_C6FA ) )
        return;

    while ( var_1 > 0 )
    {
        var_0 setplayerangles( ( var_0._id_C6FA[0], var_0._id_C6FA[1], 0 ) );
        var_1 = var_1 - 0.05;
        wait 0.05;
    }

    var_0._id_C6FA = undefined;
}

_id_C13C( var_0 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "challenges", "onKillStreakEnd" ) )
    {
        var_1 = var_0._id_A2A3;

        if ( isdefined( var_1 ) )
        {
            var_2 = var_1._id_EA0F;
            var_3 = gettime();
            var_4 = var_3 - var_1._id_0EC8;
            var_5 = var_0._id_024B;
            var_6 = 0;
            var_7 = 0;
            var_8 = 0;
            self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "challenges", "onKillStreakEnd" ) ]]( var_2, var_4, var_3, var_5, var_6, var_7, var_8 );
        }
    }

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "dlog", "killStreakExpired" ) )
    {
        var_1 = var_0._id_A2A3;

        if ( isdefined( var_1 ) )
        {
            var_9 = var_1._id_EA0D;
            var_10 = var_1._id_EA0F;
            var_11 = var_1._id_8862;
            var_3 = gettime();
            var_12 = self.origin;
            var_13 = istrue( var_0._id_5787 );
            var_14 = var_0._id_DA5E;
            var_15 = var_0._id_799A;
            var_16 = var_0._id_024B;
            var_17 = var_0._id_0369;
            [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "dlog", "killStreakExpired" ) ]]( self, var_9, var_10, var_11, var_3, var_12, var_13, var_14, var_15, var_16, var_17 );
        }
    }
}

_id_B6EF()
{
    var_0 = undefined;

    if ( isdefined( self._id_FFF1 ) )
        var_0 = [ self._id_FFF1 ];
    else
    {
        var_1 = self _meth_84A4();

        if ( isdefined( var_1 ) && isdefined( var_1.classname ) && var_1.classname == "script_vehicle" )
            var_0 = [ var_1 ];
    }

    return var_0;
}

_id_0C1B( var_0 )
{
    return isdefined( self._id_AFE4 ) && isdefined( self._id_AFE4[var_0] );
}

_id_C0A9( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        foreach ( var_3, var_2 in self._id_E9FC._id_EA11 )
        {
            if ( var_2._id_EA0F == var_0 && istrue( self._id_E9FC._id_EA11[var_3]._id_C0A6 ) )
                return 1;
        }
    }

    return 0;
}

_id_C0B0()
{
    if ( !isdefined( level._id_3E63._id_8E36 ) )
        level._id_3E63._id_8E36 = level._id_3E63._id_8E3B;

    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "radar_drone_overwatch", 100 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "scrambler_drone_guard", 100 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "uav", 100 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "body_armor", 100 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "precision_airstrike", 100 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "cruise_predator", 100 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "pac_sentry", 65 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "white_phosphorus", 65 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "multi_airstrike", 65 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "chopper_gunner", 35 );
    scripts\cp_mp\killstreaks\airdrop::_id_AD41( "directional_uav", 35 );
}

_id_C0AF()
{
    if ( isdefined( level._id_3E63._id_8E36 ) )
        level._id_3E63._id_8E3B = level._id_3E63._id_8E36;
}

shoulddisablekillstreakweaponswitch()
{
    if ( scripts\engine\utility::is_equal( level.gametype, "arena_evo" ) )
        return 1;

    return 0;
}

donttakekillstreakonladderuse( var_0 )
{
    if ( !scripts\engine\utility::is_equal( var_0, "non_temp_weapon_switch" ) )
        return 0;

    if ( !self isonladder() )
        return 0;

    return 1;
}
