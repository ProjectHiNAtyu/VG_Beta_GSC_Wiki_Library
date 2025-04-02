// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8145()
{
    if ( scripts\mp\gametypes\br_gametypes::_id_8839( "circle" ) )
    {
        level._id_29F7 = 1;
        return;
    }

    if ( !isdefined( level._id_2A4D ) )
        return;

    level._id_29F5 = spawnstruct();
    level._id_29F5._id_9A93 = level._id_2A4D._id_2A52;

    if ( level.mapname == "mp_quarry2" || level.mapname == "mp_prison" || level.mapname == "mp_lumber" )
        level._id_29F5._id_430F = [ 9, 9, 9, 9, 9 ];
    else
        level._id_29F5._id_430F = [ 9, 9, 9, 9, 9, 9, 9, 9 ];

    var_0 = _func_0093( "br_final_circle_override", ( 0, 0, 0 ) );

    if ( length( var_0 ) > 0 )
        level._id_29F5._id_2A1F = var_0;

    setomnvar( "ui_br_minimap_radius", level._id_2A4D._id_29FE[0] );
    level._id_29F5._id_370B = -1;
    _id_0C74();
}

_id_6CE3()
{
    if ( isdefined( level._id_29F5 ) && isdefined( level._id_29F5._id_CABD ) )
        return ( level._id_29F5._id_CABD.origin[0], level._id_29F5._id_CABD.origin[1], 0 );
    else
        return ( 0, 0, 0 );
}

_id_6CE4()
{
    if ( isdefined( level._id_29F5 ) && isdefined( level._id_29F5._id_CABD ) )
        return level._id_29F5._id_CABD.origin[2];
    else
        return 0;
}

_id_69A6()
{
    if ( isdefined( level._id_29F5 ) && isdefined( level._id_29F5._id_431C ) )
        return ( level._id_29F5._id_431C.origin[0], level._id_29F5._id_431C.origin[1], 0 );
    else
        return ( 0, 0, 0 );
}

_id_69A7()
{
    if ( isdefined( level._id_29F5 ) && isdefined( level._id_29F5._id_431C ) )
        return level._id_29F5._id_431C.origin[2];
    else
        return 0;
}

_id_6B6D()
{
    var_0 = level._id_29F5._id_370B + 2;

    if ( var_0 < level._id_2A4D._id_29F9.size )
        return level._id_2A4D._id_29F9[var_0];
    else
        return undefined;
}

_id_6B6E()
{
    var_0 = level._id_29F5._id_370B + 2;

    if ( var_0 < level._id_2A4D._id_29FF.size )
        return level._id_2A4D._id_29FF[var_0];
    else
        return undefined;
}

_id_31AB()
{
    return isdefined( level._id_29F5._id_CABD ) && !istrue( level._id_29F5._id_CABD.hidden );
}

_id_31A5()
{
    return isdefined( level._id_29F5._id_431C ) && !istrue( level._id_29F5._id_431C.hidden );
}

_id_B65E()
{
    return !istrue( self._id_10A12 ) && !istrue( self._id_7246 ) && !istrue( self._id_7245 ) && _id_31A5();
}

_id_3140( var_0 )
{
    return var_0 _id_B65E() && !istrue( var_0._id_82C7 );
}

_id_F752()
{
    var_0 = self;

    if ( !isalive( var_0 ) )
        return;

    if ( isdefined( var_0._id_2B20 ) && gettime() < var_0._id_2B20 )
        return;

    var_0._id_2B20 = gettime() + randomintrange( 5000, 7000 );

    if ( !isai( var_0 ) )
        var_0 playlocalsound( "gas_player_cough" );

    var_1 = "allies_male_cough";
    var_2 = scripts\mp\gametypes\br_public::_id_2B95( var_0 );
    var_3 = var_0._id_AC2A._id_6266;

    if ( var_2 == "axis" )
    {
        if ( isdefined( var_3 ) && var_3 == "female" )
            var_1 = "axis_female_cough";
        else
            var_1 = "axis_male_cough";
    }
    else if ( isdefined( var_3 ) && var_3 == "female" )
        var_1 = "allies_female_cough";
    else
        var_1 = "allies_male_cough";

    var_4 = randomint( game["dialogue"][var_1].size );
    var_5 = game["dialogue"][var_1][var_4];
    var_0 _meth_827D( var_5 );
}

