// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    _id_0C89();
    level._id_0E30 = [];
    _id_C22C( "thirdPlaceScore", undefined, ::_id_75A0, undefined );
    _id_C22C( "secondPlaceScore", undefined, ::_id_7590, undefined );
    _id_C22C( "mostKills", undefined, ::_id_756C, [ "kills" ] );
    _id_C22C( "mostHeadshots", undefined, ::_id_756C, [ "headshots" ] );
    _id_C22C( "mostKillsAssists", undefined, ::_id_756C, [ "kills", "assists" ] );
    _id_C22C( "secondPlaceObjScore", ::_id_893F, ::_id_758F, undefined );
    _id_C22C( "highScoreNegKDA", undefined, ::_id_7548, undefined );
    _id_C22C( "firstPlaceObjScore", ::_id_893F, ::_id_7547, undefined );
    _id_C22C( "highScorePosKDA", undefined, ::_id_7549, undefined );
    _id_C22C( "minThreeAccolades", undefined, ::_id_756A, undefined );
    _id_C22C( "timeWithAllies", undefined, ::_id_756C, [ "timeNearAllies" ] );
    _id_C22C( "timeWithEnemies", undefined, ::_id_756C, [ "timeNearEnemies" ] );
}

_id_C22C( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_7C71 = int( _func_021D( "mp/accoladestable.csv", 1, var_0, 0 ) );
    var_4._id_0E31 = int( _func_021D( "mp/accoladestable.csv", 1, var_0, 2 ) );
    var_4._id_4340 = var_3;
    var_4._id_5652 = var_2;
    var_4._id_10E58 = [];
    var_4._id_10E5E = 0;
    var_4._id_8716 = !isdefined( var_1 ) || [[ var_1 ]]();
    level._id_0E30[var_0] = var_4;
}

_id_199C()
{
    foreach ( var_5, var_1 in level._id_0E30 )
    {
        self _meth_8364( "mp", "playerStats", "matchAccolades", var_5, 0 );

        if ( !isdefined( var_1._id_4340 ) )
            continue;

        foreach ( var_3 in var_1._id_4340 )
            _id_0A7B::_id_823D( var_3 );
    }
}

_id_10FBF( var_0, var_1 )
{
    var_2 = var_0 getplayerdata( "mp", "playerStats", "accoladeStats", var_1 );
    var_0 _meth_8364( "mp", "playerStats", "accoladeStats", var_1, var_2 + 1 );
    var_0 _meth_8364( "mp", "playerStats", "matchAccolades", var_1, 1 );
}

_id_564B()
{
    foreach ( var_1 in level.players )
        var_1._id_9B90 = [];

    foreach ( var_8, var_4 in level._id_0E30 )
    {
        if ( !var_4._id_8716 )
            continue;

        if ( var_8 == "minThreeAccolades" )
            continue;

        foreach ( var_6 in level._id_EF86 )
            level _id_564A( var_8, var_6 );
    }

    foreach ( var_6 in level._id_EF86 )
        level _id_564A( "minThreeAccolades", var_6 );
}

_id_F33F( var_0 )
{
    var_1 = [];
    var_2 = [];
    var_3 = [];
    var_4 = level._id_EF67[var_0]["players"];

    if ( scripts\mp\utility\game::getgametype() == "arena_evo" )
    {
        if ( scripts\mp\gametypes\arena_evo_tourney_util::_id_86C8( var_0 ) )
            return [];
    }

    foreach ( var_6 in var_4 )
    {
        var_2[var_6._id_723F] = 0;
        var_3[var_6._id_723F] = var_6;

        if ( isdefined( var_6._id_9B90 ) && var_6._id_9B90.size > 0 )
        {
            foreach ( var_8 in var_6._id_9B90 )
                var_2[var_6._id_723F] = var_2[var_6._id_723F] + level._id_0E30[var_8]._id_0E31;
        }
    }

    var_11 = _func_041F( var_2, "down" );

    foreach ( var_13 in var_11 )
    {
        var_6 = var_3[var_13];
        var_14 = isdefined( var_6._id_9B90 ) && var_6._id_9B90.size > 0;

        if ( var_14 && var_1.size < 3 )
            var_1[var_1.size] = var_6;
    }

    return var_1;
}

_id_0B73()
{
    foreach ( var_1 in level.players )
    {
        for ( var_2 = 0; var_2 < 3; var_2++ )
        {
            var_1 setclientomnvar( "ui_wc_winner_" + var_2, -1 );

            for ( var_3 = 0; var_3 < 1; var_3++ )
            {
                var_1 setclientomnvar( "ui_wc_accolade_" + var_2 + "_" + var_3, -1 );
                var_1 setclientomnvar( "ui_wc_accolade_player_" + var_3, -1 );
                var_1 setclientomnvar( "ui_wc_accolade_score_" + var_2 + "_" + var_3, -1 );
            }
        }
    }
}

