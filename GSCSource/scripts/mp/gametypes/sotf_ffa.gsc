// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "#x32ea5e908954bfea7" ) == "mp_background" )
        return;

    _id_07B3::init();
    _id_07B3::_id_D849();
    var_0 = [];
    _id_07AD::main( var_0 );

    if ( isusingmatchrulesdata() )
    {
        level._id_81CB = ::_id_81CB;
        [[ level._id_81CB ]]();
        level thread scripts\mp\utility\game::_id_C2DD();
    }
    else
    {
        scripts\mp\utility\game::_id_C29F( scripts\mp\utility\game::getgametype(), 65 );
        scripts\mp\utility\game::_id_C2B3( scripts\mp\utility\game::getgametype(), 10 );
        scripts\mp\utility\game::_id_C29B( scripts\mp\utility\game::getgametype(), 1 );
        scripts\mp\utility\game::_id_C2C2( scripts\mp\utility\game::getgametype(), 1 );
        scripts\mp\utility\game::_id_C270( scripts\mp\utility\game::getgametype(), 0 );
        scripts\mp\utility\game::_id_C24F( scripts\mp\utility\game::getgametype(), 0 );
        level._id_9BD7 = 0;
    }

    _id_D65B();
    _func_01F0( "ffa" );
    level.teambased = 0;
    level._id_AD39 = 500;
    level._id_AB62 = ::_id_AB62;
    level._id_AB6C = ::_id_AB6C;
    level._id_AB9A = ::_id_AB9A;
    level._id_6D2C = ::_id_6D2C;
    level._id_9FD5 = ::_id_AB91;
    level._id_AB2C = ::_id_AB2C;
    level._id_3E71 = ::_id_3E71;
    level._id_B0A4 = ::_id_B0A4;
    level._id_7C70 = ::_id_7C70;
    level._id_A90A = ::_id_A90A;
    level._id_EB98 = 0;
    level._id_EB99 = 0;
    level._id_10320 = "littlebird_neutral_mp";
    level._id_FE4D = [];
    level._id_51AB = 1;
    level._id_1D04 = 1;
    game["dialog"]["gametype"] = "hunted";

    if ( getdvarint( "#x33b8132c2bbd3f240" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "sotf_hint";
    game["dialog"]["defense_obj"] = "sotf_hint";
}

_id_81CB()
{
    scripts\mp\utility\game::_id_D4D3();
    _func_01D2( "scr_sotf_ffa_crateamount", getmatchrulesdata( "sotfFFAData", "crateAmount" ) );
    _func_01D2( "scr_sotf_ffa_crategunamount", getmatchrulesdata( "sotfFFAData", "crateGunAmount" ) );
    _func_01D2( "scr_sotf_ffa_cratetimer", getmatchrulesdata( "sotfFFAData", "crateDropTimer" ) );
    _func_01D2( "scr_sotf_ffa_roundlimit", 1 );
    scripts\mp\utility\game::_id_C29B( "sotf_ffa", 1 );
    _func_01D2( "scr_sotf_ffa_winlimit", 1 );
    scripts\mp\utility\game::_id_C2C2( "sotf_ffa", 1 );
    _func_01D2( "scr_sotf_ffa_halftime", 0 );
    scripts\mp\utility\game::_id_C24F( "sotf_ffa", 0 );
    _func_01D2( "scr_sotf_ffa_promode", 0 );
}

_id_AB6C()
{
    level._effect["signal_chest_drop"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["signal_chest_drop_mover"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
}

_id_AB9A()
{
    _func_01CE( "auto_change" );
    var_0 = &"OBJECTIVES/DM";
    var_1 = &"OBJECTIVES/DM_SCORE";
    var_2 = &"OBJECTIVES/DM_HINT";

    foreach ( var_4 in level._id_EF86 )
    {
        scripts\mp\utility\game::_id_D610( var_4, var_0 );

        if ( level._id_E427 )
            scripts\mp\utility\game::_id_D60E( var_4, var_0 );
        else
            scripts\mp\utility\game::_id_D60E( var_4, var_1 );

        scripts\mp\utility\game::_id_D609( var_4, var_2 );
    }

    _id_827A();
    level thread _id_E03C();
}

_id_827A()
{
    _id_07EE::_id_D454( "FreeForAll", "Crit_Default" );
    level._id_E324 = ( 0, 0, 0 );
    level._id_E321 = ( 0, 0, 0 );
    _id_07EE::_id_110D( "allies", "mp_dm_spawn" );
    _id_07EE::_id_110D( "axis", "mp_dm_spawn" );
    level._id_9A95 = _id_07EE::_id_5AC1( level._id_E324, level._id_E321 );
    setgameendtime( level._id_9A95 );
    _id_07EE::_id_0EBC();
}

_id_D65B()
{
    _id_4613();
    var_0 = _id_6CB2( level._id_B11F );
    var_1 = scripts\mp\utility\weapon::getweaponrootname( var_0["name"] );
    var_2 = _func_021D( "mp/sotfWeapons.csv", 2, var_1, 0 );
    setomnvar( "ui_sotf_pistol", int( var_2 ) );
    level._id_E043["axis"]["loadoutPrimary"] = "none";
    level._id_E043["axis"]["loadoutPrimaryAttachment"] = "none";
    level._id_E043["axis"]["loadoutPrimaryAttachment2"] = "none";
    level._id_E043["axis"]["loadoutPrimaryCamo"] = "none";
    level._id_E043["axis"]["loadoutPrimaryReticle"] = "none";
    level._id_E043["axis"]["loadoutSecondary"] = var_0["name"];
    level._id_E043["axis"]["loadoutSecondaryAttachment"] = "none";
    level._id_E043["axis"]["loadoutSecondaryAttachment2"] = "none";
    level._id_E043["axis"]["loadoutSecondaryCamo"] = "none";
    level._id_E043["axis"]["loadoutSecondaryReticle"] = "none";
    level._id_E043["axis"]["loadoutEquipment"] = "s4_throwing_knife_mp";
    level._id_E043["axis"]["loadoutOffhand"] = "flash_grenade_mp";
    level._id_E043["axis"]["loadoutStreakType"] = "assault";
    level._id_E043["axis"]["loadoutKillstreak1"] = "none";
    level._id_E043["axis"]["loadoutKillstreak2"] = "none";
    level._id_E043["axis"]["loadoutKillstreak3"] = "none";
    level._id_E043["axis"]["loadoutPerks"] = [ "specialty_longersprint", "specialty_extra_deadly" ];
    level._id_E043["allies"] = level._id_E043["axis"];
}

_id_6D2C()
{
    var_0 = _id_07EE::_id_6DBF( self.team );

    if ( level._id_7E95 )
        var_1 = _id_07EE::_id_6D2E( var_0 );
    else
        var_1 = undefined;

    return var_1;
}

_id_AB91()
{
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self._id_8F98 = self.pers["lastClass"];
    self.pers["gamemodeLoadout"] = level._id_E043[self.pers["team"]];
    level notify( "sotf_player_spawned", self );

    if ( !isdefined( self._id_56AA ) )
    {
        self._id_56AA = scripts\mp\rank::_id_6CEE( "kill" );
        _id_0A7B::_id_D543( self._id_56AA );
    }

    self._id_AA26 = undefined;
    self._id_A446 = undefined;
    thread _id_1084B();
}

_id_1084B()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "giveLoadout" );
    var_0 = self getcurrentweapon();
    self setweaponammostock( var_0, 0 );
    self._id_AA26 = var_0;
    thread _id_B0A4();
}

_id_AB62( var_0, var_1 )
{
    var_1._id_006A = var_1 _id_0A7B::_id_6C0A( "longestStreak" );

    if ( var_0 != "super_kill" && issubstr( var_0, "kill" ) )
    {
        var_2 = scripts\mp\rank::_id_6CEE( "score_increment" );
        return var_2;
    }

    return 0;
}

_id_AB2C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    scripts\mp\gametypes\common::_id_AA76( var_0, var_1, var_2, var_3, var_4, var_5 );
    var_1 _id_AFF0();
    var_6 = 0;

    foreach ( var_8 in level.players )
    {
        if ( isdefined( var_8._id_0369 ) && var_8._id_0369 > var_6 )
            var_6 = var_8._id_0369;
    }
}

