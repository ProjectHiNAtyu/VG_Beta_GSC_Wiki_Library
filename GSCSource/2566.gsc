// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_CC11["air_superiority"] = 400;
    level._id_CC12["air_superiority"] = 75;
    level._id_CC10["air_superiority"] = -1;
    level._id_CC13["air_superiority"] = 6.0;
    level._id_CC0F["air_superiority"] = 8.0;
    scripts\mp\killstreaks\killstreaks::_id_C25C( "air_superiority", ::_id_F766 );
    level._id_8DBB["air_superiority"] = ::_id_F766;
    level._id_8DD6["s4_airstrike_bomb_mp"] = "air_superiority";
    level._id_8DD6["s4_airstrike_bomb_mp"] = "air_superiority";
    level._id_1346["allies"] = 0;
    level._id_1346["axis"] = 0;
}

_id_F766( var_0 )
{
    var_1 = 0;

    if ( !scripts\cp_mp\vehicles\vehicle_tracking::_id_C58D() )
        return 0;

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
        {
            scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
            return 0;
        }
    }

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
        {
            scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
            return 0;
        }
    }

    if ( _id_0A04::_id_F791( var_1, "air_superiority" ) )
    {
        self._id_139E = 0;
        _id_0990::_id_E9FE( var_0, makeweapon( "s4_ks_gesture_generic_mp" ) );
        return 1;
    }

    scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
    return 0;
}

_id_13BA( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "game_ended" );

    if ( isdefined( var_2 ) )
        var_2 endon( "disconnect" );

    level._id_3292 = 1;

    if ( isdefined( var_2 ) )
    {
        var_2 thread _id_AB50();
        var_2 thread _id_0A04::_id_13BD();
    }

    level._id_1346[scripts\mp\utility\game::_id_6BC3( var_2.team )[0]] = 1;

    if ( isdefined( level._id_0F23 ) )
    {
        foreach ( var_7 in level._id_0F23 )
        {
            if ( istrue( var_7._id_8725 ) )
                var_7 _id_0A6F::_id_4C35( 10000, var_2, var_2, scripts\mp\utility\game::_id_6BC3( var_2.team )[0], var_7.origin, "MOD_EXPLOSIVE", "s4_airstrike_bomb_mp" );
        }
    }

    if ( _id_07E3::_id_89BD() && isdefined( var_3 ) && isdefined( level._id_BF4E._id_CC0D ) && isdefined( level._id_BF4E._id_CC0D._id_13BC ) )
        thread [[ level._id_BF4E._id_CC0D._id_13BC ]]( 4.0 );
    else
        thread _id_1E4B();

    var_9 = 3;
    scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();

    for ( var_10 = 0; var_10 < var_9 && !scripts\mp\utility\game::_id_8722(); var_10++ )
    {
        playsoundatpos( level._id_9A95 + ( 0, 0, 200 ), "kstreak_airsuperiority_siren" );
        wait 4.0;
        var_11 = _id_0A04::_id_6B0D();
        var_12 = [];

        for ( var_13 = -5; var_13 < 6; var_13++ )
        {
            var_14 = spawnstruct();
            var_14.origin = ( level._id_9A95[0] + cos( var_11 + 90 ) * var_13 * 700, level._id_9A95[1] + sin( var_11 + 90 ) * var_13 * 700, level._id_9A95[2] );
            var_14._id_C94A = abs( ( abs( var_13 ) - 5 ) / 50 );
            var_12[var_12.size] = var_14;
        }

        var_15 = var_2 _id_68F1( var_12, var_11 );
        var_16 = scripts\cp_mp\utility\killstreak_utility::_id_4034( "precision_airstrike", var_2 );
        var_2 thread _id_F757( var_16, var_15.origin );
        wait 10.0;
    }

    wait 4.0;
    level._id_3292 = undefined;
    level._id_1395 = undefined;
    level._id_1346[scripts\mp\utility\game::_id_6BC3( var_2.team )[0]] = 0;
    level notify( "carpetBombingEnded" );

    if ( isdefined( var_2 ) )
        var_2 notify( "carpetBombingEnded" );
}

_id_F757( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
            return 0;
    }

    var_2 = undefined;
    var_3 = level._id_13BB[var_0._id_EA0F]._id_47CD;
    var_0._id_EEEF = var_1;
    var_4 = _id_0982::_id_10D7E( var_0, undefined, undefined );
    var_2 = var_4 == "success";

    if ( !istrue( var_2 ) )
        return 0;

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
            return 0;
    }

    var_5 = _id_0982::_id_D043( var_0 );

    if ( !istrue( var_5 ) )
        return 0;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "airstrike", "munitionUsed" ) )
        self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "airstrike", "munitionUsed" ) ]]();

    return 1;
}

