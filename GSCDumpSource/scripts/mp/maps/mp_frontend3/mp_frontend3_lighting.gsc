// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    setdvar( "sm_sunsamplesizenear", 0.33 );
    setdvar( "#x312bde0b04f4a20b2", 2 );
    setdvar( "sm_sundistantshadows", 0 );
    setdvar( "#x3bc18709a4d8978a1", 500 );
    setdvar( "#x3f4dc153e09c98ef7", 1 );
    setdvar( "#x3ba1e000006a1372a", 8 );
    waitframe();
    setdvar( "#x352b7fb15df055cdf", 2 );
    setdvar( "r_screenspaceshadowsspotscenetraceauto", "0" );
    scripts\engine\utility::_id_5BF1( "flare_on" );
    scripts\engine\utility::_id_5BF1( "flare_flicker" );
    thread flare_lgt_pos_lerp();
    scripts\engine\utility::_id_5BF1( "flare_on_op" );
    thread flare_lgt_pos_lerp_op();
    thread tile_lighting();
}

operator_close()
{
    setdvar( "#x36af6193173cfec36", 0 );
    setdvar( "#x31435471c219db8c7", 16 );
}

operator_far()
{
    setdvar( "#x36af6193173cfec36", 0 );
    setdvar( "#x31435471c219db8c7", 16 );
}

weapons_close()
{
    iprintlnbold( "weapons_close" );
    setdvar( "#x36af6193173cfec36", 0 );
    setdvar( "#x31435471c219db8c7", 16 );
    setdvar( "#x3ba1e000006a1372a", 12 );
}

weapons_far()
{
    setdvar( "#x36af6193173cfec36", 0 );
    setdvar( "#x31435471c219db8c7", 16 );
}

lobby_close()
{
    setdvar( "#x33d02587c91388bcc", "128 384 640 4096" );
    setdvar( "#x36af6193173cfec36", 0 );
    thread lerp_spot_intensity( "lobbyWalk_fire_01", 0.1, 0.1 );
    thread lerp_spot_intensity( "lobbyWalk_fire_02", 0.1, 0.1 );
    thread lerp_spot_intensity( "lobbyWalk_fill_01", 0.1, 0.03 );
}

lobby_far()
{
    setdvar( "#x33d02587c91388bcc", "1024 1024 1024 4096" );
    setdvar( "#x36af6193173cfec36", 0 );
    setdvar( "#x384c1a54e64859aaa", 16 );
}

flare_lgt_pos_lerp()
{
    wait 5;
    var_0 = getent( "flare_lgt", "targetname" );
    var_0 _meth_8337( 0 );
    var_0 _meth_8333( ( 1, 0.95, 0.9 ) );
    var_1 = var_0.origin;
    var_2 = getent( "lobby_charslot_01", "targetname" );
    var_3 = scripts\engine\utility::_id_6D7A( "pos_1", "targetname" );
    var_4 = scripts\engine\utility::_id_6D7A( "pos_2", "targetname" );
    var_5 = scripts\engine\utility::_id_6D7A( "pos_3", "targetname" );
    var_6 = scripts\engine\utility::_id_6D7A( "pos_4", "targetname" );
    var_7 = scripts\engine\utility::_id_6D7A( "pos_5", "targetname" );
    var_8 = scripts\engine\utility::_id_6D7A( "pos_6", "targetname" );
    var_9 = scripts\engine\utility::_id_6D7A( "pos_7", "targetname" );
    var_10 = scripts\engine\utility::_id_6D7A( "pos_8", "targetname" );
    var_11 = scripts\engine\utility::_id_6D7A( "pos_9", "targetname" );
    var_12 = scripts\engine\utility::_id_6D7A( "pos_10", "targetname" );
    var_13 = scripts\engine\utility::_id_6D7A( "pos_11", "targetname" );
    var_14 = scripts\engine\utility::_id_6D7A( "pos_12", "targetname" );

    if ( scripts\engine\utility::_id_5BE0( "flare_on" ) == 0 )
    {
        scripts\engine\utility::_id_5BFB( "flare_on" );
        thread lock_to_character( var_0, var_2 );

        while ( scripts\engine\utility::_id_5BE0( "flare_on" ) )
        {
            thread spot_lerp_origin( var_0, 3, var_3.origin );
            wait 4;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 9, 13, 3, 6 );
            thread spot_lerp_origin( var_0, 5, var_4.origin );
            wait 6;
            thread spot_lerp_origin( var_0, 5, var_5.origin );
            wait 5;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 10;
            thread spot_lerp_origin( var_0, 1, var_6.origin );
            wait 2;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 7, 16, 3, 5 );
            thread spot_lerp_origin( var_0, 3, var_7.origin );
            wait 4;
            thread spot_lerp_origin( var_0, 3, var_8.origin );
            wait 4;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 8;
            thread spot_lerp_origin( var_0, 1, var_9.origin );
            wait 2;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 8, 18, 2, 6 );
            thread spot_lerp_origin( var_0, 3, var_10.origin );
            wait 4;
            thread spot_lerp_origin( var_0, 3, var_11.origin );
            wait 4;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 9;
            thread spot_lerp_origin( var_0, 1, var_12.origin );
            wait 2;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 8, 18, 2, 6 );
            thread spot_lerp_origin( var_0, 4, var_13.origin );
            wait 5;
            thread spot_lerp_origin( var_0, 4, var_14.origin );
            wait 5;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 8;
        }
    }
}

