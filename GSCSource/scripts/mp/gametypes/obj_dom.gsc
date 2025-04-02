// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_D88B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0.target ) )
    {
        if ( !isdefined( var_0._id_1042E ) )
            var_5[0] = getent( var_0.target, "targetname" );
        else
            var_5 = var_0._id_1042E;
    }
    else
    {
        var_5[0] = spawn( "script_model", var_0.origin );
        var_5[0].angles = var_0.angles;
    }

    if ( !isdefined( level._id_5C1B ) )
        level._id_5C1B = _id_0A66::_id_507A( "flagCaptureTime", 10, 0, 30 );

    if ( isdefined( var_0._id_A8CE ) )
        var_6 = var_0._id_A8CE;
    else
        var_6 = var_0._id_CD8C;

    if ( isdefined( var_0._id_7C58 ) )
        var_7 = var_0._id_7C58;
    else
        var_7 = var_0._id_CD8C;

    if ( istrue( var_2 ) )
        var_8 = _id_6CCE( var_6 );
    else
        var_8 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = "neutral";

    var_9 = _id_07AD::_id_404C( var_1, var_0, var_5, ( 0, 0, 100 ), var_8, var_3, var_4 );
    var_9 _id_07AD::_id_15B7( "enemy" );
    var_9 _id_07AD::_id_3144( 1 );
    var_9 _id_07AD::_id_D8C7( level._id_5C1B );

    if ( isdefined( level._id_3210 ) )
        var_9 _id_07AD::_id_D4A5( _id_692E() );

    var_9._id_A8CE = var_6;
    var_9._id_7C58 = var_7;

    if ( !istrue( var_3 ) )
    {
        var_9 _id_07AD::_id_D8D5( "any" );
        var_9._id_ABB8 = ::_id_4D2F;
        var_9._id_AA66 = ::_id_4D30;
        var_9._id_ABC1 = ::_id_4D32;
        var_9._id_AAAF = ::_id_4D31;
        var_9._id_AA7A = ::_id_4D27;
        var_9._id_ABB4 = ::_id_4D2C;
        var_9._id_ABB5 = ::_id_4D2D;
        var_9._id_AB41 = ::_id_4D2B;
        var_9._id_ABB6 = ::_id_4D2E;
        var_9._id_E86B = ::_id_4D35;
    }

    var_9._id_A6B1 = 1;
    var_9._id_7C71 = "domFlag";
    var_9._id_37CF = level._id_5C1B * 1000;
    var_9._id_5BA6 = 1;
    var_9 _id_07AD::_id_B0D4();
    var_10 = var_5[0].origin + ( 0, 0, 32 );
    var_11 = var_5[0].origin + ( 0, 0, -32 );
    var_12 = scripts\engine\trace::_id_3EC3( 1, 1, 1, 1, 0, 1, 1 );
    var_13 = [];
    var_14 = scripts\engine\trace::ray_trace( var_10, var_11, var_13, var_12 );
    var_15 = _id_3504( var_9 );
    var_9._id_228F = var_14["position"] + var_15;
    var_16 = vectortoangles( var_14["normal"] );
    var_17 = _id_3503( var_9, var_16 );
    var_9._id_228E = anglestoforward( var_17 );
    var_18 = spawn( "script_model", var_9._id_228F );
    var_18 setmodel( "dom_flag_scriptable" );
    var_18.angles = _func_0305( var_9._id_228E, var_18.angles );
    var_9._id_0383 = var_18;
    var_9._id_103BD = "";
    var_9._id_A5C2 = 1;

    if ( istrue( level._id_A2E9 ) )
        var_9._id_A5C2 = 1;

    var_9._id_5C1F = spawn( "script_model", var_9._id_228F );
    var_9._id_5C1F setmodel( "gen_flag_dom" );
    var_9._id_5C1F hide();
    var_9.friendlyflagmodel = spawn( "script_model", var_9._id_228F );
    var_9.friendlyflagmodel setmodel( "gen_flag_dom" );
    var_9 thread flagmodelcoreloop( var_9.friendlyflagmodel, "allies" );
    var_9.enemyflagmodel = spawn( "script_model", var_9._id_228F );
    var_9.enemyflagmodel setmodel( "gen_flag_dom" );
    var_9 thread flagmodelcoreloop( var_9.enemyflagmodel, "axis" );
    var_9._id_ACC3 = var_9._id_5C1F;
    var_9 _id_81CA();

    if ( !istrue( var_3 ) )
        var_9 _id_4D07();

    return var_9;
}

