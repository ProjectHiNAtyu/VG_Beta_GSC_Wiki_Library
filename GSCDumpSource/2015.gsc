// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_7C63 = "icon_waypoint_vehicle_apc";
    level._id_7C64 = "icon_waypoint_vehicle_little_bird";
}

_id_99F1( var_0 )
{
    if ( istrue( var_0._id_89BE ) )
        return;

    var_0._id_89BE = 1;
    var_0._id_C248 = [];
    var_0._id_1F28 = getdvarint( "#x3920e09c7656d224" );

    if ( !isdefined( level._id_BFB8 ) )
        level._id_BFB8 = [];

    level._id_BFB8[level._id_BFB8.size] = var_0;
    thread _id_10B38( var_0 );
    thread _id_10B43( var_0 );
}

_id_C290( var_0, var_1 )
{
    if ( !istrue( var_1._id_89BE ) )
    {
        _id_44CD( "Trying to register a player with an object that is not a rally point." );
        return;
    }

    _id_44CD( var_0.name + " has been registered wtih rally point: " + var_1._id_045A );
    var_0._id_BFAF = var_1;
    var_0._id_249F = 0;
    var_1._id_C248[var_1._id_C248.size] = var_0;
}

_id_10B38( var_0 )
{
    while ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0._id_C248 )
        {
            if ( !isdefined( var_2 ) )
            {
                var_0._id_C248 = scripts\engine\utility::array_remove( var_0._id_C248, var_2 );
                continue;
            }

            if ( !scripts\mp\utility\player::isreallyalive( var_2 ) && isdefined( var_2._id_BFAF ) && !var_2._id_249F )
                _id_BBAF( var_2, var_0 );
        }

        wait 0.1;
    }
}

_id_BBAF( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 endon( "team_eliminated" );
    var_2 = [ "rally_point_respawn", "rally_point_destroyed" ];
    var_3 = var_0 scripts\engine\utility::_id_1088E( var_2, var_1._id_1F28 );

    if ( var_3 == "rally_point_destroyed" )
    {
        if ( isdefined( var_0 ) || !scripts\mp\utility\player::isreallyalive( var_0 ) )
            return;

        var_4 = var_0 _id_0A70::_id_6B08();
        var_5 = var_4._id_F1E5;
        var_0 _id_0A70::_id_D5DD( 28, int( gettime() + self._id_F280 * 1000 ) );
        waitframe();
        var_0._id_98B4 _meth_8390( var_0._id_F212 );
        return;
    }

    var_0._id_249F = 1;
    var_6 = vectornormalize( anglestoforward( var_1.angles ) );
    var_6 = var_6 * -175 + var_1.origin;
    var_0._id_5EA7 = _func_02A6( var_6 );
    waitframe();
    _id_44CD( "Player respawning at rally point location:" + var_0._id_5EA7 );
    var_0._id_5EA2 = ( 0, 90, 0 );
    var_0 notify( "last_stand_revived" );
    var_0 scripts\mp\utility\player::_id_0BC4( 0 );
    var_0 thread _id_07F6::_id_C664();
    var_0 setclientomnvar( "ui_securing", 0 );
    var_0 setclientomnvar( "ui_securing_progress", 0.01 );
    var_0._id_F910 = undefined;

    while ( !scripts\mp\utility\player::isreallyalive( var_0 ) )
        wait 0.1;

    var_0._id_249F = 0;
}

_id_10B43( var_0 )
{
    var_0 waittill( "death" );

    foreach ( var_2 in var_0._id_C248 )
    {
        var_2 notify( "rally_point_destroyed" );
        var_2 iprintlnbold( "Your Rally Point has been destroyed" );
    }
}

_id_44CD( var_0 )
{
    if ( 1 )
        return;
}

_id_BFB9( var_0 )
{
    var_1 = scripts\cp_mp\vehicles\vehicle_tracking::_id_6E22( var_0 );
    var_2 = var_0.team;
    var_3 = var_1._id_C17B;
    var_0._id_89BF = 1;
    thread _id_07F0::_id_1030F( var_0 );

    if ( var_2 == "axis" )
    {
        _id_07F0::_id_107C( var_2, var_0, var_3, ( 0, 0, 128 ) );

        if ( !isdefined( level._id_1FC5 ) )
            level._id_1FC5 = [];

        level._id_1FC5[level._id_1FC5.size] = var_3;
        _id_07F0::_id_D6CD( level._id_1FC5, var_2 );
    }
    else
    {
        _id_07F0::_id_107C( var_2, var_0, var_3, ( 0, 0, 128 ) );

        if ( !isdefined( level._id_14EE ) )
            level._id_14EE = [];

        level._id_14EE[level._id_14EE.size] = var_3;
        _id_07F0::_id_D6CD( level._id_14EE, var_2 );
    }

    var_0._id_C17B = var_3;
    _id_BFB0( var_0 );
    thread _id_BFB5( var_0 );
    thread _id_BFB6( var_0 );
}

