// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_C9AD()
{
    var_0 = scripts\cp_mp\utility\game_utility::_id_6B0E() == "mp_red_star";
    var_1 = scripts\engine\utility::_id_1B94( scripts\engine\utility::_id_6D7C( "mp_scripted_corpse_spawn", "targetname" ) );
    var_2 = 0;
    scripts\engine\utility::_id_0FB3( "deathfx_bloodpool_generic", "vfx/iw8/char/blood/vfx_deathfx_bloodpool_01.vfx" );

    if ( getdvarint( "scr_s4_scriptable_corpse_limit", -1 ) == 0 )
        return;

    for (;;)
    {
        wait 5;

        foreach ( var_4 in var_1 )
        {
            if ( istrue( var_4._id_0169 ) )
                continue;

            var_5 = scripts\engine\utility::_id_634A( var_4.origin, level.players, undefined, 3, 1000 );
            var_6 = 1;

            foreach ( var_8 in var_5 )
            {
                if ( _func_01FD( var_8 geteye(), var_4.origin + ( 0, 0, 8 ), 0, var_8, 0 ) )
                {
                    var_6 = 0;
                    break;
                }
            }

            if ( var_6 )
            {
                var_10 = ( 0, 0, 0 );

                if ( isdefined( var_4.angles ) )
                    var_10 = var_4.angles;

                if ( istrue( var_0 ) )
                    var_11 = "_snowy_";
                else
                    var_11 = "_";

                var_12 = 1;

                if ( isdefined( var_4._id_0375 ) )
                    var_12 = var_4._id_0375;
                else
                    var_12 = randomint( 5 ) + 1;

                var_13 = _func_03C0( "corpse_body" + var_11 + "0" + var_12, var_4.origin, var_10 );
                playfx( scripts\engine\utility::getfx( "deathfx_bloodpool_generic" ), var_4.origin + ( 0, 0, 1 ) );
                var_4._id_0169 = 1;
                var_2++;

                if ( var_2 >= getdvarint( "scr_s4_scriptable_corpse_limit", 200 ) )
                    return;

                break;
            }

            wait 0.5;
        }
    }
}
