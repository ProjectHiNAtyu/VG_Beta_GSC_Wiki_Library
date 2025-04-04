// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

ray_trace( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_3ED4() );
    var_8 = scripts\engine\utility::ter_op( isdefined( var_5 ), var_5, 0 );
    var_9 = _func_02BC( var_0, var_1, var_7, var_2, 0, "physicsquery_closest", var_8, var_6 );

    if ( var_9.size )
        var_9 = var_9[0];
    else
        var_9 = _id_83C1( var_1 );

    if ( isdefined( var_4 ) && var_4 )
        var_9 = _id_3C58( var_9 );

    return var_9;
}

_id_C045( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_3ED4() );
    var_7 = scripts\engine\utility::ter_op( isdefined( var_5 ), var_5, 0 );
    var_8 = _func_0393( var_0, var_1, var_6, var_2, 0, "physicsquery_closest", var_7 );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_83C1( var_1 );

    if ( isdefined( var_4 ) && var_4 )
        var_8 = _id_3C58( var_8 );

    return var_8;
}

_bullet_trace( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = [ "physicscontents_clipshot", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item" ];

    if ( var_2 )
        var_9[var_9.size] = "physicscontents_characterproxy";

    if ( isdefined( var_4 ) && var_4 )
        var_9[var_9.size] = "physicscontents_itemclip";

    if ( isdefined( var_6 ) && var_6 )
        var_9[var_9.size] = "physicscontents_vehicleclip";

    if ( !isdefined( var_7 ) || !var_7 )
        var_9[var_9.size] = "physicscontents_clipshot";

    if ( !isdefined( var_8 ) || var_8 )
        var_9[var_9.size] = "physicscontents_glass";

    if ( isdefined( var_5 ) && var_5 )
        return _id_C043( var_0, var_1, var_3, physics_createcontents( var_9 ), 1 );
    else
        return ray_trace( var_0, var_1, var_3, physics_createcontents( var_9 ), 1 );
}

_bullet_trace_passed( var_0, var_1, var_2, var_3 )
{
    return ray_trace_passed( var_0, var_1, var_3, _id_3ED4( !var_2 ) );
}

_id_C043( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_3ED4() );
    var_8 = scripts\engine\utility::ter_op( isdefined( var_5 ), var_5, 0 );

    if ( isdefined( var_6 ) )
        var_9 = _func_02BC( var_0, var_1, var_7, var_2, 1, "physicsquery_closest", var_8, var_6 );
    else
        var_9 = _func_02BC( var_0, var_1, var_7, var_2, 1, "physicsquery_closest", var_8 );

    if ( var_9.size )
        var_9 = var_9[0];
    else
        var_9 = _id_83C1( var_1 );

    if ( isdefined( var_4 ) && var_4 )
        var_9 = _id_3C58( var_9 );

    return var_9;
}

_id_C046( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_3ED4() );
    var_6 = _func_02BC( var_0, var_1, var_5, var_2, 0, "physicsquery_all" );

    if ( isdefined( var_4 ) && var_4 )
    {
        foreach ( var_9, var_8 in var_6 )
            var_6[var_9] = _id_3C58( var_8 );
    }

    return var_6;
}

ray_trace_passed( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_3ED4() );
    return !_func_02BC( var_0, var_1, var_4, var_2, 0, "physicsquery_any" );
}

_id_C044( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_3ED4() );
    return !_func_02BC( var_0, var_1, var_4, var_2, 1, "physicsquery_any" );
}

_id_30CF( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !scripts\engine\math::_id_B99D( var_0 ) )
        return 0;

    return ray_trace_passed( self geteye(), var_0, self, _id_3EC3( var_1, 1, 0, 1, 0, 1 ) );
}

_id_E406( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );
    var_7 = _func_02BD( var_0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_83C1( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_3C58( var_7 );

    return var_7;
}

_id_E408( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );
    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, 0 );
    var_9 = _func_0440( var_0, var_1, var_2, var_7, var_3, "physicsquery_closest" );

    if ( var_9.size )
        var_9 = var_9[0];
    else
        var_9 = _id_83C1( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_9 = _id_3C58( var_9 );

    return var_9;
}