_id_3705()
{
    level endon( "game_ended" );

    while ( level._id_29F5._id_370B < 0 )
        waitframe();

    var_0 = getdvarfloat( "scr_br_circle_object_cleanup_threshold", 2400.0 );

    for (;;)
    {
        if ( isdefined( level._id_29F5._id_431C ) )
        {
            var_1 = level._id_29F5._id_370B;

            if ( var_1 > level._id_29F5._id_430F.size - 1 )
                var_1 = level._id_29F5._id_430F.size - 1;

            var_2 = level._id_29F5._id_430F[var_1];

            if ( isdefined( level._id_3704 ) )
                var_2 = var_2 * level._id_3704;

            if ( var_2 > 0 )
            {
                var_3 = _id_69A6();
                var_4 = _id_69A7();

                foreach ( var_6 in level.players )
                {
                    if ( !isdefined( var_6 ) || !isdefined( var_6.origin ) )
                        continue;

                    if ( distance2dsquared( var_3, var_6.origin ) > var_4 * var_4 )
                    {
                        if ( _id_3140( var_6 ) )
                        {
                            var_6 _id_FC8A( 1 );

                            if ( _id_0769::_id_754B( var_6 ) )
                            {
                                if ( !istrue( var_6._id_61B5 ) )
                                    var_6 notify( "toggle_gasmask" );

                                var_6 _id_0769::_id_BD57( var_2 );
                            }
                            else
                            {
                                var_6 dodamage( var_2, var_6.origin, var_6, undefined, "MOD_TRIGGER_HURT", "danger_circle_br" );

                                if ( var_6 scripts\mp\gametypes\br_public::_id_751E() )
                                    var_6 scripts\mp\gametypes\br_public::_id_42C1( var_2 );

                                var_6 _id_F752();
                            }
                        }

                        continue;
                    }

                    var_6 _id_FC8A( 0 );

                    if ( _id_0769::_id_754B( var_6 ) )
                    {
                        if ( istrue( var_6._id_61B5 ) )
                            var_6 notify( "toggle_gasmask" );
                    }
                }

                var_8 = var_4 + var_0;
                scripts\mp\gametypes\br_plunder::_id_431E( var_3, var_8 );
                scripts\mp\gametypes\br_respawn::_id_431E( var_3, var_8 );
                scripts\mp\gametypes\br_quest_util::_id_431E( var_3, var_4, var_8 );
                scripts\mp\gametypes\br_armory_kiosk::_id_431E( var_3, var_8 );
                scripts\mp\gametypes\br_vehicles::_id_431E( var_3, var_4 );
                scripts\mp\gametypes\br_pickups::_id_431E( var_3, var_4 );
            }
        }

        wait 1;
    }
}

_id_FC8A( var_0 )
{
    if ( !isdefined( self._id_88A0 ) )
    {
        self._id_88A0 = var_0;
        self._id_8F94 = gettime();
    }

    if ( self._id_88A0 != var_0 )
    {
        self._id_88A0 = var_0;
        var_1 = gettime();

        if ( var_0 )
        {
            _id_0793::_id_E689( "alive_in_gas" );
            scripts\mp\gametypes\br_analytics::_id_2ABE( self, var_1 - self._id_8F94 );
        }
        else
        {
            _id_0793::_id_E8FE( "alive_in_gas" );
            scripts\mp\gametypes\br_analytics::_id_2ABF( self, var_1 - self._id_8F94 );
        }

        self._id_8F94 = var_1;
    }
}

_id_E732( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    setomnvar( "ui_hardpoint_timer", gettime() + int( var_0 * 1000 ) );

    if ( !var_1 )
    {
        foreach ( var_4 in level.players )
        {
            if ( !isbot( var_4 ) && !var_4 scripts\mp\gametypes\br_public::_id_8976() )
            {
                if ( istrue( var_2 ) )
                {
                    var_4 thread scripts\mp\hud_message::showsplash( "br_final_circle" );
                    continue;
                }

                var_4 thread scripts\mp\hud_message::showsplash( "br_new_circle" );
            }
        }
    }

    if ( istrue( var_2 ) )
        setomnvar( "ui_br_circle_state", 3 );
    else
        setomnvar( "ui_br_circle_state", 0 );

    var_6 = [ 60, 30, 20, 10, 0 ];
    var_7 = var_6.size - 1;

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        if ( var_0 > var_6[var_8] )
        {
            var_7 = var_8;
            break;
        }
    }

    if ( var_0 < var_6[var_7] )
        return;

    wait( var_0 - var_6[var_7] );

    for ( var_8 = var_7; var_8 < var_6.size - 1; var_8++ )
    {
        if ( var_8 == 2 )
            thread _id_07CF::_id_29F6( var_1, var_2 );

        if ( var_8 == 3 )
            setomnvar( "ui_br_circle_state", 2 );

        wait( var_6[var_8] - var_6[var_8 + 1] );
    }

    foreach ( var_4 in level.players )
    {
        if ( !isbot( var_4 ) && !var_4 scripts\mp\gametypes\br_public::_id_8976() )
        {
            var_4 thread scripts\mp\hud_message::showsplash( "br_circle_moving" );
            var_4 playlocalsound( "br_circle_closing" );
        }
    }

    setomnvar( "ui_br_circle_state", 1 );
}

_id_0BFE()
{
    var_0 = self;
    var_0 setclientomnvar( "ui_br_circle0_start_time", 0 );
}

_id_D67D( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( !isbot( var_2 ) )
        {
            var_2 setclientomnvar( "ui_br_circle0_start_entity", var_0 );
            var_2 setclientomnvar( "ui_br_circle0_end_entity", var_0 );
        }
    }
}

_id_D6E2( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in level.players )
    {
        if ( !isbot( var_5 ) )
        {
            var_6 = _id_0CA8( var_5, var_0 );
            var_5 setclientomnvar( "ui_br_circle0_start_time", gettime() );
            var_5 setclientomnvar( "ui_br_circle0_duration", var_6 );
            var_5 setclientomnvar( "ui_br_circle0_start_entity", var_1 );
            var_5 setclientomnvar( "ui_br_circle0_end_entity", var_1 );

            if ( istrue( var_3 ) )
                var_5 _id_0BFE();

            var_6 = _id_0B87( var_5, var_0 );
            var_5 setclientomnvar( "ui_br_circle1_start_time", gettime() );
            var_5 setclientomnvar( "ui_br_circle1_duration", var_6 );
            var_5 setclientomnvar( "ui_br_circle1_start_entity", var_2 );
            var_5 setclientomnvar( "ui_br_circle1_end_entity", var_2 );
        }
    }

    thread _id_FC2A( var_0, var_1, var_2 );
}

