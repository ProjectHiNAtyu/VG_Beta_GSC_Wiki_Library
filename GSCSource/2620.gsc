// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._effect["uav_exit"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["uav_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["counter_recon_hit"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level thread _id_0A03::_id_81C3();
    scripts\mp\killstreaks\killstreaks::_id_C25C( "s2_uav", ::_id_F7A1 );
}

_id_F8F9( var_0, var_1 )
{
    var_2 = randomint( 360 );
    var_3 = _id_6DFC( var_0.type );
    var_4 = _id_6DFD( var_0.type );
    var_5 = cos( var_2 ) * var_4;
    var_6 = sin( var_2 ) * var_4;
    var_7 = level._id_F8FC;

    if ( var_0.type == "counter_uav" )
        var_7 = level._id_4101;

    var_0 linkto( var_7, "tag_origin", ( var_5, var_6, var_3 ), ( 0, var_2 - 90, 0 ) );
    var_0 hide();
    var_0 dontinterpolate();
    waitframe();
    var_8 = var_0.origin;
    var_0 unlink();

    if ( 0 && isdefined( var_0._id_9F0C ) )
        var_0._id_9F0C _id_07E3::_id_D54A( 3000, 1 );

    var_9 = 2625.0;

    if ( var_0.type == "counter_uav" )
    {
        var_9 = 4200.0;
        thread _id_3D7C( var_0 );
    }

    if ( var_0.type == "s2_uav" )
        thread _id_F8EC( var_0, var_1 );

    var_0.origin = var_0.origin + -1 * anglestoforward( var_0.angles ) * var_9;
    var_0 moveto( var_8, 3 );
    var_0 rotateroll( 20, 0.05 );
    var_0 dontinterpolate();
    level notify( "uav_update" );
    var_0 _id_07E3::_id_108F4( "death", 3 );

    if ( isdefined( var_0 ) )
        var_0 linkto( var_7, "tag_origin" );
}

_id_F8FA( var_0, var_1 )
{
    var_0 unlink();
    var_2 = 2625.0;

    if ( var_0.type == "counter_uav" )
        var_2 = 4200.0;

    if ( var_0.type == "s2_uav" )
        thread _id_F8ED( var_0, var_1 );

    var_3 = var_0.origin + anglestoforward( var_0.angles ) * var_2;
    playfxontag( scripts\engine\utility::getfx( "uav_exit" ), var_0, "tag_origin" );
    var_0 notify( "leaving" );
    var_0._id_88EE = 1;

    if ( 0 && isdefined( var_0._id_9F0C ) )
        var_0._id_9F0C _id_07E3::_id_D54A( 3000, 0 );

    var_0 moveto( var_3, 3 );
    var_0 rotateroll( -20, 1.0 );
    var_0 _id_07E3::_id_108F4( "death", 2.0 );
    var_4 = _id_6DFB( var_0.type, var_0.team );

    if ( isdefined( var_4 ) )
    {
        var_0 setmodel( var_4 );
        var_0 _id_07E3::_id_D6B3( 1, 0, 1.0 );
    }

    wait 1.0;
    var_0 _id_0A04::_id_4839();

    if ( 0 && isdefined( var_0._id_9F0C ) )
        var_0._id_9F0C delete();

    var_0 _id_C52B();
    var_0 delete();
}

_id_6DFC( var_0 )
{
    var_1 = 0;

    switch ( scripts\cp_mp\utility\game_utility::_id_6B0E() )
    {
        case "mp_aachen_v2":
            var_1 = randomintrange( 2250, 2500 );
            break;
        case "mp_battleship_2":
            var_1 = randomintrange( 1500, 2000 );
            break;
        case "mp_carentan_s2":
            var_1 = randomintrange( 1750, 2250 );
            break;
        case "mp_canon_farm":
            var_1 = randomintrange( 1750, 2000 );
            break;
        case "mp_flak_tower":
            var_1 = randomintrange( 2500, 3000 );
            break;
        case "mp_france_cannon":
            var_1 = randomintrange( 1750, 2000 );
            break;
        case "mp_gibraltar_01":
        case "mp_gibraltar_02":
            var_1 = randomintrange( 2250, 2500 );
            break;
        case "mp_london":
            var_1 = randomintrange( 1750, 2000 );
            break;
        case "mp_sandbox_01":
            var_1 = randomintrange( 1400, 1850 );
            break;
        case "mp_hub_scorestreak_training":
        case "mp_scorstreak_training":
        case "mp_paris_s2":
        case "mp_forest_01":
        case "mp_d_day":
        case "mp_airship":
            var_1 = randomintrange( 3000, 3250 );
            break;
        default:
            var_1 = randomintrange( 2000, 2250 );
            break;
    }

    if ( isdefined( var_0 ) && var_0 == "counter_uav" )
        var_1 = var_1 + 1500;

    return var_1;
}

