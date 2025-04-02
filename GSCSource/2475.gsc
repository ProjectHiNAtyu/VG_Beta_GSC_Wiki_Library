// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8BA0()
{
    var_0 = scripts\cp_mp\vehicles\vehicle::_id_100BF( "jeep", 1 );
    var_0._id_4820 = ::_id_8B9E;
    _id_8BA5();
    _id_8BA3();
    _id_8BA6();
    _id_8BA1();
    _id_8BA2();

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "jeep", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "jeep", "init" ) ]]();

    _id_8BA7();
    _id_8BA4();
}

_id_8BA4()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "jeep", "initLate" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "jeep", "initLate" ) ]]();
}

_id_8BA5()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A1( "jeep", 1 );
    var_0._id_54B6 = ::_id_8B9A;
    var_0._id_5770 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10183;
    var_0._id_575B = ::_id_8B9C;
    var_0._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1018E();
    var_0._id_575C["front"] = 105;
    var_0._id_575C["back"] = 105;
    var_0._id_575C["left"] = 44;
    var_0._id_575C["right"] = 44;
    var_0._id_575C["top"] = 90;
    var_0._id_575C["bottom"] = 0;
    var_1 = "front";
    var_0._id_5768[var_1] = ( 75, 0, 65 );
    var_0._id_5758[var_1] = "front";
    var_1 = "back";
    var_0._id_5768[var_1] = ( -90, 0, 65 );
    var_0._id_5758[var_1] = "back";
    var_2 = [ "driver", "front_right", "back_right", "back_left" ];
    var_3 = "driver";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "jeep", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "back_left", "back", "front_right", "front" ];
    var_0._id_5768[var_3] = ( 17, 19, 65 );
    var_0._id_5758[var_3] = "left";
    var_4._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10192();
    var_4._id_18CA = "tag_seat_0";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_E351 = 10;
    var_4._id_AAB3 = "ping_vehicle_driver";
    var_3 = "front_right";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "jeep", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "back_right", "back", "driver", "front" ];
    var_0._id_5768[var_3] = ( 17, -19, 65 );
    var_0._id_5758[var_3] = "right";
    var_4._id_103D0["top"] = 27;
    var_4._id_103D0["bottom"] = 42;
    var_4._id_103D0["left"] = 105;
    var_4._id_103D0["right"] = 117;
    var_4._id_18CA = "tag_seat_1";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_78FC = 1;
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "back_right";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "jeep", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "front_right", "back", "back_left", "front" ];
    var_0._id_5768[var_3] = ( -24, -19, 65 );
    var_0._id_5758[var_3] = "right";
    var_4._id_103D0["top"] = 27;
    var_4._id_103D0["bottom"] = 42;
    var_4._id_103D0["left"] = 101;
    var_4._id_103D0["right"] = 122;
    var_4._id_18CA = "tag_seat_3";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_78FC = 1;
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "back_left";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "jeep", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "driver", "back", "back_right", "front" ];
    var_0._id_5768[var_3] = ( -24, 19, 65 );
    var_0._id_5758[var_3] = "left";
    var_4._id_103D0["top"] = 27;
    var_4._id_103D0["bottom"] = 42;
    var_4._id_103D0["left"] = 122;
    var_4._id_103D0["right"] = 101;
    var_4._id_18CA = "tag_seat_2";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_78FC = 1;
    var_4._id_AAB3 = "ping_vehicle_rider";
}

_id_8BA3()
{
    var_0 = _id_09B8::_id_100ED( "jeep", 1 );
    var_0._id_CFB3["single"] = [ "driver", "front_right", "back_left", "back_right" ];
}

_id_8BA6()
{
    var_0 = _id_09A1::_id_10371( "jeep", 1 );
    var_0._id_7C71 = 10;
    var_0._id_CFB6["driver"] = 0;
    var_0._id_CFB6["front_right"] = 1;
    var_0._id_CFB6["back_left"] = 2;
    var_0._id_CFB6["back_right"] = 3;
}

_id_8BA1()
{
    _id_09B6::_id_10067( "jeep", 800 );
    var_0 = _id_09B6::_id_1003F( "jeep" );
    var_0.class = "medium";
    _id_09B6::_id_1002A( "jeep" );
    _id_09B6::_id_10071( "jeep", 9 );
    _id_09B6::_id_1006C( "jeep", ::_id_8B98 );
    _id_09B6::_id_10074( "jeep_mp", 3 );
}

_id_8BA2()
{
    level._effect["jeep_explode"] = loadfx( "vfx/iw8_mp/vehicle/vfx_jeep_mp_death_exp.vfx" );
}