flagmodelcoreloop( var_0, var_1 )
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( flagupdatecolor( var_0, var_1 ) == 0 )
            break;

        scripts\engine\utility::_id_108F3( "updateFlagState", 0.5 );
    }
}

flagupdatecolor( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_0 hide();
    var_2 = _id_07AD::_id_6BE3();

    if ( var_2 == var_1 )
        var_0 setmodel( "gen_flag_dom_blue" );
    else if ( var_2 != "neutral" )
        var_0 setmodel( "gen_flag_dom_red" );
    else
        var_0 setmodel( "gen_flag_dom" );

    foreach ( var_4 in level.players )
    {
        if ( var_4.team == var_1 )
            var_0 showtoplayer( var_4 );
    }

    return 1;
}

_id_C4E4( var_0 )
{
    if ( isdefined( var_0._id_5C1F ) )
        var_0._id_5C1F delete();

    if ( isdefined( var_0.enemyflagmodel ) )
        var_0.enemyflagmodel delete();

    if ( isdefined( var_0.friendlyflagmodel ) )
        var_0.friendlyflagmodel delete();

    if ( isdefined( var_0._id_0383 ) )
        var_0._id_0383 delete();

    var_0 _id_07AD::_id_477C();
}

_id_6CCE( var_0 )
{
    if ( var_0 == "_a" )
        var_1 = 0;
    else if ( var_0 == "_b" )
        var_1 = 1;
    else if ( var_0 == "_d" )
        var_1 = 3;
    else if ( var_0 == "_e" )
        var_1 = 4;
    else
        var_1 = 2;

    return var_1;
}

_id_692E()
{
    var_0 = "normal";

    if ( level._id_3210 == 2 )
        var_0 = "neutralize";
    else if ( level._id_3210 == 3 )
        var_0 = "persistent";

    return var_0;
}

_id_3504( var_0 )
{
    var_1 = var_0._id_A8CE;
    var_2 = ( 0, 0, 0 );

    if ( level.mapname == "mp_quarry" )
    {
        if ( var_1 == "_c" )
            var_2 = var_2 + ( 0, 0, 7 );
    }

    if ( level.mapname == "mp_divide" )
    {
        if ( var_1 == "_a" )
            var_2 = var_2 + ( 0, 0, 4.5 );
    }

    if ( level.mapname == "mp_afghan" )
    {
        if ( var_1 == "_a" )
            var_2 = var_2 + ( 0, 0, 5 );

        if ( var_1 == "_c" )
            var_2 = var_2 + ( 0, 0, 1 );
    }

    return var_2;
}

_id_3503( var_0, var_1 )
{
    var_2 = var_0._id_A8CE;
    var_3 = var_1;

    if ( level.mapname == "mp_quarry" )
    {
        if ( var_2 == "_c" )
            var_3 = ( 276.5, var_3[1], var_3[2] );
    }

    if ( level.mapname == "mp_divide" )
    {
        if ( var_2 == "_a" )
            var_3 = ( 273.5, var_3[1], var_3[2] );
    }

    if ( level.mapname == "mp_afghan" )
    {
        if ( var_2 == "_a" )
            var_3 = ( 273.5, 200.5, var_3[2] );

        if ( var_2 == "_c" )
            var_3 = ( 273.5, var_3[1], var_3[2] );
    }

    if ( level.mapname == "mp_faridah" )
    {
        if ( _func_0120( var_2 ) )
        {
            if ( var_2 == "_school" )
                var_3 = ( 270, 0, 0 );
            else if ( var_2 == "_warehouse" )
                var_3 = ( 270, 0, 0 );
        }
    }

    return var_3;
}

_id_81CA()
{
    if ( isdefined( level._id_9BC3 ) )
    {
        self._id_9785 = [[ level._id_9BBA ]]();
        var_0 = "A";

        switch ( self._id_A8CE )
        {
            case "_a":
                var_0 = "A";
                break;
            case "_b":
                var_0 = "B";
                break;
            case "_c":
                var_0 = "C";
                break;
            case "_d":
                var_0 = "D";
                break;
            case "_e":
                var_0 = "E";
                break;
            case "0":
                var_0 = "0";
                break;
            case "1":
                var_0 = "1";
                break;
            case "2":
                var_0 = "2";
                break;
            case "3":
                var_0 = "3";
                break;
            case "4":
                var_0 = "4";
                break;
            default:
                break;
        }

        self._id_977A = "FLAG_" + var_0;
    }

    if ( _id_0780::_id_1740() )
    {
        self._id_1741 = _id_0780::_id_6E07();
        self._id_1742 = "dom_flag" + self._id_A8CE;
    }
}

