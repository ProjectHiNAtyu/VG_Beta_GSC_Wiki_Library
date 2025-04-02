// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_1AAA( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_1._id_1A7C[var_0] ) )
        return 0;

    return var_1._id_1A7C[var_0];
}

arenatournament_get_weapon_rarity_from_level( var_0, var_1 )
{
    var_0 = _id_0A78::_id_EA60( var_0, "_mp" );
    var_2 = "weapon_level_" + var_1;
    var_3 = level._id_1A68[var_0][var_2];

    if ( isdefined( var_3 ) )
        return var_3;
    else
        return "comm";
}

arenatournament_get_weapon_level_from_object( var_0 )
{
    var_1 = getcompleteweaponname( var_0 );
    return arenatournament_get_weapon_level_from_name( var_1 );
}

arenatournament_get_weapon_level_from_name( var_0 )
{
    var_1 = strtok( var_0, "+" );
    var_2 = _id_0A78::_id_EA60( var_1[0], "_mp" );
    var_3 = [];

    foreach ( var_5 in var_1 )
        var_3[var_5] = 1;

    for ( var_7 = level._id_1A67[var_2].size - 1; var_7 > 0; var_7-- )
    {
        var_8 = level._id_1A67[var_2][var_7];

        if ( isdefined( var_3[var_8] ) )
            return var_7;
    }

    return 0;
}

_id_1A75( var_0 )
{
    return isdefined( _id_B47E( var_0.basename ) );
}

_id_B47E( var_0 )
{
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_4 = getweaponbasename( var_3 );

        if ( scripts\engine\utility::is_equal( var_4, var_0 ) )
            return var_3;
    }
}