_id_BFBA( var_0 )
{

}

_id_BFB2( var_0 )
{
    var_0 endon( "death" );
    _id_07A8::_id_60A3( "prematch_done" );

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == var_0.team )
        {
            _id_07D0::_id_A88A( var_0._id_9B36._id_A8F5, var_2 );
            var_2 _id_0A70::_id_D5DD( 63, undefined, 5 );
        }
    }
}

_id_BFB5( var_0 )
{
    var_0 waittill( "death" );

    if ( var_0.team == "axis" )
        level._id_1FC5 = scripts\engine\utility::array_remove( level._id_1FC5, var_0._id_C17B );
    else
        level._id_14EE = scripts\engine\utility::array_remove( level._id_14EE, var_0._id_C17B );

    _id_BFB1( var_0 );
    _id_07F0::_id_C488( var_0.team, var_0._id_C17B );
    _id_07F0::_id_C513( var_0._id_C17B, var_0.team );
}

_id_BFB0( var_0 )
{
    var_1 = "friendly";
    var_2 = var_0.origin + ( 0, 0, 128 );
    var_3 = _id_07AD::_id_4004( var_2, "neutral", ( 0, 0, 0 ), undefined, var_1, 0 );
    _id_07D0::_id_FB93( var_3._id_A8F5, var_0.team );
    var_0._id_9B36 = var_3;

    if ( _id_07A8::_id_609F( "prematch_done" ) )
    {
        foreach ( var_5 in level.players )
        {
            if ( var_5.team == var_0.team )
            {
                _id_07D0::_id_A88A( var_0._id_9B36._id_A8F5, var_5 );
                var_5 _id_0A70::_id_D5DD( 63, undefined, 5 );
            }
        }
    }
    else
    {
        _id_07D0::_id_A88C( var_3._id_A8F5 );
        thread _id_BFB2( var_0 );
    }

    _id_07D0::_id_A89E( var_3._id_A8F5, 0 );
    var_3._id_96F3 = 0;
    _id_07D0::_id_A887( var_3._id_A8F5, 0 );
    _id_07D0::_id_FB8C( var_3._id_A8F5, scripts\engine\utility::ter_op( var_0._id_1031C == "little_bird", level._id_7C64, level._id_7C63 ) );
    _id_07D0::_id_FB95( var_3._id_A8F5, 0 );
    _id_07D0::_id_FB90( var_3._id_A8F5, var_0 );
    _id_07D0::_id_FB9A( var_0._id_9B36._id_A8F5, 128 );
    var_3._id_96F3 = 1;
    var_0._id_9B36 = var_3;
}

_id_BFB1( var_0 )
{
    var_0._id_9B36 _id_07AD::_id_D8D5( "none" );
    var_0._id_9B36 _id_07AD::_id_C2F2();
    var_0._id_9B36._id_10418 = "none";
}

_id_BFB6( var_0 )
{
    var_0 endon( "death" );

    while ( !_id_07A8::_id_609F( "prematch_done" ) )
        waitframe();

    var_1 = spawn( "trigger_radius", var_0.origin - ( 0, 0, 512 ), 0, 1024, 1536 );
    var_1 thread _id_10BED( var_0 );
    var_1 waittill( "rallyPoint_revealed" );
    var_1 delete();
}

_id_10BED( var_0 )
{
    self endon( "rallyPoint_revealed" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        waitframe();

        if ( !isplayer( var_1 ) )
            continue;

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1.team == var_0.team )
            continue;

        var_0._id_C7A3 = 1;

        foreach ( var_3 in level.players )
            _id_07D0::_id_A88A( var_0._id_9B36._id_A8F5, var_3 );

        self notify( "rallyPoint_revealed" );
    }
}

_id_BFB3( var_0 )
{
    var_0 endon( "death_or_disconnect" );

    while ( !_id_07A8::_id_609F( "prematch_done" ) )
        waitframe();

    while ( !isdefined( var_0.team ) || var_0.team == "spectator" )
        waitframe();

    if ( isdefined( level._id_BFBB ) )
    {
        foreach ( var_2 in level._id_BFBB )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( var_0.team == var_2.team )
                _id_07D0::_id_A88A( var_2._id_9B36._id_A8F5, var_0 );
        }
    }
}