_id_4D07( var_0 )
{
    self notify( "flag_neutral" );
    _id_07AD::_id_D60F( level._id_7C59 );
    _id_07AD::_id_D62D( "neutral" );
    thread _id_FC61( "idle", istrue( var_0 ) );

    if ( isdefined( level._id_9BC3 ) && isdefined( self._id_9785 ) && isdefined( self._id_977A ) )
        [[ level._id_9BC3 ]]( self._id_9785, undefined, self._id_977A, self._id_1042E[0].origin[0], self._id_1042E[0].origin[1], gettime(), 0 );

    _id_0780::_id_9753( self._id_1742, self._id_1741, self._id_1042E[0].origin, -1, "neutral" );
}

_id_4D33( var_0, var_1 )
{
    _id_07AD::_id_D62D( var_0 );
    self notify( "capture", var_1 );
    self notify( "assault", var_1 );

    if ( istrue( level._id_A76F ) )
    {
        var_2 = _id_6DB0( var_0 );

        if ( var_2 >= level._id_A76F )
            level._id_EFA2[var_0] = 1;
        else
            level._id_EFA2[var_0] = 0;
    }

    _id_07AD::_id_D60F( level._id_7C35, level._id_7C27 );

    if ( scripts\mp\utility\game::getgametype() == "btm" )
        level thread scripts\mp\hud_message::_id_FCBD( self._id_AD9B, 15, 14 );

    if ( scripts\mp\utility\game::getgametype() == "base" )
    {
        var_3 = _func_00CA( "build_scriptable", "script_noteworthy", self.origin, 3000 );

        foreach ( var_5 in var_3 )
        {
            var_5.team = var_0;

            if ( var_5.classname == scripts\mp\gametypes\base::_id_2293() )
                scripts\mp\gametypes\base::_id_FC7C( var_5 );
        }
    }

    self._id_A422 = 0;
    thread _id_FC61( var_0, 0, var_0 );

    if ( self._id_F393[var_0].size == 0 && isdefined( self._id_AA29 ) )
        self._id_F393 = self._id_AA29;

    foreach ( var_8 in level._id_EF86 )
    {
        if ( isdefined( self._id_1D06[var_8] ) && var_8 != var_0 )
            self._id_1D06[var_8] = [];
    }

    if ( isdefined( self._id_1D06[var_0] ) )
    {
        var_10 = getarraykeys( self._id_1D06[var_0] );

        foreach ( var_12 in var_10 )
        {
            var_13 = self._id_1D06[var_0][var_12].player;

            if ( isdefined( var_13.owner ) )
                var_13 = var_13.owner;

            if ( !isplayer( var_13 ) )
                continue;

            var_13 _id_0793::_id_AA6E();
        }
    }

    thread _id_6F7D( self._id_F393[var_0], var_1, var_0 );

    if ( isdefined( level._id_9BC3 ) )
        [[ level._id_9BC3 ]]( self._id_9785, undefined, self._id_977A, self._id_1042E[0].origin[0], self._id_1042E[0].origin[1], gettime(), scripts\engine\utility::ter_op( var_0 == "allies", 1, 2 ) );

    _id_0780::_id_9753( self._id_1742, self._id_1741, self._id_1042E[0].origin, -1, "captured_" + var_0 );
}

_id_4D2F( var_0 )
{
    var_1 = var_0.team;
    var_2 = _id_07AD::_id_6BE3();
    _id_07D0::_id_A8A1( self._id_A8F5, 0 );
    _id_07D0::_id_A8B1( self._id_A8F5, 0 );
    self._id_320F = gettime();
    self._id_A422 = 0;

    if ( istrue( level._id_5C21 ) )
    {
        var_3 = _id_07AD::_id_6BE3();

        if ( var_3 == "neutral" )
            _id_4D33( var_1, var_0 );
        else
        {
            thread _id_4D07( 1 );
            _id_0A79::_id_B8DE( "mp_dom_flag_lost", var_3 );
            level._id_8F8A = gettime();
            thread _id_6F7B( self._id_F393[var_1] );
            self._id_A422 = 1;
        }
    }
    else
        _id_4D33( var_1, var_0 );

    if ( !self._id_A422 )
    {
        var_4 = 3;

        if ( self._id_A8CE == "_a" )
            var_4 = 1;
        else if ( self._id_A8CE == "_b" )
            var_4 = 2;
        else if ( self._id_A8CE == "_d" )
            var_4 = 4;
        else if ( self._id_A8CE == "_e" )
            var_4 = 5;
        else if ( self._id_A8CE == "_f" )
            var_4 = 6;
        else if ( self._id_A8CE == "_g" )
            var_4 = 7;

        scripts\mp\utility\game::_id_D5EE( 21, var_1, var_0 getentitynumber(), var_4 );

        if ( isdefined( level._id_AB2F ) )
            [[ level._id_AB2F ]]( "dompoint", self._id_A8CE, var_0, var_1, var_2, self );
    }

    self._id_5BA6 = 0;
}

