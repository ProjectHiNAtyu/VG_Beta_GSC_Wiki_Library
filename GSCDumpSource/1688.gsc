// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_F3D1( var_0 )
{
    self endon( "asm_terminated" );
    _id_D569();
    self._id_1C08._id_F3EE = var_0;
    var_1 = _id_0009::_id_1C46( "knobs", _id_0009::_id_1C55( "knobs", "aim_2" ) );
    var_2 = _id_0009::_id_1C46( "knobs", _id_0009::_id_1C55( "knobs", "aim_4" ) );
    var_3 = _id_0009::_id_1C46( "knobs", _id_0009::_id_1C55( "knobs", "aim_6" ) );
    var_4 = _id_0009::_id_1C46( "knobs", _id_0009::_id_1C55( "knobs", "aim_8" ) );
    _id_F412( var_1, var_2, var_3, var_4 );
    _id_F418( var_0 );
}

_id_F412( var_0, var_1, var_2, var_3 )
{
    self._id_0DB6._id_132F = 1.0;
    self._id_0DB6._id_1331 = 1.0;
    self._id_0DB6._id_1330 = 1.0;
    self._id_0DB6._id_1333 = 0;
    self._id_0DB6._id_1332 = 0;
    var_4 = spawnstruct();
    var_4._id_1303 = var_0;
    var_4._id_1305 = var_1;
    var_4._id_1308 = var_2;
    var_4._id_130A = var_3;
    self._id_1C08._id_F3D1 = var_4;
}

_id_DFA9()
{
    self endon( "stop_sniper" );
    self waittill( "death" );

    if ( isdefined( self._id_DF7B ) )
    {
        self._id_DF7B delete();
        self._id_DF7B = undefined;
    }
}

_id_DFB2()
{
    if ( isdefined( self._id_DF7B ) )
    {
        self notify( "stop_sniper" );
        self._id_DF7B [[ self._id_5D7F ]]();
        self._id_DF7B delete();
        self._id_DF7B = undefined;
        self._id_24CF = undefined;
        self [[ self._id_5D9D ]]( "none" );
    }
}

_id_DC01()
{
    var_0 = getweaponbasename( self._id_04CE );

    switch ( var_0 )
    {
        case "iw7_m8":
            return 1;
        default:
            break;
    }

    return 0;
}

_id_6AD6()
{
    if ( !isdefined( self._id_24CF ) )
    {
        if ( _id_DC01() )
        {
            var_0 = self gettagorigin( "tag_laser", 1 );

            if ( isdefined( var_0 ) )
            {
                self._id_24CF = 1;
                return var_0;
            }
        }

        self._id_24CF = 0;
    }
    else if ( istrue( self._id_24CF ) )
    {
        if ( !_id_DC01() )
            self._id_24CF = 0;
    }

    if ( self._id_24CF )
        return self gettagorigin( "tag_laser" );

    return self _meth_815C();
}

_id_6AD5()
{
    return self _meth_8560();
}

_id_6AD4()
{
    return self _meth_815B();
}

_id_DFB1()
{
    if ( isdefined( self._id_DF7B ) )
        return;

    thread _id_DFA9();
    var_0 = _id_6AD6();
    self._id_DF7B = spawn( "script_model", var_0 );
    self._id_DF7B setmodel( "tag_laser" );
    self._id_DF7B _meth_8590( self._id_04CE );
    self._id_DF7B setotherent( self );
    self._id_DF7B.origin = var_0;
    self [[ self._id_5D9D ]]( "interpolate" );
    self._id_DF7B [[ self._id_5D80 ]]();

    while ( isalive( self ) && isdefined( self._id_DF7B ) )
    {
        if ( isdefined( self._id_3C4E._id_1313 ) )
        {
            var_0 = _id_6AD6();
            self._id_DF7B.origin = var_0;
            var_1 = self._id_3C4E._id_1313;
            var_2 = vectornormalize( var_1 - var_0 );
            var_3 = _id_6AD5();
            var_2 = vectornormalize( ( var_2[0], var_2[1], 0 ) );
            var_3 = vectornormalize( ( var_3[0], var_3[1], 0 ) );
            var_4 = vectordot( var_2, var_3 );

            if ( var_4 < 0.996 )
                self._id_DF7B.angles = _id_6AD4();
            else
                self._id_DF7B.angles = vectortoangles( self._id_3C4E._id_1313 - self._id_DF7B.origin );
        }

        waitframe();
    }
}

_id_F437()
{
    _id_DFB2();
}

_id_F438()
{
    if ( !isdefined( self._id_DF7B ) )
        thread _id_DFB1();
}

_id_390A()
{
    self._id_3C4E = undefined;
}

