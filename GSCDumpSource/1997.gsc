// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "#x3cdea067225b5e163" ) == "1" )
        return;

    level._id_CDC3 = [];
    level._id_CDC3["move_time"] = 5;
    level._id_CDC3["accel_time"] = 0;
    level._id_CDC3["decel_time"] = 0;
    level._id_CDC3["wait_time"] = 0;
    level._id_CDC3["delay_time"] = 0;
    level._id_CDC3["usable"] = 0;
    level._id_CDC3["hintstring"] = "activate";
    _id_CDBB( "activate", &"MP/ACTIVATE_MOVER" );
    _id_CDBC( "none", "" );
    level._id_CDCE = [];
    waitframe();
    var_0 = [];
    var_1 = _id_CDC1();

    foreach ( var_3 in var_1 )
        var_0 = scripts\engine\utility::array_combine( var_0, getentarray( var_3, "classname" ) );

    scripts\engine\utility::_id_1BBA( var_0, ::_id_CDC9 );
}

_id_CDC1()
{
    return [ "script_model_mover", "script_brushmodel_mover" ];
}

_id_CDCA()
{
    if ( isdefined( self._id_CDBA ) )
        return self._id_CDBA;

    var_0 = _id_CDC1();

    foreach ( var_2 in var_0 )
    {
        if ( self.classname == var_2 )
        {
            self._id_CDBA = 1;
            return 1;
        }
    }

    return 0;
}

_id_CDBB( var_0, var_1 )
{
    if ( !isdefined( level._id_CDC7 ) )
        level._id_CDC7 = [];

    level._id_CDC7[var_0] = var_1;
}

_id_CDBC( var_0, var_1 )
{
    if ( !isdefined( level._id_CDCF ) )
        level._id_CDCF = [];

    level._id_CDCF[var_0] = var_1;
}

_id_CDC9()
{
    if ( !isdefined( self.target ) )
        return;

    self._id_CDBA = 1;
    self._id_A26D = 0;
    self._id_AC65 = self;
    self._id_FE15 = [];
    self._id_94E6 = [];
    var_0 = scripts\engine\utility::_id_6D7C( self.target, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0375 ) )
            continue;

        switch ( var_2._id_0375 )
        {
            case "origin":
                if ( !isdefined( var_2.angles ) )
                    var_2.angles = ( 0, 0, 0 );

                self._id_AC65 = spawn( "script_model", var_2.origin );
                self._id_AC65.angles = var_2.angles;
                self._id_AC65 setmodel( "tag_origin" );
                self._id_AC65 linkto( self );
                break;
            default:
                break;
        }
    }

    var_4 = getentarray( self.target, "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( !isdefined( var_2._id_0375 ) )
            continue;

        switch ( var_2._id_0375 )
        {
            case "use_trigger_link":
                var_2 _meth_80DB();
                var_2 linkto( self );
            case "use_trigger":
                var_2 _id_CDD2();
                thread _id_CDDC( var_2 );
                self._id_FE15[self._id_FE15.size] = var_2;
                break;
            case "link":
                var_2 linkto( self );
                self._id_94E6[self._id_94E6.size] = var_2;
                break;
            default:
                break;
        }
    }

    thread _id_CDD2();
    thread _id_CDC8();
    thread _id_CDD4();
    thread _id_CDBF( self );
    thread _id_CDCD();

    foreach ( var_8 in self._id_FE15 )
        _id_CDD7( var_8, 1 );
}

_id_CDDC( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( var_0._id_7070.size > 0 )
        {
            self notify( "new_path" );
            thread _id_CDCD( var_0 );
            continue;
        }

        self notify( "trigger" );
    }
}

_id_CDCC( var_0 )
{
    if ( isdefined( level._id_CDCE[var_0] ) )
    {
        self notify( "new_path" );
        self._id_7070 = [ level._id_CDCE[var_0] ];
        thread _id_CDCD();
    }
}

_id_176E( var_0 )
{
    return ( _func_000B( var_0[0] ), _func_000B( var_0[1] ), _func_000B( var_0[2] ) );
}

