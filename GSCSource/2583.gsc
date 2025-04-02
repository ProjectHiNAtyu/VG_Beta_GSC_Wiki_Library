// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "emp", ::_id_F77A );
}

_id_F779()
{
    var_0 = scripts\cp_mp\utility\killstreak_utility::_id_4034( "emp", self );
    return _id_F77A( var_0 );
}

_id_F77A( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
            return 0;
    }

    var_1 = _id_0990::_id_E9FE( var_0, makeweapon( "s4_ks_gesture_generic_mp" ) );

    if ( !istrue( var_1 ) )
        return 0;

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
            return 0;
    }

    thread _id_E6A1();

    if ( isdefined( level._id_8DBA ) )
        level thread [[ level._id_8DBA ]]( self.streakinfo );

    return 1;
}

_id_E6A1()
{
    level endon( "game_ended" );
    var_0 = scripts\cp_mp\utility\killstreak_utility::_id_6ABC();
    var_1 = 3000;

    if ( isdefined( var_0 ) )
        var_1 = var_0.origin[2] + 500;

    var_2 = level._id_9A95 * ( 1, 1, 0 ) + ( 0, 0, var_1 );
    playfx( scripts\engine\utility::getfx( "emp_shockwave" ), var_2 );
    self playsound( "jammer_drone_shockwave" );

    foreach ( var_4 in level.players )
    {
        if ( !scripts\mp\utility\player::isreallyalive( var_4 ) )
            continue;

        var_4 thread _id_19A7();
    }

    var_6 = scripts\mp\utility\teams::_id_69E2( self.owner.team );

    foreach ( var_8 in var_6 )
        _id_481D( var_8, self );
}

_id_19A7()
{
    self setscriptablepartstate( "emped", "active", 0 );
    self playloopsound( "emp_nade_lp" );
    thread _id_19A8();
    wait 0.5;
    self setscriptablepartstate( "emped", "neutral", 0 );
    self playsound( "emp_nade_lp_end" );
    self stoploopsound( "emp_nade_lp" );
}

_id_19A8()
{
    visionsetnaked( "coup_sunblind", 0.05 );
    waitframe();
    visionsetnaked( "coup_sunblind", 0 );
    visionsetnaked( "", 0.5 );
}

_id_481D( var_0, var_1 )
{
    var_2 = "s4_v2_mp";
    var_3 = level._id_0F23;
    var_4 = [[ level._id_6866 ]]();
    var_5 = undefined;

    if ( isdefined( var_3 ) && isdefined( var_4 ) )
        var_5 = scripts\engine\utility::_id_1B75( var_3, var_4 );
    else if ( isdefined( var_3 ) )
        var_5 = var_3;
    else if ( isdefined( var_4 ) )
        var_5 = var_4;

    if ( isdefined( var_5 ) )
    {
        foreach ( var_7 in var_5 )
        {
            if ( isdefined( var_7 ) )
                var_7 _id_0A6F::_id_4C35( 10000, var_1, var_1, var_0, var_7.origin, "MOD_EXPLOSIVE", var_2 );
        }
    }
}