_id_C5FF( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_3C4E ) )
        self._id_3C4E = spawnstruct();

    self._id_3C4E._id_DF67 = undefined;
    self._id_3C4E.target = self._id_0B3E._id_039D;
    self._id_3C4E._id_3C4A = 96;

    if ( var_0 )
        self._id_3C4E._id_3C4D = 1500;
    else if ( istrue( var_2 ) )
        self._id_3C4E._id_3C4D = 1500;
    else
        self._id_3C4E._id_3C4D = 2000;

    self [[ self._id_5D9D ]]( "interpolate" );
    var_3 = _id_06AE::_id_673B( level._id_60C7 );
    var_4 = level._id_4969["sniper_converge_scale"][var_3];

    if ( isdefined( var_4 ) )
        self._id_3C4E._id_3C4D = self._id_3C4E._id_3C4D * var_4;

    if ( isdefined( level._id_DF53 ) )
        self._id_3C4E._id_3C4D = self._id_3C4E._id_3C4D * level._id_DF53;

    self._id_3C4E._id_3C49 = 12;
    self._id_010A = 750;
    self._id_010B = -1;

    if ( !isdefined( self._id_DF7B ) )
        self._id_0109 = -1500;
    else
        self._id_0109 = 0;

    self._id_010C = int( self._id_3C4E._id_3C4D + 1000 );
    self._id_3C4E._id_3C48 = self._id_010C + 500;

    if ( isdefined( self._id_0B3E._id_03A1 ) )
    {
        var_5 = undefined;
        var_6 = undefined;

        if ( isdefined( var_1 ) )
            var_5 = var_1;
        else
        {
            if ( isdefined( self._id_0B3E._id_039D ) )
            {
                var_7 = self._id_0B3E._id_039D.origin;

                if ( isplayer( self._id_0B3E._id_039D ) )
                {
                    var_6 = self._id_0B3E._id_039D getvelocity();

                    if ( var_6 == ( 0, 0, 0 ) )
                        var_6 = undefined;
                }
            }
            else
                var_7 = self._id_0B3E._id_03A1 - ( 0, 0, 70 );

            var_8 = var_7 - self.origin;
            var_8 = ( var_8[0], var_8[1], 0 );
            var_9 = vectornormalize( var_8 );

            if ( istrue( var_2 ) )
            {
                var_5 = var_7;
                var_5 = var_5 + ( 0, 0, randomfloatrange( 12, 36 ) );
            }
            else
                var_5 = var_7 - var_9 * randomfloatrange( 120, 180 );

            var_10 = _func_0256( var_9, ( 0, 0, 1 ) );
            var_11 = randomfloatrange( 6, 36 );

            if ( istrue( var_2 ) )
                var_11 = randomfloatrange( 12, 24 );

            if ( isdefined( var_6 ) )
            {
                var_12 = vectordot( var_6, var_10 );

                if ( var_12 < 0 )
                    var_5 = var_5 + var_10 * var_11;
                else
                    var_5 = var_5 - var_10 * var_11;
            }
            else if ( randomintrange( 0, 2 ) )
                var_5 = var_5 + var_10 * var_11;
            else
                var_5 = var_5 - var_10 * var_11;
        }

        self._id_3C4E._id_3C4B = vectornormalize( var_5 - self._id_0B3E._id_03A1 );
        self._id_3C4E._id_3C4A = distance( var_5, self._id_0B3E._id_03A1 );
    }
}

_id_2E8E()
{
    if ( self._id_010B >= 0 && gettime() - self._id_010B >= 100 )
    {
        var_0 = gettime() - self._id_010B;

        if ( isdefined( self._id_0B3E._id_039D ) && isplayer( self._id_0B3E._id_039D ) )
            self [[ self._id_5D9D ]]( "lock" );
        else
            self [[ self._id_5D9D ]]( "interpolate" );

        return self._id_0B3E._id_03A1 - ( 0, 0, 1.3 );
    }

    var_1 = vectornormalize( self._id_0B3E._id_03A1 - self.origin );
    var_2 = vectortoangles( var_1 );

    if ( self._id_0109 < 0 )
    {
        self [[ self._id_5D9D ]]( "interpolate" );
        var_3 = self._id_0B3E._id_03A1 + self._id_3C4E._id_3C4B * self._id_3C4E._id_3C4A;
        return var_3;
    }

    var_4 = ( self._id_3C4E._id_3C4D - self._id_0109 ) / self._id_3C4E._id_3C4D;

    if ( self._id_0109 >= self._id_3C4E._id_3C4D )
        var_4 = 0.0;

    var_5 = var_4 * ( self._id_3C4E._id_3C4A - self._id_3C4E._id_3C49 ) + self._id_3C4E._id_3C49;
    var_3 = self._id_0B3E._id_03A1 + self._id_3C4E._id_3C4B * var_5;

    if ( isdefined( self._id_0B3E._id_039D ) && isplayer( self._id_0B3E._id_039D ) )
        self [[ self._id_5D9D ]]( "interpolate" );

    return var_3;
}

_id_AB8B()
{
    self notify( "sniper_weapon_fired" );

    if ( isdefined( self._id_3C4E ) && isdefined( self._id_DF7B ) )
        self._id_3C4E._id_DF67 = 1;
}

