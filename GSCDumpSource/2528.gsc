// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_5553()
{
    level._id_1469 = [];
    scripts\common\interactive::_id_837D( ::_id_5565, "equip_equipmentResupplyBox" );
    _id_0A6E::_id_C27C( ::_id_5561 );
    level._effect["vfx/iw8_mp/equipment/vfx_offhand_wm_supportbox_timeout.vfx"] = loadfx( "vfx/iw8_mp/equipment/vfx_offhand_wm_supportbox_timeout.vfx" );
}

_id_5561( var_0 )
{
    foreach ( var_2 in level._id_1469 )
    {
        if ( isdefined( var_2 ) )
            var_2 _id_555F( var_0 );
    }
}

_id_5564( var_0 )
{
    var_0 endon( "death" );
    var_0 thread _id_5567();
    var_0 thread equipment();
    var_0 waittill( "missile_stuck", var_1 );
    var_0 _id_5551( var_1 );

    if ( 1 )
        thread scripts\mp\weapons::_id_ACC5( var_0 );

    var_0._id_8A5A = 1;
    var_0._id_EB2E = level._id_EB28._id_E76A["super_equipment_resupply_drop"]._id_7C71;
    scripts\mp\weapons::_id_AABC( var_0, "equip_equipmentResupplyBox", ::_id_5546 );
    var_0 thread _id_07A4::_id_C330( ::_id_5548, 1, 1 );
    level._id_1469[var_0 getentitynumber()] = var_0;
    var_0 _id_0764::_id_D151( ::_id_5547 );

    if ( !istrue( var_0._id_990F ) )
        var_0 _id_5554();

    var_0._id_99CF = undefined;
    var_0 setscriptablepartstate( "visibility", "show", 0 );
    wait 0.0;

    if ( !scripts\cp_mp\utility\game_utility::_id_89D2() )
        var_0 _id_5543();

    wait 0.75;
    var_0 setscriptablepartstate( "effects", "plant", 0 );
    var_0 setscriptablepartstate( "anims", "open", 0 );
    var_0 thread _id_5556();
    wait( _id_554B() );
    var_0 setscriptablepartstate( "beacon", "active", 0 );
    var_0 setscriptablepartstate( "anims", "openIdle", 0 );
}

equipment( var_0 )
{
    self endon( "death" );
    self endon( "missile_stuck" );
    var_1 = getdvarfloat( "scr_support_box_proj_hide_duration", 0 );
    self setscriptablepartstate( "visibility", "hide", 0 );
    wait( var_1 );
    self._id_990F = 1;
    _id_5554();
    self setscriptablepartstate( "visibility", "show", 0 );
}

_id_555E()
{
    if ( 0 )
    {
        foreach ( var_1 in self._id_B1BC )
        {
            if ( var_1._id_5542 == "equip_equipmentResupplyBox" )
            {
                var_1 thread _id_5546();
                scripts\mp\weapons::_id_C48A( var_1 );
            }
        }
    }
}

_id_5548( var_0, var_1 )
{
    if ( isdefined( var_0 ) || isdefined( self.owner ) )
    {
        self _meth_85AC();

        if ( isdefined( var_0 ) )
            self setentityowner( var_0 );
        else
            self setentityowner( self.owner );
    }

    self setscriptablepartstate( "effects", "explode", 0 );
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "hacked", "neutral", 0 );
    thread _id_5545( 0.1, var_1 );
}

_id_5546( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = !istrue( self._id_B1B6 );

    var_1 = undefined;
    var_2 = 0;

    if ( !var_0 )
    {
        var_1 = _id_554A();
        var_2 = var_1 + 1;
    }

    thread _id_5545( var_2 );

    if ( isdefined( self ) )
    {
        var_3 = self.origin;
        var_4 = anglestoforward( self.angles );
        var_5 = anglestoup( self.angles );
        self setscriptablepartstate( "beacon", "neutral", 0 );
        self setscriptablepartstate( "hacked", "neutral", 0 );

        if ( !var_0 )
        {
            self setscriptablepartstate( "anims", "close", 0 );
            wait( var_1 );
            self setscriptablepartstate( "anims", "closedIdle", 0 );
            wait 1;
        }

        playfx( scripts\engine\utility::getfx( "vfx/iw8_mp/equipment/vfx_offhand_wm_supportbox_timeout.vfx" ), var_3, var_4, var_5 );
    }
}