flare_lgt_pos_lerp_op()
{
    wait 5;
    var_0 = getent( "flare_lgt_op", "targetname" );
    var_0 _meth_8337( 15 );
    var_0 _meth_8333( ( 1, 0.95, 0.9 ) );
    var_1 = var_0.origin;
    var_2 = getent( "charroom_char_west_b", "targetname" );
    var_3 = scripts\engine\utility::_id_6D7A( "pos_13", "targetname" );
    var_4 = scripts\engine\utility::_id_6D7A( "pos_14", "targetname" );
    var_5 = scripts\engine\utility::_id_6D7A( "pos_15", "targetname" );
    var_6 = scripts\engine\utility::_id_6D7A( "pos_16", "targetname" );
    var_7 = scripts\engine\utility::_id_6D7A( "pos_17", "targetname" );
    var_8 = scripts\engine\utility::_id_6D7A( "pos_18", "targetname" );
    var_9 = scripts\engine\utility::_id_6D7A( "pos_19", "targetname" );
    var_10 = scripts\engine\utility::_id_6D7A( "pos_20", "targetname" );
    var_11 = scripts\engine\utility::_id_6D7A( "pos_21", "targetname" );

    if ( scripts\engine\utility::_id_5BE0( "flare_on_op" ) == 0 )
    {
        scripts\engine\utility::_id_5BFB( "flare_on_op" );
        thread lock_to_character_op( var_0, var_2 );

        while ( scripts\engine\utility::_id_5BE0( "flare_on_op" ) )
        {
            thread spot_lerp_origin( var_0, 3, var_3.origin );
            wait 4;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 9, 17, 3, 6 );
            thread spot_lerp_origin( var_0, 3, var_4.origin );
            wait 4;
            thread spot_lerp_origin( var_0, 4, var_5.origin );
            wait 5;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 8;
            thread spot_lerp_origin( var_0, 3, var_6.origin );
            wait 4;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 9, 14, 3, 6 );
            thread spot_lerp_origin( var_0, 5, var_7.origin );
            wait 6;
            thread spot_lerp_origin( var_0, 5, var_8.origin );
            wait 5;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 6;
            thread spot_lerp_origin( var_0, 3, var_9.origin );
            wait 4;
            scripts\engine\utility::_id_5BFB( "flare_flicker" );
            thread flare_flicker( var_0, 9, 15, 3, 6 );
            thread spot_lerp_origin( var_0, 3, var_10.origin );
            wait 2;
            thread spot_lerp_origin( var_0, 3, var_11.origin );
            wait 2;
            scripts\engine\utility::_id_5BE4( "flare_flicker" );
            wait 7;
        }

        thread spot_lerp_origin( var_0, 4, var_1.origin );
    }
}