_id_AB8A()
{
    if ( isdefined( self._id_DF7B ) )
    {
        self._id_DF7B [[ self._id_5D7F ]]();
        thread _id_F813( 0.5 );
    }
}

_id_F813( var_0 )
{
    self endon( "death" );
    wait( var_0 );

    if ( isdefined( self._id_DF7B ) )
        self._id_DF7B [[ self._id_5D80 ]]();
}

_id_3C4F()
{
    var_0 = 1;
    var_1 = 0;

    if ( isdefined( self._id_0B3E._id_039D ) )
    {
        var_0 = self _meth_8066( self._id_0B3E._id_039D );

        if ( isdefined( self._id_3C4E ) && isdefined( self._id_3C4E.target ) && self._id_3C4E.target != self._id_0B3E._id_039D )
            var_1 = 1;

        if ( var_0 )
            _id_0694::_id_23F1( self._id_0B3E._id_039D _meth_8176() );
    }

    if ( !isdefined( self._id_3C4E ) || var_1 )
        _id_C5FF( var_1 );
    else if ( var_0 && !istrue( self._id_3C4E._id_24D0 ) )
    {
        if ( isdefined( self._id_3C4E._id_1313 ) && distancesquared( self._id_3C4E._id_1313, self._id_0B3E._id_03A1 ) < 3600 )
            _id_C5FF( var_1, undefined, 1 );
        else
            _id_C5FF( var_1 );
    }
    else if ( istrue( self._id_3C4E._id_DF67 ) )
    {
        self [[ self._id_5D9D ]]( "interpolate" );
        self._id_3C4E._id_DF67 = undefined;

        if ( isdefined( self._id_0B3E._id_039D ) && isplayer( self._id_0B3E._id_039D ) && self _meth_8066( self._id_0B3E._id_039D ) )
            _id_C5FF( var_1, undefined, 1 );
    }

    self._id_3C4E._id_24D0 = var_0;
    var_2 = 1;
    var_3 = _id_6AD6();
    var_4 = _id_2E8E();
    var_5 = vectornormalize( var_4 - var_3 );
    var_6 = self _meth_8560();

    if ( self._id_0109 < 0 )
    {
        if ( !_id_8720() )
            return 0;

        self._id_0109 = self._id_0109 + 50;
        var_7 = vectordot( var_5, var_6 );

        if ( var_7 < 0.984 )
            return 0;

        var_5 = vectornormalize( ( var_5[0], var_5[1], 0 ) );
        var_6 = vectornormalize( ( var_6[0], var_6[1], 0 ) );
        var_8 = vectordot( var_5, var_6 );

        if ( var_8 < 0.996 )
            return 0;

        self._id_0109 = 0;
    }
    else
    {
        self._id_0109 = self._id_0109 + 50;
        var_7 = vectordot( var_5, var_6 );

        if ( var_7 < 0.984 )
            var_2 = 0;

        var_5 = vectornormalize( ( var_5[0], var_5[1], 0 ) );
        var_6 = vectornormalize( ( var_6[0], var_6[1], 0 ) );
        var_8 = vectordot( var_5, var_6 );

        if ( var_8 < 0.996 )
            var_2 = 0;
    }

    if ( self._id_0109 >= self._id_3C4E._id_3C4D )
    {
        if ( isdefined( self._id_0B3E._id_039D ) )
        {
            if ( self._id_010B < 0 )
            {
                if ( var_0 )
                    self._id_010B = gettime();
            }
            else if ( gettime() >= self._id_010B + 200 )
            {
                if ( !var_0 )
                    self._id_010B = -1;
            }
        }
    }

    return var_2;
}

_id_DB15()
{
    var_0 = self _meth_8649();

    if ( istrue( self._id_4CDC ) || isdefined( self._id_B98A ) )
        return 1;

    if ( isdefined( self._id_014A ) )
    {
        if ( self._id_014A == "alert" )
            return 1;

        if ( self._id_014A == "patrol" && isdefined( self._id_1C08._id_5C88 ) && self._id_1C08._id_5C88 && isdefined( self._id_3E0F ) )
            return 1;
    }

    return 0;
}

