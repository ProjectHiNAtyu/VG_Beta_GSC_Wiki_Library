// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_68C6( var_0 )
{
    var_1 = _func_021D( "mp/attachmenttable.csv", 4, var_0, 2 );
    return var_1;
}

_id_6962( var_0 )
{
    var_1 = getcompleteweaponname( var_0 );

    if ( istrue( var_0._id_022A ) )
        var_1 = _func_00D6( var_1, 4 );

    return var_1;
}

_id_6E73( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( _id_8780( var_0 ) )
        return "primary";

    if ( _id_8782( var_0 ) )
        return "secondary";

    if ( _id_88DC( var_0 ) )
        return "killstreak";

    if ( _id_8A63( var_0 ) )
        return "super";

    if ( _id_885C( var_0 ) )
        return "gamemode";

    if ( var_0 == "iw8_turret_50cal_mp" )
        return "turret";

    if ( var_0 == "zeus_turret_m60_tower_mp" )
        return "turret";

    if ( _id_88F1( var_0 ) )
        return "level";

    if ( _id_0A78::_id_8A4E( var_0, "destructible_" ) )
        return "destructible";

    if ( _id_8AE1( var_0 ) )
        return "vehicle";

    if ( _id_8A3A( var_0 ) || var_0 == "iw8_defibrillator_mp" )
        return "special_melee";

    if ( _id_881A( var_0 ) )
        return "environment";

    var_1 = _id_69F9( var_0 );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( var_0 == "none" )
        return "worldspawn";

    if ( var_0 == "bomb_site_mp" )
        return var_0;

    if ( var_0 == "iw8_gunless" )
        return "gunless";

    if ( var_0 == "zombie_ranged_attack_mp" || var_0 == "zombie_melee_attack_mp" )
        return "zombie";
}

_id_69F9( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "claymore_radial_mp":
        case "s4_thermite_mp":
        case "s4_molotov_mp":
        case "thermite_ap_mp":
        case "at_mine_mp":
        case "thermite_av_mp":
        case "s4_frag_gbr_n82_mp":
        case "s4_frag_gbr_n23_mp":
        case "snowball_mp":
        case "rock_mp":
        case "at_mine_ap_mp":
        case "s4_throwing_star_mp":
        case "s4_frag_ger_m24_mp":
        case "s4_throwing_knife_mp":
        case "s4_semtex_mp":
        case "s4_frag_usa_mk2_mp":
        case "claymore_mp":
        case "s4_c4_mp":
        case "s4_bundle_charge_mp":
            var_1 = "lethal";
            break;
        case "s4_decoy_grenade_mp":
        case "snapshot_grenade_mp":
        case "pball_mp":
        case "hb_sensor_mp":
        case "at_mine_stun_mp":
        case "s4_mine_ger_s44_mp":
        case "s4_smoke_gbr_n77_mp":
        case "s4_smoke_usa_m18_mp":
        case "flash_grenade_mp":
        case "s4_stun_gbr_n69_mp":
        case "s4_adrenaline_mp":
        case "s4_gas_usa_mk5cn_mp":
            var_1 = "tactical";
            break;
        case "ks_remote_drone_mp":
        case "adrenaline_br_fake":
        case "bandage_br_fake":
        case "gesture_vest_plate_br":
            if ( scripts\mp\utility\game::getgametype() == "br" )
                var_1 = "equipment_other";

            break;
        default:
            break;
    }

    return var_1;
}

_id_881A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    if ( var_1 == "s4_minefield_mp" )
        return 1;
    else if ( var_1 == "danger_circle_br" )
        return 1;

    return 0;
}

_id_8A63( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    return isdefined( scripts\mp\supers::_id_6D89( var_0 ) );
}

_id_8A5C( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    if ( _id_8A63( var_0 ) )
        return 1;

    if ( var_1 == "chargemode_mp" )
        return 1;

    if ( var_1 == "micro_turret_gun_mp" )
        return 1;

    if ( var_1 == "super_trophy_mp" )
        return 1;

    return 0;
}

_id_885C( var_0 )
{
    if ( _id_876D( var_0 ) )
        return 1;

    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    switch ( var_1 )
    {
        case "iw7_tdefball_mp":
        case "iw8_cyberemp_mp":
        case "iw8_lm_dblmg":
        case "iw8_lm_kilo121jugg_mp":
        case "danger_circle_br":
            return 1;
        default:
            return 0;
    }

    return 0;
}

_id_88F1( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    switch ( var_1 )
    {
        default:
            return 0;
    }

    return 0;
}

