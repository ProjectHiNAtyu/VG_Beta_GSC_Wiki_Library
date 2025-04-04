// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "manual_turret", _id_0991::_id_F78F );
    _id_7FD0();
    _id_7FD1();
    scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "monitorDamage", ::_id_9A4A );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "createHintObject", ::_id_9A45 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "getTargetMarker", ::_id_9A48 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "getEnemyPlayers", ::_id_9A47 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "watchForPlayerEnteringLastStand", ::_id_9A49 );
}

_id_7FD0()
{
    level._id_D0ED["manual_turret"] = spawnstruct();
    level._id_D0ED["manual_turret"].health = 999999;
    level._id_D0ED["manual_turret"].maxhealth = 650;
    level._id_D0ED["manual_turret"]._id_2D8C = 20;
    level._id_D0ED["manual_turret"]._id_2D8B = 120;
    level._id_D0ED["manual_turret"]._id_AF5B = 0.15;
    level._id_D0ED["manual_turret"]._id_AF59 = 0.35;
    level._id_D0ED["manual_turret"]._id_D0EB = "manual";
    level._id_D0ED["manual_turret"]._id_D0EA = "sentry_offline";
    level._id_D0ED["manual_turret"]._id_16A4 = 200;
    level._id_D0ED["manual_turret"]._id_F221 = 90;
    level._id_D0ED["manual_turret"]._id_E40D = 0.05;
    level._id_D0ED["manual_turret"]._id_AD0E = 8.0;
    level._id_D0ED["manual_turret"]._id_3CEB = 0.1;
    level._id_D0ED["manual_turret"]._id_607E = 0.3;
    level._id_D0ED["manual_turret"]._id_EA0F = "manual_turret";
    level._id_D0ED["manual_turret"].weaponinfo = "manual_turret_mp";
    level._id_D0ED["manual_turret"]._id_B80D = "manual_turret_mp";
    level._id_D0ED["manual_turret"]._id_0383 = "ks_manual_turret_mp";
    level._id_D0ED["manual_turret"]._id_9FBF = "killstreak_wm_mounted_turret";
    level._id_D0ED["manual_turret"]._id_9FC0 = "weapon_wm_mg_mobile_turret";
    level._id_D0ED["manual_turret"]._id_9FC3 = "killstreak_wm_mounted_turret";
    level._id_D0ED["manual_turret"]._id_9FC4 = "weapon_wm_mg_mobile_turret";
    level._id_D0ED["manual_turret"]._id_B15C = &"KILLSTREAKS_HINTS/SENTRY_PLACE";
    level._id_D0ED["manual_turret"]._id_AD9F = &"KILLSTREAKS_HINTS/SENTRY_OWNER_USE";
    level._id_D0ED["manual_turret"]._id_AC8B = &"KILLSTREAKS_HINTS/SENTRY_OTHER_USE";
    level._id_D0ED["manual_turret"]._id_4B1A = &"KILLSTREAKS_HINTS/SENTRY_DISMANTLE";
    level._id_D0ED["manual_turret"]._id_75CE = 1;
    level._id_D0ED["manual_turret"]._id_EFA9 = "used_manual_turret";
    level._id_D0ED["manual_turret"]._id_482A = "callout_destroyed_manual_turret";
    level._id_D0ED["manual_turret"]._id_DBDE = 1;
    level._id_D0ED["manual_turret"]._id_106B2 = "timeout_manual_turret";
    level._id_D0ED["manual_turret"]._id_1068D = "destroyed_manual_turret";
    level._id_D0ED["manual_turret"]._id_CC09 = "destroyed_manual_turret";
    level._id_D0ED["manual_turret"]._id_944A = "tag_fx";
    level._id_D0ED["manual_turret"]._id_88CF = 1;
    level._id_D0ED["manual_turret"]._id_75DA = ( 0, 0, 75 );
}

_id_7FD1()
{
    game["dialog"]["manual_turret_low_ammo"] = "manual_turret_ammo_low";
    game["dialog"]["manual_turret_no_ammo"] = "manual_turret_no_ammo";
}

_id_9A46( var_0, var_1, var_2 )
{
    scripts\mp\equipment::_id_EDBA( var_1 );
    var_3 = _id_0991::_id_F78E( "manual_turret" );

    if ( !var_3 )
        scripts\mp\equipment::_id_6F76( "equip_shieldturret", var_1 );
    else
    {
        _id_7FD0();
        _id_7FD1();
        scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "monitorDamage", ::_id_9A4A );
        scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "createHintObject", ::_id_9A45 );
        scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "getTargetMarker", ::_id_9A48 );
        scripts\cp_mp\utility\script_utility::registersharedfunc( "manual_turret", "getEnemyPlayers", ::_id_9A47 );
    }
}

_id_9A48( var_0, var_1 )
{
    return _id_0A38::_id_6DA0( var_0, var_1 );
}

_id_9A45( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    return _id_07AD::_id_3FCE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_9A4A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    _id_079A::_id_A0EC( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_9A47( var_0 )
{
    return scripts\mp\utility\teams::_id_69DE( var_0 );
}

_id_9A49()
{
    self endon( "death_or_disconnect" );
    self notify( "stop_manual_turret_lastStandWatcher" );
    self endon( "stop_manual_turret_lastStandWatcher" );
    self endon( "turret_placement_finished" );
    thread _id_0991::_id_9A57( "last_stand_start" );
    self waittill( "last_stand_start" );
    self notify( "equip_deploy_cancel" );
}
