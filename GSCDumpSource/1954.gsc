// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_5161()
{
    scripts\cp_mp\utility\script_utility::registersharedfunc( "emp", "getPlayerEMPImmune", ::_id_6C2C );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "emp", "setPlayerEMPImmune", ::_id_D654 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "emp", "onPlayerEMPed", ::_id_AB53 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "emp", "onVehicleEMPed", ::_id_ABC3 );
}

_id_6C2C()
{
    return scripts\mp\utility\perk::_hasperk( "specialty_empimmune" );
}

_id_D654( var_0 )
{
    if ( var_0 )
        scripts\mp\utility\perk::_id_6FA5( "specialty_empimmune" );
    else
        scripts\mp\utility\perk::removeperk( "specialty_empimmune" );
}

_id_AB53( var_0 )
{
    var_1 = var_0.attacker;

    if ( istrue( scripts\cp_mp\utility\player_utility::_id_B779( self, var_1 ) ) )
        var_1 thread scripts\mp\killstreaks\killstreaks::_id_6FCB();
}

_id_ABC3( var_0 )
{
    var_1 = var_0.attacker;

    if ( istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_1 ) ) )
        var_1 scripts\mp\killstreaks\killstreaks::_id_6FCC();
}
