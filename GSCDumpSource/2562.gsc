// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_0C3B = [];
    scripts\mp\killstreaks\killstreaks::_id_C25C( "s2_fritzx", ::_id_F77D );
    setdvar( "lui_draw_hints", 0 );
    level._effect["fritz_streamers"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["fritz_explosion_1P"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["fritz_flying_1P"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["glidebomb_hatchdoors_light_bright"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["glidebomb_hatchdoors_light_med"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["glidebomb_hatchdoors_light_low"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_0C3B["Audio"] = spawnstruct();
    level._id_0C3B["Launch_Value"] = spawnstruct();
    level._id_0C3B["Launch_Value"]._id_103AB = 24000;
    level._id_0C3B["Launch_Value"]._id_7A1A = 7000;
    level._id_0C3B["Launch_Value"]._id_EE9C = 1500;
    level._id_8DBB["s2_fritzx"] = ::_id_F77D;
    level._id_8DD6["fritzx_projectile_mp"] = "s2_fritzx";
    level._id_8DD6["azon_projectile_mp"] = "s2_fritzx";
    level._id_8DD6["fritzx_projectile_grenadier_mp"] = "s2_fritzx";
    level._id_8DD6["azon_projectile_grenadier_mp"] = "s2_fritzx";
}

_id_F77D( var_0 )
{
    var_1 = 0;

    if ( scripts\mp\utility\game::_id_8722() )
        return 0;

    if ( isdefined( self._id_AE3C ) && self._id_AE3C )
    {
        self iprintlnbold( &"KILLSTREAKS_DLC4_CANT_USE_STREAK_WHILE_PARATROOPING" );
        return 0;
    }

    if ( isdefined( self._id_754A ) )
    {
        scripts\mp\hud_message::_id_DCBD( "KILLSTREAKS/AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    var_2 = _id_07E3::_id_8260( "s2_fritzx", 1, 0, 0 );

    if ( var_2 != "success" )
    {
        wait 0.75;
        var_3 = self getcurrentweapon();

        if ( var_3 == "none" || _id_07E3::_id_88DC( var_3 ) )
            self _meth_83FF( _id_07E3::_id_6ADA() );

        return 0;
    }

    if ( !scripts\cp_mp\vehicles\vehicle_tracking::_id_C58D() )
        return 0;

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
        {
            scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
            return 0;
        }
    }

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
        {
            scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
            return 0;
        }
    }

    _id_07E3::_id_B77A();
    _id_07E3::_id_D8C9( "s2_fritzx" );
    self._id_5FA5 = 0;
    thread _id_E6AB( var_1 );
    return 1;
}

_id_E6AB( var_0 )
{
    _id_07E3::_id_5F44( 1 );
    var_1 = level._id_8DC1;

    if ( isdefined( level._id_7015 ) )
        var_1 = level._id_7015;

    thread _id_0A03::_id_D8D6( 0.05, level._id_8DD4, var_1 );
    _id_0A03::_id_FEC2( 1 );

    if ( level.gametype == "scorestreak_training" )
        _id_07E3::_id_39BD();

    var_2 = _id_73D5();
    thread _id_500E( var_0, var_2 );
}

_id_5FA7( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) )
        var_2 = var_0 _id_07E3::_hasperk( "specialty_improvedstreaks" );

    var_3 = 0;
    var_4 = 1;
    var_5 = 1;
    var_6 = "fritzx_projectile_mp";

    if ( var_2 )
        var_6 = "fritzx_projectile_grenadier_mp";

    var_7 = _func_00EF( var_6 );
    var_8 = 100;
    var_9 = 0;
    var_10 = _id_07E3::_id_6E54( var_6, var_9, var_8 );

    if ( var_10 > var_7 )
        var_10 = var_7;

    var_11 = var_10 * 2;
    self._id_8DDE = _id_07E3::_id_E286( "script_model", var_1 );
    self._id_8DDE _id_07E3::_id_D59F( var_0, "scorestreak_minimap_mortar_strike_kill", var_11, var_11, var_4, var_3, "", "scorestreak_minimap_mortar_strike_kill_fullscreen" );
    self._id_8DDE _id_07E3::_id_D54A( 4000, var_5 );
    self._id_8DDE _id_07E3::_id_9502( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );

    if ( var_10 < var_7 )
    {
        var_12 = var_7 * 2;
        self._id_4316 = _id_07E3::_id_E286( "script_model", var_1 );
        self._id_4316 _id_07E3::_id_D59F( var_0, "scorestreak_minimap_mortar_strike_damage", var_12, var_12, var_4, var_3, "", "scorestreak_minimap_mortar_strike_damage_fullscreen" );
        self._id_4316 _id_07E3::_id_D54A( 4000, var_5 );
        self._id_4316 _id_07E3::_id_9502( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
}

_id_5FA6()
{
    var_0 = 0;

    if ( isdefined( self._id_4316 ) )
        self._id_4316 _id_07E3::_id_D54A( 80, var_0 );

    if ( isdefined( self._id_8DDE ) )
        self._id_8DDE _id_07E3::_id_D54A( 80, var_0 );

    wait 0.08;

    if ( isdefined( self._id_4316 ) )
        self._id_4316 delete();

    if ( isdefined( self._id_8DDE ) )
        self._id_8DDE delete();
}

_id_73D5()
{
    var_0 = 120;
    var_1 = 0;
    var_2 = _id_68EF();
    thread _id_B16F();
    var_3 = spawn( "script_model", var_2._id_03DE );
    var_3 setmodel( "tag_origin" );
    var_3.angles = ( 90, 0, 0 );
    self _meth_805E( var_3, "tag_origin" );

    if ( 0 )
    {
        var_4 = spawn( "script_model", var_2._id_03DE + ( -1 * var_1, 0, -1 * var_0 - 52 ) );
        var_4 notsolid();

        if ( isdefined( self.team ) && self.team == "allies" )
            var_4 setmodel( "usa_glidebomb_hatchdoors" );
        else
            var_4 setmodel( "ger_glidebomb_hatchdoors" );

        var_4 hide();
        var_4 showtoplayer( self );
        var_4 _meth_82CA( "ks_usa_glidebomb_hatchdoors_open" );
    }
    else
    {
        var_4 = spawn( "script_model", var_2._id_03DE + ( -1 * var_1, 0, -1 * var_0 - 52 ) );
        var_4 setmodel( "tag_origin" );
    }

    var_5 = spawn( "script_model", var_2._id_03DE + ( -1 * var_1, 0, -1 * var_0 ) );

    if ( 0 )
    {
        if ( isdefined( level._id_7017 ) )
            _func_0198( scripts\engine\utility::getfx( level._id_7017 ), var_4, "TAG_ORIGIN", self );
        else
            _func_0198( scripts\engine\utility::getfx( "glidebomb_hatchdoors_light_med" ), var_4, "TAG_ORIGIN", self );

        thread _id_8D0D( var_4 );
    }

    var_6 = _func_00B9();

    if ( var_6 != 0 )
    {
        var_3.angles = var_3.angles + ( 0, var_6, 0 );
        var_4.angles = var_4.angles + ( 0, var_6, 0 );
        var_5.angles = var_5.angles + ( 0, var_6, 0 );
    }

    var_7 = "ger_glidebomb_fritzx";

    if ( isdefined( self.team ) && self.team == "allies" )
        var_7 = "usa_glidebomb_azon";

    var_5 setmodel( var_7 );
    var_5 hide();
    var_5 showtoplayer( self );

    if ( isdefined( level._id_7015 ) )
        _id_07E3::_id_9496( level._id_7015 );

    wait 0.7;

    if ( isdefined( level._id_7016 ) )
        _id_07E3::_id_9496( level._id_7016 );

    var_8 = spawnstruct();
    var_8._id_4E2C = var_4;
    var_8._id_03DE = var_2._id_03DE;
    var_8._id_0374 = var_5;
    var_8._id_2FD2 = var_3;
    var_8._id_5DF4 = var_0;
    var_8._id_764A = var_1;
    var_8._id_5FA2 = var_5.angles;
    return var_8;
}

_id_8D0D( var_0 )
{
    level waittill( "bomb_start" );

    if ( isdefined( level._id_7017 ) )
        _id_07E3::_id_8D6B( scripts\engine\utility::getfx( level._id_7017 ), var_0, "TAG_ORIGIN", self );
    else
        _id_07E3::_id_8D6B( scripts\engine\utility::getfx( "glidebomb_hatchdoors_light_med" ), var_0, "TAG_ORIGIN", self );
}

_id_500E( var_0, var_1 )
{
    var_2 = var_1._id_03DE;
    var_3 = var_1._id_03DE + ( -1 * var_1._id_764A + 68, 0, -1 * var_1._id_5DF4 );
    var_4 = _id_07E3::_hasperk( "specialty_improvedstreaks" );

    if ( isdefined( var_4 ) && var_4 )
    {
        var_5 = "azon_projectile_grenadier_mp";

        if ( isdefined( self.team ) && self.team == "axis" )
            var_5 = "fritzx_projectile_grenadier_mp";
    }
    else
    {
        var_5 = "azon_projectile_mp";

        if ( isdefined( self.team ) && self.team == "axis" )
            var_5 = "fritzx_projectile_mp";
    }

    var_1._id_0374 hide();
    var_1._id_0374 delete();
    var_6 = var_2 + ( -1 * var_1._id_764A, 0, -1 * var_1._id_5DF4 );
    var_7 = var_2 + ( 0, _func_00B9(), 0 );
    scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
    var_8 = _func_0141( var_5, var_6, var_7, self );
    var_8.angles = vectortoangles( ( 0, 0, -1 ) );
    var_8 _id_07E3::_id_C722( 1, 1 );
    var_8 thread _id_73D8( self );
    var_8.killcament = var_1._id_2FD2;
    var_8.killcament _meth_8374( "missile" );
    var_8.killcament._id_8D53 = gettime();
    var_8.owner = self;
    var_8.team = self.team;
    var_8._id_9355 = var_0;
    var_8._id_048F = "remote";
    var_8._id_764A = var_1._id_764A;
    var_8._id_5DF4 = var_1._id_5DF4;
    thread _id_4C6F( var_7, var_6 );
    self _meth_8093( var_8 );
    var_1._id_2FD2 thread _id_2FE2( var_8, self );
    level._id_C333 = 1;
    var_8 thread _id_07E3::_id_D535( 10, undefined, ::_id_9F69, undefined, 1 );
    _id_07E3::_id_978D( "s2_fritzx", var_8.origin );
    thread _id_3861( var_8, var_1 );
}

_id_4C6F( var_0, var_1 )
{
    self endon( "missile_strike_complete" );
    self endon( "ms_early_exit" );
    self endon( "disconnect" );
    wait 2;
    self _meth_865B();
    var_2 = ( var_0[0], var_0[1], var_0[2] - 10000 );
    var_3 = _id_07E3::_id_2D15( var_1, var_2, 0 );
    var_4 = var_3["position"];
    var_5 = length( var_1 - var_4 );
    self _meth_865E( 0.35, var_5, 1, 0.5, var_4 );
}

_id_B16F()
{
    _id_07E3::_id_A6C6( "ks_fritz_plr_plane", [ self ] );
}

_id_73D8( var_0 )
{
    var_1 = self;

    if ( isdefined( var_0 ) )
        thread _id_5FA4( var_1, var_0 );

    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( !isdefined( var_0 ) || var_4 != var_0 )
            var_2[var_2.size] = var_4;
    }

    if ( isdefined( var_2 ) && var_2.size > 0 )
        thread _id_5FA3( var_1, var_2 );
}

_id_5FA4( var_0, var_1 )
{
    wait 1;
    var_2 = _id_07E3::_id_A6C8( "ks_fritz_plr_inc", [ var_1 ], var_0 );
    var_0 waittill( "death" );
    _id_07E3::_id_A6C9( var_2 );
    _id_07E3::_id_A6C7( "ks_fritz_plr_exp_trans", [ var_1 ], var_0.origin );
}

_id_5FA3( var_0, var_1 )
{
    var_2 = _id_07E3::_id_A6C8( "ks_fritz_npc_inc", var_1, var_0 );
    var_0 waittill( "death" );
    _id_07E3::_id_A6C9( var_2 );
    _id_07E3::_id_A6C7( "ks_fritz_exp_trans", var_1, var_0.origin );
}

_id_2FE2( var_0, var_1 )
{
    var_1 endon( "disconnect" );
    var_1 endon( "missile_strike_complete" );
    var_1 endon( "ms_early_exit" );
    var_0 endon( "death" );
    var_2 = ( var_0._id_764A, 0, var_0._id_5DF4 );
    self.origin = var_0.origin + var_2;
    self.angles = vectortoangles( ( 0, 0, -1 ) );
    var_3 = var_0.origin;
    var_4 = 0;
    var_5 = 0;
    var_6 = _func_00B9();

    if ( var_6 != 0 )
        self.angles = self.angles + ( 0, var_6, 0 );

    level notify( "bomb_start" );

    for (;;)
    {
        var_7 = var_0._id_5DF4;
        var_8 = var_0._id_764A;
        var_9 = var_0.origin - var_3;

        if ( length( var_9 ) > 0.01 )
        {
            var_10 = vectornormalize( var_9 );

            if ( var_4 )
            {
                if ( _func_00B9() != 0 )
                    var_11 = var_10 * ( -1 * var_7 ) + ( -1 * var_8, 0, 0 );
                else
                    var_11 = var_10 * ( -1 * var_7 ) + ( 0, -1 * var_8, 0 );

                var_12 = self.angles;

                if ( var_5 < 1 )
                {
                    var_2 = _func_0259( var_2, var_11, var_5 );
                    var_12 = _id_07E3::_id_1770( self.angles, var_0.angles, var_5 );
                    var_5 = var_5 + 0.05;
                }
                else
                {
                    var_2 = var_11;
                    var_12 = var_0.angles;
                }

                self.origin = var_0.origin + var_2;
                self.angles = var_12;
            }
            else
            {
                var_13 = ( 0, 0, -1 );
                var_14 = anglestoforward( var_0.angles );
                var_15 = vectordot( var_13, var_14 );

                if ( var_15 > 0.99 )
                {
                    var_4 = 1;
                    var_1 _id_07E3::_id_5F44( 0 );

                    if ( getdvarint( "lui_draw_hints", 1 ) )
                        var_1 setclientomnvar( "ui_show_fritzx_hud", 1 );

                    var_1 thread _id_C4F9( var_0, var_1 );
                    playfxontag( scripts\engine\utility::getfx( "fritz_streamers" ), var_0, "tag_tip_fx" );
                    _func_0198( scripts\engine\utility::getfx( "fritz_flying_1P" ), var_0, "tag_tip_fx", var_1 );
                    var_11 = var_10 * ( -1 * var_7 );
                    var_2 = _func_0259( var_2, var_11, var_5 );
                    self.origin = var_0.origin + var_2;
                    self.angles = _id_07E3::_id_1770( self.angles, var_0.angles, var_5 );
                    var_5 = var_5 + 0.05;
                }
                else
                    self.origin = var_0.origin + ( var_8, 0, var_7 );
            }
        }

        var_3 = var_0.origin;
        var_1 playrumbleonentity( "damage_light" );
        wait 0.05;
    }
}

_id_3861( var_0, var_1 )
{
    var_0 thread _id_C89A();
    thread _id_B3D9( var_1, var_0 );
    thread _id_B3DA( var_0 );
    thread _id_B3DB( var_0 );
    thread _id_B801();
    self._id_754A = 1;
    var_0 waittill( "death" );
    level notify( "bomb_end" );
    var_0 thread _id_5FA6();

    if ( isdefined( self ) )
    {
        _id_0A03::_id_FEC2( 0 );
        self._id_754A = undefined;

        if ( isdefined( var_0 ) )
            _func_0198( scripts\engine\utility::getfx( "fritz_explosion_1P" ), var_0, "tag_tip_fx", self );

        self notify( "missile_strike_complete" );
    }
}

_id_C4F9( var_0, var_1 )
{
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( !isbot( var_1 ) )
    {
        var_1 notifyonplayercommand( "ExitButtonDown", "+activate" );
        var_1 notifyonplayercommand( "ExitButtonUp", "-activate" );
    }

    var_1 notifyonplayercommand( "ExitButtonDown", "+usereload" );
    var_1 notifyonplayercommand( "ExitButtonUp", "-usereload" );

    for (;;)
    {
        self waittill( "ExitButtonDown" );

        if ( isdefined( _id_10949( 0.5, var_0, var_1 ) ) )
        {
            self notify( "ms_early_exit" );
            return;
        }
    }
}

_id_10949( var_0, var_1, var_2 )
{
    var_2 endon( "disconnect" );
    level endon( "game_ended" );
    var_2 endon( "ExitButtonUp" );
    var_1 endon( "death" );
    wait( var_0 );
    return 1;
}

_id_C4F7( var_0 )
{
    if ( !isbot( var_0 ) )
    {
        var_0 _meth_824B( "ExitButtonDown", "+activate" );
        var_0 _meth_824B( "ExitButtonUp", "-activate" );
    }

    var_0 _meth_824B( "ExitButtonDown", "+usereload" );
    var_0 _meth_824B( "ExitButtonUp", "-usereload" );
}

_id_68F0( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_3._id_FF61 = [];
        var_3._id_E364 = 0;
    }

    foreach ( var_6 in level.players )
    {
        if ( !_id_07E3::isreallyalive( var_6 ) )
            continue;

        if ( var_6.team == self.team )
            continue;

        if ( var_6.team == "spectator" )
            continue;

        var_7 = 999999999;
        var_8 = undefined;

        foreach ( var_3 in var_0 )
        {
            var_3._id_FF61[var_3._id_FF61.size] = var_6;
            var_10 = distance2d( var_3._id_EE9F.origin, var_6.origin );

            if ( var_10 <= var_7 )
            {
                var_7 = var_10;
                var_8 = var_3;
            }
        }

        var_8._id_E364 = var_8._id_E364 + 2;
    }

    var_13 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        foreach ( var_6 in var_3._id_FF61 )
        {
            var_3._id_E364 = var_3._id_E364 + 1;

            if ( _id_07E3::_id_2D16( var_6.origin + ( 0, 0, 32 ), var_3.origin, 0, var_6 ) )
                var_3._id_E364 = var_3._id_E364 + 3;

            if ( var_3._id_E364 > var_13._id_E364 )
            {
                var_13 = var_3;
                continue;
            }

            if ( var_3._id_E364 == var_13._id_E364 )
            {
                if ( scripts\engine\utility::cointoss() )
                    var_13 = var_3;
            }
        }
    }

    return var_13;
}

_id_9F69( var_0, var_1, var_2, var_3 )
{
    playfx( level._id_C332["explode"], self.origin );
    var_4 = "fritzx_destroyed";
    _id_07E3::_id_AB05( var_0, var_1, var_2, var_3, var_4, undefined, undefined, 0 );
    _id_5FA6();
    self delete();
}

_id_68EF()
{
    var_0 = spawnstruct();
    var_1 = _id_07E3::_id_69E4( "remoteMissileSpawn", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.target ) )
            var_3._id_EE9F = getent( var_3.target, "targetname" );
    }

    if ( var_1.size > 0 )
        var_5 = _id_68F0( var_1 );
    else
        var_5 = undefined;

    var_0._id_03DE = undefined;
    var_0._id_EEF2 = undefined;

    if ( isdefined( var_5 ) )
    {
        var_0._id_03DE = var_5.origin;
        var_0._id_EEF2 = var_5._id_EE9F.origin;
        var_6 = 5500;

        if ( isdefined( level._id_C324 ) )
            var_6 = level._id_C324;

        var_7 = vectornormalize( var_0._id_03DE - var_0._id_EEF2 );
        var_0._id_03DE = var_7 * var_6 + var_0._id_EEF2;
    }
    else
    {
        var_8 = ( 0, 0, level._id_0C3B["Launch_Value"]._id_103AB );
        var_6 = level._id_0C3B["Launch_Value"]._id_7A1A;
        var_9 = level._id_0C3B["Launch_Value"]._id_EE9C;
        var_10 = anglestoforward( self.angles );
        var_0._id_03DE = self.origin + var_8 + var_10 * var_6 * -1;
        var_0._id_EEF2 = self.origin + var_10 * var_9;
    }

    return var_0;
}

