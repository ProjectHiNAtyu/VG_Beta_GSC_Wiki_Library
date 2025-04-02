// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_6589()
{
    var_0 = [ self ];

    if ( isdefined( level._id_5095 ) )
    {
        foreach ( var_2 in level._id_5095 )
            var_0[var_0.size] = var_2._id_5506[0];
    }

    var_4 = self _meth_8150( 1 );

    if ( !isdefined( var_4 ) )
        var_4 = [];

    var_4[var_4.size] = self _meth_8151();

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6 ) && var_6.classname == "grenade" )
            var_0[var_0.size] = var_6;
    }

    return var_0;
}

_id_6771( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_5 ) )
        var_5 = spawnstruct();

    if ( !isdefined( var_5._id_3BC7 ) )
        var_5._id_3BC7 = _id_64AD();

    if ( !isdefined( var_5._id_4BA2 ) )
        var_5._id_4BA2 = 5;

    if ( !isdefined( var_5._id_1728 ) )
        var_5._id_1728 = 1;

    if ( !isdefined( var_5._id_7D10 ) )
        var_5._id_7D10 = [ var_0, var_0.owner ];

    if ( !isdefined( var_5._id_7CE4 ) )
        var_5._id_7D00 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 10;

    if ( !isdefined( var_5._id_9C9A ) )
        var_5._id_9C9A = var_4 - var_4 * var_0._id_F1DC;

    var_6 = var_5._id_9C9A / var_5._id_4BA2;
    var_7[0] = 0;
    var_8[0] = var_0.origin;
    var_9 = var_5._id_4BA2;
    var_10 = anglestoforward( var_1 );
    var_11 = ( 0, 0, 1 );
    var_12 = var_10 * var_2 + var_11 * var_3;
    var_13 = var_11 * vectordot( var_11, var_12 );
    var_14 = var_12 - var_13;

    for ( var_15 = 1; var_15 < var_5._id_4BA2; var_15++ )
    {
        var_16 = var_7[var_15 - 1];
        var_17 = var_8[var_15 - 1];
        var_18 = var_15 * var_6;
        var_19 = var_14 * var_18;
        var_20 = var_13 * var_18 + ( 0, 0, -400 ) * var_18 * var_18;
        var_21 = var_8[0] + var_19 + var_20;
        var_7[var_15] = var_18;
        var_8[var_15] = var_21;
        var_22 = _func_02BC( var_17, var_21, var_5._id_3BC7, var_5._id_7D10, 1, "physicsquery_closest", var_5._id_7D00 );

        if ( isdefined( var_22 ) && var_22.size > 0 )
        {
            var_5._id_4802 = var_22[0]["position"];
            var_5._id_4806 = var_22[0]["normal"];
            var_5._id_4804 = var_22[0]["entity"];
            var_5._id_4805 = 1;
            var_23 = var_21 - var_17;
            var_24 = length( var_23 );
            var_25 = var_23 / var_24;
            var_26 = var_17 - var_5._id_4802;
            var_27 = vectordot( var_25, var_26 );
            var_28 = clamp( var_27 / var_24, 0, 1 );
            var_5._id_4808 = var_16 + var_6 * var_28;
            break;
        }
        else if ( var_15 == var_5._id_4BA2 - 1 )
        {
            var_5._id_4802 = var_21;
            break;
        }

        if ( var_5._id_1728 )
            waitframe();
    }

    return var_5;
}

_id_64AD( var_0 )
{
    var_1 = undefined;

    if ( istrue( var_0 ) )
        var_1 = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_characterproxy" ] );
    else
        var_1 = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water" ] );

    return var_1;
}

