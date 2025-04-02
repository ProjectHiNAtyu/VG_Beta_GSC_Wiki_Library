// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_0BA5["vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx"] = loadfx( "vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx" );
    level._id_0BA5["vfx/iw8_mp/perk/vfx_emp_drone_airexp.vfx"] = loadfx( "vfx/iw8_mp/perk/vfx_emp_drone_airexp.vfx" );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "emp_drone", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "emp_drone", "init" ) ]]();
}

_id_5175()
{
    self endon( "death_or_disconnect" );
    self endon( "reconDroneEnded" );
    self endon( "reconDroneUnset" );

    if ( !scripts\cp_mp\vehicles\vehicle_tracking::_id_C58D() )
        return 0;

    thread _id_518A();
    return 1;
}

_id_518A()
{
    var_0 = scripts\cp_mp\utility\killstreak_utility::_id_4034( "emp_drone", self );
    var_1 = _id_518C( var_0 );

    if ( !var_1 )
        scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();

    wait 0.05;

    if ( var_1 )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "supers", "superUseFinished" ) )
            [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "supers", "superUseFinished" ) ]]();

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "sound", "trySayLocalSound" ) )
            level thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "sound", "trySayLocalSound" ) ]]( self, "use_emp_drone" );
    }
    else if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "supers", "superUseFinished" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "supers", "superUseFinished" ) ]]( 1 );
}

_id_518C( var_0 )
{
    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
            return 0;
    }

    var_1 = _id_0990::_id_EA02( var_0, ::_id_518F );

    if ( !istrue( var_1 ) )
        return 0;

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
            return 0;
    }

    thread _id_5189( var_0 );
    return 1;
}

_id_517F( var_0, var_1, var_2 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "equipment", "takeEquipment" ) )
        self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "equipment", "takeEquipment" ) ]]( var_1 );

    var_3 = scripts\cp_mp\utility\killstreak_utility::_id_4034( "emp_drone", self );
    var_4 = _id_518C( var_3 );

    if ( !var_4 )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "equipment", "giveEquipment" ) )
            self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "equipment", "giveEquipment" ) ]]( "equip_empdrone", var_1 );
    }
}

_id_518F( var_0 )
{
    return 1;
}

_id_5189( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self _meth_865C();
    scripts\common\utility::_id_1516( 0 );
    scripts\common\utility::_id_152C( 0 );
    scripts\common\utility::_id_156B( 0 );
    scripts\common\utility::_id_1562( 0 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "allowGesture" ) )
        self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "allowGesture" ) ]]( 0 );

    var_1 = _id_5179( var_0 );
    var_1._id_87A5 = 1;
    var_1._id_FE44 = 0;
    var_1._id_EB2E = level._id_EB28._id_E76A["super_emp_drone"]._id_7C71;
    self _meth_8093( var_1 );
    self _meth_805E( var_1, "tag_origin" );
    self setplayerangles( var_1.angles );
    self _meth_8251();
    scripts\cp_mp\utility\killstreak_utility::_id_8DA5();
    self setclientomnvar( "ui_emp_drone_overlay", 1 );
}

_id_5179( var_0 )
{
    var_1 = _id_5183();
    var_2 = vectortoangles( var_1._id_EEF2 - var_1._id_03DE );
    scripts\cp_mp\vehicles\vehicle_tracking::_id_396E();
    var_3 = spawnstruct();
    var_3.origin = var_1._id_03DE;
    var_3.angles = var_2;
    var_3._id_02AF = "veh8_ind_air_bombing_drone";
    var_3.type = "rcplane_physics_mp";
    var_3._id_045A = "rcplane";
    var_3._id_317A = 1;
    var_4 = spawnstruct();
    var_5 = scripts\cp_mp\vehicles\vehicle_tracking::_id_0D58( var_3, var_4 );

    if ( !isdefined( var_5 ) )
        return;

    var_5 setotherent( self );
    var_5 setentityowner( self );
    var_5.owner = self;
    var_5._id_AD91 = self getentitynumber();
    var_5.team = self.team;
    var_5.streakinfo = var_0;
    var_5 setcandamage( 1 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "killstreakMakeVehicle" ) )
        var_5 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "killstreakMakeVehicle" ) ]]( var_0._id_EA0F );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "killstreakSetPreModDamageCallback" ) )
        var_5 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "killstreakSetPreModDamageCallback" ) ]]( var_0._id_EA0F );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "killstreakSetPostModDamageCallback" ) )
        var_5 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "killstreakSetPostModDamageCallback" ) ]]( var_0._id_EA0F );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "killstreakSetDeathCallback" ) )
        var_5 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "killstreakSetDeathCallback" ) ]]( var_0._id_EA0F, ::_id_5186 );

    scripts\cp_mp\vehicles\vehicle_tracking::_id_102C3( var_5, var_5._id_1031C );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "addToActiveKillstreakList" ) )
        var_5 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "addToActiveKillstreakList" ) ]]( var_0._id_EA0F, "Killstreak_Air", self, 0, 1, 25 );

    self notifyonplayercommand( "emp_drone_detonate", "+attack" );
    var_5 playloopsound( "iw8_rc_plane_engine" );
    var_5 thread _id_518B();
    var_5 thread _id_5178();
    var_5 thread _id_518E();
    var_5 thread _id_518D();
    var_5 _id_0764::_id_D151( ::_id_517D );
    return var_5;
}

