// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_CFE7( var_0 )
{
    while ( !istrue( game["gamestarted"] ) )
        waitframe();

    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 thread _id_F403( var_1.size );
}

_id_F403( var_0 )
{
    level endon( "game_ended" );
    self setcandamage( 1 );
    self._id_5EF0 = [];

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 );

        if ( isdefined( var_10 ) )
        {
            if ( var_5 == "MOD_EXPLOSIVE" || var_5 == "MOD_GRENADE_SPLASH" )
                continue;
        }
        else if ( isdefined( var_14.streakinfo ) && _id_0A6F::_id_88CF( var_14.streakinfo._id_EA0F ) )
        {
            self.health = 5;
            continue;
        }

        if ( !isdefined( self._id_5EF0[var_2._id_723F] ) )
        {
            self._id_5EF0[var_2._id_723F] = 1;

            if ( !isdefined( var_2._id_7868 ) )
                var_2._id_7868 = 1;
            else
                var_2._id_7868++;

            iprintln( "Secret objects found: " + var_2._id_7868 + " of " + var_0 );
        }

        if ( self.health <= 0 )
            break;
    }

    self delete();
}

_id_CFE8()
{
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        if ( getdvarint( "scr_debugSecretHunt", 0 ) == 1 )
        {
            self _meth_81B0( "outlinefill_nodepth_green" );
            self._id_ACB2 = 1;
        }
        else if ( istrue( self._id_ACB2 ) )
        {
            self _meth_81AD();
            self._id_ACB2 = 0;
        }

        wait 1.0;
    }
}
