// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_1D19()
{
    var_0 = _id_09B9::_id_10141( "equip_at_mine", 1 );
    var_0._id_0333 = 100;
    var_0._id_F60F = ::_id_1D22;
}

_id_1D21( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );

    if ( scripts\mp\utility\perk::_hasperk( "specialty_rugged_eqp" ) )
        var_0._id_758C = 1;

    var_0 _id_0765::_id_C2A7( 2, ::_id_4753 );
    thread scripts\mp\weapons::_id_A0F3( self, var_0 );
    var_0 thread _id_1D28();
    var_1 = spawnstruct();
    var_1._id_F1CD = 100;
    var_1._id_F1CE = -50;
    var_1._id_32E8 = 3;
    var_1._id_32EE = 0.5;
    var_1._id_32E6 = 1;
    var_1._id_B1C0 = 0.5;
    var_1._id_B1BF = 15;
    var_1._id_B1C1 = 12;
    var_1._id_B1BE = 20;
    var_1._id_B1C2 = 45;
    var_1._id_B1C3 = 0.342;
    var_0 setscriptablepartstate( "visibility", "show", 0 );
    var_0 waittill( "missile_stuck", var_2 );

    if ( isdefined( var_2 ) )
        var_0 linkto( var_2 );

    thread _id_1D1C( var_0 );
}

_id_1D20()
{
    if ( istrue( level._id_432C ) )
        return;

    if ( isdefined( self._id_4325 ) )
        _id_07EE::_id_C511( self._id_4325 );

    self._id_4325 = _id_07EE::_id_110C( self.origin, _id_07EE::_id_69B5(), 72, self.owner.team, undefined, self.owner, 0, self, 1 );
}

_id_1D1C( var_0 )
{
    var_0 endon( "mine_destroyed" );
    var_0 endon( "death" );
    var_0 setotherent( self );
    var_0 setentityowner( self );
    var_0 _meth_85B7();
    var_0 _meth_85B8();
    var_0 _meth_8357( 1 );
    var_0 setscriptablepartstate( "plant", "active", 0 );
    self setscriptablepartstate( "equipATMineFXView", "plant", 0 );
    scripts\mp\weapons::_id_AABC( var_0, "equip_at_mine", ::_id_1D12 );
    thread scripts\mp\weapons::_id_A0F2( self, var_0 );
    var_0 _id_07E9::_id_C2A4( "Lethal_Static", var_0.owner, 1 );
    var_0 thread scripts\mp\weapons::_id_9EBB();
    var_0 thread _id_1D23();
    var_0 _id_0764::_id_D151( ::_id_1D14 );
    var_0 _id_1D20();
    wait 1.5;
    var_0 thread _id_07A4::_id_C330( ::_id_1D16, 1, 1 );
    var_0 setscriptablepartstate( "arm", "active", 0 );
    var_0 thread _id_1D2A();
    var_0 thread scripts\mp\weapons::_id_99D8( "tag_use", 1 );
    thread scripts\mp\weapons::_id_ACC5( var_0 );
    var_0._id_75D8 = var_0 _id_0766::_id_D587( 0, 0, undefined, undefined, undefined, 0.1, 1 );
}

_id_1D16( var_0 )
{
    thread _id_1D12( 5 );

    if ( !isdefined( var_0 ) )
        var_0 = self.owner;

    self setentityowner( var_0 );
    self _meth_85AC();
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "trigger", "neutral", 0 );
    self setscriptablepartstate( "explode", "fromPlayer", 0 );
    self setscriptablepartstate( "hacked", "neutral", 0 );
}

_id_1D17( var_0 )
{
    var_0 dodamage( 200, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon( "at_mine_mp" ) );
    var_1 = var_0 _id_0A62::_id_A58E( self.owner, makeweapon( "at_mine_mp" ), self, "MOD_EXPLOSIVE" );
    thread _id_1D18();
    waitframe();

    if ( isdefined( var_0 ) )
        var_0 _id_0A62::_id_A593( var_1 );
}

_id_1D18()
{
    thread _id_1D12( 5 );
    self setentityowner( self.owner );
    self _meth_85AC();
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "launch", "neutral", 0 );
    self setscriptablepartstate( "explode", "fromVehicle", 0 );
}

_id_1D15( var_0 )
{
    thread _id_1D12( 5 );
    self setentityowner( var_0 );
    self _meth_85AC();
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "launch", "neutral", 0 );
    self setscriptablepartstate( "explode", "fromDamage", 0 );
}

