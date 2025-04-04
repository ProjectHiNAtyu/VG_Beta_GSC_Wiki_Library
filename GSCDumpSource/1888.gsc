// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "#x3e2c03b1d1df2ade4", 360.0 );
    setdvarifuninitialized( "#x3a710147c68b5666e", 460.0 );
    setdvarifuninitialized( "#x3c38ce9ac4042d7b0", 540.0 );
    level._id_1C04 = scripts\engine\utility::_id_6D7C( "ascend_begin", "script_noteworthy" );
    level._id_47EA = scripts\engine\utility::_id_6D7C( "descend_begin", "script_noteworthy" );
    level._id_1C07 = [];

    foreach ( var_1 in level._id_1C04 )
        _id_9B74( var_1, 1 );

    foreach ( var_1 in level._id_47EA )
        _id_9B74( var_1, 0 );

    _id_811B();
    _id_0778::_id_CEBF( "ascender", ::_id_1C01 );
}

#using_animtree("script_model");

_id_811B()
{
    level._id_CC27["player"] = #animtree;
    level._id_CC24["player"]["ascender_up_in"] = %vm_eq_ascender_up_get_on_plr;
    level._id_CC25["player"]["ascender_up_in"] = "vm_eq_ascender_up_get_on_plr";
    level._id_CC2E["player"]["ascender_up_in"] = "ascender_up_in";
    level._id_CC24["player"]["ascender_up_loop"] = %vm_eq_ascender_up_loop_plr;
    level._id_CC25["player"]["ascender_up_loop"] = "vm_eq_ascender_up_loop_plr";
    level._id_CC2E["player"]["ascender_up_loop"] = "ascender_up_loop";
    level._id_CC24["player"]["ascender_up_out"] = %vm_eq_ascender_up_get_off_plr;
    level._id_CC25["player"]["ascender_up_out"] = "vm_eq_ascender_up_get_off_plr";
    level._id_CC2E["player"]["ascender_up_out"] = "ascender_up_out";
    level._id_CC24["player"]["ascender_down_in"] = %vm_eq_ascender_down_get_on_plr;
    level._id_CC25["player"]["ascender_down_in"] = "vm_eq_ascender_down_get_on_plr";
    level._id_CC2E["player"]["ascender_down_in"] = "ascender_down_in";
    level._id_CC24["player"]["ascender_down_loop"] = %vm_eq_ascender_down_loop_plr;
    level._id_CC25["player"]["ascender_down_loop"] = "vm_eq_ascender_down_loop_plr";
    level._id_CC2E["player"]["ascender_down_loop"] = "ascender_down_loop";
    level._id_CC24["player"]["ascender_down_out"] = %vm_eq_ascender_down_get_off_plr;
    level._id_CC25["player"]["ascender_down_out"] = "vm_eq_ascender_down_get_off_plr";
    level._id_CC2E["player"]["ascender_down_out"] = "ascender_down_out";
    level._id_CC27["device"] = #animtree;
    level._id_CC24["device"]["ascender_up_in"] = %vm_eq_ascender_up_get_on_ascender;
    level._id_CC25["device"]["ascender_up_in"] = "vm_eq_ascender_up_get_on_ascender";
    level._id_CC2E["device"]["ascender_up_in"] = "ascender_up_in";
    level._id_CC24["device"]["ascender_up_loop"] = %vm_eq_ascender_up_loop_ascender;
    level._id_CC25["device"]["ascender_up_loop"] = "vm_eq_ascender_up_loop_ascender";
    level._id_CC2E["device"]["ascender_up_loop"] = "ascender_up_loop";
    level._id_CC24["device"]["ascender_up_out"] = %vm_eq_ascender_up_get_off_ascender;
    level._id_CC25["device"]["ascender_up_out"] = "vm_eq_ascender_up_get_off_ascender";
    level._id_CC2E["device"]["ascender_up_out"] = "ascender_up_out";
    level._id_CC24["device"]["ascender_down_in"] = %vm_eq_ascender_down_get_on_ascender;
    level._id_CC25["device"]["ascender_down_in"] = "vm_eq_ascender_down_get_on_ascender";
    level._id_CC2E["device"]["ascender_down_in"] = "ascender_down_in";
    level._id_CC24["device"]["ascender_down_loop"] = %vm_eq_ascender_down_loop_ascender;
    level._id_CC25["device"]["ascender_down_loop"] = "vm_eq_ascender_down_loop_ascender";
    level._id_CC2E["device"]["ascender_down_loop"] = "ascender_down_loop";
    level._id_CC24["device"]["ascender_down_out"] = %vm_eq_ascender_down_get_off_ascender;
    level._id_CC25["device"]["ascender_down_out"] = "vm_eq_ascender_down_get_off_ascender";
    level._id_CC2E["device"]["ascender_down_out"] = "ascender_down_out";
    level._id_CC27["device"] = #animtree;
    level._id_CC24["device"]["ascender_up_in_wm"] = %wm_eq_ascender_up_get_on_ascender;
    level._id_CC25["device"]["ascender_up_in_wm"] = "wm_eq_ascender_up_get_on_ascender";
    level._id_CC2E["device"]["ascender_up_in_wm"] = "ascender_up_in";
    level._id_CC24["device"]["ascender_up_loop_wm"] = %wm_eq_ascender_up_loop_ascender;
    level._id_CC25["device"]["ascender_up_loop_wm"] = "wm_eq_ascender_up_loop_ascender";
    level._id_CC2E["device"]["ascender_up_loop_wm"] = "ascender_up_loop";
    level._id_CC24["device"]["ascender_up_out_wm"] = %wm_eq_ascender_up_get_off_ascender;
    level._id_CC25["device"]["ascender_up_out_wm"] = "wm_eq_ascender_up_get_off_ascender";
    level._id_CC2E["device"]["ascender_up_out_wm"] = "ascender_up_out";
    level._id_CC24["device"]["ascender_down_in_wm"] = %wm_eq_ascender_down_get_on_ascender;
    level._id_CC25["device"]["ascender_down_in_wm"] = "wm_eq_ascender_down_get_on_ascender";
    level._id_CC2E["device"]["ascender_down_in_wm"] = "ascender_down_in";
    level._id_CC24["device"]["ascender_down_loop_wm"] = %wm_eq_ascender_down_loop_ascender;
    level._id_CC25["device"]["ascender_down_loop_wm"] = "wm_eq_ascender_down_loop_ascender";
    level._id_CC2E["device"]["ascender_down_loop_wm"] = "ascender_down_loop";
    level._id_CC24["device"]["ascender_down_out_wm"] = %wm_eq_ascender_down_get_off_ascender;
    level._id_CC25["device"]["ascender_down_out_wm"] = "wm_eq_ascender_down_get_off_ascender";
    level._id_CC2E["device"]["ascender_down_out_wm"] = "ascender_down_out";
}