_id_E407( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 1.0;
    var_6 = ( 1, 1, 1 );
    var_7 = ( 1, 0, 0 );
    var_8 = ( 1, 0, 1 );
    var_9 = 0;
    var_10 = distance( var_0, var_1 );
    var_11 = vectornormalize( var_1 - var_0 );
    var_12 = vectortoangles( var_1 - var_0 );
    var_12 = _func_0047( var_12, ( 90, 0, 0 ) );
    var_13 = var_0 - var_11 * var_2;

    if ( isdefined( var_3 ) )
    {
        if ( isint( var_3 ) )
        {
            if ( var_3 == 1 )
                var_9 = 1;
        }
        else if ( isdefined( var_3["position"] ) )
        {
            var_9 = 1;
            var_5 = var_3["fraction"];
        }
        else
        {
            var_14 = undefined;
            var_15 = undefined;

            if ( var_3.size == 2 && isdefined( var_3[0] ) && isdefined( var_3[1] ) && ( isint( var_3[0] ) || _func_0106( var_3[0] ) && ( isint( var_3[1] ) || _func_0106( var_3[1] ) ) ) )
            {
                var_14 = var_3[0];
                var_15 = var_3[1];
            }
            else if ( isint( var_3 ) || _func_0106( var_3 ) )
                var_14 = var_3;

            if ( isdefined( var_14 ) )
            {
                if ( isint( var_14 ) )
                {
                    if ( var_14 == 1 )
                        var_9 = 1;
                }
                else
                {
                    foreach ( var_18, var_17 in var_14 )
                    {
                        if ( isdefined( var_17["position"] ) )
                        {
                            var_9 = 1;

                            if ( var_18 == var_14.size - 1 )
                            {
                                var_5 = var_17["fraction"];
                                continue;
                            }
                        }
                    }
                }
            }

            if ( isdefined( var_15 ) )
            {
                if ( isint( var_15 ) )
                {
                    if ( var_15 == 1 )
                    {

                    }
                }
                else
                {
                    foreach ( var_18, var_17 in var_15 )
                    {
                        if ( isdefined( var_17["position"] ) )
                        {

                        }
                    }
                }
            }
        }
    }

    var_20 = var_2 * 2 + var_10 * var_5;
    var_21 = var_6;

    if ( var_9 )
        var_21 = var_7;

    scripts\engine\utility::_id_4ED3( var_13, var_2, var_20, var_12, [ var_6, var_6, var_21 ], 0, var_4 );
}

_id_E409( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );
    var_8 = _func_02BD( var_0, var_1, var_2, var_7, var_3, "physicsquery_all", undefined, var_6 );

    if ( isdefined( var_5 ) && var_5 )
    {
        foreach ( var_10 in var_8 )
            var_10 = _id_3C58( var_10 );
    }

    return var_8;
}

_id_E40A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );
    return !_func_02BD( var_0, var_1, var_2, var_5, var_3, "physicsquery_any" );
}

_id_E404( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );
    var_7 = _func_02C1( var_0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_83C1( var_0 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_3C58( var_7 );

    return var_7;
}

_id_31F3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_3ED4() );
    var_9 = _id_3C53( var_0, var_1, var_2, var_3, var_4 );
    var_10 = _func_02BE( var_9["trace_start"], var_9["trace_end"], var_2, var_9["half_height"], var_4, var_8, var_5, "physicsquery_closest" );

    if ( var_10.size )
        var_10 = var_10[0];
    else
        var_10 = _id_83C1( var_1 );

    if ( isdefined( var_7 ) && var_7 )
        var_10 = _id_3C58( var_10 );

    return var_10;
}

_id_31F4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_3ED4() );
    var_9 = _id_3C53( var_0, var_1, var_2, var_3, var_4 );
    var_10 = _func_02BE( var_9["trace_start"], var_9["trace_end"], var_2, var_9["half_height"], var_4, var_8, var_5, "physicsquery_all" );

    if ( isdefined( var_7 ) && var_7 )
    {
        foreach ( var_12 in var_10 )
            var_12 = _id_3C58( var_12 );
    }

    return var_10;
}

