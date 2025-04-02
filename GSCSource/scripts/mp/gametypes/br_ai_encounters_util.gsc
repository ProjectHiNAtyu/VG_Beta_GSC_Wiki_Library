// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_62F4()
{
    if ( isdefined( self._id_5254._id_7E83.team ) )
        return self._id_5254._id_7E83.team;

    var_0 = [];

    foreach ( var_2 in level._id_EF86 )
        var_0[var_2] = 0;

    foreach ( var_5 in level.players )
    {
        var_2 = var_5.pers["team"];

        if ( !isdefined( var_2 ) || var_2 == "spectator" )
            continue;

        var_0[var_2]++;
    }

    foreach ( var_2, var_8 in var_0 )
    {
        if ( var_8 == 0 )
        {
            self._id_5254._id_7E83.team = var_2;
            break;
        }
    }

    if ( !isdefined( self._id_5254._id_7E83.team ) )
        self._id_5254._id_7E83.team = scripts\engine\utility::random( level._id_EF86 );

    return self._id_5254._id_7E83.team;
}

_id_6797()
{
    var_0 = [];

    if ( isdefined( self.target ) )
    {
        var_1 = scripts\engine\utility::_id_6D7C( self.target, "targetname" );

        foreach ( var_3 in var_1 )
            var_0[var_0.size] = var_3;

        var_5 = getentarray( self.target, "targetname" );

        foreach ( var_7 in var_5 )
            var_0[var_0.size] = var_7;

        var_9 = _func_00B3( self.target, "targetname" );

        foreach ( var_11 in var_9 )
            var_0[var_0.size] = var_11;
    }

    return var_0;
}

_id_6E18( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "undefined";
    else if ( _func_03A7( var_0 ) )
        return "function";
    else if ( _func_03A8( var_0 ) )
        return "builtin function";
    else if ( _func_03A9( var_0 ) )
        return "builtin method";
    else if ( _func_03AA( var_0 ) )
        return "animation";
    else if ( _func_0106( var_0 ) )
        return "array";
    else if ( _func_02D9( var_0 ) )
        var_1 = "struct";
    else if ( isvector( var_0 ) )
        var_1 = "vector";
    else if ( _func_02DB( var_0 ) )
        var_1 = "entity";
    else if ( _func_02DC( var_0 ) )
        var_1 = "node";
    else if ( isint( var_0 ) )
        var_1 = "int";
    else if ( _func_010F( var_0 ) )
        var_1 = "float";
    else if ( _func_0120( var_0 ) )
        var_1 = "string";
    else if ( _func_0114( var_0 ) )
        var_1 = "istring";
    else
        var_1 = "unknown";

    return var_1;
}

_id_FFC9( var_0 )
{
    var_1 = _id_6E18( var_0 );

    switch ( var_1 )
    {
        case "array":
            return _id_0B18( var_0 );
        case "vector":
            return "(" + var_0[0] + "," + var_0[1] + "," + var_0[2] + ")";
        case "float":
        case "int":
            return "" + var_0;
        case "string":
            return var_0;
        case "entity":
            return "$e" + var_0 getentitynumber();
        default:
            return "<" + var_1 + ">";
    }
}

_id_0B18( var_0 )
{
    var_1 = "[ ";
    var_2 = 1;

    foreach ( var_5, var_4 in var_0 )
    {
        if ( !var_2 )
            var_1 = var_1 + ",";
        else
            var_2 = 0;

        var_1 = var_1 + _id_FFC9( var_4 );
    }

    var_1 = var_1 + " ]";
    return var_1;
}

_id_525F( var_0 )
{
    _func_02AC( var_0 );
    self notify( "nav_obstacle_destroy_" + var_0 );
}

_id_5261( var_0 )
{
    self endon( "nav_obstacle_destroy_" + var_0 );
    self waittill( "encounter_end" );
    _id_525F( var_0 );
}

_id_5260( var_0, var_1 )
{
    self endon( "nav_obstacle_destroy_" + var_0 );
    self endon( "encounter_end" );
    wait( var_1 );
    _id_525F( var_0 );
}

_id_525D( var_0 )
{
    var_0 endon( "death" );
    self waittill( "encounter_end" );
    var_0 delete();
}

_id_4AC2( var_0 )
{
    foreach ( var_2 in level.players )
        var_0 _meth_86A6( var_2 );
}

_id_524A( var_0 )
{
    foreach ( var_2 in level.players )
        var_0 _meth_86A5( var_2 );
}

_id_108BB( var_0, var_1, var_2 )
{
    var_10 = spawnstruct();

    if ( isdefined( var_2 ) )
    {
        var_10 endon( "thread_timed_out" );
        var_10 thread _id_108BF( var_2 );
    }

    var_10._id_010E = var_0.size;

    if ( isdefined( var_1 ) && var_1 < var_10._id_010E )
        var_10._id_010E = var_1;

    scripts\engine\utility::_id_1BBA( var_0, ::_id_108BE, var_10 );

    while ( var_10._id_010E > 0 )
        var_10 waittill( "waittill_dead guy died" );
}

_id_108BC( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        if ( isalive( var_5 ) && !var_5._id_0212 )
            var_3[var_3.size] = var_5;
    }

    var_0 = var_3;
    var_7 = spawnstruct();

    if ( isdefined( var_2 ) )
    {
        var_7 endon( "thread_timed_out" );
        var_7 thread _id_108BF( var_2 );
    }

    var_7._id_010E = var_0.size;

    if ( isdefined( var_1 ) && var_1 < var_7._id_010E )
        var_7._id_010E = var_1;

    scripts\engine\utility::_id_1BBA( var_0, ::_id_108BD, var_7 );

    while ( var_7._id_010E > 0 )
        var_7 waittill( "waittill_dead_guy_dead_or_dying" );
}

_id_108F0( var_0 )
{
    self endon( "damage" );
    self endon( "death" );
    self waittillmatch( "single anim", var_0 );
}

_id_6547( var_0, var_1 )
{
    var_2 = _id_6548( var_0, var_1 );

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

_id_6548( var_0, var_1 )
{
    var_2 = _func_0073( "all", "all" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( !isalive( var_5 ) )
            continue;

        switch ( var_1 )
        {
            case "targetname":
                if ( isdefined( var_5._id_045A ) && var_5._id_045A == var_0 )
                    var_3[var_3.size] = var_5;

                break;
            case "script_noteworthy":
                if ( isdefined( var_5._id_0375 ) && var_5._id_0375 == var_0 )
                    var_3[var_3.size] = var_5;

                break;
            case "animname":
                if ( isdefined( var_5._id_1887 ) && var_5._id_1887 == var_0 )
                    var_3[var_3.size] = var_5;

                break;
        }
    }

    return var_3;
}

_id_108BE( var_0 )
{
    self waittill( "death" );
    var_0._id_010E--;
    var_0 notify( "waittill_dead guy died" );
}

_id_108BD( var_0 )
{
    scripts\engine\utility::_id_108C3( "death", "long_death" );
    var_0._id_010E--;
    var_0 notify( "waittill_dead_guy_dead_or_dying" );
}

_id_108BF( var_0 )
{
    wait( var_0 );
    self notify( "thread_timed_out" );
}
