// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_EF58()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "team_utility", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "team_utility", "init" ) ]]();
}

_id_6A3A( var_0, var_1 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "team_utility", "getFriendlyPlayers" ) )
        return [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "team_utility", "getFriendlyPlayers" ) ]]( var_0, var_1 );

    return [];
}

_id_69DE( var_0, var_1 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "team_utility", "getEnemyPlayers" ) )
        return [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "team_utility", "getEnemyPlayers" ) ]]( var_0, var_1 );

    return [];
}
