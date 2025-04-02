// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_818B( var_0 )
{
    if ( !isdefined( level._id_03E1._id_7208 ) )
        level._id_03E1._id_7208 = spawnstruct();

    var_1 = level._id_03E1._id_7208;

    if ( !isdefined( var_1._id_7212 ) )
        var_1._id_7212 = [];

    var_2 = var_1._id_7212[var_0];

    if ( !isdefined( var_2 ) )
    {
        var_2 = spawnstruct();
        var_1._id_7212[var_0] = var_2;
        var_2.name = var_0;
        var_2._id_9D9E = [];
        var_2._id_B97F = [];
    }

    level._id_03E1._id_7208 notify( var_0 );
}

_id_1134( var_0, var_1 )
{
    if ( !isdefined( level._id_03E1._id_7208 ) || !isdefined( level._id_03E1._id_7208._id_7212 ) || !isdefined( level._id_03E1._id_7208._id_7212[var_0] ) )
        _id_818B( var_0 );

    var_2 = level._id_03E1._id_7208._id_7212[var_0];
    var_2._id_9D9E[var_2._id_9D9E.size] = var_1;
    var_2 thread _id_7207( var_1 );
}

_id_7207( var_0 )
{
    var_0 waittill( "death" );
    var_0 thread _id_0883::_id_438E();
    _id_71FC( self, var_0 );
    var_1 = self._id_9D9E.size;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        if ( self._id_9D9E[var_2] == var_0 )
        {
            var_3 = self._id_9D9E.size - 1;
            self._id_9D9E[var_2] = self._id_9D9E[var_3];
            self._id_9D9E[var_3] = undefined;
            break;
        }
    }

    if ( isdefined( var_0._id_03E1 ) && isdefined( var_0._id_03E1._id_3912 ) )
    {
        var_4 = var_0._id_03E1._id_3912._id_4129;
        var_0 _id_0880::_id_7BC6( var_4 );
    }
}

_id_38FA()
{
    if ( !isdefined( level._id_03E1._id_7208 ) )
        return;

    if ( !isdefined( level._id_03E1._id_7208._id_7212 ) )
        return;

    level._id_03E1._id_7208._id_7212 = undefined;
}

_id_6A61( var_0 )
{
    return level._id_03E1._id_7208._id_7212[var_0];
}

_id_99E4( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_E744 = var_1;
    var_3.origin = var_2;
    var_3._id_9D9E = [];
    var_3._id_AE48 = var_0;
    var_0._id_B97F[var_0._id_B97F.size] = var_3;
    return var_3;
}

_id_1144( var_0, var_1 )
{
    var_0._id_9D9E[var_0._id_9D9E.size] = var_1;
}

_id_7200( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 65536;

    foreach ( var_7 in var_0._id_B97F )
    {
        if ( isdefined( var_1 ) && var_1 == var_7 )
            continue;

        if ( var_7._id_E744 == var_2 )
        {
            if ( distancesquared( var_4, var_7.origin ) < var_5 )
            {
                _id_71FC( var_0, var_3 );
                _id_1144( var_7, var_3 );
                return var_7;
            }
        }
    }
}

_id_71DE( var_0, var_1, var_2 )
{
    var_3 = 65536;
    var_4 = _id_7200( var_0, undefined, 1, var_1, var_2 );

    if ( isdefined( var_4 ) )
    {
        if ( !isdefined( var_4._id_850C ) )
            var_4 _id_B97D( var_1, var_2 );

        return 0;
    }

    _id_71FC( var_0, var_1 );
    var_5 = _id_99E4( var_0, 1, var_2 );
    _id_1144( var_5, var_1 );
    var_5._id_850C = var_1;
    _id_71F5( var_5, var_1._id_CE61, var_2 );
    var_6 = level._id_03E1._id_8504[self._id_CE61];

    if ( isdefined( var_6 ) )
    {
        var_5._id_1069F = var_6;
        var_5._id_269F = _func_0119( var_2, var_6 );
    }

    return 1;
}

