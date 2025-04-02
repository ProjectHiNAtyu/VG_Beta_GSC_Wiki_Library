// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_A16F()
{
    _id_95A4();
    var_0 = getentarray( "player_mortar", "targetname" );

    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        _id_D886();
        _id_D887();
    }
    else
        return;

    foreach ( var_2 in var_0 )
    {
        if ( istrue( level._id_8920 ) )
        {
            if ( !isdefined( scripts\cp_mp\utility\game_utility::_id_6AF9() ) || isdefined( scripts\cp_mp\utility\game_utility::_id_6AF9() ) && isdefined( var_2._id_0375 ) && var_2._id_0375 != level._id_96B5 )
            {
                var_2 delete();
                continue;
            }
        }

        var_2 thread _id_A179( var_2 );
    }
}

_id_95A4()
{
    level._effect["vfx_flare_launch"] = loadfx( "vfx/iw8/level/embassy/vfx_mortar_fire.vfx" );
    level._effect["vfx_mortar_trail"] = loadfx( "vfx/iw8/level/highway/vfx_mortar_trail.vfx" );
    level._effect["vfx_mortar_explosion"] = loadfx( "vfx/iw8/weap/_explo/mortar/vfx_mortar_explosion_bm.vfx" );
}

#using_animtree("script_model");

_id_D887()
{
    level._id_CC27["player_mortar"] = #animtree;
    level._id_CC24["player_mortar"]["player_mortar_fire"] = %emb_vm_mortar_player;
    level._id_CC25["player_mortar"]["player_mortar_fire"] = "emb_vm_mortar_player";
    level._id_CC2E["player_mortar"]["player_mortar_fire"] = "player_mortar_fire";
    level._id_CC3C["player_mortar"]["player_mortar_fire"] = "emb_vm_mortar_player";
}

_id_D886()
{
    level._id_CC27["mortar"] = #animtree;
    level._id_CC35["mortar"] = "misc_wm_mortar";
    level._id_CC24["mortar"]["player_mortar_fire"] = %emb_vm_mortar_mortar;
    level._id_CC25["mortar"]["player_mortar_fire"] = "emb_vm_mortar_mortar";
    level._id_CC3C["mortar"]["player_mortar_fire"] = "emb_vm_mortar_mortar";
}