_id_6E59( var_0 )
{
    if ( isweapon( var_0 ) && isnullweapon( var_0 ) )
        return "other";

    if ( _func_0120( var_0 ) && ( var_0 == "none" || var_0 == "alt_none" ) )
        return "other";

    var_1 = getweaponrootname( var_0 );
    var_2 = _id_10D97( var_1 );

    if ( !isdefined( var_2 ) )
    {
        if ( _id_8A63( var_0 ) )
            var_2 = "super";
        else if ( _id_88DC( var_0 ) )
            var_2 = "killstreak";
        else if ( _id_885C( var_0 ) )
            var_2 = "gamemode";
        else if ( _id_87C3( var_0 ) )
            var_2 = "weapon_crossbowSpecial";
        else if ( _id_87F4( var_0 ) )
            var_2 = "weapon_dragonsBreath";
        else
            var_2 = "other";
    }

    return var_2;
}

_id_87F4( var_0 )
{
    return 0;
}

_id_87C3( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    switch ( var_1 )
    {
        case "semtex_bolt_splash_mp":
        case "semtex_bolt_mp":
        case "thermite_bolt_radius_mp":
        case "thermite_bolt_mp":
            return 1;
        default:
            return 0;
    }
}

_id_688D( var_0 )
{
    var_1 = getweaponrootname( var_0 );
    var_2 = level._id_10D62[var_1];

    if ( !isdefined( var_2 ) )
        var_2 = [];

    return var_2;
}

_id_1D89( var_0, var_1 )
{
    if ( _id_1D70( var_0 ) && _id_1D70( var_1 ) )
        return 0;

    var_0 = _id_1D7D( var_0 );
    var_1 = _id_1D7D( var_1 );
    var_2 = 1;

    if ( var_0 == var_1 )
        var_2 = 0;
    else if ( isdefined( level._id_1D7B ) )
        var_2 = !( isdefined( level._id_1D7B[var_0] ) && isdefined( level._id_1D7B[var_0][var_1] ) );
    else if ( var_0 != "none" && var_1 != "none" )
    {
        var_3 = _func_0225( "mp/attachmentcombos.csv", 0, var_1 );

        if ( _func_021D( "mp/attachmentcombos.csv", 0, var_0, var_3 ) == "no" )
            var_2 = 0;
    }

    return var_2;
}

_id_1D8A( var_0, var_1, var_2, var_3, var_4 )
{
    if ( _id_1D70( var_0 ) && _id_1D70( var_1 ) )
        return var_0;

    var_5 = undefined;

    if ( isweapon( var_2 ) )
        var_5 = getcompleteweaponname( var_2 );
    else
        var_5 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = _id_1D81( var_0, var_5 );

    if ( !isdefined( var_4 ) )
        var_4 = _id_1D81( var_1, var_5 );

    if ( _id_0B1B( var_3, var_4 ) )
        return var_0;

    if ( _id_0B1B( var_4, var_3 ) )
        return var_0;

    var_0 = _id_1D7D( var_0 );
    var_1 = _id_1D7D( var_1 );
    var_6 = "";

    if ( var_0 == var_1 )
        var_6 = var_0;
    else if ( isdefined( level._id_1D7B ) && isdefined( level._id_1D7B[var_0] ) )
    {
        var_7 = level._id_1D7B[var_0][var_1];

        if ( isdefined( var_7 ) )
        {
            if ( var_7 == "no" )
                var_6 = var_0;
            else
                var_6 = var_7;
        }
    }

    return var_6;
}

_id_0B1B( var_0, var_1 )
{
    var_2 = _id_1D7F( var_0 );
    var_3 = _id_1D7E( var_1 );
    return isdefined( var_2 ) && isdefined( var_3 ) && var_3 == var_2;
}

getweaponrootname( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    var_2 = level._id_10DC6[var_1];

    if ( isdefined( var_2 ) )
        return var_2;

    var_3 = var_1;
    var_4 = strtok( var_1, "_" );
    var_5 = 0;

    if ( var_4[0] == "alt" )
        var_5++;

    if ( var_4[var_5] == "iw8" || var_4[var_5] == "s4" )
    {
        var_6 = [ "ar", "sm", "lm", "sh", "sn", "dm", "pi", "la", "me", "mr", "sr", "mg", "gw" ];

        if ( scripts\engine\utility::array_contains( var_6, var_4[var_5 + 1] ) )
            var_1 = var_4[var_5] + "_" + var_4[var_5 + 1] + "_" + var_4[var_5 + 2];
        else
            var_1 = var_4[var_5] + "_" + var_4[var_5 + 1];
    }

    if ( level._id_10DC6.size < 100 )
        level._id_10DC6[var_3] = var_1;

    return var_1;
}

_id_69B9( var_0 )
{
    var_1 = getweaponrootname( var_0 );

    if ( isdefined( level._id_10DAE[var_1] ) && isdefined( level._id_10DAE[var_1]._id_1CC5 ) )
        var_0 = level._id_10DAE[var_1]._id_1CC5;

    return var_0;
}

