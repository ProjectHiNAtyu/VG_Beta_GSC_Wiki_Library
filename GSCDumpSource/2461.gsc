// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

registersharedfunc( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_D9AC ) )
        level._id_D9AC = [];

    if ( !isdefined( level._id_D9AC[var_0] ) )
        level._id_D9AC[var_0] = [];

    level._id_D9AC[var_0][var_1] = var_2;
}

issharedfuncdefined( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_D9AC ) )
        return 0;

    if ( !isdefined( level._id_D9AC[var_0] ) )
        return 0;

    var_3 = level._id_D9AC[var_0][var_1];

    if ( !isdefined( var_3 ) )
    {
        if ( istrue( var_2 ) )
        {

        }

        return 0;
    }

    return 1;
}

getsharedfunc( var_0, var_1 )
{
    return level._id_D9AC[var_0][var_1];
}
