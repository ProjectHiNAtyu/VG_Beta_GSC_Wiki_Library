// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    scripts\mp\bots\bots_gametype_sd::_id_D78A();
    _id_D78A();
    scripts\mp\bots\bots_gametype_conf::_id_D75E();
    scripts\mp\bots\bots_gametype_sd::_id_288A();
}

_id_D78A()
{
    level._id_2777["gametype_think"] = ::_id_28C5;
}

_id_28C5()
{
    self notify( "bot_sr_think" );
    self endon( "bot_sr_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self._id_7506 = undefined;

    while ( !isdefined( level._id_278A ) )
        wait 0.05;

    self._id_EBDE = undefined;
    childthread _id_ED45();
    scripts\mp\bots\bots_gametype_sd::_id_288B();
}

_id_ED45()
{
    for (;;)
    {
        wait 0.05;

        if ( self.health <= 0 )
            continue;

        if ( !isdefined( self._id_C8B8 ) )
            continue;

        var_0 = scripts\mp\bots\bots_gametype_conf::_id_2770( 0 );

        if ( var_0.size > 0 )
        {
            var_1 = scripts\engine\utility::random( var_0 );

            if ( distancesquared( self.origin, var_1._id_0400._id_411F ) < 10000 )
                _id_E4D5( var_1._id_0400 );
            else if ( self.team == game["attackers"] )
            {
                if ( self._id_C8B8 != "atk_bomber" )
                    _id_E4D5( var_1._id_0400 );
            }
            else if ( self._id_C8B8 != "defuser" )
                _id_E4D5( var_1._id_0400 );
        }
    }
}

_id_E4D5( var_0 )
{
    if ( isdefined( var_0._id_2866 ) && isdefined( var_0._id_2866[self.team] ) && isalive( var_0._id_2866[self.team] ) && var_0._id_2866[self.team] != self )
        return;

    if ( _id_E4D0( var_0 ) )
        return;

    if ( !isdefined( self._id_C8B8 ) )
        return;

    if ( _id_09D1::_id_27DF() )
        _id_09D0::_id_2740();

    var_0._id_2866[self.team] = self;
    var_0 thread _id_3899();
    var_0 thread _id_3898( self );
    self._id_EBDE = 1;
    childthread _id_A67C( var_0, "tag_picked_up" );
    var_1 = var_0._id_411F;
    self _meth_8057( var_1, 0, "tactical" );
    childthread _id_10A80( var_0 );
    var_2 = _id_09D1::_id_28F6( undefined, "tag_picked_up", "new_role" );
    self notify( "stop_watch_tag_destination" );

    if ( var_2 == "no_path" )
    {
        var_1 = var_1 + ( 16 * _id_BFC4(), 16 * _id_BFC4(), 0 );
        self _meth_8057( var_1, 0, "tactical" );
        var_2 = _id_09D1::_id_28F6( undefined, "tag_picked_up", "new_role" );

        if ( var_2 == "no_path" )
        {
            var_1 = _id_09D1::_id_2875( "BotGetClosestNavigablePoint", _id_09D1::_id_5FFA, var_0._id_411F, 32, self );

            if ( isdefined( var_1 ) )
            {
                self _meth_8057( var_1, 0, "tactical" );
                var_2 = _id_09D1::_id_28F6( undefined, "tag_picked_up", "new_role" );
            }
        }
    }
    else if ( var_2 == "bad_path" )
    {
        var_3 = _func_00B5( var_0._id_411F, 256, 0, level._id_28CC + 55 );

        if ( var_3.size > 0 )
        {
            var_4 = ( var_0._id_411F[0], var_0._id_411F[1], ( var_3[0].origin[2] + var_0._id_411F[2] ) * 0.5 );
            self _meth_8057( var_4, 0, "tactical" );
            var_2 = _id_09D1::_id_28F6( undefined, "tag_picked_up", "new_role" );
        }
    }

    if ( var_2 == "goal" && var_0 scripts\mp\bots\bots_gametype_conf::_id_26F9( self.team ) )
        wait 3.0;

    if ( self _meth_8041() && isdefined( var_1 ) )
    {
        var_5 = self _meth_803A();

        if ( _id_09D1::_id_28F0( var_5, var_1 ) )
            self _meth_802A();
    }

    self notify( "stop_tag_watcher" );
    var_0._id_2866[self.team] = undefined;
    self._id_EBDE = undefined;
}

_id_10A80( var_0 )
{
    self endon( "stop_watch_tag_destination" );

    for (;;)
    {
        if ( !var_0 scripts\mp\bots\bots_gametype_conf::_id_26F9( self.team ) )
            wait 0.05;

        var_1 = self _meth_803A();
        wait 0.05;
    }
}

_id_E4D0( var_0 )
{
    var_1 = distance( self.origin, var_0._id_411F );
    var_2 = scripts\mp\bots\bots_gametype_common::_id_654B( self.team, 1 );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 != self && isdefined( var_4._id_C8B8 ) && var_4._id_C8B8 != "atk_bomber" && var_4._id_C8B8 != "defuser" )
        {
            var_5 = distance( var_4.origin, var_0._id_411F );

            if ( var_5 < var_1 * 0.5 )
                return 1;
        }
    }

    return 0;
}

_id_BFC4()
{
    return randomintrange( 0, 2 ) * 2 - 1;
}

_id_3899()
{
    self waittill( "reset" );
    self._id_2866 = [];
}

_id_3898( var_0 )
{
    self endon( "reset" );
    var_1 = var_0.team;
    var_0 waittill( "death_or_disconnect" );
    self._id_2866[var_1] = undefined;
}

_id_A67C( var_0, var_1 )
{
    self endon( "stop_tag_watcher" );

    while ( var_0 scripts\mp\bots\bots_gametype_conf::_id_26F9( self.team ) && !scripts\mp\bots\bots_gametype_conf::_id_2706( var_0 ) )
        wait 0.05;

    self notify( var_1 );
}

_id_E4D1( var_0 )
{
    if ( isdefined( var_0._id_26F3 ) && isdefined( var_0._id_26F3[self.team] ) && isalive( var_0._id_26F3[self.team] ) && var_0._id_26F3[self.team] != self )
        return;

    if ( !isdefined( self._id_C8B8 ) )
        return;

    if ( _id_09D1::_id_27DF() )
        _id_09D0::_id_2740();

    var_0._id_26F3[self.team] = self;
    var_0 thread _id_3897();
    var_0 thread _id_3896( self );
    self._id_EBDE = 1;
    _id_09CE::_id_389B();
    var_1 = self._id_C8B8;

    while ( var_0 scripts\mp\bots\bots_gametype_conf::_id_26F9( self.team ) && self._id_C8B8 == var_1 )
    {
        if ( _id_09CE::_id_DAC8() )
        {
            if ( _id_09CE::_id_5A91( var_0._id_411F, 1000 ) )
                childthread scripts\mp\bots\bots_gametype_conf::_id_26F1( var_0, "tactical", "new_role" );
        }

        wait 0.05;
    }

    self notify( "stop_camping_tag" );
    self _meth_802A();
    var_0._id_26F3[self.team] = undefined;
    self._id_EBDE = undefined;
}

_id_3897()
{
    self waittill( "reset" );
    self._id_26F3 = [];
}

_id_3896( var_0 )
{
    self endon( "reset" );
    var_1 = var_0.team;
    var_0 waittill( "death_or_disconnect" );
    self._id_26F3[var_1] = undefined;
}
