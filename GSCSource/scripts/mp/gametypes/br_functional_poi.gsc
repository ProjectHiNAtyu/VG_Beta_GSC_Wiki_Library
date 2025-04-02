// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\gametypes\br_plunder::init();
    scripts\mp\gametypes\br_mobile_armory::init();
    scripts\mp\gametypes\br_satellite_truck::init();
    scripts\mp\gametypes\br_armory_kiosk::init();
    scripts\mp\gametypes\br_bank::init();
    _id_07A8::_id_60A1( "POIs_spawned", 0 );
    level thread _id_0D56();
}

_id_8241()
{
    var_0 = self;
    var_0 scripts\mp\gametypes\br_plunder::_id_8241();
}

_id_AB6D()
{
    _id_07A8::_id_60A3( "POIs_spawned" );
    scripts\mp\gametypes\br_mobile_armory::_id_AB6D();
    scripts\mp\gametypes\br_satellite_truck::_id_AB6D();
    scripts\mp\gametypes\br_armory_kiosk::_id_AB6D();
}

_id_6AA5()
{
    return "outline_depth_red";
}

_id_0D56()
{
    level endon( "game_ended" );
    var_0 = 0.05;
    var_1 = 5;
    var_2 = 5;
    var_3 = 65;
    var_4 = 7;
    var_5 = 7;

    if ( getdvar( "scr_br_gametype", "" ) == "dmz" )
    {
        level._id_1178 = getdvarint( "scr_bmo_event_distribution_pad", 35 );
        level._id_BE42 = getdvarint( "scr_bmo_event_distribution_pad_push", 1 );
        level._id_2DBF = getdvarint( "scr_bmo_buystation_distribution_pad", 0 );
        level thread _id_D87E();
    }

    level._id_9F1D = getdvarint( "br_min_plunder_extractions", var_5 );
    level._id_9C82 = getdvarint( "br_max_plunder_extractions", var_4 );

    if ( level._id_9F1D < level._id_9C82 )
        level._id_9C82 = randomintrange( level._id_9F1D, level._id_9C82 + 1 );

    var_6 = getdvarint( "br_max_armory_kiosk", var_3 );
    var_7 = scripts\mp\gametypes\br_armory_kiosk::_id_688E();

    if ( isdefined( var_7 ) && var_7.size > 0 )
    {
        var_7 = _id_0BD9( var_7, var_6, level._id_2DBF );
        scripts\mp\gametypes\br_armory_kiosk::_id_D6CC( var_7 );
    }

    var_8 = scripts\mp\gametypes\br_plunder::_id_6887();

    if ( isdefined( var_8 ) && var_8.size > 0 )
    {
        var_8 = _id_0BD9( var_8, level._id_9C82, 1 );
        scripts\mp\gametypes\br_plunder::_id_D53F( var_8 );
    }

    var_9 = scripts\engine\utility::_id_6D7C( "br_respawn_station", "targetname" );

    for ( var_10 = 0; var_10 < var_9.size; var_10++ )
    {
        wait( var_0 );
        scripts\mp\gametypes\br_respawn::_id_E261( var_9[var_10] );
    }

    var_11 = getdvarint( "br_max_mobile_armory", var_1 );
    var_12 = scripts\engine\utility::_id_6D7C( "br_mobile_armory_location", "targetname" );

    if ( var_12.size > 0 )
    {
        var_13 = _id_0BE0( var_12, var_11 );

        for ( var_10 = 0; var_10 < var_13.size; var_10++ )
        {
            wait( var_0 );
            scripts\mp\gametypes\br_mobile_armory::_id_E325( var_13[var_10] );
        }
    }

    var_14 = getdvarint( "br_max_satellite_truck", var_2 );
    var_15 = scripts\engine\utility::_id_6D7C( "br_satellite_truck_location", "targetname" );

    if ( var_15.size > 0 )
    {
        var_16 = _id_0BE0( var_15, var_14 );

        for ( var_10 = 0; var_10 < var_16.size; var_10++ )
        {
            wait( var_0 );
            scripts\mp\gametypes\br_satellite_truck::_id_E362( var_16[var_10] );
        }
    }

    _id_07A8::_id_60A2( "POIs_spawned" );
}

