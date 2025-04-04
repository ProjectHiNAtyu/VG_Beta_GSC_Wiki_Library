// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "#x3dda9f05c2c7f89ab", 0 );
    level scripts\engine\utility::_id_46C3( 0.05, ::_id_C893 );
}

_id_C893()
{
    level._id_C897 = spawnstruct();
    level._id_C897._id_32D2 = getscriptablearray( "scriptable", "code_classname" );

    if ( !isdefined( level._id_C897._id_32D2 ) || level._id_C897._id_32D2.size <= 0 )
        return;

    var_0 = 0;

    foreach ( var_2 in level._id_C897._id_32D2 )
    {
        if ( var_0 > 19 )
        {
            var_0 = 0;
            waitframe();
        }

        var_0 = var_0 + 1;

        if ( scripts\common\utility::_id_8A2C() )
        {
            if ( !isdefined( var_2.model ) || !var_2 _id_FF31() )
            {
                level._id_C897._id_32D2 = scripts\engine\utility::array_remove( level._id_C897._id_32D2, var_2 );
                continue;
            }
        }

        if ( !isdefined( var_2 _meth_8574( "Anim_Explosion", 1 ) ) && !isdefined( var_2 _meth_8574( "Anim_PlayerStandRock", 1 ) ) )
        {
            level._id_C897._id_32D2 = scripts\engine\utility::array_remove( level._id_C897._id_32D2, var_2 );
            continue;
        }

        var_2._id_01C1 = anglestoforward( var_2.angles );
        var_2._id_034F = anglestoright( var_2.angles );

        if ( !scripts\common\utility::_id_8A2C() )
        {
            var_2._id_0496 = anglestoup( var_2.angles );
            var_2._id_5FC4 = var_2 _meth_8174( 1, 0, 0 );
            var_2._id_2083 = var_2 _meth_8174( -1, 0, 0 );
            var_2._id_9187 = var_2 _meth_8174( 0, 1, 0 );
            var_2._id_C858 = var_2 _meth_8174( 0, -1, 0 );
            var_2._id_F346 = var_2 _meth_8174( 0, 0, 0.25 );
            var_2._id_739E = vectordot( var_2._id_01C1, var_2._id_5FC4 - var_2._id_2083 ) / 2;
            var_2._id_73A2 = vectordot( var_2._id_034F, var_2._id_C858 - var_2._id_9187 ) / 2;
            var_2.players = [];
            var_2._id_F394 = [];
            var_2._id_C8B2 = [];
            var_2._id_C8B1 = [];
        }

        var_2 thread _id_C88D();
        var_2 thread _id_C890();
        var_2 thread _id_C892();
    }

    level thread _id_13E9();
}

_id_FF31()
{
    if ( isdefined( self._id_0375 ) && self._id_0375 == "not_rockable" )
        return 0;

    if ( issubstr( self.model, "veh8_" ) )
        return 1;
    else
        return 0;
}

_id_C890()
{
    self endon( "death" );
    self endon( "rocked" );
    self setcandamage( 1 );
    self._id_C896 = 0;
    self._id_C895 = "";

    for (;;)
    {
        self.health = 99999;
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        self._id_C896 = var_3;
        self._id_C895 = var_4;
        _id_BCDA( self.origin + ( 0, 0, 0 ), "Damage by: " + var_4 + " " + var_0, ( 1, 1, 1 ), 1, 0.25, 100 );
    }
}

