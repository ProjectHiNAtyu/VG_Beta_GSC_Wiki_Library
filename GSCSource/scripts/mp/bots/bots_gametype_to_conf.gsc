// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_D78A();
    _id_D75E();
}

_id_D78A()
{
    level._id_2777["gametype_think"] = ::_id_2716;
}

_id_D75E()
{
    level._id_28CD = 200;
    level._id_28CC = 38;
}

_id_2716()
{
    self notify( "bot_conf_think" );
    self endon( "bot_conf_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self._id_A474 = gettime() + 500;
    self._id_ED6E = [];
    childthread _id_28FE();

    if ( self._id_B010 == "camper" )
    {
        self._id_3B4B = 0;

        if ( !isdefined( self._id_3B4C ) )
            self._id_3B4C = 0;
    }

    for (;;)
    {
        var_0 = isdefined( self._id_ED36 );
        var_1 = 0;

        if ( var_0 && self _meth_8041() )
        {
            var_2 = self _meth_803A();

            if ( _id_09D1::_id_28F0( self._id_ED36._id_411F, var_2 ) )
            {
                if ( self _meth_804E() )
                    var_1 = 1;
            }
            else if ( _id_09D0::_id_27C7( "kill_tag" ) && self._id_ED36 _id_07AD::_id_3166( self.team ) )
            {
                self._id_ED36 = undefined;
                var_0 = 0;
            }
        }

        self _meth_8053( "force_sprint", var_1 );
        self._id_ED6E = _id_2881( self._id_ED6E );
        var_3 = _id_2767( self._id_ED6E, 1 );
        var_4 = isdefined( var_3 );

        if ( var_0 && !var_4 || !var_0 && var_4 || var_0 && var_4 && self._id_ED36 != var_3 )
        {
            self._id_ED36 = var_3;
            self _meth_802A();
            self notify( "stop_camping_tag" );
            _id_09CE::_id_389B();
            _id_09D0::_id_26C9( "kill_tag" );
        }

        if ( isdefined( self._id_ED36 ) )
        {
            self._id_3B4C = 0;

            if ( self._id_B010 == "camper" && self._id_3B4B )
            {
                self._id_3B4C = 1;

                if ( _id_09CE::_id_DAC8() )
                {
                    if ( _id_09CE::_id_5A91( self._id_ED36._id_411F, 1000 ) )
                        childthread _id_26F1( self._id_ED36, "camp" );
                    else
                        self._id_3B4C = 0;
                }
            }

            if ( !self._id_3B4C )
            {
                if ( !_id_09D0::_id_27C7( "kill_tag" ) )
                {
                    var_5 = spawnstruct();
                    var_5._id_CD66 = "objective";
                    var_5._id_A895 = level._id_28CD;
                    _id_09D0::_id_283C( "kill_tag", self._id_ED36._id_411F, 25, var_5 );
                }
            }
        }

        var_6 = 0;

        if ( isdefined( self._id_10A8 ) )
            var_6 = self [[ self._id_10A8 ]]();

        if ( !isdefined( self._id_ED36 ) )
        {
            if ( !var_6 )
                self [[ self._id_B012 ]]();
        }

        if ( gettime() > self._id_A474 )
        {
            self._id_A474 = gettime() + 500;
            var_7 = _id_2770( 1 );
            self._id_ED6E = _id_2715( var_7, self._id_ED6E );
        }

        wait 0.05;
    }
}

_id_2706( var_0 )
{
    if ( isdefined( var_0._id_AA49 ) && var_0._id_AA49 )
    {
        var_1 = self.origin + ( 0, 0, 55 );

        if ( distance2dsquared( var_0._id_411F, var_1 ) < 144 )
        {
            var_2 = var_0._id_411F[2] - var_1[2];

            if ( var_2 > 0 )
            {
                if ( var_2 < level._id_28CC )
                {
                    if ( !isdefined( self._id_8F57 ) )
                        self._id_8F57 = 0;

                    if ( gettime() - self._id_8F57 > 3000 )
                    {
                        self._id_8F57 = gettime();
                        thread _id_27ED();
                    }
                }
                else
                {
                    var_0._id_AA49 = 0;
                    return 1;
                }
            }
        }
    }

    return 0;
}

_id_27ED()
{
    self endon( "death_or_disconnect" );
    self _meth_805A( "stand" );
    wait 1.0;
    self _meth_804D( "jump" );
    wait 1.0;
    self _meth_805A( "none" );
}

_id_28FE()
{
    for (;;)
    {
        level waittill( "new_tag_spawned", var_0 );
        self._id_A474 = -1;

        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0._id_103C0 ) && var_0._id_103C0 == self || isdefined( var_0.attacker ) && var_0.attacker == self )
            {
                if ( !isdefined( var_0._id_AA49 ) && !isdefined( var_0._id_2EE3 ) )
                {
                    thread _id_2EB1( var_0 );
                    _id_1092E( var_0 );

                    if ( var_0._id_AA49 )
                    {
                        var_1 = spawnstruct();
                        var_1.origin = var_0._id_411F;
                        var_1._id_0400 = var_0;
                        var_2[0] = var_1;
                        self._id_ED6E = _id_2715( var_2, self._id_ED6E );
                    }
                }
            }
        }
    }
}