_id_1D13( var_0 )
{
    thread _id_1D12( 5 );
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "launch", "neutral", 0 );
    self setscriptablepartstate( "destroy", "active", 0 );
}

_id_1D12( var_0 )
{
    self notify( "death" );
    level._id_9ECB[self getentitynumber()] = undefined;
    self setscriptablepartstate( "hack_usable", "off" );
    self setcandamage( 0 );
    scripts\mp\weapons::_id_99D5();
    _id_0766::_id_D586( self._id_75D8 );
    self._id_75D8 = undefined;
    self._id_57AE = 1;

    if ( isdefined( self._id_4325 ) )
    {
        _id_07EE::_id_C511( self._id_4325 );
        self._id_4325 = undefined;
    }

    if ( isdefined( self.owner ) )
        self.owner scripts\mp\weapons::_id_C48A( self );

    if ( isdefined( self._id_4320 ) )
        self._id_4320 delete();

    var_1 = self _meth_8150();

    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3 ) && isdefined( var_3._id_5542 ) && var_3._id_5542 == "equip_claymore" && !istrue( var_3._id_57AE ) )
                var_3 thread _id_09DC::_id_37EF();
        }
    }

    if ( isdefined( var_0 ) )
        wait( var_0 );

    _id_0765::_id_47E6();
    self delete();
}

_id_1D2A()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger_grenade", var_0 );

        foreach ( var_2 in var_0 )
        {
            if ( var_2.classname == "script_vehicle" )
            {
                if ( var_2 _id_09B9::_id_10146( self ) )
                    continue;

                if ( !_id_09B9::_id_1014A( var_2, self ) )
                    continue;

                _id_09B9::_id_10147( var_2, self );
                break;
            }

            if ( var_2.classname == "agent" || var_2.classname == "player" )
            {
                if ( !isplayer( var_2 ) && !isagent( var_2 ) )
                    continue;

                if ( isdefined( var_2._id_FFF1 ) )
                    continue;

                if ( !scripts\mp\utility\player::isreallyalive( var_2 ) )
                    continue;

                thread _id_1D1D( var_2 );
                break;
            }
        }
    }
}

_id_1D1D( var_0 )
{
    self endon( "mine_destroyed" );
    self endon( "death" );
    self notify( "mine_triggered" );
    self._id_F615 = 1;
    scripts\mp\weapons::_id_99D5();
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "trigger", "active", 0 );
    var_1 = scripts\mp\utility\weapon::_id_0C1F( "at_mine_ap_mp", self.origin, ( 0, 0, 0 ), 100, 1 );
    var_1 linkto( self );
    thread _id_1D0E( var_1 );
    var_1._id_10D0A = makeweapon( "at_mine_ap_mp" );
    self._id_4320 = var_1;
    scripts\mp\weapons::_id_57CC( var_0, 0.1 );
    thread _id_1D25();
}

_id_1D22( var_0, var_1 )
{
    var_1 endon( "mine_destroyed" );
    var_1 endon( "death" );
    var_1.owner endon( "disconnect" );
    var_1 notify( "mine_triggered" );
    var_1 scripts\mp\weapons::_id_99D5();
    var_1 setscriptablepartstate( "arm", "neutral", 0 );
    var_1 setscriptablepartstate( "trigger", "active", 0 );
    wait 0.2;
    var_1 thread _id_1D17( var_0 );
}

_id_1D27( var_0 )
{
    self endon( "death" );
    self._id_01EA scripts\engine\utility::_id_108A6( var_0, "death", "mine_destroyed" );

    if ( isdefined( self._id_01EA ) )
        self moveto( self.origin, 0.05, 0, 0 );

    while ( isdefined( self._id_01EA ) )
        waitframe();

    self delete();
}

_id_4753()
{
    _id_1D12( 0 );
}

