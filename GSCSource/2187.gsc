// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_F14E( var_0 )
{
    var_1 = isdefined( level._id_03E1._id_F142 ) && level._id_03E1._id_F142;
    level._id_03E1._id_F142 = var_0;
    _id_F14C( var_0 );

    if ( !var_0 && var_1 )
    {
        level notify( "threat_sight_disabled" );

        foreach ( var_3 in level.players )
            var_3._id_03E1._id_F159 = undefined;
    }
    else if ( var_0 && !var_1 )
        level notify( "threat_sight_enabled" );

    var_5 = _func_0070();

    foreach ( var_7 in var_5 )
    {
        if ( isalive( var_7 ) && isdefined( var_7._id_03E1 ) && isdefined( var_7._id_03E1._id_F156 ) )
            var_7 _id_F14F( var_7._id_03E1._id_F156 );
    }
}

_id_F14C( var_0 )
{
    setdvarifuninitialized( "#x3b1758e8692735e30", 0.4 );
    setdvarifuninitialized( "#x3f9279508b424e95c", 0.5 );

    if ( var_0 && ( !isdefined( level._id_03E1._id_F142 ) || !level._id_03E1._id_F142 ) )
        return;

    setsaveddvar( "ai_threatsight", var_0 );
    level thread _id_F14D( var_0 );
}

_id_F14D( var_0 )
{
    self notify( "threat_sight_set_dvar_display" );
    self endon( "threat_sight_set_dvar_display" );

    if ( !var_0 )
        wait 1.0;

    if ( getdvarint( "ai_threatUseDisplay", 0 ) )
        setsaveddvar( "ai_threatsightDisplay", var_0 );

    setdvar( "scr_ai_threatsightaudio", var_0 );
}

_id_F142()
{
    if ( !getdvarint( "ai_threatsight" ) )
        return 0;

    if ( self == level )
        return isdefined( level._id_03E1._id_F142 ) && level._id_03E1._id_F142;

    return isdefined( self._id_0465 ) && self._id_0465;
}

_id_F14F( var_0 )
{
    if ( isdefined( self._id_03E1 ) )
        self._id_03E1._id_F156 = var_0;

    if ( !isdefined( level._id_03E1._id_F142 ) || !level._id_03E1._id_F142 )
    {
        if ( !istrue( self._id_F146 ) )
        {
            thread _id_F146();
            self._id_F146 = 1;
        }

        return;
    }
    else if ( istrue( self._id_F146 ) )
    {
        self notify( "threat_sight_immediate_thread" );
        self._id_F146 = undefined;
    }

    switch ( var_0 )
    {
        case "hidden":
            self._id_0465 = 1;
            self._id_03E1._id_F141 = undefined;
            self._id_03E1._id_F147 = undefined;
            break;
        case "investigate":
            self._id_0465 = 1;
            break;
        case "combat_hunt":
        case "flashlight_in_dark":
            self._id_0465 = 1;
            break;
        case "blind":
        case "spotted":
        case "death":
            self._id_0465 = 0;
            break;
        default:
            break;
    }

    foreach ( var_2 in level.players )
        var_2 _id_F148( self, var_0 );

    _id_F150( var_0 );
}

_id_F150( var_0 )
{
    self [[ level._id_03E1._id_5DAC ]]( var_0 );
}

_id_F146()
{
    self notify( "threat_sight_immediate_thread" );
    self endon( "threat_sight_immediate_thread" );
    self endon( "death" );
    level endon( "threat_sight_enabled" );

    for (;;)
    {
        level scripts\engine\utility::_id_5C04( "stealth_enabled" );
        level scripts\engine\utility::_id_5C10( "stealth_spotted" );
        wait( randomfloatrange( 0.4, 0.6 ) );

        foreach ( var_1 in level.players )
        {
            if ( isdefined( var_1._id_7CF5 ) )
                continue;

            if ( var_1._id_0213 )
                continue;

            if ( self _meth_8066( var_1 ) )
                self _meth_8522( "sight", var_1, var_1.origin );
        }
    }
}

_id_F14A()
{
    if ( !isdefined( self._id_03E1._id_F13F ) )
        self._id_03E1._id_F13F = [];

    if ( !isdefined( self._id_03E1._id_F15B ) )
        self._id_03E1._id_F15B = 0;

    if ( !isdefined( self._id_03E1._id_F13E ) )
        self._id_03E1._id_F13E = 0;

    if ( !isdefined( self._id_03E1._id_F157 ) )
        self._id_03E1._id_F157 = [];
}

