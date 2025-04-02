// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    _id_06B9::_id_1000( "callback_match_start", ::_id_AA44 );
    _id_06B9::_id_1000( "callback_match_end", ::_id_AA43 );
    _id_06B9::_id_1000( "callback_on_player_connect", ::_id_AA4A );
    _id_06B9::_id_1000( "callback_on_player_spawned", ::on_player_spawned );
    _id_06B9::_id_1000( "callback_player_server_end", ::on_player_match_end );
    _id_06B9::_id_1000( "callback_player_death", ::on_player_death );
    _id_06B9::_id_1000( "callback_on_player_disconnect", ::_id_AA4B );
}

_id_AA44()
{
    _func_01DA( "commonMatchData", "utc_start_time_s", _func_00D7() );
    _func_01DA( "commonMatchData", "player_count_start", level.players.size );

    if ( isdefined( game["telemetry"] ) )
        game["telemetry"].utc_start_time_s = _func_00D7();

    var_0 = scripts\mp\utility\game::getgametype();
    var_1 = "";

    if ( var_0 == "br" )
        var_1 = level._id_2B8F.name;

    if ( level._id_74A8 )
        var_0 = var_0 + " hc";

    var_2 = 0;
    var_3 = "";

    if ( !scripts\mp\utility\game::_id_BD25() )
    {
        var_2 = _func_00C5();
        var_3 = _func_042C();
    }

    _func_03BA( "dlog_event_mp_server_match_start", [ "map", level._id_036A, "game_type", var_0, "is_playtest", getdvarint( "dlog_is_playtest" ), "experiment_name", getdvar( "experiment_name" ), "dedi_server_guid", _func_040D(), "sub_game_type", var_1, "playlist_id", var_2, "playlist_name", var_3 ] );

    if ( var_0 == "br" )
        scripts\common\utility::_id_F737( level._id_9B95 );

    _func_03D2();
}

_id_AA43( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = scripts\mp\utility\game::getgametype();

    if ( isdefined( game["telemetry"].utc_start_time_s ) )
        var_1 = game["telemetry"].utc_start_time_s;

    if ( isdefined( game["telemetry"].total_player_connections ) )
        var_2 = game["telemetry"].total_player_connections;

    if ( isdefined( game["telemetry"].life_count ) )
        var_3 = game["telemetry"].life_count;

    if ( level._id_74A8 )
        var_4 = var_4 + " hc";

    var_5 = 0;
    var_6 = "";

    if ( !scripts\mp\utility\game::_id_BD25() )
    {
        var_5 = _func_00C5();
        var_6 = _func_042C();
    }

    _func_03BA( "dlog_event_mp_server_match_end", [ "utc_start_time_s", var_1, "utc_end_time_s", _func_00D7(), "total_player_connections", var_2, "life_count", var_3, "playlist_id", var_5, "playlist_name", var_6, "game_type", var_4, "map", level._id_036A ] );
}

