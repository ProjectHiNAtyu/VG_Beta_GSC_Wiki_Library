// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

lui_update_gunbench()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "overkill_equipped" )
            changesecondaryblankets( var_1 );

        waitframe();
    }
}

gunbench_startup()
{
    var_0 = getent( "ammo_box_primary", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 hide();

    var_1 = getent( "ammo_box_secondary", "targetname" );

    if ( isdefined( var_1 ) )
        var_1 hide();

    var_2 = getentarray( "secondary_weapon_prop_blankets", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4 ) )
            var_4 hide();
    }
}

changesecondaryblankets( var_0 )
{
    var_1 = getentarray( "secondary_weapon_prop_blankets", "targetname" );
    var_2 = getent( "secondary_weapon_sidearm_blanket", "targetname" );

    if ( var_0 )
    {
        foreach ( var_4 in var_1 )
        {
            if ( isdefined( var_4 ) )
                var_4 show();
        }

        var_2 hide();
    }
    else
    {
        foreach ( var_4 in var_1 )
        {
            if ( isdefined( var_4 ) )
                var_4 hide();
        }

        var_2 show();
    }
}