_id_5183()
{
    var_0 = scripts\cp_mp\utility\killstreak_utility::_id_6ABC();
    var_1 = ( 0, 0, 600 );

    if ( isdefined( var_0 ) )
    {
        var_2 = var_0.origin[2] + -100;
        var_1 = ( 0, 0, var_2 );
    }

    var_3 = anglestoforward( self.angles );
    var_4 = var_1 + self.origin;
    var_5 = var_4 - var_3 * 4000;
    var_6 = var_4;
    var_7 = spawnstruct();
    var_7._id_03DE = var_5;
    var_7._id_EEF2 = var_6;
    return var_7;
}

_id_518B()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self endon( "death" );
    var_0 = 20;

    while ( var_0 > 0 )
    {
        self.owner setclientomnvar( "ui_killstreak_countdown", gettime() + int( var_0 * 1000 ) );
        var_0 = var_0 - 0.05;
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 0.05 );
    }

    thread _id_517B();
}

_id_5178()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self endon( "death" );
    self _meth_8652( 1 );
    self waittill( "collision", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
    thread _id_5181();
}

_id_518D()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self endon( "death" );
    self endon( "emp_drone_exited" );
    self.owner waittill( "emp_drone_detonate" );
    thread _id_5181();
}

_id_518E()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self endon( "death" );
    self endon( "emp_drone_exited" );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "allowRideKillstreakPlayerExit" ) )
        self thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "allowRideKillstreakPlayerExit" ) ]]( "death" );

    self waittill( "killstreakExit" );
    self setotherent( undefined );
    self setentityowner( undefined );
    thread _id_5180();
}

_id_5186( var_0 )
{
    var_1 = var_0.attacker;
    _id_5185( var_1 );
    _id_517B();
}

_id_5181()
{
    self playsound( "iw8_rc_plane_engine_exp" );
    var_0 = anglestoforward( self.angles );
    playfx( level._id_0BA5["vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx"], self.origin, var_0 );
    _id_5182();
    _id_517A();
}

_id_517B()
{
    self playsound( "recondrone_damaged" );
    var_0 = anglestoforward( self.angles );
    playfx( level._id_0BA5["vfx/iw8_mp/perk/vfx_emp_drone_airexp.vfx"], self.origin, var_0 );
    _id_517A();
}

_id_5180()
{
    self.owner _id_5188( self );
}

_id_517A()
{
    self.owner _id_5188( self );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "dlog", "fieldUpgradeExpired" ) )
        self thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "dlog", "fieldUpgradeExpired" ) ]]( self.owner, self._id_EB2E, self._id_FE44, 0 );

    self stoploopsound( "iw8_rc_plane_engine" );
    scripts\cp_mp\vehicles\vehicle_tracking::_id_102B9( self );
    scripts\cp_mp\vehicles\vehicle_tracking::_id_0B8F( self );
}

_id_5188( var_0 )
{
    if ( !istrue( var_0._id_87A5 ) )
        return;

    if ( isdefined( level._id_8DBA ) )
        level thread [[ level._id_8DBA ]]( var_0.streakinfo );

    self painvisionon();
    scripts\cp_mp\utility\killstreak_utility::_id_8DA1();
    self _meth_8094();
    self cameralinkto( var_0 );
    _id_5177();
    scripts\common\utility::_id_1516( 1 );
    scripts\common\utility::_id_152C( 1 );
    scripts\common\utility::_id_156B( 1 );
    scripts\common\utility::_id_1562( 1 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "allowGesture" ) )
        self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "allowGesture" ) ]]( 1 );

    var_0 stoploopsound( "iw8_rc_plane_engine" );
    self _meth_824B( "emp_drone_detonate", "+frag" );
    var_0._id_87A5 = undefined;
    var_0.streakinfo notify( "killstreak_finished_with_deploy_weapon" );
    var_0 notify( "emp_drone_exited" );
}