_id_71DD( var_0, var_1, var_2, var_3 )
{
    _id_71FC( var_0, var_1 );

    foreach ( var_5 in var_0._id_B97F )
    {
        if ( var_5._id_E744 == 2 )
        {
            if ( !isdefined( var_1._id_017D ) || !isdefined( var_5.target ) || var_5.target == var_1._id_017D )
            {
                _id_1144( var_5, var_1 );

                if ( !isdefined( var_5.target ) )
                {
                    var_5.target = var_1._id_017D;

                    if ( isdefined( var_2 ) )
                        var_5.origin = var_2;
                }

                return;
            }
        }
    }

    if ( !isdefined( var_2 ) )
        var_2 = var_1.origin;

    var_7 = _id_99E4( var_0, 2, var_2 );
    _id_1144( var_7, var_1 );
    var_7.target = var_1._id_017D;
    _id_71F5( var_7, var_1._id_CE61, var_2 );
    var_8 = level._id_03E1._id_7BAF[self._id_CE61];

    if ( isdefined( var_8 ) )
    {
        var_7._id_1069F = var_8;
        var_7._id_269F = _func_0119( var_2, var_8 );
    }

    var_7._id_8F73 = gettime();
    level thread _id_B977();
    var_7 thread _id_B976();
    var_7 thread _id_B974();
}

_id_71FC( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = _id_6A61( var_1._id_CE61 );

    var_2 = _id_71EB( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return;

    var_3 = var_2._id_9D9E.size;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        if ( var_2._id_9D9E[var_4] == var_1 )
        {
            var_5 = var_2._id_9D9E.size - 1;
            var_2._id_9D9E[var_4] = var_2._id_9D9E[var_5];
            var_2._id_9D9E[var_5] = undefined;
            break;
        }
    }

    if ( var_2._id_9D9E.size == 0 )
        var_2 _id_B971();
}

_id_71EC( var_0, var_1 )
{
    var_2 = 2304;
    var_3 = undefined;
    var_4 = 2359296;
    var_5 = [];

    foreach ( var_7 in level._id_03E1._id_7208._id_7212 )
    {
        if ( var_7.name == var_1 )
            continue;

        var_8 = level._id_03E1._id_8504[var_7.name];

        if ( isdefined( var_8 ) && !_func_0119( var_0, var_8 ) )
            continue;

        foreach ( var_10 in var_7._id_B97F )
        {
            if ( var_10._id_E744 == 1 && distance2dsquared( var_10.origin, var_0 ) < var_2 )
                return undefined;
        }

        foreach ( var_13 in var_7._id_9D9E )
        {
            if ( [[ self._id_5D7A ]]() )
            {
                var_14 = distancesquared( var_13.origin, var_0 );

                if ( var_14 < var_4 )
                {
                    var_5[var_5.size] = var_13;

                    if ( var_5.size > 8 )
                        break;
                }
            }
        }
    }

    if ( var_5.size > 0 )
        var_3 = _func_0347( var_5, var_0 );

    return var_3;
}

_id_71E0( var_0 )
{
    var_1 = level._id_03E1._id_8504[self._id_CE61];

    if ( isdefined( var_1 ) )
    {
        if ( !_func_0119( var_0._id_84F8, var_1 ) )
        {
            var_2 = _id_71EC( var_0._id_84F8, self._id_CE61 );

            if ( isdefined( var_2 ) )
            {
                var_2 _meth_8522( "seek_backup", self, var_0._id_84F8 );
                return 1;
            }
        }
    }

    return 0;
}

_id_71E9( var_0, var_1, var_2 )
{
    var_3 = _id_6A61( var_0 );
    var_4 = _id_71DE( var_3, var_1, var_2._id_84F8 );

    if ( var_4 )
        var_1 thread _id_71F8( var_2 );
}