_id_6DFD( var_0 )
{
    var_1 = 0;

    switch ( scripts\cp_mp\utility\game_utility::_id_6B0E() )
    {
        case "mp_aachen_v2":
            var_1 = 3250;
            break;
        case "mp_carentan_s2_winter":
        case "mp_carentan_s2":
            var_1 = 3500;
            break;
        case "mp_canon_farm":
            var_1 = 4000;
            break;
        case "mp_flak_tower":
            var_1 = 4250;
            break;
        case "mp_forest_01":
            var_1 = 3500;
            break;
        case "mp_paris_s2":
            var_1 = 2500;
            break;
        case "mp_prague":
            var_1 = 3250;
            break;
        case "mp_sandbox_01":
            var_1 = 2000;
            break;
        case "mp_gibraltar_01":
        case "mp_hub_scorestreak_training":
        case "mp_scorstreak_training":
        case "mp_london":
        case "mp_france_village":
        case "mp_d_day":
        case "mp_wolfslair2":
        case "mp_wolfslair_free":
        case "mp_wolfslair":
        case "mp_gibraltar_02":
        case "mp_battleship_2":
        default:
            var_1 = 3000;
            break;
    }

    if ( isdefined( var_0 ) && var_0 == "counter_uav" )
        var_1 = var_1 + 2000;

    return var_1;
}

_id_6DFA( var_0, var_1 )
{
    if ( level.gametype == "onevone" )
        return 200000;

    if ( isdefined( var_1 ) && var_1 )
    {
        switch ( var_0 )
        {
            case "s2_uav":
                return 35;
            case "counter_uav":
                return 40;
            case "advanced_uav":
                return 45;
        }
    }
    else
    {
        switch ( var_0 )
        {
            case "s2_uav":
            case "counter_uav":
                return 30;
            case "advanced_uav":
                return 45;
        }
    }
}

_id_3D7C( var_0 )
{
    _id_07E3::_id_40D3( "ks_counter_uav_enter", undefined, var_0 );
    var_1 = _id_07E3::_id_40D4( "ks_counter_uav_loop", undefined, var_0, 1.5 );
    var_0 waittill( "leaving" );
    _id_07E3::_id_40D5( var_1, 1.5 );
    _id_07E3::_id_40D2( "ks_counter_uav_exit", undefined, var_0.origin );
}

_id_F8EC( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        _id_07E3::_id_40D3( "ks_uav_recon_plane_enter", [ var_1 ], var_0 );
}

_id_F8ED( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        _id_07E3::_id_A6C8( "ks_uav_recon_plane_exit", [ var_1 ], var_0 );
}

_id_F8F7( var_0, var_1, var_2, var_3 )
{
    self notify( "death" );
    _id_0A04::_id_4839();

    if ( 0 && isdefined( self._id_9F0C ) )
        self._id_9F0C delete();

    _id_C52B();
    self hide();
    thread _id_477A();
    _id_B902();

    if ( self.type == "counter_uav" )
    {
        var_4 = "counter_uav_destroyed";
        var_5 = "callout_destroyed_counter_uav";
        var_6 = "cuav_destroyed";
    }
    else
    {
        var_4 = "uav_destroyed";
        var_5 = "callout_destroyed_uav";
        var_6 = "uav_destroyed";
    }

    _id_07E3::_id_AB05( var_0, var_1, var_2, var_3, var_4, var_6, var_5, 1 );
}

_id_477A()
{
    waitframe();

    if ( isdefined( self ) )
        self delete();
}

_id_B902()
{
    var_0 = self.team;
    var_1 = anglestoforward( self.angles );

    if ( self.type == "counter_uav" )
    {
        if ( var_0 == "allies" )
        {
            if ( isdefined( self._id_8A75 ) )
            {
                if ( !isdefined( level._effect["counter_uav_explode_allies_chase"] ) )
                    level._effect["counter_uav_explode_allies_chase"] = loadfx( "vfx/explosion/vehicle_counter_uav_explosion_allies_chase" );

                playfx( scripts\engine\utility::getfx( "counter_uav_explode_allies_chase" ), self.origin, var_1 );
            }
            else
            {
                if ( !isdefined( level._effect["counter_uav_explode_allies"] ) )
                    level._effect["counter_uav_explode_allies"] = loadfx( "vfx/explosion/vehicle_counter_uav_explosion_allies" );

                playfx( scripts\engine\utility::getfx( "counter_uav_explode_allies" ), self.origin, var_1 );
                _id_07E3::_id_40D2( "ks_plane_destruct_explode", undefined, self.origin );
                _id_07E3::_id_40D4( "ks_plane_destruct_deathspin_long", undefined, self );
            }
        }
        else if ( isdefined( self._id_8A75 ) )
        {
            if ( !isdefined( level._effect["counter_uav_explode_axis_chase"] ) )
                level._effect["counter_uav_explode_axis_chase"] = loadfx( "vfx/explosion/vehicle_counter_uav_explosion_chase" );

            playfx( scripts\engine\utility::getfx( "counter_uav_explode_axis_chase" ), self.origin, var_1 );
        }
        else
        {
            if ( !isdefined( level._effect["counter_uav_explode_axis"] ) )
                level._effect["counter_uav_explode_axis"] = loadfx( "vfx/explosion/vehicle_counter_uav_explosion" );

            playfx( scripts\engine\utility::getfx( "counter_uav_explode_axis" ), self.origin, var_1 );
            _id_07E3::_id_40D2( "ks_plane_destruct_explode", undefined, self.origin );
            _id_07E3::_id_40D4( "ks_plane_destruct_deathspin_long", undefined, self );
        }
    }
    else if ( var_0 == "allies" )
    {
        if ( isdefined( self._id_8A75 ) )
        {
            if ( !isdefined( level._effect["uav_explode_allies_chase"] ) )
                level._effect["uav_explode_allies_chase"] = loadfx( "vfx/explosion/vehicle_uav_explosion_allies_chase" );

            playfx( scripts\engine\utility::getfx( "uav_explode_allies_chase" ), self.origin, var_1 );
        }
        else
        {
            if ( !isdefined( level._effect["uav_explode_allies"] ) )
                level._effect["uav_explode_allies"] = loadfx( "vfx/explosion/vehicle_uav_explosion_allies" );

            playfx( scripts\engine\utility::getfx( "uav_explode_allies" ), self.origin, var_1 );
            _id_07E3::_id_40D2( "ks_plane_destruct_explode", undefined, self.origin );
            _id_07E3::_id_40D4( "ks_plane_destruct_deathspin_long", undefined, self );
        }
    }
    else if ( isdefined( self._id_8A75 ) )
    {
        if ( !isdefined( level._effect["uav_explode_axis_chase"] ) )
            level._effect["uav_explode_axis_chase"] = loadfx( "vfx/explosion/vehicle_uav_explosion_chase" );

        playfx( scripts\engine\utility::getfx( "uav_explode_axis_chase" ), self.origin, var_1 );
    }
    else
    {
        if ( !isdefined( level._effect["uav_explode_axis"] ) )
            level._effect["uav_explode_axis"] = loadfx( "vfx/explosion/vehicle_uav_explosion" );

        playfx( scripts\engine\utility::getfx( "uav_explode_axis" ), self.origin, var_1 );
        _id_07E3::_id_40D2( "ks_plane_destruct_explode", undefined, self.origin );
        _id_07E3::_id_40D4( "ks_plane_destruct_deathspin_long", undefined, self );
    }
}