_id_5545( var_0, var_1 )
{
    self notify( "death" );
    self._id_87E1 = 1;
    self setcandamage( 0 );

    if ( isdefined( self.owner ) )
        self.owner scripts\mp\weapons::_id_C48A( self );

    _id_555C();
    _id_5555();
    self._id_B7A9 = undefined;
    self.owner _id_0793::_id_AAD4( "super_ammo_drop", self._id_FE44 );
    _id_0780::_id_9751( self.owner, self._id_EB2E, self._id_FE44, istrue( var_1 ) );
    wait( var_0 );
    self delete();
}

_id_5556()
{
    scripts\common\interactive::_id_837E( "equip_equipmentResupplyBox" );
    self._id_B7D6 = [];
    self._id_FE44 = 0;
    self makeuseable();
    self _meth_83A0( -1 );
    self enablemissilehint( 1 );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"EQUIPMENT_HINTS/EQUIPMENT_RESUPPLY_BOX_USE" );
    self setuserange( 128 );
    self setuseholdduration( "duration_short" );
    self _meth_857F( 0 );
    self _meth_84D6( "tag_use" );
    thread _id_5566();
}

_id_5555()
{
    self notify( "equipmentResupplyBox_makeUnusable" );
    scripts\common\interactive::_id_8385();
    self makeunusable();
    self._id_B7D6 = undefined;
}

_id_5566()
{
    self endon( "death" );
    self endon( "equipmentResupplyBox_makeUnusable" );
    var_0 = gettime();

    for (;;)
    {
        _id_5562();

        if ( gettime() >= var_0 )
        {
            _id_5563();
            var_0 = gettime() + 150;
        }

        waitframe();
    }
}

_id_5563()
{
    var_0 = scripts\common\utility::_id_B7B4( self.origin, 300 );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            if ( !_id_555A( var_2 ) )
            {
                self disableplayeruse( var_2 );
                continue;
            }

            self _meth_80E0( var_2 );
        }
    }
}

_id_5562()
{
    foreach ( var_1 in self._id_B7D6 )
    {
        if ( isdefined( var_1 ) )
        {
            var_2 = var_1 getentitynumber();

            if ( !scripts\mp\utility\player::isreallyalive( var_1 ) && isdefined( self._id_B7D6[var_2] ) )
            {
                self._id_B7D6[var_2] = undefined;
                _id_555F( var_1 );
            }
        }
    }
}

_id_555A( var_0 )
{
    if ( !scripts\mp\utility\player::isreallyalive( var_0 ) )
        return 0;

    if ( !var_0 scripts\common\utility::_id_8570() )
        return 0;

    if ( isdefined( self._id_B7D6[var_0 getentitynumber()] ) )
        return 0;

    if ( scripts\cp_mp\utility\player_utility::_id_B779( var_0, self.owner ) )
        return 0;

    return 1;
}