_id_4D30( var_0 )
{
    var_1 = _id_07AD::_id_6BE3();
    self._id_A423 = istrue( level._id_5C21 ) && var_1 != "neutral";

    if ( self._id_A423 )
    {
        if ( var_1 != var_0.team )
            var_2 = _id_69CE();
        else
            var_2 = 0;
    }
    else if ( var_1 != var_0.team )
        var_2 = 1;
    else
        var_2 = 0;

    if ( scripts\mp\utility\game::getgametype() == "control" && var_1 != var_0.team )
    {
        self._id_5C1E = 1;
        scripts\mp\gamelogic::pausetimer();
    }

    var_0 setclientomnvar( "ui_objective_state", var_2 );

    if ( !isdefined( self._id_E773 ) )
        self._id_E773 = gettime();

    if ( !istrue( self._id_A422 ) && self._id_E773 > self._id_E773 + 5000 )
    {
        self._id_4959 = 0;
        self._id_E773 = gettime();
    }

    var_3 = scripts\engine\utility::ter_op( istrue( level._id_5C21 ) && !self._id_5BA6, level._id_5C1B * 0.5, level._id_5C1B );
    _id_07AD::_id_D8C7( var_3 );

    if ( var_3 > 0 )
    {
        self._id_BC44 = scripts\mp\utility\game::_id_6BC3( var_0.team )[0];
        _id_FC60( var_0.team );
        _id_07AD::_id_D60F( level._id_7C54, level._id_7C6C );
    }

    if ( istrue( level._id_78DC ) )
    {
        if ( var_0.team != var_1 )
            _id_07AD::_id_D8D5( "any" );
    }
}

_id_4D32( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_07AD::_id_6BE3();

    if ( var_1 < 1.0 && !level._id_609B && !scripts\mp\utility\game::_id_873A() )
        _id_B207( var_1, var_0 );

    if ( isdefined( level._id_320A ) )
    {
        var_5 = 0;

        for ( var_6 = 0; var_6 < level._id_320A; var_6++ )
        {
            if ( !isdefined( self._id_D023 ) )
                self._id_D023 = 0;

            var_7 = ( var_6 + 1 ) / 3;

            if ( var_1 > var_7 && self._id_D023 <= var_6 )
            {
                self._id_D023 = var_6 + 1;
                var_5 = 1;
            }
        }

        if ( var_5 )
        {
            foreach ( var_9 in self._id_F393[var_0] )
                var_9.player thread scripts\mp\rank::_id_CBF3( "segment_captured" );
        }
    }

    if ( var_1 > 0.05 && var_2 && !self._id_4959 )
    {
        if ( var_4 == "neutral" )
        {
            if ( level._id_5C1B > 0.05 )
            {
                _id_0A64::_id_E772( "securing" + self._id_A8CE, var_0 );

                if ( isdefined( level._id_A8D5 ) && level._id_A8D5.size == 5 && ( self._id_A8CE == "_c" || self._id_A8CE == "_d" ) || self._id_A8CE == "_b" )
                {
                    var_11 = scripts\mp\utility\game::_id_6BC3( var_0 )[0];
                    _id_0A64::_id_E772( "losing" + self._id_A8CE, var_11 );
                }
            }
        }
        else if ( level._id_5C1B > 0.05 )
        {
            _id_0A64::_id_E772( "losing" + self._id_A8CE, var_4 );
            _id_0A64::_id_E772( "securing" + self._id_A8CE, var_0 );
        }

        self._id_4959 = 1;
    }
}

_id_4D31( var_0, var_1, var_2 )
{
    if ( isplayer( var_1 ) )
    {
        var_1 setclientomnvar( "ui_objective_state", 0 );
        var_1._id_F90B = undefined;
    }

    var_3 = _id_07AD::_id_6BE3();

    if ( var_3 == "neutral" )
    {
        _id_07AD::_id_D60F( level._id_7C59 );
        thread _id_FC61( "idle", 0 );
    }
    else
    {
        _id_07AD::_id_D60F( level._id_7C30, level._id_7C27 );
        thread _id_FC61( var_3, 0 );
    }

    if ( !var_2 )
        self._id_A422 = 0;
}