_id_C892()
{
    self endon( "death" );
    self waittillmatch( "scriptableNotification", "anim_explosion" );
    self notify( "rocked" );

    if ( _func_010E( self._id_C895 ) )
    {
        var_0 = self._id_C896 - self.origin;
        var_1 = scripts\engine\utility::ter_op( vectordot( self._id_01C1, var_0 ) > 0, "front", "back" );
        var_2 = scripts\engine\utility::ter_op( vectordot( self._id_034F, var_0 ) > 0, "right", "left" );
        self setscriptablepartstate( "Anim_Explosion", var_1 + "_" + var_2, 0 );
        _id_BCDA( self.origin + ( 0, 0, -5 ), "Death by: " + self._id_C895, ( 1, 0, 0 ), 1, 0.25, 1000 );
        _id_BCDA( self.origin + ( 0, 0, 12 ), "Animation: " + var_1 + "_" + var_2, ( 1, 1, 1 ), 1, 0.25, 1000 );
    }
    else
    {
        var_3 = [ "front_left", "front_right", "back_left", "back_right" ];
        var_4 = var_3[randomint( var_3.size - 1 )];
        self setscriptablepartstate( "Anim_Explosion", var_4, 0 );
        _id_BCDA( self.origin + ( 0, 0, -5 ), "Death by: " + self._id_C895, ( 1, 0, 0 ), 1, 0.25, 1000 );
        _id_BCDA( self.origin + ( 0, 0, 5 ), "scripted explosion", ( 1, 0, 0 ), 1, 0.5, 500 );
        _id_BCDA( self.origin + ( 0, 0, 10 ), "Animation: " + var_4, ( 1, 1, 1 ), 1, 0.25, 1000 );
    }

    self waittillmatch( "scriptableNotification", "anim_explosion_complete" );
    thread _id_C891();
}

_id_C891()
{
    self endon( "death" );

    for (;;)
    {
        self.health = 99999;
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

        if ( _func_010E( var_4 ) && var_0 > 10 )
            self setscriptablepartstate( "Anim_Explosion", "rock", 1 );

        _id_BCDA( self.origin + ( 0, 0, 7 ), "Death animation: rock", ( 1, 1, 1 ), 1, 0.25, 1000 );
        _id_BCDA( self.origin + ( 0, 0, 0 ), "Death damage by: " + var_4 + " " + var_0, ( 1, 1, 1 ), 1, 0.25, 150 );
    }
}

_id_C88D()
{
    self endon( "death" );

    if ( getdvarint( "#x3dda9f05c2c7f89ab" ) )
    {
        for (;;)
        {
            _id_BCDA( self.origin + ( 0, 0, 60 ), "rockable", ( 1, 1, 1 ), 1, 0.5, 2 );
            waitframe();
            waitframe();
        }
    }
}

_id_13E9()
{
    level._id_13F2 = spawnstruct();
    level._id_13F2._id_32D2 = level._id_C897._id_32D2;
    var_0 = 0;

    foreach ( var_2 in level._id_13F2._id_32D2 )
    {
        if ( var_0 > 19 )
        {
            var_0 = 0;
            waitframe();
        }

        var_0 = var_0 + 1;

        if ( !isdefined( var_2._id_0375 ) || var_2._id_0375 != "car_alarm" || !isdefined( var_2 _meth_8677( "Car_Alarm" ) ) )
        {
            level._id_13F2._id_32D2 = scripts\engine\utility::array_remove( level._id_13F2._id_32D2, var_2 );
            continue;
        }

        var_2 thread _id_13E8();
    }
}

_id_13E8()
{
    self endon( "death" );
    self endon( "rocked" );
    self endon( "stop_alarm" );
    self setcandamage( 1 );
    self._id_13F3 = 0;
    thread _id_13E7();

    for (;;)
    {
        self.health = 99999;
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        _id_BCDA( self.origin + ( 0, 0, -7 ), "Alarm damage by: " + var_4 + " " + var_0, ( 1, 1, 1 ), 1, 0.25, 150 );
        self._id_13F3 = self._id_13F3 + var_0;
        waitframe();

        if ( self._id_13F3 > 200 )
        {
            self setscriptablepartstate( "Car_Alarm", "on", 0 );
            level notify( "car_alarm", self );
            break;
        }
    }
}

_id_13E7()
{
    self endon( "death" );

    if ( getdvarint( "#x3dda9f05c2c7f89ab" ) )
    {
        for (;;)
        {
            _id_BCDA( self.origin + ( 0, 0, 70 ), "alarm.  dmg: " + self._id_13F3, ( 1, 1, 1 ), 1, 0.5, 2 );
            waitframe();
            waitframe();
        }
    }
}

_id_BCDA( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( getdvarint( "#x3dda9f05c2c7f89ab" ) )
        return;
}