_id_1D25()
{
    self endon( "mine_destroyed" );
    self endon( "death" );
    var_0 = 0.8;

    if ( var_0 > 0 )
    {
        var_1 = ( 0, 0, 1 );
        var_2 = self.origin + var_1 * 64;
        var_3 = physics_createcontents( [ "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle", "physicscontents_missileclip" ] );
        var_4 = _id_0A68::_id_6589();
        var_5 = self.origin;
        var_6 = var_2;
        var_7 = _func_02BC( var_5, var_6, var_3, var_4, 0, "physicsquery_closest", 1 );

        if ( isdefined( var_7 ) && var_7.size > 0 )
        {
            var_8 = vectordot( var_7[0]["position"] - var_5, var_1 );
            var_8 = max( 0, var_8 - 1 );
            var_0 = 0;
            var_2 = self.origin;

            if ( var_8 > 0 )
            {
                var_0 = var_8 / 64 * 0.8;
                var_2 = self.origin + var_1 * var_8;
            }
        }

        if ( var_0 > 0 )
        {
            var_9 = var_0;
            var_10 = var_9 * 0.81;
            var_9 = var_9 - var_10;
            var_11 = 0;

            if ( var_9 > 0 )
                var_11 = var_9 * 0;

            var_12 = spawn( "script_model", self.origin );
            var_12.angles = vectortoangles( anglestoforward( self.angles ) * ( 1, 1, 0 ) );
            var_12 setmodel( "tag_origin" );
            self._id_A239 = var_12;
            var_12._id_01EA = self;
            self linkto( var_12, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
            var_12 moveto( var_2, var_0, var_11, var_10 );
            var_12 thread _id_1D27( var_0 );
            thread _id_1D26( var_0 );
            wait( var_0 );
            thread _id_1D16();
            return;
        }
    }
}

_id_1D26( var_0 )
{
    self endon( "mine_destroyed" );
    self endon( "death" );
    self setscriptablepartstate( "launch", "active", 0 );
}

_id_1D14( var_0 )
{
    var_1 = var_0.attacker;

    if ( istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_1 ) ) )
    {
        var_1 notify( "destroyed_equipment" );
        var_1 scripts\mp\killstreaks\killstreaks::_id_6FCD( self );
    }

    if ( isplayer( var_1 ) )
        var_1 _id_079B::_id_FC44( "" );

    thread _id_1D13();
}

_id_1D23()
{
    self endon( "death" );
    self waittill( "detonateExplosive", var_0 );

    if ( isdefined( var_0 ) )
        thread _id_1D15( var_0 );
    else if ( isdefined( self.owner ) )
        thread _id_1D15( self.owner );
    else
        thread _id_1D13();
}

_id_1D28()
{
    self endon( "mine_destroyed" );
    self endon( "death" );
    level scripts\engine\utility::waittill_any_2( "game_ended", "bro_shot_start" );
    thread _id_1D13();
}

_id_1D11( var_0 )
{
    var_0 dodamage( 200, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon( "at_mine_mp" ) );
    var_1 = var_0 _id_0A62::_id_A58E( self.owner, makeweapon( "at_mine_mp" ), self, "MOD_EXPLOSIVE" );
    waitframe();

    if ( isdefined( var_0 ) )
        var_0 _id_0A62::_id_A593( var_1 );
}

_id_1D1A( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_1 ) )
        return var_4;

    if ( var_3 != "MOD_EXPLOSIVE" )
        return var_4;

    if ( !isdefined( var_2 ) )
        return var_4;

    if ( isnullweapon( var_2 ) )
        return var_4;

    if ( var_2.basename != "at_mine_mp" && var_2.basename != "at_mine_ap_mp" )
        return var_4;

    var_5 = anglestoup( var_1.angles );
    var_6 = var_1.origin - self geteye();
    var_7 = vectordot( var_6, var_5 );

    if ( var_7 > 46 )
        return 0;

    var_6 = self.origin - var_1.origin;
    var_8 = vectordot( var_6, var_5 );

    if ( var_8 > 46 )
        return 0;

    if ( var_2.basename == "at_mine_ap_mp" || istrue( var_1._id_F615 ) )
    {
        if ( var_7 >= 0 )
        {
            var_9 = var_0 getstance();

            if ( var_9 == "prone" )
                var_4 = int( min( var_4, 35 ) );
            else if ( var_9 == "crouch" || self issprintsliding() )
                var_4 = int( min( var_4, 55 ) );
        }
    }

    return var_4;
}

_id_1D0E( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );
    var_0 delete();
}

_id_1D1B( var_0 )
{
    self setscriptablepartstate( "hacked", "active", 0 );
    _id_1D20();
    thread scripts\mp\weapons::_id_A0F2( self.owner, self );
    thread scripts\mp\weapons::_id_ACC5( self );
}