_id_D4C9( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in level.players )
    {
        if ( !isbot( var_5 ) )
        {
            var_6 = _id_0CA8( var_5, var_0 );
            var_5 setclientomnvar( "ui_br_circle0_start_time", gettime() );
            var_5 setclientomnvar( "ui_br_circle0_duration", var_6 );
            var_5 setclientomnvar( "ui_br_circle0_start_entity", var_1 );
            var_5 setclientomnvar( "ui_br_circle0_end_entity", var_1 );

            if ( istrue( var_3 ) )
                var_5 _id_0BFE();

            var_6 = _id_0B87( var_5, var_0 );
            var_5 setclientomnvar( "ui_br_circle1_start_time", gettime() );
            var_5 setclientomnvar( "ui_br_circle1_duration", var_6 );
            var_5 setclientomnvar( "ui_br_circle1_start_entity", var_2 );
            var_5 setclientomnvar( "ui_br_circle1_end_entity", var_1 );
        }
    }

    thread _id_FC2A( var_0, var_1, var_2 );
}

_id_FC2A( var_0, var_1, var_2 )
{
    level notify( "update_circle_omnvars" );
    level endon( "update_circle_omnvars" );

    for (;;)
    {
        level waittill( "update_circle_hide" );

        foreach ( var_4 in level.players )
        {
            if ( !isbot( var_4 ) )
            {
                var_5 = _id_0CA8( var_4, var_0 );
                var_4 setclientomnvar( "ui_br_circle0_duration", var_5 );
                var_5 = _id_0B87( var_4, var_0 );
                var_4 setclientomnvar( "ui_br_circle1_duration", var_5 );
            }
        }
    }
}

_id_0B87( var_0, var_1 )
{
    if ( _id_31A5() )
        return int( var_1 * 1000 );
    else
        return 0;
}

_id_0CA8( var_0, var_1 )
{
    if ( _id_31AB() )
        return int( var_1 * 1000 );
    else
        return 0;
}

_id_88E5()
{
    return level._id_29F5._id_370B >= level._id_2A4D._id_29FF.size - 1 || !( level._id_2A4D._id_29FF[level._id_29F5._id_370B + 1] > 0 );
}

_id_8AD1( var_0, var_1, var_2 )
{
    if ( !scripts\mp\gametypes\br_c130::_id_8998( var_0, 1 ) )
        return 0;

    if ( istrue( var_1 ) && _id_0C16( var_0 ) )
        return 0;

    if ( isdefined( var_2 ) )
    {
        var_3 = _id_6B3F( var_0 );

        if ( var_2 > var_3 )
            return 0;
    }

    return 1;
}

_id_6CA7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 8;
    var_9 = var_0;
    var_10 = 0;
    var_11 = 0;

    for ( var_12 = 360; var_10 < var_8; var_10++ )
    {
        var_13 = _id_6CA8( var_0, var_1, var_2, var_3, 1, 0, var_11, var_12 );

        if ( _id_8AD1( var_13, var_6, var_7 ) )
        {
            var_9 = var_13;

            if ( istrue( var_5 ) && _func_03D7() )
            {
                var_13 = _func_02A6( var_9 );

                if ( _id_8AD1( var_13, var_6, var_7 ) )
                    break;
            }
            else
                break;
        }

        var_14 = level._id_2A4D._id_29F9[0] - var_0;
        var_14 = ( var_14[0], var_14[1], 0 );
        var_15 = vectortoangles( var_14 )[1];
        var_16 = ( 1.0 - var_10 / var_8 ) * 180;
        var_11 = var_15 - var_16;
        var_12 = var_15 + var_16;
    }

    return var_9;
}

_id_6CA8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 0.0;

    if ( isdefined( var_2 ) )
        var_8 = var_2;

    var_9 = 1.0;

    if ( isdefined( var_3 ) )
        var_9 = var_3;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( !isdefined( var_7 ) )
        var_7 = 360;

    var_10 = _func_0214( var_1 * var_8 );
    var_11 = _func_0214( var_1 * var_9 );
    var_12 = undefined;

    if ( var_10 == var_11 )
        var_12 = _func_0213( var_10 );
    else
        var_12 = _func_0213( randomfloatrange( var_10, var_11 ) );

    var_13 = var_6 + randomfloat( var_7 - var_6 );
    var_14 = ( var_12 * cos( var_13 ), var_12 * sin( var_13 ), 0 );
    var_15 = var_0 + var_14;

    if ( var_4 )
        var_15 = scripts\engine\utility::_id_4FE0( ( var_0[0], var_0[1], 4000 ) + var_14 );

    if ( var_5 && _func_03D7() )
        var_15 = _func_02A6( var_15 );

    return var_15;
}

_id_6CAC( var_0, var_1 )
{
    var_2 = _id_69A6();
    var_3 = level._id_2A4D._id_29FF[level._id_29F5._id_370B + 1];
    return _id_6CA8( var_2, var_3, var_0, var_1 );
}

_id_899B( var_0 )
{
    if ( !isdefined( level._id_29F5._id_431C ) )
        return 0;

    var_1 = ( level._id_29F5._id_431C.origin[0], level._id_29F5._id_431C.origin[1], 0 );
    var_2 = level._id_2A4D._id_29FF[level._id_29F5._id_370B + 1];
    var_3 = distance2dsquared( var_0, var_1 );

    if ( var_3 < var_2 * var_2 )
        return 1;

    return 0;
}

