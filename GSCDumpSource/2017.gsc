// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_CBFA = [];
    var_0 = getdvarint( "#x353793778be0a49fc", 1 );

    if ( var_0 > 4 || var_0 < 0 )
        _func_0064( 0 );

    _id_108A( var_0, "online_mp_xpscale" );
    var_1 = getdvarint( "#x397b3e9b42eeb6cef", 1 );

    if ( var_1 > 4 || var_1 < 0 )
        _func_0064( 0 );

    _id_1088( var_1, "online_battle_xpscale_dvar" );
    var_2 = getdvarint( "online_operator_xpscale", 1 );

    if ( var_2 > 4 || var_2 < 0 )
        _func_0064( 0 );

    _id_1089( var_2, "online_operator_xpscale" );
    var_3 = getdvarint( "online_clan_xpscale", 1 );

    if ( var_3 > 4 || var_3 < 0 )
        _func_0064( 0 );

    addglobalclanxpmultiplier( var_3, "online_clan_xpscale" );
    level._id_C01B = [];
    level._id_10DC1 = [];
    level._id_9C85 = int( _func_021D( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level._id_9C51 = int( _func_021D( "mp/rankTable.csv", 0, "maxelder", 1 ) );

    for ( var_4 = 0; var_4 <= level._id_9C85; var_4++ )
    {
        level._id_C01B[var_4][0] = int( _func_021D( "mp/rankTable.csv", 0, var_4, 2 ) );
        level._id_C01B[var_4][1] = int( _func_021D( "mp/rankTable.csv", 0, var_4, 3 ) );
        level._id_C01B[var_4][2] = int( _func_021D( "mp/rankTable.csv", 0, var_4, 7 ) );
        level._id_C01B[var_4][3] = _func_021D( "mp/rankTable.csv", 0, var_4, 15 );
    }

    _id_07FD::init();
    _id_0A7A::_id_C27F( ::_id_AB65 );
    level._id_BBF0 = [];
    level thread _id_AB46();
}

_id_89DB( var_0 )
{
    if ( isdefined( level._id_CBFA[var_0] ) )
        return 1;
    else
        return 0;
}

_id_C29E( var_0, var_1, var_2 )
{
    level._id_CBFA[var_0][var_1] = var_2;

    if ( var_0 == "kill" && var_1 == "value" )
        setomnvar( "ui_game_type_kill_value", int( var_2 ) );
}

_id_6CEE( var_0 )
{
    var_1 = "scr_" + scripts\mp\utility\game::getgametype() + "_score_" + var_0;

    if ( getdvar( var_1 ) != "" )
        return getdvarint( var_1 );
    else
        return level._id_CBFA[var_0]["value"];
}

_id_6CED( var_0, var_1 )
{
    if ( !isdefined( level._id_CBFA[var_0] ) )
        return;

    if ( istrue( level._id_C4CD ) )
        return;

    switch ( var_1 )
    {
        case "value":
            var_2 = "scr_" + scripts\mp\utility\game::getgametype() + "_score_" + var_0;

            if ( getdvar( var_2 ) != "" )
                return getdvarint( var_2 );
            else
                return level._id_CBFA[var_0]["value"];
        default:
            return level._id_CBFA[var_0][var_1];
    }
}

_id_6CBE( var_0 )
{
    return level._id_C01B[var_0][0];
}

_id_6CBF( var_0 )
{
    return level._id_C01B[var_0][1];
}

_id_6CBD( var_0 )
{
    return level._id_C01B[var_0][2];
}

_id_6CBA( var_0 )
{
    return _func_0221( "mp/rankTable.csv", 0, var_0, 16 );
}

_id_6CBB( var_0, var_1 )
{
    return _func_021D( "mp/rankIconTable.csv", 0, var_0, var_1 + 1 );
}

_id_6CBC( var_0 )
{
    return int( _func_021D( "mp/rankTable.csv", 0, var_0, 13 ) );
}

_id_40FA( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_B63B = var_0 getplayerdata( "rankedloadouts", "squadMembers", "player_xp" );
    return var_1;
}

_id_40FC( var_0, var_1, var_2 )
{
    var_3 = var_1 - var_0;

    if ( var_3 != 0 )
    {
        var_2._id_10FD3 = var_2._id_10FD3 + var_3;
        var_2._id_010E++;
    }
}

_id_40FB( var_0, var_1 )
{
    var_2 = var_1._id_B63B - var_0._id_B63B;
    var_3 = spawnstruct();
    var_3._id_10FD3 = 0;
    var_3._id_010E = 0;

    if ( var_2 != 0 || var_3._id_10FD3 != 0 )
        self _meth_870C( "dlog_event_player_stats_hack", [ "player_xp_start", var_0._id_B63B, "player_xp_end", var_1._id_B63B, "diff_weapon_xp_count", var_3._id_010E, "diff_weapon_xp", var_3._id_10FD3 ] );
}

_id_AB46()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) )
            var_0._id_40FE = _id_40FA( var_0 );

        if ( !isai( var_0 ) )
        {
            if ( level._id_B811 )
            {
                var_0.pers["rankxp"] = var_0 getplayerdata( "rankedloadouts", "squadMembers", "player_xp" );
                var_1 = var_0 getplayerdata( "rankedloadouts", "squadMembers", "season_rank" );

                if ( !isdefined( var_0.pers["xpEarnedThisMatch"] ) )
                    var_0.pers["xpEarnedThisMatch"] = 0;

                var_0 thread handlexpovertime();
            }
            else
            {
                var_1 = 0;
                var_0.pers["rankxp"] = 0;
            }
        }
        else
        {
            var_1 = 0;
            var_0.pers["rankxp"] = 0;
        }

        var_0.pers["prestige"] = var_1;

        if ( var_0.pers["rankxp"] < 0 )
            var_0.pers["rankxp"] = 0;

        var_2 = var_0 _id_6CB8( var_0 _id_6CC0() );
        var_0.pers["rank"] = var_2;
        var_0 setpulsefx( var_2, var_1 );
        var_0.pers["participation"] = 0;
        var_0._id_CC18 = 0;
        var_0._id_CC07 = 0;
        var_0._id_CBF4 = [];
        var_0._id_BA3E = 0;
        var_0 _meth_82F4( "ui_promotion", 0 );

        if ( !isdefined( var_0.pers["summary"] ) )
        {
            var_0.pers["summary"] = [];
            var_0.pers["summary"]["xp"] = 0;
            var_0.pers["summary"]["score"] = 0;
            var_0.pers["summary"]["challenge"] = 0;
            var_0.pers["summary"]["match"] = 0;
            var_0.pers["summary"]["misc"] = 0;
            var_0.pers["summary"]["medal"] = 0;
            var_0.pers["summary"]["bonusXP"] = 0;
            var_0.pers["summary"]["accolade"] = 0;
            var_0.pers["summary"]["weaponXP"] = 0;
            var_0.pers["summary"]["operatorXP"] = 0;
            var_0.pers["summary"]["clanXP"] = 0;
            var_0.pers["summary"]["battlepassXP"] = 0;
        }

        var_0 _meth_82F4( "ui_opensummary", 0 );

        if ( level._id_B811 && !isai( var_0 ) )
        {
            var_3 = getdvarint( "#x3b7a6efd49629fa8f" );
            var_4 = var_0 _meth_860D() > 1;

            if ( var_4 )
                var_0 _id_10F3( var_3, "online_mp_party_xpscale" );

            if ( var_0 getplayerdata( "mp", "prestigeDoubleWeaponXp" ) )
                var_0.pressed = 1;
            else
                var_0.pressed = 0;
        }

        var_0._id_CBED = 0;
        var_0._id_CBF0 = 0;
        var_0 setclientomnvar( "ui_score_event_control", -1 );
        var_0 setclientomnvar( "ui_potg_score_event_control", -1 );
    }
}