_id_71F8( var_0 )
{
    self endon( "death" );
    self endon( "start_context_melee" );
    waitframe();
    _id_71E0( var_0 );
    waitframe();
    var_1 = _id_6A61( self._id_CE61 );
    var_2 = _id_71EB( var_1, self );

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2._id_9D9E.size == 1 )
    {
        var_3 = var_1._id_9D9E.size;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_1._id_9D9E[var_4];

            if ( var_5._id_03E1._id_2C30 == 0 && distancesquared( var_5.origin, self.origin ) < 10000 )
                var_5 _meth_819E( self );
        }
    }
}

_id_71F5( var_0, var_1, var_2 )
{
    var_3 = _id_6A61( var_1 );
    var_4 = 1000000;
    var_5 = [];
    var_6 = _func_00B3( "seek_patrol", "targetname" );
    var_7 = scripts\engine\utility::_id_6D7C( "seek_patrol", "targetname" );
    var_6 = scripts\engine\utility::array_combine( var_6, var_7 );
    var_8 = 0;

    while ( var_8 < var_6.size )
    {
        var_9 = 0;
        var_10 = var_6[var_8];

        if ( distancesquared( var_10.origin, var_2 ) > var_4 )
            var_9 = 1;
        else if ( isdefined( var_10._id_CE61 ) )
        {
            if ( var_10._id_CE61 == var_1 )
                var_5[var_5.size] = var_10;

            var_9 = 1;
        }

        if ( var_9 )
        {
            var_11 = var_6.size - 1;
            var_6[var_8] = var_6[var_11];
            var_6[var_11] = undefined;
            continue;
        }

        var_8++;
    }

    var_5 = _func_01FF( var_5, var_2 );
    var_6 = _func_01FF( var_6, var_2 );
    var_0._id_850D = scripts\engine\utility::array_combine( var_5, var_6 );
}

_id_71EB( var_0, var_1 )
{
    if ( isdefined( var_0._id_B97F ) )
    {
        var_2 = var_0._id_B97F.size;

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            var_4 = var_0._id_B97F[var_3];
            var_5 = var_4._id_9D9E.size;

            for ( var_6 = 0; var_6 < var_5; var_6++ )
            {
                if ( var_4._id_9D9E[var_6] == var_1 )
                    return var_4;
            }
        }
    }
}

_id_B96D( var_0, var_1 )
{
    var_0._id_FE52[var_0._id_FE52.size] = var_1;
    var_0._id_FE53[var_0._id_FE53.size] = gettime() + 5000;
}

_id_B96E( var_0 )
{
    var_1 = gettime();
    var_2 = 0;

    while ( var_2 < var_0._id_FE53.size )
    {
        if ( var_1 >= var_0._id_FE53[var_2] )
        {
            var_3 = var_0._id_FE53.size - 1;
            var_0._id_FE53[var_2] = var_0._id_FE53[var_3];
            var_0._id_FE53[var_3] = undefined;
            var_0._id_FE52[var_2] = var_0._id_FE52[var_3];
            var_0._id_FE52[var_3] = undefined;
            continue;
        }

        var_2++;
    }
}

