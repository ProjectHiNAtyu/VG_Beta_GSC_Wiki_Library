// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "nuke", ::_id_F793 );
    scripts\mp\killstreaks\killstreaks::_id_C25C( "nuke_select_location", ::_id_F793 );
    level._effect["nuke_rolling_death"] = loadfx( "vfx/iw8_mp/killstreak/vfx_nuke_player_death_2.vfx" );
    level._id_A6E5 = scripts\cp_mp\utility\game_utility::_id_6AFA( "nuke_expl_pos" );
}

_id_F792()
{
    var_0 = scripts\cp_mp\utility\killstreak_utility::_id_4034( "nuke", self );
    return _id_F793( var_0 );
}

_id_F793( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
        {
            var_0 notify( "killstreak_finished_with_deploy_weapon" );
            return 0;
        }
    }

    if ( var_0._id_EA0F == "nuke_select_location" )
        var_1 = 1;
    else
        var_1 = 0;

    var_0._id_A732 = var_1;
    var_2 = undefined;
    var_3 = undefined;

    if ( !isdefined( level._id_A724 ) )
    {
        level._id_A724 = 1;
        level._id_A72A = self;
    }
    else
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "hud", "showErrorMessage" ) )
            self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/NUKE_ALREADY_INBOUND" );

        return 0;
    }

    if ( var_1 == 1 )
    {
        var_4 = _id_0990::_id_EA00( var_0, makeweapon( "s4_binoculars_mp", [ "spotterscope" ] ), "weapon_fired", ::_id_10D92, ::_id_10DDF, ::_id_10D80 );
        var_2 = _id_0982::_id_139B( self );
        var_3 = 25;
        var_5 = scripts\mp\utility\game::_id_6BC3( var_0.owner.team );
        level thread _id_A712( var_5[0] );
    }
    else if ( !istrue( level._id_9DC5 ) )
        var_4 = _id_0990::_id_E9FE( var_0, makeweapon( "s4_ks_gesture_generic_mp" ) );
    else
        var_4 = 1;

    if ( !istrue( var_4 ) || level._id_609B )
    {
        level._id_A724 = undefined;
        level._id_A72A = undefined;
        var_0 notify( "killstreak_finished_with_deploy_weapon" );
        return 0;
    }

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
        {
            level._id_A724 = undefined;
            level._id_A72A = undefined;
            var_0 notify( "killstreak_finished_with_deploy_weapon" );
            return 0;
        }
    }

    thread _id_A703( var_0, 0, undefined, undefined, var_2, undefined, var_3 );

    if ( var_1 != 1 && !istrue( level._id_9DC5 ) )
        scripts\common\utility::_id_F737( level._id_9B9D, "nuke", self.origin );

    if ( !istrue( level._id_9DC5 ) )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "sound", "playKillstreakDeployDialog" ) )
            [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "sound", "playKillstreakDeployDialog" ) ]]( self, var_0._id_EA0F );
    }

    return 1;
}

_id_10D92( var_0 )
{
    return 1;
}

_id_10DDF( var_0, var_1 )
{
    if ( istrue( var_1 ) )
        thread _id_0982::_id_13AE( var_0, "splash_icon_nuke" );
}

_id_10D80( var_0, var_1, var_2 )
{
    var_3 = _id_0982::_id_139B( self );

    if ( !isdefined( var_3 ) )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "hud", "showErrorMessage" ) )
            self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/INVALID_POINT" );

        return "continue";
    }

    return "success";
}

_id_A6E1( var_0, var_1, var_2, var_3 )
{
    level endon( "nuke_cancelled" );

    if ( isdefined( var_0 ) )
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );

    level thread [[ var_1 ]]( var_2, var_3 );
}

