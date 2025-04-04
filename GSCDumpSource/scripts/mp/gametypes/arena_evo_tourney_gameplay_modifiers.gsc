// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_81B5()
{
    _id_C1CC( "none", "arena", ::_id_4BF6, ::_id_4BF6 );
    _id_C1CC( "armor", "player", ::_id_6F08, ::_id_ED8F );
    _id_C1CC( "laststand", "player", ::_id_6F11, ::_id_ED92 );
    _id_C1CC( "plus_lethal", "player", ::_id_6F0D, ::_id_ED91 );
    _id_C1CC( "pistolonly", "player", ::_id_D320, ::_id_FA29 );
    _id_C1CC( "knifeonly", "player", ::_id_D3D6, ::_id_FA3F );
    _id_C1CC( "uav", "arena", ::_id_D3EF, ::_id_FA40 );
    _id_C1CC( "gammononly", "player", ::_id_D215, ::_id_F9BB );
    _id_C1CC( "doubledamage", "arena", ::_id_D2DC, ::_id_F9EA );
    _id_C1CC( "inf_ammo", "player", ::_id_D13C, ::_id_F9B2 );
    _id_C1CC( "cranked", "player", ::_id_D328, ::_id_FA2A );
    _id_C1CC( "sniperonly", "player", ::_id_D3A0, ::_id_FA3D );
    scripts\engine\utility::_id_0FB3( "decor_barrels_gameplay_flammable_debris", "vfx/iw8/prop/scriptables/decor_barrels_gameplay_flammable_debris.vfx" );
}

_id_C1CC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_431A ) )
        level._id_431A = [];

    var_4 = _func_0225( "mp/modcardtable.csv", 1, var_0 );
    var_5 = scripts\engine\utility::_id_EA4F( _func_021D( "mp/modcardtable.csv", 1, var_0, 1 ) );
    var_6 = "mod_card_odds_" + var_5;

    if ( getdvarint( "scr_disable_mod_card_" + var_0, 0 ) != 0 )
    {
        setdvarifuninitialized( var_6, 0 );
        return;
    }

    var_7 = int( _func_021D( "mp/modcardtable.csv", 1, var_0, 3 ) );

    if ( getdvarint( "scr_disable_all_mod_cards", 1 ) && !scripts\engine\utility::is_equal( var_0, "none" ) )
        var_7 = 0;

    setdvarifuninitialized( var_6, var_7 );
    var_8 = spawnstruct();
    var_8._id_7C71 = int( _func_021D( "mp/modcardtable.csv", 1, var_0, 0 ) );
    var_8._id_D563 = var_2;
    var_8._id_FA95 = var_3;
    var_8._id_19C8 = var_1;
    var_8._id_C17B = var_0;
    var_8._id_7212 = _func_021D( "mp/modcardtable.csv", 1, var_0, 4 );
    var_9 = getdvarint( var_6 );

    if ( _id_9FB2( var_8 ) )
        return;

    for ( var_10 = 0; var_10 < var_9; var_10++ )
        level._id_431A = scripts\engine\utility::array_add( level._id_431A, var_8 );

    if ( !isdefined( level._id_1A42 ) )
        level._id_1A42 = [];

    level._id_1A42[var_0] = var_5;
}

_id_9FB2( var_0 )
{
    var_1 = getdvarint( "scr_arena_evo_mod_card_set", -1 );

    if ( var_1 != -1 )
    {
        if ( !issubstr( var_0._id_7212, var_1 ) )
            return 1;
    }

    return 0;
}

_id_1A9C()
{
    if ( _id_431B() )
        [[ level._id_4147._id_D563 ]]();
}

_id_1AA1()
{
    if ( _id_431B() )
        [[ level._id_4147._id_FA95 ]]();
}

_id_1A9D()
{
    var_0 = self;

    if ( !_id_431B() )
        [[ level._id_4147._id_D563 ]]( var_0 );
}

_id_1AA2()
{
    var_0 = self;

    if ( !_id_431B() )
        [[ level._id_4147._id_FA95 ]]( var_0 );
}

_id_1AA0()
{
    _id_1AA1();

    foreach ( var_1 in level.players )
        var_1 thread _id_1AA2();
}

_id_431B()
{
    if ( !isdefined( level._id_4147 ) )
        return 0;

    if ( !scripts\engine\utility::is_equal( level._id_4147._id_19C8, "arena" ) )
        return 0;

    return 1;
}

