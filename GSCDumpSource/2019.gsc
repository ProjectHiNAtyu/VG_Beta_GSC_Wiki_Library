// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_A6C9( var_0, var_1 )
{

}

_id_A6C7( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_40D5( var_0, var_1 )
{

}

_id_40D4( var_0, var_1, var_2, var_3, var_4, var_5 )
{

}

_id_40D3( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_A6C8( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_A6C6( var_0, var_1, var_2, var_3 )
{

}

_id_8E29()
{

}

_id_8E2A()
{

}

_id_FBF1()
{
    foreach ( var_1 in level.players )
        var_1 notify( "updateKillStreakMarker" );
}

_id_D535( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_9FF4( var_0, var_1, var_2, var_3 )
{

}

_id_AB05( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

_id_978D( var_0, var_1 )
{

}

_id_4F23( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_2639( var_0, var_1, var_2, var_3 )
{
    return 1;
}

_id_6ADA()
{

}

_id_0B3D( var_0, var_1, var_2, var_3, var_4, var_5 )
{

}

_id_D4D4()
{

}

_id_40D2( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_D6DE( var_0 )
{

}

_id_D54A( var_0, var_1 )
{

}

_id_DEEF( var_0, var_1, var_2, var_3 )
{

}

_id_D6B3( var_0, var_1, var_2 )
{

}

_id_9502( var_0, var_1, var_2, var_3 )
{
    self linkto( var_0, var_1, var_2, var_3 );
}

_id_D59F( var_0, var_1, var_2, var_3, var_4, var_5 )
{

}

_id_E286( var_0, var_1 )
{
    var_2 = spawn( var_0, var_1 );
    var_2 setmodel( "tag_origin" );
    return var_2;
}

_id_86D6( var_0 )
{
    return istrue( var_0 );
}

_id_8B04()
{
    return 0;
}

_id_89BD()
{
    return 0;
}

_id_2D15( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    return scripts\engine\trace::_bullet_trace( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_D478( var_0 )
{

}

_id_9934( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    return _func_0141( var_0, var_1, var_2, var_5 );
}

_hasperk( var_0 )
{
    if ( scripts\engine\utility::is_equal( var_0, "specialty_improvedstreaks" ) )
        return 0;

    return self _meth_81A3( var_0 );
}

_id_10956()
{
    return scripts\mp\hostmigration::_id_10956();
}

_id_5AC1( var_0, var_1 )
{
    return _id_07EE::_id_5AC1( var_0, var_1 );
}

_id_4766( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2 ) )
            var_2._id_82BB = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
    self._id_47C7 = undefined;
}

_id_FBFE()
{

}

_id_1B9A( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return undefined;

    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( isdefined( var_0 ) )
        {
            if ( var_0 != var_4 )
                var_2[var_2.size] = var_4;

            continue;
        }

        var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_9120( var_0 )
{

}

_id_108F4( var_0, var_1 )
{
    self endon( var_0 );

    if ( var_1 == 0 )
        return;

    var_2 = gettime();
    var_3 = gettime() + var_1 * 1000;

    while ( gettime() < var_3 )
    {
        _id_10957( ( var_3 - gettime() ) / 1000 );

        if ( isdefined( level._id_7A93 ) )
        {
            var_4 = _id_10956();
            var_3 = var_3 + var_4;
        }
    }

    _id_10956();
    return gettime() - var_2;
}

_id_10957( var_0 )
{
    if ( isdefined( level._id_7A93 ) )
        return;

    level endon( "host_migration_begin" );
    wait( var_0 );
}

_id_9B12( var_0 )
{

}

_id_8AA4( var_0, var_1 )
{
    var_2 = self.team;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( level.teambased && isdefined( level._id_EF66 ) && level._id_EF66[var_2] || !level.teambased && isdefined( level._id_3D80 ) && level._id_3D80 != self )
    {
        if ( !isdefined( var_0 ) || var_0 )
            self iprintlnbold( &"KILLSTREAKS_COUNTER_RECON_ACTIVE" );

        return 1;
    }

    return 0;
}

_id_39BD()
{

}

_id_B757()
{
    if ( isdefined( self._id_C6FA ) )
    {
        if ( self.team != "spectator" )
            self setplayerangles( self._id_C6FA );

        self._id_C6FA = undefined;
    }
}

_id_D717( var_0 )
{

}

_id_0C95()
{

}

_id_D8C9( var_0 )
{

}

_id_8AB5()
{
    return 0;
}

_id_396C()
{

}

_id_D6B9( var_0 )
{

}

_id_69E4( var_0, var_1 )
{
    var_2 = scripts\engine\utility::_id_6D7C( var_0, var_1 );
    var_3 = getentarray( var_0, var_1 );

    if ( var_3.size > 0 )
        var_2 = scripts\engine\utility::array_combine( var_2, var_3 );

    return var_2;
}

_id_2D16( var_0, var_1, var_2, var_3 )
{
    return scripts\engine\trace::_bullet_trace_passed( var_0, var_1, var_2, var_3 );
}

isreallyalive( var_0 )
{
    return scripts\mp\utility\player::isreallyalive( var_0 );
}

_id_1770( var_0, var_1, var_2 )
{
    return vectortoangles( ( 0, 0, -1 ) );
}

_id_C722( var_0, var_1 )
{

}

_id_8D6B( var_0, var_1, var_2, var_3 )
{

}

_id_9496( var_0 )
{

}

_id_6E54( var_0, var_1, var_2 )
{
    return 400;
}

_id_5F44( var_0, var_1 )
{
    scripts\mp\utility\player::_id_0BC4( var_0, var_1 );
}

_id_B77A()
{
    self._id_C6FA = self getplayerangles();
}

_id_88DC( var_0 )
{
    return 0;
}

_id_8260( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "s2_fritzx" )
        return "success";

    return "fail";
}

_id_998A( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level._id_2777 ) && isdefined( level._id_2777["bots_make_entity_sentient"] ) )
        return self [[ level._id_2777["bots_make_entity_sentient"] ]]( var_0, var_1, var_2, var_3, var_4 );
}