_id_71F6( var_0, var_1 )
{
    var_2 = _id_6A61( var_0._id_CE61 );
    var_3 = _id_71EB( var_2, var_0 );

    if ( !isdefined( var_3._id_FE52 ) )
    {
        var_3._id_FE52 = [];
        var_3._id_FE53 = [];
    }

    _id_B96E( var_3 );
    var_4 = undefined;
    var_5 = [];

    foreach ( var_7 in var_3._id_9D9E )
    {
        var_8 = spawnstruct();
        var_8._id_7305 = var_7;
        var_9 = var_7.origin - var_3.origin;
        var_8._id_175C = _func_025C( var_9 );
        var_5[var_5.size] = var_8;

        if ( var_7 == var_0 )
            var_4 = var_8._id_175C;
    }

    var_11 = 0;

    foreach ( var_13 in var_5 )
    {
        if ( var_13._id_175C < var_4 )
            var_11++;
    }

    var_9 = var_0.origin - var_3.origin;
    var_15 = length( var_9 );
    var_16 = 768;
    var_17 = 512;
    var_18 = 256;
    var_19 = -128;
    var_20 = 64;
    var_21 = 360 / var_5.size;
    var_22 = var_11 * var_21;

    foreach ( var_24 in var_3._id_850D )
    {
        if ( isdefined( var_24._id_8FE1 ) )
            continue;

        if ( _id_899C( var_24, var_3, var_22, var_21, var_15, var_18 ) )
        {
            var_24._id_8FE1 = gettime();
            return var_24.origin;
        }
    }

    var_26 = var_15;

    if ( var_15 > var_16 )
        var_26 = max( 60, randomfloatrange( var_15 - var_18 * 2, var_15 - var_18 ) );
    else if ( var_15 > var_17 )
        var_26 = randomfloatrange( var_15 + var_19, var_15 + var_18 );
    else
        var_26 = randomfloatrange( var_15, var_15 + var_18 );

    var_27 = ( 0.5 + var_11 + randomfloatrange( -0.5, 0.5 ) ) * var_21;
    var_28 = ( cos( var_27 ), sin( var_27 ), 0 );
    var_29 = var_3.origin + var_26 * var_28;
    var_30 = _id_081A::_id_68F7( var_29, var_3._id_1069F, 256 );

    if ( isdefined( var_30 ) )
    {
        self._id_1C08._id_4249._id_1BDA = var_30.angles;
        _id_081A::_id_D6C2( var_30 );
        _id_B96D( var_3, var_30.origin );
        return var_30.origin;
    }

    var_31 = var_3._id_FE52;
    var_31[var_31.size] = self.origin;
    var_32 = 96;

    if ( var_31.size > var_32 )
    {
        var_33 = var_31.size;

        for ( var_34 = var_32; var_34 < var_33; var_34++ )
            var_31[var_34] = undefined;

        var_3._id_FE52 = var_31;
    }

    if ( isdefined( var_3._id_1069F ) )
    {
        var_35 = _func_0348( var_3._id_1069F, var_0.origin, var_29, var_31, 48 );

        if ( isdefined( var_35 ) )
        {
            _id_B96D( var_3, var_35 );
            return var_35;
        }
    }
    else if ( var_0._id_01E8 > 64 && isdefined( var_0._id_038C ) )
    {
        var_35 = _func_0349( var_0._id_038C, var_0._id_01E8, var_0.origin, var_29, var_31, 48 );

        if ( isdefined( var_35 ) )
        {
            _id_B96D( var_3, var_35 );
            return var_35;
        }
    }

    var_36 = _func_02A6( var_29, self );
    var_37 = undefined;

    if ( isdefined( var_3._id_1069F ) )
    {
        var_37 = self _meth_8619( var_36, var_3._id_1069F );

        if ( !isdefined( var_37 ) )
            var_37 = _func_02A4( var_3.origin, var_20, self );
    }

    if ( !isdefined( var_37 ) )
        var_37 = _func_02A4( var_36, var_20, self );

    if ( !isdefined( var_37 ) )
        var_37 = _func_02A6( var_3.origin, self );

    return var_37;
}

_id_899C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_0.origin - var_1.origin;
    var_7 = length( var_6 );
    var_8 = _func_025C( var_6 );
    var_9 = var_8 - var_2;

    if ( var_9 >= 0 && var_9 <= var_3 )
    {
        if ( var_4 + var_5 > var_7 )
            return 1;
    }

    return 0;
}

_id_71E7( var_0, var_1, var_2 )
{
    var_3 = _id_6A61( var_0 );
    var_3 thread _id_71E4( var_1 );
    var_4 = _id_71DE( var_3, var_1, var_2._id_84F8 );

    if ( var_4 )
        thread _id_71E1( var_3, var_2 );
}

_id_71E4( var_0 )
{
    wait 2;

    if ( isdefined( var_0 ) && isalive( var_0 ) )
        self._id_2414 = 1;
}