_id_1E4B()
{
    self endon( "carpetBombingEnded" );
}

_id_68F1( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( !_id_07E3::isreallyalive( var_4 ) )
            continue;

        if ( isdefined( var_2 ) )
        {
            if ( level.teambased && var_4.team == var_2 )
                continue;
        }
        else if ( level.teambased && var_4.team == self.team && var_4 != self )
            continue;

        if ( var_4.team == "spectator" )
            continue;

        var_5 = 999999999;
        var_6 = undefined;
        var_7 = 999999999;
        var_8 = undefined;

        foreach ( var_10 in var_0 )
        {
            var_11 = distance2d( ( var_10.origin[0] * cos( var_1 + 90 ), var_10.origin[1] * sin( var_1 + 90 ), 0 ), ( var_4.origin[0] * cos( var_1 + 90 ), var_4.origin[1] * sin( var_1 + 90 ), 0 ) );

            if ( var_11 <= var_5 )
            {
                var_7 = var_5;
                var_8 = var_6;
                var_5 = var_11;
                var_6 = var_10;
            }
            else if ( var_11 <= var_7 )
            {
                var_7 = var_11;
                var_8 = var_10;
            }

            if ( isdefined( self ) && var_4 == self && var_11 <= 1000 )
            {
                if ( scripts\cp_mp\utility\game_utility::_id_6B0E() != "mp_shipment_s2" && scripts\cp_mp\utility\game_utility::_id_6B0E() != "mp_sandbox_01" )
                {
                    if ( !_id_07E3::_id_2D16( var_4.origin + ( 0, 0, 32 ), var_4.origin + ( 0, 0, 10000 ), 0, var_4 ) )
                    {
                        var_10._id_C94A = var_10._id_C94A - 3.25;
                        continue;
                    }

                    var_10._id_C94A = var_10._id_C94A - 6;
                }
            }
        }

        if ( isdefined( self ) && var_4 == self )
            continue;
        else
        {
            if ( !_id_07E3::_id_2D16( var_4.origin + ( 0, 0, 32 ), var_4.origin + ( 0, 0, 10000 ), 0, var_4 ) )
            {
                var_6._id_C94A = var_6._id_C94A + 0.75;
                var_8._id_C94A = var_8._id_C94A + 0.5;
                continue;
            }

            var_6._id_C94A = var_6._id_C94A + 2.5;
            var_8._id_C94A = var_8._id_C94A + 1.75;
        }
    }

    if ( isdefined( var_2 ) )
        var_14 = var_2;
    else
        var_14 = self.team;

    var_15 = level._id_C0E2[scripts\mp\utility\game::_id_6BC3( var_14 )[0]];

    if ( !level.teambased )
        var_15 = level._id_C0E2["all"];

    foreach ( var_17 in var_15 )
    {
        if ( !level.teambased && var_17["player"] == self._id_723F )
            continue;

        var_5 = 999999999;
        var_6 = undefined;
        var_7 = 999999999;
        var_8 = undefined;

        foreach ( var_10 in var_0 )
        {
            var_11 = distance2d( ( var_10.origin[0] * cos( var_1 + 90 ), var_10.origin[1] * sin( var_1 + 90 ), 0 ), ( var_17["position"][0] * cos( var_1 + 90 ), var_17["position"][1] * sin( var_1 + 90 ), 0 ) );

            if ( var_11 <= var_5 )
            {
                var_7 = var_5;
                var_8 = var_6;
                var_5 = var_11;
                var_6 = var_10;
                continue;
            }

            if ( var_11 <= var_7 )
            {
                var_7 = var_11;
                var_8 = var_10;
            }
        }

        if ( !_id_07E3::_id_2D16( var_17["position"] + ( 0, 0, 32 ), var_17["position"] + ( 0, 0, 10000 ), 0, undefined ) )
        {
            var_6._id_C94A = var_6._id_C94A + 0.075;
            var_8._id_C94A = var_8._id_C94A + 0.05;
            continue;
        }

        var_6._id_C94A = var_6._id_C94A + 0.125;
        var_8._id_C94A = var_8._id_C94A + 0.1;
    }

    var_21 = var_0[0];

    foreach ( var_10 in var_0 )
    {
        if ( var_10._id_C94A > var_21._id_C94A )
        {
            var_21 = var_10;
            continue;
        }

        if ( var_10._id_C94A == var_21._id_C94A )
        {
            if ( scripts\engine\utility::cointoss() )
                var_21 = var_10;
        }
    }

    return var_21;
}

_id_AB50()
{
    self endon( "carpetBombingEnded" );
    self waittill( "disconnect" );
    level._id_3292 = undefined;
    level._id_1395 = undefined;
    level notify( "aud_carpet_bomb_killed" );
}
