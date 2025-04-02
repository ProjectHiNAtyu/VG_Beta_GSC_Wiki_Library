// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "#x32ea5e908954bfea7" ) == "mp_background" )
        return;

    scripts\engine\utility::_id_5BF1( "strike_init_done" );
    _id_F53A();
    _id_F546();
    _id_0A50::_id_80C5();
    _id_07B3::init();
    _id_07B3::_id_D849();

    if ( isusingmatchrulesdata() )
        scripts\mp\utility\game::_id_D4D3();
    else
    {
        _func_01D2( "scr_game_tacticalmode", 0 );
        _func_01D2( "scr_game_onlyheadshots", 0 );
    }

    if ( issubstr( getdvar( "#x32ea5e908954bfea7" ), "mp_t_" ) )
        setdvar( "scr_game_enableMinimap", 0 );

    setdvar( "#x3fca1f9952f4e4fc5", 1 );
    setdvar( "ai_enable_execution_victim", 0 );
    setdvar( "scr_game_matchstarttime", 0 );
    setdvar( "scr_game_roundstarttime", 0 );
    var_0[0] = level.gametype;
    var_0[1] = "trial_variant_" + level._id_F513["variant"];
    var_0[2] = "trial_mission_" + level._id_F513["missionScript"];
    var_0[3] = "t_variant_" + level._id_F513["variant"];
    var_0[4] = "t_mission_" + level._id_F513["missionScript"];

    switch ( level._id_F513["missionScript"] )
    {
        case "race":
        case "arm_course":
            var_0[5] = "arm";
            break;
        default:
            break;
    }

    level._id_157D = var_0;
    _id_07AD::main( var_0 );
    scripts\mp\utility\game::_id_C29C( level.gametype, 0, 0, 9 );
    scripts\mp\utility\game::_id_C2B3( level.gametype, 0 );
    scripts\mp\utility\game::_id_C29F( level.gametype, 0 );
    scripts\mp\utility\game::_id_C29B( level.gametype, 1 );
    scripts\mp\utility\game::_id_C2C2( level.gametype, 1 );
    scripts\mp\utility\game::_id_C270( level.gametype, 0 );
    scripts\mp\utility\game::_id_C24F( level.gametype, 0 );
    _id_D6D5();
    scripts\mp\gametypes\common::_id_FC36();
    _id_076E::_id_8237();
    level._id_EB98 = 0;
    level._id_EB99 = 0;
    level._id_4AC6 = 1;
    level.teambased = 1;
    level._id_338D = 0;
    level._id_6D2C = ::_id_6D2C;
    level._id_AB46 = ::_id_AB46;
    level._id_2DCE = ::_id_1631;
    level._id_52D7 = ::_id_F581;

    if ( level._id_CF4B.size )
    {
        level._id_E72A = 0;

        while ( !isdefined( level._id_EA6D ) )
            waitframe();

        foreach ( var_3, var_2 in level._id_CF4B )
            [[ var_2 ]]( 1, "cs" + var_3 );

        foreach ( var_5 in level._id_40C8 )
        {
            foreach ( var_7 in var_5._id_A8EC )
            {
                if ( _func_02DB( var_7 ) && isdefined( var_7._id_EA67._id_CD5C ) )
                {
                    var_8 = 0;

                    foreach ( var_10 in var_0 )
                    {
                        if ( var_7._id_EA67._id_CD5C == var_10 )
                            var_8 = 1;
                    }

                    if ( !var_8 )
                        var_7 delete();
                }
            }
        }
    }

    switch ( level._id_F513["missionScript"] )
    {
        case "gun_nonlinear":
        case "gun":
            thread _id_0A5B::init();
            break;
        case "clear":
            thread _id_0A53::init();
            break;
        case "sniper":
            thread _id_0A5F::_id_DF77();
            break;
        case "jugg":
            thread _id_0A5C::_id_8BEC();
            break;
        case "lava":
            thread _id_0A55::init();
            break;
        case "pitcher":
            thread _id_0A5D::init();
            break;
        case "gunslinger":
            thread _id_0A56::init();
            break;
        case "race":
            thread _id_0A5E::_id_BEF6();
            break;
        case "arm_course":
            thread _id_0A59::init();
            break;
        default:
            break;
    }

    _id_0A5A::init();

    if ( level._id_F513["compassMaterialOverride"] != "" )
    {
        waitframe();
        _id_0797::_id_D880( level._id_F513["compassMaterialOverride"] );
    }
}