_id_31F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_7 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_3ED4() );
    var_8 = _id_3C53( var_0, var_1, var_2, var_3, var_4 );
    return !_func_02BE( var_8["trace_start"], var_8["trace_end"], var_2, var_8["half_height"], var_4, var_7, var_5, "physicsquery_any" );
}

_id_31F2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_3ED4() );
    var_9 = _id_3C53( var_0, undefined, var_1, var_2, var_3 );
    var_10 = _func_02C2( var_9["trace_start"], var_1, var_9["half_height"], var_3, var_4, var_8, var_5, "physicsquery_closest" );

    if ( var_10.size )
        var_10 = var_10[0];
    else
        var_10 = _id_83C1( var_0 );

    if ( isdefined( var_7 ) && var_7 )
        var_10 = _id_3C58( var_10 );

    return var_10;
}

_id_B5F4( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self getplayerangles();

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = _func_02CD( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_closest" );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_83C1( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_8 = _id_3C58( var_8 );

    return var_8;
}

_id_B5F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self getplayerangles();

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = _func_02CD( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_all" );

    if ( isdefined( var_5 ) && var_5 )
    {
        foreach ( var_10 in var_8 )
            var_10 = _id_3C58( var_10 );
    }

    return var_8;
}

_id_B5F6( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self getplayerangles();

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    return !_func_02CD( var_0, var_1, self, var_5, var_2, var_6, var_3, "physicsquery_any" );
}

_id_B47D( var_0, var_1, var_2, var_3 )
{
    return _id_B47C( self.origin, self.angles, var_0, var_1, var_2, var_3 );
}

_id_B47C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = self getplayerangles();

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( _func_0106( var_3 ) )
        var_3 = scripts\engine\utility::array_add( var_3, self );
    else
        var_3 = self;

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3ED4() );
    var_7 = _func_02CE( var_0, self, 0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_83C1( var_0 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_3C58( var_7 );

    return var_7;
}

_id_12C9( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self.angles;

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3F4E() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = _func_02CD( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_closest" );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_83C1( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_8 = _id_3C58( var_8 );

    return var_8;
}

_id_12CA( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self.angles;

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3F4E() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = _func_02CD( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_all" );

    if ( isdefined( var_5 ) && var_5 )
    {
        foreach ( var_10 in var_8 )
            var_10 = _id_3C58( var_10 );
    }

    return var_8;
}

_id_12CB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self.angles;

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3F4E() );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    return !_func_02CD( var_0, var_1, self, var_5, var_2, var_6, var_3, "physicsquery_any" );
}

_id_1262( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = self.angles;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_3F4E() );
    var_7 = _func_02CE( var_0, self, 0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_83C1( var_0 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_3C58( var_7 );

    return var_7;
}

_id_3F4E( var_0 )
{
    var_1 = [ "physicscontents_aiclip", "physicscontents_glass", "physicscontents_vehicle" ];

    if ( !isdefined( var_0 ) || !var_0 )
        var_1 = scripts\engine\utility::array_add( var_1, "physicscontents_characterproxy" );

    return physics_createcontents( var_1 );
}

_id_3F33( var_0, var_1 )
{
    var_2 = [ "physicscontents_ainosight", "physicscontents_vehicle" ];

    if ( !istrue( var_0 ) )
        var_2[var_2.size] = "physicscontents_characterproxy";

    if ( !istrue( var_1 ) )
        var_2[var_2.size] = "physicscontents_foliage";

    return physics_createcontents( var_2 );
}

_id_3EA7()
{
    var_0 = [ "physicscontents_ainosight" ];
    return physics_createcontents( var_0 );
}

_id_3F72()
{
    var_0 = [ "physicscontents_itemclip", "physicscontents_water" ];
    return physics_createcontents( var_0 );
}

_id_3EFC()
{
    var_0 = [ "physicscontents_glass" ];
    return physics_createcontents( var_0 );
}

_id_3EA6()
{
    var_0 = [ "physicscontents_ainoshoot" ];
    return physics_createcontents( var_0 );
}

_id_3F0A()
{
    var_0 = [ "physicscontents_item" ];
    return physics_createcontents( var_0 );
}

_id_3F0B()
{
    var_0 = [ "physicscontents_itemclip" ];
    return physics_createcontents( var_0 );
}

_id_3F65()
{
    var_0 = [ "physicscontents_vehicle" ];
    return physics_createcontents( var_0 );
}

_id_3F49()
{
    var_0 = [ "physicscontents_clipshot", "physicscontents_missileclip" ];
    return physics_createcontents( var_0 );
}

_id_3F3D()
{
    var_0 = [ "physicscontents_playerclip" ];
    return physics_createcontents( var_0 );
}

_id_3EBE()
{
    var_0 = [ "physicscontents_characterproxy" ];
    return physics_createcontents( var_0 );
}

_id_3ED4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    return _id_3EC3( !var_0, 1, 1, 1, 0, 1 );
}

_id_3EC3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = 0;

    if ( isdefined( var_0 ) && var_0 )
        var_9 = var_9 + _id_3EBE();

    if ( isdefined( var_1 ) && var_1 )
        var_9 = var_9 + _id_3F72();

    if ( isdefined( var_2 ) && var_2 )
        var_9 = var_9 + _id_3EFC();

    if ( isdefined( var_3 ) && var_3 )
        var_9 = var_9 + _id_3F49();

    if ( isdefined( var_4 ) && var_4 )
        var_9 = var_9 + _id_3F0A();

    if ( isdefined( var_5 ) && var_5 )
        var_9 = var_9 + _id_3F65();

    if ( isdefined( var_6 ) && var_6 )
        var_9 = var_9 + _id_3F3D();

    if ( isdefined( var_7 ) && var_7 )
        var_9 = var_9 + _id_3EA7();

    if ( isdefined( var_8 ) && var_8 )
        var_9 = var_9 + _id_3F0B();

    return var_9;
}