_id_899D( var_0 )
{
    var_1 = _id_6B6D();
    var_2 = _id_6B6E();

    if ( !isdefined( var_1 ) || !isdefined( var_2 ) )
        return 0;

    var_3 = distance2dsquared( var_0, var_1 );

    if ( var_3 < var_2 * var_2 )
        return 1;

    return 0;
}

_id_431D()
{
    self endon( "death" );

    for (;;)
    {
        self show();

        foreach ( var_1 in level.players )
        {
            if ( !var_1 _id_B65E() )
                self hidefromplayer( var_1 );
        }

        level waittill( "update_circle_hide" );
    }
}

_id_0C16( var_0 )
{
    if ( getdvarint( "scr_br_badAreaKillswitch", 0 ) == 1 )
        return 0;

    if ( !isdefined( level._id_29EF ) || level._id_29EF.size == 0 )
        return 0;

    foreach ( var_2 in level._id_29EF )
    {
        var_3 = distance2dsquared( var_0, var_2.origin );

        if ( var_3 < var_2._id_BF35 )
            return 1;
    }

    return 0;
}

_id_0C74( var_0, var_1 )
{
    level._id_2A4D._id_29F9 = [];
    var_2 = ( level._id_29F5._id_9A93[0] + level._id_29F5._id_9A93[1] ) * 0.5;
    level._id_2A4D._id_29F9[0] = ( var_2[0], var_2[1], 0.0 );
    var_3 = getdvarfloat( "scr_br_circle_first_placement_scale", 0.0 );
    var_4 = var_3 * level._id_2A4D._id_29FF[1];
    var_5 = [];
    var_5[0] = level._id_29F5._id_9A93[0][0] - var_4;
    var_5[1] = level._id_29F5._id_9A93[0][1] - var_4;
    var_5[2] = level._id_29F5._id_9A93[1][0] + var_4;
    var_5[3] = level._id_29F5._id_9A93[1][1] + var_4;
    var_6 = min( var_5[0], var_5[2] );
    var_7 = max( var_5[0], var_5[2] );
    var_8 = min( var_5[1], var_5[3] );
    var_9 = max( var_5[1], var_5[3] );
    var_10 = var_2[0];
    var_11 = var_2[1];

    if ( isdefined( level._id_29F5._id_2A1F ) )
    {
        var_12 = level._id_29F5._id_2A1F[0];
        var_13 = level._id_29F5._id_2A1F[1];

        if ( scripts\mp\gametypes\br_c130::_id_8998( ( var_12, var_13, 0 ), 1 ) && !_id_0C16( ( var_12, var_13, 0 ) ) )
        {
            var_10 = var_12;
            var_11 = var_13;
        }
    }
    else
    {
        var_14 = 8;

        for ( var_15 = 0; var_15 < var_14; var_15++ )
        {
            var_12 = randomfloatrange( var_6, var_7 );
            var_13 = randomfloatrange( var_8, var_9 );

            if ( scripts\mp\gametypes\br_c130::_id_8998( ( var_12, var_13, 0 ), 1 ) && !_id_0C16( ( var_12, var_13, 0 ) ) )
            {
                var_10 = var_12;
                var_11 = var_13;
                break;
            }

            var_6 = var_6 * 0.9;
            var_7 = var_7 * 0.9;
            var_8 = var_8 * 0.9;
            var_9 = var_9 * 0.9;
        }
    }

    var_16 = level._id_2A4D._id_29FF.size - 1;
    level._id_2A4D._id_29F9[var_16] = scripts\engine\utility::_id_4FE0( ( var_10, var_11, 4000 ) );

    if ( istrue( var_1 ) )
        return;

    var_17 = getdvarfloat( "scr_br_circle_max_speed", 200 );
    var_18 = getdvarint( "scr_br_circle_clamp_max_circle_speed", 0 );
    var_19 = getdvarint( "scr_br_circle_snap_to_nav_mesh", 0 );

    if ( !var_19 && scripts\mp\gametypes\br_gametypes::_id_883A( "circleSnapToNavMesh" ) )
        var_19 = 1;

    for ( var_20 = var_16 - 1; var_20 >= 0; var_20-- )
    {
        var_21 = level._id_2A4D._id_29F9[var_20 + 1];
        var_22 = level._id_2A4D._id_29FF[var_20];
        var_23 = 0.0;
        var_24 = 1.0 - level._id_2A4D._id_29FF[var_20 + 1] / var_22;
        var_25 = var_23 + randomfloat( var_24 - var_23 );
        var_26 = level._id_2A4D._id_29FA[var_20];
        var_27 = level._id_2A4D._id_29FF[var_20 + 1];
        var_28 = var_22 - var_27;
        var_29 = var_28 / var_26;
        var_30 = max( 0, var_17 - var_29 );
        var_31 = var_30 * var_26;
        var_32 = var_31 / var_22;
        var_33 = var_25 > var_32;

        if ( var_33 && !istrue( var_0 ) )
        {
            var_34 = var_29 + var_25 * var_22 / var_26;
            _func_03BA( "dlog_event_br_circle_speed_warning", [ "player_speed", var_17, "circle_speed", var_34, "circle_close_time", float( var_26 ), "circle_current_radius", float( var_22 ), "circle_next_radius", float( var_27 ) ] );
        }

        if ( var_20 )
        {
            if ( var_18 && var_33 )
                var_25 = var_23 + randomfloat( var_32 - var_23 );

            level._id_2A4D._id_29F9[var_20] = _id_6CA7( var_21, var_22, var_25, var_25, 1, var_19, 1 );
            continue;
        }
    }

    level notify( "calc_circle_centers" );
}

