// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_AB57( var_0 )
{
    foreach ( var_2 in level._id_AAF4 )
        self [[ var_2 ]]( var_0 );
}

_id_C27B( var_0 )
{
    if ( !isdefined( level._id_AAF4 ) )
        level._id_AAF4 = [];

    level._id_AAF4[level._id_AAF4.size] = var_0;
}