_id_B801()
{
    scripts\engine\utility::_id_108C3( "missile_strike_complete", "ms_early_exit" );
    _id_B752();
}

_id_B752()
{
    self endon( "disconnect" );
    self _meth_8094();
    _id_07E3::_id_5F44( 1 );
    _id_C4F7( self );

    if ( !level._id_609B || isdefined( self._id_5A81 ) )
        _id_0A03::_id_B79F();

    wait 0.05;
    _id_07E3::_id_10956();
    _id_07E3::_id_D6B9( 1 );
    _id_0A03::_id_C52F( 0.05 );
    _id_0A03::_id_FEC2( 0 );
    wait 0.05;
    _id_07E3::_id_0C95();
    self cameralinkto();
    _id_07E3::_id_5F44( 0 );

    if ( _id_07E3::_id_8AB5() )
        _id_07E3::_id_396C();

    if ( getdvarint( "#x3863d66ab814c070" ) )
        _id_07E3::_id_D717( 1 );

    _id_07E3::_id_B757();
}

_id_B3DB( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    scripts\engine\utility::_id_1087D( "joined_team", "joined_spectators" );
    self notify( "missile_strike_complete" );
    level._id_C333 = undefined;
}

_id_C89A()
{
    var_0 = self getentitynumber();
    level._id_C8AB[var_0] = self;
    self waittill( "death" );
    level._id_C8AB[var_0] = undefined;
    level._id_C333 = undefined;
}