_id_CDD2()
{
    if ( isdefined( self._id_AE5A ) && self._id_AE5A )
        return;

    self._id_AE5A = 1;
    self._id_7070 = [];
    self._id_A245 = [];
    self._id_92EA = [];
    var_0 = [];
    var_1 = [];

    if ( isdefined( self.target ) )
    {
        var_0 = scripts\engine\utility::_id_6D7C( self.target, "targetname" );
        var_1 = getentarray( self.target, "targetname" );
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !isdefined( var_3._id_0375 ) )
            var_3._id_0375 = "goal";

        switch ( var_3._id_0375 )
        {
            case "ignore":
                if ( isdefined( var_3.target ) )
                {
                    var_4 = scripts\engine\utility::_id_6D7C( var_3.target, "targetname" );

                    foreach ( var_6 in var_4 )
                        var_0[var_0.size] = var_6;
                }

                break;
            case "goal":
                var_3 _id_CDC8();
                var_3 _id_CDD2();
                self._id_7070[self._id_7070.size] = var_3;

                if ( isdefined( var_3._id_AE37["name"] ) )
                    level._id_CDCE[var_3._id_AE37["name"]] = var_3;

                break;
            case "level_notify":
                if ( isdefined( var_3._id_CE0B ) )
                    self._id_92EA[self._id_92EA.size] = var_3;

                break;
            default:
                break;
        }
    }

    foreach ( var_9 in var_1 )
    {
        if ( var_9 _id_CDCA() )
        {
            self._id_A245[self._id_A245.size] = var_9;
            continue;
        }

        if ( !isdefined( var_9._id_0375 ) )
            continue;

        var_10 = strtok( var_9._id_0375, "_" );

        if ( var_10.size != 3 || var_10[1] != "on" )
            continue;

        switch ( var_10[0] )
        {
            case "delete":
                thread _id_CDC0( var_9, ::delete, var_10[2] );
                break;
            case "hide":
                thread _id_CDC0( var_9, ::hide, var_10[2] );
                break;
            case "show":
                var_9 hide();
                thread _id_CDC0( var_9, ::show, var_10[2] );
                break;
            case "triggerhide":
            case "triggerHide":
                thread _id_CDC4( var_9, scripts\engine\utility::_id_F5DD, var_10[2] );
                break;
            case "triggershow":
            case "triggerShow":
                var_9 scripts\engine\utility::_id_F5DD();
                thread _id_CDC4( var_9, scripts\engine\utility::_id_F5DF, var_10[2] );
                break;
            default:
                break;
        }
    }
}

_id_CDC4( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( var_2 );
        var_0 [[ var_1 ]]();
    }
}

_id_CDC0( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( var_2 );
        var_0 call [[ var_1 ]]();
    }
}

_id_CDD9()
{
    scripts\engine\utility::_id_F5DF();
}

