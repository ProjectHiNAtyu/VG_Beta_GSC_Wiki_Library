// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_BADE()
{
    var_0 = spawnstruct();
    level._id_BA9E = var_0;
    var_0._id_AA2D = [ "primary", "secondary" ];
    var_0._id_AA2D["primary"][0] = "ui_power_num_charges";
    var_0._id_AA2D["primary"][1] = "ui_power_max_charges";
    var_0._id_AA2D["primary"][2] = "ui_power_recharge";
    var_0._id_AA2D["primary"][3] = "ui_power_id";
    var_0._id_AA2D["primary"][4] = "ui_power_consume";
    var_0._id_AA2D["primary"][5] = "ui_power_disabled";
    var_0._id_AA2D["primary"][6] = "ui_power_state";
    var_0._id_AA2D["secondary"][0] = "ui_power_secondary_num_charges";
    var_0._id_AA2D["secondary"][1] = "ui_power_secondary_max_charges";
    var_0._id_AA2D["secondary"][2] = "ui_power_secondary_recharge";
    var_0._id_AA2D["secondary"][3] = "ui_power_id_secondary";
    var_0._id_AA2D["secondary"][4] = "ui_power_secondary_consume";
    var_0._id_AA2D["secondary"][5] = "ui_power_secondary_disabled";
    var_0._id_AA2D["secondary"][6] = "ui_power_secondary_state";
}

_id_BAD7( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "scripted" )
        return;

    self setclientomnvar( _id_BADD( var_0, 3 ), var_1 );
    var_4 = scripts\engine\utility::ter_op( var_2, 1000, 0 );
    self setclientomnvar( _id_BADD( var_0, 2 ), var_4 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self setclientomnvar( _id_BADD( var_0, 0 ), var_3 );
    self setclientomnvar( _id_BADD( var_0, 4 ), 0 );
}

_id_BADA( var_0 )
{
    if ( var_0 == "scripted" )
        return;

    self setclientomnvar( _id_BADD( var_0, 3 ), -1 );
    self setclientomnvar( _id_BADD( var_0, 2 ), -1 );
    self setclientomnvar( _id_BADD( var_0, 0 ), 0 );
    self setclientomnvar( _id_BADD( var_0, 4 ), -1 );
}

_id_BADF( var_0, var_1 )
{
    self setclientomnvar( _id_BADD( var_0, 0 ), int( var_1 ) );
}

_id_BAE5( var_0, var_1 )
{
    self setclientomnvar( _id_BADD( var_0, 1 ), int( var_1 ) );
}

_id_BAE3( var_0, var_1 )
{
    self setclientomnvar( _id_BADD( var_0, 4 ), var_1 );
}

_id_BAE6( var_0, var_1 )
{
    self setclientomnvar( _id_BADD( var_0, 2 ), int( var_1 ) );
}

_id_BAE2( var_0, var_1 )
{
    self setclientomnvar( _id_BADD( var_0, 5 ), var_1 );
}

_id_BAE7( var_0, var_1 )
{
    var_2 = scripts\engine\utility::ter_op( var_1, 1, 0 );
    self setclientomnvar( _id_BADD( var_0, 6 ), var_2 );
}

_id_BAE8( var_0, var_1 )
{
    self setclientomnvar( _id_BADD( var_0, 6 ), var_1 );
}

_id_BAD9( var_0 )
{
    _id_BAE3( var_0, 1 );
}

_id_BADB( var_0 )
{
    _id_BAE3( var_0, 0 );
}

_id_BAD8( var_0, var_1 )
{
    _id_BAE6( var_0, 0 );

    if ( isdefined( var_1 ) && var_1 )
        _id_BAE2( var_0, 1 );

    _id_BAE8( var_0, 1 );
}

_id_BADC( var_0, var_1 )
{
    _id_BAE6( var_0, 1000 );

    if ( isdefined( var_1 ) && var_1 )
        _id_BAE2( var_0, 0 );

    if ( var_0 == "primary" )
        self playlocalsound( "iw8_new_objective_sfx" );
    else
        self playlocalsound( "iw8_new_objective_sfx" );

    _id_BAE8( var_0, 0 );
}

_id_BAE1( var_0, var_1 )
{
    _id_BAE6( var_0, 1000 * var_1 );
}

_id_BAE4( var_0, var_1 )
{
    _id_BAE6( var_0, 1000 * var_1 );
}

_id_BADD( var_0, var_1 )
{
    if ( var_0 == "scripted" )
        return;

    return level._id_BA9E._id_AA2D[var_0][var_1];
}
