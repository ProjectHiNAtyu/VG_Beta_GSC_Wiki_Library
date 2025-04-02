// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._effect["adrenaline"] = loadfx( "vfx/iw8_mp/equipment/stim/vfx_stim_heal_scrn.vfx" );
}

_id_FE1F()
{
    self endon( "disconnect" );
    self endon( "removeAdrenaline" );
    self notify( "force_regeneration" );
    scripts\mp\gamelogic::_id_D580( self, 1 );
    _id_1184();
    self._id_118B = 1;
    self _meth_86CB();
    level thread scripts\mp\battlechatter_mp::_id_F756( self, "use_stim" );
    childthread _id_1187();
    childthread _id_1185();
    childthread _id_1186();
    self setclientomnvar( "ui_health_regen_hud", 1 );
    _func_0198( level._effect["adrenaline"], self, "tag_origin", self );
    return 1;
}

_id_C45B()
{
    if ( istrue( self._id_118B ) )
    {
        self notify( "removeAdrenaline" );
        self._id_118B = undefined;
    }
}

_id_AABD( var_0, var_1 )
{
    _id_C45B();
}

_id_AABB( var_0, var_1, var_2 )
{
    _id_FE1F();
    thread scripts\mp\battlechatter_mp::enemyuseadrenaline();
}

_id_6A71()
{
    return 8;
}

_id_1187()
{
    scripts\engine\utility::waittill_any_2( "death", "healed" );
    thread _id_C45B();
}

_id_1185()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( level.gametype == "br" && ( var_4 == "MOD_TRIGGER_HURT" || var_4 == "MOD_UNKNOWN" ) )
            continue;

        thread _id_C45B();
        return;
    }
}

_id_1186()
{
    level waittill( "game_ended" );
    thread _id_C45B();
}

_id_1184()
{
    if ( self.health >= self.maxhealth )
    {
        self._id_FE3F = 1;
        thread _id_1183();
    }
}

_id_1183()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "adrenaline_missionOnDeathThink" );
    self endon( "adrenaline_missionOnDeathThink" );
    self waittill( "death" );
    self._id_FE3F = undefined;
}