_id_CDCD( var_0 )
{
    self endon( "death" );
    self endon( "new_path" );

    if ( !isdefined( var_0 ) )
        var_0 = self;

    while ( var_0._id_7070.size != 0 )
    {
        var_1 = scripts\engine\utility::random( var_0._id_7070 );
        var_2 = self;
        var_2 _id_CDBF( var_1 );

        if ( isdefined( var_2._id_AE37["delay_till"] ) )
            level waittill( var_2._id_AE37["delay_till"] );

        if ( isdefined( var_2._id_AE37["delay_till_trigger"] ) && var_2._id_AE37["delay_till_trigger"] )
            self waittill( "trigger" );

        if ( var_2._id_AE37["delay_time"] > 0 )
            wait( var_2._id_AE37["delay_time"] );

        var_3 = var_2._id_AE37["move_time"];
        var_4 = var_2._id_AE37["accel_time"];
        var_5 = var_2._id_AE37["decel_time"];
        var_6 = 0;
        var_7 = 0;
        var_8 = _func_024A( var_1.origin, var_1.angles, self._id_AC65.origin, self._id_AC65.angles, self.origin, self.angles );

        if ( var_2.origin != var_1.origin )
        {
            if ( isdefined( var_2._id_AE37["move_speed"] ) )
            {
                var_9 = distance( var_2.origin, var_1.origin );
                var_3 = var_9 / var_2._id_AE37["move_speed"];
            }

            if ( isdefined( var_2._id_AE37["accel_frac"] ) )
                var_4 = var_2._id_AE37["accel_frac"] * var_3;

            if ( isdefined( var_2._id_AE37["decel_frac"] ) )
                var_5 = var_2._id_AE37["decel_frac"] * var_3;

            var_2 moveto( var_8["origin"], var_3, var_4, var_5 );

            foreach ( var_11 in var_1._id_92EA )
                thread _id_CDD3( var_11.origin, var_11._id_CE0B, self.origin, var_1.origin );

            var_6 = 1;
        }

        if ( _id_176E( var_8["angles"] ) != _id_176E( var_2.angles ) )
        {
            var_2 rotateto( var_8["angles"], var_3, var_4, var_5 );
            var_7 = 1;
        }

        foreach ( var_14 in var_2._id_A245 )
            var_14 notify( "trigger" );

        var_0 notify( "depart" );
        var_2 _id_CDBE( 0 );
        self._id_A26D = 1;

        if ( isdefined( var_2._id_AE37["move_time_offset"] ) && var_2._id_AE37["move_time_offset"] + var_3 > 0 )
            wait( var_2._id_AE37["move_time_offset"] + var_3 );
        else if ( var_6 )
            self waittill( "movedone" );
        else if ( var_7 )
            self waittill( "rotatedone" );
        else
            wait( var_3 );

        self._id_A26D = 0;
        self notify( "move_end" );
        var_1 notify( "arrive" );

        if ( isdefined( var_2._id_AE37["solid"] ) )
        {
            if ( var_2._id_AE37["solid"] )
                var_2 solid();
            else
                var_2 notsolid();
        }

        foreach ( var_14 in var_1._id_A245 )
            var_14 notify( "trigger" );

        if ( isdefined( var_2._id_AE37["wait_till"] ) )
            level waittill( var_2._id_AE37["wait_till"] );

        if ( var_2._id_AE37["wait_time"] > 0 )
            wait( var_2._id_AE37["wait_time"] );

        var_2 _id_CDBE( 1 );
        var_0 = var_1;
    }
}

_id_CDD3( var_0, var_1, var_2, var_3 )
{
    self endon( "move_end" );
    var_4 = self;
    var_5 = vectornormalize( var_3 - var_2 );

    for (;;)
    {
        var_6 = vectornormalize( var_0 - var_4.origin );

        if ( vectordot( var_5, var_6 ) <= 0 )
            break;

        wait 0.05;
    }

    level notify( var_1 );
}

_id_CDC8()
{
    self._id_AE37 = [];

    if ( !isdefined( self.angles ) )
        self.angles = ( 0, 0, 0 );

    self.angles = _id_176E( self.angles );
    _id_CDD0( self._id_CE0B );
}

_id_CDD0( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "";

    var_1 = strtok( var_0, ";" );

    foreach ( var_3 in var_1 )
    {
        var_4 = strtok( var_3, "=" );

        if ( var_4.size != 2 )
            continue;

        if ( var_4[1] == "undefined" || var_4[1] == "default" )
        {
            self._id_AE37[var_4[0]] = undefined;
            continue;
        }

        switch ( var_4[0] )
        {
            case "delay_time":
            case "wait_time":
            case "move_time_offset":
            case "accel_time":
            case "accel_frac":
            case "decel_frac":
            case "move_speed":
            case "decel_time":
            case "move_time":
                self._id_AE37[var_4[0]] = _id_CDD1( var_4[1] );
                break;
            case "wait_till":
            case "hintstring":
            case "delay_till":
            case "name":
                self._id_AE37[var_4[0]] = var_4[1];
                break;
            case "usable":
            case "delay_till_trigger":
            case "solid":
                self._id_AE37[var_4[0]] = int( var_4[1] );
                break;
            case "script_params":
                var_5 = var_4[1];
                var_6 = level._id_CDCF[var_5];

                if ( isdefined( var_6 ) )
                    _id_CDD0( var_6 );

                break;
            default:
                break;
        }
    }
}

_id_CDD1( var_0 )
{
    var_1 = 0;
    var_2 = strtok( var_0, "," );

    if ( var_2.size == 1 )
        var_1 = float( var_2[0] );
    else if ( var_2.size == 2 )
    {
        var_3 = float( var_2[0] );
        var_4 = float( var_2[1] );

        if ( var_3 >= var_4 )
            var_1 = var_3;
        else
            var_1 = randomfloatrange( var_3, var_4 );
    }

    return var_1;
}

