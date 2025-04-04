// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    if ( getdvarint( "#x36bcbc6b33c0182b", 0 ) == 0 )
        return;

    level._id_5611 = spawnstruct();
    level._id_5611._id_EF9D = [];
    level._id_5611.telemetry_on_interval_time = getdvarint( "g_esports_interval_dlog_time", 5 );
    _id_06B9::_id_1000( "callback_server_start", ::send_server_start_telemetry );
    _id_06B9::_id_1000( "callback_match_start", ::_id_AA44 );
    _id_06B9::_id_1000( "callback_match_end", ::send_match_end_telemetry );
    _id_06B9::_id_1000( "callback_round_start", ::_id_AA4E );
    _id_06B9::_id_1000( "callback_round_end", ::send_round_end_telemetry );
    _id_06B9::_id_1000( "callback_objective_state_changed", ::send_objective_state_changed_telemetry );
    _id_06B9::_id_1000( "callback_on_player_connect", ::_id_AA4A );
    _id_06B9::_id_1000( "callback_on_player_disconnect", ::_id_AA4B );
    _id_06B9::_id_1000( "callback_on_player_spawned", ::send_player_spawned_telemetry );
    _id_06B9::_id_1000( "callback_player_death", ::on_player_death );
    _id_06B9::_id_1000( "callback_player_match_end", ::send_player_match_end_telemetry );
    _id_06B9::_id_1000( "callback_player_round_end", ::send_player_round_end_telemetry );
    _id_06B9::_id_1000( "callback_player_round_start", ::on_player_round_start );
    _id_06B9::_id_1000( "callback_player_loadout_changed", ::send_player_loadout_changed_telemetry );

    switch ( level.gametype )
    {
        case "koth":
            level.esports_add_objective_state_changed_data = ::add_objective_state_changed_koth_data;
            break;
        case "sd":
            level.esports_add_objective_state_changed_data = ::add_objective_state_changed_sd_data;
            break;
        case "control":
            level.esports_add_match_interval_data = ::add_match_interval_control_data;
            level.esports_add_objective_info_data = ::add_objective_info_control_data;
            level.esports_add_objective_state_changed_data = ::add_objective_state_changed_control_data;
            break;
    }
}

start_on_interval()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_5611.telemetry_on_interval_time;

    for (;;)
    {
        send_match_interval_telemetry();
        send_players_interval_telemetry();
        wait( var_0 );
    }
}

vector_to_array( var_0 )
{
    return [ var_0[0], var_0[1], var_0[2] ];
}

_id_6469( var_0 )
{
    if ( !isdefined( level._id_5611._id_EF9D[var_0] ) )
        level._id_5611._id_EF9D[var_0] = var_0;

    return level._id_5611._id_EF9D[var_0];
}

_id_6847( var_0 )
{
    if ( var_0 == "none" )
        return "draw";

    return _id_6469( var_0 );
}

_id_6566()
{
    return _id_07C5::_id_6DC6( gettime() );
}

_id_66F3( var_0 )
{
    var_1 = game["end_reason"];
    var_2 = getarraykeys( var_1 );

    foreach ( var_4 in var_2 )
    {
        var_5 = var_1[var_4];

        if ( var_5 == var_0 )
            return var_4;
    }

    return "unknown";
}

_id_66F6( var_0 )
{
    var_1 = spawnstruct();

    if ( var_0 == game["attackers"] )
    {
        var_1._id_DD0F = "attack";
        var_1._id_10E20 = var_0;
        var_1._id_988C = game["defenders"];
    }
    else if ( var_0 == game["defenders"] )
    {
        var_1._id_DD0F = "defense";
        var_1._id_10E20 = var_0;
        var_1._id_988C = game["attackers"];
    }
    else
    {
        var_1._id_DD0F = "none";
        var_1._id_10E20 = "none";
        var_1._id_988C = "none";
    }

    return var_1;
}

_id_67A5()
{
    var_0 = spawnstruct();

    if ( scripts\mp\utility\game::_id_89F1() )
    {
        if ( game["attackers"] == "allies" )
        {
            var_0._id_EF3B = "attack";
            var_0._id_EF3C = "defense";
        }
        else
        {
            var_0._id_EF3B = "defense";
            var_0._id_EF3C = "attack";
        }
    }
    else
    {
        var_0._id_EF3B = "none";
        var_0._id_EF3C = "none";
    }

    return var_0;
}