_id_2715( var_0, var_1 )
{
    var_2 = var_1;

    foreach ( var_4 in var_0 )
    {
        var_5 = 0;

        foreach ( var_7 in var_1 )
        {
            if ( var_4._id_0400 == var_7._id_0400 && _id_09D1::_id_28F0( var_4.origin, var_7.origin ) )
            {
                var_5 = 1;
                break;
            }
        }

        if ( !var_5 )
            var_2 = scripts\engine\utility::array_add( var_2, var_4 );
    }

    return var_2;
}

_id_27EA( var_0, var_1, var_2 )
{
    if ( !var_0._id_2EBE )
    {
        var_0._id_A3E5 = _func_0080( var_0._id_411F );
        var_0._id_2EBE = 1;
    }

    if ( isdefined( var_0._id_2EE3 ) )
        return 0;

    var_3 = var_0._id_A3E5;
    var_4 = !isdefined( var_0._id_AA49 );

    if ( isdefined( var_3 ) && ( var_4 || var_0._id_AA49 ) )
    {
        var_5 = var_3 == var_1 || _func_0156( var_3, var_1, 1 );

        if ( var_5 )
        {
            var_6 = scripts\engine\utility::_id_10E74( self.origin, self.angles, var_0._id_411F, var_2 );

            if ( var_6 )
            {
                if ( var_4 )
                {
                    thread _id_2EB1( var_0 );
                    _id_1092E( var_0 );

                    if ( !var_0._id_AA49 )
                        return 0;
                }

                return 1;
            }
        }
    }

    return 0;
}

_id_2770( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( var_1 ) )
        var_3 = var_1;
    else
        var_3 = self _meth_815E();

    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2;
    else
        var_4 = self _meth_8031();

    var_5 = [];

    if ( isdefined( var_3 ) && isdefined( level._id_4CC7 ) )
    {
        foreach ( var_7 in level._id_4CC7 )
        {
            if ( var_7 _id_07AD::_id_3166( self.team ) )
            {
                var_8 = 0;

                if ( !var_0 )
                {
                    if ( !isdefined( var_7._id_2EE3 ) )
                    {
                        if ( !isdefined( var_7._id_AA49 ) )
                        {
                            level thread _id_2EB1( var_7 );
                            _id_1092E( var_7 );
                        }

                        var_8 = distancesquared( self.origin, var_7._id_411F ) < 1000000 && var_7._id_AA49;
                    }
                }
                else if ( _id_27EA( var_7, var_3, var_4 ) )
                    var_8 = 1;

                if ( var_8 )
                {
                    var_9 = spawnstruct();
                    var_9.origin = var_7._id_411F;
                    var_9._id_0400 = var_7;
                    var_5 = scripts\engine\utility::array_add( var_5, var_9 );
                }
            }
        }
    }

    return var_5;
}

_id_2EB1( var_0 )
{
    scripts\mp\bots\bots_gametype_conf::_id_2EB1( var_0 );
}

_id_1092E( var_0 )
{
    while ( !isdefined( var_0._id_AA49 ) )
        wait 0.05;
}

_id_2767( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
    {
        var_3 = 1409865409;

        foreach ( var_5 in var_0 )
        {
            var_6 = _id_65D7( var_5._id_0400 );

            if ( !var_1 || var_6 < 2 )
            {
                var_7 = distancesquared( var_5._id_0400._id_411F, self.origin );

                if ( var_7 < var_3 )
                {
                    var_2 = var_5._id_0400;
                    var_3 = var_7;
                }
            }
        }
    }

    return var_2;
}

_id_2881( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_0400 _id_07AD::_id_3166( self.team ) && _id_09D1::_id_28F0( var_3._id_0400._id_411F, var_3.origin ) )
        {
            if ( !_id_2706( var_3._id_0400 ) && var_3._id_0400._id_AA49 )
                var_1 = scripts\engine\utility::array_add( var_1, var_3 );
        }
    }

    return var_1;
}

_id_65D7( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_AE69 )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( var_3.team == self.team && var_3 != self )
        {
            if ( isai( var_3 ) )
            {
                if ( isdefined( var_3._id_ED36 ) && var_3._id_ED36 == var_0 )
                    var_1++;

                continue;
            }

            if ( distancesquared( var_3.origin, var_0._id_411F ) < 160000 )
                var_1++;
        }
    }

    return var_1;
}

_id_26F1( var_0, var_1, var_2 )
{
    self notify( "bot_camp_tag" );
    self endon( "bot_camp_tag" );
    self endon( "stop_camping_tag" );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    self _meth_8058( self._id_A53A, var_1, self._id_16A2 );
    var_3 = _id_09D1::_id_28F6();

    if ( var_3 == "goal" )
    {
        var_4 = var_0._id_A3E5;

        if ( isdefined( var_4 ) )
        {
            var_5 = _func_0066( self.origin );
            var_5 = scripts\engine\utility::array_add( var_5, var_4 );
            childthread _id_09D1::_id_28FF( var_5 );
        }
    }
}
