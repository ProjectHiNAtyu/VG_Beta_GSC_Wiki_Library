// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_ECDA()
{
    scripts\cp_mp\utility\script_utility::registersharedfunc( "tac_rover", "spawnCallback", ::_id_ECDD );
    _id_ED22();
    _id_ECDB();
    scripts\mp\utility\killstreak::_id_10228( "tac_rover", _id_09B1::_id_ECCD );
}

_id_ECDB()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "tac_rover", 1 );
    var_0._id_0DD8 = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn;
}

_id_ED22()
{
    var_0 = _id_09B9::_id_10142( "tac_rover", 1 );
    var_0._id_5FBD = 90;
    var_0._id_206B = 115;
    var_0._id_9183 = 38;
    var_0._id_C855 = 38;
    var_0._id_292E = 20;
    var_0._id_4B75 = 35;
    var_0._id_9889 = ( 0, -8, 50 );
}

_id_ECDD( var_0, var_1 )
{
    var_2 = _id_09B1::_id_ECC6( var_0, var_1 );

    if ( isdefined( var_2 ) && scripts\cp_mp\vehicles\vehicle_spawn::_id_10270() )
        var_2._id_AA96 = ::_id_ECDC;

    return var_2;
}

_id_ECDC()
{
    thread _id_ECDE();
}

_id_ECDE()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_tracking::_id_6E22( self );
    var_1 = spawnstruct();
    scripts\cp_mp\vehicles\vehicle_tracking::_id_3D43( var_0, var_1 );
    var_2 = spawnstruct();
    var_3 = scripts\cp_mp\vehicles\vehicle_spawn::_id_1028E( "tac_rover", var_1, var_2 );
}
