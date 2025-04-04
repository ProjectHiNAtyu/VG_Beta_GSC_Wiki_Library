// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_29EA = spawnstruct();
    level._id_29EA._id_CF19 = [];
    level._id_29EB = getdvarint( "scr_br_armory_kiosk", 1 ) != 0;

    if ( scripts\mp\gametypes\br_gametypes::_id_8839( "kiosk" ) )
    {
        level._id_29EB = 0;
        return;
    }

    if ( level._id_29EB )
    {
        _id_0778::_id_CEBF( "br_plunder_box", ::_id_1B5E );
        _id_0A71::_id_C279( ::_id_AA5E );
        _id_0C0B();
        _id_0C63();
        level thread _id_0DA4();
    }
}

_id_0C08()
{
    if ( getdvar( "scr_br_gametype", "" ) == "dmz" )
        setdvar( "br_kiosk_ignored_tab_nums", "2,5" );
    else
        setdvar( "br_kiosk_ignored_tab_nums", "3,4,5" );
}

_id_0C0B()
{
    var_0 = getdvarint( "br_kiosk_sales_discount", 0 );
    level._id_29EA._id_CAFC = int( clamp( var_0, 0, 100 ) );
    var_1 = getdvar( "br_kiosk_sales_discount_items", "" );
    level._id_29EA._id_CAFD = strtok( var_1, "," );
    var_2 = 20;
    var_3 = level._id_29EA._id_CAFC % var_2;

    if ( var_3 > 0 )
    {
        var_4 = int( floor( level._id_29EA._id_CAFC / var_2 ) * var_2 );
        var_5 = var_3 / var_2 >= 0.5;

        if ( var_5 )
            var_4 = var_4 + var_2;

        level._id_29EA._id_CAFC = int( var_4 );
    }

    if ( var_0 != level._id_29EA._id_CAFC )
        setdvar( "br_kiosk_sales_discount", level._id_29EA._id_CAFC );
}

_id_0B13( var_0, var_1 )
{
    if ( var_1 == 0 )
        return var_0;

    var_2 = ( 100 - var_1 ) * 0.01;
    return int( floor( var_0 * var_2 + 0.5 ) );
}

_id_0C63()
{
    var_0 = "mp/brKioskPurchases.csv";

    if ( getdvar( "scr_br_gametype", "" ) == "dmz" )
        var_0 = "mp/brKioskPurchases_DMZ.csv";

    var_1 = 0;
    var_2 = 1;
    var_3 = 2;
    var_4 = 3;
    var_5 = 9;
    var_6 = 10;
    level._id_29EA._id_8B1F = [];
    var_7 = tablelookupgetnumrows( var_0 );

    for ( var_8 = 0; var_8 < var_7; var_8++ )
    {
        var_9 = int( tablelookupbyrow( var_0, var_8, var_1 ) );
        var_10 = spawnstruct();
        var_10._id_048F = tablelookupbyrow( var_0, var_8, var_2 );
        var_10._id_C17B = tablelookupbyrow( var_0, var_8, var_3 );
        var_10._id_3D6D = int( tablelookupbyrow( var_0, var_8, var_4 ) );
        var_10._id_5B6B = int( tablelookupbyrow( var_0, var_8, var_5 ) );
        var_10._id_AFB7 = int( tablelookupbyrow( var_0, var_8, var_6 ) );

        if ( var_10._id_C17B == "supply_drop" )
        {
            var_11 = getdvarint( "scr_br_kiosk_supdropcost", 0 );

            if ( var_11 != 0 )
                var_10._id_3D6D = var_11;
        }

        if ( level._id_29EA._id_CAFC > 0 )
        {
            var_12 = level._id_29EA._id_CAFD.size == 0 || scripts\engine\utility::array_contains( level._id_29EA._id_CAFD, var_10._id_C17B );

            if ( var_12 )
                var_10._id_3D6D = _id_0B13( var_10._id_3D6D, level._id_29EA._id_CAFC );
        }

        if ( var_10._id_048F == "loadout_default" )
        {
            level._id_29EA._id_964F = var_10._id_3D6D;
            level._id_29EA._id_9650 = var_10._id_5B6B;
            level._id_29EA._id_9651 = var_10._id_AFB7;
            continue;
        }

        if ( var_10._id_048F == "loadout_custom" )
        {
            level._id_29EA._id_964C = var_10._id_3D6D;
            level._id_29EA._id_964D = var_10._id_5B6B;
            level._id_29EA._id_964E = var_10._id_AFB7;
            continue;
        }

        if ( var_10._id_048F == "teamrevive" )
        {
            level._id_29EA._id_EF9A = var_10._id_3D6D;
            level._id_29EA._id_EF9B = var_10._id_5B6B;
            level._id_29EA._id_EF9C = var_10._id_AFB7;
            continue;
        }

        level._id_29EA._id_8B1F[var_9] = var_10;
    }
}