_id_0B19()
{
    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1._id_9B90 ) )
        {
            for ( var_2 = 0; var_2 < min( 1, var_1._id_9B90.size ); var_2++ )
            {
                var_3 = level._id_0E30[var_1._id_9B90[var_2]]._id_7C71;
                var_1 setclientomnvar( "ui_wc_accolade_player_" + var_2, var_3 );
            }
        }
    }
}

_id_A69B( var_0 )
{
    _id_0B73();

    foreach ( var_2 in level._id_EF86 )
    {
        var_3 = level._id_EF67[var_2]["players"];

        foreach ( var_5 in var_3 )
        {
            for ( var_6 = 0; var_6 < min( 3, var_0.size ); var_6++ )
            {
                var_7 = var_0[var_6];
                var_5 setclientomnvar( "ui_wc_winner_" + var_6, var_7 getentitynumber() );
            }
        }
    }
}

_id_A69A()
{
    _id_0B73();
    _id_0B19();
    level._id_10E59 = [];

    foreach ( var_1 in level._id_EF86 )
    {
        var_2 = _id_F33F( var_1 );
        var_3 = 0;
        var_4 = level._id_EF67[var_1]["players"];

        foreach ( var_6 in var_4 )
        {
            for ( var_7 = 0; var_7 < min( 3, var_2.size ); var_7++ )
            {
                var_8 = var_2[var_7];
                var_6 setclientomnvar( "ui_wc_winner_" + var_7, var_8 getentitynumber() );

                for ( var_9 = 0; var_9 < min( 1, var_8._id_9B90.size ); var_9++ )
                {
                    var_3 = var_3 + 1;
                    var_10 = level._id_0E30[var_8._id_9B90[var_9]]._id_7C71;
                    var_6 setclientomnvar( "ui_wc_accolade_" + var_7 + "_" + var_9, var_10 );
                    var_6 setclientomnvar( "ui_wc_accolade_score_" + var_7 + "_" + var_9, level._id_0E30[var_8._id_9B90[var_9]]._id_10E5E );
                }
            }
        }

        level._id_10E59[var_1] = var_3;
    }
}

_id_6572()
{
    return 3;
}

_id_81D3()
{
    level._id_10E5A = [];

    foreach ( var_1 in level._id_EF86 )
    {
        var_2 = [];

        for ( var_3 = 0; var_3 < 9; var_3++ )
            var_2[var_3] = 0;

        level._id_10E5A[var_1] = var_2;
    }

    foreach ( var_6 in level.players )
    {
        var_6._id_10E5A = [];

        for ( var_3 = 0; var_3 < 9; var_3++ )
        {
            var_6._id_10E5A[var_3] = 0;
            var_6 _meth_82F7( "ui_wc_vote_bits", var_3, 0 );
            var_6 setclientomnvar( "ui_wc_votes_" + var_3, 0 );
        }
    }
}

_id_0C89()
{
    level _id_000F::_id_98F5( "winners_circle_vote", ::_id_0C60 );
    level _id_000F::_id_98F5( "winners_circle_mode", ::_id_0C5F );
}

_id_0C19( var_0, var_1 )
{
    return var_1 >= 0 && var_1 < level._id_10E59[var_0];
}

_id_0C60( var_0 )
{
    var_1 = self;
    var_1 endon( "disconnect" );
    waittillframeend;
    var_2 = var_1.pers["team"];

    if ( !isdefined( var_2 ) )
        return;

    if ( !_id_0C19( var_2, var_0 ) )
        return;

    if ( var_1._id_10E5A[var_0] )
        return;

    var_3 = 0;

    for ( var_4 = 0; var_4 < 9; var_4++ )
    {
        if ( var_1._id_10E5A[var_4] )
            var_3 = var_3 + 1;
    }

    if ( var_3 >= 1 )
        return;

    var_1._id_10E5A[var_0] = 1;
    level._id_10E5A[var_2][var_0] = level._id_10E5A[var_2][var_0] + 1;
    var_5 = level._id_10E5A[var_2][var_0];
    var_6 = var_1 _meth_876B( "ui_wc_accolade_" + var_0 + "_0" );
    var_7 = undefined;

    foreach ( var_10, var_9 in level._id_0E30 )
    {
        if ( var_6 == var_9._id_7C71 )
        {
            var_7 = var_10;
            break;
        }
    }

    var_1 _meth_870C( "dlog_event_gamemp_mvp_vote", [ "accolade_ref", var_7 ] );

    if ( !isdefined( var_1.gainedxpfromaccoladevoting ) )
    {
        var_1.gainedxpfromaccoladevoting = 1;
        var_1 thread scripts\mp\rank::_id_6FC0( "accolade_vote", scripts\mp\rank::_id_6CEE( "accolade_vote" ) );
    }

    var_1 _meth_82F7( "ui_wc_vote_bits", var_0, 1 );
    var_11 = level._id_EF67[var_2]["players"];

    foreach ( var_13 in var_11 )
        var_13 setclientomnvar( "ui_wc_votes_" + var_0, var_5 );
}

