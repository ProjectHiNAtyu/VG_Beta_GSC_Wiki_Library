// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_5877 = "hud_icon_head_equipment_friendly";
    level._id_5876 = "hud_icon_head_equipment_enemy";
    level._id_0F1B = [];
}

_id_D58E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    level endon( "game_ended" );

    if ( isdefined( var_6 ) )
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_6 );

    if ( !isdefined( self ) )
        return;

    var_11 = _id_D585( undefined, var_9 );
    _func_0350( var_11, var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 30;

    _func_0358( var_11, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    _func_0357( var_11, var_3 );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    _func_0355( var_11, var_4 );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    _func_0354( var_11, var_5 );

    if ( _func_0106( var_0 ) )
    {
        foreach ( var_13 in var_0 )
        {
            if ( isplayer( var_13 ) )
            {
                _func_0359( var_11, var_13 );
                continue;
            }

            if ( isdefined( var_13 ) && _id_8A78( var_13 ) )
                _func_035A( var_11, var_13 );
        }
    }
    else if ( isplayer( var_0 ) )
        _func_0359( var_11, var_0 );
    else if ( isdefined( var_0 ) && _id_8A78( var_0 ) )
        _func_035A( var_11, var_0 );

    if ( !istrue( var_7 ) )
        thread _id_D58F( var_11 );

    if ( istrue( var_8 ) )
        _func_0356( var_11, 1 );

    if ( istrue( var_10 ) )
        _func_0423( var_11, 1 );

    return var_11;
}

_id_D58B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    level endon( "game_ended" );

    if ( isdefined( var_8 ) )
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_8 );

    if ( !isdefined( self ) )
        return;

    var_13 = _id_D585( undefined, var_11 );

    if ( isdefined( var_1 ) )
        _func_0351( var_13, var_1 );

    if ( isdefined( var_2 ) )
        _func_0353( var_13, var_2 );

    if ( isdefined( var_3 ) )
        _func_0352( var_13, var_3 );

    if ( !isplayer( self ) )
    {
        if ( !isdefined( self.owner ) && !isdefined( self.team ) )
        {
            _id_D586( var_13 );
            return;
        }

        if ( isdefined( self.owner ) )
            _func_0360( var_13, self.owner );

        if ( level.teambased && isdefined( self.team ) )
            _func_035F( var_13, self.team );
    }

    if ( !isdefined( var_4 ) )
        var_4 = 30;

    _func_0358( var_13, var_4 );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    _func_0357( var_13, var_5 );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    _func_0355( var_13, var_6 );

    if ( !isdefined( var_7 ) )
        var_7 = 0;

    _func_0354( var_13, var_7 );

    if ( _func_0106( var_0 ) )
    {
        foreach ( var_15 in var_0 )
        {
            if ( isplayer( var_15 ) )
            {
                _func_0359( var_13, var_15 );
                continue;
            }

            if ( isdefined( var_15 ) && _id_8A78( var_15 ) )
                _func_035A( var_13, var_15 );
        }
    }
    else if ( isplayer( var_0 ) )
        _func_0359( var_13, var_0 );
    else if ( isdefined( var_0 ) && _id_8A78( var_0 ) )
        _func_035A( var_13, var_0 );

    if ( !istrue( var_9 ) )
        thread _id_D58F( var_13 );

    if ( istrue( var_10 ) )
        _func_0356( var_13, 1 );

    if ( istrue( var_12 ) )
        _func_0423( var_13, 1 );

    return var_13;
}

_id_D587( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( scripts\cp_mp\utility\game_utility::_id_89D2() )
        return;

    level endon( "game_ended" );

    if ( isdefined( var_5 ) )
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_5 );

    if ( !isdefined( self ) )
        return;

    var_10 = _id_D585( undefined, var_8 );
    var_11 = spawnstruct();
    var_11._id_7C20 = var_10;
    var_11._id_54F6 = self.owner;
    var_11._id_DCF2 = var_0;
    var_11._id_AD94 = var_7;

    if ( !isdefined( var_1 ) )
        var_1 = 30;

    _func_0358( var_11._id_7C20, var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    _func_0357( var_11._id_7C20, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = 768;

    _func_0355( var_11._id_7C20, var_3 );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    _func_0354( var_11._id_7C20, var_4 );

    if ( !istrue( var_6 ) )
        thread _id_D58F( var_11._id_7C20 );

    if ( istrue( var_9 ) )
        _func_0423( var_10, 1 );

    _id_0D82( var_11 );
    thread _id_D592( var_11 );
    var_12 = getdvarint( "scr_headIcon_teamSwitch", 1 );

    if ( var_12 )
        thread _id_D593( var_11 );

    return var_11._id_7C20;
}

_id_0D82( var_0 )
{
    self notify( "_updateIconOwner()" );

    if ( istrue( var_0._id_DCF2 ) )
    {
        _func_0351( var_0._id_7C20, level._id_5877 );
        _func_0353( var_0._id_7C20, level._id_5876 );
        _func_0352( var_0._id_7C20, level._id_5876 );

        if ( !isplayer( self ) )
        {
            if ( !isdefined( self.owner ) && !isdefined( self.team ) )
            {
                _id_D586( var_0._id_7C20 );
                return;
            }

            if ( isdefined( self.owner ) )
                _func_0360( var_0._id_7C20, self.owner );

            if ( level.teambased && isdefined( self.team ) )
                _func_035F( var_0._id_7C20, self.team );
        }
    }
    else
    {
        var_1 = level._id_5877;
        _func_0350( var_0._id_7C20, var_1 );
    }

    foreach ( var_3 in level.players )
        _func_035B( var_0._id_7C20, var_3 );

    if ( istrue( var_0._id_DCF2 ) )
    {
        foreach ( var_3 in level.players )
        {
            if ( !isdefined( var_3 ) )
                continue;

            _func_0359( var_0._id_7C20, var_3 );
        }

        thread _id_D590( var_0._id_7C20 );
    }
    else
    {
        if ( !isdefined( self.owner ) )
        {
            _id_D586( var_0._id_7C20 );
            return;
        }

        foreach ( var_3 in level.players )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( level.teambased && var_3.team != self.owner.team )
                continue;

            if ( !level.teambased && var_3 != self.owner )
                continue;

            if ( istrue( var_0._id_AD94 ) && var_3 == self.owner )
                continue;

            _func_0359( var_0._id_7C20, var_3 );
        }
    }
}

