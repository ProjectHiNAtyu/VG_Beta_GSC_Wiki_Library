// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_325D()
{
    var_0 = scripts\cp_mp\vehicles\vehicle::_id_100BF( "cargo_truck", 1 );
    var_0._id_4820 = ::_id_325B;
    _id_3262();
    _id_3260();
    _id_3263();
    _id_325E();
    _id_325F();

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cargo_truck", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cargo_truck", "init" ) ]]();

    _id_3264();
    _id_3261();
}

_id_3261()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cargo_truck", "initLate" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cargo_truck", "initLate" ) ]]();
}

_id_3262()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A1( "cargo_truck", 1 );
    var_0._id_54B6 = ::_id_3257;
    var_0._id_5770 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10183;
    var_0._id_575B = ::_id_3259;
    var_0._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10192();
    var_0._id_575C["front"] = 175;
    var_0._id_575C["back"] = 180;
    var_0._id_575C["left"] = 68;
    var_0._id_575C["right"] = 68;
    var_0._id_575C["top"] = 138;
    var_0._id_575C["bottom"] = 0;
    var_1 = "front";
    var_0._id_5768[var_1] = ( 140, 0, 115 );
    var_0._id_5758[var_1] = "front";
    var_1 = "front_right";
    var_0._id_5768[var_1] = ( 65, 23, 115 );
    var_0._id_5758[var_1] = "right";
    var_1 = "front_left";
    var_0._id_5768[var_1] = ( 65, 23, 115 );
    var_0._id_5758[var_1] = "left";
    var_1 = "back_left";
    var_0._id_5768[var_1] = ( -152, 36, 115 );
    var_0._id_5758[var_1] = "back";
    var_1 = "side_left";
    var_0._id_5768[var_1] = ( -109, 36, 115 );
    var_0._id_5758[var_1] = "left";
    var_2 = "driver";
    var_3 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "cargo_truck", var_2, 1 );
    var_3._id_5760 = [ "front_left", "side_left", "back_left", "front_right", "front" ];
    var_3._id_18CA = "tag_seat_0";
    var_3._id_AAB3 = "ping_vehicle_driver";
}

_id_3260()
{
    var_0 = _id_09B8::_id_100ED( "cargo_truck", 1 );
    var_0._id_CFB3["single"] = [ "driver" ];
}

_id_3263()
{
    var_0 = _id_09A1::_id_10371( "cargo_truck", 1 );
    var_0._id_7C71 = 8;
    var_0._id_CFB6["driver"] = 0;
}

_id_325E()
{
    _id_09B6::_id_10067( "cargo_truck", 1800 );
    var_0 = _id_09B6::_id_1003F( "cargo_truck" );
    var_0.class = "heavy";
    _id_09B6::_id_1002A( "cargo_truck" );
    _id_09B6::_id_10071( "cargo_truck", 20 );
    _id_09B6::_id_1006C( "cargo_truck", ::_id_3255 );
    _id_09B6::_id_10074( "cargo_truck_mp", 5 );
}

_id_325F()
{
    level._effect["cargo_truck_explode"] = loadfx( "vfx/iw8_mp/vehicle/vfx_cargotr_mp_death_exp.vfx" );
}

_id_3254( var_0, var_1 )
{
    if ( !isdefined( var_0.angles ) )
        var_0.angles = ( 0, 0, 0 );

    var_0._id_02AF = "veh8_mil_lnd_mkilo23_physics_mp";
    var_0._id_045A = "cargo_truck";
    var_0.type = "mkilo_physics_mp";
    var_2 = scripts\cp_mp\vehicles\vehicle_tracking::_id_0D58( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return undefined;

    scripts\cp_mp\vehicles\vehicle::_id_10024( var_2, "cargo_truck", var_0 );
    var_2.objweapon = makeweapon( "cargo_truck_mp" );
    _id_09B5::_id_10016( var_2 );
    scripts\cp_mp\vehicles\vehicle::vehicle_create( var_2, var_0 );
    thread scripts\cp_mp\vehicles\vehicle::_id_102E0( var_2, undefined, scripts\cp_mp\vehicles\vehicle::_id_100A8 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cargo_truck", "create" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cargo_truck", "create" ) ]]( var_2 );

    return var_2;
}

