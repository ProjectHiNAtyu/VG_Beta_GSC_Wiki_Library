// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_AB58( var_0 )
{
    thread _id_AB5A( var_0 );

    if ( isdefined( level._id_AAF6 ) )
    {
        foreach ( var_2 in level._id_AAF6 )
            self [[ var_2 ]]( var_0 );
    }
}

_id_C27C( var_0 )
{
    if ( !isdefined( level._id_AAF6 ) )
        level._id_AAF6 = [];

    level._id_AAF6[level._id_AAF6.size] = var_0;
}

_id_AB5A( var_0 )
{
    var_0 notify( "onPlayerJoinTeamNoSpectator" );

    if ( var_0.sessionstate == "spectator" )
    {
        var_0 endon( "death_or_disconnect" );
        var_0 endon( "onPlayerJoinTeamNoSpectator" );

        while ( var_0.sessionstate == "spectator" )
            waitframe();
    }

    if ( isdefined( level._id_AAF7 ) )
    {
        foreach ( var_2 in level._id_AAF7 )
            self [[ var_2 ]]( var_0 );
    }
}

_id_C27D( var_0 )
{
    if ( !isdefined( level._id_AAF7 ) )
        level._id_AAF7 = [];

    level._id_AAF7[level._id_AAF7.size] = var_0;
}