getweapongroup( var_0 )
{
    if ( _id_0A78::_id_8A4E( var_0, "iw8_" ) )
        var_0 = _func_00D6( var_0, 4 );

    return "mp/gunsmith/" + var_0 + "_variants.csv";
}

_id_6E4D( var_0 )
{
    if ( isweapon( var_0 ) )
        return var_0.basename;

    if ( _func_0120( var_0 ) && var_0 == "none" )
        return "none";

    return getweaponbasename( var_0 );
}

_id_6E5A( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    var_2 = getweaponrootname( var_1 );
    return "mp/gunsmith/" + _func_00D6( var_2, 4 ) + "_attachments.csv";
}

_id_6895( var_0 )
{
    foreach ( var_2 in var_0._id_006B )
    {
        var_3 = _id_1D7D( var_2 );

        if ( var_3 == "gl" || var_3 == "glsmoke" || var_3 == "glgas" || var_3 == "glconc" || var_3 == "glflash" || var_3 == "glincendiary" || var_3 == "glsemtex" || var_3 == "glsnap" )
            return var_3;
    }

    return undefined;
}

_id_8733( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_0271( var_0 ) == "altmode";
}

_id_C464( var_0 )
{
    if ( _id_8733( var_0 ) )
        var_0 = _func_00D6( var_0, 4 );

    return var_0;
}

_id_6E11()
{
    var_0 = [];
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_4 = weaponclass( var_3 );

        if ( !_id_88DC( var_3 ) && var_4 != "grenade" && var_4 != "rocketlauncher" && self getweaponammostock( var_3 ) != 0 )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_8964( var_0 )
{
    if ( _id_877F( var_0 ) )
    {
        var_1 = undefined;

        if ( isweapon( var_0 ) )
            var_1 = getcompleteweaponname( var_0 _meth_8626() );
        else if ( _func_0120( var_0 ) )
        {
            var_1 = var_0;

            if ( issubstr( var_1, "alt_" ) )
                var_1 = _func_00D6( var_1, 4, var_0.size );
        }

        var_2 = isdefined( self.pers["primaryWeapon"] ) && self.pers["primaryWeapon"] == var_1;
        var_3 = isdefined( self.pers["secondaryWeapon"] ) && self.pers["secondaryWeapon"] == var_1;

        if ( !var_2 && !var_3 )
            return 1;
    }

    return 0;
}

_id_8780( var_0 )
{
    return _id_8781( _id_6E59( var_0 ), var_0 );
}

_id_8781( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "weapon_dmr":
        case "weapon_sniper":
        case "weapon_melee":
        case "weapon_shotgun":
        case "weapon_lmg":
        case "weapon_smg":
        case "weapon_dragonsBreath":
        case "weapon_crossbowSpecial":
        case "weapon_assault":
            return 1;
        default:
            return 0;
    }
}

_id_8782( var_0 )
{
    return _id_8783( _id_6E59( var_0 ), var_0 );
}

_id_8783( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "weapon_pistol":
        case "weapon_shotgun":
        case "weapon_projectile":
            return 1;
        case "weapon_melee2":
            return !_id_8A3A( var_1 );
        default:
            return 0;
    }
}

_id_877F( var_0 )
{
    var_1 = _id_6E59( var_0 );
    return _id_8781( var_1, var_0 ) || _id_8783( var_1, var_0 );
}

_id_877E( var_0 )
{
    var_1 = _id_6E59( var_0 );
    return var_1 == "weapon_melee" || var_1 == "weapon_melee2";
}

_id_5253()
{
    if ( !isdefined( self._id_10DA6 ) )
        self._id_10DA6 = 0;

    self._id_10DA6++;
    self _meth_8202();
}

_id_4ADC()
{
    self._id_10DA6--;

    if ( self._id_10DA6 == 0 )
    {
        self _meth_8201();
        self._id_10DA6 = undefined;
    }
}

_id_1D81( var_0, var_1 )
{
    var_2 = undefined;

    if ( isweapon( var_1 ) )
        var_2 = getcompleteweaponname( var_1 );
    else
        var_2 = var_1;

    var_3 = getweaponrootname( var_1 );

    if ( var_3 != var_2 )
    {
        var_4 = getweaponbasename( var_1 );

        if ( isdefined( level._id_1D7A[var_4] ) && isdefined( level._id_1D83[var_0] ) && isdefined( level._id_1D7A[var_4][level._id_1D83[var_0]] ) )
        {
            var_5 = level._id_1D83[var_0];
            return level._id_1D7A[var_4][var_5];
        }
        else if ( isdefined( level._id_1D7A[var_4] ) && isdefined( level._id_1D7A[var_4][var_0] ) )
            return level._id_1D7A[var_4][var_0];
        else
        {
            var_6 = strtok( var_4, "_" );

            if ( var_6.size > 3 )
            {
                var_7 = var_6[0] + "_" + var_6[1] + "_" + var_6[2];

                if ( isdefined( level._id_1D7A[var_7] ) && isdefined( level._id_1D7A[var_7][var_0] ) )
                    return level._id_1D7A[var_7][var_0];
            }
        }
    }

    if ( isdefined( level._id_1D7A[var_3] ) && isdefined( level._id_1D7A[var_3][var_0] ) )
        return level._id_1D7A[var_3][var_0];
    else
    {
        var_8 = _id_10D97( var_3 );

        if ( isdefined( level._id_1D7A[var_8] ) && isdefined( level._id_1D7A[var_8][var_0] ) )
            return level._id_1D7A[var_8][var_0];
    }

    return var_0;
}