_id_A703( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "nuke_cancelled" );
    level notify( "used_nuke" );
    self notify( "used_nuke" );
    var_0 notify( "killstreak_finished_with_deploy_weapon", 1 );
    level._id_A725 = spawnstruct();
    level._id_A725.player = self;
    level._id_A725.team = self.pers["team"];
    level._id_A735 = "aftermath_post";
    level._id_313B = 0;
    level._id_A722 = undefined;
    level._id_A71E = undefined;
    level._id_A717 = undefined;
    var_8 = 0;
    var_9 = self.origin + ( 0, 0, 30000 ) + anglestoforward( self.angles ) * 30000;
    var_10 = self.origin + anglestoforward( self.angles ) * 15000;

    if ( isdefined( level._id_A6E5 ) )
    {
        var_10 = level._id_A6E5.origin;
        var_11 = vectornormalize( ( var_10[0], var_10[1], 0 ) - ( self.origin[0], self.origin[1], 0 ) );
        var_9 = var_10 + var_11 * 15000;
        var_9 = var_9 + ( 0, 0, 30000 ) + var_11 * 5000;
    }
    else if ( var_0._id_EA0F != "nuke_select_location" )
    {

    }

    var_12 = 6;
    var_13 = 10;
    var_14 = 1;

    if ( istrue( var_1 ) )
    {
        var_8 = var_1;

        if ( istrue( var_8 ) )
            level._id_313B = 1;
    }

    if ( isdefined( var_3 ) )
        var_9 = var_3;

    if ( isdefined( var_4 ) )
        var_10 = var_4;

    if ( istrue( var_5 ) )
        var_12 = var_5;

    if ( istrue( var_6 ) )
        var_13 = var_6;

    if ( istrue( var_2 ) )
        var_14 = var_2;

    if ( !isdefined( level._id_A6DB ) )
    {
        level._id_A6DB = spawn( "script_origin", var_9 + ( 0, 0, 100 ) );
        level._id_A6DB dontinterpolate();
        level._id_A6DB hide();
    }
    else
        level._id_A6DB.origin = var_9 + ( 0, 0, 100 );

    level._id_A6ED = spawn( "script_model", var_10 + ( 0, 0, 5000 ) );
    level._id_A6ED setmodel( "tag_origin" );
    level._id_A6ED.team = self.team;
    level._id_A6ED.owner = self;
    level._id_A6ED.streakinfo = var_0;

    if ( istrue( level._id_9DC5 ) )
        var_12 = 0.7;

    level thread _id_A706( self, var_0, var_14, var_9, var_10, var_12, var_13, var_7 );
    var_0._id_A723 = var_10;
    var_15 = var_12 + var_13;

    if ( isdefined( var_0._id_A732 ) && var_0._id_A732 == 1 )
        level thread _id_A6E1( var_15, ::_id_A6DC, self, var_0 );

    level thread _id_A6E1( var_15, ::_id_A702, self, var_0 );
    level thread _id_A6E1( var_15, ::_id_A6E6, self, var_0 );
    level thread _id_A6E1( var_15, ::_id_A6E4, self, var_0 );
    level thread _id_A6E1( var_15 + 0.075, ::_id_A711, self, var_0 );
    level thread _id_A6E1( var_15 + 5, ::_id_A6DE, self, var_0 );

    if ( isdefined( level._id_8DBA ) )
        level thread [[ level._id_8DBA ]]( var_0 );

    scripts\mp\rank::_id_111B( 2, level._id_A725.team, "nuke" );

    if ( level._id_313B && var_8 )
        level thread _id_A713( level._id_A725.player );
}

_id_A713( var_0 )
{
    if ( !isdefined( level._id_A70D ) )
    {
        _func_0421( "nuke" );
        level._id_A70D = 1;
    }

    level endon( "game_ended" );
    var_0 waittill( "disconnect" );
    level._id_A717 = 1;
    level._id_A724 = undefined;
    level._id_A72A = undefined;
    _id_A6DA();
    _func_01EB( 1, 1, 0 );
    level notify( "nuke_cancelled" );
}