handlexpovertime()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = gettime();
    var_1 = var_0;
    var_2 = var_0 + 60000;
    var_3 = 2750 * _id_68E6();
    var_3 = int( var_3 );
    var_4 = 0;

    while ( var_4 < 30 )
    {
        var_1 = gettime();

        if ( var_1 >= var_2 )
        {
            self _meth_863F( "144115188075856006", [ 5, var_3 ] );
            var_2 = var_2 + 60000;
            var_4++;
        }

        wait 1;
    }
}

_id_AB65()
{
    if ( isai( self ) )
        self.pers["rankxp"] = _id_09D1::_id_66CD();
    else if ( !level._id_B811 )
        self.pers["rankxp"] = 0;
    else
    {

    }

    _id_B7F7();
}

_id_B7F7()
{
    var_0 = self.pers["rankxp"];

    if ( var_0 < 0 )
    {
        var_0 = 0;
        self.pers["rankxp"] = 0;
    }

    var_1 = _id_6CB8( var_0 );
    self.pers["rank"] = var_1;

    if ( isai( self ) || !isdefined( self.pers["prestige"] ) )
    {
        if ( level._id_B811 && isdefined( self._id_2C7B ) )
            var_2 = _id_6C6A();
        else
            var_2 = 0;

        self setpulsefx( var_1, var_2 );
        self.pers["prestige"] = var_2;
    }
}