_id_1D7C( var_0, var_1, var_2 )
{
    var_3 = var_1 + "|" + var_2;

    if ( isdefined( level._id_10DAA[var_3] ) && isdefined( level._id_10DAA[var_3]._id_1D5E ) && isdefined( level._id_10DAA[var_3]._id_1D5E[var_0] ) )
        return level._id_10DAA[var_3]._id_1D5E[var_0];

    return 0;
}

_id_1D85( var_0 )
{
    if ( isdefined( level._id_1D78[var_0] ) )
        return level._id_1D78[var_0];

    return undefined;
}

_id_1D7E( var_0 )
{
    if ( isdefined( level._id_1D77[var_0] ) )
        return level._id_1D77[var_0];

    return undefined;
}

_id_1D7F( var_0 )
{
    if ( isdefined( level._id_1D82[var_0] ) )
        return level._id_1D82[var_0];

    var_1 = _id_1D7D( var_0 );

    if ( isdefined( level._id_1D79[var_1] ) )
        return level._id_1D79[var_1];

    return undefined;
}

_id_10D5D( var_0, var_1 )
{
    if ( _id_88DC( var_0 ) )
        return var_0;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_0 + "|" + var_1;

        if ( isdefined( level._id_10DAA[var_2] ) && isdefined( level._id_10DAA[var_2]._id_1CC6 ) )
            return level._id_10DAA[var_2]._id_1CC6;
    }

    if ( isdefined( level._id_10DAE[var_0] ) && isdefined( level._id_10DAE[var_0]._id_1CC5 ) )
        return level._id_10DAE[var_0]._id_1CC5;

    return var_0;
}

_id_10DBB( var_0 )
{
    if ( isdefined( level._id_10DAE[var_0] ) && isdefined( level._id_10DAE[var_0]._id_AF92 ) )
        return level._id_10DAE[var_0]._id_AF92;

    return undefined;
}

getrandomweaponfromgroup( var_0 )
{
    var_1 = randomintrange( 0, level._id_10D96[var_0].size );
    return level._id_10D96[var_0][var_1];
}

_id_10D97( var_0 )
{
    if ( isdefined( level._id_10DAE[var_0] ) && isdefined( level._id_10DAE[var_0]._id_71D7 ) )
        return level._id_10DAE[var_0]._id_71D7;

    return undefined;
}

_id_10DB2( var_0 )
{
    if ( isdefined( level._id_10DAE[var_0] ) && isdefined( level._id_10DAE[var_0]._id_A75B ) )
        return level._id_10DAE[var_0]._id_A75B;

    return undefined;
}

_id_10D60( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        var_2 = var_0 + "|" + var_1;

        if ( isdefined( level._id_10DAA[var_2] ) && isdefined( level._id_10DAA[var_2]._id_1D53 ) )
            return level._id_10DAA[var_2]._id_1D53;
    }

    if ( isdefined( level._id_10DAE[var_0] ) && isdefined( level._id_10DAE[var_0]._id_1D53 ) )
        return level._id_10DAE[var_0]._id_1D53;

    return undefined;
}

_id_10D5E( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 >= 0 )
    {
        var_2 = var_0 + "|" + var_1;

        if ( isdefined( level._id_10DAA[var_2] ) && isdefined( level._id_10DAA[var_2]._id_1D50 ) )
            return level._id_10DAA[var_2]._id_1D50;
    }

    return undefined;
}

_id_10D7D( var_0 )
{
    return isdefined( level._id_10DAE[var_0] );
}