_id_5558( var_0 )
{
    var_1 = var_0 scripts\mp\equipment::_id_6985( "primary" );

    if ( isdefined( var_1 ) )
        var_0 scripts\mp\equipment::_id_7DD2( var_1 );

    var_2 = var_0 scripts\mp\equipment::_id_6985( "secondary" );

    if ( isdefined( var_2 ) )
        var_0 scripts\mp\equipment::_id_7DD2( var_2 );

    var_3 = var_0 getweaponslistprimaries();

    foreach ( var_5 in var_3 )
    {
        if ( scripts\mp\utility\weapon::_id_88DF( var_5 ) || scripts\mp\utility\weapon::_id_8A63( var_5 ) || scripts\mp\utility\weapon::_id_88DC( var_5 ) || scripts\mp\utility\weapon::_id_885C( var_5 ) )
            continue;

        var_6 = scripts\mp\utility\weapon::_id_6E59( var_5 );
        var_7 = undefined;

        if ( scripts\mp\utility\weapon::_id_8A1E( var_5 ) )
            var_7 = 1;
        else if ( var_6 == "weapon_sniper" )
            var_7 = 1.5;
        else
            var_7 = 3;

        var_8 = scripts\mp\weapons::_id_689C( var_5 ) * var_7;

        if ( var_5._id_022A && scripts\mp\utility\weapon::_id_1D7D( var_5._id_0490 ) == "ubshtgn" )
        {
            var_9 = var_0 getweaponammoclip( var_5 );
            var_10 = int( var_9 + var_8 );
            var_0 setweaponammoclip( var_5, var_10 );
            continue;
        }

        var_11 = var_0 getweaponammostock( var_5 );
        var_10 = int( var_11 + var_8 );
        var_0 setweaponammostock( var_5, var_10 );
    }

    var_0 _id_079B::_id_7B50( "ammobox" );
    _id_555B( var_0 );
    thread _id_5559();
    return 1;
}

_id_555B( var_0 )
{
    if ( isdefined( var_0 ) )
        level thread scripts\mp\battlechatter_mp::_id_F756( var_0, "supplybox_resupply" );
}

_id_5559()
{
    self endon( "death" );

    if ( istrue( self._id_ABB9 ) )
        return;

    self setscriptablepartstate( "anims", "openUse", 0 );
    self._id_ABB9 = 1;
    wait( _id_554C() );
    self setscriptablepartstate( "anims", "openIdle", 0 );
    self._id_ABB9 = undefined;
}

_id_5554()
{
    thread _id_079A::_id_A0EC( 100, "hitequip", ::_id_5550, ::_id_554F );
}

_id_554F( var_0 )
{
    if ( var_0._id_9CBF == "MOD_IMPACT" )
        return 0;

    var_1 = !isdefined( self.owner ) || scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0.attacker );
    var_2 = undefined;

    if ( _func_010E( var_0._id_9CBF ) )
        var_2 = _id_5549( var_0, var_1 );
    else if ( scripts\engine\utility::_id_877A( var_0._id_9CBF ) )
        var_2 = _id_5544( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        var_3 = 5;

        if ( var_1 )
            var_3 = 5;

        return int( _func_0037( min( 1, var_2 / 5 ) * self.maxhealth ) );
    }

    return var_0.damage;
}

_id_5550( var_0 )
{
    _id_554D( var_0.attacker );

    if ( isdefined( self.owner ) && istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0.attacker ) ) )
        self.owner thread _id_0A64::_id_9120( "sb_destroyed_s" );

    thread _id_5548( var_0.attacker, 1 );
}

_id_5544( var_0, var_1 )
{
    var_2 = scripts\engine\utility::ter_op( _id_0A62::_id_884C( var_0.objweapon, var_0._id_9CBF ) && var_1, 2, 0 );

    if ( var_0.damage > 150 )
        return var_2 + 10;

    if ( var_0.damage >= 80 )
        return var_2 + 5;
    else if ( var_0.damage >= 30 )
        return var_2 + 2;
    else
        return var_2 + 1;
}

_id_5549( var_0, var_1 )
{
    if ( var_0.damage > 200 )
        return 20;

    if ( var_0.damage > 70 )
        return 10;
    else if ( var_0.damage > 30 )
        return 7;
    else
        return 2;
}

_id_555D()
{
    if ( isdefined( self._id_ACD2 ) )
        scripts\mp\utility\outline::outlinedisable( self._id_ACD2, self );
}

_id_5543()
{
    self._id_75D1 = _id_0766::_id_D58E( [], "v_ui_icon_fieldupgrade_fieldupgrade01", 20, 1, 1000, 100, undefined, 1 );
    self._id_75D5 = _id_0766::_id_D587( 0, 20, undefined, undefined, undefined, undefined, 1 );
    _id_5560();
}

