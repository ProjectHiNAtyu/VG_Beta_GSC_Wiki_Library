// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_D78A();
    _id_D75A();
    thread _id_A0AB();
}

_id_D78A()
{
    level._id_2777["gametype_think"] = ::_id_26E1;
}

_id_D75A()
{
    _id_09D1::_id_28F5( 1 );
    level._id_BDB1 = 600;
    level._id_25B8 = 400;
    thread _id_26E0();
    level._id_278A = 1;
}

_id_2792()
{
    foreach ( var_1 in level._id_218A )
    {
        if ( isdefined( var_1._id_32AF ) )
            continue;

        if ( istrue( var_1._id_7D50 ) )
            continue;

        if ( istrue( var_1._id_89E5 ) )
            continue;

        return var_1;
    }

    return undefined;
}

_id_2793()
{
    foreach ( var_1 in level._id_218A )
    {
        if ( isdefined( var_1._id_32AF ) )
            return var_1._id_32AF;
    }

    return undefined;
}

_id_2751()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self _meth_805A( "stand" );

    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        self _meth_804D( "jump" );
        waitframe();
    }

    waitframe();
    waitframe();

    for ( var_0 = 0; var_0 < 60; var_0++ )
    {
        self _meth_804D( "jump" );
        waitframe();

        if ( !isdefined( self._id_32C6 ) )
            break;
    }
}

_id_28DF()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        self _meth_804D( "attack" );
        waitframe();
    }
}

_id_2796()
{
    if ( self.team == "allies" )
        return "axis";

    return "allies";
}