_id_B3D9( var_0, var_1 )
{
    scripts\engine\utility::_id_1087D( "ms_early_exit", "missile_strike_complete", "disconnect" );
    var_0._id_4E2C hide();
    var_0._id_4E2C delete();

    if ( isdefined( self ) )
    {
        self _meth_8094();

        if ( isdefined( var_1 ) )
            _id_07E3::_id_8D6B( scripts\engine\utility::getfx( "fritz_flying_1P" ), var_1, "tag_tip_fx", self );
    }
}

_id_B3DA( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    level waittill( "game_ended" );
    self notify( "missile_strike_complete" );
}

_id_107E8( var_0 )
{
    self endon( "missile_strike_complete" );
    wait( var_0 );
    _id_07E3::_id_D6B9( 0 );
}

_id_9197( var_0 )
{
    self endon( "disconnect" );
    self endon( "missile_strike_complete" );
    self endon( "ms_early_exit" );
    var_1 = 0.0;

    for (;;)
    {
        if ( var_1 >= 1.2 )
        {
            var_0._id_5DF4 = var_0._id_5DF4 - 4.0;

            if ( var_0._id_764A < 32 )
                var_0._id_764A = var_0._id_764A + 0.7;
            else
                var_0._id_764A = var_0._id_764A + 0.2;
        }
        else if ( var_0._id_764A < 32 )
            var_0._id_764A = var_0._id_764A + 0.5;

        if ( var_0._id_5DF4 <= 5 )
        {
            var_0._id_5DF4 = 5;
            break;
        }

        var_1 = var_1 + 0.05;
        wait 0.05;
    }
}