_id_6D0A( var_0 )
{
    var_1 = spawnstruct();

    if ( istrue( self._id_5EAF ) )
    {
        if ( isdefined( self._id_03AA ) )
            var_1._id_DA2D = self._id_03AA;
        else if ( isdefined( self._id_0B3E._id_039D ) && istrue( self._id_0B3E._id_039C ) )
            var_1._id_DA2D = self._id_0B3E._id_039D _meth_8176();
        else if ( isdefined( self._id_0B3E._id_03A1 ) )
            var_1._id_DA2D = self._id_0B3E._id_03A1;

        var_1._id_24BB = 1;
        return var_1;
    }

    if ( istrue( self._id_00D2 ) )
    {
        if ( isdefined( self._id_32FD ) )
        {
            var_1._id_DA2D = self._id_32FD;
            var_1._id_24BB = 1;
            return var_1;
        }

        return undefined;
    }

    if ( _id_DB15() )
    {
        var_2 = _id_F41B( var_0 );

        if ( isdefined( var_2._id_DA2D ) )
            return var_2;
    }

    if ( !_id_0694::_id_23E8() )
    {
        if ( isdefined( self._id_1317 ) )
        {
            var_1._id_DA2D = self._id_1317.origin;
            var_1._id_24BB = 1;
            return var_1;
        }
        else
            return undefined;
    }
    else if ( isdefined( self._id_0B3E._id_039D ) && istrue( self._id_0B3E._id_039C ) )
        var_1._id_DA2D = self._id_0B3E._id_039D _meth_8176();
    else if ( isdefined( self._id_0B3E._id_03A1 ) )
        var_1._id_DA2D = self._id_0B3E._id_03A1;

    if ( isdefined( var_1._id_DA2D ) )
    {
        if ( istrue( self._id_0B3E._id_DA2C ) )
            var_1._id_24BB = 1;

        return var_1;
    }

    return undefined;
}

_id_8A28()
{
    if ( !isdefined( self._id_3C4E ) )
        return 0;

    return 1;
}

_id_8A29()
{
    if ( isdefined( self._id_DF7B ) )
        return 1;

    return 0;
}

_id_8720()
{
    if ( !isdefined( self._id_1C08._id_132C ) )
        return 0;

    var_0 = 100.0;
    var_0 = var_0 * 2;
    var_1 = gettime();

    if ( self._id_1C08._id_132C + var_0 < var_1 )
        return 1;

    return 0;
}

_id_30EC()
{
    var_0 = self _meth_8649();

    if ( istrue( self._id_CA51 ) )
        return 0;

    if ( self._id_03D8 != "none" )
        return 1;

    var_1 = _id_08C8::_id_68DB();

    if ( _func_039F( var_1, "fast" ) && _func_039F( var_1, "jog" ) && var_0 < _func_03A3( var_1, "fast", "jog", 0.4 ) )
        return 1;

    if ( var_1 == "juggernaut" || var_1 == "juggernaut_cp" || var_1 == "juggernaut_lw" )
        return var_0 < 60;

    if ( istrue( self._id_035A ) )
        return 1;

    return 0;
}