_id_F753()
{
    if ( issubstr( self.class, "custom" ) )
    {
        if ( !level._id_B811 )
            self.pers["rankxp"] = 0;
        else if ( isai( self ) )
            self.pers["rankxp"] = 0;
        else
        {

        }
    }
}

_id_6FC0( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );

    if ( isdefined( self.owner ) && !isbot( self ) )
    {
        self.owner _id_6FC0( var_0, var_1, var_2 );
        return;
    }

    if ( isai( self ) || !isplayer( self ) )
        return;

    var_5 = _func_03CA( self );
    var_1 = int( var_1 * var_5 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !level._id_B811 )
    {
        if ( var_3 == 0 )
            _id_0A76::_id_4B5D( var_1, var_0 );

        return;
    }

    if ( !isdefined( var_1 ) || var_1 == 0 )
        return;

    if ( !isdefined( level._id_5E9A ) || !level._id_5E9A )
    {
        if ( level.teambased )
        {
            var_6 = 0;

            foreach ( var_8 in level._id_EF86 )
            {
                if ( scripts\mp\utility\teams::_id_6DAC( var_8, "teamCount" ) )
                {
                    var_6++;

                    if ( var_6 >= 2 )
                        break;
                }
            }

            if ( var_6 < 2 )
                return;
        }
        else
        {
            var_10 = 0;

            foreach ( var_8 in level._id_EF86 )
            {
                var_10 = var_10 + scripts\mp\utility\teams::_id_6DAC( var_8, "teamCount" );

                if ( var_10 >= 2 )
                    break;
            }

            if ( var_10 < 2 )
                return;
        }
    }

    if ( !var_3 )
        _id_0A76::_id_4B5D( var_1, var_0 );

    thread _id_107D4( var_0, var_1, var_2, var_4 );
}

_id_107D4( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !var_3 )
    {
        waitframe();
        _id_0A78::_id_1096A();
    }

    var_4 = _id_6CC0();

    if ( _id_FD0A( var_4 ) )
    {

    }

    _id_EC43();
    _id_7D96( var_1, var_2, var_0 );
}

_id_C144( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_1 / _id_6CC2();
    var_7 = var_1 - var_6;
    var_7 = int( var_7 );
    self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + var_7;
    self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_1;
    self.pers["summary"]["weaponXP"] = self.pers["summary"]["weaponXP"] + var_2;
    self.pers["summary"]["operatorXP"] = self.pers["summary"]["operatorXP"] + var_4;
    self.pers["summary"]["clanXP"] = self.pers["summary"]["clanXP"] + var_5;
    self.pers["summary"]["battlepassXP"] = self.pers["summary"]["battlepassXP"] + var_3;
    var_8 = _id_6CED( var_0, "group" );

    if ( !isdefined( var_8 ) || var_8 == "" )
    {
        if ( var_0 == "WeaponMatchBonus" )
            return;

        self.pers["summary"]["misc"] = self.pers["summary"]["misc"] + var_1;
        return;
    }

    switch ( var_8 )
    {
        case "match_bonus":
            self.pers["summary"]["match"] = self.pers["summary"]["match"] + var_1;
            break;
        case "challenge":
            self.pers["summary"]["challenge"] = self.pers["summary"]["challenge"] + var_1;
            break;
        case "medal":
            if ( !isdefined( self.pers["combatXP"] ) )
                self.pers["combatXP"] = var_1;
            else
                self.pers["combatXP"] = self.pers["combatXP"] + var_1;

            self.pers["summary"]["medal"] = self.pers["summary"]["medal"] + var_1;
            break;
        case "combat":
            if ( !isdefined( self.pers["combatXP"] ) )
                self.pers["combatXP"] = var_1;
            else
                self.pers["combatXP"] = self.pers["combatXP"] + var_1;

            self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_1;
            break;
        case "looting":
            if ( !isdefined( self.pers["lootingXP"] ) )
                self.pers["lootingXP"] = var_1;
            else
                self.pers["lootingXP"] = self.pers["lootingXP"] + var_1;

            self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_1;
            break;
        case "missions":
            if ( !isdefined( self.pers["missionXP"] ) )
                self.pers["missionXP"] = var_1;
            else
                self.pers["missionXP"] = self.pers["missionXP"] + var_1;

            self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_1;
            break;
        case "accolade":
            self.pers["summary"]["accolade"] = self.pers["summary"]["accolade"] + var_1;
            break;
        default:
            self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_1;
            break;
    }
}