get_number_of_rounds( var_0 )
{
    var_1 = 1;

    if ( !scripts\mp\utility\game::_id_89F1() )
        return var_1;

    var_1 = game["roundsPlayed"];

    if ( isdefined( var_0 ) && ( var_0 == "MOD_GAME_ENDED" || var_0 == "MOD_ROUND_ENDED" ) )
    {
        var_1--;

        if ( var_1 < 1 )
            var_1 = 1;
    }

    return var_1;
}

get_objective_timer()
{
    var_0 = level._id_110E2;

    if ( isdefined( level._id_461E ) )
        var_0 = level._id_461E;

    if ( isdefined( var_0 ) )
    {
        var_1 = gettime();
        return scripts\engine\utility::ter_op( var_1 < var_0, var_0 - var_1, 0 );
    }

    return 0;
}

get_objective_name_koth()
{
    var_0 = level._id_110CD._id_A8CE;
    return "point" + var_0;
}

get_objective_name_sd()
{
    var_0 = self._id_A8CE;

    if ( isdefined( var_0 ) && ( var_0 == "_a" || var_0 == "_b" ) )
        return "point" + var_0;

    return "bomb";
}

get_objective_name_control()
{

}

get_objective_info( var_0 )
{
    var_1 = [ "obj_name", "point" + var_0._id_A8CE, "origin", vector_to_array( var_0._id_411F ) ];
    return var_1;
}

is_interacting_objective()
{
    var_0 = istrue( self._id_8769 );
    var_1 = isdefined( self._id_F395 ) && self._id_F395.size > 0;
    return var_0 || var_1;
}

initialize_player_pers_data()
{
    if ( !isdefined( self.pers["total_time_alive"] ) )
        _id_0A7B::_id_823D( "total_time_alive" );

    if ( !isdefined( self.pers["shotsHitHead"] ) )
        _id_0A7B::_id_823D( "shotsHitHead" );

    if ( !isdefined( self.pers["totalMultikills"] ) )
        _id_0A7B::_id_823D( "totalMultikills" );

    if ( !isdefined( self.pers["highestMultikill"] ) )
        _id_0A7B::_id_823D( "highestMultikill" );
}

initialize_player_koth_pers_data()
{
    if ( !isdefined( self.pers["obj1Time"] ) )
        _id_0A7B::_id_823D( "obj1Time" );

    if ( !isdefined( self.pers["obj2Time"] ) )
        _id_0A7B::_id_823D( "obj2Time" );

    if ( !isdefined( self.pers["obj3Time"] ) )
        _id_0A7B::_id_823D( "obj3Time" );

    if ( !isdefined( self.pers["obj4Time"] ) )
        _id_0A7B::_id_823D( "obj4Time" );

    if ( !isdefined( self.pers["obj5Time"] ) )
        _id_0A7B::_id_823D( "obj5Time" );
}

initialize_player_sd_pers_data()
{

}

initialize_player_control_pers_data()
{

}

initialize_player_round_data()
{
    var_0 = spawnstruct();
    var_1 = self.pers;
    var_2 = _id_0796::getlocalcodcasterclientstat( 0 );
    var_3 = _id_0796::getlocalcodcasterclientstat( 1 );
    var_0._id_024B = var_1["kills"];
    var_0._id_0146 = var_1["deaths"];
    var_0._id_006A = var_1["assists"];
    var_0.damage_dealt = var_1["damage"];
    var_0.highest_streak = 0;
    var_0.time_alive = var_1["total_time_alive"];
    var_0._id_0369 = var_1["score"];
    var_0._id_DA5E = var_2;
    var_0._id_DA60 = var_3;
    var_0.shots_head = var_1["shotsHitHead"];
    self.round_start_data = var_0;
}

initialize_player_koth_round_data( var_0, var_1 )
{
    var_0.objtime = var_1["objTime"];
    var_0.obj1time = var_1["obj1Time"];
    var_0.obj2time = var_1["obj2Time"];
    var_0.obj3time = var_1["obj3Time"];
    var_0.obj4time = var_1["obj4Time"];
    var_0.obj5time = var_1["obj5Time"];
}

initialize_player_sd_round_data( var_0, var_1 )
{
    var_0.bombs_planted = var_1["plants"];
    var_0.bombs_defused = var_1["defuses"];
}