_id_0BD9( var_0, var_1, var_2 )
{
    if ( var_0.size == 0 || var_1 == 0 )
        return;

    if ( var_1 > var_0.size )
        var_1 = var_0.size;

    if ( getdvar( "scr_br_gametype", "" ) == "dmz" )
        return scripts\mp\gametypes\br_gametype_dmz::_id_0BDE( var_0, var_1, var_2 );
    else if ( !isdefined( level._id_29F5 ) || !isdefined( level._id_2A4D ) )
        return _id_0BE0( var_0, var_1 );

    var_3 = level._id_2A4D._id_29F9.size - 1;
    var_4 = int( max( 1, var_3 * getdvarfloat( "br_poi_noise", 1.0 ) ) );

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];
        var_7 = randomintrange( -1 * var_4, var_4 + 1 );
        var_6._id_0369 = scripts\mp\gametypes\br_circle::_id_693B( var_6.origin ) + var_7;
    }

    var_8 = scripts\engine\utility::_id_1BAE( var_0, ::_id_3AD9 );
    var_9 = [];

    for ( var_5 = 0; var_5 < var_1; var_5++ )
        var_9[var_5] = var_8[var_5];

    return scripts\engine\utility::_id_1BAC( var_8, 0, var_1 );
}

_id_3AD9( var_0, var_1 )
{
    return var_0._id_0369 > var_1._id_0369;
}

_id_0BE0( var_0, var_1 )
{
    if ( var_0.size == 0 || var_1 == 0 )
        return;

    var_2 = [];

    if ( var_0.size > 0 )
    {
        var_0 = scripts\engine\utility::_id_1B94( var_0 );
        var_3 = int( min( var_1, var_0.size ) );

        for ( var_4 = 0; var_4 < var_3; var_4++ )
            var_2[var_2.size] = var_0[var_4];
    }

    return var_2;
}

_id_DCC4( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
    {
        var_4 = "mp/hints.csv";
        var_5 = 1;
        var_6 = 0;
        var_7 = -1;
        var_8 = _func_0225( var_4, var_5, var_1 );

        if ( isdefined( var_8 ) && var_8 >= 0 )
            var_7 = int( tablelookupbyrow( var_4, var_8, var_6 ) );

        if ( var_7 < 0 )
            return;

        var_9 = undefined;

        if ( isdefined( var_3 ) )
            var_9 = gettime() + var_3;

        var_12 = scripts\mp\utility\teams::_id_6DAC( var_0, "players" );

        foreach ( var_14 in var_12 )
            var_14 _id_0A70::_id_D5DD( var_7, var_9, var_2 );
    }
}

_id_8282( var_0 )
{
    if ( !isdefined( level._id_B9B7 ) )
        level._id_B9B7 = [];

    level._id_B9B7[var_0] = [];
}

_id_C2AD( var_0, var_1, var_2, var_3, var_4 )
{
    level._id_B9B7[var_0][var_1] = spawnstruct();
    level._id_B9B7[var_0][var_1]._id_AAB1 = var_2;
    level._id_B9B7[var_0][var_1]._id_ABB7 = var_3;
    level._id_B9B7[var_0][var_1]._id_AAC9 = var_4;
}

_id_70E6( var_0, var_1 )
{
    var_2 = self;

    if ( isdefined( var_2._id_41D5 ) )
    {
        var_3 = level._id_B9B7[var_0][var_2._id_41D5];

        if ( isdefined( var_3 ) && isdefined( var_3._id_AAC9 ) )
            level [[ var_3._id_AAC9 ]]( var_2 );
    }

    var_2 notify( "poi_state_change" );
    var_2._id_41D5 = var_1;
    var_3 = level._id_B9B7[var_0][var_2._id_41D5];

    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3._id_AAB1 ) )
            level [[ var_3._id_AAB1 ]]( var_2 );

        if ( isdefined( var_3._id_ABB7 ) )
            var_2 thread _id_0C6E( var_3._id_ABB7 );
    }
}

_id_70E7( var_0, var_1, var_2 )
{
    var_3 = self;
    var_3 endon( "death" );
    var_3 endon( "poi_state_change" );
    wait( var_2 );
    var_3 thread _id_70E6( var_0, var_1 );
}

_id_6989()
{
    var_0 = self;
    return var_0._id_41D5;
}

_id_0C6E( var_0 )
{
    var_1 = self;
    var_1 endon( "death" );
    var_2 = var_1._id_41D5;

    while ( var_2 == var_1._id_41D5 )
    {
        level [[ var_0 ]]( var_1 );
        waitframe();
    }
}

