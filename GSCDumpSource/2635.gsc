// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_E2FC( var_0 )
{
    level endon( "game_ended" );
    wait 1;
    var_1 = scripts\engine\utility::_id_6D7C( "hvt", "targetname" );
    var_2 = undefined;
    var_3 = undefined;
    level._id_1593 = 1;

    while ( !isdefined( var_2 ) )
    {
        var_2 = _id_0015::_id_3B60( "player", "allies" );

        if ( isdefined( var_2 ) )
        {
            foreach ( var_5 in var_1 )
            {
                if ( var_5._id_CD8C == var_0 )
                    var_3 = var_5.origin;
            }

            var_2 thread [[ var_2 _id_09C6::_id_11EC( "spawn" ) ]]( var_3, ( 0, 0, 0 ) );
            var_2.team = "axis";
            var_2 _id_09D1::_id_289E( "veteran" );
            var_2._id_ACD2 = scripts\mp\utility\outline::_id_ACBF( var_2, var_2.team, "outline_nodepth_cyan", "lowest" );
            continue;
        }

        waitframe();
    }

    var_2._id_F3FB = var_2 _id_07AD::_id_4047( var_2, ( 0, 0, 0 ) );
    var_2._id_F3FB._id_A8F9 = 0;
    var_2._id_F3FB._id_A8F8 = 1;
    var_2._id_F3FB._id_A8FF = 4.0;
    var_2._id_F3FB._id_10418 = "friendly";
    var_2._id_8514 = 1;
    var_2._id_F3FB _id_07AD::_id_D60F( "waypoint_blitz_defend" );
    var_2 thread _id_7C00( var_3 );
    var_2 thread _id_7C02();

    if ( !isdefined( level._id_7C01 ) )
        level._id_7C01 = 0;

    level._id_7C01++;
    var_2 scripts\mp\equipment::_id_38F9();
    level._id_F2AA = var_2;
}

_id_7C00( var_0 )
{
    self _meth_8057( var_0, 20, "critical" );
    var_1 = _id_09D1::_id_28F6();
}

_id_7C0D( var_0 )
{
    var_0._id_8D77 = scripts\mp\utility\outline::_id_ACBF( var_0, scripts\mp\utility\game::_id_6BC3( var_0.team )[0], "outline_depth_orange", "lowest" );
    var_0._id_F3FB._id_10418 = "any";
    var_0._id_F3FB _id_07AD::_id_D60F( "waypoint_blitz_defend", "waypoint_capture_kill" );
    var_0 thread _id_7C03();
}

_id_7C03()
{
    self endon( "game_ended" );
    wait 1.0;
    self._id_8514 = 0;
}

_id_7BFF( var_0 )
{
    if ( isdefined( var_0._id_8D77 ) )
        scripts\mp\utility\outline::outlinedisable( var_0._id_8D77, var_0 );

    if ( isdefined( var_0._id_ACD2 ) )
        scripts\mp\utility\outline::outlinedisable( var_0._id_ACD2, var_0 );

    var_0 notify( "hvt_timeout" );
    var_0._id_A533 = 1;
    var_0 suicide();
}

_id_7C02()
{
    self endon( "game_ended" );
    self endon( "hvt_timeout" );
    self waittill( "death" );
    level._id_7C05++;
    self._id_F3FB _id_07AD::_id_C2F2();

    if ( level._id_7C05 == 1 )
    {
        game["attackers"] = "allies";
        game["defenders"] = "axis";

        if ( isdefined( level._id_AB39 ) )
            [[ level._id_AB39 ]]( "allies" );

        setomnvar( "ui_hardpoint_timer", 0 );
        setomnvar( "ui_hardpoint", -1 );
    }
}

_id_7C12()
{
    self endon( "death" );
    self endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        var_1 = self _meth_815E();
        self _meth_8058( var_1, "critical" );
        wait 0.25;
    }
}