_id_555C()
{
    if ( isdefined( self._id_75D1 ) )
    {
        _id_0766::_id_D586( self._id_75D1 );
        self._id_75D1 = undefined;
    }

    if ( isdefined( self._id_75D5 ) )
    {
        _id_0766::_id_D586( self._id_75D5 );
        self._id_75D5 = undefined;
    }
}

_id_554D( var_0 )
{
    if ( !isdefined( self.owner ) || scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0 ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 thread _id_0A76::_id_6FE6( "destroyed_equipment" );
        var_0 scripts\mp\battlechatter_mp::_id_553B( self );
    }
}

_id_554E( var_0 )
{
    if ( isdefined( self.owner ) && !scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0 ) )
    {
        if ( self.owner != var_0 )
            self.owner thread _id_0A76::_id_6FE6( "munitions_box_teammate_used" );

        self.owner _id_0A7B::_id_7D93( "munitionsBoxUsed", 1 );
        self.owner scripts\mp\supers::_id_3A9D( "super_ammo_drop" );
        self._id_FE44++;
    }
}

_id_5557( var_0 )
{
    _id_5546( 1 );
}

_id_5551( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_94F7 = var_0;
    var_1._id_43D6 = ::_id_5557;
    var_1._id_5318 = "death";
    thread scripts\mp\movers::_id_73E7( var_1 );
}

_id_5567()
{
    self endon( "death" );
    _id_5568();

    if ( isdefined( self ) && !istrue( self._id_87E1 ) )
        thread _id_5546();
}

_id_5568()
{
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 60 );
}

_id_5547( var_0 )
{
    var_1 = var_0.attacker;
    _id_554D( var_1 );
    thread _id_5546();
}

_id_5560()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            return;

        _id_555F( var_1 );
    }
}

_id_555F( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self.owner ) )
        return;

    if ( !isdefined( var_0 ) )
        return;

    var_1 = self._id_75D1;

    if ( !isdefined( var_1 ) )
        return;

    var_2 = self._id_75D5;

    if ( !isdefined( var_2 ) )
        return;

    var_3 = scripts\mp\utility\player::_id_8852( self.owner.team, var_0 );
    var_4 = isdefined( self._id_B7D6 ) && isdefined( self._id_B7D6[var_0 getentitynumber()] );

    if ( var_3 && !var_4 )
    {
        _id_0766::_id_D583( var_1, var_0 );
        _id_0766::_id_D58C( var_2, var_0 );
    }
    else if ( var_3 )
    {
        _id_0766::_id_D58C( var_1, var_0 );
        _id_0766::_id_D583( var_2, var_0 );
    }
    else
    {
        _id_0766::_id_D58C( var_1, var_0 );
        _id_0766::_id_D58C( var_2, var_0 );
    }
}

#using_animtree("scriptables");

_id_554B()
{
    return _func_0079( %wm_supportbox_ground_open );
}

_id_554C()
{
    return _func_0079( %wm_supportbox_ground_idle_open_use );
}

_id_554A()
{
    return _func_0079( %wm_supportbox_ground_close );
}

_id_5565( var_0, var_1 )
{
    if ( istrue( var_1._id_88C5 ) )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "hud", "showErrorMessage" ) )
            var_1 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/JUGG_CANNOT_BE_USED" );

        return;
    }

    if ( var_0 _id_555A( var_1 ) )
    {
        if ( isdefined( var_0._id_8870 ) && isdefined( var_0._id_7343 ) )
        {
            var_0 _id_5548( var_0._id_7343, 1 );
            return;
        }

        if ( isdefined( level._id_ABA1 ) )
            var_2 = var_0 [[ level._id_ABA1 ]]( var_1 );
        else
            var_2 = var_0 _id_5558( var_1 );

        if ( var_2 )
        {
            var_0._id_B7D6[var_1 getentitynumber()] = var_1;
            var_0 _id_555F( var_1 );
            var_0 _id_554E( var_1 );
        }
    }
}

_id_5537( var_0 )
{
    self._id_8870 = 0;
    _id_5555();
    thread _id_5556();
}
