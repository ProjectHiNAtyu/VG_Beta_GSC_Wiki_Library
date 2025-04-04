// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_5532 = spawnstruct();
    _id_81E5();
    _id_9694();
    _id_0A7A::_id_C27F( ::_id_556F );
}

_id_81E5()
{
    level._id_5532._id_2F2C = [];
    var_0 = level._id_5532;
    _id_07A4::_id_553E();

    if ( !istrue( game["isLaunchChunk"] ) )
    {
        _id_0A3F::init();
        _id_09F0::_id_ECA9();
        _id_09F4::_id_F68A();
        _id_09DE::_id_4518();
        _id_09D8::_id_1D19();
        _id_09D9::_id_1D19();
        _id_09EF::_id_ECF7();
        _id_09E6::_id_8B55();
        _id_09E1::_id_59FB();
        _id_09D3::init();
    }

    _id_09EC::_id_E804();
    _id_09F1::_id_F0F4();
    _id_09DC::_id_37F6();
    _id_09E8::_id_A059();
    _id_09F5::_id_10D77();
    _id_097E::_id_F195();
    _id_097F::_id_F1A3();
    var_0._id_2F2C["equip_helmet"]["onGive"] = _id_0A3F::_id_CA32;
    var_0._id_2F2C["equip_helmet"]["onTake"] = _id_0A3F::_id_C4BE;
    var_0._id_2F2C["equip_adrenaline"]["onFired"] = _id_09D3::_id_AABB;
    var_0._id_2F2C["equip_adrenaline"]["onTake"] = _id_09D3::_id_AABD;
    var_0._id_2F2C["equip_c4"]["onGive"] = _id_09DB::_id_2E3A;
    var_0._id_2F2C["equip_trophy"]["onGive"] = _id_09F4::_id_F696;
    var_0._id_2F2C["equip_trophy"]["onTake"] = _id_09F4::_id_F69A;
    var_0._id_2F2C["equip_throwing_knife"]["onGive"] = _id_097E::_id_F19C;
    var_0._id_2F2C["equip_throwing_knife"]["onTake"] = _id_097E::_id_F19D;
    var_0._id_2F2C["equip_throwing_star"]["onGive"] = _id_097F::_id_F1AA;
    var_0._id_2F2C["equip_throwing_star"]["onTake"] = _id_097F::_id_F1AB;
    var_0._id_2F2C["equip_molotov"]["onGive"] = _id_09E8::_id_A060;
    var_0._id_2F2C["equip_molotov"]["onTake"] = _id_09E8::_id_A062;
    var_0._id_2F2C["equip_tac_cover"]["onGive"] = _id_09F0::_id_ECAC;
    var_0._id_2F2C["equip_tac_cover"]["onTake"] = _id_09F0::_id_ECAD;
    var_0._id_2F2C["equip_tac_cover"]["onFired"] = _id_09F0::_id_ECAA;
    var_0._id_2F2C["equip_tac_insert"]["onGive"] = _id_09EF::_id_ECFD;
    var_0._id_2F2C["equip_tac_insert"]["onTake"] = _id_09EF::_id_ED00;
    var_0._id_2F2C["equip_gas_grenade"]["onPlayerDamaged"] = _id_09E4::_id_6169;
    var_0._id_2F2C["equip_flash"]["onPlayerDamaged"] = _id_09E2::_id_AB4E;
    var_0._id_2F2C["equip_concussion"]["onPlayerDamaged"] = _id_09DD::_id_AB4E;
    var_0._id_2F2C["equip_thermite"]["onPlayerDamaged"] = _id_09F1::_id_F0F7;
    var_0._id_2F2C["equip_molotov"]["onPlayerDamaged"] = _id_09E8::_id_A061;
    var_0._id_2F2C["equip_at_mine"]["onOwnerChanged"] = _id_09D8::_id_1D1B;
    var_0._id_2F2C["equip_at_mine_stun"]["onOwnerChanged"] = _id_09D9::_id_1D1B;
    var_0._id_2F2C["equip_claymore"]["onOwnerChanged"] = _id_09DC::_id_37F8;
    var_0._id_2F2C["equip_c4"]["onOwnerChanged"] = _id_09DB::_id_2E33;
    var_0._id_2F2C["equip_equipmentResupplyBox"]["onOwnerChanged"] = _id_09E0::_id_5537;
    var_0._id_2F2C["equip_field_mic"]["onOwnerChanged"] = _id_09E1::_id_59FD;
    var_0._id_2F2C["equip_jammer"]["onOwnerChanged"] = _id_09E6::_id_8B58;
    var_0._id_2F2C["equip_at_mine"]["onDestroyedByTrophy"] = _id_09D8::_id_1D12;
    var_0._id_2F2C["equip_at_mine_stun"]["onDestroyedByTrophy"] = _id_09D9::_id_1D12;
    var_0._id_2F2C["equip_claymore"]["onDestroyedByTrophy"] = _id_09DC::_id_37EE;
    var_0._id_2F2C["equip_trophy"]["onDestroyedByTrophy"] = _id_09F4::_id_F67A;
    var_0._id_2F2C["equip_c4"]["onDestroyedByTrophy"] = _id_09DB::_id_2E24;
    var_0._id_2F2C["equip_snapshot_grenade"]["onDestroyedByTrophy"] = _id_09EB::_id_DEB4;
    thread _id_10B97();
    _id_0A65::_id_C277( ::_id_AB36 );
}

