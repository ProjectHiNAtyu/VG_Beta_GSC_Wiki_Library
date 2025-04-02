// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_10FB6()
{
    level._effect["wristrocket_explode"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_wrist_rocket_exp.vfx" );
    level._effect["wristrocket_thruster"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_wrist_rocket_thruster" );
}

_id_10FAA()
{
    thread _id_10FAC();
}

_id_10FAB()
{
    self notify( "wristRocket_unset" );
}

_id_10FB7( var_0 )
{
    if ( var_0._id_F1DC == 1 )
        return;

    var_1 = _id_10FA6( var_0 );
    var_1._id_01EA = var_0;
    var_0 = scripts\mp\utility\weapon::_id_0C1F( "pop_rocket_mp", self.origin, ( 0, 0, 0 ), 100, 1, var_0 );
    var_0 _meth_85A1( 1 );
    var_0 linkto( var_1 );
    var_0 thread _id_10FA5( var_1 );
    var_0 thread _id_10FA4( self );
    var_1 setscriptablepartstate( "launch", "active", 0 );
    var_1 thread _id_10FB3( 2 );
    var_1 thread _id_10FB4();
}

_id_10FB3( var_0 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self notify( "wristRocket_watchFuse" );
    self endon( "wristRocket_watchFuse" );
    wait( var_0 );
    thread _id_10FA9();
}

_id_10FB4()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "missile_stuck", var_0 );

    if ( isplayer( var_0 ) )
        self.owner scripts\mp\weapons::_id_715F( self, var_0 );

    self stoploopsound();
    self setscriptablepartstate( "stuck", "active", 0 );
    self setscriptablepartstate( "beacon", "active", 0 );
    self._id_01EA _meth_85A1( 0 );
    thread _id_10FB3( 1.35 );
}

_id_10FA9()
{
    self setscriptablepartstate( "stuck", "neutral", 0 );
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "explode", "active", 0 );
    thread _id_10FA7();
}

_id_10FA7()
{
    self notify( "death" );
    self._id_57AE = 1;
    wait 0.1;
    self delete();
}

_id_10FA6( var_0 )
{
    var_1 = scripts\cp_mp\utility\weapon_utility::_magicbullet( makeweapon( "pop_rocket_proj_mp" ), var_0.origin, var_0.origin + anglestoforward( self _meth_8597() ), self );
    var_1.owner = self;
    var_1.team = self.team;
    var_1._id_10D06 = "pop_rocket_proj_mp";
    var_1._id_BA86 = "power_wristrocket";
    var_1 setotherent( self );
    var_1 setentityowner( self );
    var_1 thread _id_10FA4( self );
    return var_1;
}

_id_10FAC()
{
    self endon( "disconnect" );
    self notify( "wristRocket_watchEffects" );
    self endon( "wristRocket_watchEffects" );
    var_0 = 0;

    for (;;)
    {
        var_1 = spawnstruct();

        if ( var_0 )
            childthread _id_10FB0( var_1 );
        else
            childthread _id_10FAF( var_1 );

        childthread _id_10FAE( var_1 );
        childthread _id_10FB1( var_1 );
        childthread _id_10FAD( var_1 );
        childthread _id_10FB2( var_1 );
        var_0 = 0;
        self waittill( "wristRocket_watchEffectsRaceStart" );
        waittillframeend;
        var_2 = istrue( var_1._id_7154 );
        var_3 = istrue( var_1._id_7146 );
        var_4 = istrue( var_1._id_EB46 );
        var_5 = istrue( var_1._id_0142 );
        var_6 = istrue( var_1._id_F9AF );
        var_7 = istrue( var_1._id_764F );

        if ( var_5 )
        {
            self notify( "wristRocket_watchEffectsRaceEnd" );
            thread _id_10FA8();
            return;
        }
        else if ( var_6 )
        {
            self notify( "wristRocket_watchEffectsRaceEnd" );
            thread _id_10FA8();
            return;
        }
        else if ( var_4 )
            thread _id_10FA8();
        else if ( var_7 )
            thread _id_10FA8();
        else if ( var_3 )
            thread _id_10FA8();
        else if ( var_2 )
        {
            thread _id_10FA3();
            var_0 = 1;
        }

        self notify( "wristRocket_watchEffectsRaceEnd" );
    }
}

_id_10FAF( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );

    for (;;)
    {
        self waittill( "grenade_pullback", var_1 );

        if ( var_1.basename == "pop_rocket_mp" )
            break;
    }

    var_0._id_7154 = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

_id_10FAE( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );

    for (;;)
    {
        self waittill( "grenade_fire", var_1, var_2 );

        if ( var_2.basename == "pop_rocket_mp" )
            break;
    }

    var_0._id_7146 = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

_id_10FB1( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    self waittill( "super_started" );
    var_0._id_EB46 = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

_id_10FAD( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    self waittill( "death" );
    var_0._id_0142 = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

_id_10FB2( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    self waittill( "wristRocket_unset" );
    var_0._id_F9AF = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

_id_10FB0( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    waitframe();
    var_1 = makeweapon( "pop_rocket_mp" );

    while ( self getheldoffhand() == var_1 )
        waitframe();

    var_0._id_764F = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

_id_10FA3()
{
    self notify( "wristRocket_beginEffects" );
    self endon( "wristRocket_beginEffects" );
    self endon( "wristRocket_endEffects" );
    self setscriptablepartstate( "wristRocketWorld", "neutral", 0 );
    wait 0.15;
    self setscriptablepartstate( "wristRocketWorld", "active", 0 );
}

_id_10FA8()
{
    self notify( "wristRocket_endEffects" );
    self setscriptablepartstate( "wristRocketWorld", "neutral", 0 );
}

_id_10FB5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 != var_2 )
        return;

    if ( var_3 != "MOD_SUICIDE" )
        return;

    if ( !isdefined( var_0 ) || var_0 != var_1 )
        return;

    if ( !isdefined( var_4 ) || var_4.basename != "pop_rocket_mp" )
        return;

    var_5 = var_2 gettagorigin( "tag_weapon_left" );
    _func_01B5( var_5, 175, 200, 70, var_1, "MOD_EXPLOSIVE", "pop_rocket_mp" );
    _id_07EB::_id_7127( var_5, 0.6 );
    playfx( scripts\engine\utility::getfx( "wristrocket_explode" ), var_5 );
}

_id_10FA5( var_0, var_1 )
{
    self endon( "death" );
    self notify( "cleanupOnParentDeath" );
    self endon( "cleanupOnParentDeath" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "death" );

    if ( isdefined( var_1 ) )
        wait( var_1 );

    self delete();
}

_id_10FA4( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );

    if ( isdefined( self ) )
        self delete();
}
