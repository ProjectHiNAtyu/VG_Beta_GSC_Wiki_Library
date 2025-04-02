// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_5682()
{
    thread _id_5684();
    _id_5674( 1 );
}

_id_5674( var_0 )
{
    if ( !isdefined( level._id_03E1._id_3D44 ) )
        level._id_03E1._id_3D44 = [ "bulletwhizby", "explode", "footstep", "footstep_sprint", "footstep_walk", "grenade danger", "gunshot", "gunshot_teammate", "projectile_impact", "silenced_shot", "glass_destroyed" ];

    if ( var_0 )
    {
        foreach ( var_2 in level._id_03E1._id_3D44 )
            self _meth_8000( var_2 );
    }
    else
    {
        foreach ( var_2 in level._id_03E1._id_3D44 )
            self remotecontrolvehicletargetoff( var_2 );
    }
}

_id_5683()
{
    if ( !isdefined( level._id_03E1._id_5687 ) )
        level._id_03E1._id_5687 = [];

    level._id_03E1._id_5687["investigate"] = 0;
    level._id_03E1._id_5687["cover_blown"] = 1;
    level._id_03E1._id_5687["combat"] = 2;
    level _id_088C::_id_D3B7( "broadcast", ::_id_5670 );
    _id_568C( "investigate", "footstep", 15, 0.07 );
    _id_568C( "investigate", "footstep_sprint", 10, 0.1 );
    _id_568C( "investigate", "footstep_walk", 20, 0.05 );
    _id_568C( "investigate", "unresponsive_teammate", 20, 0.05 );
    _id_568C( "investigate", "window_open", 0, 0.2 );
    _id_568C( "investigate", "ally_hurt_peripheral", 0, 0.1 );
    _id_568C( "cover_blown", "sight", 2, 0.45 );
    _id_568C( "cover_blown", "saw_corpse", 0, 0.3 );
    _id_568C( "cover_blown", "found_corpse", 0, 0.3 );
    _id_568C( "cover_blown", "gunshot_teammate", 10, 0.1 );
    _id_568C( "cover_blown", "silenced_shot", 5, 0.23 );
    _id_568C( "cover_blown", "gunshot", 3, 0.4 );
    _id_568C( "cover_blown", "explode", 2, 0.8 );
    _id_568C( "cover_blown", "seek_backup", 0, 0.0 );
    _id_568C( "cover_blown", "grenade danger", 0, 0.9 );
    _id_568C( "cover_blown", "glass_destroyed", 2, 0.5 );
    _id_568C( "cover_blown", "light_killed", 3, 0.4 );
    _id_568C( "cover_blown", "bulletwhizby", 3, 0.4 );
    _id_568C( "combat", "projectile_impact" );
    _id_568C( "combat", "attack" );
    _id_568C( "combat", "damage" );
    _id_568C( "combat", "proximity" );
    _id_568C( "combat", "ally_damaged" );
    _id_568C( "combat", "ally_killed" );
}

_id_5689( var_0, var_1 )
{
    var_2 = level._id_03E1._id_5687[var_0] - level._id_03E1._id_5687[var_1];
    return var_2;
}

_id_568D( var_0, var_1 )
{
    var_2 = level._id_03E1._id_5687[var_0] + var_1;

    foreach ( var_5, var_4 in level._id_03E1._id_5687 )
    {
        if ( var_4 == var_2 )
            return var_5;
    }

    return var_0;
}

_id_568C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0.0;

    if ( !isdefined( level._id_03E1._id_5688 ) )
        level._id_03E1._id_5688 = [];

    if ( !isdefined( level._id_03E1._id_5675 ) )
        level._id_03E1._id_5675 = [];

    if ( !isdefined( level._id_03E1._id_567B ) )
        level._id_03E1._id_567B = [];

    if ( !isdefined( level._id_03E1._id_567C ) )
        level._id_03E1._id_567C = [];

    level._id_03E1._id_5688[var_1] = var_0;
    level._id_03E1._id_5675[var_1] = var_2;
    level._id_03E1._id_567B[var_1] = var_3;
    level._id_03E1._id_567C[var_1] = var_4;
}

_id_568A( var_0 )
{
    return level._id_03E1._id_5688[var_0];
}

_id_5678( var_0 )
{
    return level._id_03E1._id_5675[var_0];
}

_id_567A( var_0 )
{
    return level._id_03E1._id_567B[var_0];
}

_id_567D( var_0 )
{
    return level._id_03E1._id_567C[var_0];
}

_id_5676()
{
    self._id_03E1._id_5677 = undefined;
    self._id_03E1._id_5679 = 0.0;
}

