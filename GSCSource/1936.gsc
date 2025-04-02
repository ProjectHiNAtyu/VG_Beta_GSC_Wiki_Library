// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_2F71()
{
    _id_0761::_id_2F72();
    _id_0A65::_id_C277( _id_0761::_id_2F7A );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "ping", "calloutMarkerPing_squadLeaderBeaconShouldCreate", ::_id_2F8A );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer", ::_id_2F88 );
    level._effect["vfx_br_beacon_circle"] = loadfx( "vfx/_requests/br_gameplay/vfx_br_beacon_circle" );
}

_id_2F8A( var_0, var_1, var_2 )
{
    if ( !getdvarint( "scr_calloutmarkerping_squadleaderbeacon", 0 ) )
        return;

    if ( var_0 scripts\mp\gametypes\br_public::_id_8971() && istrue( var_0._id_2A3E ) && var_1 == _id_0761::_id_2F6B() || getdvarint( "scr_calloutmarkerping_squadleaderbeacon_forceactive", 0 ) )
        _id_2F87( var_2 );
}

_id_2F87( var_0 )
{
    var_1 = self;
    var_2 = scripts\engine\utility::getfx( "vfx_br_beacon_circle" );
    var_3 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "getFriendlyPlayers" ) ]]( var_1.team, 1 );

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5._id_E497 ) )
            var_5._id_E497 delete();

        var_5._id_E497 = _func_0208( var_2, var_0, var_5 );
        triggerfx( var_5._id_E497 );
        var_5._id_E497 _meth_8321();
        var_5._id_E495 = var_0;
        var_5._id_E496 = 892.5;
        var_5._id_E498 = 1;
    }
}

_id_2F89()
{
    var_0 = self;

    if ( !getdvarint( "scr_calloutmarkerping_squadleaderbeacon", 0 ) )
        return;

    if ( !istrue( var_0._id_E498 ) )
        return;

    if ( scripts\engine\utility::_id_89A0( var_0.origin, var_0._id_E495, var_0._id_E496 ) )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "rank", "scoreEventPopup" ) )
            var_0 thread [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "rank", "scoreEventPopup" ) ]]( "br_beacon_bonus" );
    }

    var_0._id_E497 delete();
    var_0._id_E495 = undefined;
    var_0._id_E496 = undefined;
    var_0._id_E498 = undefined;
}

_id_2F88( var_0 )
{
    if ( !getdvarint( "scr_calloutmarkerping_squadleaderbeacon", 0 ) )
        return;

    if ( isdefined( var_0._id_E497 ) )
    {
        var_0._id_E497 delete();
        var_0._id_E495 = undefined;
        var_0._id_E496 = undefined;
        var_0._id_E498 = undefined;
    }
}
