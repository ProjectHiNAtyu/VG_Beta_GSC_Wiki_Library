// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_81BA()
{
    level._id_ED17 = [];
    level thread _id_BF2C();
}

_id_BF2C()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        level._id_ED17[var_0 scripts\mp\utility\player::_id_6E04()] = spawn( "script_model", ( 0, 0, 0 ) );
    }
}

_id_BEB2( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) )
        level._id_ED17[var_1 scripts\mp\utility\player::_id_6E04()] _id_601B();

    var_4 = 0;

    if ( !isdefined( var_3 ) )
        var_4 = level._id_ED17[var_1 scripts\mp\utility\player::_id_6E04()] thread _id_6019( ::_id_B27A, var_0, var_1 );
    else
        var_4 = level._id_ED17[var_1 scripts\mp\utility\player::_id_6E04()] thread _id_601F( var_3, ::_id_B27A, var_0, var_1 );

    return var_4;
}

_id_BEB3( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) )
    {
        foreach ( var_5 in scripts\mp\utility\teams::_id_6DAC( var_1, "players" ) )
            level._id_ED17[var_5 scripts\mp\utility\player::_id_6E04()] _id_601B();
    }

    var_7 = 0;

    foreach ( var_5 in scripts\mp\utility\teams::_id_6DAC( var_1, "players" ) )
    {
        if ( !isdefined( var_3 ) )
        {
            var_7 = level._id_ED17[var_5 scripts\mp\utility\player::_id_6E04()] thread _id_6019( ::_id_B27A, var_0, var_5 );
            continue;
        }

        var_7 = level._id_ED17[var_5 scripts\mp\utility\player::_id_6E04()] thread _id_601F( var_3, ::_id_B27A, var_0, var_5 );
    }

    return var_7;
}

_id_B27A( var_0, var_1, var_2 )
{
    var_1 playlocalsound( var_0, var_2 );
    var_3 = _func_0140( var_0 );
    wait( 0.5 + var_3 / 1000.0 );

    if ( isdefined( var_2 ) )
        self notify( var_2 );
}

_id_6019( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6 thread _id_601D( self, var_0, var_1, var_2, var_3, var_4, var_5 );
    return _id_6021( var_6 );
}

_id_601F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawnstruct();
    var_7 thread _id_601D( self, var_1, var_2, var_3, var_4, var_5, var_6 );

    if ( isdefined( var_7._id_601C ) || var_7 scripts\engine\utility::_id_108A5( var_0, "function_stack_func_begun" ) != "timeout" )
        return _id_6021( var_7 );
    else
    {
        var_7 notify( "death" );
        return 0;
    }
}

_id_601B()
{
    if ( !isdefined( self._id_6019 ) )
        return;

    var_0 = [];

    if ( isdefined( self._id_6019[0] ) && isdefined( self._id_6019[0]._id_601C ) )
        var_0[0] = self._id_6019[0];

    self._id_6019 = undefined;
    self notify( "clear_function_stack" );
    waittillframeend;

    if ( !var_0.size )
        return;

    if ( !var_0[0]._id_601C )
        return;

    self._id_6019 = var_0;
}

_id_6020( var_0 )
{
    self endon( "death" );
    var_0 scripts\engine\utility::_id_108C3( "function_done", "death" );
}

_id_6021( var_0 )
{
    _id_6020( var_0 );

    if ( !isdefined( self ) )
        return 0;

    if ( !_func_011C( self ) )
        return 1;

    if ( isalive( self ) )
        return 1;

    return 0;
}

_id_601D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( !isdefined( var_0._id_6019 ) )
        var_0._id_6019 = [];

    var_0._id_6019[var_0._id_6019.size] = self;
    thread _id_601E( var_0 );
    _id_601A( var_0 );

    if ( isdefined( var_0 ) && isdefined( var_0._id_6019 ) )
    {
        self._id_601C = 1;
        self notify( "function_stack_func_begun" );

        if ( isdefined( var_6 ) )
            var_0 [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );
        else if ( isdefined( var_5 ) )
            var_0 [[ var_1 ]]( var_2, var_3, var_4, var_5 );
        else if ( isdefined( var_4 ) )
            var_0 [[ var_1 ]]( var_2, var_3, var_4 );
        else if ( isdefined( var_3 ) )
            var_0 [[ var_1 ]]( var_2, var_3 );
        else if ( isdefined( var_2 ) )
            var_0 [[ var_1 ]]( var_2 );
        else
            var_0 [[ var_1 ]]();

        if ( isdefined( var_0 ) && isdefined( var_0._id_6019 ) )
        {
            var_0._id_6019 = scripts\engine\utility::array_remove( var_0._id_6019, self );
            var_0 notify( "level_function_stack_ready" );
        }
    }

    if ( isdefined( self ) )
    {
        self._id_601C = 0;
        self notify( "function_done" );
    }
}

_id_601E( var_0 )
{
    self endon( "function_done" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
    {
        var_0._id_6019 = scripts\engine\utility::array_remove( var_0._id_6019, self );
        var_0 notify( "level_function_stack_ready" );
    }
}

_id_601A( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    var_0 endon( "clear_function_stack" );

    while ( var_0._id_6019[0] != self )
        var_0 waittill( "level_function_stack_ready" );
}

_id_2425()
{
    anim._id_CF65 = gettime();
}
