// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_9CE2()
{
    scripts\cp_mp\utility\script_utility::registersharedfunc( "medium_transport", "spawnCallback", ::_id_9CE6 );
    _id_9CE3();
    _id_9CE4();
    scripts\mp\utility\killstreak::_id_10228( "medium_transport", _id_09AF::_id_9CD5 );
}

_id_9CE4()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "medium_transport", 1 );
    var_0._id_0DD8 = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn;
}

_id_9CE3()
{
    var_0 = _id_09B9::_id_10142( "medium_transport", 1 );
    var_0._id_5FBD = 100;
    var_0._id_206B = 102;
    var_0._id_9183 = 38;
    var_0._id_C855 = 38;
    var_0._id_292E = 20;
    var_0._id_4B75 = 35;
    var_0._id_9889 = ( 0, 0, 55 );
}

_id_9CE6( var_0, var_1 )
{
    var_2 = _id_09AF::_id_9CCE( var_0, var_1 );

    if ( isdefined( var_2 ) && scripts\cp_mp\vehicles\vehicle_spawn::_id_10270() )
        var_2._id_AA96 = ::_id_9CE5;

    return var_2;
}

_id_9CE5()
{
    thread _id_9CE7();
}

_id_9CE7()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_tracking::_id_6E22( self );
    var_1 = spawnstruct();
    scripts\cp_mp\vehicles\vehicle_tracking::_id_3D43( var_0, var_1 );
    var_2 = spawnstruct();
    var_3 = scripts\cp_mp\vehicles\vehicle_spawn::_id_1028E( "medium_transport", var_1, var_2 );
}
