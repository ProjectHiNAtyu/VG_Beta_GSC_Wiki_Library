// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_giveweapon( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = -1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self giveweapon( var_0, var_1, istrue( var_2 ), -1, var_3 );
}

_switchtoweapon( var_0 )
{
    self _meth_83FF( var_0 );
}

_switchtoweaponimmediate( var_0 )
{
    self switchtoweaponimmediate( var_0 );
}

_takeweapon( var_0 )
{
    var_1 = 0;

    if ( isweapon( var_0 ) )
        var_1 = self _meth_8588() == var_0;
    else
        var_1 = getcompleteweaponname( self _meth_8588() ) == var_0;

    if ( var_1 )
    {
        var_2 = scripts\engine\utility::ter_op( _func_0120( var_0 ), var_0, getcompleteweaponname( var_0 ) );
        self _meth_858B( var_0 );
    }

    self takeweapon( var_0 );
}

_id_EDDC( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        var_1 = 0;

        if ( !_id_87C6( var_0 ) )
        {
            var_2 = self _meth_854C();

            if ( !isnullweapon( var_2 ) && self._id_0122 == var_2 )
                var_1 = 0;
            else
                var_1 = 1;
        }

        if ( var_1 )
            break;

        waitframe();
    }

    _takeweapon( var_0 );
}

_id_6987()
{
    _id_FF47();
    var_0 = self _meth_8588();

    if ( isnullweapon( var_0 ) )
        return undefined;

    return var_0;
}

_id_873B()
{
    return isdefined( _id_6987() );
}

_id_8A6D( var_0 )
{
    if ( _func_0120( var_0 ) )
        var_0 = makeweaponfromstring( var_0 );

    var_1 = _id_6987();
    return isdefined( var_1 ) && var_1 == var_0 && !_id_87C6( var_0 );
}

_id_3158( var_0, var_1 )
{
    if ( !self hasweapon( var_0 ) )
        return 0;

    if ( !scripts\common\utility::_id_8702() )
        return 0;

    if ( !istrue( var_1 ) && !scripts\common\utility::_id_870A() && !scripts\common\utility::_id_8692() )
        return 0;

    var_2 = _id_6987();

    if ( isdefined( var_2 ) )
    {
        var_3 = getweaponbasename( var_0 );
        var_4 = 0;

        if ( var_3 == "briefcase_bomb_mp" || var_3 == "briefcase_bomb_defuse_mp" || var_3 == "iw8_cyberemp_mp" || var_3 == "iw7_tdefball_mp" || var_3 == "s4_bomb_remote_mp" || var_3 == "s4_remote_bomb_defuse_mp" )
            var_4 = 1;
        else if ( _func_0271( var_2 ) == "primary" )
            var_4 = 1;

        if ( !var_4 )
            return 0;
    }

    if ( _id_87C6( var_0 ) )
        return 0;

    return 1;
}

_id_0DE3( var_0 )
{
    if ( self _meth_8588() == var_0 )
        self _meth_858B( var_0 );

    _takeweapon( var_0 );
    return;
}

_id_4D21( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "death" );

    if ( !_id_3158( var_0, var_2 ) )
        return 0;

    if ( _id_873B() )
        self _meth_858B( _id_6987() );

    self _meth_858A( var_0 );

    if ( istrue( var_1 ) )
        _switchtoweaponimmediate( var_0 );

    for (;;)
    {
        if ( _id_87C6( var_0 ) )
        {
            _id_FF47();
            return 1;
        }

        if ( !self _meth_8589( var_0 ) || !self hasweapon( var_0 ) )
            return 0;

        if ( !scripts\common\utility::_id_8702() || !istrue( var_2 ) && !scripts\common\utility::_id_870A() && !scripts\common\utility::_id_8692() )
        {
            self _meth_858B( var_0 );
            return 0;
        }

        waitframe();
    }
}

_id_FF47()
{
    var_0 = self getcurrentweapon();

    if ( self _meth_8589( var_0 ) )
        self _meth_858B( var_0 );
}

_id_6CD8( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !self hasweapon( var_0 ) )
        return 0;

    if ( !_id_87C6( var_0 ) )
    {
        _takeweapon( var_0 );
        return 1;
    }

    while ( _id_873B() )
        waitframe();

    if ( !_id_87C6( var_0 ) )
    {
        _takeweapon( var_0 );
        return 1;
    }

    var_2 = _id_4D21( self._id_8FAB, var_1 );

    if ( isbot( self ) )
    {
        self switchtoweaponimmediate( _func_0370() );
        var_2 = 1;
    }

    _takeweapon( var_0 );
    self notify( "bomb_allow_offhands" );

    if ( !var_2 )
        _id_5EB7();

    return 1;
}

_id_5EB7( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    while ( isnullweapon( self getcurrentweapon() ) )
    {
        if ( self isswitchingweapon() || _id_873B() )
        {
            waitframe();
            continue;
        }

        var_1 = _id_698A();
        var_2 = var_0;

        if ( !isdefined( var_2 ) || !self hasweapon( var_2 ) )
        {
            if ( !isdefined( self._id_8FAB ) || self._id_8FAB.basename == "none" )
                break;

            if ( self hasweapon( self._id_8FAB ) )
                var_2 = self._id_8FAB;
            else if ( var_1.size > 0 )
                var_2 = var_1[0];
        }

        if ( isdefined( var_2 ) && getweaponbasename( var_2 ) == "iw7_axe_mp" && self getweaponammoclip( var_2 ) == 0 && var_1.size == 1 )
            var_2.basename = "iw8_fists_mp";
        else if ( self hasweapon( "iw8_fists_mp" ) )
        {
            if ( var_1.size == 1 )
                var_2 = var_1[0];
            else if ( var_1.size == 2 && self hasweapon( "iw8_knifestab_mp" ) )
            {
                if ( var_1[0].basename == "iw8_fists_mp" )
                    var_2 = var_1[0];
                else
                    var_2 = var_1[1];
            }
        }

        _id_4D21( var_2 );
        waitframe();
    }
}

_id_87C6( var_0 )
{
    if ( _func_0120( var_0 ) )
        var_0 = makeweaponfromstring( var_0 );

    return issameweapon( self getcurrentweapon(), var_0, 1 );
}

_id_698A()
{
    var_0 = [];
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( !var_3._id_022A )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}