_id_A70C( var_0 )
{
    level endon( "nuke_cancelled" );

    if ( istrue( level._id_9DC5 ) )
        setomnvar( "ui_nuke_timer_type", 2 );
    else
        setomnvar( "ui_nuke_timer_type", 0 );

    setomnvar( "ui_nuke_countdown_active", 1 );
    level thread _id_A70F( var_0 );
    var_1 = var_0;
    var_2 = 0;
    var_3 = 0;
    thread _id_0823::v2_timer_start( level._id_A6DB );

    while ( var_1 > 0 )
    {
        if ( var_1 <= 10 )
        {
            thread _id_0823::v2_timer_tick( level._id_A6DB );

            if ( isdefined( level._id_A6F5 ) && !istrue( var_2 ) )
            {
                level thread _id_A708();
                var_2 = 1;
            }
        }

        if ( var_1 <= 4.9 )
        {
            if ( isdefined( level._id_A6F5 ) && !istrue( var_3 ) )
                var_3 = 1;
        }

        wait 1.0;
        var_1--;
    }
}

_id_A708()
{
    level._id_A6F5 endon( "death" );
    level endon( "game_ended" );
    thread _id_0823::v2_incoming( level._id_A6F5 );
}

_id_A6DA()
{
    setomnvar( "ui_nuke_countdown_active", -1 );
}

_id_A706( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level thread _id_A70B( var_5, var_1, var_0 );
    thread _id_0823::_id_1397();

    if ( var_0 _meth_8683() )
        var_0 setclientomnvar( "nVidiaHighlights_events", 16 );

    if ( var_1._id_EA0F != "nuke_select_location" )
    {
        var_8 = "scr_" + scripts\mp\utility\game::getgametype() + "_timelimit";
        level._id_10AD2[var_8]._id_04A3 = 0;
        level._id_AD57[var_8] = 0;
        level._id_5836 = 0;
        level._id_4D81 = 1;

        foreach ( var_10 in level.players )
        {
            if ( isdefined( var_10 ) )
            {
                var_10 notify( "abort_killcam" );
                var_10._id_3137 = 1;
            }
        }

        level thread _id_A6D3();
        level._id_4AC6 = 1;
    }

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_5 );
    level thread _id_A6F0( var_0, var_1, var_3, var_4, var_6, var_7 );
}

_id_A70B( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_3 = 0;

    if ( isdefined( var_1 ) && isdefined( var_2 ) )
        var_2 thread scripts\cp_mp\utility\killstreak_utility::_id_B85C( "use_" + var_1._id_EA0F, 1, 1 );

    while ( var_0 > 0 )
    {
        if ( isdefined( level._id_A6DB ) && !istrue( var_3 ) )
            var_3 = 1;

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 2 );
        var_0 = var_0 - 2;
    }
}

_id_A6F0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "game_ended" );
    var_6 = var_4;
    level thread _id_A70C( var_6 );

    if ( isdefined( var_0 ) )
        level thread scripts\mp\hud_util::_id_EF8A( "used_nuke", var_0 );

    var_7 = "s4_v2_mp";

    if ( isdefined( var_5 ) )
        var_7 = var_5;

    var_8 = ( 0, 0, -1 * getdvarint( "#x3f7e9b59e29bb9d7e", 800 ) );
    var_9 = ( var_3 - 0.5 * var_8 * _func_0214( var_4 ) - var_2 ) / var_4;
    level._id_A6F5 = magicgrenademanual( var_7, var_2, var_9, var_4 );
    level._id_A6F5 setscriptablepartstate( "launch", "on", 0 );
}