_id_71E1( var_0, var_1 )
{
    self endon( "death" );
    self endon( "start_context_melee" );
    waitframe();
    var_2 = _id_71EB( var_0, self );

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2._id_9D9E.size == 1 )
    {
        var_3 = var_0._id_9D9E.size;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_0._id_9D9E[var_4];

            if ( var_5 != self && var_5._id_03E1._id_2C30 == 0 && distancesquared( var_5.origin, self.origin ) < 10000 )
                var_5 _meth_819E( self );
        }
    }

    if ( _id_71E0( var_1 ) )
        return;

    if ( var_0._id_9D9E.size > 1 )
    {
        var_2 = _id_71EB( var_0, self );

        if ( isdefined( var_2 ) && var_2._id_E744 == 1 && var_2._id_9D9E.size == 1 && ( !isdefined( var_2._id_269F ) || var_2._id_269F ) )
            thread _id_088C::_id_1083( "stealth", "announce2", "seek_backup", 2.0, undefined, 1 );
    }
}

_id_B97D( var_0, var_1 )
{
    self.origin = var_1;

    if ( !isdefined( self._id_A403 ) )
        self._id_A403 = [];

    self._id_850C = var_0;
    self._id_A403[self._id_A403.size] = var_0;
}

_id_71E8( var_0, var_1 )
{
    var_2 = _id_6A61( var_0 );
    var_3 = self.origin;
    var_4 = 0;

    if ( isdefined( var_1._id_017D ) )
    {
        var_3 = var_1 _meth_8203( var_1._id_017D );
        var_4 = var_1 _meth_8204( var_1._id_017D );
        var_3 = _func_02A6( var_3, self );
    }

    _id_71FC( var_2, var_1 );
    _id_71DD( var_2, var_1, var_3, var_4 );
}

_id_7203( var_0, var_1 )
{
    var_2 = _id_6A61( var_0._id_CE61 );
    var_3 = _id_71EB( var_2, var_0 );
    var_3.origin = _func_02A6( var_1, var_0 );
    var_3._id_269E = undefined;

    if ( isdefined( var_3._id_1069F ) )
        var_3._id_269F = _func_0119( var_1, var_3._id_1069F );

    return var_3.origin;
}

_id_B976()
{
    self endon( "state_change" );
    thread _id_B975();

    if ( isdefined( level._id_03E1._id_7BC3 ) && level._id_03E1._id_7BC3[self._id_CE61] )
    {
        var_0 = level._id_03E1._id_7BC3[self._id_CE61];
        wait( var_0 );
        thread _id_B97C();
    }
    else
        return;
}

_id_B975()
{
    self endon( "state_change" );

    for (;;)
    {
        var_0 = isdefined( self._id_1069F ) && !istrue( self._id_269F );

        if ( var_0 )
        {
            if ( !isdefined( self._id_7B84 ) )
            {
                self._id_7B84 = gettime();
                self._id_24D6 = 1;
            }
            else if ( istrue( self._id_24D6 ) && gettime() > self._id_7B84 + 20000 )
                self._id_24D6 = undefined;
        }
        else
        {
            self._id_24D6 = undefined;
            self._id_7B84 = undefined;
        }

        waitframe();
    }
}

_id_B974()
{
    self endon( "state_change" );
    wait 3;
    var_0 = self._id_AE48;

    foreach ( var_2 in var_0._id_9D9E )
    {
        if ( var_2 [[ var_2._id_5D7A ]]() || var_2 [[ var_2._id_5D7C ]]() )
        {
            var_3 = 1;

            if ( isdefined( var_2._id_03E1._id_6016 ) && isdefined( var_2._id_03E1._id_6016["should_hunt"] ) )
                var_3 = var_2 [[ var_2._id_03E1._id_6016["should_hunt"] ]]();

            if ( var_3 )
                var_2 _id_0883::_id_2C3E( "hunt", undefined );
        }
    }
}

