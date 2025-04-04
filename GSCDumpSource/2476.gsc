// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8EB7()
{
    var_0 = scripts\cp_mp\vehicles\vehicle::_id_100BF( "large_transport", 1 );
    var_0._id_4820 = ::_id_8EB5;
    _id_8EBC();
    _id_8EBA();
    _id_8EBD();
    _id_8EB8();
    _id_8EB9();

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "large_transport", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "large_transport", "init" ) ]]();

    _id_8EBE();
    _id_8EBB();
}

_id_8EBB()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "large_transport", "initLate" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "large_transport", "initLate" ) ]]();
}

_id_8EBC()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A1( "large_transport", 1 );
    var_0._id_54B6 = ::_id_8EB1;
    var_0._id_5770 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10183;
    var_0._id_575B = ::_id_8EB3;
    var_0._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1018F();
    var_0._id_575C["front"] = 118;
    var_0._id_575C["back"] = 135;
    var_0._id_575C["left"] = 57;
    var_0._id_575C["right"] = 57;
    var_0._id_575C["top"] = 127;
    var_0._id_575C["bottom"] = 0;
    var_1 = "front";
    var_0._id_5768[var_1] = ( 100, 0, 75 );
    var_0._id_5758[var_1] = "front";
    var_1 = "front_right";
    var_0._id_5768[var_1] = ( 55, 22, 90 );
    var_0._id_5758[var_1] = "right";
    var_1 = "back_left";
    var_0._id_5768[var_1] = ( -109, 22, 90 );
    var_0._id_5758[var_1] = "back";
    var_1 = "back_right";
    var_0._id_5768[var_1] = ( -109, -22, 90 );
    var_0._id_5758[var_1] = "back";
    var_2 = [ "driver", "fr_rear", "mr_rear", "br_rear", "bl_rear", "ml_rear", "fl_rear" ];
    var_3 = "driver";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "ml_rear", "back_left", "front_right", "front" ];
    var_0._id_5768[var_3] = ( 55, 22, 90 );
    var_0._id_5758[var_3] = "left";
    var_4._id_42EE = 0.5;
    var_4._id_C718 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10192();
    var_4._id_18CA = "tag_seat_0";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_E351 = 10;
    var_4._id_AAB3 = "ping_vehicle_driver";
    var_3 = "fl_rear";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "bl_rear", "back_left", "fr_rear", "front" ];
    var_0._id_5768[var_3] = ( -42, 22, 90 );
    var_0._id_5758[var_3] = "left";
    var_4._id_18CA = "tag_seat_5";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "fr_rear";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "br_rear", "back_right", "fl_rear", "front" ];
    var_0._id_5768[var_3] = ( -42, -22, 90 );
    var_0._id_5758[var_3] = "right";
    var_4._id_18CA = "tag_seat_2";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "ml_rear";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "bl_rear", "back_left", "mr_rear", "front" ];
    var_0._id_5768[var_3] = ( -76, 22, 90 );
    var_0._id_5758[var_3] = "left";
    var_4._id_18CA = "tag_seat_6";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "mr_rear";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "br_rear", "back_right", "ml_rear", "front" ];
    var_0._id_5768[var_3] = ( -76, -22, 90 );
    var_0._id_5758[var_3] = "right";
    var_4._id_18CA = "tag_seat_3";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "bl_rear";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "fl_rear", "back_left", "br_rear", "front" ];
    var_0._id_5768[var_3] = ( -109, 22, 90 );
    var_0._id_5758[var_3] = "left";
    var_4._id_18CA = "tag_seat_7";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
    var_3 = "br_rear";
    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_101A0( "large_transport", var_3, 1 );
    var_4._id_CFB8 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10188( var_3, var_2 );
    var_4._id_5760 = [ var_3, "fr_rear", "back_right", "bl_rear", "front" ];
    var_0._id_5768[var_3] = ( -109, -22, 90 );
    var_0._id_5758[var_3] = "right";
    var_4._id_18CA = "tag_seat_4";
    var_4._id_5775 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1015D( var_4._id_18CA );
    var_4._id_AAB3 = "ping_vehicle_rider";
}

_id_8EBA()
{
    var_0 = _id_09B8::_id_100ED( "large_transport", 1 );
    var_0._id_CFB3["driver"] = [ "driver" ];
    var_0._id_CFB3["fl_rear"] = [ "fl_rear" ];
    var_0._id_CFB3["fr_rear"] = [ "fr_rear" ];
    var_0._id_CFB3["ml_rear"] = [ "ml_rear" ];
    var_0._id_CFB3["mr_rear"] = [ "mr_rear" ];
    var_0._id_CFB3["bl_rear"] = [ "bl_rear" ];
    var_0._id_CFB3["br_rear"] = [ "br_rear" ];
}