_id_CA1C( var_0 )
{
    level endon( "game_ended" );
    level endon( "br_ending_start" );
    level._id_29F5._id_CABD = spawn( "script_model", ( level._id_2A4D._id_29F9[1][0], level._id_2A4D._id_29F9[1][1], level._id_2A4D._id_29FF[1] ) );
    level._id_29F5._id_CABD.hidden = 0;
    level._id_29F5._id_CABE = spawn( "script_model", level._id_29F5._id_CABD.origin );
    level._id_29F5._id_CABE.hidden = 0;
    level._id_29F5._id_431C = _func_0206( level._id_2A4D._id_29F9[0][0], level._id_2A4D._id_29F9[0][1], level._id_2A4D._id_29FF[0] );
    level._id_29F5._id_431C.hidden = 0;
    level._id_29F5._id_431C thread _id_431D();
    level._id_29F5._id_431F = spawn( "script_model", level._id_29F5._id_431C.origin );
    level._id_29F5._id_431F.hidden = 0;
    _id_D67D( level._id_29F5._id_CABD );
    _id_78D7();

    if ( istrue( var_0 ) )
        level waittill( "infils_ready" );

    if ( istrue( level._id_FE74 ) )
        scripts\mp\gametypes\br_gulag::_id_D86F();

    _id_DC92();
    level._id_29F5 thread _id_3705();

    for ( var_1 = 0; var_1 < level._id_2A4D._id_29FB.size; var_1++ )
        _id_3710( var_1 );

    scripts\mp\gametypes\br_armory_kiosk::_id_4A59();
}

_id_693B( var_0 )
{
    if ( !isdefined( level._id_29F5 ) )
        return -1;

    var_1 = -1;

    for ( var_2 = 0; var_2 < level._id_2A4D._id_29F9.size; var_2++ )
    {
        var_3 = level._id_2A4D._id_29F9[var_2];
        var_4 = level._id_2A4D._id_29FF[var_2];
        var_5 = distance2d( var_0, var_3 );

        if ( var_5 > var_4 )
            break;

        var_1 = var_2;
    }

    return var_1;
}

_id_6B3F( var_0 )
{
    if ( istrue( level._id_29F7 ) )
        return 99999;

    if ( !isdefined( level._id_29F5 ) )
        return -1;

    var_1 = 0.0;

    if ( level._id_29F5._id_370B >= 0 )
    {
        var_2 = level._id_29F5._id_370B;
        var_3 = level._id_29F5._id_E72A;
        var_4 = level._id_29F5._id_431C.origin[2];
        var_5 = level._id_29F5._id_431C.origin;
    }
    else
    {
        var_2 = 0;
        var_3 = gettime();
        var_4 = level._id_2A4D._id_29FF[0];
        var_5 = level._id_2A4D._id_29F9[0];
    }

    var_6 = _id_693B( var_0 );

    if ( var_6 < 0 )
        return var_1;
    else if ( var_6 < var_2 )
        return var_1;
    else if ( var_6 == var_2 )
    {
        if ( distance2d( var_5, var_0 ) > var_4 )
            return var_1;
    }

    for ( var_7 = var_2 + 1; var_7 < var_6; var_7++ )
    {
        var_1 = var_1 + level._id_2A4D._id_29FA[var_7];
        var_1 = var_1 + level._id_2A4D._id_29FB[var_7];
    }

    var_8 = level._id_2A4D._id_29FB[var_2];
    var_9 = level._id_2A4D._id_29FA[var_2];
    var_10 = ( gettime() - var_3 ) / 1000;

    if ( var_6 > var_2 )
    {
        var_11 = var_8 + var_9;
        var_1 = var_1 + ( var_11 - var_10 );
        var_1 = var_1 + level._id_2A4D._id_29FB[var_6];
        var_12 = level._id_2A4D._id_29FA[var_6];
        var_13 = level._id_2A4D._id_29F9[var_6];
        var_14 = level._id_2A4D._id_29F9[var_6 + 1];
        var_15 = level._id_2A4D._id_29FF[var_6];
        var_16 = level._id_2A4D._id_29FF[var_6 + 1];
    }
    else
    {
        if ( var_10 < var_8 )
        {
            var_1 = var_1 + ( var_8 - var_10 );
            var_12 = var_9;
        }
        else
            var_12 = var_9 - ( var_10 - var_8 );

        var_13 = var_5;
        var_14 = level._id_2A4D._id_29F9[var_2 + 1];
        var_15 = var_4;
        var_16 = level._id_2A4D._id_29FF[var_2 + 1];
    }

    var_15 = float( var_15 );
    var_16 = float( var_16 );
    var_17 = var_0[0];
    var_18 = var_17 * var_17;
    var_19 = var_13[0];
    var_20 = var_19 * var_19;
    var_21 = ( var_14[0] - var_13[0] ) / var_12;
    var_22 = var_21 * var_21;
    var_23 = var_0[1];
    var_24 = var_23 * var_23;
    var_25 = var_13[1];
    var_26 = var_25 * var_25;
    var_27 = ( var_14[1] - var_13[1] ) / var_12;
    var_28 = var_27 * var_27;
    var_29 = var_15;
    var_30 = var_29 * var_29;
    var_31 = ( var_16 - var_15 ) / var_12;
    var_32 = var_31 * var_31;
    var_33 = _func_0213( playrumbleonposition( 2 * var_17 * var_21 - 2 * var_19 * var_21 + 2 * var_23 * var_27 - 2 * var_25 * var_27 + 2 * var_29 * var_31, 2 ) - 4 * ( -1 * var_22 - var_28 + var_32 ) * ( -1 * var_18 + 2 * var_17 * var_19 - var_20 - var_24 + 2 * var_23 * var_25 - var_26 + var_30 ) );
    var_34 = -2 * var_17 * var_21 + 2 * var_19 * var_21 - 2 * var_23 * var_27 + 2 * var_25 * var_27 - 2 * var_29 * var_31;
    var_35 = 2 * ( -1 * var_22 - var_28 + var_32 );
    var_36 = ( -1 * var_33 + var_34 ) / var_35;
    var_37 = ( var_33 + var_34 ) / var_35;

    if ( var_36 < 0 )
        var_38 = var_37;
    else if ( var_37 < 0 )
        var_38 = var_36;
    else
        var_38 = min( var_36, var_37 );

    var_1 = var_1 + var_38;
    return var_1;
}