_id_E03C()
{
    level thread _id_E720();
}

_id_E720()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = getdvarint( "scr_sotf_ffa_crateamount", 3 );
    var_1 = getdvarint( "scr_sotf_ffa_cratetimer", 30 );
    level waittill( "sotf_player_spawned", var_2 );

    for (;;)
    {
        if ( !isalive( var_2 ) )
        {
            var_2 = _id_5AD9( level.players );

            if ( !isdefined( var_2 ) )
                continue;
        }
        else
        {
            while ( isalive( var_2 ) )
            {
                if ( level._id_51AB )
                {
                    for ( var_3 = 0; var_3 < var_0; var_3++ )
                        level thread _id_E280( var_2 );

                    level thread _id_DC90( "sotf_crates_incoming" );
                    wait( var_1 );
                    continue;
                }

                waitframe();
            }
        }
    }
}

_id_DC90( var_0 )
{
    foreach ( var_2 in level.players )
        var_2 thread scripts\mp\hud_message::showsplash( var_0 );
}

_id_5AD9( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            return var_2;
    }

    level waittill( "sotf_player_spawned", var_4 );
    return var_4;
}

_id_E280( var_0 )
{
    var_1 = scripts\engine\utility::_id_6D7C( "sotf_chest_spawnpoint", "targetname" );
    var_2 = _id_6CA6( var_1 );

    if ( isdefined( var_2 ) )
        _id_B82D( var_2 );
}