_id_F418( var_0 )
{
    self endon( "death" );
    self._id_1C08._id_BC5F = 0;
    self._id_1C08._id_BC47 = 0;
    var_1 = ( 0, 0, 0 );
    var_2 = 1;
    var_3 = 0;
    var_4 = 0;
    var_5 = 10;

    for (;;)
    {
        _id_7D95();
        var_6 = _id_0009::_id_1C1B( self._id_1C08._id_F3EE, "aim" );

        if ( isdefined( self._id_0303 ) && distance2dsquared( self._id_0303, self.origin ) > 16 && !_id_30EC() )
            var_6 = 0;

        var_7 = 0;

        if ( !var_6 && _id_0009::_id_1C1B( self._id_1C08._id_F3EE, "notetrackAim" ) )
            var_6 = _id_0009::_id_1C28( self._id_1C08._id_F3EE, "start_aim" );

        if ( !var_6 || !istrue( self._id_0B3E._id_03A7 ) )
        {
            if ( !var_6 && isdefined( self._id_3C4E ) )
                _id_390A();

            _id_F437();
            self._id_1C08._id_132C = undefined;
        }
        else if ( !isdefined( self._id_1C08._id_132C ) )
            self._id_1C08._id_132C = gettime();

        var_1 = ( 0, 0, 0 );
        var_8 = undefined;
        var_9 = undefined;

        if ( var_6 )
        {
            var_9 = self _meth_8849();
            var_8 = _id_6D0A( var_9 );
            var_10 = undefined;

            if ( isdefined( var_8 ) )
            {
                var_10 = var_8._id_DA2D;
                var_7 = istrue( var_8._id_2D99 );
            }

            if ( isdefined( self._id_132B ) )
                self _meth_8007( self._id_132B );
            else if ( var_7 || !isdefined( var_10 ) )
                self _meth_8007( 6 );
            else if ( !isdefined( var_10 ) )
                self _meth_8007( 3 );
            else
                self _meth_8007( 1 );

            var_11 = self _meth_8182();
            var_12 = isdefined( var_11 );

            if ( var_12 )
            {
                var_13 = var_11 _meth_8547();
                var_14 = anglestoforward( self.angles );
                var_15 = rotatevector( var_14, var_13 );
                var_10 = var_9 + var_15 * 512.0;
            }
            else if ( _id_0694::_id_23E8() && isdefined( self._id_0B3E._id_03A1 ) )
            {
                if ( istrue( self._id_0B3E._id_039A ) )
                {
                    var_16 = _id_3C4F();
                    var_10 = _id_2E8E();
                    self._id_3C4E._id_1313 = var_10;

                    if ( var_16 )
                        _id_F438();
                    else
                        _id_F437();
                }
                else
                    _id_F437();
            }
            else
                _id_F437();

            var_17 = isdefined( var_10 );
            var_18 = ( 0, 0, 0 );

            if ( var_17 )
                var_18 = var_10;

            var_21 = 0;
            var_22 = isdefined( self._id_E837 );

            if ( var_22 )
                var_21 = self._id_E837;

            var_23 = 0;
            var_24 = 0;
            var_25 = _id_0694::_id_2394();

            if ( isdefined( var_25 ) && _id_0694::_id_239D() == "exposed" )
            {
                var_26 = _id_0694::_id_239B();

                if ( isdefined( var_26 ) )
                {
                    var_27 = _id_08C8::_id_68DB();
                    var_23 = _id_08C8::_id_6B7A( var_27, var_25, var_26 );
                    var_24 = _id_08C8::_id_6B79( var_27, var_25, var_26 );
                }
            }
            else if ( istrue( self._id_1326 ) )
            {
                var_27 = _id_08C8::_id_68DB();
                var_24 = anim._id_A557[var_27]["Aim Down"];
            }
            else if ( self._id_1C08._id_1A0D == "boss" || self._id_1C08._id_1A0D == "boss2" )
            {
                var_23 = -12;
                var_28 = 10;
            }

            var_29 = ( var_24, var_23, 0 );
            var_30 = self _meth_8107();

            if ( self _meth_8657() || isdefined( var_8 ) && isdefined( var_8._id_24BB ) && var_8._id_24BB )
                var_1 = self _meth_85E2( var_9, var_18, var_17, var_29, var_21, var_22, 1 );
            else
                var_1 = self _meth_85E2( ( 0, 0, 0 ) );

            if ( _func_000C( var_30, var_1 ) > 12 )
                self._id_0081 = 0;
        }
        else if ( abs( self._id_1C08._id_BC5F ) < 5 && abs( self._id_1C08._id_BC47 ) < 5 )
        {
            self _meth_85E2( ( 0, 0, 0 ) );
            self _meth_8007( 3 );
            self._id_0081 = 0;
            waitframe();
            continue;
        }

        if ( self _meth_8643( self._id_1C08._id_F3EE ) )
        {
            if ( isdefined( var_8 ) && isdefined( var_8._id_DA2D ) )
            {
                if ( istrue( self._id_4CDC ) )
                {
                    var_34 = self _meth_8560();
                    var_35 = vectornormalize( var_8._id_DA2D - var_9 );
                    var_36 = vectordot( var_34, var_35 );

                    if ( var_36 >= 0.966 )
                    {
                        self._id_0DB6._id_8EE9 = 1;
                        scripts\anim\shared::_id_FC9C();
                    }
                }
            }

            waitframe();
            continue;
        }

        if ( istrue( self._id_035A ) )
        {
            waitframe();
            continue;
        }

        var_37 = var_1[0];
        var_38 = var_1[1];
        var_1 = undefined;

        if ( var_4 > 0 )
        {
            var_4 = var_4 - 1;
            var_5 = max( 10, var_5 - 5 );
        }
        else if ( self._id_0340 && self._id_0340 != var_3 )
        {
            var_4 = 2;
            var_5 = 30;
        }
        else if ( scripts\anim\utility_common::_id_874C() )
            var_5 = 2;
        else if ( var_7 )
            var_5 = 5;
        else
            var_5 = 10;

        var_39 = 4;
        var_3 = self._id_0340;
        var_40 = self._id_02B6 != "stop" || !var_2;

        if ( var_40 )
        {
            var_41 = var_38 - self._id_1C08._id_BC5F;

            if ( _func_0214( var_41 ) > var_39 )
            {
                var_42 = var_41 * 0.4;
                var_38 = self._id_1C08._id_BC5F + clamp( var_42, -1 * var_5, var_5 );
                var_38 = clamp( var_38, self._id_0350, self._id_0257 );
            }

            var_43 = var_37 - self._id_1C08._id_BC47;

            if ( _func_0214( var_43 ) > var_39 )
            {
                var_44 = var_43 * 0.4;
                var_37 = self._id_1C08._id_BC47 + clamp( var_44, -1 * var_5, var_5 );
                var_37 = clamp( var_37, self._id_0497, self._id_0170 );
            }
        }

        var_2 = 0;
        self._id_1C08._id_BC5F = var_38;
        self._id_1C08._id_BC47 = var_37;

        if ( isdefined( self._id_1C08._id_4CEB ) && self._id_1C08._id_4CEB )
            _id_F41F( var_37, var_38 );
        else
            _id_F41E( var_37, var_38 );

        wait 0.05;
    }
}