_id_AA4A( var_0 )
{
    if ( !isdefined( var_0.pers["telemetry"] ) || !isdefined( var_0.pers["telemetry"]._id_3B5D ) )
    {
        if ( !isdefined( var_0.pers["telemetry"] ) )
            var_0.pers["telemetry"] = spawnstruct();

        if ( isdefined( game["telemetry"] ) && isdefined( game["telemetry"].total_player_connections ) )
        {
            var_0.pers["telemetry"].connect_index = game["telemetry"].total_player_connections;
            game["telemetry"].total_player_connections++;
        }
        else
            return;

        var_0.pers["telemetry"].utc_connect_time_s = _func_00D7();
        var_0.pers["telemetry"]._id_3B5D = 1;
        var_1 = 0;

        if ( level._id_AB11 )
            var_1 = var_0 _meth_81BE();

        var_2 = "";
        var_3 = "";
        var_4 = -1;
        var_5 = -1;
        var_6 = "none";
        var_7 = "none";

        if ( !istrue( game["isLaunchChunk"] ) && !isbot( var_0 ) )
        {
            if ( level.teambased )
            {
                var_2 = var_0 _id_07F7::_id_9800( "allies" );
                var_3 = var_0 _id_07F7::_id_9800( "axis" );
                var_4 = var_0 _id_07F7::_id_9801( "allies" );
                var_5 = var_0 _id_07F7::_id_9801( "axis" );
                var_8 = var_0 _id_07F7::_id_6BB3( var_2 );

                if ( isdefined( var_8 ) )
                    var_6 = var_8;

                var_8 = var_0 _id_07F7::_id_6BB3( var_3 );

                if ( isdefined( var_8 ) )
                    var_7 = var_8;
            }
            else
            {
                var_2 = var_0 _id_07F7::_id_9800( "allies" );
                var_4 = var_0 _id_07F7::_id_9801( "allies" );
                var_8 = var_0 _id_07F7::_id_6BB3( var_2 );

                if ( isdefined( var_8 ) )
                    var_6 = var_8;
            }
        }

        var_0.pers["telemetry"].rank_at_start = 0;
        var_9 = var_0 scripts\mp\rank::_id_6CC0();

        if ( isdefined( var_9 ) )
            var_0.pers["telemetry"].rank_at_start = var_0 scripts\mp\rank::_id_6CB8( var_9 );

        if ( var_0 scripts\mp\utility\game::_id_C01A() && var_0 _meth_85AB() )
        {
            var_0.pers["telemetry"].xp_at_start = var_0 getplayerdata( "common", "mpProgression", "playerLevel", "xp" );
            var_0.pers["telemetry"].score_at_start = var_0 getplayerdata( "mp", "playerStats", "matchStats", "score" );
            var_0.pers["telemetry"].prestige_at_start = var_0 getplayerdata( "rankedloadouts", "squadMembers", "season_rank" );
        }
        else
        {
            var_0.pers["telemetry"].xp_at_start = 0;
            var_0.pers["telemetry"].score_at_start = 0;
            var_0.pers["telemetry"].prestige_at_start = 0;
        }

        var_10 = scripts\mp\utility\game::getgametype();

        if ( level._id_74A8 )
            var_10 = var_10 + " hc";

        var_11 = 0;
        var_12 = "";

        if ( !scripts\mp\utility\game::_id_BD25() )
        {
            var_11 = _func_00C5();
            var_12 = _func_042C();
        }

        var_13 = 0;

        if ( isdefined( var_0.pers["telemetry"].connect_index ) )
            var_13 = var_0.pers["telemetry"].connect_index;

        var_14 = _func_0470();

        if ( !isdefined( var_14 ) )
            var_14 = "";

        var_0 _meth_870C( "dlog_event_mp_player_match_start", [ "utc_connect_time_s", var_0.pers["telemetry"].utc_connect_time_s, "team", var_0._id_0393, "join_type", var_0 _meth_813E(), "skill", var_0 _meth_811E(), "party_id", var_0 _meth_8740(), "is_party_host", var_1, "is_guest", var_0 _meth_8741(), "was_keyboardmouse", var_0 _meth_875E() != 1, "operator_allies", var_2, "operator_axis", var_3, "operator_allies_skin", var_4, "operator_axis_skin", var_5, "operator_allies_execution_ref", var_6, "operator_axis_execution_ref", var_7, "map", level._id_036A, "playlist_id", var_11, "playlist_name", var_12, "game_type", var_10, "connect_index", var_13, "lobby_id", var_14 ] );
    }
}