_id_B977()
{
    if ( !isdefined( level._id_242C ) )
        level._id_242C = 1;
    else
        return;

    var_0 = undefined;

    for (;;)
    {
        var_1 = [];

        foreach ( var_3 in level._id_03E1._id_7208._id_7212 )
        {
            if ( isdefined( var_3._id_B97F ) )
            {
                foreach ( var_5 in var_3._id_B97F )
                {
                    if ( isdefined( var_5._id_E744 ) && var_5._id_E744 == 2 )
                    {
                        foreach ( var_7 in var_5._id_9D9E )
                            var_1 = scripts\engine\utility::array_add( var_1, var_7 );
                    }
                }
            }
        }

        if ( var_1.size < 1 )
            break;

        if ( var_1.size > 1 )
        {
            var_1 = _func_01FF( var_1, level.player.origin );
            var_1[0]._id_2331._id_424D = var_1;
            var_1[0] thread _id_088C::_id_1083( "stealth", "hunt", "teaminquiry", undefined, undefined, 1 );
            var_11 = var_1[0];
            var_1 = scripts\engine\utility::array_remove( var_1, var_11 );
            wait( randomfloatrange( 2, 2.5 ) );
            var_1 = scripts\engine\utility::_id_1BA4( var_1 );
            var_1 = _func_01FF( var_1, level.player.origin );
            var_7 = undefined;

            switch ( var_1.size )
            {
                case 0:
                    break;
                case 3:
                case 2:
                case 1:
                    var_7 = var_1[randomint( var_1.size )];
                    break;
                default:
                    var_7 = var_1[randomint( 3 )];
                    break;
            }

            if ( !isdefined( var_7 ) )
                break;

            var_1 = scripts\engine\utility::array_add( var_1, var_11 );
            var_7._id_2331._id_424D = var_1;
            var_7 thread _id_088C::_id_1083( "stealth", "hunt", "lost_sight", undefined, undefined, 1 );
        }
        else
        {
            var_7 = var_1[0];

            if ( !isdefined( var_0 ) )
            {
                var_0 = 1;
                var_7 thread _id_088C::_id_1083( "stealth", "hunt", "first_lost" );
            }
            else
                var_7 thread _id_088C::_id_1083( "stealth", "hunt", "lost_sight" );
        }

        wait( randomintrange( 10, 15 ) );
    }

    level._id_242C = undefined;
}

_id_71DC( var_0, var_1 )
{
    _id_71FC( var_0, var_1 );

    foreach ( var_3 in var_0._id_B97F )
    {
        if ( var_3._id_E744 == 3 )
        {
            _id_1144( var_3, var_1 );
            return 0;
        }
    }

    var_5 = _id_99E4( var_0, 3, undefined );
    _id_1144( var_5, var_1 );
    var_5 thread _id_B970();
    var_5 thread _id_B96F();
    return 1;
}

_id_71DB( var_0 )
{
    var_1 = _id_6A61( var_0 );

    foreach ( var_3 in var_1._id_B97F )
    {
        if ( var_3._id_E744 == 3 )
            return 1;
    }

    return 0;
}

_id_71E6( var_0, var_1, var_2 )
{
    var_3 = _id_6A61( var_0 );
    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2.origin;

    var_5 = _id_71EB( var_3, var_1 );
    _id_71DC( var_3, var_1 );
    var_3 thread _id_71E2( 2.0, var_1, var_2, var_4 );
    var_3 thread _id_71E3( 3.0, var_1, var_2, var_4 );
}

_id_71E3( var_0, var_1, var_2, var_3 )
{
    var_1 endon( "death" );
    wait( var_0 );

    if ( !isdefined( var_1 ) || !isalive( var_1 ) || istrue( var_1._id_0218 ) )
        return;

    if ( !isdefined( var_2 ) )
        return;

    var_4 = 65536;

    foreach ( var_6 in level._id_03E1._id_7208._id_7212 )
    {
        foreach ( var_8 in var_6._id_9D9E )
        {
            if ( var_1 == var_8 )
                continue;

            var_9 = _id_71EB( var_6, var_8 );

            if ( !isdefined( var_9 ) )
                continue;

            if ( var_9._id_E744 == 1 || var_9._id_E744 == 2 && isdefined( var_9.target ) && var_9.target == var_2 )
            {
                if ( var_1._id_CE61 == var_8._id_CE61 || distancesquared( var_1.origin, var_8.origin ) < var_4 )
                {
                    var_8 _meth_812E( var_2 );
                    var_8 _meth_8522( "combat", var_2, var_3 );
                }
            }
        }
    }
}