_id_F41D()
{
    if ( !isdefined( self._id_1C08._id_BC5F ) )
        return;

    var_0 = clamp( self._id_1C08._id_BC5F, self._id_0350, self._id_0257 );
    var_1 = clamp( self._id_1C08._id_BC47, self._id_0497, self._id_0170 );

    if ( isdefined( self._id_1C08._id_4CEB ) && self._id_1C08._id_4CEB )
        _id_F41F( var_1, var_0 );
    else
        _id_F41E( var_1, var_0 );
}

_id_F41B( var_0 )
{
    var_1 = undefined;
    var_2 = anglestoforward( self.angles );
    var_3 = 0;

    if ( isdefined( self._id_3E0F ) )
    {
        if ( isvector( self._id_3E0F ) )
            var_1 = self._id_3E0F;
        else
            var_1 = self._id_3E0F _meth_8176();

        if ( isdefined( self._id_3E13 ) )
        {
            if ( vectordot( vectornormalize( var_1 - var_0 ), var_2 ) < 0.177 )
                var_1 = undefined;
        }
        else if ( vectordot( vectornormalize( var_1 - var_0 ), var_2 ) < 0.643 )
            var_1 = undefined;
    }

    if ( !isdefined( var_1 ) )
        var_3 = 1;

    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( self._id_3E0E ) && isdefined( self._id_41C3 ) )
        {
            _id_D674( undefined );
            self._id_0DB6._id_8EE9 = 0;
            scripts\anim\shared::_id_FC9C();
        }
        else if ( isdefined( self._id_3E0E ) )
        {
            if ( !scripts\engine\utility::is_equal( self._id_3E0E, self._id_41C3 ) )
            {
                _id_D674( self._id_3E0E );

                if ( !istrue( self._id_41C3._id_88FE ) )
                {
                    var_1 = self._id_41C3.origin;
                    self._id_0DB6._id_8EE9 = 0;
                    scripts\anim\shared::_id_FC9C();
                }
            }
            else if ( !istrue( self._id_41C3._id_88FE ) )
                var_1 = self._id_41C3.origin;
        }
    }

    if ( isdefined( self._id_B98A ) )
        var_1 = _id_B98C();

    if ( !isdefined( var_1 ) && isdefined( self._id_0303 ) && !isdefined( self._id_017D ) && self._id_01A2 )
    {
        var_4 = self _meth_84A5( self._id_97C7 );
        var_5 = var_4 - self.origin;
        var_5 = vectornormalize( ( var_5[0], var_5[1], 0 ) );

        if ( vectordot( var_2, var_5 ) < 0.9994 )
            var_1 = var_4 + ( 0, 0, 54 );
    }

    var_6 = spawnstruct();
    var_6._id_DA2D = var_1;
    var_6._id_2D99 = var_3;
    var_6._id_24BB = 1;
    return var_6;
}

_id_B98C()
{
    if ( isdefined( self._id_B991 ) && gettime() > self._id_B991 )
    {
        self._id_B98B = self._id_B992;
        self._id_B991 = undefined;
        self._id_B992 = undefined;
    }

    var_0 = undefined;

    if ( isdefined( self._id_B98B ) )
        var_0 = _id_08C8::_id_B993( self._id_B98B );

    if ( !istrue( self._id_B98A._id_6FF3 ) )
    {
        if ( isdefined( self._id_B992 ) )
        {
            var_1 = _id_08C8::_id_B993( self._id_B992 );
            self._id_B98A._id_416F = var_1;
            scripts\common\utility::_id_97D9( var_1, 0 );
        }
        else
        {
            self._id_B98A._id_416F = var_0;
            scripts\common\utility::_id_97D9( var_0, 0 );
        }
    }

    return var_0;
}

_id_D674( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        self._id_41C3 = undefined;
        self._id_0B3E._id_01BE = 0;
        self _meth_83EF();
    }
    else
    {
        if ( istrue( var_0._id_88FE ) )
            self _meth_819F( var_0.origin, var_0._id_97D5 );
        else
        {
            self._id_0B3E._id_01BE = istrue( var_0._id_CE19 );
            self._id_0B3E._id_01BF = var_0.origin;
            self _meth_8343( var_0.origin );
        }

        var_1 = gettime();
        self._id_B989 = var_1;
        var_0._id_90A1 = var_1;
        self._id_41C3 = var_0;
    }
}