_id_5177()
{
    self setclientomnvar( "ui_emp_drone_overlay", 0 );
}

_id_517D( var_0 )
{
    var_1 = var_0.attacker;
    _id_5185( var_1 );
    _id_517B();
}

_id_5185( var_0 )
{
    if ( istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "giveUnifiedPoints" ) )
            var_0 thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "giveUnifiedPoints" ) ]]( "destroyed_equipment" );
    }
}

_id_5182()
{
    var_0 = makeweapon( "emp_drone_non_player_mp" );
    var_1 = makeweapon( "emp_drone_non_player_direct_mp" );
    var_2 = _id_0764::_id_644F();

    foreach ( var_4 in var_2 )
    {
        if ( var_4 == self )
            continue;

        var_5 = var_4.owner;

        if ( isdefined( var_5 ) )
        {
            if ( var_5 != self.owner && !scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_5 ) )
                continue;
        }

        var_6 = distancesquared( self.origin, var_4.origin );

        if ( var_6 > 589824 )
            continue;

        var_7 = scripts\engine\utility::ter_op( var_6 > 4096, var_0, var_1 );
        var_4 dodamage( 1, self.origin, self.owner, self, "MOD_EXPLOSIVE", var_7 );
        var_8 = _id_0996::_id_ADB7( self.owner, var_4, 1, var_7, "MOD_EXPLOSIVE", self, self.origin );
        thread _id_5174( var_8 );

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "pers", "incPersStat" ) )
            self.owner [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "pers", "incPersStat" ) ]]( "empDroneHits", 1 );

        self._id_FE44++;
    }

    var_10 = makeweapon( "emp_drone_player_mp" );
    _func_01B5( self.origin, 64, 60, 1, self.owner, "MOD_EXPLOSIVE", var_10 );
    var_11 = undefined;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "getPlayersInRadius" ) )
        var_11 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "getPlayersInRadius" ) ]]( self.origin, 768 );

    foreach ( var_13 in var_11 )
    {
        if ( !var_13 _id_0764::_id_309C() )
            continue;

        if ( var_13 != self.owner && !scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_13 ) )
            continue;

        var_13 dodamage( 1, self.origin, self.owner, self, "MOD_EXPLOSIVE", var_10 );
        var_8 = _id_0996::_id_ADB7( self.owner, var_13, 1, var_10, "MOD_EXPLOSIVE", self, self.origin );
        thread _id_5174( var_8 );
    }
}

_id_5174( var_0 )
{
    _id_0764::_id_1991( var_0 );
    var_1 = 8;

    if ( isplayer( var_0._id_103C0 ) )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "perk", "hasPerk" ) )
        {
            if ( var_0._id_103C0 != self.owner && var_0._id_103C0 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "perk", "hasPerk" ) ]]( "specialty_emp_resist" ) )
            {
                var_1 = 2;

                if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "damage", "updateDamageFeedback" ) )
                    self.owner [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "damage", "updateDamageFeedback" ) ]]( "hittacresist" );
            }
        }

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "gamescore", "trackDebuffAssist" ) )
            [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "gamescore", "trackDebuffAssist" ) ]]( var_0.attacker, var_0._id_103C0, var_0.objweapon.basename );
    }

    _id_517E( var_0, var_1 );

    if ( isdefined( var_0._id_103C0 ) )
    {
        var_0._id_103C0 _id_0764::_id_C3A0();

        if ( isdefined( var_0.attacker ) && isplayer( var_0._id_103C0 ) )
        {
            if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "gamescore", "untrackDebuffAssist" ) )
                [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "gamescore", "untrackDebuffAssist" ) ]]( var_0.attacker, var_0._id_103C0, var_0.objweapon.basename );
        }
    }
}

_id_517E( var_0, var_1 )
{
    var_0._id_103C0 endon( "death_or_disconnect" );
    level endon( "game_ended" );
    var_2 = scripts\engine\utility::_id_108F5( "emp_cleared", var_1 );

    if ( var_2 != "emp_cleared" )
        var_0._id_519D = 1;
}
