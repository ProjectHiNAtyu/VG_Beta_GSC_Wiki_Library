// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "flamethrower", ::_id_F77C );
}

_id_F77C( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

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

    if ( !scripts\mp\utility\player::isreallyalive( self ) )
        return 0;

    return 1;
}

_id_EC38()
{

}