on_player_spawned( var_0 )
{
    if ( !isdefined( var_0.pers["telemetry"] ) )
        var_0.pers["telemetry"] = spawnstruct();

    var_0.pers["telemetry"]._id_934E = spawnstruct();

    if ( isdefined( game["telemetry"] ) && isdefined( game["telemetry"].life_count ) )
    {
        var_0.pers["telemetry"]._id_934E.life_index = game["telemetry"].life_count;
        game["telemetry"].life_count++;
    }

    if ( isdefined( var_0.pers["summary"]["xp"] ) )
        var_0.pers["telemetry"]._id_934E.xp_at_spawn = var_0.pers["summary"]["xp"];
    else
        var_0.pers["telemetry"]._id_934E.xp_at_spawn = 0;

    if ( isdefined( var_0._id_0369 ) )
        var_0.pers["telemetry"]._id_934E.score_at_spawn = var_0._id_0369;
    else
        var_0.pers["telemetry"]._id_934E.score_at_spawn = 0;
}

on_player_match_end( var_0 )
{
    var_1 = var_0.player;

    if ( isai( var_1 ) )
        return;

    var_2 = 0;

    if ( isdefined( var_1.pers["telemetry"].utc_connect_time_s ) )
        var_2 = var_1.pers["telemetry"].utc_connect_time_s;

    var_3 = "";

    if ( isdefined( var_0.disconnectreason ) )
        var_3 = var_0.disconnectreason;

    var_4 = 0;

    if ( level.teambased )
        var_4 = int( var_1 scripts\mp\rank::_id_6DB9( var_1.team ) );

    var_5 = 0;

    if ( isdefined( var_1.pers["telemetry"].connect_index ) )
        var_5 = var_1.pers["telemetry"].connect_index;

    var_6 = 0;
    var_7 = 0;
    var_8 = 0;
    var_9 = 0;
    var_10 = 0;
    var_11 = 0;
    var_12 = 0;
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    var_16 = 0;
    var_17 = 0;

    if ( var_1 scripts\mp\utility\game::_id_AB13() )
    {
        if ( isdefined( var_1.pers["summary"]["xp"] ) )
            var_6 = var_1.pers["summary"]["xp"];

        if ( isdefined( var_1.pers["summary"]["score"] ) )
            var_7 = var_1.pers["summary"]["score"];

        if ( isdefined( var_1.pers["summary"]["challenge"] ) )
            var_8 = var_1.pers["summary"]["challenge"];

        if ( isdefined( var_1.pers["summary"]["match"] ) )
            var_9 = var_1.pers["summary"]["match"];

        if ( isdefined( var_1.pers["summary"]["medal"] ) )
            var_10 = var_1.pers["summary"]["medal"];

        if ( isdefined( var_1.pers["summary"]["bonusXP"] ) )
            var_11 = var_1.pers["summary"]["bonusXP"];

        if ( isdefined( var_1.pers["summary"]["misc"] ) )
            var_12 = var_1.pers["summary"]["misc"];

        if ( isdefined( var_1.pers["summary"]["accolade"] ) )
            var_13 = var_1.pers["summary"]["accolade"];

        if ( isdefined( var_1.pers["summary"]["weaponXP"] ) )
            var_14 = var_1.pers["summary"]["weaponXP"];

        if ( isdefined( var_1.pers["summary"]["operatorXP"] ) )
            var_15 = var_1.pers["summary"]["operatorXP"];

        if ( isdefined( var_1.pers["summary"]["clanXP"] ) )
            var_16 = var_1.pers["summary"]["clanXP"];

        if ( isdefined( var_1.pers["summary"]["battlepassXP"] ) )
            var_17 = var_1.pers["summary"]["battlepassXP"];
    }

    if ( var_1.pers["telemetry"].rank_at_start )
        var_18 = var_1.pers["telemetry"].rank_at_start;
    else
        var_18 = 0;

    var_19 = 0;
    var_20 = var_1 scripts\mp\rank::_id_6CC0();

    if ( isdefined( var_20 ) )
        var_19 = var_1 scripts\mp\rank::_id_6CB8( var_20 );

    if ( var_1.pers["telemetry"].xp_at_start )
        var_21 = var_1.pers["telemetry"].xp_at_start;
    else
        var_21 = 0;

    if ( var_1.pers["telemetry"].score_at_start )
        var_22 = var_1.pers["telemetry"].score_at_start;
    else
        var_22 = 0;

    if ( var_1.pers["telemetry"].prestige_at_start )
        var_23 = var_1.pers["telemetry"].prestige_at_start;
    else
        var_23 = 0;

    if ( var_1 scripts\mp\utility\game::_id_C01A() && var_1 _meth_85AB() )
    {
        var_24 = var_1 getplayerdata( "common", "mpProgression", "playerLevel", "xp" );
        var_25 = var_1 getplayerdata( "mp", "playerStats", "matchStats", "score" );
        var_26 = var_1 getplayerdata( "rankedloadouts", "squadMembers", "season_rank" );
        var_27 = var_1 getplayerdata( "mp", "playerStats", "combatStats", "kills" );
        var_28 = var_1 getplayerdata( "mp", "playerStats", "combatStats", "deaths" );
        var_29 = var_1 getplayerdata( "mp", "playerStats", "matchStats", "wins" );
        var_30 = var_1 getplayerdata( "mp", "playerStats", "matchStats", "losses" );
        var_31 = var_1 getplayerdata( "mp", "playerStats", "combatStats", "hits" );
        var_32 = var_1 getplayerdata( "mp", "playerStats", "combatStats", "misses" );
        var_33 = var_1 getplayerdata( "mp", "playerStats", "matchStats", "gamesPlayed" );
        var_34 = var_1 getplayerdata( "mp", "playerStats", "matchStats", "timePlayedTotal" );
    }
    else
    {
        var_24 = 0;
        var_25 = 0;
        var_26 = 0;
        var_27 = 0;
        var_28 = 0;
        var_29 = 0;
        var_30 = 0;
        var_31 = 0;
        var_32 = 0;
        var_33 = 0;
        var_34 = 0;
    }

    var_35 = -1;
    var_36 = 0;
    var_37 = 0;

    if ( isdefined( var_0.disconnectreason ) )
    {
        if ( scripts\mp\utility\game::_id_89F1() )
            var_35 = game["roundsPlayed"];

        if ( level.teambased )
        {
            if ( isdefined( var_1.team ) )
            {
                if ( var_1.team == "allies" )
                {
                    var_36 = _func_00DB( "allies" );
                    var_37 = _func_00DB( "axis" );
                }
                else if ( var_1.team == "axis" )
                {
                    var_36 = _func_00DB( "axis" );
                    var_37 = _func_00DB( "allies" );
                }
            }
        }
    }

    var_38 = 0.0;
    var_39 = 0.0;

    if ( isdefined( var_1._id_D022 ) && var_1._id_D022["movementUpdateCount"] >= 30 )
    {
        var_38 = var_1._id_D022["movingTotal"] / ( var_1._id_D022["movementUpdateCount"] / 5 ) * 100;
        var_39 = var_1._id_D022["distanceTotal"] / var_1._id_D022["movementUpdateCount"];
    }

    var_40 = 0.0;

    if ( isdefined( var_1.pers["totalDistTraveled"] ) )
        var_40 = float( var_1.pers["totalDistTraveled"] );

    var_41 = 0.0;
    var_42 = var_1 _id_07DB::_id_6C45( "combatStats", "totalShots" );
    var_43 = var_1 _id_07DB::_id_6C45( "combatStats", "hits" );

    if ( isdefined( var_42 ) && isdefined( var_43 ) && var_42 > 0 )
        var_41 = float( var_43 / var_42 * 100 );

    var_44 = 0;

    if ( isdefined( var_1.pers["suicides"] ) )
        var_44 = var_1 _id_0A7B::_id_6C0A( "suicides" );

    var_45 = 0;
    var_46 = 0;
    var_47 = 0;
    var_48 = 0;

    if ( scripts\mp\utility\game::getgametype() == "arm" && isdefined( var_1._id_732B ) )
    {
        var_45 = istrue( var_1._id_732B["rightmouseup"] );
        var_46 = istrue( var_1._id_732B["leftmouseup"] );
        var_47 = istrue( var_1._id_732B["activate"] );
        var_48 = istrue( var_1._id_732B["gostand"] );
    }

    var_49 = scripts\mp\utility\game::getgametype();

    if ( level._id_74A8 )
        var_49 = var_49 + " hc";

    var_50 = 0;
    var_51 = "";

    if ( !scripts\mp\utility\game::_id_BD25() )
    {
        var_50 = _func_00C5();
        var_51 = _func_042C();
    }

    var_52 = _func_0470();

    if ( !isdefined( var_52 ) )
        var_52 = "";

    var_53 = "";

    if ( scripts\mp\utility\game::_id_9BB3() )
        var_53 = _func_043E( var_50 );

    var_54 = "loss";

    if ( isdefined( var_1.pers["match_outcome"] ) )
        var_54 = var_1.pers["match_outcome"];

    var_1 _meth_870C( "dlog_event_mp_player_match_end", [ "utc_connect_time_s", var_2, "utc_disconnect_time_s", _func_00D7(), "score", var_1 _id_0A7B::_id_6C0A( "score" ), "assists", var_1 _id_0A7B::_id_6C0A( "assists" ), "longest_streak", var_1 _id_0A7B::_id_6C0A( "longestStreak" ), "kills", var_1 _id_0A7B::_id_6C0A( "kills" ), "deaths", var_1 _id_0A7B::_id_6C0A( "deaths" ), "headshots", var_1 _id_0A7B::_id_6C0A( "headshots" ), "executions", var_1 _id_0A7B::_id_6C0A( "executions" ), "player_xp_modifier", int( var_1 scripts\mp\rank::_id_6CC1() ), "team_xp_modifier", var_4, "weapon_xp_modifier", int( var_1 _id_07FD::_id_6E69() ), "disconnect_reason", var_3, "player_quit_round_number", var_35, "player_quit_team_score", var_36, "player_quit_opposing_team_score", var_37, "average_speed_during_match", var_39, "percent_time_moving", var_38, "damage_done", var_1 _id_0A7B::_id_6C0A( "damage" ), "damage_taken", var_1 _id_0A7B::_id_6C0A( "damageTaken" ), "distance_traveled", var_40, "weapon_accuracy", var_41, "suicides", var_44, "game_type", var_49, "gw_spawn_method_press_activate", var_47, "gw_spawn_method_press_gostand", var_48, "gw_spawn_method_press_lclick", var_46, "gw_spawn_method_press_rclick", var_45, "playlist_id", var_50, "playlist_name", var_51, "map", level._id_036A, "connect_index", var_5, "lobby_id", var_52, "intensity", var_53, "match_outcome", var_54, "rank_at_start", var_18, "rank_at_end", var_19, "xp_at_start", var_21, "xp_at_end", var_24, "score_at_start", var_22, "score_at_end", var_25, "prestige_at_start", var_23, "prestige_at_end", var_26, "lifetime_kills", var_27, "lifetime_deaths", var_28, "lifetime_wins", var_29, "lifetime_losses", var_30, "lifetime_hits", var_31, "lifetime_misses", var_32, "lifetime_games_played", var_33, "lifetime_time_played_total", var_34, "total_xp", var_6, "score_xp", var_7, "challenge_xp", var_8, "match_xp", var_9, "medal_xp", var_10, "bonus_xp", var_11, "misc_xp", var_12, "accolade_xp", var_13, "weapon_xp", var_14, "operator_xp", var_15, "clan_xp", var_16, "battlepass_xp", var_17 ] );
}

