// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_6D61()
{
    if ( self getstance() == "crouch" )
        var_0 = self.origin + ( 0, 0, 24 );
    else if ( self getstance() == "prone" )
        var_0 = self.origin + ( 0, 0, 10 );
    else
        var_0 = self.origin + ( 0, 0, 32 );

    return var_0;
}

isreallyalive( var_0 )
{
    return isalive( var_0 ) && !isdefined( var_0._id_59C0 ) && !istrue( var_0._id_46A2 );
}

_id_88AE( var_0 )
{
    return istrue( var_0._id_82AC );
}

_id_8741( var_0 )
{
    return isdefined( self._id_9648 ) && var_0 == self._id_9648;
}

_id_896F()
{
    return self playerads() > 0.5;
}

_id_D717( var_0 )
{
    if ( var_0 )
        _id_D51F();
    else
        _id_D511();
}

_id_FD24( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "intermission":
        case "playing":
            var_1 = "";
            break;
        case "dead":
        case "spectator":
            if ( istrue( level._id_4CD9 ) )
                var_1 = "";
            else if ( istrue( level._id_A77D ) )
            {
                if ( istrue( self._id_ED47 ) )
                    var_1 = "hud_status_dogtag";
                else if ( istrue( self._id_C7E1 ) )
                {
                    if ( isdefined( self._id_03E0 ) && self._id_03E0 == "hud_status_revive_or" )
                        var_1 = "hud_status_revive_or";
                    else
                        var_1 = "hud_status_revive_wh";
                }
                else
                    var_1 = "hud_status_dead";
            }
            else
                var_1 = "hud_status_dead";

            break;
    }

    if ( !isdefined( var_1 ) )
        var_1 = "";

    self.sessionstate = var_0;
    self._id_03E0 = var_1;
    self setclientomnvar( "ui_session_state", var_0 );
    _id_BD13( "player::updateSessionState() " + var_0 );
}