_id_D87E()
{
    if ( !isdefined( level._id_9A9A ) )
        waitframe();

    var_0 = level._id_9A9A[0].origin[0];
    var_1 = level._id_9A9A[1].origin[0];
    var_2 = ( level._id_9A9A[0].origin[0], level._id_9A9A[0].origin[1], level._id_9A9A[0].origin[2] );
    var_3 = ( level._id_9A9A[1].origin[0], level._id_9A9A[0].origin[1], level._id_9A9A[1].origin[2] );

    if ( var_1 < var_0 )
    {
        var_2 = ( level._id_9A9A[1].origin[0], level._id_9A9A[0].origin[1], level._id_9A9A[1].origin[2] );
        var_3 = ( level._id_9A9A[0].origin[0], level._id_9A9A[0].origin[1], level._id_9A9A[0].origin[2] );
    }

    var_4 = level._id_9A9A[0].origin[1];
    var_5 = level._id_9A9A[1].origin[1];
    var_6 = ( level._id_9A9A[0].origin[0], level._id_9A9A[1].origin[1], level._id_9A9A[0].origin[2] );
    var_7 = ( level._id_9A9A[1].origin[0], level._id_9A9A[1].origin[1], level._id_9A9A[1].origin[2] );

    if ( var_5 < var_4 )
    {
        var_6 = ( level._id_9A9A[1].origin[0], level._id_9A9A[1].origin[1], level._id_9A9A[1].origin[2] );
        var_7 = ( level._id_9A9A[0].origin[0], level._id_9A9A[1].origin[1], level._id_9A9A[0].origin[2] );
    }

    var_8 = [];

    if ( level.mapname == "mp_donetsk" )
    {
        level._id_3D47 = abs( distance( var_7, var_2 ) );
        var_9 = level._id_3D47 / 10;
        var_2 = ( var_2[0] + var_9, var_2[1] - var_9, var_2[2] );
        var_3 = ( var_3[0] - var_9, var_3[1] - var_9, var_3[2] );
        var_6 = ( var_6[0] - var_9, var_6[1] + var_9, var_6[2] );
        var_7 = ( var_7[0] + var_9, var_7[1] + var_9, var_7[2] );
        level._id_3D47 = abs( distance( var_7, var_2 ) );

        for ( var_10 = 1; var_10 < 4; var_10 = var_10 + 2 )
        {
            var_11 = var_10 * level._id_3D47 / 2;

            for ( var_12 = 1; var_12 < 4; var_12 = var_12 + 2 )
            {
                var_13 = var_12 * level._id_3D47 / 2;
                var_14 = ( var_7[0] + var_11 / 2, var_7[1] + var_13 / 2, 0 );
                var_8[var_8.size] = var_14;
            }
        }
    }

    level._id_BE87 = [];

    if ( level.mapname == "mp_br_mechanics" )
    {
        level._id_BE87[level._id_BE87.size] = ( 3965, 4054, 0 );
        level._id_BE87[level._id_BE87.size] = ( 4069, -4150, 0 );
        level._id_BE87[level._id_BE87.size] = ( -4035, -4074, 0 );
        level._id_BE87[level._id_BE87.size] = ( -4009, 4105, 0 );
    }
    else if ( level.mapname == "mp_br_money" )
    {
        level._id_BE87[level._id_BE87.size] = ( 46569.5, -8170, 0 );
        level._id_BE87[level._id_BE87.size] = ( 56849.5, -8170, 0 );
        level._id_BE87[level._id_BE87.size] = ( 67081.5, -17919.5, 0 );
        level._id_BE87[level._id_BE87.size] = ( 46593, -17919.5, 0 );
    }
    else
    {
        level._id_BE87[level._id_BE87.size] = ( -21299.2, 41779.2, 0 );
        level._id_BE87[level._id_BE87.size] = ( 37683.2, 41779.2, 0 );
        level._id_BE87[level._id_BE87.size] = ( 37683.2, -17203.2, 0 );
        level._id_BE87[level._id_BE87.size] = ( -21299.2, -17203.2, 0 );
    }

    level._id_BE87 = scripts\engine\utility::_id_1B94( level._id_BE87 );
    var_15 = 33704;
    level._id_BE88 = abs( var_15 * var_15 );

    if ( level._id_1178 > 0 && level.mapname == "mp_donetsk" )
    {
        level._id_BFE9 = randomintrange( 0, 5 );
        var_9 = level._id_3D47 / 10;
        var_16 = level._id_3D47 / ( 100 / level._id_1178 );

        switch ( level._id_BFE9 )
        {
            case 0:
                var_17 = ( var_2[0] + var_9, var_2[1] - var_9, var_2[2] );
                var_18 = ( var_3[0] - var_16, var_3[1] - var_9, var_3[2] );
                var_19 = ( var_6[0] - var_16, var_6[1] + var_16, var_6[2] );
                var_20 = ( var_7[0] + var_9, var_7[1] + var_16, var_7[2] );
                break;
            case 1:
                var_17 = ( var_2[0] + var_16, var_2[1] - var_9, var_2[2] );
                var_18 = ( var_3[0] - var_9, var_3[1] - var_9, var_3[2] );
                var_19 = ( var_6[0] - var_16, var_6[1] + var_9, var_6[2] );
                var_20 = ( var_7[0] + var_16, var_7[1] + var_16, var_7[2] );
                break;
            case 2:
                var_17 = ( var_2[0] + var_16, var_2[1] - var_16, var_2[2] );
                var_18 = ( var_3[0] - var_9, var_3[1] - var_16, var_3[2] );
                var_19 = ( var_6[0] - var_9, var_6[1] + var_9, var_6[2] );
                var_20 = ( var_7[0] + var_16, var_7[1] + var_9, var_7[2] );
                break;
            case 3:
                var_17 = ( var_2[0] + var_9, var_2[1] - var_16, var_2[2] );
                var_18 = ( var_3[0] - var_16, var_3[1] - var_16, var_3[2] );
                var_19 = ( var_6[0] - var_16, var_6[1] + var_9, var_6[2] );
                var_20 = ( var_7[0] + var_9, var_7[1] + var_9, var_7[2] );
                break;
            case 4:
                var_17 = ( var_2[0] + var_16, var_2[1] - var_16, var_2[2] );
                var_18 = ( var_3[0] - var_16, var_3[1] - var_16, var_3[2] );
                var_19 = ( var_6[0] - var_16, var_6[1] + var_16, var_6[2] );
                var_20 = ( var_7[0] + var_16, var_7[1] + var_16, var_7[2] );
                break;
            default:
                var_17 = ( var_2[0] + var_16, var_2[1] - var_16, var_2[2] );
                var_18 = ( var_3[0] - var_16, var_3[1] - var_16, var_3[2] );
                var_19 = ( var_6[0] - var_16, var_6[1] + var_16, var_6[2] );
                var_20 = ( var_7[0] + var_16, var_7[1] + var_16, var_7[2] );
                break;
        }

        var_21 = [];
        level._id_ADBF = [];
        level._id_ADBE = abs( distance( var_20, var_17 ) );
        level._id_B9AE = level._id_ADBE / 2;

        for ( var_10 = 1; var_10 < 4; var_10 = var_10 + 2 )
        {
            var_11 = var_10 * level._id_ADBE / 2;

            for ( var_12 = 1; var_12 < 4; var_12 = var_12 + 2 )
            {
                var_13 = var_12 * level._id_ADBE / 2;
                var_14 = ( var_20[0] + var_11 / 2, var_20[1] + var_13 / 2, 0 );
                var_21[var_21.size] = var_14;
            }
        }

        if ( level._id_BE42 == 2 )
            level._id_ADBF = scripts\engine\utility::_id_1B94( var_21 );
        else
        {
            switch ( level._id_BFE9 )
            {
                case 0:
                    if ( level._id_BE42 )
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                    }
                    else
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                    }

                    break;
                case 1:
                    if ( level._id_BE42 )
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                    }
                    else
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                    }

                    break;
                case 2:
                    if ( level._id_BE42 )
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                    }
                    else
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                    }

                    break;
                case 3:
                    if ( level._id_BE42 )
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                    }
                    else
                    {
                        level._id_ADBF[level._id_ADBF.size] = var_21[0];
                        level._id_ADBF[level._id_ADBF.size] = var_21[1];
                        level._id_ADBF[level._id_ADBF.size] = var_21[3];
                        level._id_ADBF[level._id_ADBF.size] = var_21[2];
                    }

                    break;
                case 4:
                    level._id_ADBF = scripts\engine\utility::_id_1B94( var_21 );
                    break;
                default:
                    level._id_ADBF = scripts\engine\utility::_id_1B94( var_21 );
                    break;
            }
        }

        var_22 = abs( distance( var_17, var_19 ) );
        level._id_3D46 = var_22;
        var_23 = var_22 / 4.5;
        level._id_ADC0 = var_23 * var_23;
    }
}
