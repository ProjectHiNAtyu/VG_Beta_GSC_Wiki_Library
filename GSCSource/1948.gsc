// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{

}

_id_107B( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 endon( "disconnect" );

    if ( !level.teambased )
        return;

    if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
        return;

    if ( level._id_74A8 )
        return;

    if ( scripts\cp_mp\utility\game_utility::_id_89D2() )
        return;

    if ( istrue( var_2 scripts\mp\gametypes\br_public::_id_8976() ) )
        return;

    var_5 = scripts\mp\utility\game::getgametype() == "br";
    var_6 = var_0 scripts\mp\utility\perk::_hasperk( "specialty_silentkill" );

    if ( !var_5 && var_6 )
        return;

    var_7 = var_1.origin;
    var_7 = var_7 + ( 0, 0, 40 );
    var_2 notify( "addDeathIcon()" );
    var_2 endon( "addDeathIcon()" );

    if ( isdefined( var_2._id_8FA2 ) )
    {
        _id_0766::_id_D586( var_2._id_8FA2 );
        var_2._id_8FA2 = undefined;
    }

    var_2 notify( "removed_death_icon" );
    var_8 = "v_ui_icon_hud_deathmarker_deathmarker01";
    var_9 = var_3;

    if ( var_5 )
    {
        var_8 = "hud_icon_death_player" + var_2._id_2A96;

        if ( var_6 )
            var_9 = [ var_2 ];
        else
            var_9 = scripts\mp\utility\teams::_id_6DAC( var_2.team, "players" );
    }

    var_10 = var_2.origin;
    var_11 = var_5;
    var_12 = var_5;
    var_2._id_8FA2 = var_2 _id_0766::_id_D58E( var_9, var_8, undefined, 1, 0, 0, undefined, undefined, var_11, var_10, var_12 );

    if ( isdefined( var_2._id_8FA2 ) )
    {
        if ( var_5 )
            var_2 thread _id_7484( var_6 );
        else
            var_2 thread _id_4842( var_4 );
    }
}

_id_7484( var_0 )
{
    self endon( "removed_death_icon" );
    var_1 = self.team;
    var_2 = self._id_8FA2;

    if ( !var_0 )
        _id_7432( var_2, var_1 );

    if ( isdefined( self ) )
        _id_745F();

    _id_0766::_id_D586( var_2 );

    if ( isdefined( self ) )
        self._id_8FA2 = undefined;
}

_id_7432( var_0, var_1 )
{
    var_2 = getdvarfloat( "death_icon_teammate_duration", 10.0 );
    wait( var_2 );
    var_3 = scripts\mp\utility\teams::_id_6A3A( var_1 );

    foreach ( var_5 in var_3 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        if ( isdefined( self ) && var_5 == self )
            continue;

        _id_0766::_id_D58C( var_0, var_5 );
    }
}

_id_745F()
{
    if ( !scripts\mp\gametypes\br_public::_id_8976() )
    {
        var_0 = getdvarfloat( "death_icon_owner_duration", 15.0 );

        if ( !scripts\mp\utility\player::isreallyalive( self ) )
            self waittill( "spawned_player" );
        else
        {
            var_1 = gettime() - self._id_9038;
            var_0 = var_0 - var_1 / 1000;
        }

        if ( var_0 > 0 )
            wait( var_0 );
    }
}

_id_4842( var_0 )
{
    self endon( "removed_death_icon" );
    var_1 = self;
    var_2 = self._id_8FA2;
    wait( var_0 );
    _id_0766::_id_D586( var_2 );

    if ( isdefined( var_1 ) )
        var_1._id_8FA2 = undefined;
}

_id_78D8( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_0._id_8FA2 ) )
        return;

    _id_0766::_id_D58C( var_0._id_8FA2, var_0 );
}

_id_C47F( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_0._id_8FA2 ) )
        return;

    _id_0766::_id_D586( var_0._id_8FA2 );
    var_0._id_8FA2 = undefined;
    var_0 notify( "removed_death_icon" );
}

_id_C45F()
{
    foreach ( var_1 in level.players )
        _id_C47F( var_1 );
}

_id_107F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_1 endon( "disconnect" );

    if ( !level.teambased )
        return;

    if ( istrue( var_1 scripts\mp\gametypes\br_public::_id_8976() ) )
        return;

    var_6 = var_0.origin;
    var_6 = var_6 + ( 0, 0, 40 );
    var_1 notify( "addDeathIcon()" );
    var_1 endon( "addDeathIcon()" );

    if ( !var_5 )
    {
        if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
            return;

        if ( level._id_74A8 )
            return;
    }

    if ( isdefined( var_1.lastdeathheadiconsforenemy ) )
    {
        foreach ( var_8 in var_1.lastdeathheadiconsforenemy )
            _id_0766::_id_D586( var_8 );

        var_1.lastdeathheadiconsforenemy = undefined;
    }

    var_1 notify( "removed_enemy_death_icon" );

    if ( scripts\cp_mp\utility\game_utility::_id_89D2() )
    {
        var_10 = "hud_realism_head_death";
        var_11 = 0;
        var_12 = 768;
        var_13 = 10;
    }
    else
    {
        var_10 = "hud_icon_death_hunter_spawn";
        var_11 = 1;
        var_12 = 768;
        var_13 = 0;
    }

    var_14 = var_1.origin;

    if ( var_3.size > 0 )
    {
        var_15 = "v_esports_ui_icon_codcaster_waypoint_skull";
        var_16 = var_1 _id_0766::_id_D58E( var_3, var_15, undefined, var_11, var_12, var_13, undefined, undefined, undefined, var_14 );
        var_1.lastdeathheadiconsforenemy = scripts\engine\utility::_id_1B65( var_1.lastdeathheadiconsforenemy, var_16 );
    }

    if ( var_2.size > 0 )
    {
        var_16 = var_1 _id_0766::_id_D58E( var_2, var_10, undefined, var_11, var_12, var_13, undefined, undefined, undefined, var_14 );
        var_1.lastdeathheadiconsforenemy = scripts\engine\utility::_id_1B65( var_1.lastdeathheadiconsforenemy, var_16 );
    }

    if ( isdefined( var_1.lastdeathheadiconsforenemy ) )
        var_1 thread _id_482E( var_4 );
}

_id_482E( var_0 )
{
    self endon( "removed_enemy_death_icon" );
    var_1 = self;
    var_2 = self.lastdeathheadiconsforenemy;
    wait( var_0 );

    foreach ( var_4 in var_2 )
        _id_0766::_id_D586( var_4 );

    if ( isdefined( var_1 ) )
        var_1.lastdeathheadiconsforenemy = undefined;
}