_id_10D63( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( level._id_1D6B[var_3] ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_8753( var_0, var_1 )
{
    var_2 = strtok( var_0, "_" );
    return _id_8754( var_2, var_1 );
}

_id_8754( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0.size && isdefined( var_1 ) )
    {
        var_3 = 0;

        if ( var_0[0] == "alt" )
            var_3 = 1;

        if ( var_0.size >= 3 + var_3 && ( var_0[var_3] == "iw6" || var_0[var_3] == "iw7" ) )
        {
            if ( weaponclass( var_0[var_3] + "_" + var_0[var_3 + 1] + "_" + var_0[var_3 + 2] ) == "sniper" )
                var_2 = var_0[var_3 + 1] + "scope" == var_1;
        }
    }

    return var_2;
}

_id_6E4C( var_0 )
{
    if ( _func_0120( var_0 ) )
    {
        if ( var_0 == "none" )
            return [];
    }
    else if ( var_0.basename == "none" )
        return [];

    var_1 = getweaponattachments( var_0 );

    foreach ( var_4, var_3 in var_1 )
        var_1[var_4] = _id_1D7D( var_3 );

    return var_1;
}

_id_68BF( var_0 )
{
    foreach ( var_3, var_2 in var_0 )
        var_0[var_3] = _id_1D7D( var_2 );

    return var_0;
}

_id_6B8A()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = _func_021D( "mp/attachmenttable.csv", 0, var_1, 5 ); var_2 != ""; var_2 = _func_021D( "mp/attachmenttable.csv", 0, var_1, 5 ) )
    {
        var_3 = _func_021D( "mp/attachmenttable.csv", 0, var_1, 2 );

        if ( var_3 != "none" && var_3 != "rail" && !scripts\engine\utility::array_contains( var_0, var_2 ) )
            var_0[var_0.size] = var_2;

        var_1++;
    }

    return var_0;
}

_id_6BBD()
{
    if ( isdefined( level._id_AC35 ) )
        return level._id_AC35;

    var_0 = [];
    var_1 = 0;

    for ( var_2 = _func_021D( "mp/attachmenttable.csv", 0, var_1, 5 ); var_2 != ""; var_2 = _func_021D( "mp/attachmenttable.csv", 0, var_1, 5 ) )
    {
        var_3 = _func_021D( "mp/attachmenttable.csv", 0, var_1, 2 );

        if ( var_3 == "rail" && !scripts\engine\utility::array_contains( var_0, var_2 ) )
            var_0[var_0.size] = var_2;

        var_1++;
    }

    level._id_AC35 = var_0;
    return level._id_AC35;
}

_id_1D7D( var_0 )
{
    if ( isdefined( level._id_1D83[var_0] ) )
        var_0 = level._id_1D83[var_0];

    return var_0;
}

_id_1D80( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level._id_1D84[var_0] ) )
        var_1 = level._id_1D84[var_0];

    return var_1;
}

_id_9AB4( var_0, var_1, var_2 )
{
    var_3 = var_0;

    if ( !isdefined( var_0 ) )
        var_3 = _func_0370();

    var_4 = 0;

    if ( var_3.basename != "none" )
    {
        if ( isdefined( var_1 ) && !isplayer( var_1 ) )
        {
            var_5 = _id_6895( var_0 );

            if ( isdefined( var_5 ) )
            {
                switch ( var_5 )
                {
                    case "glconc":
                        var_3 = makeweapon( "s4_stun_gbr_n69_mp" );
                        break;
                    case "glflash":
                        var_3 = makeweapon( "flash_grenade_mp" );
                        break;
                    case "glsnap":
                        var_3 = makeweapon( "snapshot_grenade_mp" );
                        break;
                    case "glincendiary":
                        var_3 = makeweapon( "s4_thermite_mp" );
                        break;
                }
            }
        }

        switch ( var_3.basename )
        {
            case "pop_rocket_proj_mp":
                var_3 = makeweapon( "pop_rocket_mp" );
                break;
            case "tur_gun_mp":
            case "tur_gun_faridah_mp":
                var_3 = makeweapon( "iw8_turret_50cal_mp" );
                break;
            case "tur_gun_lighttank_mp":
            case "tur_bradley_mp":
                var_3 = makeweapon( "lighttank_tur_mp" );
                break;
            case "tur_bradley_ks_mp":
            case "tur_gun_lighttank_ks_mp":
                var_3 = makeweapon( "lighttank_tur_ks_mp" );
                break;
            case "ks_remote_drone_mp":
                var_3 = _func_0370();
                break;
        }
    }
    else if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1.objweapon ) )
        {
            var_3 = makeweapon( var_1.objweapon.basename );
            var_4 = 1;
        }
        else if ( isdefined( var_1._id_10D06 ) )
        {
            var_3 = makeweapon( var_1._id_10D06 );
            var_4 = 1;
        }
    }

    if ( var_4 && !istrue( var_2 ) )
        var_3 = _id_9AB4( var_3, var_1, 1 );

    return var_3;
}