_id_CDBF( var_0 )
{
    foreach ( var_3, var_2 in var_0._id_AE37 )
        _id_CDD6( var_3, var_2 );

    _id_CDD5();
}

_id_CDD6( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == "usable" && isdefined( var_1 ) )
        _id_CDD7( self, var_1 );

    self._id_AE37[var_0] = var_1;
}

_id_CDBE( var_0 )
{
    if ( self._id_AE37["usable"] )
        _id_CDD7( self, var_0 );

    foreach ( var_2 in self._id_FE15 )
        _id_CDD7( var_2, var_0 );
}

_id_CDD7( var_0, var_1 )
{
    if ( var_1 )
    {
        var_0 makeuseable();
        var_0 setcursorhint( "HINT_NOICON" );
        var_0 sethintstring( level._id_CDC7[self._id_AE37["hintstring"]] );
    }
    else
        var_0 makeunusable();
}

_id_CDD4()
{
    self._id_AE38 = [];

    foreach ( var_2, var_1 in self._id_AE37 )
        self._id_AE38[var_2] = var_1;
}

_id_CDD5()
{
    foreach ( var_2, var_1 in level._id_CDC3 )
    {
        if ( !isdefined( self._id_AE37[var_2] ) )
            _id_CDD6( var_2, var_1 );
    }

    if ( isdefined( self._id_AE38 ) )
    {
        foreach ( var_2, var_1 in self._id_AE38 )
        {
            if ( !isdefined( self._id_AE37[var_2] ) )
                _id_CDD6( var_2, var_1 );
        }
    }
}

init()
{
    level thread _id_CDC2();
    level thread _id_CDBD();
}

_id_CDC2()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_B604();
    }
}

_id_CDBD()
{
    for (;;)
    {
        level waittill( "spawned_agent", var_0 );
        var_0 thread _id_B604();
    }
}

_id_B609( var_0 )
{
    self._id_F9A2++;
    thread _id_38ED();
    var_1 = 3;

    if ( isdefined( var_0 ) && isdefined( var_0._id_F9A9 ) )
        var_1 = var_0._id_F9A9;

    if ( self._id_F9A2 >= var_1 )
    {
        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0._id_F9A4 ) )
                var_0 [[ var_0._id_F9A4 ]]( self );
            else if ( isdefined( var_0._id_F9A5 ) && var_0._id_F9A5 )
                var_0 _id_F9AA( self );
            else
            {
                var_2 = isdefined( self._id_8F76 ) && gettime() - self._id_8F76 <= 250;

                if ( var_2 || var_0 scripts\cp_mp\vehicles\vehicle::_id_8ADC() && !scripts\cp_mp\vehicles\vehicle::_id_1009C( var_0, self ) )
                    var_0 _id_F9A7( self, 0, var_0 );
                else
                {
                    var_3 = _id_B5C3( var_0 );
                    var_0 _id_F9A7( self, var_3, var_0 );
                }
            }
        }
        else
        {
            var_3 = _id_B5C3( var_0 );
            _id_F9A7( self, var_3 );
        }

        self._id_F9A2 = 0;
    }
}

_id_B5C3( var_0 )
{
    if ( isdefined( var_0 ) && istrue( var_0._id_A244 ) )
        return 0;

    return 1;
}

_id_B604()
{
    if ( isagent( self ) )
        self endon( "death_or_disconnect" );
    else
        self endon( "disconnect" );

    self._id_F9A2 = 0;

    for (;;)
    {
        self waittill( "unresolved_collision", var_0 );

        if ( _id_B4D5( var_0 ) )
            continue;

        _id_B609( var_0 );
    }
}

_id_B4D5( var_0 )
{
    var_1 = 0;

    if ( isdefined( var_0.streakinfo ) && var_0.streakinfo._id_EA0F == "cruise_predator" )
        var_1 = 1;

    return var_1;
}

_id_38ED()
{
    self endon( "unresolved_collision" );
    waitframe();

    if ( isdefined( self ) )
        self._id_F9A2 = 0;
}