_id_A6EA( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_4 = physics_createcontents( [ "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot" ] );
    var_5 = -2000;
    var_6 = 2000;
    var_7 = ( 0, 0, -1 * getdvarint( "#x3f7e9b59e29bb9d7e", 800 ) );

    for (;;)
    {
        var_8 = var_0;
        var_9 = var_8 + ( 0, 0, 5000 );

        if ( scripts\engine\trace::ray_trace_passed( var_8, var_9, undefined, var_4 ) )
        {
            var_10 = ( var_1 - 0.5 * var_7 * _func_0214( var_2 ) - var_8 ) / var_2;
            var_3._id_E06C = var_8;
            var_3._id_01E7 = var_1;
            var_3._id_829B = var_10;
            break;
        }

        var_8 = var_8 + anglestoright( self.angles ) * randomintrange( var_5, var_6 );
        var_5 = int( var_5 * 1.3 );
        var_6 = int( var_6 * 1.3 );
        waitframe();
    }

    return var_3;
}

_id_A6E6( var_0, var_1 )
{
    level endon( "nuke_cancelled" );
    _id_A6DA();
    level._id_A71E = 1;
    level notify( "nuke_detonated" );
    level._id_A6E7 = level._id_A6F5.origin;
    level._id_A6F5 setscriptablepartstate( "launch", "off", 0 );
    level._id_A6F5 delete();
    var_2 = spawn( "script_model", level._id_A6E7 );
    var_2 setmodel( "ks_nuke_mp" );
    var_2 setscriptablepartstate( "explode", "on", 0 );
    var_2 thread _id_0A78::_id_46A6( 50 );
    thread _id_0823::v2_explosion( level._id_A6E7 );

    if ( var_1._id_EA0F != "nuke_select_location" )
    {
        foreach ( var_4 in level.characters )
        {
            if ( _id_A6D7( var_4, _id_A6D8() ) )
            {
                if ( isplayer( var_4 ) )
                {
                    var_4 _meth_867D( "mp_killstreak_nuke" );

                    if ( scripts\mp\utility\player::isreallyalive( var_4 ) )
                        var_4 thread _id_A709();
                }
            }
        }
    }
    else
    {
        foreach ( var_4 in level.characters )
        {
            if ( isplayer( var_4 ) && scripts\mp\utility\player::isreallyalive( var_4 ) )
            {
                var_4 thread _id_A70A();
                var_4 _meth_867D( "mp_killstreak_nuke" );
            }
        }
    }
}

_id_A705( var_0 )
{

}

_id_A702( var_0, var_1 )
{
    if ( var_1._id_EA0F == "nuke_select_location" )
        return;

    level endon( "nuke_cancelled" );
    level waittill( "nuke_death" );
    _func_01EB( 1, 0.25, 0.1 );
}

_id_D607()
{

}

_id_A6E3( var_0, var_1 )
{
    level endon( "nuke_cancelled" );

    foreach ( var_3 in level.players )
        var_3 thread _id_A6D5();
}

_id_A6D5()
{
    self endon( "disconnect" );
    self _meth_865E( 2.0, 1500 );
}