_id_B185( var_0, var_1 )
{
    self endon( "death_or_disconnect" );
    var_0 endon( "death" );
    var_0._id_C2F1 = var_0.origin;
    var_0._id_C2F6 = self.origin;
    var_0._id_C2F5 = self geteye();
    var_0._id_C2F4 = self _meth_8597();

    if ( !isdefined( var_1._id_B1C0 ) )
        var_1._id_B1C0 = 0.5;

    if ( !isdefined( var_1._id_B1BF ) )
        var_1._id_B1BF = 0;

    if ( !isdefined( var_1._id_B1C1 ) )
        var_1._id_B1C1 = 12;

    if ( !isdefined( var_1._id_B1BE ) )
        var_1._id_B1BE = 20;

    if ( !isdefined( var_1._id_B1C2 ) )
        var_1._id_B1C2 = 45;

    if ( !isdefined( var_1._id_B1C3 ) )
        var_1._id_B1C3 = 0.342;

    if ( !isdefined( var_1._id_B1C5 ) )
        var_1._id_B1C5 = 1;

    _id_B1AF( var_0, var_1 );
    var_2 = 0;
    var_3 = var_1._id_A697;
    var_4 = var_1._id_A694;
    var_5 = var_1._id_A68E;
    var_6 = var_1._id_A690;
    var_7 = undefined;

    if ( !istrue( var_6 ) )
    {
        var_3 = var_1._id_2E9B;
        var_4 = var_1._id_2E9A;
        var_5 = var_1._id_2E91;
        var_6 = var_1._id_2E96;

        if ( istrue( var_6 ) && isdefined( var_5 ) && var_5 _meth_8163() )
            var_6 = undefined;

        var_8 = _id_64AD( 0 );
        var_9 = [ var_0 ];
        var_10 = self geteye() - ( 0, 0, 30 );
        var_11 = var_10 + anglestoforward( self getplayerangles( 1 ) ) * 20;
        var_12 = _func_02BC( var_10, var_11, var_8, var_9, 0, "physicsquery_closest", 1 );

        if ( isdefined( var_12 ) && var_12.size > 0 )
            var_6 = 0;
    }
    else
        var_7 = _id_B18B( var_0.angles, var_1 );

    if ( istrue( var_6 ) )
    {
        if ( isdefined( var_4 ) && vectordot( var_4, ( 0, 0, 1 ) ) < var_1._id_B1C3 )
            var_2 = 1;
        else
        {
            var_13 = vectordot( var_0._id_C2F6 - var_3, ( 0, 0, 1 ) );

            if ( var_13 > 0 )
            {
                if ( var_13 > var_1._id_B1BE )
                    var_2 = 1;
            }
            else
            {
                var_14 = vectordot( var_0._id_C2F5 - var_0._id_C2F6, ( 0, 0, 1 ) );

                if ( var_14 > var_1._id_B1C2 )
                {
                    var_15 = vectordot( var_0._id_C2F5 - var_3, ( 0, 0, 1 ) );

                    if ( var_15 >= 0 )
                    {
                        if ( var_15 < var_1._id_B1C1 )
                            var_2 = 1;
                    }
                    else
                        var_2 = 1;
                }
            }
        }
    }
    else
        var_2 = 1;

    if ( var_2 )
    {
        var_8 = var_1._id_32E4;

        if ( !isdefined( var_8 ) )
            var_8 = _id_64AD();

        var_9 = [ var_0 ];
        var_10 = var_0._id_C2F6 + ( 0, 0, 1 );
        var_11 = var_10 + ( 0, 0, -1 * var_1._id_B1BE );
        var_12 = _func_02BC( var_10, var_11, var_8, var_9, 1, "physicsquery_closest", 1 );

        if ( isdefined( var_12 ) && var_12.size > 0 )
        {
            var_3 = var_12[0]["position"];
            var_4 = var_12[0]["normal"];

            if ( isdefined( var_4 ) && vectordot( var_4, ( 0, 0, 1 ) ) < var_1._id_B1C3 )
                return 0;

            var_16 = var_0._id_C2F4 * ( 0, 1, 0 );

            if ( isdefined( var_4 ) )
            {
                var_7 = _id_0A78::_id_FFE1( anglestoforward( var_16 ), var_4 );
                var_7 = _id_B18B( var_7, var_1 );
            }
            else
                var_7 = var_16;

            var_3 = var_3 + anglestoup( var_7 ) * var_1._id_B1C5;
            var_5 = var_12[0]["entity"];
            var_0 dontinterpolate();
            var_0.origin = var_3;
            var_0.angles = var_7;
        }
        else
            return 0;
    }
    else
    {
        if ( !isdefined( var_7 ) )
        {
            var_16 = var_0._id_C2F4 * ( 0, 1, 0 );

            if ( isdefined( var_4 ) )
            {
                var_7 = _id_0A78::_id_FFE1( anglestoforward( var_16 ), var_4 );
                var_7 = _id_B18B( var_7, var_1 );
            }
            else
                var_7 = var_16;
        }

        var_3 = var_3 + anglestoup( var_7 ) * var_1._id_B1C5;
        var_0 dontinterpolate();
        var_0.origin = var_3;
        var_0.angles = var_7;
    }

    if ( isdefined( var_5 ) )
        var_0 linkto( var_5 );

    return 1;
}

_id_B1AF( var_0, var_1 )
{
    childthread _id_B1B1( var_0, var_1 );
    childthread _id_B1B0( var_0, var_1 );
    childthread _id_B1B2( var_0, var_1 );
    var_1 waittill( "start_race" );
    waittillframeend;
    var_1 notify( "end_race" );
    return var_1;
}

_id_B1B1( var_0, var_1 )
{
    var_1 endon( "end_race" );
    var_0 waittill( "missile_stuck", var_2 );
    var_1._id_A697 = var_0.origin;
    var_1._id_A684 = var_0.angles;
    var_1._id_A68E = var_2;
    var_1._id_A690 = 1;
    var_1 notify( "start_race" );
}

_id_B1B0( var_0, var_1 )
{
    var_1 endon( "end_race" );
    var_1 = _id_6771( var_0, var_0._id_C2F4, var_1._id_F1CD, var_1._id_F1CE, var_1._id_32EE, var_1 );
    var_1._id_2E9B = var_1._id_4802;
    var_1._id_2E9A = var_1._id_4806;
    var_1._id_2E91 = var_1._id_4804;
    var_1._id_2E96 = var_1._id_4805;
    var_1 notify( "start_race" );
}

_id_B1B2( var_0, var_1 )
{
    var_1 endon( "end_race" );
    wait( var_1._id_B1C0 );
    var_1 notify( "start_race" );
}

_id_B18B( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0[1];
    var_4 = scripts\engine\utility::ter_op( var_1._id_B1BF != 0, var_0[2], 0 );

    if ( var_4 != 0 )
    {
        if ( var_4 > 0 )
            var_4 = clamp( var_0[2], 0, var_1._id_B1BF );
        else
            var_4 = clamp( var_0[2], -1 * var_1._id_B1BF, 0 );
    }

    return ( var_2, var_3, var_4 );
}