_id_F148( var_0, var_1 )
{
    _id_F14A();
    var_2 = var_0 getentitynumber();

    switch ( var_1 )
    {
        case "hidden":
            self._id_03E1._id_F157[var_2] = undefined;
            break;
        case "combat_hunt":
            var_0 _meth_8515( self, 0.0 );
            break;
        case "investigate":
            if ( isdefined( var_0._id_017D ) && var_0._id_017D == self )
                var_0 _meth_8515( self, 1.0 );

            break;
        case "death":
            var_0 _meth_8515( self, 0.0 );
            break;
    }

    switch ( var_1 )
    {
        case "death":
            self._id_03E1._id_F13F[var_2] = undefined;
            self._id_03E1._id_F157[var_2] = undefined;
            break;
        default:
            self._id_03E1._id_F13F[var_2] = var_0;
            break;
    }

    if ( !isdefined( self._id_03E1._id_F159 ) )
    {
        self._id_03E1._id_F159 = 1;
        thread _id_F149();
    }
}

_id_F151( var_0 )
{
    self endon( "death" );
    self endon( "stealth_idle" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_1 = self getentitynumber();

    if ( self [[ self._id_5D79 ]]() )
    {
        self _meth_812E( var_0 );
        self _meth_8522( "combat", var_0, var_0.origin );
        return;
    }

    var_0._id_03E1._id_F157[var_1] = self;
    self _meth_8522( "sight", var_0, var_0.origin );
    var_2 = var_0 getentitynumber();

    if ( !isdefined( self._id_03E1._id_F141 ) )
        self._id_03E1._id_F141 = [];

    if ( !isdefined( self._id_03E1._id_F141[var_2] ) )
        self._id_03E1._id_F141[var_2] = 0;
    else
        self._id_03E1._id_F141[var_2]++;

    var_3 = _id_088C::_id_13FD( var_0 );
    var_3 = var_3 / playrumbleonposition( 2, self._id_03E1._id_F141[var_2] );
    var_3 = var_3 * 1000;
    var_4 = gettime();

    if ( scripts\common\utility::_id_8A2C() )
        self._id_03E1._id_C073 = var_4 + var_3;

    var_5 = var_4;
    var_6 = var_4 + var_3;

    while ( gettime() < var_6 )
    {
        if ( istrue( self._id_03E1._id_254B ) || !isdefined( self._id_03E1._id_F141 ) || !isdefined( self._id_03E1._id_F141[var_2] ) )
            break;

        var_3 = _id_088C::_id_13FD( var_0 );
        var_3 = var_3 / playrumbleonposition( 2, self._id_03E1._id_F141[var_2] );
        var_3 = var_3 * 1000;

        if ( var_5 + var_3 < var_6 )
            var_6 = var_5 + var_3;

        waitframe();
    }

    thread _id_F152( var_0 );
}

_id_F152( var_0 )
{
    var_1 = var_0 getentitynumber();
    self notify( "threat_sight_sighted_wait_lost_" + var_1 );
    self endon( "threat_sight_sighted_wait_lost_" + var_1 );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_2 = self getentitynumber();
    var_0._id_03E1._id_F157[var_2] = undefined;

    for (;;)
    {
        self._id_03E1._id_F147[var_1] = self _meth_8514( var_0 ) < 0.75;

        if ( self._id_03E1._id_F147[var_1] )
            return;

        wait 0.05;
    }
}

_id_F144( var_0, var_1 )
{
    var_2 = gettime() + int( 1000.0 * var_1 );
    var_3 = var_0 getentitynumber();

    if ( !isdefined( self._id_03E1._id_5E51 ) )
        self._id_03E1._id_5E51 = [];

    if ( isdefined( self._id_03E1._id_5E51[var_3] ) )
        self._id_03E1._id_5E51[var_3]._id_5264 = max( self._id_03E1._id_5E51[var_3]._id_5264, var_2 );
    else
    {
        self._id_03E1._id_5E51[var_3] = spawnstruct();
        self._id_03E1._id_5E51[var_3]._id_5264 = var_2;
    }

    self._id_03E1._id_5E51[var_3]._id_5449 = var_0;
    thread _id_F145();
}

_id_F145()
{
    if ( istrue( self._id_03E1._id_5E52 ) )
        return;

    self notify( "threat_sight_force_visible_thread" );
    self endon( "threat_sight_force_visible_thread" );
    self endon( "death" );
    self._id_03E1._id_5E52 = 1;
    var_0 = 0.05;
    var_1 = 0;

    while ( isdefined( self._id_03E1._id_5E51 ) && self._id_03E1._id_5E51.size > 0 )
    {
        var_2 = gettime();
        var_3 = [];
        var_4 = getdvarfloat( "#x3b1758e8692735e30" ) * var_0;

        foreach ( var_8, var_6 in self._id_03E1._id_5E51 )
        {
            if ( var_2 < var_6._id_5264 && _func_011C( var_6._id_5449 ) && !self _meth_8066( var_6._id_5449 ) )
            {
                var_7 = self _meth_8514( var_6._id_5449 );

                if ( isplayer( var_6._id_5449 ) )
                    var_6._id_5449 thread _id_F14B( 1, max( var_6._id_5449._id_03E1._id_9C98, var_7 ) );

                if ( var_7 + var_4 < getdvarfloat( "#x3f9279508b424e95c" ) )
                {
                    var_7 = var_7 + var_4;
                    self _meth_8515( var_6._id_5449, var_7 );

                    if ( getdvarfloat( "#x3f9279508b424e95c" ) >= 1.0 && var_7 >= 1.0 && !var_1 )
                    {
                        self _meth_8522( "sight", var_6._id_5449, var_6._id_5449.origin );
                        var_1 = 1;
                    }
                    else if ( var_7 < 0.75 && var_1 )
                        var_1 = 0;
                }

                continue;
            }

            var_3[var_3.size] = var_8;
        }

        foreach ( var_8 in var_3 )
            self._id_03E1._id_5E51[var_8] = undefined;

        wait( var_0 );
    }

    self._id_03E1._id_5E51 = undefined;
    self._id_03E1._id_5E52 = undefined;
}

_id_F149()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "threat_sight_disabled" );
    var_0 = 0;

    for (;;)
    {
        var_1 = 0;
        var_2 = 0;
        self._id_03E1._id_9C98 = 0.0;
        self._id_03E1._id_9C38 = -1;
        var_3 = self geteye();
        var_4 = cos( 75 );

        foreach ( var_11, var_6 in self._id_03E1._id_F13F )
        {
            if ( !isalive( var_6 ) )
                continue;

            var_7 = var_6 getentitynumber();
            self._id_03E1._id_9C38 = max( self._id_03E1._id_9C38, var_6._id_0038 );

            if ( getdvarint( "ai_threatsight", 1 ) )
            {
                if ( var_6 [[ var_6._id_5D78 ]]() )
                    continue;

                var_8 = var_6 _meth_8514( self );
                var_9 = var_6 _meth_8066( self );

                if ( var_9 )
                    var_0 = gettime();

                if ( var_9 && isplayer( self ) && var_8 > 0.09 && _id_B507( var_6 ) )
                {
                    var_6 _meth_8522( "sight", self, self.origin );
                    var_1 = 1;
                }
                else if ( var_8 >= 1.0 )
                {
                    if ( !isdefined( self._id_03E1._id_F157[var_7] ) )
                        var_6 thread _id_F151( self );

                    var_1 = 1;
                }

                var_10 = self._id_03E1._id_9C98;
                self._id_03E1._id_9C98 = max( self._id_03E1._id_9C98, var_6 _meth_8514( self ) );

                if ( self._id_03E1._id_9C98 > 0.05 )
                {
                    if ( !isdefined( self._id_03E1._id_9C99 ) || self._id_03E1._id_9C98 != var_10 )
                        self._id_03E1._id_9C99 = var_6;
                }
            }

            if ( var_6._id_0037 == "combat" || !var_6._id_0465 )
                var_2 = 1;
        }

        var_12 = !var_2 && var_0 > 0 && gettime() - var_0 < 250;

        if ( getdvarfloat( "ai_threatsightFakeThreat" ) <= 0.0 )
            thread _id_F14B( var_12, self._id_03E1._id_9C98 );

        self._id_03E1._id_F15B = var_12;
        wait 0.05;
    }
}

_id_B507( var_0 )
{
    return self issprinting() && scripts\engine\utility::_id_10E74( self.origin, self.angles, var_0.origin, cos( 20 ) );
}

_id_F143( var_0, var_1 )
{
    self notify( "threat_sight_fake" );
    self endon( "threat_sight_fake" );
    setsaveddvar( "ai_threatsightFakeThreat", var_1 );
    setsaveddvar( "ai_threatsightFakeX", var_0[0] );
    setsaveddvar( "ai_threatsightFakeY", var_0[1] );
    setsaveddvar( "ai_threatsightFakeZ", var_0[2] );

    if ( !isdefined( self._id_03E1._id_9C98 ) )
        self._id_03E1._id_9C98 = 0;

    while ( var_1 > 0 )
    {
        thread _id_F14B( 1, max( self._id_03E1._id_9C98, var_1 ) );
        wait 0.05;
    }

    thread _id_F14B( 0, max( self._id_03E1._id_9C98, var_1 ) );
}

_id_F14B( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_03E1 ) && isdefined( level._id_03E1._id_5DAB ) )
        self thread [[ level._id_03E1._id_5DAB ]]( var_0, var_1, var_2 );
}