_id_0BD3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 )
        return _id_0B13( var_0, var_2 );
    else if ( var_3 )
        return _id_0B13( var_0, var_4 );

    return var_0;
}

_id_0DA4()
{
    level endon( "game_ended" );
    setdvarifuninitialized( "scr_br_disable_kiosk_by_circle", 0 );

    for (;;)
    {
        level waittill( "br_circle_set" );
        var_0 = getdvarint( "scr_br_disable_kiosk_by_circle", 0 );

        if ( var_0 == 0 )
            continue;

        if ( level._id_29F5._id_370B + 1 >= var_0 )
        {
            _id_4A59();

            foreach ( var_2 in level.players )
            {
                if ( !isdefined( var_2 ) || !isalive( var_2 ) )
                    continue;

                var_2 thread scripts\mp\hud_message::showsplash( "br_kiosks_disabled" );
            }

            break;
        }
    }
}

_id_DC96( var_0 )
{
    var_1 = self;
    var_1 endon( "disconnect" );
    level endon( "game_ended" );

    if ( istrue( var_1._id_7591 ) )
        return;

    if ( !isdefined( level._id_29EA._id_CAFC ) )
        return;

    if ( level._id_29EA._id_CAFC == 0 )
        return;

    var_1._id_7591 = 1;

    if ( isdefined( var_0 ) && var_0 > 0 )
        wait( var_0 );

    if ( level._id_29EA._id_CAFD.size == 0 )
        var_1 thread scripts\mp\hud_message::showsplash( "br_sales_event_all" );
    else
        var_1 thread scripts\mp\hud_message::showsplash( "br_sales_event_selective" );
}

_id_AB6D()
{
    foreach ( var_1 in level._id_29EA._id_CF19 )
    {
        var_1 setscriptablepartstate( "br_plunder_box", "visible" );
        var_1._id_10415 = 1;
    }
}

_id_431E( var_0, var_1 )
{
    var_2 = var_1 * var_1;

    foreach ( var_4 in level._id_29EA._id_CF19 )
    {
        if ( isdefined( var_4._id_10415 ) && distance2dsquared( var_4.origin, var_0 ) > var_2 )
            _id_4A5D( var_4 );
    }
}

_id_4A59()
{
    foreach ( var_1 in level._id_29EA._id_CF19 )
    {
        if ( isdefined( var_1._id_10415 ) )
            _id_4A5D( var_1 );
    }
}

_id_4A5D( var_0 )
{
    var_0 setscriptablepartstate( "br_plunder_box", "disabled" );
    var_0._id_10415 = undefined;
    var_0._id_4A67 = 1;

    if ( var_0 scripts\mp\gametypes\br_quest_util::_id_34DA() )
        var_0 scripts\mp\gametypes\br_quest_util::_id_4768();
}

_id_688E()
{
    if ( !level._id_29EB )
        return;

    var_0 = _func_03BB( "scriptable_br_plunder_box", "classname" );
    return var_0;
}

_id_D6CC( var_0 )
{
    level._id_29EA._id_CF19 = var_0;
}

_id_1B5E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( istrue( level._id_609B ) )
        return;

    if ( !var_3 scripts\cp_mp\utility\player_utility::_id_0C14() || istrue( var_3._id_82AC ) )
        return;

    if ( var_3 scripts\cp_mp\utility\player_utility::_id_8AB5() )
        return;

    if ( var_3 scripts\cp_mp\utility\player_utility::isinvehicle() )
        return;

    if ( var_2 == "visible" )
    {
        var_0 setscriptablepartstate( "br_plunder_box", "opening" );
        var_0 thread _id_8DE6();
        var_3 thread _id_0CA2( var_0 );
    }
    else if ( var_2 == "opening" || var_2 == "open" )
        var_3 thread _id_0CA2( var_0 );
}