_id_325B( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = spawnstruct();
        var_0.inflictor = self;
        var_0.objweapon = "cargo_truck_mp";
        var_0._id_9CBF = "MOD_EXPLOSIVE";
    }

    if ( level.gametype == "base" && isdefined( var_0.attacker ) && isplayer( var_0.attacker ) && scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "addCashForScoreEvent" ) )
        var_0.attacker thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "addCashForScoreEvent" ) ]]( "destroyed_truck", undefined, undefined );

    _id_09B6::_id_1005E( var_0 );
    scripts\cp_mp\vehicles\vehicle_occupancy::_id_101C3( self, var_0 );
    _id_09B6::_id_1002E( undefined, undefined, 1 );
    thread _id_3256();

    if ( !istrue( level._id_EBC0 ) )
    {
        var_2 = self gettagorigin( "tag_origin" );
        var_3 = scripts\engine\utility::ter_op( isdefined( var_0.attacker ), var_0.attacker, self );
        self radiusdamage( var_2, 256, 140, 70, var_3, "MOD_EXPLOSIVE", "cargo_truck_mp" );
        playfx( scripts\engine\utility::getfx( "cargo_truck_explode" ), var_2, anglestoforward( self.angles ), anglestoup( self.angles ) );
        playsoundatpos( var_2, "car_explode" );
        earthquake( 0.4, 800, var_2, 0.7 );
        playrumbleonposition( "grenade_rumble", var_2 );
        _func_0190( var_2, 500, 200, 1 );
    }
}

_id_3256()
{
    scripts\cp_mp\vehicles\vehicle::_id_1008D( self );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cargo_truck", "delete" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cargo_truck", "delete" ) ]]( self );

    waitframe();
    scripts\cp_mp\vehicles\vehicle::_id_1008E( self );
}

_id_3255( var_0 )
{
    thread _id_325B( var_0 );
    return 1;
}

_id_3257( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_3258( var_0, var_1, var_2, var_3, var_4 );
}

_id_3258( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 setotherent( var_3 );
    var_0 setentityowner( var_3 );
    var_3 _meth_8093( var_0 );
    var_3 thread scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015C( var_0, var_1, var_2 );
    _id_09A1::_id_10391( var_0, var_2, var_1, var_3 );
}

_id_3259( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_325A( var_0, var_1, var_2, var_3, var_4 );
}

_id_325A( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 setotherent( undefined );
    var_0 setentityowner( undefined );

    if ( !istrue( var_4._id_B682 ) )
    {
        var_3 _meth_8094();
        var_3 scripts\cp_mp\vehicles\vehicle_occupancy::_id_10200();
        var_5 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101D0( var_3, var_2, var_4 );

        if ( !var_5 )
        {
            if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "vehicle_occupancy", "handleSuicideFromVehicles" ) )
                [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "vehicle_occupancy", "handleSuicideFromVehicles" ) ]]( var_3 );
            else
                var_3 suicide();
        }
    }

    _id_09A1::_id_10392( var_0, var_1, var_2, var_3 );
}

_id_3264()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "cargo_truck", 1 );
    var_0._id_9C64 = 2;
    var_0._id_BD19 = 75;
    var_0._id_6D3F = ::_id_325C;
    var_0._id_E271 = scripts\cp_mp\utility\script_utility::getsharedfunc( "cargo_truck", "spawnCallback" );
    var_0._id_38FF = 185;
    var_0._id_38FB = 138;
    var_0._id_38FD = 185;
}

_id_325C()
{
    var_0 = scripts\engine\utility::_id_6D7C( "cargotruck_spawn", "targetname" );

    if ( var_0.size > 0 )
    {
        var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10288( var_0, 1 );

        if ( var_0.size > 1 )
            var_0 = scripts\engine\utility::_id_1B94( var_0 );
    }

    return var_0;
}