_id_3F3B( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0._id_1887 = var_1;
    var_0 _meth_8281( var_0.origin );
    var_4 = spawn( "script_arms", var_0.origin, 0, 0, var_0 );
    var_4.player = var_0;
    var_0._id_B591 = var_4;
    var_0._id_B591 hide();
    var_0._id_B591._id_1887 = var_1;
    var_0._id_B591 useanimtree( #animtree );
}

_id_BE59( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_6 scripts\common\utility::_id_14F7( 0 );
    var_6 scripts\common\utility::_id_1548( 0 );
    var_6 scripts\common\utility::_id_1508( 0 );
    var_6 scripts\common\utility::_id_156B( 0 );

    if ( var_1 > 0.0 )
    {
        var_6 playerlinktoblend( var_0, "tag_player", var_1, 0, 0 );
        wait( var_1 );
    }

    var_6 playerlinktodelta( var_0, "tag_player", 1, var_2, var_3, var_4, var_5, 1 );
}

_id_ED95( var_0 )
{
    var_0 scripts\common\utility::_id_1565( 1, "mortar" );
    var_0 scripts\common\utility::_id_14F7( 1 );
    var_0 scripts\common\utility::_id_1548( 1 );
    var_0 scripts\common\utility::_id_1508( 1 );
    var_0 scripts\common\utility::_id_156B( 1 );
    var_0 unlink();
    var_0._id_B591 delete();
}

_id_A16D( var_0, var_1 )
{
    if ( !istrue( level._id_8920 ) )
        var_1 playsound( "weap_mortar_load" );

    wait 2.2;
    var_0 playrumbleonentity( "damage_bullet" );
    earthquake( 0.24, 1, var_1.origin, 256 );
    var_1 hidepart( var_1._id_D9B9, "misc_wm_mortar" );
}

_id_A22C( var_0, var_1, var_2, var_3, var_4 )
{
    setdvarifuninitialized( "#x3eff49db0df794079", "0 " );

    if ( getdvarint( "#x3eff49db0df794079" ) )
    {
        var_0.origin = var_1;
        var_5 = getdvarint( "#x3f7e9b59e29bb9d7e" );
        var_6 = distance( var_1, var_2 );
        var_7 = var_2 - var_1;
        var_8 = 0.5 * var_5 * _func_0214( var_3 ) * -1;
        var_9 = ( var_7[0] / var_3, var_7[1] / var_3, ( var_7[2] - var_8 ) / var_3 );
        var_0 _meth_8237( var_9, var_3 );
        var_10 = gettime() + var_3 * 1000;

        while ( gettime() < var_10 )
        {
            var_0 _id_1768();
            waitframe();
        }
    }
    else
    {
        var_11 = 1200;

        if ( isdefined( var_4 ) )
            var_11 = var_4;

        var_12 = 1 / ( var_3 / 0.05 );
        var_13 = 0;

        while ( var_13 < 1 )
        {
            var_0.origin = scripts\engine\math::_id_668F( var_1, var_2, var_11, var_13 );
            var_0 _id_1768();
            var_13 = var_13 + var_12;
            wait 0.05;
        }

        var_0.origin = var_2;
    }
}

_id_1768()
{
    if ( !isdefined( self._id_BC43 ) )
    {
        self._id_BC43 = self.origin;
        self._id_C8B9 = 0;
        return;
    }

    self.angles = vectortoangles( self.origin - self._id_BC43 );
    self._id_BC43 = self.origin;
}

_id_A179( var_0 )
{
    if ( !istrue( level._id_8920 ) )
        var_0._id_8312 = _id_A180( var_0.origin + ( 0, 0, 40 ), "HINT_BUTTON", undefined, &"CP_DWN_TWN_OBJECTIVES/ROOF_DEFEND", undefined, undefined, "show", 50, 160, 32, 120 );
    else
        var_0._id_8312 = _id_A180( var_0.origin + ( 0, 0, 40 ), "HINT_BUTTON", undefined, &"MP_INGAME_ONLY/USE_MORTAR", undefined, undefined, "show", 256, 160, 128, 160 );

    var_0._id_01B0 = "j_shaft_top";
    var_0._id_D9B9 = "j_mortar_shell";
    var_0 hidepart( var_0._id_D9B9, "misc_wm_mortar" );
    var_0._id_1887 = "mortar";
    var_0 useanimtree( #animtree );
    var_0._id_A975 = var_0.angles;

    for (;;)
    {
        var_0._id_8312 makeuseable();
        var_0._id_8312 waittill( "trigger", var_1 );
        var_1 scripts\common\utility::_id_1562( 0 );
        var_0._id_8312 makeunusable();
        _id_B520( var_1, var_0 );
        wait 5;
        var_0 rotateto( var_0._id_A975, 0.1 );
        wait 1;
    }
}

_id_B520( var_0, var_1 )
{
    self endon( "death_or_disconnect" );
    var_0 setorigin( var_1.origin );
    var_0 setplayerangles( var_1.angles );
    var_0 _id_3F3B( var_0, "player_mortar" );
    var_0._id_B591.angles = var_1.angles;
    _id_BE59( var_0._id_B591, 0.5, 0, 0, 0, 0, var_0 );
    var_0 scripts\common\utility::_id_1565( 0, "mortar" );
    var_2 = var_0 _id_A177( var_1 );

    if ( isdefined( var_2 ) )
    {
        var_0 playerlinktodelta( var_0._id_B591, "tag_player", 1, 0, 0, 0, 0, 1 );
        var_3 = vectortoangles( var_2 - var_1.origin );
        var_1.angles = ( 0, var_3[1], 0 );
        var_1 showpart( var_1._id_D9B9, "misc_wm_mortar" );
        var_0._id_B591 show();
        var_1 scripts\engine\utility::_id_46C3( 2.25, ::_id_90CB, var_2, var_0 );
        thread _id_A16D( var_0, var_1 );
        var_1 thread _id_069D::_id_1813( [ var_1, var_0._id_B591 ], "player_mortar_fire" );
        var_0._id_B591 waittillmatch( "single anim", "end" );
        var_1 notify( "mortar_fired" );
    }

    var_0 scripts\common\utility::_id_1562( 1 );
    var_1 hidepart( var_1._id_D9B9, "misc_wm_mortar" );
    _id_ED95( var_0 );

    if ( isdefined( var_1._id_BC3B ) )
        var_1._id_BC3B delete();
}

_id_A177( var_0 )
{
    self endon( "death_or_disconnect" );
    thread _id_A173( var_0 );
    var_1 = undefined;
    self playerlinktodelta( self._id_B591, "tag_player", 0, 45, 45, 60, 60, 1 );

    if ( isdefined( var_0._id_BC3B ) )
        var_0._id_BC3B setscriptablepartstate( "target", "active" );

    for (;;)
    {
        if ( self stancebuttonpressed() || self attackbuttonpressed() )
        {
            if ( self attackbuttonpressed() )
            {
                while ( self attackbuttonpressed() )
                    wait 0.05;

                return var_1;
            }

            while ( self stancebuttonpressed() )
                wait 0.05;

            return undefined;
        }

        var_2 = scripts\engine\trace::ray_trace( self geteye() + ( 0, 0, 128 ), self geteye() + anglestoforward( self getplayerangles() ) * 16000 );
        var_1 = getgroundposition( var_2["position"], 8, 0, 1500 );
        var_3 = vectortoangles( var_1 - var_0.origin );
        var_0.angles = ( 0, var_3[1], 0 );

        if ( !isdefined( var_0._id_BC3B ) )
        {
            var_0._id_BC3B = spawn( "script_model", var_1 );
            var_0._id_BC3B setmodel( "mortar_target" );
            var_0._id_BC3B.angles = ( -90, 0, 0 );
            var_0._id_BC3B setscriptablepartstate( "target", "active" );

            foreach ( var_5 in level.players )
                var_0._id_BC3B hidefromplayer( var_5 );

            var_0._id_BC3B showtoplayer( self );
        }

        var_0._id_BC3B moveto( var_1 + ( 0, 0, 10 ), 0.1 );
        wait 0.05;
    }
}

_id_A173( var_0 )
{
    var_0 endon( "mortar_fired" );
    self waittill( "death_or_disconnect" );

    if ( isdefined( var_0._id_BC3B ) )
        var_0._id_BC3B delete();
}

_id_90CB( var_0, var_1 )
{
    var_2 = self gettagorigin( "j_shaft_top" );
    var_3 = getgroundposition( self.origin + anglestoforward( self.angles ) * 8000, 8, 1000 );

    if ( isdefined( var_0 ) )
        var_3 = var_0;

    var_4 = scripts\engine\utility::spawn_tag_origin( self gettagorigin( "j_shaft_top" ), ( 0, 0, 0 ) );
    var_4 setmodel( "equipment_mortar_shell_improvised_01_mp" );
    playfx( scripts\engine\utility::getfx( "vfx_flare_launch" ), self.origin + ( 0, 0, 3 ) + anglestoforward( self.angles ) * 8, anglestoforward( self.angles ) );

    if ( !istrue( level._id_8920 ) )
        playsoundatpos( self gettagorigin( "j_shaft_top" ), "weap_mortar_flare_launch" );
    else
        playsoundatpos( self gettagorigin( "j_shaft_top" ), "weap_mortar_flare_launch" );

    var_4 show();
    var_5 = 5;
    thread _id_A22C( var_4, var_2, var_3, var_5, 1200 );
    wait 0.1;
    playfxontag( scripts\engine\utility::getfx( "vfx_mortar_trail" ), var_4, "tag_origin" );

    if ( !istrue( level._id_8920 ) )
        var_4 playloopsound( "weap_mortar_fly_lp" );
    else
        var_4 playloopsound( "weap_mortar_fly_lp" );

    wait( var_5 - 1.7 );

    if ( !istrue( level._id_8920 ) )
        var_4 playsound( "weap_mortar_incoming" );

    wait 1.7;
    stopfxontag( scripts\engine\utility::getfx( "vfx_mortar_trail" ), var_4, "tag_origin" );
    var_4 stoploopsound();
    playfx( scripts\engine\utility::getfx( "vfx_mortar_explosion" ), var_3 );
    earthquake( 0.25, 3, var_3, 2048 );

    if ( !istrue( level._id_8920 ) )
        playrumbleonposition( "cp_chopper_rumble", var_3 );
    else
    {
        playrumbleonposition( "grenade_rumble", var_3 );
        playsoundatpos( var_3, "weap_mortar_expl_trans" );
    }

    magicgrenademanual( "mortar_mp", var_3 + ( 0, 0, 5 ), ( 0, 0, 0 ), 0.05 );

    if ( !istrue( level._id_8920 ) )
        _func_01B5( var_3 + ( 0, 0, 5 ), 512, 250, 250, var_1, "MOD_EXPLOSIVE", "s4_c4_mp" );
    else
        _func_01B5( var_3 + ( 0, 0, 5 ), 512, 1000, 250, var_1, "MOD_EXPLOSIVE", "s4_c4_mp" );

    var_4 delete();
}

_id_8D1E()
{
    self._id_BC3B setscriptablepartstate( "target", "neutral" );
}

_id_A180( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = undefined;

    if ( isdefined( var_11 ) )
        var_12 = var_11;
    else
        var_12 = spawn( "script_model", var_0 );

    var_12 makeuseable();

    if ( isdefined( var_11 ) && isdefined( var_0 ) )
        var_12 _meth_84D6( var_0 );

    if ( isdefined( var_1 ) )
        var_12 setcursorhint( var_1 );
    else
        var_12 setcursorhint( "HINT_NOICON" );

    if ( isdefined( var_2 ) )
        var_12 _meth_84D9( var_2 );

    if ( isdefined( var_3 ) )
        var_12 sethintstring( var_3 );

    if ( isdefined( var_4 ) )
        var_12 _meth_83A0( var_4 );
    else
        var_12 _meth_83A0( 0 );

    if ( isdefined( var_5 ) )
        var_12 setuseholdduration( var_5 );
    else
        var_12 setuseholdduration( "duration_short" );

    if ( isdefined( var_6 ) )
        var_12 _meth_84D8( var_6 );
    else
        var_12 _meth_84D8( "hide" );

    if ( isdefined( var_7 ) )
        var_12 _meth_84D3( var_7 );
    else
        var_12 _meth_84D3( 200 );

    if ( isdefined( var_8 ) )
        var_12 sethintdisplayfov( var_8 );
    else
        var_12 sethintdisplayfov( 160 );

    if ( isdefined( var_9 ) )
        var_12 setuserange( var_9 );
    else
        var_12 setuserange( 50 );

    if ( isdefined( var_10 ) )
        var_12 setusefov( var_10 );
    else
        var_12 setusefov( 120 );

    if ( !isdefined( var_11 ) )
        return var_12;
}