_id_6923( var_0, var_1 )
{
    if ( !isdefined( level._id_5532._id_2F2C[var_0] ) )
        return undefined;

    return level._id_5532._id_2F2C[var_0][var_1];
}

_id_9694()
{
    level._id_5532._id_EC59 = [];
    var_0 = 1;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/equipment.csv", var_0, 1 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_2 = tolower( var_1 );
        var_3 = spawnstruct();
        var_3._id_C17B = var_2;
        var_4 = tablelookupbyrow( "mp/equipment.csv", var_0, 6 );

        if ( var_4 != "none" )
            var_3.objweapon = makeweapon( var_4 );

        var_3._id_7C71 = var_0;
        var_3._id_7D25 = tablelookupbyrow( "mp/equipment.csv", var_0, 4 );
        var_3._id_45A6 = scripts\engine\utility::ter_op( tablelookupbyrow( "mp/equipment.csv", var_0, 7 ) == "2", "secondary", "primary" );
        var_3._id_CB99 = int( tablelookupbyrow( "mp/equipment.csv", var_0, 10 ) );
        var_3._id_8959 = tolower( tablelookupbyrow( "mp/equipment.csv", var_0, 11 ) ) == "true";
        var_3._id_8A06 = tablelookupbyrow( "mp/equipment.csv", var_0, 8 ) != "-1";
        var_3._id_8AFC = tablelookupbyrow( "mp/equipment.csv", var_0, 18 ) == "1";
        var_5 = tablelookupbyrow( "mp/equipment.csv", var_0, 12 );

        if ( var_5 == "none" )
        {

        }
        else if ( var_5 == "" )
        {
            if ( var_4 != "none" )
                var_3._id_4315 = [ var_4 ];
        }
        else
        {
            var_6 = [];

            if ( var_4 != "none" )
                var_6[var_6.size] = var_4;

            var_7 = strtok( var_5, " " );

            foreach ( var_9 in var_7 )
                var_6[var_6.size] = var_9;

            var_3._id_4315 = var_6;
        }

        level._id_5532._id_EC59[var_2] = var_3;
        var_0++;
    }
}

_id_69F8( var_0 )
{
    return level._id_5532._id_EC59[var_0];
}

_id_6F76( var_0, var_1 )
{
    if ( !isdefined( self._id_5532 ) )
        self._id_5532 = [];

    if ( var_0 == "none" )
        return;

    var_2 = _id_69F8( var_0 );

    if ( var_1 == "super" )
    {
        var_3 = level._id_2A6F._id_2A99[level._id_2A6F._id_2A1D[var_0]];
        var_2._id_7C71 = scripts\mp\supers::_id_6D83( var_3 );
    }

    _id_EDBA( var_1 );

    if ( isdefined( var_2.objweapon ) )
    {
        self giveweapon( var_2.objweapon );

        if ( _id_85A5( var_1 ) && !var_2._id_8959 )
        {
            if ( var_1 == "primary" )
                self _meth_849B( var_2.objweapon );
            else if ( var_1 == "secondary" )
                self _meth_849C( var_2.objweapon );
            else if ( var_1 == "super" )
                self _meth_84E8( var_2.objweapon );
        }
    }

    if ( !getdvarint( "scr_base_auto_equip_armor", 0 ) )
        _id_D59D( var_1, var_2._id_7C71 );

    self._id_5532[var_1] = var_0;
    var_4 = _id_6923( var_0, "onGive" );

    if ( isdefined( var_4 ) )
        self thread [[ var_4 ]]( var_0, var_1 );

    _id_FD72( var_1 );

    if ( scripts\mp\utility\game::_id_8744() && var_0 == "equip_throwing_knife" )
        return;

    thread _id_10B9A( var_0, var_1 );
    return;
}