_id_26E1()
{
    self notify( "bot_ball_think" );
    self endon( "bot_ball_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_278A ) )
        wait 0.05;

    self _meth_8053( "separation", 0 );
    var_0 = undefined;
    var_1 = undefined;

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( self._id_C8B8 ) )
        {
            _id_81AF();
            var_0 = undefined;
        }

        if ( _id_09D0::_id_27C7() )
        {
            var_0 = undefined;
            continue;
        }

        if ( self._id_C8B8 != "carrier" && isdefined( self._id_32C6 ) )
        {
            var_0 = undefined;
            _id_212B( "carrier" );
        }

        if ( self._id_C8B8 == "carrier" )
        {
            if ( isdefined( self._id_32C6 ) )
            {
                self _meth_8053( "disable_attack", 1 );
                var_2 = 0;

                if ( isdefined( self._id_017D ) )
                    var_2 = distancesquared( self._id_017D.origin, self.origin );

                if ( isdefined( self._id_017D ) && var_2 < 9216 )
                {
                    self _meth_8053( "disable_attack", 0 );
                    self _meth_8053( "prefer_melee", 1 );
                }
                else
                {
                    self _meth_8053( "prefer_melee", 0 );
                    self _meth_8053( "disable_attack", 1 );
                }

                if ( isdefined( level._id_2106 ) )
                {
                    var_3 = level._id_2106[_id_2796()].origin;

                    if ( !isdefined( var_0 ) )
                    {
                        var_0 = _func_02A6( var_3, self );

                        if ( distance2dsquared( var_0, var_3 ) > 256 )
                        {
                            var_4 = ( var_3[0], var_3[1], var_3[2] - 90 );
                            var_0 = _func_02A6( var_4, self );
                        }
                    }

                    self _meth_8057( var_0, 16, "critical" );
                    var_5 = distance2dsquared( self.origin, var_3 );

                    if ( var_5 < 30625 )
                    {
                        var_6 = self geteye();
                        var_7 = var_3;

                        if ( scripts\engine\trace::ray_trace_passed( var_6, var_7, self ) )
                        {
                            if ( var_5 < 256 )
                            {
                                self _meth_8057( self.origin, 16, "critical" );
                                wait 0.25;
                            }

                            _id_2751();
                            wait 0.2;

                            if ( !isdefined( self._id_32C6 ) )
                                self _meth_802A();
                        }
                    }
                }
                else
                {
                    self _meth_802A();

                    if ( !isdefined( var_1 ) )
                        var_1 = gettime() + randomintrange( 500, 1000 );

                    if ( gettime() > var_1 )
                    {
                        var_1 = gettime() + randomintrange( 500, 1000 );

                        if ( isdefined( self._id_017D ) )
                        {
                            if ( self _meth_8027( self._id_017D ) )
                            {
                                var_8 = anglestoforward( self.angles );
                                var_9 = self._id_017D.origin - self.origin;
                                var_10 = vectornormalize( ( var_9[0], var_9[1], 0 ) );
                                var_11 = vectordot( var_8, var_10 );

                                if ( var_11 > 0.707 )
                                {
                                    if ( var_2 < 57600 && var_2 > 9216 )
                                        _id_28DF();
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                self _meth_8053( "disable_attack", 0 );
                self _meth_8053( "prefer_melee", 0 );
                var_12 = _id_2792();

                if ( !isdefined( var_12 ) )
                {
                    var_13 = _id_2793();

                    if ( isdefined( var_13 ) && var_13 != self )
                        _id_81AF();
                }
                else
                {
                    self _meth_8057( var_12._id_411F, 16, "objective" );
                    continue;
                }
            }
        }
        else
            var_0 = undefined;

        if ( self._id_C8B8 == "attacker" )
        {
            self _meth_8053( "disable_attack", 0 );
            self _meth_8053( "prefer_melee", 0 );
            var_12 = _id_2792();

            if ( !isdefined( var_12 ) )
            {
                var_13 = _id_2793();

                if ( isdefined( var_13 ) )
                {
                    if ( !_id_09D1::_id_27E1( var_13 ) )
                        _id_09D0::_id_27BD( var_13, level._id_25B8 );
                }
            }
            else if ( !istrue( var_12._id_89E5 ) && !istrue( var_12._id_7D50 ) )
            {
                var_14 = _func_02A6( var_12._id_411F );

                if ( !_id_09D1::_id_27E0( var_14 ) )
                    _id_09D0::_id_2873( var_14, level._id_BDB1 );
            }

            continue;
        }

        if ( self._id_C8B8 == "defender" )
        {
            self _meth_8053( "disable_attack", 0 );
            self _meth_8053( "prefer_melee", 0 );
            var_15 = level._id_2106[self.team];
            var_3 = var_15.origin;

            if ( !_id_09D1::_id_27E0( var_3 ) )
                _id_09D0::_id_2873( var_3, level._id_BDB1 );
        }
    }
}

_id_81AF()
{
    var_0 = _id_631F( self.team );
    var_1 = _id_6320( self.team );
    var_2 = _id_20E5( self.team );
    var_3 = _id_20E6( self.team );
    var_4 = level._id_285E[self._id_B010];

    if ( var_4 == "active" )
    {
        if ( var_0.size >= var_2 )
        {
            var_5 = 0;

            foreach ( var_7 in var_0 )
            {
                if ( isai( var_7 ) && level._id_285E[var_7._id_B010] == "stationary" )
                {
                    var_7._id_C8B8 = undefined;
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
            {
                _id_212B( "attacker" );
                return;
            }

            _id_212B( "defender" );
            return;
        }
        else
            _id_212B( "attacker" );
    }
    else if ( var_4 == "stationary" )
    {
        if ( var_1.size >= var_3 )
        {
            var_5 = 0;

            foreach ( var_10 in var_1 )
            {
                if ( isai( var_10 ) && level._id_285E[var_10._id_B010] == "active" )
                {
                    var_10._id_C8B8 = undefined;
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
            {
                _id_212B( "defender" );
                return;
            }

            _id_212B( "attacker" );
            return;
        }
        else
            _id_212B( "defender" );
    }
}

_id_26E0()
{
    level notify( "bot_ball_ai_director_update" );
    level endon( "bot_ball_ai_director_update" );
    level endon( "game_ended" );
    var_0[0] = "allies";
    var_0[1] = "axis";
    var_1 = [];

    for (;;)
    {
        foreach ( var_3 in var_0 )
        {
            var_4 = _id_20E5( var_3 );
            var_5 = _id_20E6( var_3 );
            var_6 = _id_631F( var_3 );
            var_7 = _id_6320( var_3 );

            if ( var_6.size > var_4 )
            {
                var_8 = [];
                var_9 = 0;

                foreach ( var_11 in var_6 )
                {
                    if ( isai( var_11 ) )
                    {
                        if ( level._id_285E[var_11._id_B010] == "stationary" )
                        {
                            var_11 _id_212B( "defender" );
                            var_9 = 1;
                            break;
                        }
                        else
                            var_8 = scripts\engine\utility::array_add( var_8, var_11 );
                    }
                }

                if ( !var_9 && var_8.size > 0 )
                    scripts\engine\utility::random( var_8 ) _id_212B( "defender" );
            }

            if ( var_7.size > var_5 )
            {
                var_13 = [];
                var_14 = 0;

                foreach ( var_16 in var_7 )
                {
                    if ( isai( var_16 ) )
                    {
                        if ( level._id_285E[var_16._id_B010] == "active" )
                        {
                            var_16 _id_212B( "attacker" );
                            var_14 = 1;
                            break;
                        }
                        else
                            var_13 = scripts\engine\utility::array_add( var_13, var_16 );
                    }
                }

                if ( !var_14 && var_13.size > 0 )
                    scripts\engine\utility::random( var_13 ) _id_212B( "attacker" );
            }

            var_18 = _id_2792();

            if ( isdefined( var_18 ) )
            {
                var_19 = _id_B049( var_3, var_18 );

                if ( isdefined( var_19 ) && isdefined( var_19._id_C8B8 ) && var_19._id_C8B8 != "carrier" )
                {
                    if ( !isdefined( var_19._id_32C6 ) )
                    {
                        var_20 = var_1[var_3];

                        if ( isdefined( var_20 ) )
                            var_20 _id_212B( undefined );

                        var_19 _id_212B( "carrier" );
                        var_1[var_19.team] = var_19;
                    }
                }
            }
        }

        wait 1.0;
    }
}

_id_20E5( var_0 )
{
    var_1 = _id_20FC( var_0 );

    if ( !isdefined( level._id_2106 ) )
        return var_1;

    return int( int( var_1 ) / 2 ) + 1 + int( var_1 ) % 2;
}

_id_20E6( var_0 )
{
    if ( !isdefined( level._id_2106 ) )
        return 0;

    var_1 = _id_20FC( var_0 );
    return max( int( int( var_1 ) / 2 ) - 1, 0 );
}

_id_20FC( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_AE69 )
    {
        if ( _id_0A67::_id_8A7B( var_3 ) && isdefined( var_3.team ) && var_3.team == var_0 )
            var_1++;
    }

    return var_1;
}

_id_B049( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in level._id_AE69 )
    {
        if ( !isdefined( var_5.team ) )
            continue;

        if ( var_5.team != var_0 )
            continue;

        if ( !isalive( var_5 ) )
            continue;

        if ( !isai( var_5 ) )
            continue;

        if ( isdefined( var_5._id_C8B8 ) && var_5._id_C8B8 == "defender" )
            continue;

        var_6 = distancesquared( var_5.origin, var_1._id_411F );

        if ( !isdefined( var_3 ) || var_6 < var_3 )
        {
            var_3 = var_6;
            var_2 = var_5;
        }
    }

    if ( isdefined( var_2 ) )
        return var_2;

    return undefined;
}

_id_631F( var_0 )
{
    var_1 = _id_6681( "attacker", var_0 );

    if ( isdefined( level._id_2106 ) )
    {
        foreach ( var_3 in level.players )
        {
            if ( !isai( var_3 ) && isdefined( var_3.team ) && var_3.team == var_0 )
            {
                if ( distancesquared( level._id_2106[var_0].origin, var_3.origin ) > level._id_BDB1 * level._id_BDB1 )
                    var_1 = scripts\engine\utility::array_add( var_1, var_3 );
            }
        }
    }

    return var_1;
}

_id_6320( var_0 )
{
    var_1 = _id_6681( "defender", var_0 );

    if ( isdefined( level._id_2106 ) )
    {
        foreach ( var_3 in level.players )
        {
            if ( !isai( var_3 ) && isdefined( var_3.team ) && var_3.team == var_0 )
            {
                if ( distancesquared( level._id_2106[var_0].origin, var_3.origin ) <= level._id_BDB1 * level._id_BDB1 )
                    var_1 = scripts\engine\utility::array_add( var_1, var_3 );
            }
        }
    }

    return var_1;
}

_id_212B( var_0 )
{
    self._id_C8B8 = var_0;
    self _meth_802A();
    _id_09D0::_id_2740();
}

_id_6681( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level._id_AE69 )
    {
        if ( !isdefined( var_4.team ) )
            continue;

        if ( isalive( var_4 ) && _id_0A67::_id_8A7B( var_4 ) && var_4.team == var_1 && isdefined( var_4._id_C8B8 ) && var_4._id_C8B8 == var_0 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_A0AB()
{
    level endon( "game_ended" );
    var_0 = undefined;

    for (;;)
    {
        var_1 = _id_2793();

        if ( !isdefined( var_0 ) || !isdefined( var_1 ) || var_1 != var_0 )
        {
            if ( isdefined( var_0 ) && var_0._id_0463 == 505 )
                var_0._id_0463 = 0;

            var_0 = var_1;
        }

        if ( isdefined( var_1 ) && var_1._id_0463 == 0 )
            var_1._id_0463 = 505;

        wait 0.05;
    }
}