_id_0E71()
{
    var_0 = 0;

    if ( !isdefined( level._id_BBF7 ) )
        level._id_BBF7 = [];

    if ( getdvarint( "scr_arena_evo_mod_every_round", 0 ) )
        var_0 = 1;

    if ( getdvar( "scr_arena_evo_force_card", "" ) != "" )
    {
        var_1 = getdvar( "scr_arena_evo_force_card", "" );

        if ( var_1 == "0" )
            var_1 = "";
    }
    else if ( getdvar( "scr_arena_evo_force_first_card", "" ) != "" )
    {
        var_1 = getdvar( "scr_arena_evo_force_first_card", "" );
        setdvar( "scr_arena_evo_force_first_card", "" );
    }
    else if ( !istrue( var_0 ) )
        var_1 = "none";
    else
        var_1 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1;

        foreach ( var_4 in level._id_431A )
        {
            if ( scripts\engine\utility::is_equal( var_2, var_4._id_C17B ) )
            {
                level._id_4147 = var_4;
                break;
            }
        }
    }
    else
    {
        var_6 = [];

        foreach ( var_8 in level._id_431A )
        {
            if ( scripts\engine\utility::array_contains( level._id_BBF7, var_8._id_C17B ) )
                continue;

            var_6[var_6.size] = var_8;
        }

        level._id_4147 = scripts\engine\utility::random( var_6 );
    }

    if ( !isdefined( level._id_4147 ) )
    {
        level._id_4147 = scripts\engine\utility::random( level._id_431A );
        level._id_BBF7 = [];
    }

    level._id_BBF7 = scripts\engine\utility::array_add( level._id_BBF7, level._id_4147._id_C17B );

    if ( level._id_BBF7.size >= 5 )
        level._id_BBF7 = scripts\engine\utility::array_remove( level._id_BBF7, level._id_BBF7[0] );

    foreach ( var_11 in level.players )
    {
        var_11._id_DC91 = 1;

        if ( scripts\engine\utility::is_equal( level._id_4147._id_19C8, "player" ) )
            var_11 _id_D196( level._id_4147 );
    }
}

_id_D196( var_0 )
{
    var_1 = self;

    if ( isdefined( var_1._id_4321 ) )
        [[ var_1._id_4321._id_FA95 ]]( var_1 );

    var_1._id_4321 = var_0;
}

_id_6F0D( var_0 )
{
    if ( !var_0 scripts\mp\utility\perk::_hasperk( "specialty_extra_deadly" ) )
        var_0 scripts\mp\utility\perk::_id_6FA5( "specialty_extra_deadly" );
}

_id_ED91( var_0 )
{
    if ( var_0 scripts\mp\utility\perk::_hasperk( "specialty_extra_deadly" ) )
        var_0 scripts\mp\utility\perk::removeperk( "specialty_extra_deadly" );
}

_id_4BF6()
{

}

_id_6F11( var_0 )
{
    var_0 _id_F70E( "specialty_pistoldeath" );
}

_id_ED92( var_0 )
{
    var_0 _id_F721( "specialty_pistoldeath" );
}

_id_F70E( var_0 )
{
    var_1 = self;

    if ( !var_1 scripts\mp\utility\perk::_hasperk( var_0 ) )
        var_1 scripts\mp\utility\perk::_id_6FA5( var_0 );
}

_id_F721( var_0 )
{
    var_1 = self;

    if ( var_1 scripts\mp\utility\perk::_hasperk( var_0 ) )
        var_1 scripts\mp\utility\perk::removeperk( var_0 );
}

_id_6F08( var_0 )
{
    _id_D324( var_0 );
}

_id_D324( var_0 )
{
    _id_07C1::_id_943C( var_0, 175, 0 );
}

_id_ED8F( var_0 )
{
    _id_07C1::_id_943E( var_0 );
}

_id_D320( var_0 )
{
    var_0 _id_D440( [ "s4_pi_mike1911" ] );
}

_id_FA29( var_0 )
{
    var_0 _id_FA45();
}

_id_D3A0( var_0 )
{
    var_0 _id_D440( [ "s4_mr_kalpha98" ], undefined, [ "snprscope_strong_kalpha98" ] );
}

_id_FA3D( var_0 )
{
    var_0 _id_FA45();
}

_id_D3D6( var_0 )
{
    var_0 _id_D440( [ "s4_me_fists" ], "equip_throwing_knife" );
}

_id_FA3F( var_0 )
{
    var_0 _id_FA45();
}

_id_D215( var_0 )
{
    var_0 _id_D440( [ "s4_me_fists" ], "equip_gammon_bomb" );
}

_id_F9BB( var_0 )
{
    var_0 _id_FA45();
}

_id_D3EF()
{
    level thread _id_CA09();
}

_id_FA40()
{
    level notify( "unset_uav_active" );

    if ( !getdvarint( "scr_arena_evo_minimap_enabled", 1 ) )
    {
        foreach ( var_1 in level.players )
            var_1 setclientomnvar( "ui_hide_minimap", 0 );
    }
}