_id_5684()
{
    self notify( "event_listener_thread" );
    self endon( "event_listener_thread" );
    self endon( "death" );

    for (;;)
    {
        scripts\engine\utility::_id_5456( "stealth_enabled" );
        self waittill( "ai_events", var_0 );

        if ( !scripts\engine\utility::_id_544E( "stealth_enabled" ) )
            continue;

        if ( self._id_020F || self _meth_81DE() )
            continue;

        foreach ( var_2 in var_0 )
        {
            if ( !isdefined( var_2._id_0186 ) )
                continue;

            if ( _func_011C( var_2._id_0186 ) && ( var_2._id_0186._id_0213 || var_2._id_0186._id_02DA ) )
                continue;

            if ( isdefined( var_2._id_0186._id_ADA1 ) )
            {
                if ( var_2._id_0186._id_ADA1.type == "capital_ship" )
                    continue;
            }

            var_2._id_F8E1 = var_2._id_048F;
            var_2._id_033C = self;
            var_3 = _id_568A( var_2._id_048F );
            var_4 = undefined;
            var_5 = undefined;
            var_6 = undefined;

            if ( isdefined( var_3 ) )
            {
                if ( !isdefined( self._id_4A8F ) && var_3 != "combat" )
                {
                    var_4 = _id_5678( var_2._id_048F );
                    var_5 = _id_567A( var_2._id_048F );
                    var_6 = _id_567D( var_2._id_048F );

                    if ( var_4 > 0 )
                    {
                        if ( !isdefined( self._id_03E1._id_5677 ) )
                            self._id_03E1._id_5677 = [];

                        if ( !isdefined( self._id_03E1._id_5677[var_2._id_048F] ) )
                            self._id_03E1._id_5677[var_2._id_048F] = 0;

                        if ( isdefined( var_6 ) && self._id_03E1._id_5677[var_2._id_048F] + 1 >= var_6 )
                            var_3 = _id_568D( var_3, 2 );
                        else if ( self._id_03E1._id_5677[var_2._id_048F] + 1 >= var_4 )
                            var_3 = _id_568D( var_3, 1 );
                        else if ( self._id_03E1._id_5679 + var_5 >= 1.0 )
                            var_3 = _id_568D( var_3, 1 );
                    }
                }

                var_2._id_048F = var_3;
            }

            var_7 = _id_087F::_id_E79A( var_2._id_048F, var_2 );

            if ( istrue( var_7 ) && isdefined( var_4 ) && var_2._id_048F != "combat" )
            {
                if ( var_4 > 0 )
                    self._id_03E1._id_5677[var_2._id_F8E1]++;

                self._id_03E1._id_5679 = self._id_03E1._id_5679 + var_5;
            }
        }
    }
}

_id_54DE( var_0 )
{
    switch ( var_0.classname )
    {
        case "script_vehicle_blackhornet":
            return 1;
        default:
            return 0;
    }
}

_id_566C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _func_0074( "bad_guys", "all" );
    var_6 = _func_0214( var_3 );
    var_7 = _func_0214( var_4 );
    var_8 = self.team;

    if ( !isdefined( var_8 ) )
        var_8 = self._id_002E;

    foreach ( var_10 in var_5 )
    {
        if ( !isalive( var_10 ) )
            continue;

        if ( var_10 == self )
            continue;

        if ( var_10.team != var_8 )
            continue;

        if ( !isdefined( var_10._id_03E1 ) )
            continue;

        var_11 = 0;
        var_12 = distancesquared( var_10.origin, self.origin );

        if ( var_12 <= var_6 )
            var_11 = self _meth_8618( var_10 );

        if ( !var_11 && var_12 <= var_7 )
        {
            if ( var_10 _id_088C::_id_86F8( self ) || var_10 _id_088C::_id_86F8( var_2 ) )
                var_11 = 1;
        }

        if ( var_10 [[ var_10._id_5D78 ]]() )
        {
            if ( var_11 )
                var_10 _meth_812E( var_2 );

            continue;
        }

        if ( var_11 )
        {
            if ( var_10 _meth_8204( var_2 ) == 0 )
                var_10 _meth_8522( var_0, var_2, self.origin );
            else
                var_10 _meth_8522( var_0, var_2, var_2.origin );

            continue;
        }

        if ( var_10 _meth_861F( self ) )
            var_10 _meth_8522( var_1, var_2, self.origin );
    }
}

_id_5670( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0074( "bad_guys" );

    if ( !isdefined( var_3 ) )
        var_3 = level.player;

    var_5 = _func_0214( var_2 );

    foreach ( var_7 in var_4 )
    {
        if ( !isalive( var_7 ) )
            continue;

        if ( !isdefined( var_7._id_03E1 ) )
            continue;

        if ( distancesquared( var_7.origin, var_1 ) <= var_5 )
            var_7 _meth_8522( var_0, var_3, var_1 );
    }
}

_id_566F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _func_0074( "bad_guys", "all" );
    var_8 = var_3 * var_3;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    var_9 = undefined;

    if ( isdefined( var_6 ) )
        var_9 = var_6 * var_6;

    if ( !isdefined( var_5 ) )
        var_5 = var_2;

    foreach ( var_11 in var_7 )
    {
        if ( !isalive( var_11 ) )
            continue;

        if ( !isdefined( var_11._id_03E1 ) )
            continue;

        var_12 = distancesquared( var_11.origin, var_2 );

        if ( var_12 > var_8 )
            continue;

        var_13 = var_4;

        if ( var_4 && isdefined( var_9 ) && var_12 <= var_9 )
            var_13 = 0;

        if ( !var_11 _meth_8618( var_5, var_13 ) )
            continue;

        var_11 _meth_8522( var_0, var_1, var_2 );
    }
}

_id_566D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    thread _id_566E( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_566E( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _func_0074( "bad_guys", "all" );
    var_8 = var_3 * var_3;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( !isdefined( var_5 ) )
        var_5 = var_2;

    var_9 = 3;
    var_10 = 0;

    foreach ( var_12 in var_7 )
    {
        if ( !isalive( var_12 ) )
            continue;

        if ( !isdefined( var_12._id_03E1 ) )
            continue;

        var_13 = distancesquared( var_12.origin, var_2 );

        if ( var_13 > var_8 )
            continue;

        if ( isdefined( var_6 ) && var_13 <= var_6 * var_6 )
        {
            var_12 _meth_8522( var_0, var_1, var_2 );
            continue;
        }

        if ( !var_12 _meth_8618( var_5, var_4 ) )
        {
            if ( var_4 && !var_12 _meth_861B( var_2 ) )
                continue;

            var_10++;

            if ( var_10 > var_9 )
            {
                waitframe();
                var_10 = 0;
            }

            if ( !_func_01FD( var_12 geteye(), var_2, 0, var_1 ) )
                continue;
        }

        var_12 _meth_8522( var_0, var_1, var_2 );
    }
}