_id_4D27()
{
    _id_07AD::_id_D60F( level._id_7C2D );
    _id_07D0::_id_A8A3( self._id_A8F5, undefined );
    thread _id_FC61( "contested", 0 );
}

_id_4D2C( var_0 )
{
    if ( istrue( level._id_5C21 ) && !self._id_5BA6 )
        _id_07AD::_id_D8C7( level._id_5C1B * 0.5 );

    var_1 = _id_07AD::_id_6BE3();

    if ( var_1 == "neutral" )
    {
        if ( var_0 != "none" )
            _id_07D0::_id_A8A3( self._id_A8F5, var_0 );
        else if ( isdefined( self._id_9017 ) )
            _id_07D0::_id_A8A3( self._id_A8F5, self._id_9017 );
    }
    else
        _id_07D0::_id_A8A3( self._id_A8F5, scripts\mp\utility\game::_id_6BC3( var_1 )[0] );

    if ( var_0 == "none" || var_1 == "neutral" )
    {
        _id_07AD::_id_D60F( level._id_7C59 );
        self._id_4959 = 0;
    }
    else
        _id_07AD::_id_D60F( level._id_7C30, level._id_7C27 );

    var_2 = scripts\engine\utility::ter_op( var_1 == "neutral", "idle", var_1 );
    thread _id_FC61( var_2, 0 );
}

_id_B207( var_0, var_1 )
{
    if ( !isdefined( self._id_9028 ) )
        self._id_9028 = gettime();

    if ( self._id_9028 + 995 < gettime() )
        self._id_9028 = gettime();
}

_id_4D2D()
{
    var_0 = _id_07AD::_id_6BE3();

    if ( var_0 == "neutral" )
        _id_07AD::_id_D60F( level._id_7C59 );
    else
        _id_07AD::_id_D60F( level._id_7C30, level._id_7C27 );

    if ( scripts\mp\utility\game::getgametype() == "control" )
    {
        self._id_5C1E = 0;
        scripts\mp\gamelogic::resumetimer();
    }

    self._id_4959 = 0;
}

_id_4D2B( var_0 )
{
    if ( self._id_AD9B != "neutral" && self._id_A787[self._id_AD9B] && !self._id_E578 )
        _id_07AD::_id_D60F( level._id_7C35, level._id_7C27 );
}

_id_4D2E( var_0 )
{
    if ( self._id_AD9B != "neutral" && !self._id_A787[self._id_AD9B] && !self._id_E578 )
        _id_07AD::_id_D60F( level._id_7C30, level._id_7C27 );
}

_id_4D35( var_0 )
{
    var_0 thread _id_0A76::_id_6FE6( "obj_prog_defend" );
    _id_07AD::_id_D60F( level._id_7C35, level._id_7C27 );
}

_id_D4E2( var_0 )
{
    if ( isdefined( level._id_EB96 ) && level._id_EB96 && isdefined( var_0._id_3E37 ) && var_0._id_3E37 )
        var_0 _id_0798::_id_D4E1( "assist" );
}

_id_4D34()
{
    game["flagmodels"] = [];
    game["flagmodels"]["neutral"] = "prop_flag_neutral";
}

_id_FC61( var_0, var_1, var_2 )
{
    self notify( "updateFlagState" );
    self endon( "updateFlagState" );

    if ( isdefined( self._id_A5C2 ) )
        return;

    while ( !isdefined( self._id_0383 ) )
        waitframe();

    if ( scripts\mp\utility\game::getgametype() == "defcon" )
        return;

    if ( scripts\mp\utility\game::getgametype() == "arm" )
        return;

    if ( isdefined( self._id_0383 ) )
    {
        if ( var_0 == "off" )
            _id_D522( "flag", var_0 );
        else
            _id_D522( "flag", var_0, self._id_103BD );

        if ( !istrue( var_1 ) )
            _id_D522( "pulse", "off" );
    }
}

_id_D522( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_0383 ) )
        return;

    if ( isdefined( level._id_D523 ) )
    {
        if ( [[ level._id_D523 ]]( var_0, var_1, var_2 ) )
            return;
    }

    if ( isdefined( var_2 ) )
        var_1 = var_1 + var_2;

    self._id_0383 setscriptablepartstate( var_0, var_1 );
}