_id_FD0A( var_0 )
{
    var_1 = _id_6CB7();
    var_2 = _id_6C6A();
    var_3 = self.pers["rank"] + self.pers["prestige"];
    var_4 = var_1 + var_2;
    self.pers["rank"] = var_1;
    self.pers["prestige"] = var_2;

    if ( var_4 == var_3 || var_4 >= level._id_9C85 + level._id_9C51 )
        return 0;

    self setpulsefx( var_1, var_2 );
    return 1;
}

_id_FD0B()
{
    self endon( "disconnect" );
    self notify( "update_rank" );
    self endon( "update_rank" );
    var_0 = self.pers["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !_id_07A8::_id_933A( "game_over" ) )
        level scripts\engine\utility::_id_108F3( "game_over", 0.25 );

    var_1 = self.pers["rank"] + self.pers["prestige"];

    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];
        var_4 = var_3.pers["team"];

        if ( isdefined( var_4 ) && var_4 == var_0 )
            var_3 iprintln( &"RANK/PLAYER_WAS_PROMOTED", self, var_1 + 1 );
    }
}

_id_BECA( var_0 )
{
    self._id_CC07 = self._id_CC07 + var_0;
}

_id_5D07()
{
    _id_CC06( self._id_CC07 );
    self._id_CC07 = 0;
}

_id_5D08()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self notify( "flushScorePointsPopupQueueOnSpawn()" );
    self endon( "flushScorePointsPopupQueueOnSpawn()" );
    self waittill( "spawned_player" );
    wait 0.1;
    _id_5D07();
}

_id_CC06( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( var_0 == 0 )
        return;

    if ( !scripts\mp\utility\player::isreallyalive( self ) && !self _meth_81D2() && !scripts\mp\utility\player::_id_8AB5() )
    {
        if ( !istrue( var_1 ) || scripts\mp\utility\player::_id_88AD() )
        {
            _id_BECA( var_0 );
            thread _id_5D08();
            return;
        }
    }

    self notify( "scorePointsPopup" );
    self endon( "scorePointsPopup" );
    self._id_CC18 = self._id_CC18 + var_0;
    self setclientomnvar( "ui_points_popup", self._id_CC18 );
    self setclientomnvar( "ui_points_popup_notify", gettime() );
    wait 1.0;
    self._id_CC18 = 0;
}

_id_A699()
{
    waitframe();
    level notify( "update_player_score", self, self._id_CC18 );
}

_id_BEC9( var_0 )
{
    self._id_CBF4[self._id_CBF4.size] = var_0;
}

_id_5D05()
{
    var_0 = self._id_CBF4;
    self._id_CBF4 = [];

    foreach ( var_2 in var_0 )
        _id_CBF3( var_2 );
}

_id_5D06()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self notify( "flushScoreEventPopupQueueOnSpawn()" );
    self endon( "flushScoreEventPopupQueueOnSpawn()" );
    self waittill( "spawned_player" );
    wait 0.1;
    _id_5D05();
}

_id_6CEC( var_0 )
{
    if ( getdvarint( "scr_disableScoreSplash", 0 ) == 1 )
        return 0;

    var_1 = _id_6CED( var_0, "priority" );

    if ( !istrue( var_1 ) )
        return 0;

    return var_1;
}

_id_CBEC( var_0 )
{
    if ( getdvarint( "scr_disableScoreSplash", 0 ) == 1 )
        return 0;

    var_1 = _id_6CED( var_0, "alwaysShowSplash" );

    if ( !istrue( var_1 ) )
        return 0;

    return 1;
}