_id_D590( var_0 )
{
    self endon( "death" );
    self endon( "_updateIconOwner()" );

    if ( isplayer( self ) )
        self endon( "disconnect" );

    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        thread _id_D591( var_0, var_1 );
    }
}

_id_D591( var_0, var_1 )
{
    self endon( "death" );
    self endon( "_updateIconOwner()" );

    if ( isplayer( self ) )
        self endon( "disconnect" );

    level endon( "game_ended" );

    for (;;)
    {
        var_1 waittill( "spawned_player" );
        _func_0359( var_0, var_1 );
    }
}

_id_D592( var_0 )
{
    self endon( "death" );

    if ( isplayer( self ) )
        self endon( "disconnect" );

    level endon( "game_ended" );

    for (;;)
    {
        if ( var_0._id_54F6 != self.owner )
        {
            var_0._id_54F6 = self.owner;
            _id_0D82( var_0 );
        }

        wait 0.1;
    }
}

_id_D593( var_0 )
{
    level endon( "game_ended" );
    self endon( "headicon_deleted" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "add_to_team", var_1 );
        _func_035B( var_0._id_7C20, var_1 );

        if ( istrue( var_0._id_DCF2 ) )
        {
            _func_0359( var_0._id_7C20, var_1 );
            continue;
        }

        if ( !isdefined( self.owner ) )
        {
            _id_D586( var_0._id_7C20 );
            return;
        }

        if ( var_1.team != self.owner.team )
            continue;

        _func_0359( var_0._id_7C20, var_1 );
    }
}

_id_D58F( var_0 )
{
    level endon( "game_ended" );
    self endon( "headicon_deleted" );
    self waittill( "death_or_disconnect" );
    _id_D586( var_0 );
}

_id_8A78( var_0 )
{
    if ( var_0 == "spectator" || var_0 == "follower" )
        return 1;

    foreach ( var_2 in level._id_EF86 )
    {
        if ( var_0 == var_2 )
            return 1;
    }

    return 0;
}

_id_D585( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !_id_D584() )
        _id_D58D( var_0 );

    var_2 = undefined;

    if ( isdefined( var_1 ) )
        var_2 = _func_0422( var_1 );
    else
        var_2 = _func_034E( self );

    if ( !isdefined( var_2 ) || var_2 < 0 )
        return;

    var_4 = spawnstruct();
    var_4._id_7C20 = var_2;
    var_4._id_54F2 = self;
    var_4._id_BD1E = var_0;
    var_4._id_F206 = gettime();
    level._id_0F1B[var_4._id_7C20] = var_4;
    return var_4._id_7C20;
}

_id_D586( var_0 )
{
    var_1 = _id_D58A( var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1._id_54F2 ) )
            var_1._id_54F2 notify( "headicon_deleted" );

        _func_034F( var_1._id_7C20 );
        level._id_0F1B[var_1._id_7C20] = undefined;
    }
}

_id_D584()
{
    return level._id_0F1B.size < 1023;
}

_id_D58A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( level._id_0F1B[var_0] ) )
        return;

    return level._id_0F1B[var_0];
}

_id_D58D( var_0 )
{
    var_1 = _id_D588( var_0 );
    var_2 = _id_D589( var_1 );
    _id_D586( var_2 );
}

_id_D588( var_0 )
{
    var_1 = var_0;

    foreach ( var_3 in level._id_0F1B )
    {
        if ( var_1 > var_3._id_BD1E )
            var_1 = var_3._id_BD1E;
    }

    return var_1;
}

_id_D589( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in level._id_0F1B )
    {
        if ( !isdefined( var_1 ) && !isdefined( var_2 ) || var_1._id_F206 > var_4._id_F206 )
        {
            var_1 = var_4;
            var_2 = var_4._id_7C20;
        }
    }

    return var_2;
}

_id_D583( var_0, var_1 )
{
    var_2 = _id_D58A( var_0 );

    if ( isdefined( var_2 ) )
        _func_0359( var_0, var_1 );
}

_id_D58C( var_0, var_1 )
{
    var_2 = _id_D58A( var_0 );

    if ( isdefined( var_2 ) )
        _func_035B( var_0, var_1 );
}