_id_6DA6( var_0, var_1 )
{
    var_2 = [];

    if ( !isdefined( var_1 ) || var_1 )
    {
        foreach ( var_4 in level.characters )
        {
            if ( isdefined( var_4.team ) && var_4.team == var_0 )
                var_2[var_2.size] = var_4;
        }
    }
    else
    {
        foreach ( var_4 in level.players )
        {
            if ( isdefined( var_4.team ) && var_4.team == var_0 )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

_id_668B( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = self getentitynumber();
    var_3 = [];

    foreach ( var_5 in level.players )
    {
        if ( var_5 == self )
            continue;

        var_6 = 0;

        if ( !var_1 )
        {
            if ( isdefined( var_5.team ) && ( var_5.team == "spectator" || var_5.team == "follower" || var_5.sessionstate == "spectator" ) )
            {
                var_7 = var_5 getspectatingplayer();

                if ( isdefined( var_7 ) && var_7 == self )
                    var_6 = 1;
            }

            if ( var_5._id_01BD == var_2 )
                var_6 = 1;
        }

        if ( !var_0 )
        {
            if ( var_5._id_0249 == var_2 )
                var_6 = 1;
        }

        if ( var_6 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_D426( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_668B( var_4, var_5 );

    foreach ( var_8 in var_6 )
    {
        var_8 notify( "changing_watching_visionset" );

        if ( isdefined( var_3 ) && var_3 )
            var_8 _meth_844E( var_0, var_1 );
        else
            var_8 visionsetmissilecamforplayer( var_0, var_1 );

        if ( var_0 != "" && isdefined( var_2 ) )
        {
            var_8 thread _id_C5EF( self, var_1 + var_2 );
            var_8 thread _id_C5ED( self );

            if ( var_8 _id_88AD() )
                var_8 thread _id_C5EE();
        }
    }
}

_id_C5EE()
{
    self endon( "disconnect" );
    self waittill( "spawned" );
    self visionsetmissilecamforplayer( "", 0.0 );
}

_id_C5EF( var_0, var_1 )
{
    self endon( "changing_watching_visionset" );
    var_2 = gettime();
    var_3 = self.team;

    while ( gettime() - var_2 < var_1 * 1000 )
    {
        if ( self.team != var_3 || !scripts\engine\utility::array_contains( var_0 _id_668B(), self ) )
        {
            self visionsetmissilecamforplayer( "", 0.0 );
            self notify( "changing_visionset" );
            break;
        }

        waitframe();
    }
}

_id_C5ED( var_0 )
{
    self endon( "changing_watching_visionset" );
    var_0 waittill( "disconnect" );
    self visionsetmissilecamforplayer( "", 0.0 );
}

_id_C6FB( var_0 )
{
    if ( istrue( level._id_10F9F ) )
        return;

    self visionsetmissilecamforplayer( "", var_0 );
}

_id_80ED()
{
    _func_0264( "nvg_base_mp" );
}

_id_AD55( var_0 )
{
    _func_0264( var_0 );
}

isenemy( var_0 )
{
    if ( level.teambased )
        return var_0.team != self.team;
    else if ( isdefined( var_0.owner ) )
        return var_0.owner != self;
    else
        return var_0 != self;
}

_id_6E04()
{
    if ( isdefined( self.pers["guid"] ) )
        return self.pers["guid"];

    var_0 = self getguid();

    if ( var_0 == "0000000000000000" )
    {
        if ( isdefined( level._id_7243 ) )
            level._id_7243++;
        else
            level._id_7243 = 1;

        var_0 = "script" + level._id_7243;
    }

    self.pers["guid"] = var_0;
    return self.pers["guid"];
}

_id_6C40( var_0, var_1, var_2, var_3 )
{
    var_4 = [ "physicscontents_characterproxy" ];
    return _id_0A67::_id_69EB( var_0, var_1, var_2, var_3, physics_createcontents( var_4 ) );
}

_id_6C41( var_0, var_1, var_2, var_3 )
{
    var_4 = [ "physicscontents_characterproxy" ];
    var_5 = [];
    var_6 = _id_0A67::_id_69EB( var_0, var_1, var_2, var_3, physics_createcontents( var_4 ) );

    foreach ( var_8 in var_6 )
    {
        var_9 = undefined;
        var_10 = [ var_8 gettagorigin( "j_head" ), var_8 gettagorigin( "j_mainroot" ), var_8 gettagorigin( "tag_origin" ) ];

        for ( var_11 = 0; var_11 < var_10.size; var_11++ )
        {
            if ( !scripts\engine\trace::ray_trace_passed( var_0, var_10[var_11], level.characters, scripts\engine\trace::_id_3EC3( 0, 1, 1, 1, 1, 1 ) ) )
                continue;

            if ( !isdefined( var_9 ) )
            {
                var_5[var_5.size] = spawnstruct();
                var_5[var_5.size - 1].player = var_8;
                var_5[var_5.size - 1]._id_10417 = [];
                var_9 = 1;
            }

            var_5[var_5.size - 1]._id_10417[var_5[var_5.size - 1]._id_10417.size] = var_10[var_11];
        }
    }

    return var_5;
}

_id_8852( var_0, var_1 )
{
    if ( !level.teambased )
        return 0;

    if ( !isplayer( var_1 ) && !isdefined( var_1.team ) )
        return 0;

    if ( var_0 != var_1.team )
        return 0;

    return 1;
}

_id_0BAD( var_0 )
{
    if ( !isdefined( self._id_5222 ) )
        self._id_5222 = 0;

    if ( var_0 )
    {
        if ( self._id_5222 == 0 )
            self _meth_84F0( 1 );

        self._id_5222++;
    }
    else
    {
        if ( self._id_5222 == 1 )
            self _meth_84F0( 0 );

        self._id_5222--;
    }
}

_id_150B( var_0 )
{
    if ( self._id_9648 != "archetype_scout" )
        return;

    if ( var_0 )
    {
        if ( !isdefined( self._id_4A73 ) )
            self._id_4A73 = 0;

        self._id_4A73--;

        if ( !self._id_4A73 )
            self _meth_8466( 1 );
    }
    else
    {
        if ( !isdefined( self._id_4A73 ) )
            self._id_4A73 = 0;

        self._id_4A73++;
        self _meth_8466( 0 );
    }
}

_id_151B( var_0, var_1 )
{
    var_2 = scripts\common\input_allow::allow_input_internal( "gesture", var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return;

    if ( var_0 )
    {
        if ( scripts\engine\utility::is_player_gamepad_enabled() )
            self setactionslot( 1, "taunt" );
        else
            self setactionslot( 7, "taunt" );
    }
    else if ( scripts\engine\utility::is_player_gamepad_enabled() )
        self setactionslot( 1, "" );
    else
        self setactionslot( 7, "" );
}

_id_8982( var_0, var_1 )
{
    var_2 = 0;

    if ( isagent( var_0 ) && isdefined( var_0._id_11E7 ) && var_0._id_11E7 == "playerProxy" )
    {
        if ( var_0.owner == var_1 )
            var_2 = 1;
    }

    return var_2;
}

_id_5248( var_0, var_1 )
{
    if ( var_0 )
    {
        _func_030A( var_1 );
        level._id_BF47 = 1;
    }
    else
    {
        _func_030A( 1.0 );
        level._id_BF47 = undefined;
    }
}

_id_89BB()
{
    return istrue( level._id_BF47 );
}

_id_0D99( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( isai( var_3 ) )
            continue;

        var_3 visionsetmissilecamforplayer( var_0, var_1 );
    }

    return;
}

_id_78E8()
{
    if ( !isdefined( self._id_F90D ) )
        self._id_78E9 = 0;

    if ( self._id_78E9 == 0 )
        self setclientomnvar( "ui_hide_hud", 1 );

    self._id_78E9++;
}

_id_78E6()
{
    if ( self._id_78E9 == 1 )
        self setclientomnvar( "ui_hide_hud", 0 );

    self._id_78E9--;
}

_id_78E5()
{
    self._id_78E9 = undefined;
    self setclientomnvar( "ui_hide_hud", 0 );
}

_id_78ED( var_0 )
{
    if ( _id_1634() && !istrue( var_0 ) )
        return;

    if ( !isdefined( self._id_9F14 ) )
        self._id_9F14 = 0;

    var_1 = self._id_9F14;
    self._id_9F14--;

    if ( self._id_9F14 < 0 )
        self._id_9F14 = 0;

    if ( istrue( var_0 ) || self._id_9F14 == 0 && var_1 > self._id_9F14 )
    {
        if ( istrue( var_0 ) )
            self._id_9F14 = 0;
    }
}

_id_DCC1()
{
    if ( !isdefined( self._id_9F14 ) )
        self._id_9F14 = 0;

    var_0 = self._id_9F14;
    self._id_9F14++;

    if ( self._id_9F14 == 1 && var_0 < self._id_9F14 )
        return;
}

_id_1634()
{
    return istrue( level._id_9F11 ) || level.gametype == "br" || level.gametype == "brm";
}

_id_883B()
{
    return isdefined( self._id_AC2A ) && isdefined( self._id_AC2A._id_6266 ) && self._id_AC2A._id_6266 == "female";
}

_id_6B0A( var_0, var_1 )
{
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        if ( var_4.team != "spectator" && var_4.team != "follower" && ( !var_1 || var_4 scripts\cp_mp\utility\player_utility::_id_0C14() ) )
        {
            if ( !isdefined( var_2 ) || var_4 getentitynumber() < var_2 )
                var_2 = var_4 getentitynumber();
        }
    }

    return var_2;
}

_id_D8C9( var_0 )
{
    if ( isdefined( self._id_32C1 ) )
        self._id_32C1.alpha = 0;

    self._id_FF16 = var_0;

    if ( scripts\cp_mp\utility\game_utility::isnightmap() )
        scripts\common\utility::_id_1535( 0 );

    scripts\common\utility::_id_1563( 0 );
    scripts\common\utility::_id_1507( 0 );
    scripts\common\utility::allow_equipment( 0 );
    scripts\common\utility::_id_14F7( 0 );
    _id_0995::_id_523B();
    self setclientomnvar( "ui_using_killstreak_remote", 1 );
    self notify( "using_remote" );
}

_id_6CCD()
{
    return self._id_FF16;
}

_id_396C( var_0 )
{
    if ( scripts\cp_mp\utility\game_utility::isnightmap() )
        scripts\common\utility::_id_1535( 1 );

    scripts\common\utility::_id_1563( 1 );
    scripts\common\utility::_id_1507( 1 );
    scripts\common\utility::_id_14F7( 1 );
    _id_0995::_id_4AAA();

    if ( isdefined( self._id_32C1 ) )
        self._id_32C1.alpha = 1;

    self._id_FF16 = undefined;

    if ( !isdefined( var_0 ) )
    {
        scripts\common\utility::allow_equipment( 1 );
        _id_0BC4( 0 );
    }

    self setclientomnvar( "ui_using_killstreak_remote", 0 );
    self notify( "stopped_using_remote" );
}

_id_8AB5()
{
    return isdefined( self._id_FF16 );
}

_id_0BC4( var_0, var_1 )
{
    if ( !isdefined( self.pers ) )
        return;

    if ( !isdefined( self.pers["controllerFreezeStack"] ) )
        self.pers["controllerFreezeStack"] = 0;

    if ( var_0 )
        self.pers["controllerFreezeStack"]++;
    else if ( istrue( var_1 ) )
        self.pers["controllerFreezeStack"] = 0;
    else
        self.pers["controllerFreezeStack"]--;

    if ( self.pers["controllerFreezeStack"] <= 0 )
    {
        self.pers["controllerFreezeStack"] = 0;
        self freezecontrols( 0 );
        self._id_3C45 = 0;
    }
    else
    {
        self freezecontrols( 1 );
        self._id_3C45 = 1;
    }
}

_id_0BC5( var_0, var_1 )
{
    if ( !isdefined( self.pers ) )
        return;

    if ( !isdefined( self.pers["controllerLookFreezeStack"] ) )
        self.pers["controllerLookFreezeStack"] = 0;

    if ( var_0 )
        self.pers["controllerLookFreezeStack"]++;
    else if ( istrue( var_1 ) )
        self.pers["controllerLookFreezeStack"] = 0;
    else
        self.pers["controllerLookFreezeStack"]--;

    if ( self.pers["controllerLookFreezeStack"] <= 0 )
    {
        self.pers["controllerLookFreezeStack"] = 0;
        self freezelookcontrols( 0 );
        self._id_97DE = 0;
    }
    else
    {
        self freezelookcontrols( 1 );
        self._id_97DE = 1;
    }
}

_id_6C2E( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2._id_723F == var_0 )
            return var_2;
    }

    return undefined;
}

_id_D3D4( var_0, var_1, var_2, var_3 )
{
    var_4 = self _meth_8484( var_0 );
    self._id_F07A = 1;
    self _meth_8485( var_0, var_1 );

    if ( !isdefined( var_3 ) || !var_3 )
        wait( var_2 );
    else
    {
        var_5 = self _meth_847E( var_0 );

        for (;;)
        {
            if ( self _meth_847C( var_0 ) >= var_5 )
                break;

            waitframe();
        }
    }

    self _meth_8485( var_0, var_4 );
    self._id_F07A = 0;
}

_id_D3D3( var_0, var_1, var_2, var_3 )
{
    var_4 = self _meth_8480( var_0 );
    self._id_F07C = 1;
    self _meth_8481( var_0, var_1 );

    if ( !isdefined( var_3 ) || !var_3 )
        wait( var_2 );
    else
    {
        var_5 = self _meth_847E( var_0 );

        for (;;)
        {
            if ( self _meth_847C( var_0 ) >= var_5 )
                break;

            waitframe();
        }
    }

    self _meth_8481( var_0, var_4 );
    self._id_F07C = 0;
}

_id_0BAF()
{
    if ( !isdefined( self._id_5227 ) )
        self._id_5227 = 0;

    if ( self._id_5227 == 0 )
        self._id_0213 = 1;

    self._id_5227++;
}

_id_0B99()
{
    if ( self._id_5227 == 1 )
        self._id_0213 = 0;

    self._id_5227--;
}

_id_0C94()
{
    self._id_5227 = undefined;
    self._id_0213 = 0;
}

_id_10AA1( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_2DB7 ) )
        self._id_2DB7 = [];

    if ( !isdefined( self._id_2DB7[var_0] ) )
    {
        var_4 = spawnstruct();
        var_4.player = self;
        var_4._id_8CB6 = var_0;
        var_4._id_3AB2 = var_1;
        var_4._id_3ABD = var_2;
        var_4._id_A68C = var_0 + "_buttonDown";
        var_4._id_A6A6 = var_0 + "_buttonUp";
        var_4._id_BBE1 = istrue( var_3 );
        self._id_2DB7[var_0] = var_4;
        var_4 thread _id_10AA3();
    }
}

_id_691C( var_0 )
{
    if ( !isdefined( self._id_2DB7 ) )
        return 0;

    if ( !isdefined( self._id_2DB7[var_0] ) )
        return 0;

    return self._id_2DB7[var_0]._id_BBE1;
}

_id_10AA2( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self._id_2DB7 ) || self._id_2DB7[var_0] )
        return;

    self._id_2DB7[var_0] notify( "watchButtonPressedEnd" );
    self._id_2DB7[var_0] = undefined;
}

