// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_196E()
{
    scripts\cp_mp\utility\script_utility::registersharedfunc( "apc_russian", "spawnCallback", ::_id_1972 );
    _id_196F();
    _id_1970();
    scripts\mp\utility\killstreak::_id_10228( "apc_russian", _id_09A3::_id_195E );
}

_id_1970()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "apc_russian", 1 );
    var_0._id_0DD8 = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn;
    var_0._id_0DD9 = 180;

    if ( scripts\mp\utility\game::getgametype() == "arm" )
        var_0._id_C691 = level._id_1980;
}

_id_196F()
{
    var_0 = _id_09B9::_id_10142( "apc_russian", 1 );
    var_0._id_5FBD = 115;
    var_0._id_206B = 110;
    var_0._id_9183 = 61;
    var_0._id_C855 = 61;
    var_0._id_292E = 25;
    var_0._id_4B75 = 40;
    var_0._id_9889 = ( 0, 0, 50 );
}

_id_1972( var_0, var_1 )
{
    var_2 = _id_09A3::_id_1953( var_0, var_1 );

    if ( isdefined( var_2 ) && scripts\cp_mp\vehicles\vehicle_spawn::_id_10270() )
        var_2._id_AA96 = ::_id_1971;

    return var_2;
}

_id_1971()
{
    thread _id_1973();
}

_id_1973()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_tracking::_id_6E22( self );
    var_1 = spawnstruct();
    scripts\cp_mp\vehicles\vehicle_tracking::_id_3D43( var_0, var_1 );
    var_1._id_C17B = var_0._id_C17B;
    var_1._id_BFB7 = var_0._id_BFB7;
    var_2 = spawnstruct();
    var_3 = scripts\cp_mp\vehicles\vehicle_spawn::_id_1028E( "apc_russian", var_1, var_2 );

    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_1._id_C17B ) && istrue( level._id_FEAD ) && level._id_FEAD != 2 )
        {
            var_3._id_C17B = var_1._id_C17B;
            var_3.maxhealth = int( max( var_3.maxhealth, var_1._id_BFB7 ) );
            var_3.health = var_3.maxhealth;
            _id_07DF::_id_BFB9( var_3 );
        }
    }
}