_id_0C5F( var_0 )
{
    var_1 = self;

    if ( var_0 == 0 )
        _id_07FF::_id_DC5E( var_1 );
    else if ( var_0 == 1 )
        _id_07FF::_id_DC5A( var_1 );
    else if ( var_0 == 2 )
        return;
}

_id_564A( var_0, var_1 )
{
    [[ level._id_0E30[var_0]._id_5652 ]]( var_0, var_1 );
}

_id_F3ED( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( istrue( level._id_338D ) )
        _id_10FBF( var_1, var_0 );

    var_1 _meth_870C( "dlog_event_gamemp_accolade_awarded", [ "accolade_ref", var_0 ] );
    level._id_0E30[var_0]._id_10E58[level._id_0E30[var_0]._id_10E58.size] = var_1;
    level._id_0E30[var_0]._id_10E5E = var_2;

    if ( !isdefined( var_1._id_9B90 ) )
        var_1._id_9B90 = [];

    var_1._id_9B90[var_1._id_9B90.size] = var_0;
}

_id_75A0( var_0, var_1 )
{
    if ( !isdefined( level._id_B780 ) || !isdefined( level._id_B780[var_1] ) )
        _id_B7C7();

    if ( level._id_B780[var_1].size < 3 )
        return;

    _id_F3ED( var_0, level._id_B780[var_1][2]._id_B74D, level._id_B780[var_1][2]._id_04A3 );
}

_id_7590( var_0, var_1 )
{
    if ( !isdefined( level._id_B780 ) || !isdefined( level._id_B780[var_1] ) )
        _id_B7C7();

    if ( level._id_B780[var_1].size < 2 )
        return;

    _id_F3ED( var_0, level._id_B780[var_1][1]._id_B74D, level._id_B780[var_1][1]._id_04A3 );
}

_id_7548( var_0, var_1 )
{
    if ( !isdefined( level._id_B780 ) || !isdefined( level._id_B780[var_1] ) )
        _id_B7C7();

    foreach ( var_3 in level._id_B780[var_1] )
    {
        if ( !isdefined( var_3._id_8C97 ) )
        {
            var_4 = scripts\engine\utility::ter_op( var_3._id_B74D.pers["deaths"] > 0, var_3._id_B74D.pers["deaths"], 1 );
            var_5 = var_3._id_B74D.pers["kills"] + var_3._id_B74D.pers["assists"];
            var_3._id_8C97 = var_5 / var_4;
        }

        if ( var_3._id_8C97 <= 1.0 )
        {
            _id_F3ED( var_0, var_3._id_B74D, var_3._id_04A3 );
            return;
        }
    }
}

_id_7549( var_0, var_1 )
{
    if ( !isdefined( level._id_B780 ) || !isdefined( level._id_B780[var_1] ) )
        _id_B7C7();

    foreach ( var_3 in level._id_B780[var_1] )
    {
        if ( !isdefined( var_3._id_8C97 ) )
        {
            var_4 = scripts\engine\utility::ter_op( var_3._id_B74D.pers["deaths"] > 0, var_3._id_B74D.pers["deaths"], 1 );
            var_5 = var_3._id_B74D.pers["kills"] + var_3._id_B74D.pers["assists"];
            var_3._id_8C97 = var_5 / var_4;
        }

        if ( var_3._id_8C97 > 1.0 )
        {
            _id_F3ED( var_0, var_3._id_B74D, var_3._id_04A3 );
            return;
        }
    }
}

_id_756C( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = [];

    foreach ( var_5 in level.players )
    {
        if ( var_5.pers["team"] != var_1 )
            continue;

        var_6 = 0;

        foreach ( var_8 in level._id_0E30[var_0]._id_4340 )
            var_6 = var_6 + var_5.pers[var_8];

        if ( var_6 == 0 )
            continue;

        if ( !isdefined( var_2 ) || var_6 > var_2 )
        {
            var_2 = var_6;
            var_3 = [];
            var_3[var_3.size] = var_5;
            continue;
        }

        if ( var_6 == var_2 )
            var_3[var_3.size] = var_5;
    }

    foreach ( var_5 in var_3 )
        _id_F3ED( var_0, var_5, var_2 );
}

_id_758F( var_0, var_1 )
{
    if ( !isdefined( level._id_B714 ) || !isdefined( level._id_B714[var_1] ) )
        _id_B7C6();

    if ( level._id_B714[var_1].size < 2 )
        return;

    _id_F3ED( var_0, level._id_B714[var_1][1]._id_B74D, level._id_B714[var_1][1]._id_04A3 );
}