_id_B82D( var_0 )
{
    var_1 = var_0 + ( 0, 0, 30 );
    var_2 = var_0 + ( 0, 0, -1000 );
    var_3 = scripts\engine\trace::ray_trace( var_1, var_2, undefined, scripts\engine\trace::_id_3ED4( 1 ) );
    var_4 = var_3["position"] + ( 0, 0, 1 );
    var_5 = var_3["entity"];

    if ( isdefined( var_5 ) )
    {
        for ( var_6 = var_5 _meth_8151(); isdefined( var_6 ); var_6 = var_5 _meth_8151() )
            var_5 = var_6;
    }

    if ( isdefined( var_5 ) )
    {
        var_7 = spawn( "script_model", var_4 );
        var_7 setmodel( "tag_origin" );
        var_7.angles = ( 90, randomintrange( -180, 179 ), 0 );
        var_7 linkto( var_5 );
        thread _id_B863( scripts\engine\utility::getfx( "signal_chest_drop_mover" ), var_7 );
    }
    else
        playfx( scripts\engine\utility::getfx( "signal_chest_drop" ), var_4 );
}

_id_B863( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.05;
    playfxontag( var_0, var_1, "tag_origin" );
    wait 6;
    stopfxontag( var_0, var_1, "tag_origin" );
    wait 0.05;
    var_1 delete();
}

_id_6932( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        var_5 = distance2dsquared( level._id_9A95, var_4.origin );

        if ( !isdefined( var_1 ) || var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    level._id_FE4D[level._id_FE4D.size] = var_1.origin;
    return var_1.origin;
}

_id_6CA6( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = 0;

        if ( isdefined( level._id_FE4D ) && level._id_FE4D.size > 0 )
        {
            foreach ( var_5 in level._id_FE4D )
            {
                if ( var_0[var_2].origin == var_5 )
                {
                    var_3 = 1;
                    break;
                }
            }

            if ( var_3 )
                continue;

            var_1[var_1.size] = var_0[var_2].origin;
            continue;
        }

        var_1[var_1.size] = var_0[var_2].origin;
    }

    if ( var_1.size > 0 )
    {
        var_7 = randomint( var_1.size );
        var_8 = var_1[var_7];
        level._id_FE4D[level._id_FE4D.size] = var_8;
        return var_8;
    }

    level._id_51AB = 0;
    return undefined;
}