_id_8DE6()
{
    if ( !getdvarint( "scr_br_kiosk_fix_prone_players", 1 ) )
        return;

    var_0 = getdvarfloat( "scr_br_kiosk_fix_prone_players_radius", 300 );
    var_1 = _func_0409( level.players, self.origin, var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || !isalive( var_3 ) )
            continue;

        if ( var_3 getstance() != "prone" )
            continue;

        var_4 = var_3 _meth_86AB();
        var_0 = var_4[0];
        var_5 = 2.0 * var_4[2];

        if ( _func_0036( var_3.origin, var_0, var_5, undefined, 0, 0 ) )
            continue;

        var_3 setstance( "crouch", 1 );
    }
}

_id_8DEB( var_0, var_1 )
{
    if ( !isdefined( var_0._id_5B6C ) )
        var_0._id_5B6C = [ var_1 ];
    else if ( !scripts\engine\utility::array_contains( var_0._id_5B6C, var_1 ) )
        var_0._id_5B6C = scripts\engine\utility::array_add( var_0._id_5B6C, var_1 );

    if ( !var_0 scripts\mp\gametypes\br_quest_util::_id_34DA() )
        var_0 scripts\mp\gametypes\br_quest_util::_id_4018( "ui_mp_br_mapmenu_icon_poi_plunder_box_firesale", "active", var_0.origin );

    var_0 scripts\mp\gametypes\br_quest_util::_id_DCD9( var_1 );
}

_id_88DE( var_0, var_1 )
{
    if ( !isdefined( var_0._id_5B6C ) )
        return 0;

    return scripts\engine\utility::array_contains( var_0._id_5B6C, var_1 );
}

_id_8DE5( var_0, var_1 )
{
    if ( !isdefined( var_0._id_5B6C ) )
        return;

    var_0 scripts\mp\gametypes\br_quest_util::_id_78F9( var_1 );
    var_0._id_5B6C = scripts\engine\utility::array_remove( var_0._id_5B6C, var_1 );
}

_id_6AD0()
{
    return 180.0 + randomfloatrange( -10.0, 10.0 );
}

_id_0CA2( var_0 )
{
    var_1 = self;
    level endon( "game_ended" );
    var_1 endon( "disconnect" );
    var_1 endon( "death" );
    var_1._id_2A45 = var_0;

    if ( scripts\mp\gametypes\br_public::_id_8773() )
        var_1 notify( "kiosk_used" );

    var_2 = _id_88DE( var_0, var_1 );
    var_3 = var_1 scripts\mp\utility\perk::_hasperk( "specialty_br_cheaper_kiosk" );
    var_1 setclientomnvar( "ui_br_purchase_killstreak_response", 0 );

    if ( var_2 )
        var_1 setclientomnvar( "ui_br_open_purchase_killstreak", 2 );
    else if ( var_3 )
        var_1 setclientomnvar( "ui_br_open_purchase_killstreak", 3 );
    else
        var_1 setclientomnvar( "ui_br_open_purchase_killstreak", 1 );

    var_1._id_1B5D = 1;
    scripts\mp\gametypes\br_analytics::_id_2AD2( var_1, "menu_open" );
    var_1 thread _id_0DAD( var_0 );
    var_1 _meth_867D( "iw8_br_plunder_kiosk_menu" );
}

_id_0B78( var_0 )
{
    var_1 = self;
    var_1 setclientomnvar( "ui_br_purchase_killstreak_response", var_0 );
    var_1 setclientomnvar( "ui_br_open_purchase_killstreak", 0 );
    var_1 _meth_867E( "iw8_br_plunder_kiosk_menu" );
    var_1._id_2A45 = undefined;
    var_1._id_1B5D = undefined;
    scripts\mp\gametypes\br_analytics::_id_2AD2( var_1, "menu_close", "reason: " + var_0 );
}

_id_0C7B( var_0 )
{
    var_0 _id_0B78( 0 );
    var_0 notify( "_watchToAutoCloseMenu_end" );
}

_id_0DAD( var_0 )
{
    var_1 = self;
    var_1 endon( "disconnect" );
    var_1 notify( "_watchToAutoCloseMenu_end" );
    var_1 endon( "_watchToAutoCloseMenu_end" );
    var_1 childthread _id_0C7A( var_0 );
    scripts\engine\utility::_id_10886( var_1, "death", var_1, "last_stand_start", var_1, "pushed_too_far", level, "game_ended" );
    var_1 _id_0B78( 2 );
}