_id_9B74( var_0, var_1 )
{
    var_2 = scripts\engine\utility::_id_6D7A( var_0.target, "targetname" );
    var_3 = scripts\engine\utility::_id_6D7A( var_2.target, "targetname" );
    level._id_1C07[var_0._id_045A] = var_0;
    var_0._id_1C05 = var_2;
    var_0._id_1C06 = var_3;
    var_0._id_84D5 = 0;
    var_0._id_5753 = var_0.angles + ( 0, 180, 0 );
    var_0._id_E676 = var_0.angles;
    var_0._id_49A0 = var_1;

    if ( var_0._id_045A == "pf57045_auto38" || var_0._id_045A == "pf57045_auto41" )
    {
        var_0.origin = var_0.origin + ( 0, 0, 8 );
        var_2.origin = var_2.origin + ( 0, 0, 8 );
        var_3.origin = var_3.origin + ( 0, 0, 8 );
    }
}

_id_1C01( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( var_2 == "on" )
    {
        if ( istrue( var_3._id_FF02 ) )
            return;

        _id_1C03( var_0, var_3 );
    }
}

_id_47A4()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "denyAscendMessageLastStand" );
    self endon( "denyAscendMessageLastStand" );

    if ( isdefined( level._id_1BFF ) )
        self [[ level._id_1BFF ]]( "ascender_blocked_laststand", 4 );
    else
    {
        _id_0A70::_id_D5DD( 55 );
        wait 4;
        _id_0A70::_id_D5DD( 0 );
    }
}

_id_47A3()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "denyAscendMessageJugg" );
    self endon( "denyAscendMessageJugg" );

    if ( isdefined( level._id_1BFF ) )
        self [[ level._id_1BFF ]]( "ascender_blocked_jugg", 4 );
    else
    {
        _id_0A70::_id_D5DD( 54 );
        wait 4;
        _id_0A70::_id_D5DD( 0 );
    }
}

_id_47A2()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "denyAscendMessage" );
    self endon( "denyAscendMessage" );

    if ( isdefined( level._id_1BFF ) )
        self [[ level._id_1BFF ]]( "ascender_blocked", 4 );
    else
    {
        _id_0A70::_id_D5DD( 43 );
        wait 4;
        _id_0A70::_id_D5DD( 0 );
    }
}