_id_CBEE( var_0 )
{
    if ( getdvarint( "scr_disableScoreSplash", 0 ) == 1 )
        return 0;

    var_1 = _id_6CED( var_0, "dialogAlias" );

    if ( !isdefined( var_1 ) )
        return "";

    return var_1;
}

_id_CBEF( var_0 )
{
    if ( getdvarint( "scr_disableScoreSplash", 0 ) == 1 )
        return 0;

    var_1 = _id_6CED( var_0, "eventID" );
    var_2 = _id_6CED( var_0, "text" );

    if ( !isdefined( var_1 ) || var_1 < 0 || !isdefined( var_2 ) || var_2 == "" )
        return 0;

    return 1;
}

_id_CBF3( var_0 )
{
    if ( getdvarint( "scr_disableScoreSplash", 0 ) == 1 )
        return;

    if ( isdefined( self.owner ) )
        self.owner _id_CBF3( var_0 );

    if ( !isplayer( self ) )
        return;

    var_1 = _id_6CED( var_0, "eventID" );
    var_2 = _id_6CED( var_0, "text" );

    if ( !isdefined( var_1 ) || var_1 < 0 || !isdefined( var_2 ) || var_2 == "" )
        return;

    if ( !scripts\mp\utility\player::isreallyalive( self ) && !self _meth_81D2() && !scripts\mp\utility\player::_id_8AB5() )
    {
        _id_BEC9( var_0 );
        thread _id_5D06();
        return;
    }

    if ( !isdefined( self._id_CBF1 ) )
    {
        self._id_CBF1 = 1;
        thread _id_3951();
    }
    else
    {
        self._id_CBF1++;

        if ( self._id_CBF1 > 5 )
        {
            self._id_CBF1 = 5;
            return;
        }
    }

    self setclientomnvar( "ui_potg_score_event_list_" + self._id_CBF0, var_1 );
    self setclientomnvar( "ui_score_event_list_" + self._id_CBF0, var_1 );
    self setclientomnvar( "ui_score_event_control", self._id_CBED % 10 );
    self setclientomnvar( "ui_potg_score_event_control", self._id_CBED % 10 );
    self._id_CBF0++;
    self._id_CBF0 = self._id_CBF0 % 5;
    self._id_CBED++;
}

_id_3951()
{
    self endon( "disconnect" );
    self notify( "clearScoreEventListAfterWait()" );
    self endon( "clearScoreEventListAfterWait()" );
    scripts\engine\utility::_id_108F3( "death", 0.5 );
    self._id_CBF1 = undefined;
}

_id_6CB7()
{
    var_0 = self.pers["rankxp"];
    var_1 = self.pers["rank"];

    if ( var_0 < _id_6CBE( var_1 ) + _id_6CBF( var_1 ) )
        return var_1;
    else
        return _id_6CB8( var_0 );
}

_id_6CB8( var_0 )
{
    var_1 = level._id_9C85;

    if ( var_0 >= _id_6CBE( var_1 ) )
        return var_1;
    else
        var_1--;

    while ( var_1 > 0 )
    {
        if ( var_0 >= _id_6CBE( var_1 ) && var_0 < _id_6CBE( var_1 ) + _id_6CBF( var_1 ) )
            return var_1;

        var_1--;
    }

    return var_1;
}

_id_6B11()
{
    var_0 = _id_6CB7() + 1;
    return ( 3 + var_0 * 0.5 ) * 10;
}

_id_6C6A()
{
    if ( isai( self ) && isdefined( self.pers["prestige_fake"] ) )
        return self.pers["prestige_fake"];
    else
        return self getplayerdata( "rankedloadouts", "squadMembers", "season_rank" );
}

_id_6CC0()
{
    return self.pers["rankxp"];
}