_id_0C7A( var_0 )
{
    var_1 = self;
    var_2 = 64;
    var_3 = getdvarfloat( "#x3d2a0dbe716dc8206", 128 ) + var_2;
    var_4 = var_3 * var_3;

    for (;;)
    {
        wait 0.1;
        var_5 = distancesquared( var_1.origin, var_0.origin );

        if ( var_5 > var_4 )
        {
            var_1 notify( "pushed_too_far" );
            break;
        }
    }
}

_id_0BD6( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = var_1 scripts\mp\equipment::_id_69F0( var_0 );
    var_3 = var_1 scripts\mp\equipment::_id_69F3( var_0 );
    return max( 0, var_3 - var_2 );
}

_id_0C37( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = var_1 scripts\mp\equipment::_id_69F0( var_0 );
    var_3 = var_1 scripts\mp\equipment::_id_69F3( var_0 );

    if ( var_2 < var_3 )
        var_1 scripts\mp\equipment::_id_D536( var_0, var_3 );
}

_id_0BB8( var_0 )
{
    var_1 = self;
    var_2 = var_1 scripts\mp\equipment::_id_69F6( "health" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = var_1 scripts\mp\equipment::_id_69F3( "equip_armorplate" );

    if ( getdvarint( "scr_br_alt_mode_gg", 0 ) )
        var_4 = 2;
    else
        var_4 = 5;

    var_5 = int( clamp( var_4, 0, var_3 - var_2 ) );
    var_6 = var_4 - var_5;

    if ( var_6 > 0 )
    {
        var_7 = undefined;

        if ( istrue( var_0 ) )
            var_7 = _id_6AD0();

        [var_9, var_10, var_11] = scripts\mp\gametypes\br_pickups::_id_6AAE( 0, var_1.origin, var_1.angles, var_1, var_7 );
        scripts\mp\gametypes\br_pickups::_id_E333( "brloot_armor_plate", var_9, var_10, var_6, 1, var_11 );
    }

    return var_5;
}

_id_0D8E( var_0, var_1 )
{
    var_2 = self;
    var_3 = _id_88DE( var_2._id_2A45, var_2 );
    var_4 = var_2 scripts\mp\utility\perk::_hasperk( "specialty_br_cheaper_kiosk" );
    var_5 = _id_0BD3( var_0._id_3D6D, var_3, var_0._id_5B6B, var_4, var_0._id_AFB7 );

    if ( var_2._id_B943 < var_5 )
    {
        var_2 _id_0B78( 3 );
        return 0;
    }

    if ( var_0._id_048F == "killstreak" )
    {
        if ( !istrue( var_1 ) )
        {
            if ( var_2 scripts\mp\gametypes\br_pickups::_id_755E( var_0._id_C17B ) )
            {
                var_2 _id_0B78( 4 );
                return 0;
            }
        }
    }
    else if ( var_0._id_048F == "fieldupgrade" )
    {
        if ( var_2 scripts\mp\supers::_id_8A5F() )
        {
            var_2 _id_0B78( 6 );
            return 0;
        }

        if ( !istrue( var_1 ) )
        {
            var_6 = var_2 scripts\mp\supers::_id_6991();

            if ( isdefined( var_6 ) && var_0._id_C17B == var_6 )
            {
                var_2 _id_0B78( 5 );
                return 0;
            }
        }
    }
    else if ( var_0._id_048F == "special" )
    {
        switch ( var_0._id_C17B )
        {
            case "armor_bundle":
            case "armor":
                break;
            case "gas_mask":
                var_7 = spawnstruct();
                var_7._id_CF15 = "brloot_equip_gasmask";
                var_8 = scripts\mp\gametypes\br_pickups::_id_31CB( var_7 );
                break;
            case "ammo_refill":
                var_9 = 0;

                if ( var_2 _id_0BD6( var_2._id_5532["primary"] ) > 0 )
                    var_9 = 1;
                else if ( var_2 _id_0BD6( var_2._id_5532["secondary"] ) > 0 )
                    var_9 = 1;
                else if ( !var_2 scripts\mp\gametypes\br_weapons::_id_29DD() )
                    var_9 = 1;

                if ( !var_9 )
                {
                    var_2 _id_0B78( 8 );
                    return 0;
                }

                break;
            case "respawn_token":
                if ( scripts\mp\gametypes\br_pickups::_id_C6BA() )
                {
                    var_2 _id_0B78( 9 );
                    return 0;
                }

                if ( istrue( var_2._id_7588 ) )
                {
                    var_2 _id_0B78( 10 );
                    return 0;
                }

                break;
            case "self_revive_token":
                if ( var_2 scripts\mp\gametypes\br_public::_id_7593() )
                {
                    var_2 _id_0B78( 10 );
                    return 0;
                }

                break;
            case "supply_drop":
                var_7 = spawnstruct();
                var_7._id_CF15 = "brloot_offhand_advancedsupplydrop";
                var_7._id_010E = 1;
                var_8 = scripts\mp\gametypes\br_pickups::_id_31CB( var_7 );

                if ( var_8 != 1 )
                {
                    var_2 _id_0B78( 7 );
                    return 0;
                }

                break;
        }
    }

    return 1;
}

_id_0C1C( var_0 )
{
    switch ( var_0 )
    {
        case "precision_airstrike":
        case "toma_strike":
            return 1;
        case "uav":
            return 0;
        default:
            return 0;
    }
}

_id_0C2B()
{
    var_0 = self;
    scripts\engine\utility::_id_10886( var_0, "death", level, "game_ended" );
    var_0 notify( "cancel_location" );
}

_id_0BF2( var_0, var_1 )
{
    var_2 = self;
    var_2 endon( "disconnect" );
    var_3 = getdvarint( "scr_br_activateKSOnPurchase", 0 );

    if ( !var_3 )
    {
        var_2 scripts\mp\gametypes\br_pickups::_id_5E86( var_0._id_C17B, var_1, 1 );
        var_2 _id_0C31( var_0._id_3D6D, var_0._id_5B6B, var_0._id_AFB7 );
        var_2 thread scripts\mp\hud_message::showsplash( "br_killstreak_purchased" );
        var_2 _id_0793::_id_AB09( "killstreak", var_0._id_C17B );
        scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_0._id_3D6D, "killstreak", var_0._id_C17B );
    }
    else
    {
        if ( _id_0C1C( var_0._id_C17B ) )
        {
            var_4 = var_2._id_2A45;
            var_2 _id_0B78( 16 );
            var_2 scripts\cp_mp\utility\player_utility::_id_0BC4( 1 );
            var_2 _meth_8025( 0, 0, 0, 0, 4 );
            var_2 childthread _id_0C2B();
            var_5 = var_2 _id_0A2B::_id_108B9( "confirm_location", "cancel_location" );
            var_2 _meth_80E7();
            var_2 scripts\cp_mp\utility\player_utility::_id_0BC4( 0, 1 );

            if ( isdefined( var_5 ) && var_5._id_EA4F == "confirm_location" )
            {
                var_6 = scripts\mp\gametypes\br::_id_F3CE( var_5._id_96B8 );
                var_2._id_8E3A = var_6["position"];
                var_7 = var_2 scripts\mp\gametypes\br_pickups::_id_5EB5( var_0._id_C17B );

                if ( istrue( var_7 ) )
                {
                    var_2 _id_0C31( var_0._id_3D6D, var_0._id_5B6B, var_0._id_AFB7 );
                    var_2 thread scripts\mp\hud_message::showsplash( "br_killstreak_purchased_and_activated" );
                    _id_0793::_id_AB09( "killstreak", var_0._id_C17B );
                    scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_0._id_3D6D, "killstreak", var_0._id_C17B );
                    return;
                }

                return;
            }

            var_2 thread _id_0CA2( var_4 );
            return;
            return;
        }

        var_2 scripts\mp\gametypes\br_pickups::_id_5E86( var_0._id_C17B, var_1, 1 );
        var_7 = var_2 scripts\mp\gametypes\br_pickups::_id_5EB5( var_0._id_C17B );

        if ( istrue( var_7 ) )
        {
            var_2 _id_0C31( var_0._id_3D6D, var_0._id_5B6B, var_0._id_AFB7 );
            var_2 thread scripts\mp\hud_message::showsplash( "br_killstreak_purchased_and_activated" );
            _id_0793::_id_AB09( "killstreak", var_0._id_C17B );
            scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_0._id_3D6D, "killstreak", var_0._id_C17B );
        }
    }
}

