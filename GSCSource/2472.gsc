// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_3D14()
{
    var_0 = scripts\cp_mp\vehicles\vehicle::_id_100BF( "cop_car", 1 );
    var_0._id_4820 = ::_id_3D12;
    _id_3D19();
    _id_3D17();
    _id_3D1A();
    _id_3D15();
    _id_3D16();

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cop_car", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cop_car", "init" ) ]]();

    _id_3D1B();
    _id_3D18();
}

_id_3D18()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cop_car", "initLate" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cop_car", "initLate" ) ]]();
}

_id_3D19()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A1( "cop_car", 1 );
    var_0._id_54B6 = ::_id_3D0E;
    var_0._id_5770 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10183;
    var_0._id_575B = ::_id_3D10;
    var_0._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1018E();
    var_0._id_575C["front"] = 103;
    var_0._id_575C["back"] = 103;
    var_0._id_575C["left"] = 40;
    var_0._id_575C["right"] = 40;
    var_0._id_575C["top"] = 60;
    var_0._id_575C["bottom"] = 0;
    var_1 = "front";
    var_0._id_5768[var_1] = ( 75, 0, 48 );
    var_0._id_5758[var_1] = "front";
    var_1 = "back";
    var_0._id_5768[var_1] = ( -75, 0, 48 );
    var_0._id_5758[var_1] = "back";
    var_2 = [ "driver", "fr", "br", "bl" ];
    var_3 = "driver";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "cop_car", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "bl", "back", "fr", "front" ];
    var_0._id_5768[var_3] = ( 7, 14, 48 );
    var_0._id_5758[var_3] = "left";
    var_4._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10192();
    var_4._id_42EE = 0.5;
    var_4._id_18CA = "tag_seat_0";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_E351 = 10;
    var_4._id_AAB3 = "ping_vehicle_driver";
    var_3 = "fr";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "cop_car", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "br", "back", "driver", "front" ];
    var_0._id_5768[var_3] = ( 7, -14, 48 );
    var_0._id_5758[var_3] = "right";
    var_4._id_42EE = 0.5;
    var_4._id_18CA = "tag_seat_1";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "bl";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "cop_car", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "driver", "back", "br", "front" ];
    var_0._id_5768[var_3] = ( -28, 14, 48 );
    var_0._id_5758[var_3] = "left";
    var_4._id_42EE = 0.5;
    var_4._id_18CA = "tag_seat_2";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "br";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "cop_car", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "fr", "back", "bl", "front" ];
    var_0._id_5768[var_3] = ( -28, -14, 48 );
    var_0._id_5758[var_3] = "right";
    var_4._id_42EE = 0.5;
    var_4._id_18CA = "tag_seat_3";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
}

_id_3D17()
{
    var_0 = _id_09B8::_id_100ED( "cop_car", 1 );
    var_0._id_CFB3["driver"] = [ "driver" ];
    var_0._id_CFB3["fr"] = [ "fr" ];
    var_0._id_CFB3["bl"] = [ "bl" ];
    var_0._id_CFB3["br"] = [ "br" ];
}

_id_3D1A()
{
    var_0 = _id_09A1::_id_10371( "cop_car", 1 );
    var_0._id_7C71 = 6;
    var_0._id_CFB6["driver"] = 0;
    var_0._id_CFB6["fr"] = 1;
    var_0._id_CFB6["bl"] = 2;
    var_0._id_CFB6["br"] = 3;
}

_id_3D15()
{
    _id_09B6::_id_10067( "cop_car", 1000 );
    var_0 = _id_09B6::_id_1003F( "cop_car" );
    var_0.class = "medium_light";
    _id_09B6::_id_1002A( "cop_car" );
    _id_09B6::_id_10071( "cop_car", 6 );
    _id_09B6::_id_1006C( "cop_car", ::_id_3D0C );
    _id_09B6::_id_10074( "cop_car_mp", 3 );
}

