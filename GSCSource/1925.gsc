// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_DFE8 = getentarray( "trigger_multiple_softlanding", "classname" );
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in level._id_DFE8 )
    {
        if ( var_2._id_CE96 != "car" )
            continue;

        foreach ( var_4 in var_0 )
        {
            if ( distance( var_2.origin, var_4.origin ) > 64.0 )
                continue;

            var_2._id_484B = var_4;
        }
    }

    thread _id_AB46();
}

_id_AB46()
{
    if ( scripts\mp\utility\game::_id_CA3E() )
        return;

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_DFE7 = undefined;
        var_0 thread _id_DFE9();
    }
}

_id_B68F( var_0 )
{
    self._id_DFE7 = var_0;
}

_id_B6F7( var_0 )
{
    self._id_DFE7 = undefined;
}

_id_DFE9()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "soft_landing", var_0, var_1 );

        if ( !isdefined( var_0._id_484B ) )
            continue;
    }
}
