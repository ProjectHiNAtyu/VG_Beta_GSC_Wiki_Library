// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "chopper_gunner", _id_0984::_id_F76D );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "chopper_gunner", "set_vehicle_hit_damage_data", ::_id_3631 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "chopper_gunner", "findTargetStruct", ::_id_362C );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "chopper_gunner", "assignTargetMarkers", ::_id_362A );
}

_id_3631( var_0, var_1 )
{
    _id_0A86::_id_D41E( var_0, var_1 );
}

_id_362C( var_0, var_1 )
{
    return _id_0985::_id_369B( var_0, var_1 );
}

_id_362A()
{
    var_0 = [];
    var_1 = [];
    var_2 = level.players;

    foreach ( var_4 in var_2 )
    {
        if ( level.teambased && var_4.team == self.team || var_4 == self.owner )
        {
            var_1[var_1.size] = var_4;
            continue;
        }

        if ( var_4 scripts\mp\utility\perk::_hasperk( "specialty_noscopeoutline" ) )
            continue;

        var_0[var_0.size] = var_4;
    }

    self._id_540C = scripts\cp\cp_weapon::_id_EEDC( "thermalvisionenemydefault", self.owner, var_0, self.owner, 0, 1, 1 );
    self._id_5F9E = scripts\cp\cp_weapon::_id_EEDC( "thermalvisionfriendlydefault", self.owner, var_1, self.owner, 1, 1 );
}