initialize_player_control_round_data( var_0, var_1 )
{
    var_0.tiers_captured = 0;
}

update_player_death_data()
{
    var_0 = _id_6566();
    var_1 = var_0 - self._id_E390;
    _id_0A7B::_id_7D93( "total_time_alive", var_1 );
    var_2 = self.pers["cur_kill_streak"];
    var_3 = self.round_start_data;

    if ( var_3.highest_streak < var_2 )
        var_3.highest_streak = var_2;
}

get_player_movement_data()
{
    var_0 = self;
    var_1 = spawnstruct();
    var_2 = var_0._id_D022;

    if ( isdefined( var_2 ) && var_2["movementUpdateCount"] >= 30 )
    {
        var_1.time_spent_moving = int( var_2["movingTotal"] / ( var_2["movementUpdateCount"] / 5 ) );
        var_1.average_speed_during_match = float( var_2["distanceTotal"] / var_2["movementUpdateCount"] );
        return var_1;
    }

    var_1.time_spent_moving = 0;
    var_1.average_speed_during_match = 0.0;
    return var_1;
}

_id_AA44()
{
    send_match_start_telemetry();
}

_id_AA4E()
{
    level thread start_on_interval();
    send_round_start_telemetry();
}

_id_AA4A( var_0 )
{
    if ( var_0 _meth_81D2() )
        return;

    var_0.sent_telemetry = spawnstruct();
    var_0 initialize_player_pers_data();

    if ( scripts\engine\utility::_id_5BEC( "pre_game_over" ) && !isdefined( var_0.round_start_data ) )
        var_0 initialize_player_round_data();
}

on_player_round_start( var_0 )
{
    if ( var_0 _meth_81D2() )
        return;

    if ( !isdefined( var_0.sent_telemetry ) )
        var_0.sent_telemetry = spawnstruct();

    var_0 initialize_player_round_data();
}

on_player_death( var_0 )
{
    if ( !isdefined( var_0.attacker ) )
        return;

    var_0._id_103C0 update_player_death_data();
    send_player_death_telemetry( var_0 );
}

_id_AA4B( var_0 )
{
    var_1 = var_0.player;

    if ( var_1 _meth_81D2() || !scripts\engine\utility::_id_5BEC( "pre_game_over" ) )
        return;

    var_2 = var_1.sent_telemetry;

    if ( !istrue( var_2.round_end ) )
        send_player_round_end_telemetry( var_0 );

    if ( !istrue( var_2.match_end ) )
        send_player_match_end_telemetry( var_0 );

    send_player_disconnect_telemetry( var_0 );
}

send_server_start_telemetry()
{
    var_0 = [ "game_type", level.gametype, "map_name", level.mapname, "team1_name", _id_6469( "allies" ), "team2_name", _id_6469( "axis" ) ];
    _func_03BA( "dlog_event_esports_server_start", var_0 );
}

send_match_start_telemetry()
{
    var_0 = [ "game_type", level.gametype, "map_name", level.mapname, "team1_name", _id_6469( "allies" ), "team2_name", _id_6469( "axis" ) ];
    _func_03BA( "dlog_event_esports_match_start", var_0 );
}

send_match_end_telemetry( var_0 )
{
    var_1 = [ "match_time", _id_6566(), "rounds_played", game["roundsPlayed"], "team1_name", _id_6469( "allies" ), "team1_score", _func_00DB( "allies" ), "team2_name", _id_6469( "axis" ), "team2_score", _func_00DB( "axis" ), "win_team", _id_6847( var_0._id_10E51 ), "game_type", level.gametype, "map_name", level.mapname ];
    _func_03BA( "dlog_event_esports_match_end", var_1 );
}

add_match_interval_control_data( var_0 )
{
    var_0 = scripts\engine\utility::array_combine( var_0, [ "point1_tiers_captured", 0, "point2_tiers_captured", 0 ] );
    return var_0;
}

send_match_interval_telemetry()
{
    var_0 = [ "game_timer", int( scripts\mp\gamelogic::_id_6DCA() / 1000 ), "objective_timer", int( get_objective_timer() / 1000 ), "team1_score", _func_00DB( "allies" ), "team2_score", _func_00DB( "axis" ) ];

    if ( isdefined( level.esports_add_match_interval_data ) )
    {

    }

    _func_03BA( "dlog_event_esports_match_interval_info", var_0 );
}