_id_F581( var_0, var_1 )
{
    level notify( "exitLevel_called" );

    if ( isdefined( level._id_F522 ) )
        [[ level._id_F522 ]]();

    if ( _func_00BE( "ui_trial_reward_tier" ) >= 1 )
    {
        setomnvar( "ui_trial_reward_received", 1 );
        setomnvar( "ui_trial_failed", 0 );
        wait 0.1;
        level.player _meth_824D( "RoundEndTeamHud" );
        wait 3;
    }

    _func_0064( 0 );
}

_id_F53A()
{
    var_0 = getdvarint( "#x3d24a7c0454aceb43", 0 );

    if ( var_0 == 0 )
    {
        var_1 = _func_021D( "mp/trial_mission_table.csv", 2, getdvar( "#x32ea5e908954bfea7" ), 0 );

        if ( var_1 != "" )
            var_0 = var_1;
        else
            return;
    }

    level._id_F513["missionID"] = int( var_0 );
    level._id_F513["zone"] = _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 2 );
    level._id_F513["missionScript"] = _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 3 );
    level._id_F513["variant"] = _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 4 );
    level._id_F513["team"] = _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 5 );
    level._id_F513["scoreType"] = _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 6 );
    level._id_F513["tier1"] = int( _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 8 ) );
    level._id_F513["tier2"] = int( _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 9 ) );
    level._id_F513["tier3"] = int( _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 10 ) );
    level._id_F513["attempts"] = int( _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 11 ) );
    level._id_F513["compassMaterialOverride"] = _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 18 );
    level._id_F513["playerDataId"] = int( _func_021D( "mp/trial_mission_table.csv", 0, level._id_F513["missionID"], 20 ) );

    if ( level._id_F513["zone"] != getdvar( "#x32ea5e908954bfea7" ) )
    {

    }

    setomnvar( "ui_trial_mission_score_is_time", level._id_F513["scoreType"] == "time" );
    setomnvar( "ui_trial_mission_id", level._id_F513["missionID"] );
    setomnvar( "ui_trial_mission_player_data_id", level._id_F513["playerDataId"] );
    setomnvar( "ui_trial_tier_1_requirement", level._id_F513["tier1"] );
    setomnvar( "ui_trial_tier_2_requirement", level._id_F513["tier2"] );
    setomnvar( "ui_trial_tier_3_requirement", level._id_F513["tier3"] );
}

_id_6D2C()
{
    while ( istrue( level._id_F54C ) )
        waitframe();

    var_0 = "mp_trial_spawn";
    var_1 = _id_07EE::_id_6D30( var_0 );
    var_2 = _id_07EE::_id_6D2F( var_1 );

    if ( isdefined( level._id_F54B ) )
    {
        var_3 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_1018D( level._id_F54B, 1 );
        var_4 = spawnstruct();
        var_4._id_FE99 = 1;
        var_4._id_54C5 = "spawned_player";
        thread scripts\cp_mp\vehicles\vehicle_occupancy::_id_1017C( level._id_F54B, var_3[0], self, var_4 );
        self._id_E306 = 1;
    }

    return var_2;
}

_id_1631()
{
    return "gamemode";
}

_id_AB46( var_0 )
{
    var_0 thread _id_07C9::_id_114D( level._id_F513["team"] );
    level._id_EF67["allies"]["soundInfix"] = "uk";
    level._id_EF67["axis"]["soundInfix"] = "ru";
    var_0 setclientomnvar( "ui_skip_loadout", 1 );
    var_0 setclientomnvar( "ui_total_fade", 1 );
    var_0.pers["class"] = "gamemode";
    var_0.pers["lastClass"] = "";
    var_0.class = var_0.pers["class"];
    var_0._id_8F98 = var_0.pers["lastClass"];

    if ( isdefined( level._id_F539 ) )
        var_0.pers["gamemodeLoadout"] = level._id_F539;
    else
        var_0.pers["gamemodeLoadout"] = level._id_F537["axis"];

    if ( istrue( level._id_F534 ) )
        var_0 thread _id_7E6E();

    thread _id_F57F();
    level waittill( "player_spawned" );

    if ( level.players.size > 1 )
        _func_0064( 0 );

    wait 1;
    thread scripts\cp_mp\utility\game_utility::_id_58A7( var_0, 0, 0.5 );

    if ( game["trial"]["tries_remaining"] < level._id_F513["attempts"] )
        var_0 _id_0A64::_id_9120( "trial_retry" );
    else if ( getdvar( "#x32ea5e908954bfea7" ) == getdvar( "old_mapname", "" ) )
        var_0 _id_0A64::_id_9120( "trial_intro_short" );
    else
        var_0 _id_0A64::_id_9120( "trial_intro" );

    setdvar( "old_mapname", getdvar( "#x32ea5e908954bfea7" ) );
    thread _id_F544();
}