_id_10AA3()
{
    self.player endon( "disconnect" );
    self endon( "watchButtonPressedEnd" );

    for (;;)
    {
        self._id_016F = 0;
        self._id_0496 = 0;
        childthread _id_10AA0();
        childthread _id_10AA5();
        self waittill( "start_race" );
        waittillframeend;
        self notify( "end_race" );

        if ( self._id_016F && self._id_0496 )
            continue;

        if ( self._id_016F )
        {
            self._id_BBE1 = 1;
            continue;
        }

        self._id_BBE1 = 0;
    }
}

_id_10AA0()
{
    self endon( "end_race" );
    self.player notifyonplayercommand( self._id_A68C, self._id_3AB2 );
    self.player waittill( self._id_A68C );
    self._id_016F = 1;
    self notify( "start_race" );
}

_id_10AA5()
{
    self endon( "end_race" );
    self.player notifyonplayercommand( self._id_A6A6, self._id_3ABD );
    self.player waittill( self._id_A6A6 );
    self._id_0496 = 1;
    self notify( "start_race" );
}

_id_10AA4()
{
    self endon( "watchButtonPressedEnd" );
    self.player waittill( "disconnect" );
    self notify( "watchButtonPressedEnd" );
}

_id_0CBC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( 1 )
        return;

    if ( !isdefined( self ) )
        return;

    var_0 = max( var_0, 0.0 );
    var_1 = clamp( var_1, 1.0, 9994.0 );
    var_2 = clamp( var_2, 2.0, 9998.0 );
    var_3 = clamp( var_3, 3.0, 9999 );

    if ( var_2 > 9994.0 )
        var_5 = 0.0;
}