_id_4613()
{
    var_0 = [];
    var_1 = [];

    for ( var_2 = 0; tablelookupbyrow( "mp/sotfWeapons.csv", var_2, 0 ) != ""; var_2++ )
    {
        var_3 = tablelookupbyrow( "mp/sotfWeapons.csv", var_2, 2 );
        var_4 = tablelookupbyrow( "mp/sotfWeapons.csv", var_2, 1 );
        var_5 = _id_8A08( var_3 );

        if ( isdefined( var_4 ) && var_5 && var_4 == "weapon_pistol" )
        {
            var_6 = 30;
            var_0[var_0.size]["name"] = var_3;
            var_0[var_0.size - 1]["weight"] = var_6;
            continue;
        }

        if ( isdefined( var_4 ) && var_5 && ( var_4 == "weapon_shotgun" || var_4 == "weapon_smg" || var_4 == "weapon_assault" || var_4 == "weapon_sniper" || var_4 == "weapon_dmr" || var_4 == "weapon_lmg" || var_4 == "weapon_projectile" ) )
        {
            var_6 = 0;

            switch ( var_4 )
            {
                case "weapon_shotgun":
                    var_6 = 35;
                    break;
                case "weapon_smg":
                case "weapon_assault":
                    var_6 = 25;
                    break;
                case "weapon_dmr":
                case "weapon_sniper":
                    var_6 = 15;
                    break;
                case "weapon_lmg":
                    var_6 = 10;
                    break;
                case "weapon_projectile":
                    var_6 = 30;
                    break;
            }

            var_1[var_1.size]["name"] = var_3 + "_mp";
            var_1[var_1.size - 1]["group"] = var_4;
            var_1[var_1.size - 1]["weight"] = var_6;
            continue;
        }

        continue;
    }

    var_1 = _id_E02B( var_1 );
    level._id_B11F = var_0;
    level._id_10D5B = var_1;
}

_id_E045( var_0 )
{
    self endon( "death" );
    self endon( "restarting_physics" );
    level endon( "game_ended" );

    if ( isdefined( game["strings"][self._id_3E7E + "_hint"] ) )
        var_1 = game["strings"][self._id_3E7E + "_hint"];
    else
        var_1 = &"MP/GET_KILLSTREAK";

    var_2 = "icon_hunted";
    scripts\cp_mp\killstreaks\airdrop::_id_3E7B( var_1, var_2 );
    thread scripts\cp_mp\killstreaks\airdrop::_id_3E5E();
    childthread _id_3E80( 60 );
    childthread _id_B6DA();
    var_3 = 0;
    var_4 = getdvarint( "scr_sotf_ffa_crategunamount", 1 );

    for (;;)
    {
        self waittill( "captured", var_5 );
        var_5 playlocalsound( "ammo_crate_use" );
        var_6 = _id_6CB2( level._id_10D5B );
        var_6 = _id_6C9E( var_6 );

        if ( _func_0120( var_6 ) )
            var_6 = makeweaponfromstring( var_6 );

        var_7 = var_5._id_8FAB;
        var_8 = var_5 _meth_8109( var_7 );

        if ( var_6 == var_7 )
        {
            var_5 _meth_819C( var_6 );
            var_5 setweaponammostock( var_6, var_8 );
        }
        else
        {
            if ( isdefined( var_7 ) && !isnullweapon( var_7 ) )
            {
                var_9 = var_5 dropitem( var_7 );

                if ( isdefined( var_9 ) && var_8 > 0 )
                    var_9._id_045A = "dropped_weapon";
            }

            var_5 giveweapon( var_6, 0, 0, 0, 1 );
            var_5 setweaponammostock( var_6, 0 );
            var_5 scripts\cp_mp\utility\inventory_utility::_switchtoweaponimmediate( var_6 );

            if ( var_5 getweaponammoclip( var_6 ) == 1 )
                var_5 setweaponammostock( var_6, 1 );

            var_5._id_AA26 = var_6;
        }

        var_3++;
        var_4 = var_4 - 1;

        if ( var_4 > 0 )
        {
            if ( isdefined( self._id_3E6E ) )
            {
                _id_0766::_id_D586( self._id_3E6E );
                self._id_3E6E = undefined;
            }

            var_10 = thread _id_0766::_id_D58E( level.players, "blitz_time_0" + var_4 + "_blue", 24 );
            self._id_3E6D = "blitz_time_0" + var_4 + "_blue";
            self._id_3E6E = var_10;
        }

        if ( self._id_3E7E == "sotf_weapon" && var_3 == getdvarint( "scr_sotf_ffa_crategunamount", 1 ) )
            scripts\cp_mp\killstreaks\airdrop::_id_4741();
    }
}