send_round_start_telemetry()
{
    var_0 = _id_67A5();
    var_1 = [ "team1_side", var_0._id_EF3B, "team2_side", var_0._id_EF3C ];
    _func_03BA( "dlog_event_esports_round_start", var_1 );
}

send_round_end_telemetry( var_0 )
{
    var_1 = _id_66F6( var_0._id_10E51 );
    var_2 = [ "result", _id_66F3( var_0._id_529F ), "win_side", var_1._id_DD0F, "match_time", _id_6566(), "game_type", level.gametype, "map_name", level.mapname, "win_team", _id_6469( var_1._id_10E20 ), "loss_team", _id_6469( var_1._id_988C ) ];
    _func_03BA( "dlog_event_esports_round_end", var_2 );
}

add_objective_info_control_data( var_0 )
{
    var_1 = [ "team1_lives", 0, "team2_lives", 0 ];
    var_0 = scripts\engine\utility::array_combine( var_0, [ "control_info", var_1 ] );
    return var_0;
}

send_objective_info_telemetry()
{
    var_0 = [];
    var_1 = level._id_A8D5;
    var_2 = 1;

    foreach ( var_4 in var_1 )
    {
        var_5 = "objective" + var_2 + "_info";
        var_0 = scripts\engine\utility::array_add( var_0, var_5 );
        var_0 = scripts\engine\utility::array_add( var_0, get_objective_info( var_4 ) );
        var_2++;
    }

    if ( isdefined( level.esports_add_objective_info_data ) )
    {

    }

    _func_03BA( "dlog_event_esports_objective_info", var_0 );
}

add_objective_state_changed_koth_data( var_0, var_1 )
{
    var_2 = var_1.obj_team;
    var_0 = scripts\engine\utility::array_combine( var_0, [ "obj_name", get_objective_name_koth(), "is_captured", var_2 != "none", "is_contested", self._id_E578 ] );
    return var_0;
}

add_objective_state_changed_sd_data( var_0, var_1 )
{
    var_2 = var_1.credit_player;
    var_0 = scripts\engine\utility::array_combine( var_0, [ "obj_name", get_objective_name_sd(), "is_bomb_picked_up", scripts\engine\utility::ter_op( isdefined( var_2 ), var_2._id_8769, 0 ), "is_bomb_planted", level._id_263D, "is_bomb_defused", level._id_260F ] );
    return var_0;
}

add_objective_state_changed_control_data( var_0, var_1 )
{
    var_2 = var_1.obj_team;
    var_0 = scripts\engine\utility::array_combine( var_0, [ "obj_name", get_objective_name_control(), "is_captured", var_2 != "none", "is_contested", 0, "team1_remaining_lives", 0, "team2_remaining_lives", 0, "point1_tiers_captured", 0, "point2_tiers_captured", 0 ] );
    return var_0;
}

send_objective_state_changed_telemetry( var_0 )
{
    if ( !isdefined( self._id_A8F5 ) )
        return;

    var_1 = var_0.credit_player;
    var_2 = var_0.objective_entity;
    var_3 = scripts\engine\utility::ter_op( isdefined( var_1 ), var_1.name, "none" );
    var_4 = scripts\engine\utility::ter_op( isdefined( var_1 ), _id_6469( var_1._id_0393 ), "none" );
    var_5 = [ "player_name", var_3, "obj_pos", vector_to_array( self._id_411F ), "obj_team", var_4, "match_time", _id_6566() ];

    if ( isdefined( level.esports_add_objective_state_changed_data ) )
    {
        var_6 = spawnstruct();
        var_6.credit_player = var_1;
        var_6.obj_team = var_4;
    }

    _func_03BA( "dlog_event_esports_objective_state_changed", var_5 );
}

send_player_disconnect_telemetry( var_0 )
{
    var_1 = var_0.player;
    var_2 = [ "player_name", var_1.name ];
    var_1 _meth_870C( "dlog_event_esports_player_disconnect", var_2 );
}

send_player_spawned_telemetry( var_0 )
{
    var_1 = var_0.origin;
    var_2 = var_0 getplayerangles();
    var_3 = [ "player_name", var_0.name, "player_team", _id_6469( var_0._id_0393 ), "match_time", _id_6566(), "origin", vector_to_array( var_1 ), "viewangles", vector_to_array( var_2 ) ];
    var_0 _meth_870C( "dlog_event_esports_player_spawned", var_3 );
}