_id_D6D5()
{
    level._id_F537["axis"]["loadoutPrimary"] = "s4_me_fists";
    level._id_F537["axis"]["loadoutPrimaryAttachment"] = "none";
    level._id_F537["axis"]["loadoutPrimaryAttachment2"] = "none";
    level._id_F537["axis"]["loadoutPrimaryCamo"] = "none";
    level._id_F537["axis"]["loadoutPrimaryReticle"] = "none";
    level._id_F537["axis"]["loadoutSecondary"] = "none";
    level._id_F537["axis"]["loadoutSecondaryAttachment"] = "none";
    level._id_F537["axis"]["loadoutSecondaryAttachment2"] = "none";
    level._id_F537["axis"]["loadoutSecondaryCamo"] = "none";
    level._id_F537["axis"]["loadoutSecondaryReticle"] = "none";
    level._id_F537["axis"]["loadoutEquipment"] = "specialty_null";
    level._id_F537["axis"]["loadoutOffhand"] = "none";
    level._id_F537["axis"]["loadoutStreakType"] = "assault";
    level._id_F537["axis"]["loadoutKillstreak1"] = "none";
    level._id_F537["axis"]["loadoutKillstreak2"] = "none";
    level._id_F537["axis"]["loadoutKillstreak3"] = "none";
    level._id_F537["axis"]["loadoutPerks"] = [];
    level._id_F537["axis"]["loadoutGesture"] = "playerData";
    var_0 = getent( "trial_starting_weapon", "script_noteworthy" );

    if ( isdefined( var_0 ) )
    {
        var_1 = strtok( var_0._id_CE0B, "+" );
        var_2 = var_1[0];
        var_3 = scripts\engine\utility::array_remove( var_1, var_2 );
        level._id_F537["axis"]["loadoutPrimary"] = var_2;

        foreach ( var_7, var_5 in var_3 )
        {
            if ( !var_7 )
            {
                level._id_F537["axis"]["loadoutPrimaryAttachment"] = var_5;
                continue;
            }

            var_6 = "loadoutPrimaryAttachment" + ( var_7 + 1 );
            level._id_F537["axis"][var_6] = var_5;
        }
    }

    level._id_F537["allies"] = level._id_F537["axis"];
}

_id_7E6E()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "reload" );
        self givemaxammo( self._id_0121 );
    }
}

_id_F57F()
{
    level._id_F580 = getentarray( "trial_weapon", "targetname" );

    while ( !isdefined( level._id_10DAE ) )
        waitframe();

    waitframe();

    foreach ( var_1 in level._id_F580 )
        var_1 thread _id_10D1C();
}