_id_F401()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "uav_update" );

        if ( level.teambased )
        {
            _id_FD71( "allies" );
            _id_FD71( "axis" );
        }
        else
            _id_FD70();

        level notify( "radar_status_change" );
    }
}

_id_6C96( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;

    if ( level.teambased )
    {
        var_4 = level._id_0F3D[var_0];
        var_6 = level._id_0F0E[var_0];
        var_5 = level._id_0F14[scripts\mp\utility\game::_id_6BC3( var_0 )];
    }
    else
    {
        var_4 = level._id_0F3D[var_1._id_723F];
        var_6 = level._id_0F0E[var_1._id_723F];

        foreach ( var_8 in level.players )
        {
            if ( var_8 == var_1 )
                continue;

            var_5 = var_5 + level._id_0F14[var_8._id_723F];
        }
    }

    var_10 = var_4;

    if ( var_6 > 0 )
        var_10 = 3;

    if ( getdvarint( "scr_game_radarMode" ) == 1 )
        var_10++;

    return int( clamp( var_10, _func_00E4(), _func_00E3() ) );
}

_id_FD71( var_0 )
{
    var_1 = _id_6C96( var_0 );
    _func_01F2( var_0, var_1 );
    var_2 = level._id_0F14[scripts\mp\utility\game::_id_6BC3( var_0 )];
    var_3 = 0;
    var_4 = var_1 > _func_00E0();
    var_5 = var_1 >= _func_00E2();
    var_6 = var_1 >= _func_00E1();

    if ( _id_07E3::_id_89BD() && _id_07E3::_id_86D6( level._id_BF4D ) )
        var_0 = scripts\mp\utility\game::_id_6BC3( var_0 );

    if ( var_3 )
        _func_001C( var_0 );
    else
        _func_024F( var_0 );

    _func_01F1( var_0, var_4 );

    if ( var_5 )
        level._id_0330[var_0] = "fast_radar";
    else
        level._id_0330[var_0] = "normal_radar";

    foreach ( var_8 in level.players )
    {
        if ( var_8.team != var_0 )
            continue;

        var_8._id_0330 = level._id_0330[var_0];
        var_8._id_5407 = level._id_0330[scripts\mp\utility\game::_id_6BC3( var_0 )];
        var_8._id_0331 = var_6;
        var_8 _id_FB45( var_4 );
    }
}

_id_FD70()
{
    foreach ( var_1 in level.players )
    {
        var_2 = var_1 _id_6C96( var_1.team, var_1 );
        var_3 = 0;

        foreach ( var_5 in level.players )
        {
            if ( var_5 == var_1 )
                continue;

            var_3 = var_3 + level._id_0F14[var_5._id_723F];
        }

        var_7 = 0;
        var_8 = var_2 > _func_00E0();
        var_9 = var_2 >= _func_00E2();
        var_10 = var_2 >= _func_00E1();
        var_1._id_0332 = var_2;
        var_1._id_022F = var_7;
        var_1._id_01FD = var_8;
        var_1._id_0331 = var_10;
        var_1 _id_FB45( var_8 );

        if ( var_9 )
        {
            var_1._id_0330 = "fast_radar";
            continue;
        }

        var_1._id_0330 = "normal_radar";
    }
}