_id_8B97( var_0, var_1 )
{
    if ( !isdefined( var_0.angles ) )
        var_0.angles = ( 0, 0, 0 );

    var_0._id_02AF = "veh8_civ_lnd_decho_vm_dirty_blue_physics_mp";
    var_0._id_045A = "jeep";
    var_0.type = "decho_physics_mp";
    var_2 = scripts\cp_mp\vehicles\vehicle_tracking::_id_0D58( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return undefined;

    scripts\cp_mp\vehicles\vehicle::_id_10024( var_2, "jeep", var_0 );
    var_2.objweapon = makeweapon( "jeep_mp" );
    _id_09B5::_id_10016( var_2 );
    scripts\cp_mp\vehicles\vehicle::vehicle_create( var_2, var_0 );
    thread scripts\cp_mp\vehicles\vehicle::_id_102E0( var_2, undefined, scripts\cp_mp\vehicles\vehicle::_id_100A8 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "jeep", "create" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "jeep", "create" ) ]]( var_2 );

    return var_2;
}

_id_8B9E( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = spawnstruct();
        var_0.inflictor = self;
        var_0.objweapon = "jeep_mp";
        var_0._id_9CBF = "MOD_EXPLOSIVE";
    }

    if ( level.gametype == "base" && isdefined( var_0.attacker ) && isplayer( var_0.attacker ) && scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "addCashForScoreEvent" ) )
        var_0.attacker thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "addCashForScoreEvent" ) ]]( "destroyed_jeep", undefined, undefined );

    _id_09B6::_id_1005E( var_0 );
    scripts\cp_mp\vehicles\vehicle_occupancy::_id_101C3( self, var_0 );
    _id_09B6::_id_1002E( undefined, undefined, 1 );
    thread _id_8B99();

    if ( !istrue( level._id_EBC0 ) )
    {
        var_2 = self gettagorigin( "tag_origin" );
        var_3 = scripts\engine\utility::ter_op( isdefined( var_0.attacker ), var_0.attacker, self );
        self radiusdamage( var_2, 256, 140, 70, var_3, "MOD_EXPLOSIVE", "jeep_mp" );
        playfx( scripts\engine\utility::getfx( "jeep_explode" ), var_2, anglestoforward( self.angles ), anglestoup( self.angles ) );
        playsoundatpos( var_2, "car_explode" );
        earthquake( 0.4, 800, var_2, 0.7 );
        playrumbleonposition( "grenade_rumble", var_2 );
        _func_0190( var_2, 500, 200, 1 );
    }
}

_id_8B99()
{
    scripts\cp_mp\vehicles\vehicle::_id_1008D( self );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "jeep", "delete" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "jeep", "delete" ) ]]( self );

    waitframe();
    scripts\cp_mp\vehicles\vehicle::_id_1008E( self );
}

_id_8B98( var_0 )
{
    thread _id_8B9E( var_0 );
    return 1;
}

_id_8B9A( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_8B9B( var_0, var_1, var_2, var_3, var_4 );
}

_id_8B9B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 == "driver" )
    {
        var_0 setotherent( var_3 );
        var_0 setentityowner( var_3 );
        var_3 _meth_8093( var_0 );
    }

    var_3 thread scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015C( var_0, var_1, var_2 );
    _id_09A1::_id_10391( var_0, var_2, var_1, var_3 );
}

_id_8B9C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_8B9D( var_0, var_1, var_2, var_3, var_4 );
}

_id_8B9D( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 == "driver" )
    {
        var_0 setotherent( undefined );
        var_0 setentityowner( undefined );

        if ( !istrue( var_4._id_B682 ) )
            var_3 _meth_8094();
    }

    if ( !istrue( var_4._id_B682 ) )
    {
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

_id_8BA7()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "jeep", 1 );
    var_0._id_9C64 = 2;
    var_0._id_BD19 = 75;
    var_0._id_6D3F = ::_id_8B9F;
    var_0._id_E271 = scripts\cp_mp\utility\script_utility::getsharedfunc( "jeep", "spawnCallback" );
    var_0._id_38FF = 105;
    var_0._id_38FB = 90;
    var_0._id_38FD = 105;
}

_id_8B9F()
{
    var_0 = scripts\engine\utility::_id_6D7C( "jeep_spawn", "targetname" );

    if ( var_0.size > 0 )
    {
        var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10288( var_0, 1 );

        if ( var_0.size > 1 )
            var_0 = scripts\engine\utility::_id_1B94( var_0 );
    }

    return var_0;
}