_id_3E80( var_0 )
{
    wait( var_0 );

    while ( isdefined( self._id_84D5 ) && self._id_84D5 )
        waitframe();

    scripts\cp_mp\killstreaks\airdrop::_id_4741();
}

_id_B6DA()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( isdefined( self._id_3E6E ) )
            _id_0766::_id_D583( self._id_3E6E, var_0 );
    }
}

_id_3E71( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_FE4D.size; var_1++ )
    {
        if ( var_0 != level._id_FE4D[var_1] )
            continue;

        level._id_FE4D = scripts\engine\utility::array_remove( level._id_FE4D, var_0 );
    }

    level._id_51AB = 1;
}

_id_8A08( var_0 )
{
    var_1 = _func_021D( "mp/sotfWeapons.csv", 2, var_0, 3 );
    var_2 = _func_021D( "mp/sotfWeapons.csv", 2, var_0, 4 );

    if ( var_1 == "TRUE" && ( var_2 == "" || getdvarint( var_2, 0 ) == 1 ) )
        return 1;

    return 0;
}

_id_6CB2( var_0 )
{
    var_1 = _id_D49B( var_0 );
    var_2 = randomint( level._id_10DB0["sum"] );
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( !var_1[var_4]["weight"] )
            continue;

        if ( var_1[var_4]["weight"] > var_2 )
        {
            var_3 = var_1[var_4];
            break;
        }
    }

    return var_3;
}

_id_6C9E( var_0 )
{
    var_1 = [];
    var_2 = [];
    var_3 = [];
    var_4 = scripts\mp\utility\weapon::getweaponrootname( var_0["name"] );
    var_5 = scripts\mp\utility\weapon::_id_688D( var_4 );

    if ( var_5.size > 0 )
    {
        var_6 = randomint( 5 );

        for ( var_7 = 0; var_7 < var_6; var_7++ )
        {
            var_1 = _id_6E10( var_0, var_2, var_5 );

            if ( var_1.size == 0 )
                break;

            var_8 = randomint( var_1.size );
            var_2[var_2.size] = var_1[var_8];
            var_9 = scripts\mp\utility\weapon::_id_1D81( var_1[var_8], var_4 );
            var_3[var_3.size] = var_9;
        }

        var_10 = scripts\mp\utility\weapon::_id_6E59( var_0["name"] );

        if ( var_10 == "weapon_dmr" || var_10 == "weapon_sniper" || var_4 == "iw6_dlcweap02" )
        {
            var_11 = 0;

            foreach ( var_13 in var_2 )
            {
                if ( scripts\mp\utility\weapon::_id_68C6( var_13 ) == "rail" )
                {
                    var_11 = 1;
                    break;
                }
            }

            if ( !var_11 )
            {
                var_15 = strtok( var_4, "_" )[1];
                var_3[var_3.size] = var_15 + "scope";
            }
        }

        if ( var_3.size > 0 )
        {
            var_3 = scripts\engine\utility::_id_1616( var_3 );

            foreach ( var_17 in var_3 )
                var_0["name"] = var_0["name"] + "_" + var_17;
        }
    }

    return var_0["name"];
}

