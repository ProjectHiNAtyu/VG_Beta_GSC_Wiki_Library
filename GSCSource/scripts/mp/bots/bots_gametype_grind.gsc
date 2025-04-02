// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_D78A();
    scripts\mp\bots\bots_gametype_conf::_id_D75E();
}

_id_D78A()
{
    level._id_2777["gametype_think"] = ::_id_27BB;
}

_id_27BB()
{
    self notify( "bot_grind_think" );
    self endon( "bot_grind_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self._id_7182 = 0;
    self._id_7066 = undefined;
    self._id_3B4D = 0;
    self._id_10A8 = ::_id_27BA;

    if ( self _meth_802F( "strategyLevel" ) > 0 )
        childthread _id_53E3();

    scripts\mp\bots\bots_gametype_conf::_id_2716();
}

_id_27BA()
{
    if ( !isdefined( self._id_ED36 ) )
    {
        if ( self._id_ED71 > 0 )
        {
            var_0 = _func_0214( 500 + self._id_ED71 * 250 );

            if ( game["teamScores"][self.team] + self._id_ED71 >= level._id_C93B )
                var_0 = _func_0214( 5000 );
            else if ( !isdefined( self._id_017D ) && !_id_09D1::_id_27D1() )
                var_0 = _func_0214( 1500 + self._id_ED71 * 250 );

            var_1 = undefined;

            foreach ( var_3 in level._id_A8D5 )
            {
                var_4 = distancesquared( self.origin, var_3._id_047A.origin );

                if ( var_4 < var_0 )
                {
                    var_0 = var_4;
                    var_1 = var_3;
                }
            }

            if ( isdefined( var_1 ) )
            {
                var_6 = 1;

                if ( self._id_7182 )
                {
                    if ( isdefined( self._id_7066 ) && self._id_7066 == var_1 )
                        var_6 = 0;
                }

                if ( var_6 )
                {
                    self._id_7182 = 1;
                    self._id_7066 = var_1;
                    self _meth_802A();
                    self notify( "stop_going_to_zone" );
                    self notify( "stop_camping_zone" );
                    self._id_3B4D = 0;
                    _id_09CE::_id_389B();
                    _id_09D0::_id_26C9( "kill_tag" );
                    childthread _id_27B8( var_1, "tactical" );
                }
            }

            if ( self._id_7182 )
            {
                if ( game["teamScores"][self.team] + self._id_ED71 >= level._id_C93B )
                    self _meth_8053( "force_sprint", 1 );
            }
        }
        else if ( self._id_7182 )
        {
            self._id_7182 = 0;
            self._id_7066 = undefined;
            self notify( "stop_going_to_zone" );
            self _meth_802A();
        }

        if ( self._id_B010 == "camper" && !self._id_3B4C && !self._id_7182 )
        {
            var_0 = undefined;
            var_1 = undefined;

            foreach ( var_3 in level._id_A8D5 )
            {
                var_4 = distancesquared( self.origin, var_3._id_047A.origin );

                if ( !isdefined( var_0 ) || var_4 < var_0 )
                {
                    var_0 = var_4;
                    var_1 = var_3;
                }
            }

            if ( isdefined( var_1 ) )
            {
                if ( _id_09CE::_id_DAC8() )
                {
                    if ( _id_09CE::_id_5A91( var_1._id_047A.origin ) )
                    {
                        self._id_3B4D = 1;
                        self notify( "stop_going_to_zone" );
                        self._id_7182 = 0;
                        self _meth_802A();
                        childthread _id_26F2( var_1, "camp" );
                    }
                    else
                    {
                        self notify( "stop_camping_zone" );
                        self._id_3B4D = 0;
                        _id_09CE::_id_389B();
                    }
                }
            }
            else
                self._id_3B4D = 1;
        }
    }
    else
    {
        self notify( "stop_going_to_zone" );
        self._id_7182 = 0;
        self._id_7066 = undefined;
        self notify( "stop_camping_zone" );
        self._id_3B4D = 0;
    }

    return self._id_7182 || self._id_3B4D;
}

_id_27B8( var_0, var_1 )
{
    self endon( "stop_going_to_zone" );

    if ( !isdefined( var_0._id_2EBE ) )
    {
        var_0._id_A3E5 = _func_0080( var_0._id_047A.origin );
        var_0._id_2EBE = 1;
    }

    var_2 = var_0._id_A3E5;
    self _meth_8057( var_2.origin, 32, var_1 );
    var_3 = _id_09D1::_id_28F6();
}

_id_26F2( var_0, var_1 )
{
    self endon( "stop_camping_zone" );
    self _meth_8058( self._id_A53A, var_1, self._id_16A2 );
    var_2 = _id_09D1::_id_28F6();

    if ( var_2 == "goal" )
    {
        if ( !isdefined( var_0._id_2EBE ) )
        {
            var_0._id_A3E5 = _func_0080( var_0._id_047A.origin );
            var_0._id_2EBE = 1;
        }

        var_3 = var_0._id_A3E5;

        if ( isdefined( var_3 ) )
        {
            var_4 = _func_0066( self.origin );
            var_4 = scripts\engine\utility::array_add( var_4, var_3 );
            childthread _id_09D1::_id_28FF( var_4 );
        }
    }
}

_id_53E3()
{
    self._id_4557 = self _meth_802F( "meleeChargeDist" );

    for (;;)
    {
        if ( self _meth_802F( "strategyLevel" ) < 2 )
            wait 0.5;
        else
            wait 0.2;

        if ( isdefined( self._id_017D ) && isplayer( self._id_017D ) && isdefined( self._id_017D._id_ED71 ) && self._id_017D._id_ED71 >= 3 && self _meth_8027( self._id_017D ) && distance( self.origin, self._id_017D.origin ) <= 500 )
        {
            self _meth_8052( "meleeChargeDist", 500 );
            self _meth_8053( "prefer_melee", 1 );
            continue;
        }

        self _meth_8052( "meleeChargeDist", self._id_4557 );
        self _meth_8053( "prefer_melee", 0 );
    }
}