on_player_death( var_0 )
{
    var_1 = var_0.attacker;
    var_2 = var_0._id_103C0;
    var_3 = var_0._id_10D84;
    var_4 = var_0._id_9CBF;

    if ( !_id_06B9::is_valid_client( var_2 ) )
        return;

    if ( var_3 == "agent_mp" )
        var_5 = [];
    else
    {
        var_6 = scripts\mp\utility\weapon::_id_6E4C( var_3 );
        var_5 = scripts\mp\utility\weapon::_id_1D8B( var_6, var_3 );
    }

    var_7 = 0;

    if ( isdefined( var_2._id_E390 ) )
        var_7 = var_2._id_E390;

    var_8 = _id_06B9::get_time_from_match_start( var_7 );
    var_9 = _id_06B9::get_time_from_match_start( gettime() );
    var_10 = -1;

    if ( isdefined( var_2.pers["telemetry"]._id_934E.life_index ) )
        var_10 = var_2.pers["telemetry"]._id_934E.life_index;

    var_11 = -1;
    var_12 = -1;
    var_13 = [];

    if ( _id_06B9::is_valid_client( var_1 ) )
    {
        var_14 = getweaponbasename( var_3 );
        var_15 = var_1;
        var_16 = var_1 scripts\mp\utility\weapon::_id_8964( var_3 );
        var_17 = var_1 _meth_8542( var_3 );
        var_18 = 0.0;

        if ( scripts\mp\utility\weapon::_id_877F( var_3 ) )
            var_18 = var_1 playerads();

        var_19 = scripts\engine\utility::_id_10E74( var_2.origin, var_2.angles, var_1.origin, 0.4226 );
        var_20 = scripts\engine\utility::_id_10E74( var_1.origin, var_1.angles, var_2.origin, 0.4226 );
        var_21 = var_1 _id_06B9::mount_string_to_dlog_enum();
        var_22 = var_1.origin;
        var_23 = var_1.angles;

        if ( isdefined( var_1.pers["telemetry"]._id_934E.life_index ) )
            var_11 = var_1.pers["telemetry"]._id_934E.life_index;

        if ( isdefined( var_1._id_9661 ) )
            var_12 = var_1._id_9661;

        var_13 = var_1 _id_06B9::get_death_modifiers();
    }
    else
    {
        var_15 = undefined;
        var_14 = "";
        var_16 = 0;
        var_17 = 0;
        var_18 = 0.0;
        var_19 = 0;
        var_20 = 0;
        var_21 = "MOUNT_NONE";
        var_22 = ( 0, 0, 0 );
        var_23 = ( 0, 0, 0 );
    }

    var_24 = var_2 _id_06B9::get_death_modifiers();
    var_25 = [];
    var_26 = "";

    if ( isdefined( var_2._id_90B7 ) )
    {
        var_27 = var_2._id_90B7;
        var_28 = scripts\mp\utility\weapon::_id_6E4C( var_27 );
        var_25 = scripts\mp\utility\weapon::_id_1D8B( var_28, var_27 );
        var_26 = getweaponbasename( var_27 );
        var_29 = var_2 scripts\mp\utility\weapon::_id_8964( var_27 );
        var_30 = var_2 _meth_8542( var_27, 0, 1 );
        var_31 = var_2 playerads();
    }
    else
    {
        var_29 = 0;
        var_30 = 0;
        var_31 = 0.0;
    }

    var_32 = var_2 _id_06B9::mount_string_to_dlog_enum();
    var_33 = -1;

    if ( isdefined( var_2._id_9661 ) )
        var_33 = var_2._id_9661;

    var_34 = 0;

    if ( isdefined( var_2.pers["summary"]["xp"] ) )
    {
        var_35 = var_2.pers["summary"]["xp"];
        var_34 = var_35 - var_2.pers["telemetry"]._id_934E.xp_at_spawn;
    }

    var_36 = var_2._id_0369 - var_2.pers["telemetry"]._id_934E.score_at_spawn;
    var_37 = -1;

    if ( scripts\mp\utility\game::_id_89F1() )
    {
        var_37 = game["roundsPlayed"];

        if ( var_4 == "MOD_GAME_ENDED" || var_4 == "MOD_ROUND_ENDED" )
        {
            var_37--;

            if ( var_37 < 0 )
                var_37 = 0;
        }
    }

    var_38 = 0;

    if ( isdefined( var_1 ) && isdefined( var_1._id_9FE8 ) )
        var_38 = istrue( var_1._id_9FE8["hipfire"] );

    var_39 = ( 0, 0, 0 );

    if ( isdefined( var_2._id_E34F ) )
        var_39 = var_2._id_E34F;

    var_40 = 0;

    if ( isdefined( var_2._id_10A20 ) )
        var_40 = var_2._id_10A20;

    var_41 = 0;

    if ( isdefined( var_2._id_E290 ) && isdefined( var_2._id_E290._id_E33F ) && isdefined( var_2._id_E290._id_E33F._id_565E ) )
        var_41 = var_2._id_E290._id_E33F._id_565E;

    var_2 _meth_870C( "dlog_event_mp_life", [ "attacker", var_15, "spawn_time_from_match_start_ms", var_8, "life_index", var_10, "spawn_evaluation_id", var_41, "spawn_pos_x", var_39[0], "spawn_pos_y", var_39[1], "spawn_pos_z", var_39[2], "team", var_2.team, "is_host", var_2 ishost(), "was_tactical_insertion", var_40, "death_time_from_match_start_ms", var_9, "victim_weapon", var_26, "victim_weapon_attachments", var_25, "attacker_weapon", var_14, "attacker_weapon_attachments", var_5, "victim_death_modifiers", var_24, "attacker_death_modifiers", var_13, "death_pos_x", var_2.origin[0], "death_pos_y", var_2.origin[1], "death_pos_z", var_2.origin[2], "death_angle_x", var_2.angles[0], "death_angle_y", var_2.angles[1], "death_angle_z", var_2.angles[2], "attacker_pos_x", var_22[0], "attacker_pos_y", var_22[1], "attacker_pos_z", var_22[2], "attacker_angle_x", var_23[0], "attacker_angle_y", var_23[1], "attacker_angle_z", var_23[2], "means_of_death", var_4, "attacker_weapon_alt_mode", var_17, "attacker_weapon_picked_up", var_16, "victim_weapon_alt_mode", var_30, "victim_weapon_picked_up", var_29, "attacker_ads_value", var_18, "victim_ads_value", var_31, "attacker_was_in_victim_fov", var_19, "victim_was_in_attacker_fov", var_20, "attacker_mount_type", var_21, "victim_mount_type", var_32, "xp_earned", var_34, "score_earned", var_36, "victim_loadout_index", var_33, "attacker_life_index", var_11, "attacker_loadout_index", var_12, "victim_was_reloading", var_2 _meth_81DF(), "victim_was_executing", var_2 _meth_86C5(), "round", var_37, "is_hipfire", var_38 ] );
    var_2.pers["telemetry"]._id_934E.last_life_index_sent = var_10;
}

_id_AA4B( var_0 )
{
    on_player_match_end( var_0 );
    var_1 = -1;

    if ( isdefined( var_0.player.pers["telemetry"]._id_934E.last_life_index_sent ) )
        var_1 = var_0.player.pers["telemetry"]._id_934E.last_life_index_sent;

    var_2 = -1;

    if ( isdefined( var_0.player.pers["telemetry"]._id_934E.life_index ) )
        var_2 = var_0.player.pers["telemetry"]._id_934E.life_index;

    if ( var_1 != var_2 )
    {
        var_3 = spawnstruct();
        var_3._id_103C0 = var_0.player;
        var_3.attacker = undefined;
        var_3._id_10D84 = "none";
        var_3._id_9CBF = "";

        if ( isdefined( var_0.disconnectreason ) )
        {
            if ( var_0.disconnectreason == "EXE/SERVERCOMMANDOVERFLOW" )
                var_3._id_9CBF = "MOD_DISCONNECTED";
            else if ( var_0.disconnectreason == "EXE/DISCONNECTED" )
                var_3._id_9CBF = "MOD_QUIT";
        }

        on_player_death( var_3 );
    }
}