_id_D512()
{
    self endon( "death_or_disconnect" );
    _id_D511();

    if ( isai( self ) )
        return;

    var_0 = [ "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_characterproxy", "physicscontents_glass", "physicscontents_itemclip" ];
    var_1 = physics_createcontents( var_0 );
    var_2 = [ "physicscontents_characterproxy" ];
    var_3 = physics_createcontents( var_2 );
    var_4 = 1;
    var_5 = 1;
    var_6 = cos( 27 );
    var_7 = 1;
    var_8 = 0;
    var_9 = [];
    var_9["geo"] = spawnstruct();
    var_9["geo"]._id_A3ED = getdvarfloat( "dof_nearStart_geo", 0.01 );
    var_9["geo"]._id_A3E4 = getdvarfloat( "dof_nearEnd_geo", 0.95 );
    var_9["geo"]._id_5994 = getdvarfloat( "dof_farStart_geo", 1.5 );
    var_9["geo"]._id_5990 = getdvarfloat( "dof_farEnd_geo", 2.5 );
    var_9["geo"]._id_A3DC = getdvarfloat( "dof_nearBlur_geo", 3.9 );
    var_9["geo"]._id_598F = getdvarfloat( "dof_farBlur_geo", 2.25 );
    var_9["interest"] = spawnstruct();
    var_9["interest"]._id_A3ED = getdvarfloat( "dof_nearStart", 0.01 );
    var_9["interest"]._id_A3E4 = getdvarfloat( "dof_nearEnd", 0.95 );
    var_9["interest"]._id_5994 = getdvarfloat( "dof_farStart", 1.5 );
    var_9["interest"]._id_5990 = getdvarfloat( "dof_farEnd", 2.5 );
    var_9["interest"]._id_A3DC = getdvarfloat( "dof_nearBlur", 7.0 );
    var_9["interest"]._id_598F = getdvarfloat( "dof_farBlur", 3.5 );

    for (;;)
    {
        waitframe();
        var_10 = "geo";

        if ( istrue( self._id_FF08 ) )
            continue;

        var_11 = self playerads() > 0.9;

        if ( var_7 && !var_11 )
        {
            if ( var_8 )
            {
                var_8 = 0;
                _id_0CBC( 0, 0, 512, 512, 4, 0 );
            }

            continue;
        }

        var_12 = self geteye();
        var_13 = self getplayerangles();
        var_14 = anglestoforward( var_13 );
        var_15 = -1;
        var_16 = undefined;
        var_17 = undefined;
        var_18 = undefined;
        var_19 = undefined;

        if ( var_4 )
        {
            var_20 = 0;

            foreach ( var_22 in level.players )
            {
                if ( !scripts\cp_mp\utility\player_utility::_id_B779( self, var_22 ) )
                    continue;

                if ( !var_22 scripts\cp_mp\utility\player_utility::_id_0C14() )
                    continue;

                var_23 = var_22 geteye();
                var_24 = vectordot( var_14, vectornormalize( var_23 - var_12 ) );

                if ( var_24 < var_6 )
                    continue;

                var_25 = distance( var_12, var_23 );

                if ( !isdefined( var_16 ) || var_25 < var_16 )
                {
                    if ( var_22 _meth_83CC( var_12, self ) > 0 )
                        var_16 = var_25;
                }

                if ( !isdefined( var_17 ) || var_25 > var_17 )
                {
                    if ( var_22 _meth_83CC( var_12, self ) > 0 )
                        var_17 = var_25;
                }
            }
        }

        var_27 = var_12 + var_14 * 10000;
        var_28 = scripts\engine\trace::_id_E406( var_12, var_27, 0.1, self, var_1, 0 );
        var_19 = distance( var_12, var_28["position"] );
        var_29 = scripts\engine\trace::_id_E406( var_12, var_27, 20.0, self, var_3, 0 );
        var_30 = var_29["entity"];
        var_31 = isdefined( var_30 ) && isplayer( var_30 ) && scripts\cp_mp\utility\player_utility::_id_B779( self, var_30 );
        var_32 = var_31 && var_30 _meth_83CC( var_12, self ) > 0;

        if ( !isdefined( var_16 ) || var_19 < var_16 )
            var_16 = var_19;

        if ( !isdefined( var_17 ) || var_19 > var_17 )
            var_17 = var_19;

        var_8 = 1;
        var_33 = max( abs( var_16 - var_17 ) * 0.5, 300.0 );
        var_34 = 0.0;
        var_35 = max( var_16 - 50.0, 1.0 );
        var_36 = var_17 + 50.0;
        var_37 = var_36 + var_33;
        var_38 = scripts\engine\utility::ter_op( var_32, 6.0, 4.0 );
        var_39 = scripts\engine\utility::ter_op( var_32, 2.5, 1.25 );
        _id_0CBC( var_34, var_35, var_36, var_37, var_38, var_39 );
    }
}