_id_1BF8( var_0 )
{
    level endon( "game_ended" );
    self endon( "ascend_complete" );
    self endon( "ascender_cancel" );
    self waittill( "death_or_disconnect" );
    var_0 _id_384E( self );
}

_id_52C0( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death_or_disconnect" );
    var_0 endon( "ascender_cancel" );

    if ( var_1 )
        var_4 = "ascender_up_out";
    else
        var_4 = "ascender_down_out";

    thread _id_0781::_id_17D5( var_0, var_0._id_B591, var_4 );
    _id_069D::_id_181D( var_3, var_4 + "_wm" );
}

_id_E67C( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death_or_disconnect" );
    var_0 endon( "ascender_cancel" );
    var_0 thread _id_0A6B::_id_7E37( "player", var_0.origin, var_0.angles );
    var_2._id_1887 = "device";
    var_2 _id_069D::_id_D46E();
    var_3._id_1887 = "device";
    var_3 _id_069D::_id_D46E();
    var_3 hide();
    var_4 = ( 1, 0, 0 );

    if ( var_1 )
    {
        var_5 = "TAG_ACCESSORY_RIGHT";
        var_6 = "ascender_up_in";
        var_4 = rotatevector( ( -40.9464, 22.9807, 0 ), self.angles );
    }
    else
    {
        var_5 = "TAG_ACCESSORY_LEFT";
        var_6 = "ascender_down_in";
        var_4 = rotatevector( ( -42.2388, -23.4915, 0 ), self.angles );
    }

    var_0._id_B591 moveto( self.origin + var_4, 0.4, 0.1, 0.1 );
    var_7 = vectornormalize( var_4 * -1 );
    var_8 = _id_FFE1( var_7, ( 0, 0, 1 ) );
    var_0._id_B591 rotateto( var_8, 0.4, 0.1, 0.1 );
    var_9 = gettime();
    var_0 _id_0A6B::_id_6F83();
    var_10 = gettime();
    var_11 = 0.4 - ( var_10 - var_9 ) / 1000.0;
    var_12 = max( 0, var_11 );
    wait( var_12 );
    var_3 show();
    var_3 hidefromplayer( var_0 );
    var_0._id_B591 linkto( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_2 linkto( var_0._id_B591, var_5, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 linkto( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_B591 _meth_83C9( var_0 );
    _id_069D::_id_179A( var_0._id_B591, var_6 );
    thread _id_0781::_id_17D5( var_0, var_0._id_B591, var_6 );
    thread _id_069D::_id_181D( var_3, var_6 + "_wm" );
    var_13 = _func_0079( level._id_CC24["player"][var_6] );
    wait( var_13 );
}

_id_9833( var_0, var_1, var_2, var_3 )
{
    self endon( "death_or_disconnect" );
    self endon( "ascender_loop_done" );
    self endon( "ascender_cancel" );

    if ( var_3 )
        var_4 = "ascender_up_loop";
    else
        var_4 = "ascender_down_loop";

    var_5 = _func_0079( level._id_CC24["player"][var_4] );

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        var_0 thread _id_0781::_id_17D5( self, self._id_B591, var_4 );
        var_0 _id_069D::_id_181D( var_2, var_4 + "_wm" );

        if ( !isdefined( var_5 ) || var_5 == 0 )
            break;

        wait( var_5 );
    }
}

_id_1C03( var_0, var_1 )
{
    level endon( "game_ended" );
    var_1 endon( "death_or_disconnect" );
    var_1 endon( "ascender_cancel" );
    var_2 = level._id_1C07[var_0.target];

    if ( var_1 isswitchingweapon() )
    {
        var_1 thread _id_47A2();
        return;
    }

    if ( var_1 scripts\cp_mp\utility\player_utility::isinvehicle() )
    {
        var_1 thread _id_47A2();
        return;
    }

    if ( var_2._id_84D5 )
    {
        var_1 thread _id_47A2();
        return;
    }

    if ( istrue( var_1._id_82CE ) )
    {
        var_1 thread _id_47A2();
        return;
    }

    if ( istrue( var_1._id_88C5 ) )
    {
        var_1 thread _id_47A3();
        return;
    }

    if ( istrue( self._id_82AC ) )
    {
        var_1 thread _id_47A4();
        return;
    }

    if ( istrue( var_1._id_89ED ) )
        return;

    var_1._id_DBD4 = 1;
    var_2._id_1BF9 = spawn( "script_model", var_2.origin );
    var_2._id_1BF9 setmodel( "tag_origin" );
    var_2._id_0383 = var_0;

    if ( var_1 getstance() != "stand" )
        var_1 setstance( "stand" );

    var_1 disableoffhandweapons();
    var_1 allowmelee( 0 );
    var_1 allowads( 0 );
    var_1 allowfire( 0 );
    var_1 scripts\common\utility::_id_1527( 0 );
    var_1 disableweaponswitch();
    var_2._id_1BF9 _id_0765::_id_C2A8( 2 );
    var_2._id_84D5 = 1;
    var_1._id_FF02 = 1;
    var_1 scripts\common\utility::_id_1562( 0 );
    var_3 = var_2._id_1C05;
    var_4 = var_2._id_1C06;
    var_2._id_1BF9 dontinterpolate();
    var_2._id_1BF9.origin = var_2.origin;
    var_2._id_1BF9.angles = var_2.angles;
    var_5 = spawn( "script_model", var_2.origin );
    var_5 setmodel( "misc_wm_ascender" );
    var_5 _meth_83C9( var_1 );
    var_6 = spawn( "script_model", var_2.origin );
    var_6 setmodel( "misc_wm_ascender" );
    var_6 hidefromplayer( var_1 );
    var_1._id_1C02 = var_2;
    var_1._id_1BFD = var_5;
    var_1._id_1BFE = var_6;
    var_1 thread _id_1BF8( var_2 );
    var_2._id_1BF9 _id_E67C( var_1, var_2._id_49A0, var_5, var_6 );
    var_2._id_1BF9 playloopsound( "br_auto_ascender_device_lp_npc" );
    var_1 thread _id_9833( var_2._id_1BF9, var_5, var_6, var_2._id_49A0 );
    var_7 = distance( var_3.origin, var_2.origin );

    if ( !var_2._id_49A0 )
    {
        if ( scripts\common\utility::_id_87BA() )
            var_8 = getdvarfloat( "#x3c38ce9ac4042d7b0", 540.0 );
        else
            var_8 = getdvarfloat( "#x3a710147c68b5666e", 460.0 );
    }
    else
        var_8 = getdvarfloat( "#x3e2c03b1d1df2ade4", 360.0 );

    var_9 = var_7 / var_8;
    var_10 = 0.4 * var_9;
    var_11 = 0.15 * var_9;
    var_2._id_1BF9 moveto( var_3.origin, var_9, var_10, var_11 );
    wait( var_9 );
    var_2._id_1BF9 stoploopsound( "br_auto_ascender_device_lp_npc" );
    var_1 notify( "ascender_loop_done" );
    var_2._id_1BF9 _id_52C0( var_1, var_2._id_49A0, var_5, var_6 );
    var_2 _id_384E( var_1 );
    var_1 notify( "ascend_complete" );
}

_id_384E( var_0 )
{
    self._id_84D5 = 0;
    var_0._id_FF02 = 0;
    var_0._id_8F76 = gettime();
    var_0 scripts\common\utility::_id_1562( 1 );
    var_0._id_DBD4 = undefined;
    var_0 enableoffhandweapons();
    var_0 allowmelee( 1 );
    var_0 allowads( 1 );
    var_0 allowfire( 1 );
    var_0 scripts\common\utility::_id_1527( 1 );
    var_0 enableweaponswitch();
    var_0._id_1BFD unlink();
    var_0._id_1BFD delete();
    var_0._id_1BFE unlink();
    var_0._id_1BFE delete();
    self._id_1BF9.angles = self._id_E676;
    self._id_1BF9 _id_0765::_id_47E6();
    self._id_1BF9 delete();
    self._id_0383 setscriptablepartstate( "ascender", "on" );
    var_0._id_1C02 = undefined;
    var_0._id_1BFD = undefined;
    var_0._id_1BFE = undefined;
    var_0._id_B591 unlink();
    var_0 thread _id_0A6B::_id_EDC0();
    var_0 notify( "remove_rig" );
}

_id_1BFC()
{
    var_0 = self;

    if ( !istrue( var_0._id_FF02 ) )
        return;

    var_1 = var_0._id_1C02._id_1C06.origin;
    var_2 = var_0._id_1C02._id_1C06.angles;
    var_0._id_1C02 _id_384E( var_0 );
    var_0 setorigin( var_1 );
    var_0 setplayerangles( var_2 );
    var_0 notify( "ascender_cancel" );
}

_id_FFE1( var_0, var_1 )
{
    var_2 = _func_0256( var_0, var_1 );
    var_1 = _func_0256( var_2, var_0 );
    var_3 = _func_0017( var_0, var_2, var_1 );
    return var_3;
}