_id_71E2( var_0, var_1, var_2, var_3 )
{
    wait( var_0 );
    var_4 = 16384;

    if ( !isdefined( var_1 ) || !isalive( var_1 ) || istrue( var_1._id_0218 ) )
        return;

    self._id_2414 = 1;
    level notify( "cover_blown" );

    foreach ( var_6 in level._id_03E1._id_7208._id_7212 )
    {
        foreach ( var_8 in var_6._id_9D9E )
        {
            if ( var_1 == var_8 )
                continue;

            var_9 = 0;
            var_10 = 0;
            var_11 = _id_71EB( var_6, var_8 );

            if ( isdefined( var_11 ) && var_11._id_E744 == 3 )
                continue;

            if ( isdefined( var_2 ) )
            {
                if ( var_8 _meth_8066( var_2 ) )
                {
                    var_9 = 1;
                    var_10 = 1;
                }
            }

            if ( !var_9 && var_8 _meth_8066( var_1 ) )
                var_9 = 1;

            if ( !var_9 && distancesquared( var_8.origin, var_1.origin ) < var_4 && var_8 _meth_8618( var_1 ) )
            {
                var_9 = 1;

                if ( isdefined( var_2 ) )
                    var_10 = 1;
            }

            if ( var_10 )
                var_8 _meth_812E( var_2 );

            if ( var_9 )
            {
                if ( isdefined( var_2 ) )
                {
                    var_8 _meth_8522( "combat", var_2, var_3 );
                    continue;
                }

                var_8 _meth_8522( "combat", var_1, var_1.origin );
            }
        }
    }
}

_id_B97A( var_0, var_1 )
{
    var_2 = self._id_9D9E;

    foreach ( var_4 in var_2 )
    {
        if ( var_0 )
            var_4 _meth_812E( var_1 );

        var_4 _meth_8522( "combat", var_1, var_1.origin );
    }
}

_id_7213()
{
    level notify( "cancel_group_combat_checklosttarget" );
    level endon( "cancel_group_combat_checklosttarget" );
    waitframe();

    while ( !isdefined( level._id_03E1._id_2C35 ) )
    {
        var_0 = [];
        var_1 = 1;

        foreach ( var_3 in level._id_03E1._id_7208._id_7212 )
        {
            foreach ( var_5 in var_3._id_B97F )
            {
                if ( var_5._id_E744 == 3 )
                {
                    var_0[var_0.size] = var_5;

                    if ( !isdefined( var_5._id_2408 ) || !var_5 _id_B973() )
                    {
                        var_1 = 0;
                        break;
                    }
                }
            }

            if ( !var_1 )
                break;
        }

        if ( var_1 )
        {
            foreach ( var_9 in var_0 )
                var_9 _id_B97B();

            return;
        }

        wait 2;
    }
}

_id_B970()
{
    self endon( "state_change" );
    wait 5;

    if ( !_id_B973() && isdefined( level._id_03E1._id_6016 ) && isdefined( level._id_03E1._id_6016["call_backup"] ) )
        self thread [[ level._id_03E1._id_6016["call_backup"] ]]();

    if ( isdefined( level._id_03E1._id_2C35 ) )
        return;

    self._id_2408 = 1;
    level thread _id_7213();
}