_id_0BF3( var_0, var_1 )
{
    var_2 = self;
    var_3 = 1;
    var_4 = 1;
    var_5 = undefined;

    switch ( var_0._id_C17B )
    {
        case "armor":
            var_3 = scripts\mp\gametypes\br_pickups::_id_2A20( var_2, "brloot_armor_plate", 1, undefined, 1 );
            break;
        case "armor_bundle":
            var_6 = var_2 _id_0BB8( 1 );

            if ( var_6 <= 0 )
                var_3 = 1;
            else
                var_3 = scripts\mp\gametypes\br_pickups::_id_2A20( var_2, "brloot_armor_plate", 1, var_6, 1 );

            break;
        case "gas_mask":
            var_3 = scripts\mp\gametypes\br_pickups::_id_2A20( var_2, "brloot_equip_gasmask", 1, undefined, 1 );
            break;
        case "ammo_refill":
            var_2 scripts\mp\gametypes\br_weapons::_id_29DE();
            var_2 _id_0C37( var_2._id_5532["primary"] );
            var_2 _id_0C37( var_2._id_5532["secondary"] );
            break;
        case "respawn_token":
            var_2 scripts\mp\gametypes\br_pickups::_id_10F9();
            var_4 = 0;
            break;
        case "self_revive_token":
            var_2 scripts\mp\gametypes\br_pickups::_id_1100();
            var_4 = 0;
            break;
        case "supply_drop":
            var_3 = scripts\mp\gametypes\br_pickups::_id_2A20( var_2, "brloot_offhand_advancedsupplydrop", 1, undefined, 1 );
            break;
        default:
            break;
    }

    if ( var_3 )
    {
        var_2 _id_0C31( var_0._id_3D6D, var_0._id_5B6B, var_0._id_AFB7 );

        if ( var_4 )
            var_2 thread scripts\mp\hud_message::showsplash( "br_item_purchased" );

        _id_0793::_id_AB09( "special", var_0._id_C17B );
        scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_0._id_3D6D, "special", var_0._id_C17B );
    }
}