send_player_death_telemetry( var_0 )
{
    var_1 = var_0._id_103C0;
    var_2 = scripts\engine\utility::ter_op( isdefined( var_1._id_9FE8 ), var_1._id_9FE8, [] );
    var_3 = var_1._id_8FA4;
    var_4 = var_1._id_8FA1;
    var_5 = var_1._id_90B7;
    var_6 = var_0.attacker;

    if ( isplayer( var_6 ) )
    {
        var_7 = var_6.origin;
        var_8 = var_6 getplayerangles();
        var_9 = var_0.objweapon;
        var_10 = scripts\engine\utility::ter_op( isdefined( var_6._id_9FE8 ), var_6._id_9FE8, [] );
        var_11 = [ "name", var_6.name, "team", _id_6469( var_6._id_0393 ), "origin", vector_to_array( var_7 ), "viewangles", vector_to_array( var_8 ), "weapon", var_9.basename, "weapon_attachments", scripts\mp\utility\weapon::_id_6E4C( var_9 ) ];
        var_12 = [ "is_ads", var_6 scripts\mp\utility\player::_id_896F(), "is_flashed", istrue( var_6._id_5C76 ), "is_interacting_objective", var_6 is_interacting_objective() ];
        var_13 = [ "is_longshot_kill", istrue( var_10["longshot"] ), "is_first_blood", istrue( var_10["firstblood"] ), "is_revenge_kill", istrue( var_10["revenge"] ) ];
        var_14 = distance( var_7, var_3 );
    }
    else
    {
        var_11 = [];
        var_12 = [];
        var_13 = [];
        var_14 = 0.0;
    }

    var_15 = [ "name", var_1.name, "team", _id_6469( var_1._id_0393 ), "origin", vector_to_array( var_3 ), "viewangles", vector_to_array( var_4 ), "weapon", var_5.basename, "weapon_attachments", scripts\mp\utility\weapon::_id_6E4C( var_5 ) ];
    var_16 = [ "is_ads", var_1 scripts\mp\utility\player::_id_896F(), "is_flashed", istrue( var_1._id_5C76 ), "is_interacting_objective", var_1 is_interacting_objective() ];
    var_17 = [ "match_time", _id_6566(), "means_of_death", var_0._id_9CBF, "players_distance", var_14 ];
    var_18 = [ "info", var_17, "attacker", var_11, "attacker_status", var_12, "victim", var_15, "victim_status", var_16, "kill_context", var_13 ];
    var_1 _meth_870C( "dlog_event_esports_player_killed", var_18 );
}

send_player_match_end_telemetry( var_0 )
{
    var_1 = var_0.player;

    if ( var_1 _meth_81D2() )
        return;

    var_2 = get_player_movement_data();
    var_3 = var_1.pers;
    var_4 = var_1 _id_0796::getlocalcodcasterclientstat( 0 );
    var_5 = var_1 _id_0796::getlocalcodcasterclientstat( 1 );
    var_6 = [ "total_score", var_3["score"], "total_assists", var_3["assists"], "total_kills", var_3["kills"], "highest_streak", var_3["longestStreak"], "total_deaths", var_3["deaths"], "total_headshots", var_3["headshots"], "total_time_alive", scripts\engine\utility::ter_op( var_3["total_time_alive"] == 0, _id_6566(), var_3["total_time_alive"] ), "total_damage_dealt", var_3["damage"], "total_distance_traveled", scripts\engine\utility::ter_op( isdefined( var_3["totalDistTraveled"] ), float( var_3["totalDistTraveled"] ), 0.0 ), "average_speed_during_match", var_2.average_speed_during_match, "time_spent_moving", var_2.time_spent_moving, "total_suicides", var_3["suicides"], "total_shots_fired", var_4, "total_shots_hit", var_5, "total_shots_head", var_3["shotsHitHead"], "total_multikills", var_3["totalMultikills"], "highest_multikill", var_3["highestMultikill"], "rounds_played", var_1 get_number_of_rounds( var_0._id_9CBF ), "player_name", var_1.name, "game_type", level.gametype ];
    var_1 _meth_870C( "dlog_event_esports_player_match_end", var_6 );
    var_1.sent_telemetry.match_end = 1;
}