_id_7D96( var_0, var_1, var_2 )
{
    if ( !level._id_B811 )
        return;

    if ( isai( self ) )
        return;

    if ( !isdefined( level._id_9C41 ) )
        level._id_9C41 = getdvarint( "scr_beta_max_level", 0 );

    if ( level._id_9C41 > 0 && _id_6CB7() + 1 >= level._id_9C41 )
        var_0 = 0;

    var_3 = _id_6CED( var_2, "allowBonus" );

    if ( istrue( var_3 ) )
    {
        var_0 = var_0 * 1.38;
        var_0 = int( var_0 );
    }

    var_4 = "";
    var_5 = -1;
    var_6 = 0;

    if ( isdefined( var_1 ) && _id_07FD::_id_10DD0( var_1.basename ) )
    {
        var_4 = scripts\mp\utility\weapon::_id_69B9( var_1.basename );
        var_7 = _func_021D( "mp/statstable.csv", 5, var_4, 4 );
        var_8 = var_7 + "_variant_0";
        var_5 = int( _func_021D( "loot/weapon_ids.csv", 6, var_8, 0 ) );
        var_6 = var_0;

        if ( istrue( var_3 ) )
        {
            var_6 = var_6 * _id_07FD::_id_6E6A();
            var_6 = int( var_6 );
        }
    }

    if ( var_6 > 0 && var_5 == -1 )
    {

    }

    if ( isdefined( var_2 ) && var_2 == "WeaponMatchBonus" )
        var_0 = 0;

    var_9 = _id_6CC0();
    var_10 = int( min( var_9 + var_0, _id_6CBD( level._id_9C85 ) - 1 ) );

    if ( self.pers["rank"] == level._id_9C85 && var_10 >= _id_6CBD( level._id_9C85 ) )
        var_10 = _id_6CBD( level._id_9C85 );

    self.pers["xpEarnedThisMatch"] = self.pers["xpEarnedThisMatch"] + var_0;
    self.pers["rankxp"] = var_10;
    var_11 = var_0;

    if ( istrue( var_3 ) )
    {
        var_12 = _id_6CC2();
        var_11 = var_11 * var_12;
        var_11 = int( var_11 );
    }

    var_13 = var_0;

    if ( istrue( var_3 ) )
    {
        var_14 = _id_68E6();
        var_13 = var_13 * var_14;
        var_13 = int( var_13 );
    }

    var_15 = -1;
    var_16 = self._id_AC2A._id_AC2E;

    if ( isdefined( var_16 ) )
        var_15 = int( _func_021D( "loot/operator_ids.csv", 1, var_16, 0 ) );

    var_17 = var_0;

    if ( istrue( var_3 ) )
    {
        var_18 = _id_6BBC();
        var_17 = var_17 * var_18;
        var_17 = int( var_17 );
    }

    var_19 = var_0;

    if ( istrue( var_3 ) )
    {
        var_20 = getclanxpmultipliertotal();
        var_19 = var_19 * var_20;
        var_19 = int( var_19 );
    }

    var_21 = [];

    if ( var_11 > 0 )
    {
        var_21[var_21.size] = 0;
        var_21[var_21.size] = var_11;
    }

    if ( var_6 > 0 )
    {
        var_21[var_21.size] = 2;
        var_21[var_21.size] = var_6;
        var_21[var_21.size] = 1;
        var_21[var_21.size] = var_5;
    }

    if ( var_13 > 0 )
    {
        var_21[var_21.size] = 5;
        var_21[var_21.size] = var_13;
    }

    if ( var_17 > 0 )
    {
        var_21[var_21.size] = 4;
        var_21[var_21.size] = var_17;
        var_21[var_21.size] = 3;
        var_21[var_21.size] = var_15;
    }

    if ( var_19 > 0 )
    {
        var_21[var_21.size] = 6;
        var_21[var_21.size] = var_19;
    }

    if ( var_21.size == 0 )
        return;

    self _meth_863F( "144115188075856006", var_21 );
    _id_0780::_id_9779( self, var_0, var_4, var_6, var_2 );
    _id_C144( var_2, var_11, var_6, var_13, var_17, var_19 );
}

_id_EC43()
{
    var_0 = _id_6CC0();
    var_1 = self getplayerdata( "common", "mpProgression", "playerLevel", "xp" );

    if ( var_1 > var_0 )
        return;

    self _meth_8364( "common", "mpProgression", "playerLevel", "xp", var_0 );
}

_id_46B3( var_0, var_1, var_2 )
{
    wait( var_0 );
    thread _id_0A76::_id_6FE6( var_1 );
}

_id_6A49()
{
    if ( !isdefined( level._id_60DD ) )
    {
        var_0 = getdvarfloat( "scr_match_bonus_mode_override", 1.0 );

        if ( var_0 != 1.0 )
            level._id_60DD = var_0;
        else
            level._id_60DD = float( _func_021D( "mp/gametypesTable.csv", 0, scripts\mp\utility\game::getgametype(), 17 ) );
    }

    return level._id_60DD;
}