_id_AB46()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !level.teambased )
        {
            level._id_0F3D[var_0._id_723F] = 0;
            level._id_0F14[var_0._id_723F] = 0;
            level._id_0F0E[var_0._id_723F] = 0;
            level._id_0330[var_0._id_723F] = "normal_radar";
        }

        if ( getdvarint( "#x33b8132c2bbd3f240", 0 ) )
        {

        }

        var_0 thread _id_AB65();
    }
}

_id_AB65()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        var_0 = 0;

        if ( level.teambased )
        {
            var_0 = level._id_0F14[scripts\mp\utility\game::_id_6BC3( self.team )];
            continue;
        }

        foreach ( var_2 in level.players )
        {
            if ( var_2 == self )
                continue;

            var_0 = var_0 + level._id_0F14[var_2._id_723F];
        }
    }
}

_id_FD4E()
{
    level endon( "game_ended" );

    while ( !isdefined( level._id_7E95 ) || level._id_7E95 > 5 )
        waitframe();

    level thread _id_EC13();
    level notify( "uav_update" );

    for (;;)
    {
        level waittill( "player_spawned" );
        level notify( "uav_update" );
    }
}

_id_EC13()
{
    level endon( "game_ended" );
    level endon( "disconnect" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        var_0 = _id_07E3::_id_10956();

        if ( level.gametype == "gun" || level.gametype == "blades" || level.gametype == "aon" || level.gametype == "oitc" )
        {
            _func_01D2( "scr_game_compassRadarUpdateTime", 9 );
            setdvar( "#x3b799b81a5da91cd0", 9 );
        }

        level notify( "uav_update" );
    }
}

_id_F7A1( var_0 )
{
    return _id_F7A2( var_0, "s2_uav" );
}

_id_F770( var_0 )
{
    return _id_F7A2( var_0, "s2_uav" );
}

_id_F763( var_0 )
{
    return _id_F7A2( var_0, "s2_uav" );
}

_id_F7A2( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
            return 0;
    }

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
            return 0;
    }

    if ( scripts\mp\utility\game::_id_8722() || var_1 != "counter_uav" && _id_07E3::_id_8AA4() )
        return 0;

    var_3 = self.team;

    if ( _id_07E3::_id_89BD() && _id_07E3::_id_86D6( level._id_BF4D ) )
        var_3 = scripts\mp\utility\game::_id_6BC3( var_3 );

    var_4 = 0;

    if ( level.teambased && level._id_F8F5[var_3].size > 5 || !level.teambased && level._id_F8F5.size > 10 )
    {
        scripts\mp\hud_message::_id_DCBD( "KILLSTREAKS/AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    _id_07E3::_id_978D( var_1, self.origin );

    if ( var_1 == "s2_uav" && getdvarint( "uav_redesigned", 0 ) )
    {
        var_5 = _id_D069( var_1 );

        if ( !isdefined( var_5 ) || !var_5 )
            return 0;

        return 1;
    }
    else if ( var_1 == "counter_uav" )
    {
        var_6 = _id_696C();

        if ( isdefined( var_6 ) )
        {
            var_6._id_8A75 = 1;
            var_6 setcandamage( 0 );
            level thread _id_90D3( self, var_3, var_6 );
            return 1;
        }
    }

    level thread _id_90EC( self, var_3, var_1 );
    return 1;
}

_id_1074( var_0, var_1 )
{
    if ( 0 )
    {
        self._id_9F0C = _id_07E3::_id_E286( "script_model", ( 0, 0, 0 ) );
        self._id_9F0C setmodel( "tag_origin" );
        self._id_9F0C _id_07E3::_id_D59F( var_0, var_1, 15, 15 );
        self._id_9F0C _id_07E3::_id_9502( self, "", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        self._id_9F0C hide();
    }
}

_id_90EC( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_model", level._id_F8FC gettagorigin( "tag_origin" ) );
    var_4 _meth_82F8( var_0 );
    var_4 _id_07E3::_id_9B12( 1 );
    var_4 hide();
    var_4 dontinterpolate();
    var_5 = _id_6DFF( var_2, var_1 );
    var_6 = _id_6DFB( var_2, var_1 );

    if ( isdefined( var_6 ) )
        var_4 thread _id_5899( var_6, var_5 );
    else
        var_4 setmodel( var_5 );

    var_7 = _id_6DF8( var_2, var_1 );

    if ( isdefined( var_7 ) && var_7 != "" )
        var_4 _meth_82CA( var_7 );

    var_4 thread _id_B8F0();
    var_4 thread _id_07E3::_id_D535( _id_0A04::_id_6C18( var_2 ), undefined, ::_id_F8F7, _id_0A04::_id_AB83, 1 );

    if ( level.gametype == "onevone" )
        var_4 setcandamage( 0 );

    if ( isdefined( var_3 ) )
        var_4._id_AD89 = 1;
    else
        var_4.owner = var_0;

    var_4._id_90EB = gettime();
    var_4.type = var_2;
    var_4._id_F901 = var_2;
    var_4.team = var_1;
    var_4 _id_07E3::_id_998A( var_1, undefined, undefined, 1 );
    var_4 thread _id_0A04::_id_3FF1();
    var_4 thread _id_0A04::_id_743E();
    var_4 _id_1159();
    var_4 _id_105F( var_2 );

    if ( isdefined( var_3 ) )
    {
        foreach ( var_9 in level.players )
        {
            if ( isdefined( var_9.team ) && var_9.team == var_1 )
                var_4 _id_1074( var_9, _id_6DFE( var_2 ) );
        }
    }
    else
        var_4 _id_1074( var_4.owner, _id_6DFE( var_2 ) );

    level notify( "uav_update" );
    level thread _id_07E3::_id_FBF1();
    thread _id_F8F9( var_4, var_0 );
    var_4 thread _id_FD6E();
    var_4 thread _id_3880( var_2, var_0 );
    var_11 = 0;

    if ( ( !isdefined( var_3 ) || var_3 == 0 ) && isdefined( var_4.owner ) )
    {
        var_4 thread _id_ABB3();
        var_11 = var_4.owner _id_07E3::_hasperk( "specialty_improvedstreaks" );
    }

    var_4 _id_07E3::_id_108F4( "death", _id_6DFA( var_2, var_11 ) );

    if ( isdefined( var_4 ) )
        var_4 notify( "cleanup_uav" );
}

_id_ABB3()
{
    level endon( "game_ended" );
    self endon( "cleanup_uav" );
    self.owner scripts\engine\utility::_id_1087D( "disconnect", "joined_team", "joined_spectators" );
    self notify( "cleanup_uav" );
}

_id_3880( var_0, var_1 )
{
    level endon( "game_ended" );
    self waittill( "cleanup_uav" );

    if ( var_0 == "counter_uav" )
        var_2 = "cuav_ended";
    else
        var_2 = "uav_ended";

    if ( isdefined( var_1 ) )
        var_1 thread _id_07E3::_id_9120( var_2 );

    _id_C45A( var_0 );
    level notify( "uav_update" );

    if ( self._id_013D < self.maxhealth && !isdefined( self._id_8A75 ) )
        thread _id_F8FA( self, var_1 );
}

_id_FD6E()
{
    self endon( "death" );

    for (;;)
    {
        level scripts\engine\utility::_id_108C3( "joined_team", "uav_update" );
        self hide();

        foreach ( var_1 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_1.team != self.team || 1 )
                {
                    self showtoplayer( var_1 );

                    if ( 0 && isdefined( self._id_9F0C ) )
                        self._id_9F0C showtoplayer( var_1 );
                }

                continue;
            }

            if ( isdefined( self.owner ) && var_1 == self.owner )
                continue;

            self showtoplayer( var_1 );

            if ( 0 && isdefined( self._id_9F0C ) )
                self._id_9F0C showtoplayer( var_1 );
        }
    }
}