_id_3D16()
{
    level._effect["cop_car_explode"] = loadfx( "vfx/iw8/veh/scriptables/vfx_veh_explosion_sedan.vfx" );
}

_id_3D0B( var_0, var_1 )
{
    if ( !isdefined( var_0.angles ) )
        var_0.angles = ( 0, 0, 0 );

    var_0._id_02AF = "veh8_civ_lnd_skilo_rus_police_physics_mp";
    var_0._id_045A = "cop_car";
    var_0.type = "skilo_police_physics_mp";
    var_2 = scripts\cp_mp\vehicles\vehicle_tracking::_id_0D58( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return undefined;

    scripts\cp_mp\vehicles\vehicle::_id_10024( var_2, "cop_car", var_0 );
    var_2.objweapon = makeweapon( "cop_car_mp" );
    _id_09B5::_id_10016( var_2 );
    scripts\cp_mp\vehicles\vehicle::vehicle_create( var_2, var_0 );
    thread scripts\cp_mp\vehicles\vehicle::_id_102E0( var_2, undefined, scripts\cp_mp\vehicles\vehicle::_id_100A8 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cop_car", "create" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cop_car", "create" ) ]]( var_2 );

    return var_2;
}

_id_3D12( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = spawnstruct();
        var_0.inflictor = self;
        var_0.objweapon = "cop_car_mp";
        var_0._id_9CBF = "MOD_EXPLOSIVE";
    }

    _id_09B6::_id_1005E( var_0 );
    scripts\cp_mp\vehicles\vehicle_occupancy::_id_101C3( self, var_0 );
    _id_09B6::_id_1002E( undefined, undefined, 1 );
    thread _id_3D0D();

    if ( !istrue( level._id_EBC0 ) )
    {
        var_2 = self gettagorigin( "tag_origin" );
        var_3 = scripts\engine\utility::ter_op( isdefined( var_0.attacker ), var_0.attacker, self );
        self radiusdamage( var_2, 256, 140, 70, var_3, "MOD_EXPLOSIVE", "cop_car_mp" );
        playfx( scripts\engine\utility::getfx( "cop_car_explode" ), var_2, anglestoforward( self.angles ), anglestoup( self.angles ) );
        playsoundatpos( var_2, "car_explode" );
        earthquake( 0.4, 800, var_2, 0.7 );
        playrumbleonposition( "grenade_rumble", var_2 );
        _func_0190( var_2, 500, 200, 1 );
    }
}

_id_3D0D()
{
    scripts\cp_mp\vehicles\vehicle::_id_1008D( self );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "cop_car", "delete" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "cop_car", "delete" ) ]]( self );

    waitframe();
    scripts\cp_mp\vehicles\vehicle::_id_1008E( self );
}

_id_3D0C( var_0 )
{
    thread _id_3D12( var_0 );
    return 1;
}

_id_3D0E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_3D0F( var_0, var_1, var_2, var_3, var_4 );
}

_id_3D0F( var_0, var_1, var_2, var_3, var_4 )
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

_id_3D10( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_3D11( var_0, var_1, var_2, var_3, var_4 );
}

_id_3D11( var_0, var_1, var_2, var_3, var_4 )
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

_id_3D1B()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "cop_car", 1 );
    var_0._id_9C64 = 2;
    var_0._id_BD19 = 75;
    var_0._id_6D3F = ::_id_3D13;
    var_0._id_E271 = scripts\cp_mp\utility\script_utility::getsharedfunc( "cop_car", "spawnCallback" );
    var_0._id_38FF = 100;
    var_0._id_38FB = 60;
    var_0._id_38FD = 100;
}

_id_3D13()
{
    var_0 = scripts\engine\utility::_id_6D7C( "copcar_spawn", "targetname" );

    if ( var_0.size > 0 )
    {
        var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10288( var_0, 1 );

        if ( var_0.size > 1 )
            var_0 = scripts\engine\utility::_id_1B94( var_0 );
    }

    return var_0;
}