_id_10D1C()
{
    level.player endon( "death" );
    var_0 = strtok( self._id_CE0B, "+" );
    var_1 = var_0[0];
    var_2 = scripts\engine\utility::array_remove( var_0, var_1 );
    var_3 = scripts\cp_mp\utility\game_utility::isnightmap();

    if ( scripts\engine\utility::array_contains( var_2, "akimbo" ) )
        var_2 = scripts\engine\utility::array_remove( var_2, "akimbo" );

    var_4 = scripts\mp\utility\weapon::_id_10D5D( var_1 );
    var_5 = makeweapon( var_4 );
    var_6 = [];

    foreach ( var_8 in var_2 )
    {
        var_9 = scripts\mp\utility\weapon::_id_1D81( var_8, var_4 );

        if ( var_5 _meth_8627( var_9 ) )
        {
            var_6[var_6.size] = var_8;
            continue;
        }
    }

    var_2 = var_6;
    var_11 = scripts\mp\class::buildweapon( var_1, var_2, "none", "none", -1, undefined, undefined, undefined, var_3 );
    var_12 = getcompleteweaponname( var_11 );

    while ( !isdefined( level.player._id_0324[0] ) )
        waitframe();

    for (;;)
    {
        var_13 = 0;
        var_14 = 0;

        if ( isdefined( level.player._id_0324[0] ) )
            var_13 = var_12 == getcompleteweaponname( level.player._id_0324[0] );

        if ( isdefined( level.player._id_0324[1] ) )
            var_14 = var_12 == getcompleteweaponname( level.player._id_0324[1] );

        if ( !isdefined( self._id_E2AE ) && !var_13 && !var_14 )
        {
            self._id_E2AE = spawn( "weapon_" + var_12, self.origin, 17 );
            self._id_E2AE.angles = self.angles;
            var_15 = weaponmaxammo( var_11 );

            if ( isdefined( self._id_0375 ) )
            {
                if ( self._id_0375 == "outline" )
                    scripts\mp\utility\outline::outlineenableforplayer( self._id_E2AE, level.player, "outline_trial_item", "level_script" );
                else if ( self._id_0375 == "osp" )
                {
                    scripts\mp\utility\outline::outlineenableforplayer( self._id_E2AE, level.player, "outlinefill_nodepth_cyan", "level_script" );
                    var_15 = 0;
                }
            }

            if ( istrue( level._id_B526 ) )
                var_15 = level._id_5358 - weaponclipsize( var_11 );

            self._id_E2AE _meth_81F5( weaponclipsize( var_11 ), var_15 );
        }

        level.player waittill( "weapon_dropped", var_16, var_17 );

        if ( getcompleteweaponname( var_17 ) == var_12 )
            var_16 delete();
    }
}

_id_F52B()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = _func_00BE( "ui_trial_main_score" );
    var_4 = _func_00BE( "ui_trial_main_time" );

    if ( var_3 != -1 )
    {
        var_0 = var_3 >= _func_00BE( "ui_trial_tier_1_requirement" );
        var_1 = var_3 >= _func_00BE( "ui_trial_tier_2_requirement" );
        var_2 = var_3 >= _func_00BE( "ui_trial_tier_3_requirement" );
    }
    else if ( var_4 != -1 )
    {
        var_0 = var_4 <= _func_00BE( "ui_trial_tier_1_requirement" );
        var_1 = var_4 <= _func_00BE( "ui_trial_tier_2_requirement" );
        var_2 = var_4 <= _func_00BE( "ui_trial_tier_3_requirement" );
    }

    if ( istrue( level._id_F52F ) )
    {
        level._id_F52F = 0;
        var_5 = "trial_end_tier_0_alt";
    }
    else if ( var_2 )
        var_5 = "trial_end_tier_3";
    else if ( var_1 )
        var_5 = "trial_end_tier_2";
    else if ( var_0 )
        var_5 = "trial_end_tier_1";
    else
        var_5 = "trial_end_tier_0";

    level.player _id_0A64::_id_9120( var_5 );
    _id_0A61::_id_F57B();

    if ( !istrue( level._id_F545 ) )
        level.player _id_0A64::_id_9120( "trial_retry" );
}

_id_F546()
{
    if ( !isdefined( game["trial"] ) )
        game["trial"] = [];

    if ( !isdefined( game["trial"]["best_score"] ) )
        game["trial"]["best_score"] = -1;

    if ( !isdefined( game["trial"]["best_time"] ) )
        game["trial"]["best_time"] = -1;

    if ( !isdefined( game["trial"]["tries_remaining"] ) )
        game["trial"]["tries_remaining"] = level._id_F513["attempts"];

    setomnvar( "ui_trial_best_score", int( game["trial"]["best_score"] ) );
    setomnvar( "ui_trial_best_time", int( game["trial"]["best_time"] ) );
    setomnvar( "ui_trial_tries_remaining", int( game["trial"]["tries_remaining"] ) );
}

_id_F544()
{
    for (;;)
    {
        level.player waittill( "luinotifyserver", var_0 );

        if ( var_0 == "trial_restart" )
            _id_0A61::_id_F543();
    }
}