_id_4049()
{
    var_0 = getentarray( "minimap_corner", "targetname" );

    if ( var_0.size )
        var_1 = _id_07E3::_id_5AC1( var_0[0].origin, var_0[1].origin );
    else
        var_1 = ( 0, 0, 0 );

    level._id_F8FC = spawn( "script_model", var_1 );
    level._id_F8FC setmodel( "c130_zoomrig" );
    level._id_F8FC.angles = ( 0, 115, 0 );
    level._id_F8FC hide();
    level._id_F8FC._id_045A = "uavrig_script_model";
    var_2 = 20053.5 / _id_6DFD();
    level._id_F8FC thread _id_C91C( var_2 );
    level._id_4101 = spawn( "script_model", var_1 );
    level._id_4101 setmodel( "c130_zoomrig" );
    level._id_4101.angles = ( 0, 115, 0 );
    level._id_4101 hide();
    var_2 = 40107.0 / _id_6DFD( "counter_uav" );
    level._id_4101 thread _id_C91C( var_2 );
}

_id_C91C( var_0 )
{
    var_1 = 60;
    var_2 = -1 * var_0 * var_1;

    for (;;)
    {
        self rotateyaw( var_2, var_1 );
        wait( var_1 );
    }
}

_id_B8F0()
{
    self endon( "death" );
    level endon( "game_ended" );
    playfxontag( level._effect["uav_trail"], self, "tag_origin" );
}

_id_5899( var_0, var_1 )
{
    self endon( "death" );
    self setmodel( var_0 );
    _id_07E3::_id_D6B3( 0, 1, 1.0 );
    wait 1.0;
    self setmodel( var_1 );
}

_id_6DFF( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "s2_uav":
        case "advanced_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
                return "usa_recon_pipercub_ai";
            else
                return "ger_recon_storch";
        case "counter_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
            {
                return "usa_bomber_p61_blackwidow_vista";
                return;
            }

            return "ger_recon_messerschmitt100_vista";
            return;
    }
}

_id_6DFB( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "s2_uav":
        case "advanced_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
                return "usa_recon_pipercub_ai_fade";
            else
                return "ger_recon_storch_fade";
        case "counter_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
            {
                return "usa_bomber_p61_blackwidow_vista_fade";
                return;
            }

            return "ger_recon_messerschmitt100_vista_fade";
            return;
    }
}

_id_6DF8( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "s2_uav":
        case "advanced_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
                return "ks_recon_usa";
            else
                return "ks_recon_ger";
        case "counter_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
            {
                return "ks_counter_intelligence_usa";
                return;
            }

            return "ks_counter_intelligence_ger";
            return;
    }
}