flare_flicker( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_2;

    for ( var_6 = 0; scripts\engine\utility::_id_5BE0( "flare_flicker" ); var_5 = var_6 )
    {
        var_6 = randomfloatrange( var_1, var_2 );
        var_7 = randomfloatrange( var_3, var_4 );
        var_7 = var_7 * 0.75;

        for ( var_8 = 0; var_8 < var_7; var_8++ )
        {
            var_9 = var_6 * ( var_8 / var_7 ) + var_5 * ( ( var_7 - var_8 ) / var_7 );
            var_0 _meth_8337( var_9 );
            wait 0.05;
        }
    }

    thread flare_lerp_down( var_0, var_1, var_2, var_6, 4.0 );
}

flare_lerp_down( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_6 = randomfloatrange( var_1, var_2 );
    var_7 = gettime();
    var_8 = gettime() + var_4 * 1000.0;
    var_9 = var_4 / 0.05;

    for ( var_10 = 0; var_10 < var_9; var_10++ )
    {
        var_11 = gettime() - var_7;
        var_12 = _func_0432( 0, var_4 * 1000.0, 1.0, 0.0, var_11 );
        var_13 = var_6 * ( var_10 / var_9 ) + var_5 * ( ( var_9 - var_10 ) / var_9 );
        var_13 = var_13 * var_12;
        var_0 _meth_8337( var_13 );
        wait 0.05;
        var_5 = var_6;
    }
}

_id_5B12( var_0, var_1, var_2, var_3, var_4 )
{
    for ( var_5 = var_2; scripts\engine\utility::_id_5BE0( "fire_flicker" ); var_5 = var_6 )
    {
        var_6 = randomfloatrange( var_1, var_2 );
        var_7 = randomfloatrange( var_3, var_4 );
        var_7 = var_7 * 0.75;

        for ( var_8 = 0; var_8 < var_7; var_8++ )
        {
            var_9 = var_6 * ( var_8 / var_7 ) + var_5 * ( ( var_7 - var_8 ) / var_7 );
            var_0 _meth_8337( var_9 );
            wait 0.05;
        }
    }
}

spot_lerp_origin( var_0, var_1, var_2 )
{
    var_0 notify( "stop lerp" );
    var_0 endon( "stop lerp" );
    var_0 endon( "death" );
    var_3 = var_0.origin;
    var_4 = 0;

    while ( var_4 < var_1 )
    {
        var_0.origin = _func_0259( var_3, var_2, var_4 / var_1 );
        var_4 = var_4 + 0.05;
        wait 0.05;
    }

    var_0.origin = var_2;
}

lerp_spot_intensity( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( !isdefined( var_3 ) )
        return;

    var_3 endon( "death" );
    var_4 = var_3 _meth_8146();
    var_3.endintensity = var_2;
    var_5 = 0;

    while ( var_5 < var_1 )
    {
        var_6 = var_4 + ( var_2 - var_4 ) * ( var_5 / var_1 );
        var_5 = var_5 + 0.05;
        var_3 _meth_8337( var_6 );
        wait 0.05;
    }

    var_3 _meth_8337( var_2 );
}

lock_to_character( var_0, var_1 )
{
    for (;;)
    {
        var_2 = var_1.origin - var_0.origin;
        var_3 = vectortoangles( var_2 );
        var_0.angles = var_3;
        waitframe();
    }
}

lock_to_character_op( var_0, var_1 )
{
    for (;;)
    {
        var_2 = var_1.origin - var_0.origin;
        var_3 = vectortoangles( var_2 );
        var_0.angles = var_3;
        waitframe();
    }
}

tile_lighting()
{
    wait 0.5;
    var_0 = getentarray( "envLights_tile_01", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2._id_AC74 = var_2 _meth_8146();

    for (;;)
    {
        if ( scripts\engine\utility::_id_5BE0( "floor1" ) )
        {
            if ( isdefined( var_0 ) )
            {
                foreach ( var_2 in var_0 )
                    var_2 _meth_8337( 0 );
            }
        }

        if ( !scripts\engine\utility::_id_5BE0( "floor1" ) )
        {
            if ( isdefined( var_0 ) )
            {
                foreach ( var_2 in var_0 )
                    var_2 _meth_8337( var_2._id_AC74 );
            }
        }

        wait 0.05;
    }
}