_id_D516()
{
    self endon( "disconnect" );
    self._id_FF08 = 1;
    _id_D517();
    _id_D511();
}

_id_D517()
{
    self endon( "disconnect" );
    self endon( "death_delay_finished" );
    var_0 = [ "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_characterproxy", "physicscontents_glass", "physicscontents_itemclip" ];
    var_1 = physics_createcontents( var_0 );
    var_2 = vectornormalize( self.origin - self._id_8FE6.origin );
    var_3 = self.origin + ( 0, 0, 42 );
    var_4 = var_3 + var_2 * 120.0;
    var_5 = scripts\engine\trace::_id_E406( var_3, var_4, 2.0, self, var_1, 0 );
    var_6 = var_5["position"];

    while ( istrue( self._id_FF08 ) )
    {
        if ( !isdefined( self._id_8FE6 ) )
            break;

        var_7 = distance( var_6, self._id_8FE6.origin );
        var_8 = 0.0;
        var_9 = max( var_7 - 12.0, 1.0 );
        var_10 = var_7 + 12.0;
        var_11 = var_10 + 50.0;
        var_12 = 8.0;
        var_13 = 4.5;
        _id_0CBC( var_8, var_9, var_10, var_11, var_12, var_13 );
        waitframe();
    }
}

_id_D511()
{
    self._id_FF08 = 0;
    _id_0CBC( 0, 0, 512, 512, 4, 0 );
}