_id_108A( var_0, var_1 )
{
    level _id_10F3( var_0, var_1 );
}

_id_6A55()
{
    var_0 = level _id_6CC1();
    var_1 = getdvarint( "scr_disable_xp_scale_quit", 0 ) == 0;

    if ( ( var_0 > 4 || var_0 < 0 ) && var_1 )
        _func_0064( 0 );

    return var_0;
}

_id_10F3( var_0, var_1 )
{
    var_2 = 4 / level _id_6CC1();

    if ( var_0 > var_2 )
        return;

    if ( !isdefined( self._id_C01C ) )
        self._id_C01C = [];

    if ( isdefined( self._id_C01C[var_1] ) )
        self._id_C01C[var_1] = max( self._id_C01C[var_1], var_0 );
    else
        self._id_C01C[var_1] = var_0;
}

_id_6CC1()
{
    if ( !isdefined( self._id_C01C ) )
        return 1.0;

    var_0 = 1.0;

    foreach ( var_2 in self._id_C01C )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_0 = var_0 * var_2;
    }

    return var_0;
}

_id_6C20()
{
    if ( self _meth_8751() )
        return _func_0407();

    return 1.0;
}

_id_C4BA( var_0 )
{
    level _id_C504( var_0 );
}

_id_C504( var_0 )
{
    if ( !isdefined( self._id_C01C ) )
        return;

    if ( !isdefined( self._id_C01C[var_0] ) )
        return;

    self._id_C01C[var_0] = undefined;
}

_id_111B( var_0, var_1, var_2 )
{
    if ( !level.teambased )
        var_1 = "all";

    if ( !isdefined( self._id_EF97 ) )
        level._id_EF97 = [];

    if ( !isdefined( level._id_EF97[var_1] ) )
        level._id_EF97[var_1] = [];

    if ( isdefined( level._id_EF97[var_1][var_2] ) )
        level._id_EF97[var_1][var_2] = max( self._id_EF97[var_1][var_2], var_0 );
    else
        level._id_EF97[var_1][var_2] = var_0;
}

_id_C524( var_0, var_1 )
{
    if ( !level.teambased )
        var_0 = "all";

    if ( !isdefined( level._id_EF97 ) )
        return;

    if ( !isdefined( level._id_EF97[var_0] ) )
        return;

    if ( !isdefined( level._id_EF97[var_0][var_1] ) )
        return;

    level._id_EF97[var_0][var_1] = undefined;
}

_id_6DB9( var_0 )
{
    if ( !level.teambased )
        var_0 = "all";

    if ( !isdefined( var_0 ) || !isdefined( level._id_EF97 ) || !isdefined( level._id_EF97[var_0] ) )
        return 1.0;

    var_1 = 1.0;

    foreach ( var_3 in level._id_EF97[var_0] )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1 = var_1 * var_3;
    }

    return var_1;
}

getintensityxpmultiplier()
{
    var_0 = 1.0;

    switch ( scripts\mp\utility\game::_id_6C54() )
    {
        case "very_low":
            var_0 = 1.2;
            break;
        case "low":
            var_0 = 1.1;
            break;
        case "medium":
            var_0 = 1.0;
            break;
        case "high":
            var_0 = 0.9;
            break;
        case "very_high":
            var_0 = 0.8;
            break;
    }

    return var_0;
}

getmapxpmultiplier()
{
    var_0 = 1.0;

    switch ( scripts\cp_mp\utility\game_utility::_id_6B0E() )
    {
        default:
            var_0 = 1.0;
            break;
    }

    return var_0;
}

_id_6CC2()
{
    var_0 = _id_6CC1();
    var_1 = _id_6A55();
    var_2 = _id_6DB9( self.team );
    var_3 = _id_6C20();
    var_4 = _id_6A49();
    var_5 = getintensityxpmultiplier();
    var_6 = getmapxpmultiplier();
    var_7 = var_0 * var_1 * var_2 * var_3 * var_4 * var_5 * var_6;
    return var_7;
}

_id_1088( var_0, var_1 )
{
    level _id_106A( var_0, var_1 );
}

