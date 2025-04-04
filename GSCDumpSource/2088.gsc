// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_DF13( var_0 )
{

}

_id_1E54( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 thread _id_1EDB( var_0 );
    var_1 waittill( "slo_mo_wait_done" );
    var_1 delete();
}

_id_1EDB( var_0 )
{
    var_1 = 0;

    while ( var_1 < var_0 )
    {
        var_2 = getdvarfloat( "#x3755eda79e7680393" );
        var_1 = var_1 + 0.05 / var_2;
        wait 0.05;
    }

    self notify( "slo_mo_wait_done" );
}

_id_1E50( var_0, var_1 )
{
    var_2 = var_0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    return var_2;
}

_id_DEF8()
{
    level._id_0CD7._id_723F++;
    return level._id_0CD7._id_723F;
}

_id_DF37( var_0 )
{
    var_1 = 0;

    if ( isdefined( level.players ) )
    {
        foreach ( var_3 in level.players )
        {
            if ( var_0 == var_3 )
                return 1;
        }
    }

    return var_1;
}

_id_DF38( var_0 )
{
    var_1 = 1;

    if ( !_func_0106( var_0 ) )
        var_1 = 0;
    else
    {
        foreach ( var_3 in var_0 )
        {
            var_4 = 1;

            foreach ( var_6 in level.players )
            {
                if ( var_3 == var_6 )
                {
                    var_4 = 0;
                    break;
                }
            }

            if ( var_4 )
            {
                var_1 = 0;
                break;
            }
        }
    }

    return var_1;
}

_id_DEC9( var_0, var_1 )
{
    var_2 = level.player;
    var_3 = 0;
    var_4 = anglestoforward( var_2.angles );
    var_5 = var_0 - var_2.origin;
    var_6 = vectordot( var_4, var_5 );

    if ( isdefined( var_1 ) )
    {
        var_3 = var_1;

        if ( var_1 > 90 )
            var_1 = 90;

        if ( var_3 < 0 )
            var_3 = 0;
    }

    return var_6 > var_3;
}

_id_DECF( var_0, var_1 )
{
    if ( !isdefined( level._id_0CD7._id_BFC1 ) )
    {
        level._id_0CD7._id_BFC1 = spawnstruct();
        level._id_0CD7._id_BFC1._id_EAC9 = var_0;
        level._id_0CD7._id_BFC1._id_BFC0 = 0;
    }

    var_2 = [ var_0, var_1 ];

    foreach ( var_4 in var_2 )
    {
        if ( var_4 > 100 )
            var_4 = 100;

        if ( var_4 < 1 )
            var_4 = 1;
    }

    var_6 = randomintrange( 1, 100 );
    var_7 = level._id_0CD7._id_BFC1._id_EAC9 + level._id_0CD7._id_BFC1._id_BFC0;

    if ( var_6 <= var_7 )
    {
        level._id_0CD7._id_BFC1._id_BFC0 = 0;
        return 1;
    }

    if ( var_6 >= var_7 )
    {
        level._id_0CD7._id_BFC1._id_BFC0 = level._id_0CD7._id_BFC1._id_BFC0 + var_1;
        return 0;
    }
}

_id_DEDB()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.sort = 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1.0;
    var_0._id_01C0 = 1;
    wait 0.05;
    var_0 destroy();
}

_id_DF19( var_0 )
{
    _id_DEDB();
    _id_DF13( "SLATE: " + var_0 );
}

_id_DF1A( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_1E50( var_2, var_3 );
    var_5 = 1.0;

    if ( var_1 > var_0 )
        var_5 = var_2;
    else if ( var_1 < var_0 )
        var_5 = var_4;

    return var_0 + var_5 * ( var_1 - var_0 );
}

_id_DF2C()
{
    if ( self._id_010E >= self._id_9BF4 )
        wait 0.05;
    else
        self._id_010E++;

    if ( !self._id_C5E4 )
        thread _id_DF2D();
}

_id_DF2D()
{
    self._id_C5E4 = 1;
    waittillframeend;
    self._id_C5E4 = 0;
    self._id_010E = 0;
}

_id_DEDF( var_0 )
{
    var_1 = spawnstruct();
    var_1.name = "throttle_waiter";
    var_1._id_010E = 0;
    var_1._id_C5E4 = 0;
    var_2 = 10;

    if ( isdefined( var_0 ) )
        var_2 = max( var_0, 1 );

    var_1._id_9BF4 = var_2;
    return var_1;
}

_id_DEF3( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_B9F0 = [];
    var_3._id_B168 = var_0;
    var_3._id_3C5C = _id_1E50( 0, var_2 );
    var_4 = _id_1E50( [ 10, 10 ], var_1 );
    var_5 = 11;
    var_6 = 1;
    var_7 = [];

    foreach ( var_9 in var_3._id_B168 )
        var_7[var_7.size] = var_9["name"];

    var_3._id_7B0A = _id_DEE3( var_7, var_4, var_5, var_6 );
    var_3 thread _id_DF3E();
    return var_3;
}

_id_DF3E()
{
    for (;;)
    {
        foreach ( var_1 in self._id_B168 )
        {
            var_2 = distance( level.player.origin, var_1["origin"] );

            if ( self._id_3C5C )
                var_2 = var_2 / 36 + "yds";

            self._id_7B0A _id_DEE8( var_1["name"], var_2 );
        }

        waitframe();
    }
}

_id_DEE3( var_0, var_1, var_2, var_3 )
{

}

_id_DEE8( var_0, var_1 )
{

}

_id_DEE4( var_0 )
{
    foreach ( var_2 in self._id_8E67 )
        _id_DEE8( var_2, "" );
}

_id_DEE7( var_0, var_1 )
{

}

_id_DEE5( var_0, var_1, var_2 )
{

}

_id_DF3C( var_0, var_1, var_2 )
{

}

_id_DF3D( var_0 )
{

}

_id_DEE6()
{

}