_id_A711( var_0, var_1 )
{
    level endon( "nuke_cancelled" );
    level._id_A734 = 1;
    visionsetnaked( "nuke_global_flash", 0.05 );
    setdvar( "r_materialBloomHQScriptMasterEnable", 0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    level notify( "nuke_aftermath_post_started" );
    level thread _id_A6E8( 1, 2 );
    level waittill( "nuke_death" );
    level thread _id_A710();
    level _id_A6FF( 5 );
}

_id_A6E8( var_0, var_1 )
{
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    visionsetnaked( "", var_1 );
}

_id_A6DE( var_0, var_1 )
{
    level endon( "nuke_cancelled" );
    level endon( "game_ended" );
    level notify( "nuke_death" );
    var_2 = level._id_A725.player;

    if ( level.teambased )
        var_2 = level._id_A6ED.team;

    scripts\mp\hostmigration::_id_10956();
    var_3 = _id_A6D8();

    if ( isdefined( level._id_A725.player ) )
    {
        if ( var_1._id_EA0F != "nuke_select_location" )
        {
            foreach ( var_5 in level.characters )
            {
                if ( _id_A6D7( var_5, var_3 ) )
                {
                    if ( isplayer( var_5 ) )
                    {
                        var_5._id_A71B = 1;

                        if ( scripts\mp\utility\player::isreallyalive( var_5 ) && !istrue( var_5._id_CAC2 ) )
                        {
                            var_6 = level._id_A725.player;

                            if ( level.teambased && var_5.team == var_6.team )
                                var_6 = var_5;

                            var_7 = makeweapon( "s4_v2_mp" );
                            var_5 dodamage( 999999, level._id_A6ED.origin, var_6, level._id_A6ED, "MOD_EXPLOSIVE", var_7, "none" );
                        }
                    }
                }
            }

            if ( istrue( var_3 ) )
                _id_A6E2();
            else if ( !istrue( level._id_2575 ) )
            {
                var_9 = scripts\mp\utility\teams::_id_69E2( level._id_A6ED.team );

                foreach ( var_11 in var_9 )
                    _id_A6E2( var_11 );
            }

            _id_0A77::_id_BD07( "killstreak ended - nuke", level._id_A725.player );
        }
        else
        {
            foreach ( var_5 in level.characters )
            {
                if ( _id_A6EF( var_5, level._id_A6E7, 25000000 ) )
                {
                    if ( isplayer( var_5 ) )
                    {
                        var_5._id_A71B = 1;

                        if ( scripts\mp\utility\player::isreallyalive( var_5 ) )
                        {
                            var_7 = makeweapon( "s4_v2_mp" );
                            _id_079A::_id_1066( var_5, level._id_A725.player, undefined, var_7, 0, undefined, undefined, undefined, undefined, undefined );
                            var_14 = vectornormalize( var_5.origin + ( 0, 0, 1000 ) - level._id_A6ED.origin );
                            var_5 thread _id_079A::_id_5AFC( level._id_A6ED, level._id_A725.player, 999999, 0, "MOD_EXPLOSIVE", var_7, var_5.origin, var_14, "none", 0, 0, undefined, undefined );
                        }
                    }
                }
            }
        }

        if ( !istrue( level._id_9DC5 ) )
        {
            if ( isdefined( level._id_A725.player ) && isdefined( var_1 ) )
                level._id_A725.player scripts\cp_mp\utility\killstreak_utility::_id_C13C( var_1 );
        }
    }

    if ( istrue( var_3 ) )
    {
        level._id_A722 = 1;
        level thread _id_A6E0( 3, var_2 );
    }
}

_id_A6E0( var_0, var_1 )
{
    level endon( "game_ended" );
    level thread _id_A6F7( 1 );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_0 );

    if ( scripts\mp\utility\game::_id_8743() )
        level thread scripts\mp\gametypes\arena_evo_tourney::_id_1AA3( var_1 );
    else
    {
        if ( istrue( level._id_9DC5 ) )
        {
            level thread scripts\mp\gamelogic::_id_52D7( var_1, game["end_reason"]["mercy_win"], game["end_reason"]["mercy_loss"], 1, 1 );
            return;
        }

        level thread scripts\mp\gamelogic::_id_52D7( var_1, game["end_reason"]["nuke_end"], undefined, 1 );
    }
}

_id_A6F7( var_0 )
{
    level endon( "game_ended" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_0 );
    level notify( "play_nuke_bnk" );
    _func_01E5( "post_game_state", 13 );
}

_id_A6D7( var_0, var_1 )
{
    if ( istrue( level._id_2575 ) )
        return 0;

    if ( !isdefined( level._id_A725 ) )
        return 0;

    if ( istrue( var_1 ) )
        return 1;

    if ( level.teambased )
    {
        if ( isdefined( level._id_A725.team ) && var_0.team == level._id_A725.team )
            return 0;
    }
    else
    {
        var_2 = isdefined( level._id_A725.player ) && var_0 == level._id_A725.player;
        var_3 = isdefined( level._id_A725.player ) && isdefined( var_0.owner ) && var_0.owner == level._id_A725.player;

        if ( var_2 || var_3 )
            return 0;
    }

    return 1;
}

