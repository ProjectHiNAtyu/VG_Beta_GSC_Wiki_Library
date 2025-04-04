// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_5C61( var_0 )
{
    self._id_5C6A = var_0;
    self._id_5C69 = [];
    thread _id_8E2B();
}

_id_5C62( var_0, var_1 )
{
    var_2 = "tag_origin";

    if ( !isdefined( var_0 ) )
        var_0 = "vehicle_flares";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    playsoundatpos( self gettagorigin( var_2 ), "ks_apache_flares" );
    playfxontag( level._effect[var_0], self, var_2 );
}

_id_5C56()
{
    var_0 = spawn( "script_origin", self.origin + ( 0, 0, -256 ) );
    var_0.angles = self.angles;
    var_0 _meth_8237( ( 0, 0, -1 ), 5.0 );
    self._id_5C69[self._id_5C69.size] = var_0;
    var_0 thread _id_5C55( 5.0, 2.0, self );
    return var_0;
}

_id_5C55( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) && isdefined( var_2 ) )
    {
        var_0 = var_0 - var_1;
        wait( var_1 );

        if ( isdefined( var_2 ) )
            var_2._id_5C69 = scripts\engine\utility::array_remove( var_2._id_5C69, self );
    }

    wait( var_0 );
    self delete();
}

_id_5C5D( var_0 )
{
    return var_0._id_5C6A;
}

_id_5C53( var_0 )
{
    _id_5C54( var_0 );
    return var_0._id_5C6A > 0 || var_0._id_5C69.size > 0;
}

_id_5C5C( var_0 )
{
    _id_5C64( var_0 );
    var_0 thread _id_5C62();
    var_1 = var_0 _id_5C56();
    return var_1;
}

_id_5C54( var_0 )
{
    var_0._id_5C69 = scripts\engine\utility::_id_1BA9( var_0._id_5C69 );
}

_id_5C5B( var_0 )
{
    _id_5C54( var_0 );
    var_1 = undefined;

    if ( var_0._id_5C69.size > 0 )
        var_1 = var_0._id_5C69[var_0._id_5C69.size - 1];

    return var_1;
}

_id_8E2B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    while ( _id_5C53( self ) )
    {
        level waittill( "laserGuidedMissiles_incoming", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        if ( !_func_0106( var_1 ) )
            var_1 = [ var_1 ];

        foreach ( var_4 in var_1 )
        {
            if ( _func_0127( var_4 ) )
                level thread _id_8E2C( var_4, var_0, var_0.team, var_2 );
        }
    }
}

_id_8E2C( var_0, var_1, var_2, var_3 )
{
    var_3 endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "missile_targetChanged" );

    while ( _id_5C53( var_3 ) )
    {
        if ( !isdefined( var_3 ) || !_func_0127( var_0 ) )
            break;

        var_4 = var_3 _meth_8174( 0, 0, 0 );

        if ( distancesquared( var_0.origin, var_4 ) < 4000000 )
        {
            var_5 = _id_5C5B( var_3 );

            if ( !isdefined( var_5 ) )
                var_5 = _id_5C5C( var_3 );

            scripts\cp_mp\utility\weapon_utility::_id_394D( var_0 );
            var_0 missile_settargetent( var_5 );
            var_0 notify( "missile_pairedWithFlare" );
            break;
        }

        waitframe();
    }
}

_id_5C5E( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    for (;;)
    {
        level waittill( "sam_fired", var_1, var_2, var_3 );

        if ( !isdefined( var_3 ) || var_3 != self )
            continue;

        if ( isdefined( var_0 ) )
        {
            level thread [[ var_0 ]]( var_1, var_1.team, var_3, var_2 );
            continue;
        }

        level thread _id_5C66( var_1, var_1.team, var_3, var_2 );
    }
}

_id_5C66( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    for (;;)
    {
        var_4 = var_2 _meth_8174( 0, 0, 0 );
        var_5 = [];

        for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        {
            if ( isdefined( var_3[var_6] ) )
                var_5[var_6] = distance( var_3[var_6].origin, var_4 );
        }

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6] ) )
            {
                if ( var_5[var_6] < 4000 && var_2._id_5C6A > 0 )
                {
                    _id_5C64( var_2 );
                    var_2 thread _id_5C62();
                    var_7 = var_2 _id_5C56();

                    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
                    {
                        if ( isdefined( var_3[var_8] ) )
                        {
                            scripts\cp_mp\utility\weapon_utility::_id_394D( var_3[var_8] );
                            var_3[var_8] missile_settargetent( var_7 );
                            var_3[var_8] notify( "missile_pairedWithFlare" );
                        }
                    }

                    return;
                }
            }
        }

        waitframe();
    }
}