_id_6E10( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5 == "gl" || var_5 == "shotgun" )
            continue;

        var_6 = _id_1D68( var_5, var_1 );

        if ( !var_6 )
            continue;

        var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_1D68( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] || !scripts\mp\utility\weapon::_id_1D89( var_0, var_1[var_2] ) )
            return 0;
    }

    return 1;
}

_id_3531( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2 == "thermal" || var_2 == "vzscope" || var_2 == "acog" || var_2 == "ironsight" )
            return 1;
    }

    return 0;
}

_id_B0A4()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        waitframe();
        var_0 = self getweaponslistprimaries();

        if ( var_0.size > 1 )
        {
            var_1 = self._id_AA26;

            foreach ( var_3 in var_0 )
            {
                if ( var_3 == var_1 )
                {
                    var_4 = self _meth_8109( var_3 );
                    var_5 = self dropitem( var_3 );

                    if ( isdefined( var_5 ) && var_4 > 0 )
                        var_5._id_045A = "dropped_weapon";

                    break;
                }
            }

            var_0 = scripts\engine\utility::array_remove( var_0, var_1 );
            self._id_AA26 = var_0[0];
        }
    }
}

_id_9787()
{
    self.pers["killChains"]++;
    _id_07D5::_id_E76D( "round", "killChains", self.pers["killChains"] );
}

_id_AFF0()
{
    if ( level._id_159F )
    {
        switch ( self._id_EA10 )
        {
            case 2:
                scripts\mp\utility\perk::_id_6FA5( "specialty_fastsprintrecovery" );
                thread scripts\mp\hud_message::showsplash( "specialty_fastsprintrecovery_sotf", self._id_EA10 );
                thread _id_9787();
                break;
            case 3:
                scripts\mp\utility\perk::_id_6FA5( "specialty_lightweight" );
                thread scripts\mp\hud_message::showsplash( "specialty_lightweight_sotf", self._id_EA10 );
                thread _id_9787();
                break;
            case 4:
                scripts\mp\utility\perk::_id_6FA5( "specialty_stalker" );
                thread scripts\mp\hud_message::showsplash( "specialty_stalker_sotf", self._id_EA10 );
                thread _id_9787();
                break;
            case 5:
                scripts\mp\utility\perk::_id_6FA5( "specialty_regenfaster" );
                thread scripts\mp\hud_message::showsplash( "specialty_regenfaster_sotf", self._id_EA10 );
                thread _id_9787();
                break;
            case 6:
                scripts\mp\utility\perk::_id_6FA5( "specialty_deadeye" );
                thread scripts\mp\hud_message::showsplash( "specialty_deadeye_sotf", self._id_EA10 );
                thread _id_9787();
                break;
        }
    }
}

_id_7C70( var_0, var_1 )
{
    var_2 = var_0 thread _id_0766::_id_D58E( level.players, var_1, 24, 1 );
    self._id_3E6D = var_1;
    self._id_3E6E = var_2;
}

_id_A90A( var_0 )
{
    _id_07D0::_id_A88F( var_0 );
}

_id_D49B( var_0 )
{
    level._id_10DB0["sum"] = 0;
    var_1 = var_0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !var_1[var_2]["weight"] )
            continue;

        level._id_10DB0["sum"] = level._id_10DB0["sum"] + var_1[var_2]["weight"];
        var_1[var_2]["weight"] = level._id_10DB0["sum"];
    }

    return var_1;
}

_id_E02B( var_0 )
{
    var_1 = [];
    var_2 = [];

    for ( var_3 = 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3]["weight"];
        var_1 = var_0[var_3];

        for ( var_5 = var_3 - 1; var_5 >= 0 && _id_870E( var_0[var_5]["weight"], var_4 ); var_5-- )
        {
            var_2 = var_0[var_5];
            var_0[var_5] = var_1;
            var_0[var_5 + 1] = var_2;
        }
    }

    return var_0;
}

_id_870E( var_0, var_1 )
{
    return var_0 < var_1;
}