_id_FC60( var_0 )
{
    if ( isdefined( self._id_A5C2 ) )
        return;

    if ( scripts\mp\utility\game::getgametype() != "arm" && scripts\mp\utility\game::getgametype() != "defcon" )
    {
        if ( isdefined( self._id_0383 ) )
            _id_D522( "pulse", var_0, self._id_103BD );
    }
}

_id_AAA3()
{
    self waittill( "disconnect" );

    foreach ( var_1 in self._id_0B9D )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();
    }

    foreach ( var_4 in self._id_0B9E )
    {
        if ( isdefined( var_4 ) )
            var_4 delete();
    }
}

_id_6F7B( var_0 )
{
    level endon( "game_ended" );
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_0[var_1[var_2]].player;

        if ( !isdefined( var_3 ) )
            continue;

        if ( isdefined( var_3.owner ) )
            var_3 = var_3.owner;

        if ( !isplayer( var_3 ) )
            continue;

        if ( istrue( level._id_5C21 ) )
            var_3 thread scripts\mp\rank::_id_CBF3( "neutralized" );
        else
            var_3 thread scripts\mp\rank::_id_CBF3( "capture" );

        var_3 thread _id_0788::_id_6F9C( "mode_dom_neutralized" );
        var_3 _id_D4E2( var_3 );
        wait 0.05;
    }
}

_id_6F7D( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_3 = var_1;

    if ( isdefined( var_3.owner ) )
        var_3 = var_3.owner;

    level._id_8F8A = gettime();
    level._id_B83C = 1;

    if ( isplayer( var_3 ) )
    {
        if ( scripts\mp\utility\game::getgametype() == "cmd" || scripts\mp\utility\game::getgametype() == "rush" )
            level thread scripts\mp\hud_util::_id_EF8A( "callout_securedposition", var_3 );
        else
            level thread scripts\mp\hud_util::_id_EF8A( "callout_securedposition" + self._id_A8CE, var_3 );

        var_3 thread scripts\common\utility::_id_F737( level._id_9B9C, "capture", var_3.origin );
    }

    if ( self._id_5BA6 == 1 )
        var_4 = 1;
    else
        var_4 = 0;

    if ( isdefined( var_0 ) )
    {
        var_5 = getarraykeys( var_0 );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            var_7 = var_0[var_5[var_6]].player;

            if ( isdefined( var_7.owner ) )
                var_7 = var_7.owner;

            if ( !isplayer( var_7 ) )
                continue;

            var_7 _id_D4A6();
            _id_6F6D( var_7, var_4, 0 );
            _id_D4E2( var_7 );
            wait 0.05;
        }

        if ( isdefined( self._id_1D06 ) )
        {
            if ( self._id_1D06[var_2].size > 0 )
            {
                var_8 = getarraykeys( self._id_1D06[var_2] );

                foreach ( var_10 in var_5 )
                {
                    foreach ( var_12 in var_8 )
                    {
                        if ( var_12 == var_10 )
                            self._id_1D06[var_2][var_12] = undefined;
                    }
                }
            }

            if ( self._id_1D06[var_2].size > 0 )
                thread _id_6F7C( var_2, var_4 );
        }
    }
}

_id_6F7C( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = getarraykeys( self._id_1D06[var_0] );

    if ( var_2.size > 0 )
    {
        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_4 = self._id_1D06[var_0][var_2[var_3]].player;

            if ( isdefined( var_4.owner ) )
                var_4 = var_4.owner;

            if ( !isplayer( var_4 ) )
                continue;

            var_4 _id_D4A6();
            _id_6F6D( var_4, var_1, 1 );
            _id_D4E2( var_4 );
            self._id_1D06[var_0][var_2[var_3]] = undefined;
            wait 0.05;
        }
    }
}