_id_A6E4( var_0, var_1 )
{
    level endon( "nuke_cancelled" );

    if ( !isdefined( level._id_9A95 ) )
        var_2 = var_1._id_A723;
    else
        var_2 = level._id_9A95;

    earthquake( 0.4, 2, var_2, 100000 );
    level thread _id_A6F9( var_1 );
    level waittill( "nuke_death" );

    if ( var_1._id_EA0F == "nuke_select_location" )
        earthquake( 0.3, 1, var_2, 100000 );
    else
        earthquake( 1.3, 3, var_2, 100000 );

    foreach ( var_4 in level.players )
    {
        var_4 _meth_83F3( "tank_rumble" );
        var_4 playrumbleonentity( "damage_heavy" );
    }
}

_id_A6F9( var_0 )
{
    level endon( "nuke_cancelled" );
    level endon( "nuke_death" );
    var_1 = 0.01;

    if ( !isdefined( level._id_9A95 ) )
        var_2 = var_0._id_A723;
    else
        var_2 = level._id_9A95;

    foreach ( var_4 in level.players )
        var_4 _meth_8277( "tank_rumble" );

    for (;;)
    {
        earthquake( var_1, 0.05, var_2, 100000 );
        wait 0.05;
        var_1 = var_1 + 0.002;

        if ( var_1 >= 0.6 )
            var_1 = 0.6;
    }
}

_id_AB65()
{
    if ( isdefined( level._id_A71E ) )
        thread _id_A700( 0, 0 );
}

_id_A700( var_0, var_1 )
{
    if ( isdefined( var_0 ) && var_0 > 0 )
        wait( var_0 );

    self visionsetmissilecamforplayer( "nuke_global_aftermath", var_1 );
}

_id_A70F( var_0 )
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "nuke_cancelled" );
    level endon( "nuke_death" );
    var_1 = var_0 * 1000 + gettime();
    setomnvar( "ui_nuke_end_milliseconds", var_1 );
    level waittill( "host_migration_begin" );
    var_2 = scripts\mp\hostmigration::_id_10956();

    if ( var_2 > 0 )
        setomnvar( "ui_nuke_end_milliseconds", var_1 + var_2 );
}

_id_A710()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        level _id_A6FF( 0 );
    }
}

_id_A6FF( var_0 )
{
    if ( isdefined( level._id_A71D ) )
        level thread [[ level._id_A71D ]]();

    _id_A701();
}

_id_A701()
{
    _func_01E5( "post_game_state", 12 );

    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            continue;

        level thread scripts\cp_mp\utility\game_utility::_id_58A7( var_1, 1 );
        var_1 setclientomnvar( "ui_world_fade", 1 );
        var_1 _meth_82FC( "nuke_killstreak", 2, "ambient", "ambient_events" );
    }

    level thread _id_A6FD();
}

_id_A6FD()
{
    level endon( "game_ended" );
    level waittill( "play_nuke_bnk" );

    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            continue;

        level thread scripts\cp_mp\utility\game_utility::_id_58A7( var_1, 0, 1 );
    }
}

_id_A6E2( var_0 )
{
    var_1 = "s4_v2_mp";
    var_2 = level._id_0F23;
    var_3 = [[ level._id_6866 ]]();
    var_4 = undefined;

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_4 = scripts\engine\utility::_id_1B75( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        var_4 = var_2;
    else if ( isdefined( var_3 ) )
        var_4 = var_3;

    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_4 )
        {
            if ( isdefined( var_6 ) )
                var_6 _id_0A6F::_id_4C35( 10000, level._id_A725.player, level._id_A725.player, var_0, var_6.origin, "MOD_EXPLOSIVE", var_1 );
        }
    }
}