_id_1D8B( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( _id_1D75( var_4, var_1 ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_1D75( var_0, var_1 )
{
    if ( _id_1D70( var_0 ) )
        return 0;

    if ( !_id_1D73( var_1, var_0 ) )
        return 0;

    if ( scripts\engine\utility::string_starts_with( var_0, "laststand_" ) )
        return 0;

    return 1;
}

_id_10D98( var_0, var_1 )
{
    var_2 = _id_6E4C( var_0 );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 == var_1 )
            return 1;
    }

    return 0;
}

_id_D68E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( self._id_C106 ) )
        self._id_C106 = var_0;
    else
        self._id_C106 = self._id_C106 + var_0;

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self._id_C106 ) && var_1 < self._id_C106 && !var_2 )
            var_1 = self._id_C106;

        var_3 = 100 - var_1;
    }
    else
        var_3 = 100 - self._id_C106;

    var_3 = int( clamp( var_3, 0, 255 ) );

    if ( var_3 == 100 )
    {
        self player_recoilscaleoff();
        return;
    }

    self player_recoilscaleon( var_3 );
}

_id_0C1F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self launchgrenade( var_0, var_1, var_2, var_3, var_5 );

    if ( !isdefined( var_4 ) )
        var_6._id_A6AC = 1;
    else
        var_6._id_A6AC = var_4;

    var_6 setotherent( self );
    return var_6;
}

_id_7163( var_0 )
{
    return !isdefined( var_0._id_A6AC ) || !var_0._id_A6AC;
}

_id_714C()
{
    return !isnullweapon( self getheldoffhand() );
}

_id_6A5A()
{
    var_0 = self getheldoffhand();

    if ( isdefined( self._id_62D2 ) && var_0 == makeweaponfromstring( self._id_62D2 ) )
        var_0 = _func_0370();

    return var_0;
}

_id_10DA0( var_0, var_1 )
{
    var_2 = var_0.basename;

    if ( _id_8A63( var_2 ) )
        return 1;

    if ( _id_88DC( var_2 ) )
        return 1;

    switch ( var_2 )
    {
        case "bomb_site_mp":
        case "snapshot_grenade_mp":
        case "flash_grenade_mp":
        case "s4_stun_gbr_n69_mp":
        case "s4_gas_usa_mk5cn_mp":
            return 1;
        default:
            return 0;
    }
}

_id_10DDA( var_0 )
{
    switch ( var_0 )
    {
        case "iw8_lm_dblmg_mp":
        case "iw8_minigunksjugg_mp":
        case "iw8_me_riotshield_mp":
        case "s4_me_fists_mp":
        case "s4_me_knife_mp":
            return 0;
    }

    if ( _id_88DC( var_0 ) )
        return 0;

    var_1 = weaponclass( var_0 );
    return var_1 == "rifle" || var_1 == "mg" || var_1 == "sniper" || var_1 == "smg" || var_1 == "spread";
}

_id_6E5F( var_0 )
{
    return "laserir";
}

_id_8A1E( var_0 )
{
    var_0 = _id_6E4D( var_0 );

    switch ( var_0 )
    {
        case "s4_la_walpha2_mp":
            return 1;
        default:
            return 0;
    }
}

_id_1D70( var_0 )
{
    return isdefined( var_0 ) && scripts\engine\utility::string_starts_with( var_0, "cos_" );
}

_id_1D73( var_0, var_1 )
{
    var_2 = getweaponrootname( var_0 );
    return _id_1D74( var_2, var_1 );
}

_id_1D74( var_0, var_1 )
{
    var_2 = level._id_10D62[var_0];
    return isdefined( var_2 ) && isdefined( var_2[var_1] );
}

_id_C315( var_0 )
{
    switch ( var_0 )
    {
        case "laserrange":
        case "laserads":
        case "laserbalanced":
            var_0 = "laser";
            break;
        case "barsil":
        case "silencer4":
        case "silencer3":
        case "silencer2":
        case "barsil2":
            var_0 = "silencer";
            break;
        case "barcust2":
        case "barcust":
        case "barlong":
        case "barmid":
        case "barcustnoguard":
        case "barshortnoguard":
        case "barshort":
            var_0 = "barlong";
            break;
    }

    return var_0;
}

_id_10D85( var_0 )
{
    var_1 = "none";
    var_2 = -1;

    if ( isdefined( var_0 ) && !isnullweapon( var_0 ) )
    {
        var_1 = weaponclass( var_0 );

        switch ( var_1 )
        {
            case "pistol":
                var_2 = 1;
                break;
            case "sniper":
                if ( _id_6E59( var_0 ) == "weapon_dmr" )
                    var_2 = 3;
                else
                    var_2 = 4;

                break;
            default:
                var_2 = 0;
        }
    }

    return var_2;
}

_id_876D( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    switch ( var_1 )
    {
        case "s4_bomb_remote_mp":
        case "bomb_site_mp":
        case "briefcase_bomb_mp":
            return 1;
    }

    return 0;
}

_id_88DC( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    if ( isdefined( level._id_8DD5 ) && isdefined( level._id_8DD5[var_1] ) )
        return 1;

    return 0;
}