_id_6F6D( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = "";

    if ( var_2 )
    {
        var_0 thread scripts\mp\rank::_id_CBF3( "capture_assist" );
        var_4 = "mode_dom_secure_assist";
    }
    else if ( var_1 )
    {
        var_5 = scripts\mp\utility\game::getgametype() == "arm";
        var_6 = !var_5 && self._id_A8CE == "_b" || var_5 && self._id_A8CE == "_c";
        var_7 = var_5 && ( self._id_A8CE == "_b" || self._id_A8CE == "_d" );

        if ( var_6 )
        {
            if ( var_5 )
            {
                var_0 thread scripts\mp\rank::_id_CBF3( "neutral_capture" );
                var_4 = "mode_arm_secure_mid";
            }
            else
            {
                var_0 thread scripts\mp\rank::_id_CBF3( "neutral_b_capture" );
                var_4 = "mode_dom_secure_b";
            }
        }
        else if ( var_7 )
        {
            var_0 thread scripts\mp\rank::_id_CBF3( "neutral_capture" );
            var_4 = "mode_arm_secure_outer_mid";
        }
        else if ( var_5 )
        {
            var_0 thread scripts\mp\rank::_id_CBF3( "neutral_capture" );
            var_4 = "mode_arm_secure_outer";
        }
        else
        {
            var_0 thread scripts\mp\rank::_id_CBF3( "neutral_capture" );
            var_4 = "mode_dom_secure_neutral";
        }
    }
    else if ( istrue( level._id_5C21 ) )
    {
        var_0 thread scripts\mp\rank::_id_CBF3( "capture" );
        var_4 = "mode_dom_neutralized_cap";
    }
    else
    {
        var_0 thread scripts\mp\rank::_id_CBF3( "capture" );
        var_4 = "mode_dom_secure";
    }

    var_0 thread _id_0788::_id_6F9C( var_4 );

    if ( var_3 )
        var_0 scripts\mp\killstreaks\killstreaks::_id_6FD8( "capture", 1, 0 );
}

_id_D4A6()
{
    _id_0A7B::_id_7D93( "captures", 1 );

    if ( isdefined( self.pers["captures"] ) )
    {
        _id_07D5::_id_E76D( "round", "captures", self.pers["captures"] );

        if ( !scripts\mp\utility\game::_id_8744() )
            _id_0A7B::_id_D543( self.pers["captures"] );
    }
}

_id_BB60()
{
    _id_E9B9();
    var_0 = [];
    var_0[var_0.size] = level._id_336B;

    if ( game["switchedsides"] )
    {
        level._id_39C7 = _id_6E08( "axis", level._id_336B );
        var_0[var_0.size] = level._id_39C7;
        level._id_39C8 = _id_6E08( "allies", var_0 );
    }
    else
    {
        level._id_39C7 = _id_6E08( "allies", level._id_336B );
        var_0[var_0.size] = level._id_39C7;
        level._id_39C8 = _id_6E08( "axis", var_0 );
    }

    level._id_39C7 _id_D553( "allies", "neutral", undefined, 1 );
    level._id_39C8 _id_D553( "axis", "neutral", undefined, 1 );
}

_id_E9B9()
{
    var_0 = undefined;

    foreach ( var_2 in level._id_A8D5 )
    {
        if ( var_2._id_A8CE == "_b" )
            level._id_336B = var_2;
    }
}

_id_D553( var_0, var_1, var_2, var_3 )
{
    _id_07AD::_id_D62D( var_0 );
    _id_07AD::_id_D60F( level._id_7C35, level._id_7C27 );
    thread _id_FC61( var_0, 0 );
    self._id_320F = gettime();
    var_4 = scripts\mp\utility\game::getgametype();

    if ( var_4 == "siege" )
        scripts\mp\gametypes\siege::_id_10AE7( var_0 );

    if ( !isdefined( var_3 ) )
    {
        if ( var_1 != "neutral" )
        {
            var_5 = _id_6DB0( var_0 );

            if ( var_5 == 2 )
            {
                _id_0A64::_id_E772( "friendly_captured_2", var_0 );
                _id_0A64::_id_E772( "enemy_captured_2", var_1 );
            }
            else
            {
                _id_0A64::_id_E772( "secured" + self._id_A8CE, var_0 );
                _id_0A64::_id_E772( "lost" + self._id_A8CE, var_1 );
            }

            level._id_8F8A = gettime();
        }

        if ( var_4 == "siege" )
            scripts\mp\gametypes\siege::_id_EF99( var_0, var_2 );

        self._id_5BA6 = 0;
    }
}

_id_6DB0( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_A8D5 )
    {
        if ( var_3._id_AD9B == var_0 )
            var_1++;
    }

    return var_1;
}

_id_8846( var_0, var_1 )
{
    var_2 = 0;

    if ( _func_0106( var_1 ) )
    {
        foreach ( var_4 in var_1 )
        {
            if ( var_0 == var_4 )
            {
                var_2 = 1;
                break;
            }
        }
    }
    else if ( var_0 == var_1 )
        var_2 = 1;

    return var_2;
}