_id_5C5F( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    if ( !isdefined( self._id_5C69 ) )
        self._id_5C69 = [];

    for (;;)
    {
        level waittill( "stinger_fired", var_2, var_3, var_4 );

        if ( !isdefined( var_4 ) || var_4 != self )
            continue;

        if ( isdefined( var_0 ) )
        {
            var_3 thread [[ var_0 ]]( var_2, var_2.team, var_4, var_1 );
            continue;
        }

        var_3 thread _id_5C67( var_2, var_2.team, var_4, var_1 );
    }
}

_id_5C67( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    for (;;)
    {
        if ( !isdefined( var_2 ) )
            break;

        var_4 = var_2 _meth_8174( 0, 0, 0 );
        var_5 = distance( self.origin, var_4 );

        if ( var_5 < 4000 && var_2._id_5C6A > 0 )
        {
            _id_5C64( var_2 );
            var_2 thread _id_5C62( undefined, var_3 );
            var_6 = var_2 _id_5C56();
            scripts\cp_mp\utility\weapon_utility::_id_394D( self );
            self missile_settargetent( var_6 );
            self notify( "missile_pairedWithFlare" );
            return;
        }

        waitframe();
    }
}

_id_5C64( var_0 )
{
    var_0._id_5C6A--;

    if ( isdefined( var_0.owner ) )
        var_0.owner setclientomnvar( "ui_killstreak_flares", var_0._id_5C6A );
}

_id_8E30( var_0, var_1, var_2, var_3 )
{
    self._id_5C6A = var_0;
    self._id_5C69 = [];

    if ( isdefined( var_2 ) )
        self.owner setclientomnvar( var_2, var_0 );

    thread _id_8E2F( var_1, var_2 );
    thread _id_8E2D( var_3 );
}

_id_8E2F( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    if ( !isai( self.owner ) )
        self.owner notifyonplayercommand( "manual_flare_popped", var_0 );

    while ( _id_5C5D( self ) )
    {
        self.owner waittill( "manual_flare_popped" );
        var_2 = _id_5C5C( self );

        if ( isdefined( var_2 ) && isdefined( self.owner ) && !isai( self.owner ) )
        {
            self.owner playlocalsound( "ks_ac130_flares" );

            if ( isdefined( var_1 ) )
                self.owner setclientomnvar( var_1, _id_5C5D( self ) );
        }
    }
}

_id_8E2D( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    while ( _id_5C53( self ) )
    {
        self waittill( "targeted_by_incoming_missile", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        self.owner thread _id_8E32( self, "missile_incoming" );

        if ( isdefined( var_0 ) )
        {
            var_2 = vectornormalize( var_1[0].origin - self.origin );
            var_3 = vectornormalize( anglestoright( self.angles ) );
            var_4 = vectordot( var_2, var_3 );
            var_5 = 1;

            if ( var_4 > 0 )
                var_5 = 2;
            else if ( var_4 < 0 )
                var_5 = 3;

            self.owner setclientomnvar( var_0, var_5 );
        }

        foreach ( var_7 in var_1 )
        {
            if ( _func_0127( var_7 ) )
                thread _id_8E2E( var_7 );
        }
    }
}

_id_8E2E( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( !isdefined( self ) || !_func_0127( var_0 ) )
            break;

        var_1 = self _meth_8174( 0, 0, 0 );

        if ( distancesquared( var_0.origin, var_1 ) < 4000000 )
        {
            var_2 = _id_5C5B( self );

            if ( isdefined( var_2 ) )
            {
                scripts\cp_mp\utility\weapon_utility::_id_394D( var_0 );
                var_0 missile_settargetent( var_2 );
                var_0 notify( "missile_pairedWithFlare" );
                self.owner _meth_83EE( "missile_incoming" );
                break;
            }
        }

        waitframe();
    }
}

_id_8E32( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 waittill( "death" );
    self _meth_83EE( var_1 );
}