_id_6DF9( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "s2_uav":
        case "advanced_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
                return "ks_recon_usa_animated";
            else
                return "ks_recon_ger_animated";
        case "counter_uav":
            if ( isdefined( var_1 ) && var_1 == "allies" )
            {
                return "ks_counter_intelligence_usa_animated";
                return;
            }

            return "ks_counter_intelligence_ger_animated";
            return;
    }
}

_id_6DFE( var_0 )
{
    switch ( var_0 )
    {
        case "s2_uav":
        case "advanced_uav":
            return "scorestreak_minimap_recon";
        case "counter_uav":
            return "scorestreak_minimap_fighter";
    }
}

_id_81D2()
{
    if ( level.teambased )
    {
        level._id_0330["allies"] = "normal_radar";
        level._id_0330["axis"] = "normal_radar";
        level._id_0F3D["allies"] = 0;
        level._id_0F3D["axis"] = 0;
        level._id_0F14["allies"] = 0;
        level._id_0F14["axis"] = 0;
        level._id_0F0E["allies"] = 0;
        level._id_0F0E["axis"] = 0;
        level._id_F8F5["allies"] = [];
        level._id_F8F5["axis"] = [];
    }
    else
    {
        level._id_0330 = [];
        level._id_0F3D = [];
        level._id_0F14 = [];
        level._id_0F0E = [];
        level._id_F8F5 = [];
    }

    level._id_F8F4 = 15;
    level._id_F8F3 = 0;
}

_id_1159()
{
    var_0 = self.team;

    if ( level.teambased )
        level._id_F8F5[var_0][level._id_F8F5[var_0].size] = self;
    else
        level._id_F8F5[self.owner._id_723F + "_" + gettime()] = self;
}

_id_C52B()
{
    _id_07E3::_id_9B12( 0 );
    var_0 = self.team;

    if ( level.teambased )
        level._id_F8F5[var_0] = _id_07E3::array_combine( self, level._id_F8F5[var_0] );
    else
        level._id_F8F5 = _id_07E3::array_combine( self, level._id_F8F5 );
}

_id_105F( var_0 )
{
    _id_1175( var_0, 1 );

    if ( var_0 == "counter_uav" )
    {
        if ( level.teambased )
            level._id_EF66[scripts\mp\utility\game::_id_6BC3( self.team )] = 1;
        else
            level._id_3D80 = self.owner;

        level thread _id_07E3::_id_FBFE();
    }
}

_id_C45A( var_0 )
{
    _id_1175( var_0, -1 );

    if ( var_0 == "counter_uav" )
    {
        if ( level.teambased )
        {
            if ( level._id_0F14[self.team] == 0 )
                level._id_EF66[scripts\mp\utility\game::_id_6BC3( self.team )] = 0;
        }
        else if ( isdefined( self.owner ) && level._id_0F14[self.owner._id_723F] == 0 )
            level._id_3D80 = undefined;

        level thread _id_07E3::_id_FBFE();
    }
}

_id_1175( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "s2_uav":
            if ( level.teambased )
                level._id_0F3D[self.team] = level._id_0F3D[self.team] + var_1;
            else if ( isdefined( self.owner ) )
                level._id_0F3D[self.owner._id_723F] = level._id_0F3D[self.owner._id_723F] + var_1;

            break;
        case "counter_uav":
            if ( level.teambased )
                level._id_0F14[self.team] = level._id_0F14[self.team] + var_1;
            else if ( isdefined( self.owner ) )
                level._id_0F14[self.owner._id_723F] = level._id_0F14[self.owner._id_723F] + var_1;

            break;
        case "advanced_uav":
            if ( level.teambased )
                level._id_0F0E[self.team] = level._id_0F0E[self.team] + var_1;
            else if ( isdefined( self.owner ) )
                level._id_0F0E[self.owner._id_723F] = level._id_0F0E[self.owner._id_723F] + var_1;

            break;
    }
}

_id_3F92()
{
    if ( !isdefined( self._id_EF56 ) )
    {
        self._id_EF56 = newclienthudelem( self );
        self._id_EF56.x = -350;
        self._id_EF56.y = -70;
        self._id_EF56.alignx = "center";
        self._id_EF56.aligny = "middle";
        self._id_EF56.horzalign = "center";
        self._id_EF56.vertalign = "middle";
        self._id_EF56.fontscale = 1.0;
        self._id_EF56.alpha = 1.0;
        self._id_AC33 = newclienthudelem( self );
        self._id_AC33.x = -320;
        self._id_AC33.y = -70;
        self._id_AC33.alignx = "center";
        self._id_AC33.aligny = "middle";
        self._id_AC33.horzalign = "center";
        self._id_AC33.vertalign = "middle";
        self._id_AC33.fontscale = 1.0;
        self._id_AC33.alpha = 1.0;
        thread _id_FC2C();
    }
}

_id_FC2C()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( level.gametype == "onevone" || self _meth_876B( "ui_hide_minimap" ) )
        {
            self._id_EF56.alpha = 0.0;
            self._id_AC33.alpha = 0.0;
        }
        else
        {
            self._id_EF56.alpha = 1.0;
            self._id_AC33.alpha = 1.0;
        }

        var_0 = _id_6C96( self.team, self );
        var_1 = _id_6C96( scripts\mp\utility\game::_id_6BC3( self.team ), self );
        self._id_EF56 _meth_83A2( var_0 );
        self._id_AC33 _meth_83A2( var_1 );
        level waittill( "uav_update" );
    }
}