_id_0BF4( var_0, var_1 )
{
    var_2 = ( 1, 1, 1 );
    var_3 = ( 1, 0, 0 );
    var_4 = ( 0, 1, 0 );
    var_5 = ( 0, 1, 1 );
    var_6 = 3;
    var_7 = 8;
    var_8 = self._id_2A45.origin;

    if ( !scripts\cp_mp\vehicles\vehicle_tracking::_id_31BB() )
        return 0;

    if ( scripts\cp_mp\utility\player_utility::isinvehicle( 1 ) )
        return 0;

    var_9 = physics_createcontents( [ "physicscontents_water", "physicscontents_item", "physicscontents_vehicleclip" ] );
    var_10 = 300;
    var_11 = 90;
    var_12 = 300;
    var_13 = 150;
    var_14 = var_13 + var_10;
    var_15 = 0;
    var_16 = undefined;
    var_17 = undefined;

    for ( var_18 = undefined; var_15 < 360; var_15 = var_15 + var_11 )
    {
        var_19 = var_8 + ( sin( var_15 ) * var_10, cos( var_15 ) * var_10, 0 );
        var_16 = ( var_19[0], var_19[1], var_19[2] + var_14 );
        var_17 = ( var_19[0], var_19[1], var_19[2] - var_14 );
        var_20 = _func_02BD( var_16, var_17, var_12, var_9, undefined, "physicsquery_closest" );

        if ( var_20.size > 0 )
        {
            var_21 = var_20[0]["position"];
            var_17 = ( var_16[0], var_16[1], var_20[0]["shape_position"][2] - var_10 );

            if ( !isdefined( var_20[0]["entity"] ) && abs( var_17[2] - var_19[2] ) < var_13 )
            {
                if ( !isdefined( var_18 ) )
                {
                    var_18 = var_17 + ( 0, 0, var_10 );

                    if ( !getdvarint( "scr_vehicleKioskFindAllSpawns", 0 ) > 0 )
                        break;
                }
            }
            else
            {

            }

            continue;
        }
    }

    if ( !isdefined( var_18 ) )
        return 0;

    var_22 = 150;
    var_23 = spawnstruct();
    var_23.origin = var_18 + ( 0, 0, var_22 );
    var_23.angles = ( 0, randomintrange( 0, 360 ), 0 );
    var_23.owner = self;
    var_23.spawntype = "GAME_MODE";
    var_24 = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_spawnvehicle( var_0._id_C17B, var_23 );

    if ( !isdefined( var_24 ) )
        return 0;

    var_25 = scripts\cp_mp\vehicles\vehicle_occupancy::_id_10193( var_24 );
    thread scripts\cp_mp\vehicles\vehicle_occupancy::_id_1017C( var_24, var_25, self );
    scripts\cp_mp\vehicles\vehicle_spawn::_id_10286( var_24 );
    return 1;
}

