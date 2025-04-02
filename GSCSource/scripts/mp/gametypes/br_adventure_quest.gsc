// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "#x36c248a0d76ee1217", 0 );
    level._id_2A83 = getdvarint( "#x36c248a0d76ee1217", 0 ) != 0;

    if ( !istrue( level._id_2A83 ) )
        return;

    level._id_2A84 = scripts\engine\utility::_id_6D7C( "quest_stash_location", "targetname" );

    if ( level._id_2A84.size < 0 )
        level._id_2A83 = 0;
}

_id_C51C( var_0 )
{
    level._id_2A84 = scripts\engine\utility::array_remove( level._id_2A84, var_0 );
}

_id_EDD0( var_0 )
{
    if ( !istrue( level._id_2A83 ) )
    {
        self iprintlnbold( "Item is disabled" );
        return;
    }

    var_1 = _id_4890();
    _id_E383( var_1 );
}

_id_4890()
{
    if ( !isdefined( level._id_2A84 ) )
        level._id_2A84 = scripts\engine\utility::_id_6D7C( "quest_stash_location", "targetname" );

    return scripts\engine\utility::random( level._id_2A84 );
}

_id_E383( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "com_plasticcase_beige_big_iw6" );
    var_1 makeuseable();
    var_1 setcursorhint( "HINT_NOICON" );
    var_1 setuseholdduration( "duration_medium" );
    var_1 _meth_857F( 1 );
    var_1 sethintdisplayfov( 360 );
    var_1 setusefov( 360 );
    var_1 setuserange( 150 );
    var_1 sethintstring( &"MP_BR_USE_PLUNDER_CACHE" );
    var_1 _meth_85A2();
    var_1 hide();
    var_2 = ( var_0.origin[0], var_0.origin[1], 1000 );
    var_2 = var_2 + scripts\engine\math::_id_BFE2() * randomintrange( 100, 900 );
    var_1._id_CF9F = spawn( "script_model", var_2 );
    self setclientomnvar( "ui_br_adventure_search_area", var_1._id_CF9F );
    var_1 thread _id_E740();
    _id_111E( self, var_1 );
    _id_0A70::_id_D5DD( 37, undefined, 5 );
    var_3 = _id_07D0::_id_C56F( 1 );
    var_1._id_A8C7 = var_3;

    if ( var_3 != -1 )
    {
        _id_07D0::_id_A854( var_3, "active", ( 0, 0, 0 ) );
        _id_07D0::_id_FB94( var_3, var_1._id_CF9F.origin );
        _id_07D0::_id_FB9B( var_3, "active" );
        _id_07D0::_id_FB8C( var_3, "ui_mp_br_mapmenu_icon_atm" );
        _id_07D0::_id_FB95( var_3, 1 );
        _id_07D0::_id_A88C( var_3 );
    }

    var_1 _id_E73F( self.team );
    var_4 = "ammo_crate_use";
    self playlocalsound( var_4 );
}

_id_E73F( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2.team == var_0 )
        {
            self _meth_80E0( var_2 );
            _id_07D0::_id_A88A( self._id_A8C7, var_2 );
            self showtoplayer( var_2 );
            continue;
        }

        _id_E73E( var_2 );
    }
}

_id_E73E( var_0 )
{
    self disableplayeruse( var_0 );
    self _meth_81AE( var_0 );
    _id_07D0::_id_A88B( self._id_A8C7, var_0 );
}

_id_E740()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread _id_FED4( var_0 );
    }
}

_id_702B()
{
    level endon( "game_ended" );
    level endon( "end_sonar_think" );
    var_0 = "breach_warning_beep_04";

    for (;;)
    {
        wait 0.1;

        foreach ( var_6, var_2 in level._id_2A8E )
        {
            level._id_2A8E[var_6]--;

            if ( var_2 <= 0 )
            {
                var_3 = level._id_2A74[var_6];
                var_4 = var_3._id_E019._id_CF9F;
                var_5 = distance2d( var_3.origin, var_4.origin );

                if ( var_5 < 1500 )
                {
                    if ( !isdefined( var_3._id_5B8A ) )
                    {
                        var_3 _id_0A70::_id_D5DD( 38, undefined, 5 );
                        var_3._id_5B8A = 1;
                    }

                    var_3 playlocalsound( var_0 );
                }

                level._id_2A8E[var_6] = _id_2ED4( var_3 );
            }
        }
    }
}

_id_111E( var_0, var_1 )
{
    var_0._id_E019 = var_1;

    if ( !isdefined( level._id_2A8E ) )
    {
        level._id_2A8E = [];
        level._id_2A74 = [];
        level._id_2A8E[var_0._id_723F] = _id_2ED4( var_0 );
        level._id_2A74[var_0._id_723F] = var_0;
        level thread _id_702B();
    }
    else
    {
        level._id_2A74[var_0._id_723F] = var_0;
        level._id_2A8E[var_0._id_723F] = _id_2ED4( var_0 );
    }
}

_id_C526( var_0 )
{
    if ( !isdefined( level._id_2A8E ) )
        return;

    level._id_2A8E = scripts\engine\utility::_id_1B9E( level._id_2A8E, var_0._id_723F );

    if ( level._id_2A8E.size == 0 )
    {
        level notify( "end_sonar_think" );
        level._id_2A8E = undefined;
        level._id_2A74 = undefined;
    }
}

_id_2ED4( var_0 )
{
    var_1 = var_0._id_E019;
    var_2 = distance2d( var_0.origin, var_1.origin );
    var_2 = clamp( var_2 / 75, 2, 15 );
    return int( var_2 );
}

_id_FED4( var_0 )
{
    _id_C526( var_0 );
    self hide();
    self makeunusable();
    self.origin = self.origin + ( 0, 0, -500 );
    var_0 _id_0A70::_id_D5DD( 39, undefined, 5 );
    _id_07D0::_id_C78C( self._id_A8C7 );
    self delete();
}