_id_F9AA( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_1.owner ) )
    {
        var_0 _id_A23E();
        return;
    }

    var_2 = 0;

    if ( level.teambased )
    {
        if ( isdefined( var_1.owner.team ) && var_1.owner.team != var_0.team )
            var_2 = 1;
    }
    else if ( var_0 != var_1.owner )
        var_2 = 1;

    if ( !var_2 )
    {
        var_0 _id_A23E();
        return;
    }

    var_3 = 1000;

    if ( isdefined( var_1._id_F9A3 ) )
        var_3 = var_1._id_F9A3;

    var_0 dodamage( var_3, var_1.origin, var_1.owner, var_1, "MOD_CRUSH" );
}

_id_F9A7( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_AD31 ) )
    {
        self [[ level._id_AD31 ]]( var_0, var_1 );
        return;
    }

    if ( isdefined( var_2 ) )
    {
        if ( scripts\cp_mp\utility\game_utility::_id_88E4() )
        {
            var_1 = 1;

            if ( var_2 scripts\cp_mp\vehicles\vehicle::_id_8ADC() )
            {
                var_3 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10193( var_2, 1 );

                if ( isdefined( var_3 ) )
                {
                    var_4 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1019C( var_2, var_0, var_3, 1 );

                    if ( isdefined( var_4 ) )
                    {
                        var_0 setorigin( var_4[0] );
                        return;
                    }
                }
            }
            else if ( scripts\mp\weapons::_id_896B( var_2 ) )
            {
                var_2 scripts\mp\weapons::_id_474B();
                return;
            }
            else if ( isdefined( var_2._id_010F ) )
            {
                var_2._id_010F _id_09F0::_id_EC99( undefined, 0 );
                return;
            }
        }
        else
        {
            var_5 = self._id_F9A8;
            var_6 = undefined;

            if ( isdefined( var_5 ) )
                var_5 = _func_01FF( var_5, var_0.origin );
            else
                var_5 = _func_00B5( var_0.origin, 500, 0, 128, "path" );

            var_7 = ( 0, 0, -100 );
            var_0 _meth_8062();
            var_0 dontinterpolate();
            var_8 = _id_659D( var_2 );
            var_9 = scripts\engine\utility::array_combine( var_8, level.characters );

            for ( var_10 = 0; var_10 < var_5.size; var_10++ )
            {
                if ( var_10 == 3 )
                    break;

                var_11 = var_5[var_10];
                var_12 = var_11.origin + ( 0, 0, 10 );
                var_13 = scripts\engine\trace::_id_3EC3( 0, 1, 1, 1, 1, 1 );
                var_14 = scripts\engine\trace::ray_trace( var_0 gettagorigin( "tag_eye" ), var_12, var_9, var_13 );

                if ( isdefined( var_14["hittype"] ) && var_14["hittype"] != "hittype_none" )
                    continue;

                if ( !_func_0034( var_12 ) )
                    continue;

                if ( _func_01A0( var_12 ) )
                    continue;

                if ( var_0 getstance() == "prone" )
                    var_0 setstance( "crouch" );

                var_0 setorigin( var_12 );
                return;
            }
        }
    }

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
        var_0 _id_A23E();
}

_id_659D( var_0 )
{
    var_1 = [];
    var_1[var_1.size] = var_0;
    var_2 = var_0 _meth_8151();
    var_3 = var_0 _meth_8150( 1 );

    if ( isdefined( var_2 ) )
        var_1[var_1.size] = var_2;

    if ( isdefined( var_3 ) )
    {
        foreach ( var_5 in var_3 )
            var_1[var_1.size] = var_5;
    }

    return var_1;
}

_id_F9AB( var_0 )
{

}

_id_A23E()
{
    _id_0A62::_id_0D61();
}

_id_B579( var_0 )
{
    self endon( "death" );
    self endon( "stop_player_pushed_kill" );

    for (;;)
    {
        self waittill( "player_pushed", var_1, var_2 );

        if ( isplayer( var_1 ) || isagent( var_1 ) )
        {
            var_3 = length( var_2 );

            if ( var_3 >= var_0 )
                _id_F9AA( var_1 );
        }
    }
}