_id_CA09( var_0 )
{
    level endon( "unset_uav_active" );

    if ( isdefined( var_0 ) )
    {
        var_1 = scripts\mp\gametypes\arena_evo_tourney_util::_id_668A( var_0 );
        level notify( "run_uav_" + var_0 );
        level endon( "run_uav_" + var_0 );
        level endon( "end_uav_" + var_0 );
    }
    else
        var_1 = level.players;

    for (;;)
    {
        wait 1;

        foreach ( var_3 in var_1 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_3._id_0332 = _func_00E0();
            var_3._id_022F = 0;
            var_3._id_01FD = 1;
            var_3._id_0331 = 0;
            var_3._id_0330 = "normal_radar";
            var_3 setclientomnvar( "ui_hide_minimap", 0 );
            var_3 setclientomnvar( "ui_show_hardcore_minimap", 1 );
            _func_024E( var_3 );
            var_3 _meth_85BE( 2 );
        }
    }
}

_id_D2DC()
{
    level._id_1A74 = 1;
}

_id_F9EA()
{
    level._id_1A74 = 0;
}

_id_D13C( var_0 )
{
    var_0 thread _id_EBEB();
}

_id_F9B2( var_0 )
{
    var_0 notify( "stop_sustain_all_ammo" );
}

_id_EBEB()
{
    self endon( "disconnect" );
    self endon( "stop_sustain_all_ammo" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = self getcurrentweapon();
        var_1 = getcompleteweaponname( var_0 );
        var_2 = 0;

        if ( isdefined( var_1 ) && _func_0120( var_1 ) )
            var_2 = weaponclipsize( var_1 );

        if ( var_2 > 0 )
            self setweaponammoclip( var_0, var_2 );

        waitframe();
        waitframe();
    }
}

_id_D328( var_0 )
{
    var_0._id_1A3B = 1;
    var_0 thread _id_D329();
}

_id_D329()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unset_player_cranked" );
    self notify( "set_player_cranked_internal" );
    self endon( "set_player_cranked_internal" );
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 0 );

    if ( scripts\mp\gametypes\arena_evo_tourney_util::_id_85E8( self.pers["team"] ) )
        return;

    var_0 = 5;
    var_1 = 15;
    var_2 = var_1 * 1000 + gettime();
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", var_2 );
    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 0 );
    childthread _id_10730( var_0, var_1 );
}

_id_10730( var_0, var_1 )
{
    wait( var_1 - var_0 );
    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 1 );
    wait( var_0 );
    var_2 = magicgrenademanual( "s4_frag_usa_mk2_mp", self.origin + ( 0, 0, 32 ), ( 0, 0, 0 ) );
    var_2 detonate();

    foreach ( var_4 in scripts\engine\utility::_id_634A( self.origin + ( 0, 0, 64 ), level.players, undefined, undefined, 300 ) )
    {
        if ( scripts\engine\utility::is_equal( var_4, self ) )
            continue;

        if ( !_func_01FD( self.origin + ( 0, 0, 64 ), var_4 geteye(), 0, self ) )
            continue;

        var_4 thread scripts\mp\weapons::_id_521C( 1 );
        var_4 dodamage( var_4.maxhealth + 1, self.origin + ( 0, 0, 64 ), self, self, "MOD_BURNED", "s4_frag_usa_mk2_mp" );
    }

    self dodamage( self.maxhealth + 1, self.origin + ( 0, 0, 64 ), self, self, "MOD_BURNED", "s4_frag_usa_mk2_mp" );
}

_id_4029( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2.elemtype = "timer";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2._id_2290 = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level.fontheight * var_1 );
    var_2.xoffset = 0;
    var_2.yoffset = 0;
    var_2.children = [];
    var_2.hidden = 0;
    return var_2;
}

_id_FA2A( var_0 )
{
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 0 );
    var_0 notify( "unset_player_cranked" );
    var_0._id_1A3B = 0;
}

_id_FA45()
{
    var_0 = self;
    var_0 notify( "unset_weapons_mod_override" );
    var_0._id_1A4A = undefined;
    var_0._id_1A4B = undefined;
}

_id_D440( var_0, var_1, var_2 )
{

}

_id_EBEC()
{
    var_0 = self;
    var_0 endon( "disconnect" );
    var_0 endon( "unset_weapons_mod_override" );
    var_1 = 3;

    while ( isdefined( var_0._id_1A4A ) )
    {
        if ( var_0 _meth_8109( var_0._id_1A4B ) < var_1 )
            var_0 setweaponammoclip( var_0._id_1A4B, var_1 );

        wait 0.125;
    }
}
