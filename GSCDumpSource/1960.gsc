// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8183()
{
    if ( !isdefined( game["flags"] ) )
        game["flags"] = [];
}

_id_60A1( var_0, var_1 )
{
    game["flags"][var_0] = var_1;
}

_id_609F( var_0 )
{
    return game["flags"][var_0];
}

_id_60A2( var_0 )
{
    game["flags"][var_0] = 1;
    level notify( var_0 );
}

_id_60A0( var_0 )
{
    game["flags"][var_0] = 0;
}

_id_60A3( var_0 )
{
    while ( !_id_609F( var_0 ) )
        level waittill( var_0 );
}

_id_81F4()
{
    if ( !isdefined( level._id_933D ) )
        level._id_933D = [];
}

_id_933C( var_0, var_1 )
{
    level._id_933D[var_0] = var_1;
}

_id_933A( var_0 )
{
    return level._id_933D[var_0];
}

_id_933E( var_0 )
{
    level._id_933D[var_0] = 1;
    level notify( var_0 );
}

_id_933B( var_0 )
{
    level._id_933D[var_0] = 0;
    level notify( var_0 );
}

_id_933F( var_0 )
{
    while ( !_id_933A( var_0 ) )
        level waittill( var_0 );
}

_id_9340( var_0 )
{
    while ( _id_933A( var_0 ) )
        level waittill( var_0 );
}