_id_F41E( var_0, var_1 )
{
    var_2 = undefined;

    if ( isdefined( self._id_1C08._id_F3D1._id_1302 ) )
    {
        var_3 = self._id_1C08._id_F3D1._id_1302;
        var_4 = self._id_1C08._id_F3D1._id_1304;
        var_5 = self._id_1C08._id_F3D1._id_1307;
        var_6 = self._id_1C08._id_F3D1._id_1309;
    }
    else
    {
        var_3 = self._id_1C08._id_F3D1._id_1303;
        var_4 = self._id_1C08._id_F3D1._id_1305;
        var_5 = self._id_1C08._id_F3D1._id_1308;
        var_6 = self._id_1C08._id_F3D1._id_130A;
    }

    if ( isdefined( self._id_1C08._id_F3D1._id_1306 ) )
        var_2 = self._id_1C08._id_F3D1._id_1306;

    var_7 = 0;
    var_8 = 0;
    var_9 = 0;
    var_10 = 0;
    var_11 = 0;

    if ( var_1 < 0 )
    {
        var_10 = var_1 / self._id_0350 * self._id_0DB6._id_132F;
        var_9 = 1;
    }
    else if ( var_1 > 0 )
    {
        var_8 = var_1 / self._id_0257 * self._id_0DB6._id_132F;
        var_9 = 1;
    }

    if ( var_0 < 0 )
    {
        var_11 = var_0 / self._id_0497 * self._id_0DB6._id_132F;
        var_9 = 1;
    }
    else if ( var_0 > 0 )
    {
        var_7 = var_0 / self._id_0170 * self._id_0DB6._id_132F;
        var_9 = 1;
    }

    self _meth_85EC( var_3, var_7, 0.1, 1, 1 );
    self _meth_85EC( var_4, var_8, 0.1, 1, 1 );
    self _meth_85EC( var_5, var_10, 0.1, 1, 1 );
    self _meth_85EC( var_6, var_11, 0.1, 1, 1 );

    if ( isdefined( var_2 ) )
        self _meth_85EC( var_2, var_9, 0.1, 1, 1 );
}

_id_F41F( var_0, var_1 )
{
    var_2 = self._id_1C08._id_F3D1._id_9584;
    var_3 = self._id_1C08._id_F3D1._id_9585;
    var_4 = self._id_1C08._id_F3D1._id_9586;
    var_5 = self._id_1C08._id_F3D1._id_9587;
    var_6 = self._id_1C08._id_F3D1._id_9588;
    var_7 = self._id_1C08._id_F3D1._id_9589;
    var_8 = self._id_1C08._id_F3D1._id_958A;
    var_9 = self._id_1C08._id_F3D1._id_958B;
    var_10 = [ var_6, var_9, var_8, var_7, var_5, var_2, var_3, var_4, var_6 ];
    var_11 = [ -180, -135, -90, -45, 0, 45, 90, 135, 180 ];
    var_12 = [ ( -1, 0, 0 ), ( -0.707, -0.707, 0 ), ( 0, -1, 0 ), ( 0.707, -0.707, 0 ), ( 1, 0, 0 ), ( 0.707, 0.707, 0 ), ( 0, 1, 0 ), ( -0.707, 0.707, 0 ), ( -1, 0, 0 ) ];
    var_13 = [ 80, 91.787, 45, 91.787, 80, 91.787, 45, 91.787, 80 ];
    var_14 = ( var_1, var_0, 0 );
    var_15 = _func_0131( var_14 );
    var_16 = vectornormalize( var_14 );
    var_17 = _func_025C( var_16 );
    var_17 = _func_000B( var_17 );

    for ( var_18 = 0; var_17 > var_11[var_18]; var_18++ )
    {

    }

    if ( var_18 == 0 )
        var_18 = 1;

    var_19 = self._id_1C08._id_F3D1._id_958C;

    for ( var_20 = 0; var_20 < var_10.size; var_20++ )
    {
        if ( var_20 == var_18 || var_20 == var_18 - 1 )
        {
            var_21 = clamp( var_15 / var_13[var_20], 0.0, 1.0 );
            var_22 = _func_0002( vectordot( var_12[var_20], var_16 ) );
            var_23 = clamp( 1 - var_22 / var_13[var_20], 0.0, 1.0 );
            var_24 = _id_0009::_id_1C46( var_19, var_10[var_20] );
            var_25 = self _meth_85F5( var_24 );

            if ( var_25 > 0 )
            {
                var_26 = _func_0079( var_24 );
                var_27 = ( var_21 - var_25 ) * var_26 / 0.05;
                self _meth_85EC( var_24, var_23, 0.05, var_27 );
            }
            else
            {
                self _meth_85EC( var_24, var_23, 0.05, 0.0 );
                self _meth_85F1( var_24, var_21 );
            }

            continue;
        }

        if ( var_10[var_20] != var_10[var_18] && var_10[var_20] != var_10[var_18 - 1] )
            self _meth_85ED( _id_0009::_id_1C46( var_19, var_10[var_20] ), 0.05 );
    }
}

_id_D468( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 <= 0 )
    {
        self._id_0DB6._id_132F = var_0;
        self._id_0DB6._id_1331 = var_0;
        self._id_0DB6._id_1330 = var_0;
        self._id_0DB6._id_1333 = 0;
    }
    else
    {
        if ( !isdefined( self._id_0DB6._id_132F ) )
            self._id_0DB6._id_132F = 0;

        self._id_0DB6._id_1331 = self._id_0DB6._id_132F;
        self._id_0DB6._id_1330 = var_0;
        self._id_0DB6._id_1333 = int( var_1 * 20 );
    }

    self._id_0DB6._id_1332 = 0;
}