_id_A709()
{
    self endon( "disconnect" );

    if ( !istrue( self._id_CAC2 ) )
        scripts\mp\weapons::_id_521B( 1, "nuke_active" );

    thread _id_A6F8( 3.25 );
    level waittill( "nuke_death" );

    if ( isdefined( self._id_2D5A ) && self._id_2D5A > 0 )
        scripts\mp\weapons::_id_4A63( 1, "nuke_active" );

    var_0 = 0;

    if ( var_0 )
        return;
}

_id_A70A()
{
    self endon( "disconnect" );
    scripts\mp\weapons::_id_521B( 1, "nuke_active" );
    thread _id_A6F8( 3.25 );
    level waittill( "nuke_death" );
    scripts\mp\weapons::_id_4A63( 1, "nuke_active" );
}

_id_A6F8( var_0 )
{
    self endon( "disconnect" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );

    if ( !scripts\mp\utility\player::_id_8AB5() )
        self visionsetmissilecamforplayer( "nuke_deathblur", 4 );

    var_1 = self.origin;
    var_2 = level._id_A6E7;
    var_3 = var_1;
    var_4 = "nuke_rolling_death";
    playfx( scripts\engine\utility::getfx( var_4 ), var_1, var_2 - var_3, undefined, self );
}

_id_A6D6()
{
    self endon( "disconnect" );
    var_0[0][0]["org"] = self gettagorigin( "j_spineupper" );
    var_0[0][0]["angles"] = self gettagangles( "j_spineupper" );
    var_0[0][1]["org"] = self gettagorigin( "j_spinelower" );
    var_0[0][1]["angles"] = self gettagangles( "j_spinelower" );
    var_0[0][2]["org"] = self gettagorigin( "j_head" );
    var_0[0][2]["angles"] = self gettagangles( "j_head" );
    var_0[1][0]["org"] = self gettagorigin( "j_knee_ri" );
    var_0[1][0]["angles"] = self gettagangles( "j_knee_ri" );
    var_0[1][1]["org"] = self gettagorigin( "j_knee_le" );
    var_0[1][1]["angles"] = self gettagangles( "j_knee_le" );
    var_0[1][2]["org"] = self gettagorigin( "j_elbow_ri" );
    var_0[1][2]["angles"] = self gettagangles( "j_elbow_ri" );
    var_0[1][3]["org"] = self gettagorigin( "j_elbow_le" );
    var_0[1][3]["angles"] = self gettagangles( "j_elbow_le" );
    var_0[2][0]["org"] = self gettagorigin( "j_ankle_le" );
    var_0[2][0]["angles"] = self gettagangles( "j_ankle_le" );
    var_0[2][1]["org"] = self gettagorigin( "j_ankle_ri" );
    var_0[2][1]["angles"] = self gettagangles( "j_ankle_ri" );
    var_0[2][2]["org"] = self gettagorigin( "j_wrist_le" );
    var_0[2][2]["angles"] = self gettagangles( "j_wrist_le" );
    var_0[2][3]["org"] = self gettagorigin( "j_wrist_ri" );
    var_0[2][3]["angles"] = self gettagangles( "j_wrist_ri" );
    self._id_25A4 hide();
    var_1 = self._id_25A4.origin;
    var_2 = level._id_A6ED.origin * ( 1, 1, 0 );
    var_3 = var_1 * ( 1, 1, 0 );
    var_4 = "nuke_atomize_body";
    playfx( scripts\engine\utility::getfx( var_4 ), var_1, var_2 - var_3 );
}

_id_A6D8()
{
    var_0 = 1;

    if ( scripts\mp\utility\game::getgametype() == "br" )
        var_0 = 0;

    return var_0;
}