_id_E8C9()
{
    self notify( "stop_player_pushed_kill" );
}

_id_CDC5()
{
    var_0 = self _meth_8151();

    for ( var_1 = var_0; isdefined( var_1 ); var_1 = var_1 _meth_8151() )
        var_0 = var_1;

    return var_0;
}

_id_CDD8( var_0 )
{
    var_1 = var_0 _id_CDC5();

    if ( isdefined( var_1 ) )
        var_1._id_E734 = var_1.origin;

    self._id_E733 = self _meth_815A();

    if ( isdefined( self._id_E733 ) )
    {
        var_2 = self._id_E733 _id_CDC5();

        if ( isdefined( var_2 ) )
            self._id_E733 = var_2;

        self._id_E733._id_E734 = self._id_E733.origin;
    }
}

_id_CDC6( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    return _func_0133( var_0.origin - var_0._id_E734 ) > 0.001;
}

_id_CDDB( var_0 )
{
    if ( !isplayer( self ) )
        return 1;

    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0 _id_CDC5();
    var_2 = self._id_E733;

    if ( !isdefined( var_1 ) && !isdefined( var_2 ) )
        return 1;

    if ( isdefined( var_1 ) && isdefined( var_2 ) && var_1 == var_2 )
        return 1;

    if ( _id_CDC6( var_1 ) )
        return 0;

    if ( _id_CDC6( var_2 ) )
        return 0;

    return 1;
}

_id_CDCB( var_0 )
{
    if ( isplayer( var_0 ) )
        var_0 _id_CDD8( self );

    var_0 allowmovement( 0 );
    var_0 allowjump( 0 );
}

_id_CDDA( var_0 )
{
    var_0 allowmovement( 1 );
    var_0 allowjump( 1 );
}

_id_A65F()
{
    var_0 = self _meth_8150( 0 );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_A509 ) && var_2._id_A509 )
            continue;

        var_2 unlink();
        var_2 notify( "invalid_parent", self );
    }
}

_id_BD48( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1._id_A508 ) && var_1._id_A508 )
        return;

    if ( isdefined( var_0._id_B372 ) )
        playfx( scripts\engine\utility::getfx( "airdrop_crate_destroy" ), self.origin );

    if ( isdefined( var_0._id_43D6 ) )
    {
        var_0._id_9096 = var_1;
        self thread [[ var_0._id_43D6 ]]( var_0 );
    }
    else
        self delete();
}

_id_73E6( var_0 )
{
    self notify( "handle_moving_platform_touch" );
    self endon( "handle_moving_platform_touch" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( isdefined( var_0._id_5318 ) )
        self endon( var_0._id_5318 );

    for (;;)
    {
        self waittill( "touching_platform", var_1 );

        if ( isdefined( var_0._id_FF3F ) && var_0._id_FF3F )
        {
            if ( !self _meth_81EF( var_1 ) )
            {
                waitframe();
                continue;
            }
        }

        thread _id_BD48( var_0, var_1 );
        break;
    }
}

_id_73E5( var_0 )
{
    self notify( "handle_moving_platform_invalid" );
    self endon( "handle_moving_platform_invalid" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( isdefined( var_0._id_5318 ) )
        self endon( var_0._id_5318 );

    self waittill( "invalid_parent", var_1 );

    if ( isdefined( var_0._id_84E1 ) )
        self thread [[ var_0._id_84E1 ]]( var_0 );
    else
        thread _id_BD48( var_0, var_1 );
}

_id_73E7( var_0 )
{
    self notify( "handle_moving_platforms" );
    self endon( "handle_moving_platforms" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( !isdefined( var_0 ) )
        var_0 = spawnstruct();

    if ( isdefined( var_0._id_5318 ) )
        self endon( var_0._id_5318 );

    if ( isdefined( var_0._id_94F7 ) )
    {
        var_1 = self _meth_8151();

        if ( !isdefined( var_1 ) || var_1 != var_0._id_94F7 )
            self linkto( var_0._id_94F7 );
    }

    thread _id_73E6( var_0 );
    thread _id_73E5( var_0 );
}

_id_E8A0()
{
    self notify( "stop_handling_moving_platforms" );
}

_id_A271( var_0 )
{

}