_id_8EBD()
{
    var_0 = _id_09A1::_id_10371( "large_transport", 1 );
    var_0._id_7C71 = 5;
    var_0._id_CFB6["driver"] = 0;
    var_0._id_CFB6["fl_rear"] = 6;
    var_0._id_CFB6["fr_rear"] = 1;
    var_0._id_CFB6["ml_rear"] = 5;
    var_0._id_CFB6["mr_rear"] = 2;
    var_0._id_CFB6["bl_rear"] = 4;
    var_0._id_CFB6["br_rear"] = 3;
}

_id_8EB8()
{
    _id_09B6::_id_10067( "large_transport", 2000 );
    var_0 = _id_09B6::_id_1003F( "large_transport" );
    var_0.class = "medium_heavy";
    _id_09B6::_id_1002A( "large_transport" );
    _id_09B6::_id_10071( "large_transport", 10 );
    _id_09B6::_id_1006C( "large_transport", ::_id_8EAF );
    _id_09B6::_id_10074( "large_transport_mp", 3 );
}

_id_8EB9()
{
    level._effect["large_transport_explode"] = loadfx( "vfx/iw8/veh/scriptables/vfx_veh_explosion_sedan.vfx" );
}

_id_8EAE( var_0, var_1 )
{
    if ( !isdefined( var_0.angles ) )
        var_0.angles = ( 0, 0, 0 );

    var_0._id_02AF = "veh8_mil_lnd_umike_infil_physics_mp";
    var_0._id_045A = "large_transport";
    var_0.type = "umike_physics_mp";
    var_2 = scripts\cp_mp\vehicles\vehicle_tracking::_id_0D58( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return undefined;

    scripts\cp_mp\vehicles\vehicle::_id_10024( var_2, "large_transport", var_0 );
    var_2.objweapon = makeweapon( "large_transport_mp" );
    _id_09B5::_id_10016( var_2 );
    scripts\cp_mp\vehicles\vehicle::vehicle_create( var_2, var_0 );
    thread scripts\cp_mp\vehicles\vehicle::_id_102E0( var_2, undefined, scripts\cp_mp\vehicles\vehicle::_id_100A8 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "large_transport", "create" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "large_transport", "create" ) ]]( var_2 );

    return var_2;
}

_id_8EB5( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = spawnstruct();
        var_0.inflictor = self;
        var_0.objweapon = "large_transport_mp";
        var_0._id_9CBF = "MOD_EXPLOSIVE";
    }

    _id_09B6::_id_1005E( var_0 );
    scripts\cp_mp\vehicles\vehicle_occupancy::_id_101C3( self, var_0 );
    _id_09B6::_id_1002E( undefined, undefined, 1 );
    thread _id_8EB0();

    if ( !istrue( level._id_EBC0 ) )
    {
        var_2 = self gettagorigin( "tag_origin" );
        var_3 = scripts\engine\utility::ter_op( isdefined( var_0.attacker ), var_0.attacker, self );
        self radiusdamage( var_2, 256, 140, 70, var_3, "MOD_EXPLOSIVE", "large_transport_mp" );
        playfx( scripts\engine\utility::getfx( "large_transport_explode" ), var_2, anglestoforward( self.angles ), anglestoup( self.angles ) );
        playsoundatpos( var_2, "car_explode" );
        earthquake( 0.4, 800, var_2, 0.7 );
        playrumbleonposition( "grenade_rumble", var_2 );
        _func_0190( var_2, 500, 200, 1 );
    }
}

_id_8EB0()
{
    scripts\cp_mp\vehicles\vehicle::_id_1008D( self );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "large_transport", "delete" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "large_transport", "delete" ) ]]( self );

    waitframe();
    scripts\cp_mp\vehicles\vehicle::_id_1008E( self );
}

_id_8EAF( var_0 )
{
    thread _id_8EB5( var_0 );
    return 1;
}

_id_8EB1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_8EB2( var_0, var_1, var_2, var_3, var_4 );
}

_id_8EB2( var_0, var_1, var_2, var_3, var_4 )
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

_id_8EB3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( istrue( var_4._id_EAC8 ) )
        _id_8EB4( var_0, var_1, var_2, var_3, var_4 );
}

_id_8EB4( var_0, var_1, var_2, var_3, var_4 )
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

_id_8EBE()
{
    var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10274( "large_transport", 1 );
    var_0._id_9C64 = 2;
    var_0._id_BD19 = 75;
    var_0._id_6D3F = ::_id_8EB6;
    var_0._id_E271 = scripts\cp_mp\utility\script_utility::getsharedfunc( "large_transport", "spawnCallback" );
    var_0._id_38FF = 150;
    var_0._id_38FB = 130;
    var_0._id_38FD = 150;
}

_id_8EB6()
{
    var_0 = scripts\engine\utility::_id_6D7C( "largetransport_spawn", "targetname" );

    if ( var_0.size > 0 )
    {
        var_0 = scripts\cp_mp\vehicles\vehicle_spawn::_id_10288( var_0, 1 );

        if ( var_0.size > 1 )
            var_0 = scripts\engine\utility::_id_1B94( var_0 );
    }

    return var_0;
}