_id_6E08( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;

    foreach ( var_6 in level._id_A8D5 )
    {
        if ( var_6 _id_07AD::_id_6BE3() != "neutral" )
            continue;

        var_7 = distancesquared( var_6._id_047A.origin, level._id_03DE[var_0] );

        if ( isdefined( var_1 ) )
        {
            if ( !_id_8846( var_6, var_1 ) && ( !isdefined( var_2 ) || var_7 < var_3 ) )
            {
                var_3 = var_7;
                var_2 = var_6;
            }

            continue;
        }

        if ( !isdefined( var_2 ) || var_7 < var_3 )
        {
            var_3 = var_7;
            var_2 = var_6;
        }
    }

    return var_2;
}

_id_1F9E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = 0;
    var_11 = 0;
    var_12 = 0;
    var_13 = self;
    var_14 = var_13.origin;
    var_15 = var_1.origin;
    var_16 = 0;

    if ( !isdefined( var_1.team ) || !isdefined( var_13.team ) )
        return;

    if ( isdefined( var_0 ) )
    {
        var_15 = var_0.origin;
        var_16 = var_0 == var_1;
    }

    foreach ( var_18 in level._id_A8D5 )
    {
        if ( !isdefined( var_18._id_047A ) || istrue( var_18._id_047A._id_F5DD ) )
            continue;

        var_19 = var_18 _id_07AD::_id_6BE3();
        var_20 = var_1 _meth_81EF( var_18._id_047A );
        var_21 = var_13 _meth_81EF( var_18._id_047A );

        if ( var_20 && var_1.team != var_19 )
        {
            var_1 thread _id_0A76::_id_6FE6( "capture_kill" );
            var_18 notify( "assault", var_1 );
            var_11 = 1;
        }

        if ( var_19 == "neutral" )
        {
            if ( var_20 || var_21 )
            {
                if ( var_18._id_37D2 == var_13.team )
                {
                    if ( !var_11 )
                    {
                        var_11 = 1;
                        var_1 thread scripts\mp\rank::_id_CBF3( "assault" );
                        var_1 thread _id_0788::_id_6F9C( "mode_x_assault" );
                        var_18 notify( "assault", var_1 );
                        continue;
                    }
                }
                else if ( var_18._id_37D2 == var_1.team )
                {
                    if ( !var_12 )
                    {
                        var_12 = 1;
                        var_1 thread scripts\mp\rank::_id_CBF3( "defend" );
                        var_1 thread _id_0788::_id_6F9C( "mode_x_defend" );
                        var_18 notify( "defend", var_1 );
                        var_1 _id_0A7B::_id_7D93( "defends", 1 );
                        var_1 _id_07D5::_id_E76D( "round", "defends", var_1.pers["defends"] );
                        var_1 _id_0A7B::_id_D544( var_1.pers["defends"] );
                        continue;
                    }
                }
            }
        }
        else if ( var_19 != var_1.team )
        {
            if ( !var_11 )
            {
                var_22 = _id_4B99( var_18._id_047A, var_15, var_14 );

                if ( var_22 )
                {
                    var_11 = 1;
                    var_1 thread scripts\mp\rank::_id_CBF3( "assault" );
                    var_1 thread _id_0788::_id_6F9C( "mode_x_assault" );
                    var_18 notify( "assault", var_1 );
                    continue;
                }
            }
        }
        else if ( !var_12 )
        {
            var_23 = _id_4B99( var_18._id_047A, var_15, var_14 );

            if ( var_23 )
            {
                var_12 = 1;
                var_1 thread scripts\mp\rank::_id_CBF3( "defend" );
                var_1 thread _id_0788::_id_6F9C( "mode_x_defend" );
                var_18 notify( "defend", var_1 );
                var_1 _id_0A7B::_id_7D93( "defends", 1 );
                var_1 _id_07D5::_id_E76D( "round", "defends", var_1.pers["defends"] );
                var_1 _id_0A7B::_id_D544( var_1.pers["defends"] );
                continue;
            }
        }
    }
}

_id_4B99( var_0, var_1, var_2 )
{
    var_3 = distancesquared( var_0.origin, var_1 );
    var_4 = distancesquared( var_0.origin, var_2 );

    if ( var_3 < 105625 || var_4 < 105625 )
    {
        if ( !isdefined( var_0._id_9FE5 ) )
            return 1;
        else if ( var_1[2] - var_0.origin[2] < 100 || var_2[2] - var_0.origin[2] < 100 )
            return 1;
        else
            return 0;
    }
    else
        return 0;
}

_id_69CE()
{
    switch ( self._id_A8CE )
    {
        case "_a":
            return 6;
        case "_b":
            return 7;
        case "_c":
            return 8;
        default:
            return 6;
    }
}