_id_88DA( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_1031C ) && isdefined( var_0.streakinfo );
}

_id_10D64( var_0 )
{
    var_1 = 1;
    var_2 = undefined;

    if ( isweapon( var_0 ) )
        var_2 = var_0.basename;
    else
        var_2 = var_0;

    if ( _id_88DC( var_0 ) && var_2 != "manual_turret_mp" && var_2 != "pac_sentry_turret_mp" && var_2 != "iw8_minigunksjugg_mp" )
        var_1 = 0;

    return var_1;
}

_id_8AE1( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    switch ( var_1 )
    {
        case "lighttank_tur_mp":
        case "bradley_tow_proj_mp":
        case "lighttank_mp":
        case "hoopty_truck_mp":
        case "van_mp":
        case "cargo_truck_mp":
        case "med_transport_mp":
        case "hoopty_mp":
        case "pickup_truck_mp":
        case "jeep_mp":
        case "big_bird_mp":
        case "cop_car_mp":
        case "tur_apc_rus_mp":
        case "apc_rus_mp":
        case "large_transport_mp":
        case "atv_mp":
        case "tac_rover_mp":
        case "little_bird_mp":
        case "technical_mp":
            return 1;
        default:
            return 0;
    }
}

_id_8860( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
        var_1 = var_0.basename;
    else
        var_1 = var_0;

    if ( issubstr( var_1, "ges_plyr" ) )
        return 1;
    else if ( issubstr( var_1, "devilhorns_mp" ) )
        return 1;
    else
        return 0;
}

getweaponfullname( var_0 )
{
    if ( _func_0120( var_0 ) )
        return var_0;
    else
        return getcompleteweaponname( var_0 );
}

_id_B375( var_0, var_1 )
{
    var_2[0][0]["org"] = self gettagorigin( "j_spineupper" );
    var_2[0][0]["angles"] = self gettagangles( "j_spineupper" );
    var_2[0][1]["org"] = self gettagorigin( "j_spinelower" );
    var_2[0][1]["angles"] = self gettagangles( "j_spinelower" );
    var_2[0][2]["org"] = self gettagorigin( "j_head" );
    var_2[0][2]["angles"] = self gettagangles( "j_head" );
    var_2[1][0]["org"] = self gettagorigin( "j_knee_ri" );
    var_2[1][0]["angles"] = self gettagangles( "j_knee_ri" );
    var_2[1][1]["org"] = self gettagorigin( "j_knee_le" );
    var_2[1][1]["angles"] = self gettagangles( "j_knee_le" );
    var_2[1][2]["org"] = self gettagorigin( "j_elbow_ri" );
    var_2[1][2]["angles"] = self gettagangles( "j_elbow_ri" );
    var_2[1][3]["org"] = self gettagorigin( "j_elbow_le" );
    var_2[1][3]["angles"] = self gettagangles( "j_elbow_le" );
    var_2[2][0]["org"] = self gettagorigin( "j_ankle_le" );
    var_2[2][0]["angles"] = self gettagangles( "j_ankle_le" );
    var_2[2][1]["org"] = self gettagorigin( "j_ankle_ri" );
    var_2[2][1]["angles"] = self gettagangles( "j_ankle_ri" );
    var_2[2][2]["org"] = self gettagorigin( "j_wrist_le" );
    var_2[2][2]["angles"] = self gettagangles( "j_wrist_le" );
    var_2[2][3]["org"] = self gettagorigin( "j_wrist_ri" );
    var_2[2][3]["angles"] = self gettagangles( "j_wrist_ri" );
    var_3 = "bullet_atomizer_impact_npc";
    var_4 = ( 0, 0, 0 );

    if ( isdefined( var_1 ) )
        var_4 = var_1;

    if ( isdefined( var_0 ) )
        var_3 = var_0;

    self playsound( var_3 );

    foreach ( var_6 in var_2 )
    {
        foreach ( var_8 in var_6 )
            playfx( level._effect["atomize_body"], var_8["org"] + var_4, anglestoforward( var_8["angles"] ) );

        wait 0.01;
    }
}

_id_89AD( var_0 )
{
    if ( isnullweapon( var_0 ) )
        return 0;

    if ( var_0._id_0226 != "primary" && var_0._id_0226 != "altmode" )
        return 0;

    switch ( var_0.classname )
    {
        case "pistol":
        case "rifle":
        case "sniper":
        case "spread":
        case "smg":
        case "rocketlauncher":
        case "mg":
            return 1;
        default:
            return 0;
    }
}

_id_890D( var_0 )
{
    return var_0.basename == "s4_knifestab_mp";
}

_id_88DF( var_0 )
{
    return getweaponrootname( var_0 ) == "s4_me_knife_mp";
}