_id_D51D()
{
    self._id_FF08 = 1;
    _id_0CBC( 0, 0, 512, 512, 4, 0 );
}

_id_D515()
{
    self._id_FF08 = 1;
    _id_0CBC( 0, 128, 512, 4000, 6, 1.8 );
}

_id_D50E()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 1000, 6500, 7, 3.5 );
}

_id_D510()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 1000, 6500, 7, 3.5 );
}

_id_D50F()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 1000, 1000, 7, 0 );
}

_id_D51E()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 120, 1000, 6500, 7, 3.5 );
}

_id_D51F()
{
    self._id_FF08 = 1;
    _id_0CBC( 0, 110, 512, 4096, 6, 1.8 );
}

_id_D513()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 1000, 1000, 7, 0 );
}

_id_D514()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 1000, 6500, 10, 5 );
}

_id_D518()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 1000, 5000, 4, 3.5 );
}

_id_D519()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 800, 4000, 4.5, 3.5 );
}

_id_D51A()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 600, 3000, 5, 3.5 );
}

_id_D51B()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 500, 2000, 5.5, 3.5 );
}

_id_D51C()
{
    self._id_FF08 = 1;
    _id_0CBC( 10, 80, 400, 1000, 6, 3.5 );
}

_id_5245( var_0, var_1 )
{
    var_2 = scripts\common\input_allow::allow_input_internal( "spawn_ignore", var_0, var_1 );

    if ( isdefined( var_2 ) )
        self _meth_868C( !var_2 );
}