_id_7D95()
{
    if ( self._id_0DB6._id_1332 < self._id_0DB6._id_1333 )
    {
        self._id_0DB6._id_1332++;
        var_0 = 1.0 * self._id_0DB6._id_1332 / self._id_0DB6._id_1333;
        self._id_0DB6._id_132F = self._id_0DB6._id_1331 * ( 1 - var_0 ) + self._id_0DB6._id_1330 * var_0;
    }
}

_id_1322()
{
    if ( _id_0694::_id_23E6() )
    {
        self._id_0081 = 1;
        return 1;
    }

    if ( istrue( self._id_035A ) && istrue( self._id_CA51 ) )
    {
        self._id_0081 = 0;
        return 0;
    }

    if ( istrue( self._id_00D2 ) && !istrue( self._id_0254 ) )
    {
        self._id_0081 = 1;
        return 1;
    }

    if ( istrue( self._id_0B3E._id_039A ) )
    {
        if ( !isdefined( self._id_3C4E ) )
        {
            self._id_0081 = 0;
            return 0;
        }

        if ( self._id_010B >= 0 )
        {
            var_0 = gettime() - self._id_010B;

            if ( var_0 >= self._id_010A )
            {
                self._id_0081 = 1;
                return 1;
            }
        }
        else if ( self._id_0109 >= self._id_010C )
        {
            self._id_0081 = 1;
            return 1;
        }

        self._id_0081 = 0;
        return 0;
    }

    if ( !self _meth_81C6() )
    {
        var_1 = !_id_0009::_id_1C1B( self._id_1C08._id_F3EE, "aim" );

        if ( !var_1 && _id_0009::_id_1C1B( self._id_1C08._id_F3EE, "notetrackAim" ) )
            var_1 = !_id_0009::_id_1C28( self._id_1C08._id_F3EE, "start_aim" );

        if ( !var_1 )
            var_1 = isdefined( self._id_0303 ) && distance2dsquared( self._id_0303, self.origin ) > 16 && !_id_30EC();

        if ( var_1 )
        {
            self._id_0081 = 0;
            return 0;
        }
    }

    var_2 = self _meth_8849();
    var_3 = _id_6D0A( var_2 );

    if ( !isdefined( var_3 ) )
    {
        self._id_0081 = 0;
        return 0;
    }

    var_4 = var_3._id_DA2D;
    var_5 = self _meth_8182();

    if ( scripts\engine\utility::_id_0F4F() )
    {
        var_6 = self _meth_8560();
        var_7 = _func_01C3( var_6, self.angles );
        var_8 = vectortoangles( var_7 );
        var_9 = var_4 - var_2;
        var_10 = _func_01C3( var_9, self.angles );
        var_11 = vectortoangles( var_10 );
    }
    else if ( isdefined( var_5 ) )
    {
        self._id_0081 = 0;
        var_12 = _id_08C8::_id_F884();

        if ( _id_08C8::_id_F886( var_12, 1 ) )
            self._id_0081 = 1;
        else if ( isdefined( var_5 _meth_8184( 1 ) ) )
            self._id_0081 = 1;

        return self._id_0081;
    }
    else if ( istrue( self._id_035A ) )
    {
        var_11 = vectortoangles( var_4 - var_2 );
        var_8 = self _meth_815B();
    }
    else
    {
        var_11 = vectortoangles( var_4 - var_2 );

        if ( _func_0438( var_11[1] - self.angles[1] ) > 100 || _func_0438( var_11[0] - self.angles[0] ) > 100 )
            return 0;

        if ( scripts\common\utility::_id_87BA() && self._id_0492 == "zombie" )
            var_8 = self gettagangles( "j_gun" );
        else
            var_8 = self _meth_815B();
    }

    var_13 = anim._id_1336;
    var_14 = anim._id_1335;
    var_15 = anim._id_1329;
    var_16 = _func_0438( var_8[1] - var_11[1] );

    if ( var_16 > var_13 )
    {
        if ( var_16 > var_14 )
        {
            self._id_0081 = 0;
            return 0;
        }

        var_17 = distancesquared( self _meth_86A7(), var_4 );

        if ( var_17 > anim._id_1334 )
        {
            self._id_0081 = 0;
            return 0;
        }
    }

    var_18 = _func_0438( var_8[0] - var_11[0] );

    if ( var_18 > var_15 )
    {
        self._id_0081 = 0;
        return 0;
    }

    self._id_0081 = 1;
    return 1;
}

_id_D569()
{
    anim._id_3DB3 = 55;
    anim._id_1336 = 10;
    anim._id_1334 = 4096;
    anim._id_1335 = 45;
    anim._id_1329 = 20;
    anim._id_ADEB = 25;
    anim._id_ADE9 = anim._id_1334;
    anim._id_ADEA = anim._id_1335;
    anim._id_ADDB = 30;
    anim._id_9C3F = 65;
    anim._id_9C3E = 65;
}
