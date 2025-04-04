// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_90D1( var_0 )
{
    var_1 = 0.2;
    var_2 = 0.6;
    var_3 = 0;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        level thread _id_0C20( var_0[var_4] );

        if ( var_4 < var_0.size - 1 )
        {
            var_5 = randomfloatrange( var_1, var_2 );
            var_3 = var_3 + var_5;
            wait( var_5 );
        }
    }

    level thread _id_0C32( var_3 );
}

_id_690E()
{
    return getdvarfloat( "scr_br_nukeTravelTime", 8.0 );
}

_id_0C32( var_0 )
{
    var_1 = _id_690E();
    var_2 = 2.0;
    var_3 = 10.0;
    var_4 = var_1 - var_0;
    wait( var_4 );

    if ( getdvarint( "br_nuke_vision_per_player", 1 ) > 0 )
    {
        for ( var_5 = 0; var_5 < level.players.size; var_5++ )
        {
            if ( isdefined( level.players[var_5] ) && !level.players[var_5] scripts\mp\gametypes\br_public::_id_8976() )
                level.players[var_5] visionsetmissilecamforplayer( "br_nuke_global_flash", 0.2 );
        }
    }
    else
        visionsetnaked( "br_nuke_global_flash", 0.2 );

    level._id_A721 = 1;
    wait( var_2 + var_0 );

    if ( getdvarint( "br_nuke_vision_per_player", 1 ) > 0 )
    {
        for ( var_5 = 0; var_5 < level.players.size; var_5++ )
        {
            if ( isdefined( level.players[var_5] ) && !level.players[var_5] scripts\mp\gametypes\br_public::_id_8976() )
                level.players[var_5] visionsetmissilecamforplayer( "br_nuke_global_aftermath", 2.0 );
        }
    }
    else
        visionsetnaked( "br_nuke_global_aftermath", 2.0 );

    level._id_A721 = 0;
    wait( var_3 );
    visionsetnaked( "", 3.0 );
}

_id_0C20( var_0 )
{
    var_1 = "nuke_mp";
    var_2 = _id_690E();
    var_3 = "ks_nuke_br";
    var_4 = 100000;
    var_5 = 5.0;
    var_6 = scripts\mp\gametypes\br_circle::_id_69A6();
    var_7 = var_0 - var_6;
    var_7 = vectornormalize( ( var_7[0], var_7[1], 0 ) );
    var_8 = var_0 + var_7 * 20000 + ( 0, 0, 30000 );
    playsoundatpos( var_8, "iw8_nuke_dist_launch" );
    var_9 = ( 0, 0, -1 * getdvarint( "#x3f7e9b59e29bb9d7e", 800 ) );
    var_10 = ( var_0 - 0.5 * var_9 * _func_0214( var_2 ) - var_8 ) / var_2;
    var_11 = magicgrenademanual( var_1, var_8, var_10, var_2 );
    var_11 setscriptablepartstate( "launch", "on", 0 );
    wait( var_2 );
    var_12 = var_11.origin;
    var_11 setscriptablepartstate( "launch", "off", 0 );
    var_11 delete();
    var_13 = spawn( "script_model", var_12 );
    var_13 setmodel( var_3 );
    var_14 = var_6 - var_12;
    var_14 = vectornormalize( ( var_14[0], var_14[1], 0 ) );
    var_13.angles = vectortoangles( var_14 );
    var_13 setscriptablepartstate( "explode", "on", 0 );
    var_13 thread _id_0A78::_id_46A6( 50 );
    playsoundatpos( var_12, "iw8_nuke_impact_low" );
    playsoundatpos( var_12, "iw8_nuke_incoming_blast_wave" );
    playsoundatpos( var_12, "iw8_nuke_blast" );
    playsoundatpos( var_12, "iw8_nuke_blast_tail" );
    earthquake( 0.4, var_5, var_12, var_4 );
    wait( var_5 );
    earthquake( 0.3, 1, var_12, var_4 );
}