_id_7547( var_0, var_1 )
{
    if ( !isdefined( level._id_B714 ) || !isdefined( level._id_B714[var_1] ) )
        _id_B7C6();

    if ( level._id_B714[var_1].size < 1 )
        return;

    _id_F3ED( var_0, level._id_B714[var_1][0]._id_B74D, level._id_B714[var_1][0]._id_04A3 );
}

_id_756A( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( var_4.pers["team"] != var_1 )
            continue;

        var_5 = scripts\engine\utility::ter_op( isdefined( var_4._id_9B90 ), var_4._id_9B90.size, 0 );

        if ( var_5 >= 3 )
            _id_F3ED( var_0, var_4, var_5 );
    }
}

_id_B7C7()
{
    level._id_B780 = [];

    foreach ( var_1 in level._id_EF86 )
    {
        var_2 = [];

        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            if ( level.players[var_3].pers["team"] != var_1 )
                continue;

            var_4 = spawnstruct();
            var_4._id_B74D = level.players[var_3];
            var_4._id_04A3 = level.players[var_3].pers["score"];
            var_2[var_2.size] = var_4;
        }

        level._id_B780[var_1] = _id_E037( var_2 );
    }
}

_id_E037( var_0 )
{
    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        for ( var_3 = var_1 - 1; var_3 >= 0 && var_0[var_3]._id_04A3 < var_2._id_04A3; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];

        var_0[var_3 + 1] = var_2;
    }

    return var_0;
}

_id_B7C6()
{
    var_0 = [ "defends", "assaults", "captures", "returns", "plants", "defuses", "confirmed", "denied", "objTime" ];
    level._id_B714 = [];

    foreach ( var_2 in level.players )
    {
        var_3 = 0;

        foreach ( var_5 in var_0 )
        {
            if ( isdefined( var_2.pers[var_5] ) )
                var_3 = var_3 + var_2.pers[var_5];
        }

        var_2.pers["totalObjScore"] = var_3;
    }

    foreach ( var_9 in level._id_EF86 )
    {
        var_10 = [];

        for ( var_11 = 0; var_11 < level.players.size; var_11++ )
        {
            if ( level.players[var_11].pers["team"] != var_9 )
                continue;

            var_12 = spawnstruct();
            var_12._id_B74D = level.players[var_11];
            var_12._id_04A3 = level.players[var_11].pers["totalObjScore"];
            var_10[var_10.size] = var_12;
        }

        level._id_B714[var_9] = _id_E037( var_10 );
    }
}

_id_1A30()
{
    return istrue( level._id_8D46 );
}

_id_8939()
{
    return !scripts\mp\utility\game::_id_CA3E();
}

_id_8796()
{
    _id_07A8::_id_60A3( "infil_setup_complete" );
    return scripts\mp\utility\game::_id_1575();
}

_id_88F2()
{
    return istrue( level._id_A77D );
}

_id_89EA()
{
    return istrue( level._id_A784 );
}

_id_87AA()
{
    return scripts\mp\utility\game::getgametype() != "br";
}

_id_1A31()
{
    return istrue( level._id_1595 );
}

_id_1A2D()
{
    return istrue( level._id_15B0 );
}

_id_893F()
{
    return scripts\mp\utility\game::getgametype() != "war" && scripts\mp\utility\game::getgametype() != "dm" && scripts\mp\utility\game::getgametype() != "br";
}

_id_876A()
{
    return _id_07AD::_id_876B();
}

_id_878C()
{
    if ( _id_07AD::_id_876B() )
        return 1;

    switch ( scripts\mp\utility\game::getgametype() )
    {
        case "ctf":
            return 1;
    }

    return 0;
}

_id_8788()
{
    switch ( scripts\mp\utility\game::getgametype() )
    {
        case "grnd":
        case "grind":
        case "koth":
        case "hq":
        case "arena_evo":
        case "arena":
        case "siege":
        case "dom":
        case "base":
        case "arm":
            return 1;
    }

    return 0;
}

_id_87C4()
{
    return scripts\mp\utility\game::getgametype() == "ctf";
}

_id_8A2F()
{
    return istrue( level._id_FECC );
}

_id_1AE5()
{
    return istrue( level._id_4CC8 );
}

_id_8868()
{
    return scripts\mp\utility\game::getgametype() == "grind";
}

_id_88A7()
{
    return scripts\mp\utility\game::getgametype() == "infect";
}

_id_886C()
{
    return scripts\mp\utility\game::getgametype() == "gun";
}

_id_8875()
{
    return scripts\mp\utility\game::getgametype() == "koth" || scripts\mp\utility\game::getgametype() == "grnd";
}

_id_1AE7()
{
    return getdvarint( "scr_allow_vehicles", 0 ) == 1;
}