_id_78D7()
{
    if ( !isdefined( level._id_29F5 ) || !isdefined( level._id_29F5._id_431F ) )
        return;

    level._id_29F5._id_431F.hidden++;
    level._id_29F5._id_431C.hidden++;
    level notify( "update_circle_hide" );
}

_id_78FA()
{
    level._id_29F5._id_CABE.hidden++;
    level._id_29F5._id_CABD.hidden++;
    level notify( "update_circle_hide" );
}

_id_DC92()
{
    var_0 = level._id_29F5._id_431C.hidden || level._id_29F5._id_431C.hidden;
    level._id_29F5._id_431F.hidden--;
    level._id_29F5._id_431C.hidden--;
    var_1 = level._id_29F5._id_431F.hidden || level._id_29F5._id_431C.hidden;

    if ( var_0 && !var_1 )
        level notify( "update_circle_hide" );
}

_id_DCDE()
{
    var_0 = level._id_29F5._id_CABE.hidden || level._id_29F5._id_CABD.hidden;
    level._id_29F5._id_CABE.hidden--;
    level._id_29F5._id_CABD.hidden--;
    var_1 = level._id_29F5._id_CABE.hidden || level._id_29F5._id_CABD.hidden;

    if ( var_0 && !var_1 )
        level notify( "update_circle_hide" );
}

_id_3710( var_0 )
{
    if ( istrue( scripts\mp\gametypes\br_gametypes::_id_CA17( "circleTimer", var_0 ) ) )
        return;

    level._id_29F5._id_E72A = gettime();
    level._id_29F5._id_370B = var_0;
    var_1 = var_0 == 0;
    var_2 = var_0 == level._id_2A4D._id_29FA.size - 1;
    var_3 = level._id_2A4D._id_29FB[var_0];
    var_4 = level._id_2A4D._id_29FA[var_0];
    var_5 = level._id_2A4D._id_29FF[var_0 + 1];
    setomnvar( "ui_br_circle_num", var_0 + 1 );
    thread scripts\mp\gametypes\br_gulag::_id_3710( var_0 );
    level thread _id_2A4C( var_0 );
    var_6 = level._id_2A4D._id_29F9[var_0 + 1];
    level._id_29F5._id_336F = var_6;
    level._id_29F5._id_CABD.origin = ( level._id_29F5._id_336F[0], level._id_29F5._id_336F[1], var_5 );
    level._id_C690 = _id_61F5( var_6, var_5 );
    _id_3872();
    _id_61F4( var_6, var_5 );
    var_7 = level._id_2A4D._id_2A01[var_0];

    if ( var_7 > 0 )
    {
        _id_78D7();
        scripts\engine\utility::_id_46C3( var_7, ::_id_DC92 );
    }

    var_8 = level._id_2A4D._id_2A02[var_0];

    if ( var_8 > 0 )
    {
        _id_78FA();
        scripts\engine\utility::_id_46C3( var_8, ::_id_DCDE );
    }

    level thread _id_E732( var_3, var_1, var_2 );
    level._id_29F5._id_CABE.origin = level._id_29F5._id_CABD.origin;
    level._id_29F5._id_431F.origin = _id_69A6() + ( 0, 0, _id_69A7() );
    _id_D6E2( var_3, level._id_29F5._id_CABE, level._id_29F5._id_431F, var_2 );
    level thread _id_0CAE( var_3 );

    if ( var_1 )
        scripts\mp\gametypes\br_public::_id_2BB6( "first_circle", 1 );
    else
        scripts\mp\gametypes\br_public::_id_2BB6( "new_circle", 1 );

    if ( istrue( level._id_FE74 ) )
        level thread scripts\mp\gametypes\br_gulag::_id_F48F( var_5, var_3 );

    level notify( "br_circle_set" );
    wait( var_3 );
    level notify( "br_circle_started" );

    if ( scripts\mp\gametypes\br_public::_id_8773() )
        level._id_3703 = 1;

    setomnvar( "ui_hardpoint_timer", gettime() + int( var_4 * 1000 ) );

    if ( var_2 )
        scripts\mp\gametypes\br_public::_id_2BB6( "final_circle", 1 );
    else
        scripts\mp\gametypes\br_public::_id_2BB6( "circle_closing", 1 );

    thread _id_2B1F( var_0 );
    level._id_29F5._id_CABE.origin = level._id_29F5._id_CABD.origin;
    level._id_29F5._id_431F.origin = _id_69A6() + ( 0, 0, _id_69A7() );
    _id_D4C9( int( var_4 ), level._id_29F5._id_CABD, level._id_29F5._id_431F, var_2 );
    level._id_29F5._id_431C _meth_86DA( level._id_29F5._id_336F[0], level._id_29F5._id_336F[1], var_5, var_4 );
    thread _id_07CF::_id_2A0C( var_1, var_2 );
    wait( var_4 );
    var_9 = 5;

    if ( var_9 > 0 && var_0 < var_9 )
    {
        scripts\mp\rank::_id_108A( 1.2, "cirlceMult_" + scripts\engine\utility::_id_EA4F( var_0 ) );
        _id_07FD::_id_115F( 1.2, "cirlceMult_" + scripts\engine\utility::_id_EA4F( var_0 ) );
    }

    if ( scripts\mp\gametypes\br_public::_id_8773() )
        level._id_3703 = 0;

    _id_3873( var_6, var_5 );
}