_id_AA5E( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2._id_2A45;

    if ( !istrue( var_2._id_1B5D ) )
        return;

    var_4 = "channel: " + var_0;

    if ( isdefined( var_1 ) )
        var_4 = var_4 + ", index: " + var_1;

    scripts\mp\gametypes\br_analytics::_id_2AD2( var_2, "menu_purchase", var_4 );
    var_5 = getdvarint( "scr_br_kioskPurchaseDropItems", 1 );

    if ( var_0 == "br_cancel_purchase" )
        _id_0C7B( var_2 );
    else if ( var_0 == "br_item_purchase" )
    {
        var_6 = var_1;
        var_7 = level._id_29EA._id_8B1F[var_6];
        var_8 = var_2 _id_0D8E( var_7, var_5 );

        if ( var_8 )
        {
            if ( var_7._id_048F == "killstreak" )
                var_2 thread _id_0BF2( var_7, var_5 );
            else if ( var_7._id_048F == "fieldupgrade" )
            {
                var_2 scripts\mp\gametypes\br_pickups::_id_5E87( var_7._id_C17B, var_5, 1 );
                var_2 _id_0C31( var_7._id_3D6D, var_7._id_5B6B, var_7._id_AFB7 );
                var_2 thread scripts\mp\hud_message::showsplash( "br_field_upgrade_purchased" );
                _id_0793::_id_AB09( "fieldUpgrade", var_7._id_C17B );
                scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_7._id_3D6D, "fieldUpgrade", var_7._id_C17B );

                if ( level._id_15B0 )
                    var_2 scripts\mp\supers::_id_6FDC( var_2 scripts\mp\supers::_id_6D85() );
            }
            else if ( var_7._id_048F == "special" )
                var_2 _id_0BF3( var_7, var_5 );
            else if ( var_7._id_048F == "vehicle" )
            {
                var_9 = var_2 _id_0BF4( var_7, var_5 );

                if ( var_9 )
                {
                    var_2 _id_0C31( var_7._id_3D6D, var_7._id_5B6B, var_7._id_AFB7 );
                    var_2 thread scripts\mp\hud_message::showsplash( "br_vehicle_purchased" );
                    scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_7._id_3D6D, "vehicle", var_7._id_C17B );
                }
                else
                    var_2 scripts\mp\hud_message::_id_DC9F( "MP/VEHICLE_PURCHASE_FAILED" );
            }
        }
    }
    else if ( var_0 == "br_loadout_purchase" )
    {
        var_10 = _id_88DE( var_2._id_2A45, var_2 );
        var_11 = var_2 scripts\mp\utility\perk::_hasperk( "specialty_br_cheaper_kiosk" );
        var_12 = 0;
        var_13 = var_1;
        var_14 = level._id_29EA._id_964C;
        var_15 = level._id_29EA._id_964D;
        var_16 = level._id_29EA._id_964E;

        if ( _id_07C9::_id_88F6( var_13 ) )
        {
            var_14 = level._id_29EA._id_964F;
            var_15 = level._id_29EA._id_9650;
            var_16 = level._id_29EA._id_9651;
            var_12 = 1;
        }

        var_17 = _id_0BD3( var_14, var_10, var_15, var_11, var_16 );

        if ( var_2._id_B943 < var_17 )
        {
            var_2 _id_0B78( 3 );
            return;
        }

        var_18 = _id_07C9::_id_6941( var_13 );
        scripts\mp\gametypes\br_analytics::_id_2AD1( self, "purchasing_new_loadout" );
        var_2.pers["class"] = var_18;
        var_2.class = var_18;
        var_19 = var_2 scripts\mp\class::_id_BB8A( var_18 );
        scripts\mp\gametypes\br::_id_2A29( var_2, var_5 );
        var_2 _id_0C31( var_14, var_15, var_16 );
        var_2 thread scripts\mp\hud_message::showsplash( "br_loadout_purchased" );

        if ( istrue( var_12 ) )
            scripts\mp\gametypes\br_analytics::_id_2AD3( self, var_17, "defaultLoadout", "loadout_" + var_13 );
        else
            scripts\mp\gametypes\br_analytics::_id_2AD4( self, var_17, var_19 );
    }
    else if ( var_0 == "br_team_revive" )
    {
        var_20 = var_1;
        var_10 = _id_88DE( var_2._id_2A45, var_2 );
        var_15 = level._id_29EA._id_EF9B;
        var_11 = var_2 scripts\mp\utility\perk::_hasperk( "specialty_br_cheaper_kiosk" );
        var_16 = level._id_29EA._id_EF9C;
        var_21 = istrue( var_2._id_7588 );
        var_22 = _id_0BD3( level._id_29EA._id_EF9A, var_10, var_15, var_11, var_16 );

        if ( !var_21 && var_2._id_B943 < var_22 )
        {
            var_2 _id_0B78( 3 );
            return 0;
        }

        var_23 = undefined;
        var_24 = scripts\mp\utility\teams::_id_6DAC( var_2.team, "players" );

        foreach ( var_26 in var_24 )
        {
            if ( !isdefined( var_26 ) || var_26 == var_2 )
                continue;

            if ( isdefined( var_26._id_2A96 ) && var_26._id_2A96 == var_20 )
            {
                var_23 = var_26;
                break;
            }
        }

        if ( !isdefined( var_23 ) )
        {
            var_2 _id_0B78( 12 );
            return;
        }

        if ( !var_23 scripts\mp\gametypes\br_public::_id_87FE() && !getdvarint( "scr_br_all_assassin_version", 0 ) )
        {
            if ( scripts\mp\gametypes\br_public::_id_89E8( var_23 ) )
                var_2 _id_0B78( 14 );
            else if ( isalive( var_23 ) )
                var_2 _id_0B78( 15 );
            else
                var_2 _id_0B78( 13 );

            return;
        }

        if ( !var_21 )
        {
            var_28 = level._id_29EA._id_EF9A;
            var_15 = level._id_29EA._id_EF9B;
            var_16 = level._id_29EA._id_EF9C;
            var_2 _id_0C31( var_28, var_15, var_16 );
            var_2 scripts\mp\gametypes\br_pickups::_id_10F9( 1 );
            var_2 _id_0793::_id_AB09( "teamrevive", "teamrevive" );
            scripts\mp\gametypes\br_analytics::_id_2AD3( var_2, var_22, "teamrevive_money", "teamrevive" );
        }
        else
        {
            var_2 _id_0C31( 0, 0, 0 );
            var_2 _id_0793::_id_AB09( "teamrevive", "teamrevive" );
            scripts\mp\gametypes\br_analytics::_id_2AD3( var_2, 0, "teamrevive_token", "teamrevive" );
        }

        var_23 thread scripts\mp\gametypes\br_gulag::_id_B6B3( var_2, var_21 );
        level thread scripts\mp\gametypes\br_quest_util::_id_FF1F( var_3.origin, "revive" );
        var_2 thread scripts\mp\hud_message::showsplash( "br_squadmate_revived" );
    }
}

_id_0C31( var_0, var_1, var_2 )
{
    var_3 = self;
    var_4 = _id_88DE( var_3._id_2A45, var_3 );
    var_5 = var_3 scripts\mp\utility\perk::_hasperk( "specialty_br_cheaper_kiosk" );

    if ( var_4 && var_1 > 0 )
        _id_8DE5( var_3._id_2A45, var_3 );

    if ( !scripts\mp\gametypes\br_public::_id_873E() )
        var_3 thread _id_0A76::_id_6FE6( "br_kioskBuy", undefined, scripts\mp\gametypes\br::_id_2ECE( var_0 ) );

    var_0 = _id_0BD3( var_0, var_4, var_1, var_5, var_2 );

    if ( var_0 > 0 )
        var_3 scripts\mp\gametypes\br_plunder::_id_B73D( var_0 );

    level._id_2A75._id_8DE3 = level._id_2A75._id_8DE3 + var_0;
    level._id_2A75._id_8DE2++;
    var_3 _id_0B78( 1 );
}