send_players_interval_telemetry()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( !isdefined( var_2 ) || var_2 _meth_81D2() )
            continue;

        var_3 = var_2.pers;
        var_4 = var_2 _id_0796::getlocalcodcasterclientstat( 0 );
        var_5 = var_2 _id_0796::getlocalcodcasterclientstat( 1 );
        var_6 = [ "player_name", var_2.name, "origin", vector_to_array( var_2.origin ), "damage_dealt", var_3["damage"], "assists", var_3["assists"], "deaths", var_3["deaths"], "kills", var_3["kills"], "current_killstreak", var_3["cur_kill_streak"], "highest_killstreak", var_3["longestStreak"], "multikills", var_3["totalMultikills"], "highest_multikill", var_3["highestMultikill"], "score", var_3["score"], "shots_fired", var_4, "shots_hit", var_5, "shots_head", var_3["shotsHitHead"], "objective_time", var_3["objTime"], "packet_loss", 0, "latency", 0, "ping", 0 ];
        var_7 = spawnstruct();
        var_7.player = var_2;
        var_7._id_5669 = var_6;
        var_0 = scripts\engine\utility::array_add( var_0, var_7 );
    }

    foreach ( var_7 in var_0 )
    {
        var_2 = var_7.player;

        if ( !isdefined( var_2 ) )
            continue;

        var_2 _meth_870C( "dlog_event_esports_player_interval_info", var_7._id_5669 );
        waitframe();
    }
}

send_player_round_end_telemetry( var_0 )
{
    var_1 = var_0.player;

    if ( var_1 _meth_81D2() )
        return;

    var_2 = var_1.pers;
    var_3 = var_1.round_start_data;
    var_4 = var_1 _id_0796::getlocalcodcasterclientstat( 0 );
    var_5 = var_1 _id_0796::getlocalcodcasterclientstat( 1 );
    var_6 = var_3.highest_streak;
    var_7 = var_2["cur_kill_streak"];
    var_8 = [ "kills", var_2["kills"] - var_3._id_024B, "assists", var_2["assists"] - var_3._id_006A, "deaths", var_2["deaths"] - var_3._id_0146, "damage_dealt", var_2["damage"] - var_3.damage_dealt, "highest_streak", scripts\engine\utility::ter_op( var_6 < var_7, var_7, var_6 ), "time_alive", var_2["total_time_alive"] - var_3.time_alive, "rounds_played", var_1 get_number_of_rounds(), "rounds_won", scripts\mp\utility\game::getrankxp( var_1._id_0393 ), "score", var_2["score"] - var_3._id_0369, "shots_fired", var_4 - var_3._id_DA5E, "shots_hit", var_5 - var_3._id_DA60, "shots_head", var_2["shotsHitHead"] - var_3.shots_head, "player_name", var_1.name, "game_type", level.gametype ];
    var_1 _meth_870C( "dlog_event_esports_player_round_end", var_8 );
    var_1.sent_telemetry.round_end = 1;
}

send_player_loadout_changed_telemetry( var_0 )
{
    var_1 = var_0.player;

    if ( var_1 _meth_81D2() )
        return;

    var_2 = var_0._id_EA67;
    var_3 = var_0._id_702D;
    var_4 = [ var_2._id_9662, var_2._id_9663, var_2._id_9664 ];
    var_5 = [ var_3._id_965D, var_3._id_965E ];
    var_6 = [ "none" ];

    if ( isdefined( var_2._id_966E ) && var_2._id_966E.size > 0 )
        var_6 = var_2._id_966E;

    var_7 = [ "none" ];

    if ( isdefined( var_2._id_967D ) && var_2._id_967D.size > 0 )
        var_7 = var_2._id_967D;

    var_8 = [ "player_name", var_1.name, "primary_weapon", var_2._id_966C, "primary_weapon_attachments", var_6, "secondary_weapon", var_2._id_967B, "secondary_weapon_attachments", var_7, "primary_grenade", var_2._id_9653, "secondary_grenade", var_2._id_9654, "field_upgrades", var_5, "streaks", var_4, "perks", scripts\engine\utility::array_combine( var_2._id_9668, var_2._id_9659 ), "match_time", _id_6566() ];
    var_1 _meth_870C( "dlog_event_esports_player_loadout_changed", var_8 );
}