_id_FB45( var_0 )
{
    if ( getdvarint( "#x33b8132c2bbd3f240", 0 ) )
    {
        if ( var_0 )
            return;

        return;
    }
}

_id_D069( var_0 )
{
    self endon( "stop_location_selection" );

    if ( !isdefined( level._id_9AB0 ) )
        level._id_9AB0 = 1024;

    var_1 = level._id_9AB0 / 4;

    if ( level._id_E427 )
        var_1 = var_1 * 1.5;

    var_2 = 0;
    _id_07E3::_id_0B3D( var_0, "map_artillery_selector", var_2, var_1 );
    thread _id_10830();
    self waittill( "confirm_location", var_3, var_4 );
    self _meth_82ED( 0, 0.3 );
    self notify( "location_selection_complete" );
    thread _id_FEB3( var_3 );
    return 1;
}

_id_FEB3( var_0 )
{
    var_1 = level._id_F8F3;
    level._id_F8F3++;

    foreach ( var_3 in level.players )
    {
        if ( !isplayer( var_3 ) || isbot( var_3 ) || _func_03D5( var_3 ) )
            continue;

        if ( var_3.team != self.team )
            continue;

        var_3 thread _id_6FAE( var_1, self, var_0 );
    }

    thread _id_6FA0( var_1, self, var_0 );
    wait 30;
    level notify( "uav_locational_destroyed_" + var_1 );

    foreach ( var_3 in level.players )
    {
        if ( !isplayer( var_3 ) || isbot( var_3 ) || _func_03D5( var_3 ) )
            continue;

        if ( var_3.team != self.team )
            continue;

        var_3 thread _id_C4FC( var_1 );
    }
}

_id_6FAE( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_2 );
    var_3.team = var_1.team;
    var_3._id_4053 = var_1;
    var_3._id_7C71 = var_0;
    var_3 _meth_8221( self );

    if ( isdefined( self._id_C15E ) )
    {
        self._id_C15E = scripts\engine\utility::_id_1BA9( self._id_C15E );

        if ( self._id_C15E.size >= level._id_F8F4 )
        {
            level _id_07E3::_id_4766( self._id_C15E[0] );
            self._id_C15E[0] = undefined;
        }

        self._id_C15E = scripts\engine\utility::_id_1BA9( self._id_C15E );
    }
    else
        self._id_C15E = [];

    self._id_C15E[self._id_C15E.size] = var_3;
    thread _id_10819( var_0 );
}

_id_C4FC( var_0 )
{
    if ( isdefined( self._id_C15E ) )
    {
        self._id_C15E = scripts\engine\utility::_id_1BA9( self._id_C15E );

        foreach ( var_2 in self._id_C15E )
        {
            if ( var_2._id_7C71 == var_0 )
            {
                level _id_07E3::_id_4766( var_2 );
                var_2 = undefined;
            }
        }

        self._id_C15E = scripts\engine\utility::_id_1BA9( self._id_C15E );
    }
}

_id_10819( var_0 )
{
    level endon( "game_ended" );
    level endon( "uav_locational_destroyed_" + var_0 );
    scripts\engine\utility::_id_1087D( "disconnect", "joined_team", "joined_spectators" );
    _id_C4FC( var_0 );
}

_id_10830()
{
    self endon( "location_selection_complete" );
    self endon( "disconnect" );
    self waittill( "stop_location_selection" );
    self _meth_82ED( 0, 0.3 );

    if ( _id_07E3::_id_10956() > 0 )
        self _meth_83FF( _id_07E3::_id_6ADA() );
}

_id_6FA0( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    level endon( "uav_locational_destroyed_" + var_0 );

    for (;;)
    {
        level waittill( "connected", var_3 );

        if ( !isplayer( var_3 ) || isbot( var_3 ) || _func_03D5( var_3 ) )
            continue;

        if ( var_3.team != var_1.team )
            continue;

        var_3 thread _id_6FAE( var_0, var_1, var_2 );
    }
}

_id_696C()
{
    var_0 = undefined;
    var_1 = level._id_F8F5;

    if ( level.teambased )
        var_1 = level._id_F8F5[scripts\mp\utility\game::_id_6BC3( self.team )];

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || isdefined( var_3._id_88EE ) || isdefined( var_3._id_8A75 ) )
            continue;

        if ( isdefined( var_0 ) && var_0.type == "counter_uav" && var_3.type != "counter_uav" )
            continue;

        if ( !level.teambased && isdefined( var_3.owner ) && var_3.owner == self )
            continue;

        var_0 = var_3;
    }

    return var_0;
}