_id_A6DC( var_0, var_1 )
{
    if ( 0 )
    {
        wait 10;
        playfx( scripts\engine\utility::getfx( "vfx_nuke_zone_5000_static_s" ), ( 0, 0, 0 ) );
        _id_A6FC( ( 0, 0, 0 ) );

        if ( !isdefined( level._id_A71C ) )
            level._id_A71C = [];

        level._id_A71C[level._id_A71C.size] = _id_07EE::_id_110C( var_1._id_A723 - ( 0, 0, 1000 ), 5000, 15000, "axis", 4000 );
        level._id_A71C[level._id_A71C.size] = _id_07EE::_id_110C( var_1._id_A723 - ( 0, 0, 1000 ), 5000, 15000, "allies", 4000 );
    }
    else
    {
        var_1._id_CF97 = ( var_1._id_A723[0], var_1._id_A723[1], _id_076E::_id_6920() );
        playfx( scripts\engine\utility::getfx( "vfx_nuke_zone_5000_static_s" ), var_1._id_CF97 );
        _id_A6FC( var_1._id_CF97 );

        if ( !isdefined( level._id_A71C ) )
            level._id_A71C = [];

        level._id_A71C[level._id_A71C.size] = _id_07EE::_id_110C( var_1._id_A723 - ( 0, 0, 1000 ), 5000, 15000, "axis", 4000 );
        level._id_A71C[level._id_A71C.size] = _id_07EE::_id_110C( var_1._id_A723 - ( 0, 0, 1000 ), 5000, 15000, "allies", 4000 );
    }

    thread _id_A6E9( var_0 );
}

_id_A6FC( var_0 )
{
    if ( !isdefined( level._id_BF38 ) )
    {
        level._id_BF38 = [];
        level thread _id_A6FB();
    }

    level._id_BF38[level._id_BF38.size] = var_0;
}

_id_A6FE( var_0 )
{
    level._id_BF38 = scripts\engine\utility::array_remove( level._id_BF38, var_0 );
}

_id_A6FB()
{
    level endon( "game_ended" );
    var_0 = 10;

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            var_2.inlaststand = 0;

            foreach ( var_4 in level._id_BF38 )
            {
                if ( _id_A6EF( var_2, var_4, 25000000 ) )
                {
                    if ( istrue( var_2._id_61B5 ) )
                        var_2 _id_0769::_id_BD57( var_0 );
                    else
                    {
                        var_2 thread _id_0A77::_id_F8CD( "MP/NUKE_RADIATION_HURT", 2 );
                        var_2 dodamage( var_0, var_2.origin, var_2, undefined, "MOD_TRIGGER_HURT" );
                    }

                    var_2.inlaststand = 1;
                    break;
                }
            }

            if ( var_2.inlaststand )
                continue;

            foreach ( var_4 in level._id_BF38 )
            {
                if ( _id_A6EF( var_2, var_4, 36000000 ) )
                {
                    var_2 thread _id_0A77::_id_F8CD( "MP/NUKE_RADIATION_WARNING", 2 );
                    break;
                }
            }
        }

        wait 1;
    }
}

_id_A712( var_0 )
{
    level endon( "nuke_death" );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
                var_2 thread _id_0A77::_id_F8CD( "MP/NUKE_SELECT_LAUNCH_DETECTED", 2 );
        }

        wait 1;
    }
}

_id_A6EF( var_0, var_1, var_2 )
{
    var_3 = distance2dsquared( var_1, var_0.origin );
    return var_3 < var_2;
}

_id_A6E9( var_0 )
{
    wait 20;

    if ( istrue( var_0._id_7571 ) )
        var_0._id_7571 = 0;

    if ( isdefined( var_0._id_8D56 ) )
        var_0._id_8D56 = 0;

    visionsetnaked( "", 1 );
}

_id_A6D3()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( isdefined( var_0 ) )
        {
            var_0 notify( "abort_killcam" );
            var_0._id_3137 = 1;
        }
    }
}
