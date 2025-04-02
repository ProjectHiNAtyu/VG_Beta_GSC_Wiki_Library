// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_29F0 = getdvarint( "#x386c2afd0ab1966da", 0 );

    if ( !istrue( level._id_29F0 ) )
        return;

    level._effect["poi_light_bank"] = loadfx( "vfx/iw8_br/gameplay/vfx_br_poi_light_bank.vfx" );
    level._id_21A4 = getentarray( "bank_entry_detector", "targetname" );

    foreach ( var_1 in level._id_21A4 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1._id_B7AB = 0;
        var_1._id_13F8 = 0;
        var_1._id_21AA = scripts\engine\utility::_id_6D7C( var_1.target, "targetname" );
        var_1 thread _id_0A7D::_id_99D1( var_1, ::_id_21AB, ::_id_21AC );
    }
}

_id_21AB( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_1._id_B7AB = var_1._id_B7AB + 1;

    if ( var_1._id_B7AB != 1 )
        return;

    var_1 thread _id_21B6();
}

_id_21AC( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_1._id_B7AB = max( var_1._id_B7AB - 1, 0 );

    if ( var_1._id_B7AB == 0 )
        var_1 thread _id_21B5();
}

_id_21AE()
{
    if ( !istrue( level._id_29F0 ) )
        return;

    var_0 = self;
    var_0 notify( "bankPlunderDeposited" );
    var_0 endon( "bankPlunderDeposited" );
    var_1 = scripts\engine\utility::_id_694A( var_0.origin, level._id_21A4, 90000 );

    if ( !isdefined( var_1 ) )
        return;

    var_1 _id_21B5();
    var_2 = getdvarint( "scr_br_bank_alarm_cooldown", 15 );
    wait( var_2 );

    if ( var_1._id_B7AB > 0 )
        var_1 _id_21B6();
}

_id_21B6()
{
    self notify( "bank_alarm_triggered" );
    var_0 = self;
    var_0._id_13F8 = 1;
    var_0 playloopsound( "bank_alarm_lp" );

    foreach ( var_2 in var_0._id_21AA )
    {
        var_3 = anglestoforward( var_2.angles );
        var_4 = anglestoup( var_2.angles );
        var_2._id_603C = spawnfx( level._effect["poi_light_bank"], var_2.origin + var_3 * 5, var_3, var_4 );
        triggerfx( var_2._id_603C );
    }

    var_6 = getdvarint( "scr_br_bank_alarm_duration", 5 );
    wait( var_6 );
    var_0._id_13F8 = 0;

    if ( var_0._id_B7AB == 0 )
        var_0 _id_21B5();
}

_id_21B5()
{
    self endon( "bank_alarm_triggered" );
    var_0 = self;

    if ( var_0._id_13F8 )
        return;

    wait 3;
    var_0 stoploopsound();

    foreach ( var_2 in var_0._id_21AA )
    {
        if ( isdefined( var_2._id_603C ) )
            var_2._id_603C delete();
    }
}