_id_90D3( var_0, var_1, var_2, var_3 )
{
    while ( isdefined( var_2 ) && !var_2 _meth_81CB() )
        waitframe();

    if ( !isdefined( var_2 ) )
    {
        level thread _id_90EC( var_0, var_1, "counter_uav" );
        return;
    }

    level thread _id_F8F8( var_2 );
    var_4 = anglestoright( ( 0, var_2.angles[1], 0 ) );
    var_5 = var_2.origin + var_4 * -3200;
    var_6 = spawn( "script_model", var_5 );
    var_6.angles = var_2.angles + ( 0, -55, 0 );
    _id_07E3::_id_40D3( "ks_counter_uav_chase", undefined, var_6 );

    if ( var_2.type == "counter_uav" )
        _id_07E3::_id_40D3( "ks_counter_uav_chase_target_lg", undefined, var_2 );
    else
        _id_07E3::_id_40D3( "ks_counter_uav_chase_target_sm", undefined, var_2 );

    wait 0.5;
    var_7 = _id_6DFF( "counter_uav", var_1 );
    var_8 = _id_6DFB( "counter_uav", var_1 );

    if ( isdefined( var_8 ) )
        var_6 setmodel( var_8 );
    else
        var_6 setmodel( var_7 );

    var_9 = "ks_counter_intelligence_ger_attack";

    if ( var_1 == "allies" )
        var_9 = "ks_counter_intelligence_usa_attack";

    var_6 _meth_82CB( var_9, "finished_chase_anim" );

    if ( isdefined( var_3 ) )
        var_6._id_AD89 = 1;
    else
        var_6.owner = var_0;

    var_6._id_90EB = gettime();
    var_6.type = "counter_uav";

    if ( isdefined( var_3 ) )
    {
        foreach ( var_11 in level.players )
        {
            if ( isdefined( var_11.team ) && var_11.team == var_1 )
                var_6 _id_1074( var_11, _id_6DFE( "counter_uav" ) );
        }
    }
    else
        var_6 _id_1074( var_6.owner, _id_6DFE( "counter_uav" ) );

    if ( isdefined( var_8 ) )
        var_6 _id_07E3::_id_D6B3( 0, 1, 1.0 );

    wait 1.0;
    var_6 setmodel( var_7 );
    wait 1.66;
    var_6 thread _id_3D82( var_2, var_1 );
    var_6 scripts\engine\utility::_id_1087D( "death", "finished_chase_anim" );

    if ( isdefined( var_8 ) )
    {
        var_6 setmodel( var_8 );
        var_6 _id_07E3::_id_D6B3( 1, 0, 0.5 );
        wait 0.5;
    }

    if ( 0 && isdefined( var_6._id_9F0C ) )
        var_6._id_9F0C delete();

    var_6 delete();
}

_id_3D82( var_0, var_1 )
{
    self endon( "death" );
    var_2 = ( 134, 9, 39 );
    var_3 = ( 134, -9, 39 );

    if ( var_1 == "allies" )
    {
        var_2 = ( 111, 17, 13 );
        var_3 = ( 111, -17, 13 );
    }

    var_4 = 2.8;

    if ( var_0.type == "counter_uav" )
        var_4 = 5.0;

    var_5 = gettime();

    for ( var_6 = 0; var_6 < var_4 * 1000; var_6 = gettime() - var_5 )
    {
        var_7 = anglestoforward( self.angles );
        var_8 = vectornormalize( var_0.origin - self.origin );
        var_9 = vectordot( var_7, var_8 );
        var_10 = self.origin + rotatevector( var_2, self.angles );
        var_11 = var_10 + var_7 * 8000;
        _func_0141( "counter_recon_gun_mp", var_10, var_11 );
        var_10 = self.origin + rotatevector( var_3, self.angles );
        var_11 = var_10 + var_7 * 8000;
        _func_0141( "counter_recon_gun_mp", var_10, var_11 );
        _id_07E3::_id_40D2( "ks_fighter_strike_npc", undefined, self.origin );

        if ( var_9 > 0.995 )
        {
            var_12 = var_0 gettagorigin( "TAG_DEATH_FX" );
            playfx( scripts\engine\utility::getfx( "counter_recon_hit" ), var_12 );
        }

        wait 0.1;
    }

    var_0 setcandamage( 1 );
    var_0 dodamage( var_0.maxhealth * 10, var_0.origin, self.owner, self, "MOD_RIFLE_BULLET", "counter_recon_gun_mp" );

    if ( var_0.type == "counter_uav" )
    {
        var_13 = var_0.origin;
        _id_07E3::_id_40D2( "ks_plane_destruct_explode", undefined, var_13 );
        _id_07E3::_id_40D4( "ks_plane_destruct_deathspin_long", undefined, var_0 );
    }
    else
        _id_07E3::_id_40D2( "ks_plane_destruct_explode", undefined, var_0.origin );

    _id_07E3::_id_40D4( "ks_plane_destruct_deathspin_long", undefined, var_0 );
}

_id_F8F8( var_0 )
{
    var_0 notify( "leaving" );
    var_0 notify( "death" );
    var_0 _id_C52B();
    var_0 unlink();
    var_1 = _id_6DF9( var_0.type, var_0.team );
    var_0 _meth_82CB( var_1, "finished_chase_anim" );

    if ( 0 && isdefined( var_0._id_9F0C ) )
        var_0._id_9F0C _id_07E3::_id_D54A( 3000, 0 );

    var_0 scripts\engine\utility::_id_1087D( "death", "finished_chase_anim" );
    waitframe();
    waitframe();

    if ( isdefined( var_0 ) )
    {
        var_0 _id_0A04::_id_4839();

        if ( 0 && isdefined( var_0._id_9F0C ) )
            var_0._id_9F0C delete();

        var_0 delete();
    }
}