_id_6A50()
{
    var_0 = level _id_68E5();
    var_1 = getdvarint( "scr_disable_xp_scale_quit", 0 ) == 0;

    if ( ( var_0 > 4 || var_0 < 0 ) && var_1 )
        _func_0064( 0 );

    return var_0;
}

_id_106A( var_0, var_1 )
{
    var_2 = 4 / level _id_68E5();

    if ( var_0 > var_2 )
        return;

    if ( !isdefined( self._id_2359 ) )
        self._id_2359 = [];

    if ( isdefined( self._id_2359[var_1] ) )
        self._id_2359[var_1] = max( self._id_2359[var_1], var_0 );
    else
        self._id_2359[var_1] = var_0;
}

_id_68E5()
{
    if ( !isdefined( self._id_2359 ) )
        return 1.0;

    var_0 = 1.0;

    foreach ( var_2 in self._id_2359 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_0 = var_0 * var_2;
    }

    return var_0;
}

_id_68E6()
{
    var_0 = _id_68E5();
    var_1 = _id_6A50();
    var_2 = var_0 * var_1;
    return var_2;
}

_id_1089( var_0, var_1 )
{
    level _id_10DD( var_0, var_1 );
}

_id_6A54()
{
    var_0 = level _id_6BBB();
    var_1 = getdvarint( "scr_disable_xp_scale_quit", 0 ) == 0;

    if ( ( var_0 > 4 || var_0 < 0 ) && var_1 )
        _func_0064( 0 );

    return var_0;
}

_id_10DD( var_0, var_1 )
{
    var_2 = 4 / level _id_6BBB();

    if ( var_0 > var_2 )
        return;

    if ( !isdefined( self._id_AC2D ) )
        self._id_AC2D = [];

    if ( isdefined( self._id_AC2D[var_1] ) )
        self._id_AC2D[var_1] = max( self._id_AC2D[var_1], var_0 );
    else
        self._id_AC2D[var_1] = var_0;
}

_id_6BBC()
{
    var_0 = _id_6BBB();
    var_1 = _id_6A53();
    var_2 = _id_6C20();
    var_3 = _id_6A49();
    var_4 = getintensityxpmultiplier();
    var_5 = getmapxpmultiplier();
    var_6 = var_0 * var_1 * var_2 * var_3 * var_4 * var_5;
    return var_6;
}

_id_6BBB()
{
    if ( !isdefined( self._id_AC2D ) )
        return 1.0;

    var_0 = 1.0;

    foreach ( var_2 in self._id_AC2D )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_0 = var_0 * var_2;
    }

    return var_0;
}

_id_6A53()
{
    return level _id_6BBB();
}

addglobalclanxpmultiplier( var_0, var_1 )
{
    level addclanxpmultiplier( var_0, var_1 );
}

getglobalclanxpmultiplier()
{
    var_0 = level getclanxpmultiplier();
    var_1 = getdvarint( "scr_disable_xp_scale_quit", 0 ) == 0;

    if ( ( var_0 > 4 || var_0 < 0 ) && var_1 )
        _func_0064( 0 );

    return var_0;
}

addclanxpmultiplier( var_0, var_1 )
{
    var_2 = 4 / level getclanxpmultiplier();

    if ( var_0 > var_2 )
        return;

    if ( !isdefined( self.clanrankxpmultipliers ) )
        self.clanrankxpmultipliers = [];

    if ( isdefined( self.clanrankxpmultipliers[var_1] ) )
        self.clanrankxpmultipliers[var_1] = max( self.clanrankxpmultipliers[var_1], var_0 );
    else
        self.clanrankxpmultipliers[var_1] = var_0;
}

getclanxpmultipliertotal()
{
    var_0 = getclanxpmultiplier();
    var_1 = getglobalclanrankxpmultiplier();
    var_2 = _id_6C20();
    var_3 = _id_6A49();
    var_4 = getintensityxpmultiplier();
    var_5 = getmapxpmultiplier();
    var_6 = var_0 * var_1 * var_2 * var_3 * var_4 * var_5;
    return var_6;
}

getclanxpmultiplier()
{
    if ( !isdefined( self.clanrankxpmultipliers ) )
        return 1.0;

    var_0 = 1.0;

    foreach ( var_2 in self.clanrankxpmultipliers )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_0 = var_0 * var_2;
    }

    return var_0;
}

getglobalclanrankxpmultiplier()
{
    return level getclanxpmultiplier();
}
