// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_89EF( var_0 )
{
    if ( isweapon( var_0 ) && isnullweapon( var_0 ) )
        return 0;

    if ( _func_0120( var_0 ) && var_0 == "none" )
        return 0;

    return _func_0279( var_0 ) == "riotshield";
}

_id_C870()
{
    var_0 = 0;
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( _id_89EF( var_3 ) )
        {
            var_0 = 1;
            break;
        }
    }

    return var_0;
}

_id_C86F()
{
    var_0 = 0;
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( _id_89EF( var_3 ) )
            var_0++;

        if ( var_0 == 2 )
            break;
    }

    return var_0 == 2;
}

_id_C868( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0 )
    {
        self._id_C87A = var_1;
        var_2 = "j_shield_ri";
    }
    else
    {
        self._id_C87B = var_1;
        var_2 = "tag_shield_back";
    }

    self _meth_8020( var_1, var_2 );
    self._id_7589 = _id_C870();
}

_id_C86B( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    if ( var_0 )
    {
        var_1 = self._id_C87A;
        var_2 = "j_shield_ri";
    }
    else
    {
        var_1 = self._id_C87B;
        var_2 = "tag_shield_back";
    }

    self _meth_809E( var_1, var_2 );

    if ( var_0 )
        self._id_C87A = undefined;
    else
        self._id_C87B = undefined;

    self._id_7589 = _id_C870();
}

_id_C873( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 )
    {
        var_3 = self._id_C87A;
        var_1 = "j_shield_ri";
        var_2 = "tag_shield_back";
    }
    else
    {
        var_3 = self._id_C87B;
        var_1 = "tag_shield_back";
        var_2 = "j_shield_ri";
    }

    self _meth_8239( var_3, var_1, var_2 );

    if ( var_0 )
    {
        self._id_C87B = var_3;
        self._id_C87A = undefined;
    }
    else
    {
        self._id_C87A = var_3;
        self._id_C87B = undefined;
    }
}

_id_C86A()
{
    self._id_7589 = 0;
    self._id_C87B = undefined;
    self._id_C87A = undefined;
}

_id_C86D()
{
    return "weapon_wm_riotshield";
}

_id_D5A3()
{
    self._id_7D17 = 1;
}

_id_3921()
{
    self._id_7D17 = undefined;
}