_id_EDBA( var_0 )
{
    var_1 = _id_6985( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = _id_69F8( var_1 );

    if ( isdefined( var_2.objweapon ) )
    {
        if ( self hasweapon( var_2.objweapon ) )
        {
            scripts\cp_mp\utility\inventory_utility::_takeweapon( var_2.objweapon );

            if ( var_0 == "primary" )
                self _meth_849D();
            else if ( var_0 == "secondary" )
                self _meth_849E();
        }
    }

    _id_D59D( var_0, 0 );
    self._id_5532[var_0] = undefined;
    var_3 = _id_6923( var_1, "onTake" );

    if ( isdefined( var_3 ) )
        self thread [[ var_3 ]]( var_1, var_0 );

    _id_FD72( var_0 );
    self notify( "equipment_taken_" + var_1 );
}

_id_556E( var_0 )
{
    var_1 = var_0.objweapon.basename;

    foreach ( var_10, var_3 in level._id_5532._id_EC59 )
    {
        var_4 = _id_6923( var_10, "onPlayerDamaged" );

        if ( isdefined( var_4 ) && isdefined( var_3._id_4315 ) )
        {
            foreach ( var_6 in var_3._id_4315 )
            {
                if ( var_6 == var_1 )
                {
                    var_7 = gettime();
                    var_8 = [[ var_4 ]]( var_0 );
                    return var_8;
                }
            }
        }
    }
}

_id_AA9F()
{
    if ( isdefined( self._id_5542 ) )
    {
        var_0 = _id_6923( self._id_5542, "onDestroyedByTrophy" );

        if ( isdefined( var_0 ) )
        {
            self thread [[ var_0 ]]();
            return 1;
        }
        else if ( scripts\mp\weapons::_id_896B( self ) )
        {
            thread scripts\mp\weapons::_id_474B();
            return 1;
        }
    }

    return 0;
}

_id_4AC4( var_0 )
{
    if ( var_0 == "primary" )
        self _meth_849D();
    else if ( var_0 == "secondary" )
        self _meth_849E();
    else if ( var_0 == "super" )
        self _meth_84E9();
}

_id_524C( var_0 )
{
    var_1 = _id_6985( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = _id_69F8( var_1 );

    if ( isdefined( var_2.objweapon ) && !var_2._id_8959 )
    {
        if ( var_0 == "primary" )
            self _meth_849B( var_2.objweapon );
        else if ( var_0 == "secondary" )
            self _meth_849C( var_2.objweapon );
        else if ( var_0 == "super" )
            self _meth_84E8( var_2.objweapon );
    }
}

_id_1512( var_0, var_1 )
{
    _id_1513( "primary", var_0, var_1 );
    _id_1513( "secondary", var_0, var_1 );
}

_id_1513( var_0, var_1, var_2 )
{
    var_3 = scripts\common\input_allow::allow_input_internal( "equipment_" + var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) )
        return;

    if ( var_1 )
        _id_524C( var_0 );
    else
        _id_4AC4( var_0 );
}

_id_85A5( var_0 )
{
    return scripts\common\input_allow::_id_85F2( "equipment_" + var_0 );
}

_id_D59D( var_0, var_1 )
{
    if ( var_0 != "super" )
        self setclientomnvar( "ui_equipment_id_" + var_0, var_1 );
    else
        self setclientomnvar( "ui_perk_package_super1", var_1 );
}

_id_6985( var_0 )
{
    if ( !isdefined( self._id_5532 ) )
        return undefined;

    return self._id_5532[var_0];
}

_id_38F9()
{
    if ( !isdefined( self._id_5532 ) )
        return;

    foreach ( var_2, var_1 in self._id_5532 )
        _id_EDBA( var_2 );
}

_id_69F3( var_0 )
{
    var_1 = _id_69F8( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    if ( !isdefined( var_1.objweapon ) )
        return 0;

    if ( level.gametype != "br" )
    {
        var_2 = scripts\mp\utility\perk::_hasperk( "specialty_extraoffhandammo" );
        var_3 = weaponmaxammo( var_1.objweapon, var_2 );

        switch ( var_0 )
        {
            case "equip_hb_sensor":
            case "equip_tac_cover":
                break;
            default:
                var_3--;
                break;
        }

        var_4 = _id_5ACA( var_0 );

        if ( scripts\mp\utility\perk::_hasperk( "specialty_extra_deadly" ) && var_4 == "primary" )
            var_3++;

        if ( scripts\mp\utility\perk::_hasperk( "specialty_extra_tactical" ) && var_4 == "secondary" )
            var_3++;
    }
    else
        var_3 = level._id_2A6F._id_9C49[level._id_2A6F._id_2A1D[var_1._id_C17B]];

    return var_3;
}

_id_69F7( var_0 )
{
    var_1 = _id_69F8( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    if ( !isdefined( var_1.objweapon ) )
        return 0;

    var_2 = scripts\mp\utility\perk::_hasperk( "specialty_extraoffhandammo" );
    var_3 = _func_0278( var_1.objweapon, var_2 );

    if ( isdefined( self._id_5532["primary"] ) && self._id_5532["primary"] == var_0 && scripts\mp\utility\perk::_hasperk( "specialty_extra_deadly" ) )
        var_3 = var_3 + 1;

    if ( isdefined( self._id_5532["primary"] ) && self._id_5532["primary"] == var_0 && scripts\mp\utility\perk::_hasperk( "specialty_van_demolition" ) )
        var_3 = var_3 + 1;

    if ( isdefined( self._id_5532["secondary"] ) && self._id_5532["secondary"] == var_0 && scripts\mp\utility\perk::_hasperk( "specialty_extra_tactical" ) )
        var_3 = var_3 + 1;

    return var_3;
}

_id_69F0( var_0 )
{
    var_1 = _id_69F8( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    if ( !isdefined( var_1.objweapon ) )
        return 0;

    return self _meth_8109( var_1.objweapon );
}

_id_D536( var_0, var_1 )
{
    var_2 = _id_69F8( var_0 );

    if ( !isdefined( var_2.objweapon ) )
        return;

    self setweaponammoclip( var_2.objweapon, var_1 );
    _id_FD72( _id_5ACA( var_0 ) );
}

_id_7DD2( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_0 ) )
        return;

    var_2 = _id_69F0( var_0 );
    var_3 = int( min( var_2 + var_1, _id_69F3( var_0 ) ) );
    waitframe();
    _id_D536( var_0, var_3 );
}

_id_4537( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = _id_69F0( var_0 );
    var_1 = int( min( var_1, var_2 ) );

    if ( var_1 > 0 )
    {
        var_3 = int( min( var_2 - var_1, _id_69F3( var_0 ) ) );
        _id_D536( var_0, var_3 );
    }
}

_id_7DD3( var_0, var_1 )
{
    var_2 = _id_6985( var_0 );

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_3 = _id_69F0( var_2 );
    var_4 = int( min( var_3 + var_1, _id_69F3( var_2 ) ) );
    _id_D536( var_2, var_4 );
}

_id_4538( var_0, var_1 )
{
    var_2 = _id_6985( var_0 );

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_3 = _id_69F0( var_2 );
    var_4 = int( min( var_3 - var_1, _id_69F3( var_2 ) ) );
    _id_D536( var_2, var_4 );
}

_id_69F6( var_0 )
{
    var_1 = _id_6985( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    return _id_69F0( var_1 );
}

_id_D538( var_0, var_1 )
{
    var_2 = _id_6985( var_0 );

    if ( !isdefined( var_2 ) )
        return undefined;

    return _id_D536( var_2, var_1 );
}

_id_9A9F( var_0 )
{
    switch ( var_0.basename )
    {
        case "claymore_radial_mp":
            return makeweapon( "claymore_mp" );
        case "at_mine_ap_mp":
            return makeweapon( "at_mine_mp" );
        case "thermite_ap_mp":
        case "thermite_av_mp":
            return makeweapon( "s4_thermite_mp" );
    }

    return var_0;
}

_id_69F5( var_0 )
{
    var_0 = _id_9A9F( var_0 );

    foreach ( var_2 in level._id_5532._id_EC59 )
    {
        if ( isdefined( var_2.objweapon ) && var_0 == var_2.objweapon )
            return var_2._id_C17B;
    }

    return undefined;
}

_id_6E56( var_0 )
{
    foreach ( var_2 in level._id_5532._id_EC59 )
    {
        if ( isdefined( var_2._id_C17B ) && var_0 == var_2._id_C17B )
            return var_2.objweapon;
    }

    return undefined;
}

_id_753F( var_0 )
{
    if ( !isdefined( self._id_5532 ) )
        return 0;

    foreach ( var_2 in self._id_5532 )
    {
        if ( var_2 == var_0 )
            return 1;
    }

    return 0;
}

_id_5ACA( var_0 )
{
    if ( !isdefined( self._id_5532 ) )
        return undefined;

    foreach ( var_3, var_2 in self._id_5532 )
    {
        if ( var_2 == var_0 )
            return var_3;
    }
}

_id_881C( var_0 )
{
    return _id_881D( var_0 );
}

_id_881D( var_0 )
{
    if ( isdefined( level._id_5532._id_EC59[var_0] ) )
        return level._id_5532._id_EC59[var_0]._id_45A6 == "primary";
    else
        return 0;
}

_id_8821( var_0 )
{
    return _id_881E( var_0 );
}

_id_881E( var_0 )
{
    if ( isdefined( level._id_5532._id_EC59[var_0] ) )
        return level._id_5532._id_EC59[var_0]._id_45A6 == "secondary";
    else
        return 0;
}

_id_881F( var_0 )
{
    if ( isdefined( level._id_5532._id_EC59[var_0] ) )
        return istrue( level._id_5532._id_EC59[var_0]._id_8A06 );
    else
        return 0;
}

_id_8822( var_0 )
{
    if ( isdefined( level._id_5532._id_EC59[var_0] ) )
        return istrue( level._id_5532._id_EC59[var_0]._id_8AFC );
    else
        return 0;
}

_id_FD72( var_0 )
{
    if ( !isdefined( self._id_5532 ) || !isdefined( var_0 ) )
        return;

    var_1 = 0;
    var_2 = _id_6985( var_0 );

    if ( isdefined( var_2 ) )
        var_1 = _id_69F6( var_0 );

    if ( var_0 == "primary" )
    {
        self setclientomnvar( "ui_power_num_charges", var_1 );
        self _meth_8756( "primary", var_1 );
    }
    else if ( var_0 == "secondary" )
    {
        self setclientomnvar( "ui_power_secondary_num_charges", var_1 );
        self _meth_8756( "secondary", var_1 );
    }
    else if ( var_0 == "health" && scripts\mp\utility\game::getgametype() != "base" )
        self setclientomnvar( "ui_equipment_id_health_numCharges", var_1 );
}

_id_556F()
{
    thread _id_10BB3();
}

_id_C603()
{
    self._id_5532 = [];
}

_id_56CF( var_0 )
{
    foreach ( var_6, var_2 in self._id_5532 )
    {
        var_3 = _id_69F8( var_2 );

        if ( isdefined( var_3.objweapon ) && var_0 == var_3.objweapon )
        {
            if ( scripts\mp\utility\game::getgametype() == "br" )
                scripts\mp\gametypes\br_analytics::_id_2ACB( self, var_0 );

            var_4 = _id_69F5( var_0 );
            _id_079A::_id_3A96( var_4 );
            var_5 = _id_6923( var_2, "onFired" );

            if ( isdefined( var_5 ) )
                self thread [[ var_5 ]]( var_2, var_6, var_0 );

            _id_FD72( var_6 );
            break;
        }
    }
}

_id_10BB3()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );

    for (;;)
    {
        self waittill( "offhand_fired", var_0 );
        _id_56CF( var_0 );
    }
}

_id_6FC5()
{
    foreach ( var_3, var_1 in self._id_5532 )
    {
        var_2 = _id_69F8( var_1 );

        if ( var_2._id_CB99 > 0 )
            _id_7DD2( var_1, var_2._id_CB99 );
    }
}

_id_69B7( var_0 )
{
    var_1 = _id_69F8( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    return var_1._id_45A6;
}

_id_10B97()
{
    level endon( "lethal_delay_end" );
    level endon( "round_end" );
    level endon( "game_ended" );
    _id_07A8::_id_60A3( "prematch_done" );
    var_0 = _id_41A7();

    if ( var_0 )
        level._id_91CD = gettime();
    else
        level._id_91CD = scripts\mp\utility\game::_id_6DC8();

    if ( level._id_91C9 == 0 )
    {
        level._id_91CB = level._id_91CD;
        level notify( "lethal_delay_end" );
    }

    level._id_91CB = level._id_91CD + level._id_91C9 * 1000;
    level notify( "lethal_delay_start" );

    for (;;)
    {
        var_1 = undefined;

        if ( var_0 )
            var_1 = gettime();
        else
            var_1 = scripts\mp\utility\game::_id_6DC8();

        if ( var_1 >= level._id_91CB )
            break;

        waitframe();
    }

    level notify( "lethal_delay_end" );
}

_id_10B9A( var_0, var_1 )
{
    self endon( "death_or_disconnect" );
    level endon( "round_end" );
    level endon( "game_ended" );

    if ( _id_91CC() )
        return;

    self notify( "watchLethalDelayPlayer_" + var_1 );
    self endon( "watchLethalDelayPlayer_" + var_1 );
    self endon( "equipment_taken_" + var_0 );

    if ( !isdefined( self._id_91CA ) || !istrue( self._id_91CA[var_1] ) )
    {
        if ( !isdefined( self._id_91CA ) )
            self._id_91CA = [];

        self._id_91CA[var_1] = 1;
        _id_1513( var_1, 0 );
    }

    _id_10B99( self, var_1 );

    if ( isdefined( self._id_91CA ) && istrue( self._id_91CA[var_1] ) )
    {
        self._id_91CA[var_1] = undefined;

        if ( self._id_91CA.size == 0 )
            self._id_91CA = undefined;

        _id_1513( var_1, 1 );
    }
}

_id_10B99( var_0, var_1 )
{
    level endon( "lethal_delay_end" );

    if ( !istrue( _id_07A8::_id_609F( "prematch_done" ) ) )
        level waittill( "lethal_delay_start" );

    var_2 = "+frag";

    if ( var_1 != "primary" )
        var_2 = "+smoke";

    if ( !isai( var_0 ) )
        var_0 notifyonplayercommand( "lethal_attempt_" + var_1, var_2 );

    var_3 = _id_41A7();

    for (;;)
    {
        self waittill( "lethal_attempt_" + var_1 );
        var_4 = undefined;

        if ( var_3 )
            var_4 = gettime();
        else
            var_4 = scripts\mp\utility\game::_id_6DC8();

        var_5 = ( level._id_91CB - var_4 ) / 1000;
        var_5 = int( max( 0, _func_0037( var_5 ) ) );
        var_0 scripts\mp\hud_message::_id_DC9F( "MP/LETHALS_UNAVAILABLE_FOR_N", var_5 );
    }
}

_id_313A()
{
    level._id_91C9 = 0;

    if ( _id_41A7() )
        level._id_91CD = gettime();
    else
        level._id_91CD = scripts\mp\utility\game::_id_6DC8();

    level._id_91CB = level._id_91CD;
    level notify( "lethal_delay_end" );
}

_id_91CC()
{
    if ( isdefined( level._id_91C9 ) && level._id_91C9 == 0 )
        return 1;

    if ( isdefined( level._id_91CB ) )
    {
        var_0 = undefined;

        if ( _id_41A7() )
            var_0 = gettime();
        else
            var_0 = scripts\mp\utility\game::_id_6DC8();

        return var_0 > level._id_91CB;
    }

    return 0;
}

_id_41A7()
{
    var_0 = scripts\mp\utility\game::getgametype();

    if ( var_0 == "hq" || var_0 == "grnd" || var_0 == "koth" )
        return 1;

    return 0;
}

_id_AB36( var_0 )
{
    var_1 = var_0 scripts\mp\weapons::_id_6886();

    foreach ( var_3 in var_1 )
        var_3 notify( "owner_disconnect" );
}

_id_7342( var_0 )
{
    self._id_8870 = 1;
    var_0 scripts\mp\gamelogic::_id_D580( var_0, 1 );
    var_0 _id_0793::_id_AAE8( self._id_5542 );
    _id_33BD( var_0 );

    if ( level.teambased )
        self _meth_8703( var_0.team );
    else
        self _meth_8703( var_0 );

    var_0 scripts\mp\killstreaks\killstreaks::_id_6FCE();
}

_id_33BD( var_0 )
{
    var_1 = self.owner;
    self setentityowner( var_0 );
    self.owner = var_0;
    self.team = var_0.team;
    self setotherent( var_0 );
    var_1 scripts\mp\weapons::_id_C48A( self );
    self.owner scripts\mp\weapons::_id_FCF1( self );
    var_2 = _id_6923( self._id_5542, "onOwnerChanged" );
    self notify( "ownerChanged" );

    if ( isdefined( var_2 ) )
        self [[ var_2 ]]( var_1 );
    else
    {

    }

    changedownervo( var_1 );
}

changedownervo( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = "";
    var_2 = "";
    var_3 = var_0 getentitynumber();
    var_4 = "";

    switch ( self._id_5542 )
    {
        case "equip_jammer":
            var_1 = "ja";
            var_4 = "jammer";

            if ( level._id_8B5F[var_3].size > 0 )
                var_2 = "m";
            else
                var_2 = "s";

            break;
        case "equip_field_mic":
            var_1 = "fm";
            var_4 = "mic";

            if ( level._id_5A00[var_3].size > 0 )
                var_2 = "m";
            else
                var_2 = "s";

            break;
        case "equip_at_mine_stun":
            var_1 = "sm";
            var_4 = "mine";

            if ( isdefined( var_0 ) && var_0._id_B1BD.size >= 1 )
                var_2 = "m";
            else
                var_2 = "s";

            break;
        default:
            break;
    }

    if ( var_1 != "" && var_2 != "" && isdefined( var_0 ) )
        var_0 thread _id_0A64::_id_9120( var_1 + "_hijacked_" + var_2 );

    if ( var_4 != "" && isdefined( self.owner ) )
        level thread scripts\mp\battlechatter_mp::_id_F756( self.owner, "hijack_" + var_4 );
}

_id_44B2()
{
    for (;;)
    {
        if ( getdvarint( "scr_debugHackEquipment" ) != 0 )
        {
            var_0 = level.players[0];
            var_1 = undefined;

            for ( var_2 = 1; var_2 < level.players.size; var_2++ )
            {
                if ( var_0 scripts\mp\utility\player::isenemy( level.players[var_2] ) )
                {
                    var_1 = level.players[var_2];
                    break;
                }
            }

            if ( !isdefined( var_1 ) )
            {
                iprintlnbold( "Need a player on the other team to scr_debugHackEquipment" );
                continue;
            }

            var_3 = var_0 scripts\mp\weapons::_id_6886();
            var_4 = undefined;

            if ( var_3.size > 0 )
                var_4 = var_3[0];

            if ( !isdefined( var_4 ) )
            {
                iprintlnbold( "First player must have at least one piece of equipment to scr_debugHackEquipment" );
                continue;
            }

            var_4 _id_7342( var_1 );
        }

        waitframe();
    }
}

_id_44A7()
{
    for (;;)
    {
        if ( getdvarint( "scr_testEMPGrenade" ) != 0 )
        {
            if ( level.players.size < 2 )
            {
                iprintlnbold( "Need at least two players to scr_testEMPGrenade" );
                continue;
            }

            var_0 = level.players[1];
            var_0 scripts\mp\utility\weapon::_id_0C1F( "emp_grenade_mp", ( 0, 0, 0 ), ( 0, 0, 0 ), 0.05, 0 );
        }

        waitframe();
    }
}

_id_44A8()
{
    for (;;)
    {
        if ( getdvarint( "scr_testEMPDrone" ) != 0 )
        {
            if ( level.players.size < 2 )
            {
                iprintlnbold( "Need at least two players to scr_testEMPDrone" );
                continue;
            }

            var_0 = level.players[0];
            var_1 = level.players[1];
            var_2 = spawnstruct();
            var_2._id_EA0F = "emp_drone";
            var_2.owner = var_1;
            var_2._id_7C71 = scripts\cp_mp\utility\killstreak_utility::_id_6E05( var_1 );
            var_2._id_9355 = 0;
            var_3 = var_0.origin;
            var_4 = var_1 _id_0988::_id_5179( var_2, var_3 );
        }

        waitframe();
    }
}

_id_44A4()
{
    for (;;)
    {
        if ( getdvarint( "scr_testEMPDroneDestroy" ) != 0 )
        {
            foreach ( var_1 in level._id_0F23 )
            {
                if ( isdefined( var_1.streakinfo ) && var_1.streakinfo._id_EA0F == "emp_drone" )
                    var_1 _id_0987::_id_517B();
            }
        }

        waitframe();
    }
}