_id_8970()
{
    return scripts\common\input_allow::_id_85F2( "spawn_ignore" );
}

_id_392A()
{
    self._id_01BD = -1;
    self._id_0249 = -1;
    self._id_005F = 0;
    self._id_0060 = 0;
    self._id_032E = 0;
    self._id_03C4 = 0;
}

_id_88AD()
{
    if ( isai( self ) )
        return 0;

    if ( self._id_03C4 )
    {
        if ( self._id_01BD == -1 && self._id_0249 == -1 )
            return 0;
    }

    return self._id_03C4;
}

_id_10966( var_0, var_1 )
{
    self endon( "death_or_disconnect" );
    var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    for (;;)
    {
        if ( self.health != self.maxhealth )
            var_2 = 0;
        else
            var_2 = var_2 + var_1;

        wait( var_1 );

        if ( self.health == self.maxhealth && var_2 >= var_0 )
            break;
    }

    return;
}

_id_151E( var_0, var_1 )
{
    scripts\common\input_allow::allow_input_internal( "health_regen", var_0, var_1 );
}

_id_85D2()
{
    return scripts\common\input_allow::_id_85F2( "health_regen" );
}

_id_153B( var_0, var_1 )
{
    scripts\common\input_allow::allow_input_internal( "one_hit_melee_victim", var_0, var_1 );
}

_id_8639()
{
    return scripts\common\input_allow::_id_85F2( "one_hit_melee_victim" );
}

_id_1517( var_0, var_1 )
{
    scripts\common\input_allow::allow_input_internal( "flashed", var_0, var_1 );
}

_id_8539()
{
    return scripts\common\input_allow::_id_85F2( "flashed" );
}

_id_155D( var_0, var_1 )
{
    scripts\common\input_allow::allow_input_internal( "stunned", var_0, var_1 );
}

_id_853A()
{
    return scripts\common\input_allow::_id_85F2( "stunned" );
}

_id_155C( var_0, var_1 )
{
    scripts\common\input_allow::allow_input_internal( "stick_kill", var_0, var_1 );
}

_id_86BB()
{
    return scripts\common\input_allow::_id_85F2( "stick_kill" );
}

_id_0CC7( var_0 )
{
    if ( isdefined( self._id_EAF4 ) && self._id_EAF4 == var_0 )
        return;

    self _meth_84A3( var_0 );
    self._id_EAF4 = var_0;
}

_id_D8E5( var_0, var_1 )
{
    if ( !self _meth_86EB() || !self _meth_8677( "wind" ) || !isreallyalive( self ) )
        return;

    self._id_9A50 = var_1;
    self setscriptablepartstate( "wind", var_0, 0 );
}

_id_BD13( var_0 )
{
    if ( getdvarint( "scr_debug_spawn_print", 0 ) == 1 )
    {
        if ( isdefined( self._id_E274 ) )
            return;
    }
}

_id_39FC( var_0, var_1 )
{
    var_2 = undefined;

    switch ( var_0 )
    {
        case "flash":
            var_2 = 0;
            break;
        case "stun":
            var_2 = 2;
            break;
        case "gas":
            var_2 = 3;
            break;
        case "fire":
            var_2 = 1;
            break;
    }

    if ( isdefined( var_2 ) )
    {
        var_3 = 0;

        if ( var_2 != 1 )
            var_3 = scripts\mp\utility\perk::_hasperk( "specialty_tac_mask" );

        if ( var_1 != -1 )
            var_1 = int( var_1 * 1000 );

        self _meth_8839( var_2, var_1, gettime() + var_1, var_3 );
    }
}
