// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "gunship", _id_098B::_id_F781 );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "gunship", "findBoxCenter", ::_id_72BA );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "gunship", "getBombingPoint", ::_id_72BB );
    scripts\cp_mp\utility\script_utility::registersharedfunc( "gunship", "assignTargetMarkers", ::_id_72AE );
}

_id_72BA( var_0, var_1 )
{
    return _id_07EE::_id_5AC1( var_0, var_1 );
}

_id_72BB( var_0, var_1 )
{
    var_2 = _id_0993::_id_F314( var_0, var_1 );
    return var_2._id_0317;
}

_id_72AE( var_0 )
{
    var_1 = [];
    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( level.teambased && var_4.team == self.team || var_4 == self.owner )
        {
            var_2[var_2.size] = var_4;
            continue;
        }

        if ( var_4 scripts\mp\utility\perk::_hasperk( "specialty_noscopeoutline" ) )
            continue;

        var_1[var_1.size] = var_4;
    }

    self._id_540C = scripts\cp\cp_weapon::_id_EEDC( "thermalvisionenemydefault", self.owner, var_1, self.owner, 0, 1, 1 );
    self._id_5F9E = scripts\cp\cp_weapon::_id_EEDC( "thermalvisionfriendlydefault", self.owner, var_2, self.owner, 1, 1 );
}
