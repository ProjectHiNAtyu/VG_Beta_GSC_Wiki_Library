// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_9885 = [];
    level._id_9886 = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/loot/iw7_weapon_loot_master.csv", var_0, 0 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_1 = int( var_1 );
        var_2 = tablelookupbyrow( "mp/loot/iw7_weapon_loot_master.csv", var_0, 1 );
        level._id_9886[var_1] = var_2;
        var_0++;
    }
}

_id_6BF8( var_0, var_1 )
{
    var_2 = _id_6B01( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2._id_AE99;

    return undefined;
}

_id_6B01( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return undefined;

    if ( isdefined( level._id_9885[var_0] ) && isdefined( level._id_9885[var_0][var_1] ) )
    {
        var_2 = level._id_9885[var_0][var_1];
        return var_2;
    }

    var_2 = _id_2E83( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    return undefined;
}

_id_6E49( var_0, var_1 )
{
    var_2 = "mp/loot/weapon/" + var_0 + ".csv";
    var_3 = _func_021D( var_2, 0, var_1, 3 );
    return var_3;
}

_id_9805( var_0, var_1 )
{
    var_2 = "mp/loot/weapon/" + var_0 + ".csv";
    var_3 = _func_021D( var_2, 0, var_1, 1 );
    return var_3;
}

_id_8AEF( var_0 )
{
    return var_0 >= 1 && var_0 <= 9999;
}

_id_88D5( var_0 )
{
    return var_0 >= 10000 && var_0 <= 19999;
}

_id_89A8( var_0 )
{
    return var_0 >= 20000 && var_0 <= 29999;
}

_id_87A3( var_0 )
{
    return var_0 >= 30000 && var_0 <= 39999;
}

_id_87AB( var_0 )
{
    return var_0 >= 40000 && var_0 <= 49999;
}

_id_2E83( var_0, var_1 )
{
    if ( !isdefined( level._id_9885[var_0] ) )
        level._id_9885[var_0] = [];

    var_2 = weaponisbeam( var_0 );
    var_3 = _id_C09A( var_2, var_1 );
    level._id_9885[var_0][var_1] = var_3;
    return var_3;
}

_id_C09A( var_0, var_1 )
{
    var_2 = _func_0225( var_0, 0, var_1 );
    var_3 = spawnstruct();
    var_3._id_C17B = tablelookupbyrow( var_0, var_2, 1 );
    var_3._id_10D5C = tablelookupbyrow( var_0, var_2, 1 );
    var_3._id_AE99 = [];

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        var_5 = tablelookupbyrow( var_0, var_2, 5 + var_4 );

        if ( isdefined( var_5 ) && var_5 != "" )
            var_3._id_AE99[var_3._id_AE99.size] = var_5;
    }

    var_3._id_BE8A = int( tablelookupbyrow( var_0, var_2, 4 ) );
    var_3._id_04A4 = var_1;
    return var_3;
}

_id_6E64( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return 0;

    var_2 = weaponisbeam( var_0 );
    var_3 = int( _func_021D( var_2, 0, var_1, 4 ) );
    return var_3;
}

_id_6B06( var_0 )
{
    return level._id_9886[var_0];
}
