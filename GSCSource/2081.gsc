// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_94D0( var_0, var_1, var_2, var_3, var_4, var_5 )
{

}

_id_7B7A( var_0 )
{
    var_1 = 480 / var_0;
    return var_1;
}

_id_CC7A( var_0, var_1 )
{
    var_1 = scripts\engine\utility::_id_FF6A( var_1, _id_0827::_id_6E26() );
    var_2 = _id_7B7A( var_1[1] );
    var_3 = var_0[0] * var_2;
    var_4 = var_0[1] * var_2;
    return [ int( var_3 ), int( var_4 ) ];
}

_id_CC60( var_0, var_1 )
{
    var_1 = scripts\engine\utility::_id_FF6A( var_1, _id_0827::_id_6E26() );
    var_2 = _id_7B7A( var_1[1] );
    var_3 = var_0[0] * var_2;
    var_4 = var_0[1] * var_2;
    var_5 = var_1[0] / var_1[1];
    var_6 = var_5 * 480;
    var_7 = -0.5 * ( var_6 - 640 );
    var_3 = var_3 + var_7;
    return [ var_3, var_4 ];
}

_id_0D28()
{
    if ( isdefined( level._id_0B29 ) == 1 )
        return;

    level._id_0B29 = thisthread;

    while ( isdefined( level._id_0B28 ) == 1 )
    {
        var_0 = gettime();
        var_1 = [];

        foreach ( var_3 in level._id_0B28 )
        {
            if ( var_3._id_5070 > 0 )
            {
                var_1[var_1.size] = var_3;

                if ( var_3._id_F1E5 == var_0 )
                    continue;

                var_3._id_5070 = var_3._id_5070 - 1;

                if ( var_3._id_F21A <= var_0 )
                {
                    var_3.alpha = 0.0;
                    var_3 settext( "" );
                }

                continue;
            }

            var_3 destroy();
        }

        level._id_0B28 = var_1;
        waitframe();
    }
}

_id_0D27( var_0 )
{
    var_1 = undefined;
    var_2 = gettime();
    var_3 = var_0 * 50;
    return var_1;
}

_id_0D26( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = 640;
    var_8 = 480;
    var_9 = var_7 / var_8;
    var_10 = _id_0827::_id_6E26();
    var_11 = var_10[0];
    var_12 = var_10[1];
    var_13 = var_11 / var_12;
    var_14 = -0.5 * ( var_8 * var_13 - var_7 );
    var_15 = var_0 / var_11 * var_7 + ( 1.0 - var_0 / ( var_11 * 0.5 ) ) * var_14;
    var_16 = var_1 / var_12 * var_8;

    if ( isdefined( level._id_0B28 ) == 0 )
        level._id_0B28 = [];

    level thread _id_0D28();
    var_17 = _id_0D27( var_6 );
    var_17.x = var_15;
    var_17.y = var_16;
    var_17 settext( var_2 );
    var_17.color = var_3;
    var_17.alpha = var_4;
    var_17.fontscale = var_5 * 0.5;
    var_17.font = "smallfixed";
    var_17.alignx = "left";
    var_17.aligny = "bottom";
    var_17._id_7A18 = "fullscreen";
    var_17.vertalign = "fullscreen";
    var_17.xoffset = 0;
    var_17.yoffset = 0;
    var_17._id_10FD4 = 0;
    var_17._id_10FF7 = 0;
}
