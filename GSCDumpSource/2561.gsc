// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "#x3be675226f513af18", 0 );
    level._effect["fire_bomb_fire"] = loadfx( "vfx/s4/explosion/vfx_airdrop_explosion" );
    level._id_CC11["firebomb"] = 230;
    level._id_CC12["firebomb"] = 65;
    level._id_CC10["firebomb"] = -1;
    level._id_CC13["firebomb"] = 6.0;
    level._id_CC0F["firebomb"] = 24.0;
    level._id_8DBB["firebomb"] = ::_id_F77B;
    level._id_8DD6["firebomb_bomb_mp"] = "firebomb";
    level._id_8DD6["firebomb_bomb_axis_mp"] = "firebomb";
    level._id_8DD6["firebomb_bomb_grenadier_mp"] = "firebomb";
    level._id_8DD6["firebomb_bomb_axis_grenadier_mp"] = "firebomb";
    level._id_8DD6["firebomb_flames_mp"] = "firebomb";
    level._id_0F18 = 0;
}

_id_F77B( var_0 )
{
    if ( isdefined( level._id_0F18 ) && level._id_0F18 > 0 )
    {
        self iprintlnbold( &"KILLSTREAKS_FIREBOMB_ALREADY_ACTIVE" );
        return 0;
    }

    if ( isdefined( self._id_AE3C ) && self._id_AE3C )
    {
        self iprintlnbold( &"KILLSTREAKS_DLC4_CANT_USE_STREAK_WHILE_PARATROOPING" );
        return 0;
    }

    if ( _id_0A04::_id_F79E( var_0, "firebomb" ) )
    {
        self._id_5B41 = 0;
        return 1;
    }

    return 0;
}

_id_3FAB( var_0 )
{
    self waittill( "death" );

    if ( !isdefined( self ) || !isdefined( self.origin ) )
        return;

    var_1 = self.origin;
    var_2 = self.angles;
    var_3 = self.owner;
    var_4 = self.team;
    level._id_0F18++;
    wait 1;
    level thread _id_B823( var_1, var_0 );
    level thread _id_A0FB( var_1, var_2, var_3, var_4, var_0 );
}

playerxpenabled( var_0, var_1 )
{
    var_2 = undefined;
    var_2 = spawnfx( level._effect["fire_bomb_fire"], var_0 );
    triggerfx( var_2 );
    wait 12;

    if ( isdefined( var_2 ) )
        var_2 delete();
}

_id_B823( var_0, var_1 )
{
    var_2 = _id_07E3::_id_A6C7( "ks_firebomb_burn_loop", undefined, var_0, 2 );

    if ( var_1 )
        wait 16;
    else
        wait 12;

    _id_07E3::_id_A6C9( var_2, 1.5 );
}

_id_A0FB( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "game_ended" );

    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_5 = gettime();
    var_6 = 0;
    var_7 = anglestoforward( var_1 );
    var_7 = ( var_7[0], var_7[1], 0 );
    var_7 = vectornormalize( var_7 );

    if ( var_4 )
        var_8 = 16;
    else
        var_8 = 12;

    while ( var_6 < var_8 )
    {
        foreach ( var_10 in level.players )
        {
            if ( _func_0451( var_10 ) )
                continue;

            if ( var_10.team != var_3 || isdefined( var_2 ) && var_10 == var_2 || isdefined( level._id_74A8 ) && level._id_74A8 )
            {
                if ( !isdefined( var_10._id_F93E ) )
                {
                    if ( !isdefined( var_10._id_8FBD ) || var_10._id_8FBD != gettime() )
                    {
                        if ( _id_B698( var_10, var_0, var_7 ) )
                        {
                            if ( _id_B6D3( var_10, var_0 ) )
                            {
                                var_10._id_8FBD = gettime();
                                var_10 dodamage( 40, var_10.origin, var_2, undefined, "MOD_BURNED", "firebomb_flames_mp" );
                            }
                        }
                    }
                }
            }
        }

        wait 0.4;
        var_6 = ( gettime() - var_5 ) / 1000;
    }

    level._id_0F18--;
}

_id_B698( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return 0;

    var_3 = var_0 _meth_8169();

    if ( var_3[2] - var_1[2] > 256 )
        return 0;

    var_4 = 103;
    var_5 = _id_401A( var_1, var_2, var_4 );
    return _id_B9AC( var_3, var_5 );
}

_id_401A( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_4 = var_1 * var_2;
    var_5 = _func_0256( var_1, ( 0, 0, 1 ) ) * var_2;
    var_3._id_0DB6 = var_0 + var_4 - var_5;
    var_3._id_1FCE = var_0 + var_4 + var_5;
    var_3._id_2DD0 = var_0 - var_4 + var_5;
    var_3._id_4284 = var_0 - var_4 - var_5;
    return var_3;
}

_id_B6D3( var_0, var_1 )
{
    if ( var_0.origin[2] <= var_1[2] )
        return _id_07E3::_id_2D16( var_0.origin + ( 0, 0, 10 ), ( var_0.origin[0], var_0.origin[1], var_1[2] + 10 ), 0, var_0 ) && _id_07E3::_id_2D16( var_1 + ( 0, 0, 10 ), ( var_0.origin[0], var_0.origin[1], var_1[2] + 10 ), 0, var_0 );
    else
        return _id_07E3::_id_2D16( var_1 + ( 0, 0, 10 ), ( var_1[0], var_1[1], var_0.origin[2] + 10 ), 0, var_0 ) && _id_07E3::_id_2D16( var_0.origin + ( 0, 0, 10 ), ( var_1[0], var_1[1], var_0.origin[2] + 10 ), 0, var_0 );
}

_id_B9AC( var_0, var_1 )
{
    return _id_CB08( var_0, var_1._id_0DB6, var_1._id_1FCE, var_1._id_4284 ) && _id_CB08( var_0, var_1._id_1FCE, var_1._id_2DD0, var_1._id_0DB6 ) && _id_CB08( var_0, var_1._id_2DD0, var_1._id_4284, var_1._id_1FCE ) && _id_CB08( var_0, var_1._id_4284, var_1._id_0DB6, var_1._id_2DD0 );
}

_id_CB08( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0256( var_2 - var_1, var_3 - var_1 );
    var_5 = _func_0256( var_2 - var_1, var_0 - var_1 );
    return vectordot( var_4, var_5 ) >= 0;
}