_id_890F( var_0 )
{
    if ( _func_0120( var_0 ) )
    {

    }

    return var_0._id_022E;
}

_id_8843( var_0 )
{
    return getweaponrootname( var_0 ) == "s4_me_fists";
}

_id_875E( var_0 )
{
    return var_0.basename == "iw8_cyberemp_mp" || var_0.basename == "iw7_tdefball_mp";
}

_id_875A( var_0 )
{
    return getweaponrootname( var_0 ) == "iw7_axe";
}

_id_8A86( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
    {
        if ( isnullweapon( var_0 ) )
            return 0;

        var_1 = var_0.basename;
    }
    else
    {
        if ( var_0 == "none" )
            return 0;

        var_1 = var_0;
    }

    return issubstr( var_1, "throwing_knife" );
}

_id_8A3A( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
    {
        if ( isnullweapon( var_0 ) )
            return 0;

        var_1 = var_0.basename;
    }
    else
    {
        if ( var_0 == "none" )
            return 0;

        var_1 = var_0;
    }

    return var_1 == "s4_me_fists_mp_ls" || var_1 == "s4_knifestab_mp";
}

_id_886E( var_0 )
{
    var_1 = undefined;

    if ( isweapon( var_0 ) )
    {
        if ( isnullweapon( var_0 ) )
            return 0;

        var_1 = var_0.basename;
    }
    else
    {
        if ( var_0 == "none" )
            return 0;

        var_1 = var_0;
    }

    return var_1 == "iw8_gunless" || var_1 == "iw8_gunless_infil" || var_1 == "iw8_gunless_last_stand_enter";
}

_id_7E72( var_0, var_1 )
{
    self endon( "death_or_disconnect" );
    self endon( "stop_infinite_ammo_thread" );

    if ( !isdefined( var_0 ) )
        var_0 = level._id_5F1B;

    for (;;)
    {
        if ( !isdefined( var_1 ) )
            var_1 = self._id_018A;

        foreach ( var_3 in var_1 )
        {
            self givemaxammo( var_3 );
            self setweaponammoclip( var_3, weaponclipsize( var_3 ) );
        }

        wait( var_0 );
    }
}

_id_E90D()
{
    self notify( "stop_infinite_ammo_thread" );
}

_id_6D08( var_0 )
{
    var_1 = [];

    if ( !_func_021C( var_0 ) )
        return var_1;

    var_2 = int( tablelookupgetnumrows( "mobile/weapons.csv" ) );

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = tablelookupbyrow( "mobile/weapons.csv", var_3, 1 );

        if ( var_4 == "" )
            continue;

        var_1 = scripts\engine\utility::array_add( var_1, var_4 );
    }

    return var_1;
}

_id_6C0C( var_0 )
{
    var_1 = [];

    for ( var_2 = 1; _func_021C( var_0 ) && _func_021D( var_0, 0, var_2, 0 ) != ""; var_2++ )
    {
        var_1[var_2 - 1] = spawnstruct();
        var_3 = _func_021D( var_0, 0, var_2, 1 );
        var_4 = _func_021D( var_0, 0, var_2, 2 );
        var_5 = _func_021D( var_0, 0, var_2, 3 );
        var_1[var_2 - 1].origin = ( float( var_3 ), float( var_4 ), float( var_5 ) );
    }

    return var_1;
}

_id_E3A6( var_0, var_1 )
{
    while ( !isdefined( level._id_10DAA ) )
        waitframe();

    if ( !isdefined( var_1 ) )
        var_2 = _id_6D08( "mobile/weapons.csv" );
    else
        var_2 = _id_6D08( var_1 );

    var_3 = getarraykeys( var_2 );
    var_4 = [];
    level._id_10DBE = [];

    foreach ( var_6 in var_3 )
    {
        var_7 = var_2[var_6];
        var_8 = 0;
        var_9 = scripts\mp\class::buildweapon_blueprint( var_7, "none", "none", var_8 );
        var_4[var_4.size] = var_9;
    }

    var_11 = _id_6C0C( var_0 );
    var_12 = 0;
    var_13 = var_4.size;

    foreach ( var_15 in var_11 )
    {
        var_16 = 17;
        var_17 = var_4[var_12 % var_13];
        var_18 = getcompleteweaponname( var_17 );
        var_19 = spawn( "weapon_" + var_18, var_15.origin, var_16 );
        level._id_10DBE[level._id_10DBE.size] = var_19;

        if ( var_17.basename != "s4_me_rindigo_mp" )
            var_19.angles = ( 0, 90, 90 );
        else
            var_19.angles = ( -90, 0, 90 );

        var_19 _meth_81F5( weaponclipsize( var_17 ), weaponmaxammo( var_17 ) );
        var_12++;
    }

    level notify( "weapon_pickups_spawned" );
}