_id_3EA9()
{
    var_0 = [ "physicscontents_foliage", "physicscontents_vehicletrigger", "physicscontents_glass", "physicscontents_water", "physicscontents_ainoshoot", "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicleclip", "physicscontents_itemclip", "physicscontents_ainosight", "physicscontents_clipshot", "physicscontents_characterproxy", "physicscontents_playerclip", "physicscontents_aiclip", "physicscontents_sentienttrigger", "physicscontents_nonsentienttrigger", "physicscontents_vehicle", "physicscontents_useclip", "physicscontents_playertrigger" ];
    return physics_createcontents( var_0 );
}

_id_3C58( var_0 )
{
    var_1 = _func_02C5( var_0["surfaceflags"] );
    var_0["surfaceindex"] = var_1["index"];
    var_0["surfacetype"] = var_1["name"];
    return var_0;
}

_id_3C53( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_5 = var_3 * 0.5;
    var_6 = anglestoforward( var_4 );
    var_7 = anglestoup( var_4 );
    var_8 = [];
    var_8["trace_start"] = var_0 + var_7 * var_5;

    if ( isdefined( var_1 ) )
        var_8["trace_end"] = var_1 + var_7 * var_5;

    var_8["radius"] = var_2;
    var_8["angles"] = var_4;
    var_8["half_height"] = var_5;
    return var_8;
}

_id_4F0F( var_0, var_1, var_2, var_3 )
{

}

_id_4F10( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_4F11( var_0, var_1, var_2 )
{

}

_id_83C1( var_0 )
{
    var_1 = [];
    var_1["fraction"] = 1;
    var_1["surfaceflags"] = 0;
    var_1["distance"] = 0;
    var_1["position"] = var_0;
    var_1["shape_position"] = var_0;
    var_1["normal"] = ( 0, 0, 0 );
    var_1["contact_normal"] = ( 0, 0, 0 );
    var_1["hittype"] = "hittype_none";
    return var_1;
}

_id_83B8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{

}