_id_2A4C( var_0 )
{
    level endon( "game_ended" );

    if ( var_0 > 0 )
    {
        var_1 = var_0 - 1;
        var_2 = level._id_2A4D._id_29FE[var_0];
        var_3 = level._id_2A4D._id_29FE[var_1];

        if ( var_2 == var_3 )
            return;

        var_4 = 0.05;
        var_5 = 2;
        var_6 = var_5 / var_4;
        var_7 = int( ( var_3 - var_2 ) / var_6 );
        var_8 = level._id_2A4D._id_29FE[var_1];

        for ( var_9 = 0; var_9 < var_6; var_9++ )
        {
            var_8 = var_8 - var_7;
            setomnvar( "ui_br_minimap_radius", var_8 );
            wait( var_4 );
        }

        setomnvar( "ui_br_minimap_radius", level._id_2A4D._id_29FE[var_0] );
    }
    else
        setomnvar( "ui_br_minimap_radius", level._id_2A4D._id_29FE[var_0] );
}

_id_0CAE( var_0 )
{
    level endon( "game_ended" );

    if ( !getdvarint( "br_enable_circle_nuke", 0 ) )
        return;

    var_1 = var_0 - scripts\mp\gametypes\br_nuke::_id_690E() - 2.0;
    var_1 = max( 0.05, var_1 );
    wait( var_1 );
    var_2 = _id_69A6();
    var_3 = _id_69A7();
    var_4 = getdvarint( "scr_br_nukesPerCircle", 3 );
    var_5 = getdvarint( "scr_br_nukeAngleDelta", 5 );
    var_6 = 360 / var_4;
    var_7 = [];
    var_8 = randomint( 360 );

    for ( var_9 = 0; var_9 < var_4; var_9++ )
    {
        var_10 = int( var_8 + var_6 * var_9 ) % 360 + randomintrange( -1 * var_5, var_5 );
        var_11 = anglestoforward( ( 0, var_10, 0 ) );
        var_12 = var_2 + var_11 * randomfloatrange( var_3 + 8000, var_3 + 12000 );
        var_12 = scripts\engine\utility::_id_4FE0( var_12 + ( 0, 0, 10000 ) );
        var_7[var_7.size] = var_12;
    }

    level thread scripts\mp\gametypes\br_nuke::_id_90D1( var_7 );
}

_id_3873( var_0, var_1 )
{
    var_2 = var_1 * var_1;

    if ( isdefined( level._id_C7E7 ) )
    {
        foreach ( var_6, var_4 in level._id_C7E7 )
        {
            if ( isdefined( var_4 ) && distance2dsquared( var_0, var_4._id_047A.origin ) > var_2 )
            {
                var_5 = _id_61F5( var_4._id_047A.origin, var_1 );

                if ( isdefined( var_5 ) && var_5.size > 0 )
                    var_4._id_103C0 _id_07F6::_id_C310( var_5[0].origin );
                else
                    var_4._id_103C0 _id_07F6::_id_C528( var_6 );
            }
        }
    }
}

_id_61F5( var_0, var_1 )
{
    if ( isdefined( level._id_C690 ) )
    {
        var_2 = scripts\engine\utility::_id_634A( var_0, level._id_C690, undefined, undefined, var_1 );
        return var_2;
    }

    return undefined;
}

_id_61F4( var_0, var_1 )
{
    var_2 = var_1 * var_1;

    foreach ( var_4 in level._id_2A6F._id_3E79 )
    {
        if ( isdefined( var_4 ) && distance2dsquared( var_0, var_4.origin ) > var_2 )
            level._id_2A6F._id_AC9A[level._id_2A6F._id_AC9A.size] = var_4;
    }
}

_id_3872()
{
    foreach ( var_1 in level._id_2A6F._id_AC9A )
    {
        if ( isdefined( var_1 ) && var_1._id_4122 == 0 )
            var_1 thread scripts\cp_mp\killstreaks\airdrop::_id_4822();
    }

    level._id_2A6F._id_AC9A = [];
}

_id_19A3()
{
    var_0 = getdvarfloat( "scr_br_circle_time_scale", 1.0 );
    var_1 = level._id_2A4D;
    var_1._id_29FA = _id_0B12( var_1._id_29FA, "close_time", var_0 );
    var_1._id_29FB = _id_0B12( var_1._id_29FB, "delay_time", var_0 );
    var_1._id_2A01 = _id_0B12( var_1._id_2A01, "show_delay_danger", var_0 );
    var_1._id_2A02 = _id_0B12( var_1._id_2A02, "show_delay_safe", var_0 );

    if ( !isdefined( var_1._id_2A00 ) )
        var_1._id_2A00 = level._id_2A4D._id_29FF[0];

    _id_1CC4();
}