_id_B973()
{
    var_0 = 10000;
    var_1 = 15000;
    var_2 = 50625;
    var_3 = gettime();
    var_4 = undefined;

    foreach ( var_6 in self._id_9D9E )
    {
        if ( isdefined( var_6._id_03E1._id_6016 ) && isdefined( var_6._id_03E1._id_6016["has_lost_enemy"] ) )
            return var_6 [[ var_6._id_03E1._id_6016["has_lost_enemy"] ]]();

        var_7 = var_6._id_017D;

        if ( isdefined( var_7 ) && _func_011C( var_7 ) && isalive( var_7 ) )
        {
            if ( var_7.team != "allies" )
                return 0;

            var_8 = var_6 _meth_8204( var_7 );

            if ( var_3 < var_8 + var_0 )
                return 0;

            var_9 = var_6 _meth_8203( var_7 );

            if ( var_8 > 0 && distancesquared( var_7.origin, var_9 ) < var_2 )
                return 0;

            if ( var_3 < var_8 + var_1 && var_7 _meth_8618( var_9 ) )
                return 0;

            if ( isdefined( self._id_24A4 ) )
                return 0;

            continue;
        }

        if ( !isdefined( var_6._id_017D ) && var_6 scripts\engine\utility::_id_5452( "in_the_dark" ) && var_6 scripts\engine\utility::_id_544E( "in_the_dark" ) && var_3 - var_6._id_8FB6 < var_0 )
            return 0;
    }

    return 1;
}

_id_B978( var_0, var_1, var_2 )
{
    if ( !var_2 )
        var_2 = 0;

    var_3 = var_1 * var_1;

    foreach ( var_5 in self._id_9D9E )
    {
        if ( distancesquared( var_0.origin, var_5.origin ) > var_3 )
            continue;

        if ( var_2 && !var_0 _meth_8618( var_5 ) )
            continue;

        return 1;
    }

    return 0;
}

_id_B96F()
{
    self endon( "state_change" );
    var_0 = 1;
    var_1 = 384;
    wait( var_0 );

    for (;;)
    {
        foreach ( var_3 in level._id_03E1._id_7208._id_7212 )
        {
            foreach ( var_5 in var_3._id_9D9E )
            {
                if ( var_5._id_03E1._id_2C30 == 3 || var_5._id_03E1._id_2C30 == 2 )
                    continue;

                if ( _id_B978( var_5, var_1, 1 ) )
                    var_5 _meth_8522( "combat", var_5, var_5.origin );
            }
        }

        wait( var_0 );
    }
}

_id_B97B()
{
    var_0 = self._id_9D9E;

    foreach ( var_2 in var_0 )
    {
        var_3 = 1;

        if ( isdefined( var_2._id_03E1._id_6016 ) && isdefined( var_2._id_03E1._id_6016["should_hunt"] ) )
            var_3 = var_2 [[ var_2._id_03E1._id_6016["should_hunt"] ]]();

        if ( !var_3 )
        {
            var_2 _id_0883::_id_2C3E( "idle", undefined );
            continue;
        }

        var_2 _id_0883::_id_2C3E( "hunt", undefined );
    }
}

_id_B97C()
{
    foreach ( var_1 in self._id_9D9E )
        var_1 _meth_8522( "reset", var_1, var_1.origin );
}

_id_B979( var_0 )
{
    var_1 = _id_6A61( var_0._id_CE61 );
    var_2 = _id_71EB( var_1, var_0 );

    if ( !isdefined( var_2 ) )
        return 0;

    return var_2._id_9D9E[0] == var_0;
}

_id_B972( var_0 )
{
    var_1 = undefined;
    var_2 = 99999999;

    foreach ( var_4 in self._id_9D9E )
    {
        var_5 = distancesquared( var_4.origin, var_0 );

        if ( !isdefined( var_1 ) || var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_B971()
{
    self notify( "state_change" );
    var_0 = self._id_AE48;
    var_1 = var_0._id_B97F.size;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        if ( var_0._id_B97F[var_2] == self )
        {
            var_3 = var_0._id_B97F.size - 1;
            var_0._id_B97F[var_2] = var_0._id_B97F[var_3];
            var_0._id_B97F[var_3] = undefined;
            break;
        }
    }
}
