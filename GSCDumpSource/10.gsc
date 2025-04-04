// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_01CE()
{
    if ( !isdefined( self._id_03C2 ) || !isdefined( self._id_CE6A ) )
        return;

    var_0 = self._id_03C2;
    var_1 = spawnstruct();
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1._id_EBE3 = gettime();

    if ( isdefined( self._id_EBE4 ) )
        var_1._id_EBE4 = self._id_EBE4;
    else
        var_1._id_EBE4 = spawnstruct();

    if ( isdefined( self._id_03E1 ) )
    {
        var_1._id_03E1 = spawnstruct();
        var_1._id_03E1._id_2C30 = self._id_03E1._id_2C30;
        var_1._id_03E1._id_8508 = self._id_03E1._id_8508;
    }

    if ( isdefined( self._id_02CD ) )
    {
        if ( isdefined( self._id_FEFA ) )
        {
            if ( isdefined( self._id_02CD._id_045A ) )
                var_1.target = self._id_02CD._id_045A;

            var_1._id_02CD = self._id_02CD;
        }

        var_1.target = self._id_02CD._id_045A;
    }

    var_0._id_EBE0 = var_1;

    if ( isdefined( self._id_CE6B ) && !isdefined( self._id_CD50 ) )
        _id_5F27( self._id_CE6B );
}

_id_5F27( var_0 )
{
    if ( !isdefined( level._id_BD61 ) )
        level._id_BD61 = [];

    if ( isdefined( level._id_BD61[var_0] ) )
        return;

    level._id_BD61[var_0] = 1;
    var_1 = _func_0070();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == self )
            continue;

        if ( !isdefined( var_3._id_CE6B ) )
            continue;

        if ( var_3._id_CE6B != var_0 )
            continue;

        var_3._id_CD50 = 1;
        var_3 _id_01CE();
        var_3 delete();
    }

    level._id_BD61[var_0] = undefined;
}

_id_3F70( var_0, var_1 )
{
    if ( !isdefined( level._id_5D99 ) )
    {
        self._id_FEC5 = undefined;

        if ( !isdefined( var_0 ) )
            var_2 = _func_0370();
        else if ( !_func_0106( var_0 ) && var_0 == "" )
            var_2 = _func_0370();
        else if ( _func_0106( var_0 ) )
            var_2 = makeweapon( var_0[randomint( var_0.size )] );
        else
            var_2 = makeweapon( var_0 );

        if ( !isnullweapon( var_2 ) )
        {
            self._id_CF73 = 1;

            if ( isdefined( var_1 ) && var_1 == "sidearm" )
                self._id_CF76 = var_0;
            else
                self._id_CF74 = var_0;
        }

        return var_2;
    }
    else
        return [[ level._id_5D99 ]]( var_0, var_1 );
}