_id_0B12( var_0, var_1, var_2 )
{
    var_3 = getdvarfloat( "scr_br_circle_" + var_1 + "_scale", 1.0 );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = getdvarfloat( "scr_br_circle_override_" + var_1 + "_" + var_4, -1.0 );

        if ( var_5 > 0 )
            var_0[var_4] = var_5;

        var_0[var_4] = var_0[var_4] * var_2;
        var_0[var_4] = var_0[var_4] * var_3;
    }

    return var_0;
}

_id_1CC4()
{
    _id_370F( isdefined( level._id_2A4D._id_29FA ), "level.br_level.br_circleCloseTimes not defined" );
    _id_370F( isdefined( level._id_2A4D._id_29FB ), "level.br_level.br_circleDelayTimes not defined" );
    _id_370F( isdefined( level._id_2A4D._id_2A01 ), "level.br_level.br_circleShowDelayDanger not defined" );
    _id_370F( isdefined( level._id_2A4D._id_2A02 ), "level.br_level.br_circleShowDelaySafe not defined" );
    _id_370F( isdefined( level._id_2A4D._id_29FE ), "level.br_level.br_circleMinimapRadii not defined" );
    _id_370F( isdefined( level._id_2A4D._id_29FF ), "level.br_level.br_circleDelayTimes not defined" );
    var_0 = level._id_2A4D._id_29FA.size;
    _id_370F( var_0 == level._id_2A4D._id_29FB.size, "level.br_level.br_circleDelayTimes size != " + var_0 );
    _id_370F( var_0 == level._id_2A4D._id_2A01.size, "level.br_level.br_circleShowDelayDanger size != " + var_0 );
    _id_370F( var_0 == level._id_2A4D._id_2A02.size, "level.br_level.br_circleShowDelaySafe size != " + var_0 );
    _id_370F( var_0 == level._id_2A4D._id_29FE.size, "level.br_level.br_circleMinimapRadii size != " + var_0 );
    _id_370F( var_0 == level._id_2A4D._id_29FF.size - 1, "level.br_level.br_circleRadii size-1 != " + var_0 );

    for ( var_1 = 0; var_1 < level._id_2A4D._id_2A01.size; var_1++ )
    {
        var_2 = level._id_2A4D._id_29FB[var_1];
        var_3 = level._id_2A4D._id_2A01[var_1];
        _id_370F( var_3 <= var_2, "level.br_level.br_circleShowDelayDanger[" + var_1 + "] " + var_2 + " > " + var_3 );
    }

    for ( var_1 = 0; var_1 < level._id_2A4D._id_29FB.size; var_1++ )
    {
        var_2 = level._id_2A4D._id_29FB[var_1];
        var_3 = level._id_2A4D._id_2A02[var_1];
        _id_370F( var_3 <= var_2, "level.br_level.br_circleDelayTimes[" + var_1 + "] " + var_2 + " > " + var_3 );
    }

    _id_370F( level._id_2A4D._id_29FF[0] == level._id_2A4D._id_2A00, "Changing circle radius 0 is not supported" );
}

_id_370F( var_0, var_1 )
{
    if ( !var_0 )
        return;
}

_id_693A( var_0 )
{
    if ( !isdefined( level._id_2A4D ) )
        return 0;

    if ( !isdefined( level._id_2A4D._id_29FB ) || !level._id_2A4D._id_29FB.size )
        return 0;

    var_1 = level._id_2A4D._id_29FB.size;

    if ( var_0 >= var_1 )
        var_0 = var_1 - 1;

    var_2 = 0;

    for ( var_3 = 0; var_3 <= var_0; var_3++ )
    {
        var_4 = level._id_2A4D._id_29FB[var_3];
        var_5 = level._id_2A4D._id_29FA[var_3];
        var_2 = var_2 + var_4 + var_5;
    }

    return var_2;
}

_id_2B1F( var_0 )
{
    var_1 = level._id_2A4D._id_29FB[var_0] / 5;
    wait( var_1 );

    foreach ( var_3 in level._id_EF86 )
        level thread _id_4E63( level._id_EF67[var_3] );
}

_id_4E63( var_0 )
{
    var_1 = _id_6CE3();
    var_2 = _id_6CE4();

    if ( var_0["alivePlayers"].size <= 1 )
        return;

    var_3 = _func_01FF( var_0["alivePlayers"], var_1 );
    var_4 = distance2dsquared( var_1, var_3[0].origin );

    if ( var_4 > var_2 * var_2 )
    {
        if ( var_4 > var_2 * var_2 * 4 )
            level thread scripts\mp\battlechatter_mp::_id_F756( var_3[0], "obj_sitrep_circle_outfar" );
        else
            level thread scripts\mp\battlechatter_mp::_id_F756( var_3[0], "obj_sitrep_circle_out" );
    }
    else
    {
        var_5 = distance2dsquared( var_1, var_3[var_3.size - 1].origin );

        if ( var_5 > var_2 * var_2 )
            level thread scripts\mp\battlechatter_mp::_id_F756( var_3[0], "obj_sitrep_circle_mixed" );
        else
            level thread scripts\mp\battlechatter_mp::_id_F756( var_3[0], "obj_sitrep_circle_in" );
    }
}

_id_3FDD( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.origin = var_0;
    var_2._id_0333 = var_1;
    var_2._id_BF35 = var_1 * var_1;
    return var_2;
}
