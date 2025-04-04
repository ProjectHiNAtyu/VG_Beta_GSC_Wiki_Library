// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_9566()
{
    scripts\cp_mp\utility\script_utility::registersharedfunc( "little_bird", "spawnCallback", ::_id_956A );
    _id_9568();
    _id_9567();
    scripts\mp\utility\killstreak::_id_10228( "little_bird", _id_09AE::_id_9556 );

    if ( istrue( level._id_DCED ) )
        scripts\cp_mp\utility\script_utility::registersharedfunc( "little_bird", "endEnterInternal", ::_id_9564 );
}

_id_9568()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "little_bird", 1 );
    var_0._id_0DD8 = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn;
    var_0._id_0DD9 = 60;

    if ( scripts\mp\utility\game::getgametype() == "arm" )
        var_0._id_C691 = 30;
}

_id_9567()
{
    var_0 = _id_09B9::_id_10142( "little_bird", 1 );
    var_0._id_5FBD = 78;
    var_0._id_206B = 28;
    var_0._id_9183 = 55;
    var_0._id_C855 = 55;
    var_0._id_292E = -80;
    var_0._id_4B75 = 80;
    var_0._id_9889 = ( 0, 0, -70 );
}

_id_956A( var_0, var_1 )
{
    var_2 = _id_09AE::_id_954C( var_0, var_1 );

    if ( isdefined( var_2 ) && scripts\cp_mp\vehicles\vehicle_spawn::_id_10270() )
        var_2._id_AA96 = ::_id_9569;

    return var_2;
}

_id_9569()
{
    thread _id_956B();
}

_id_956B()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_tracking::_id_6E22( self );
    var_1 = spawnstruct();
    scripts\cp_mp\vehicles\vehicle_tracking::_id_3D43( var_0, var_1 );
    var_1._id_C17B = var_0._id_C17B;
    var_1._id_BFB7 = var_0._id_BFB7;
    var_2 = spawnstruct();
    var_3 = scripts\cp_mp\vehicles\vehicle_spawn::_id_1028E( "little_bird", var_1, var_2 );

    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_1._id_C17B ) && istrue( level._id_FEAD ) && level._id_FEAD != 2 )
        {
            var_3._id_C17B = var_1._id_C17B;
            var_3.maxhealth = int( max( var_3.maxhealth, var_1._id_BFB7 ) );
            var_3.health = var_3.maxhealth;
            _id_07DF::_id_BFB9( var_3 );
        }

        if ( istrue( level._id_DCED ) )
            scripts\mp\gametypes\arm::_id_10027( var_3, var_3.team );
    }
}

_id_9564( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( level._id_DCED ) )
        var_0 scripts\mp\gametypes\arm::_id_10232( var_3.team );
}
