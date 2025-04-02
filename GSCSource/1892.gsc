// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_5161()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "emp", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "emp", "init" ) ]]();
}

_id_1990( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.attacker = var_0;
    var_2._id_103C0 = self;
    var_2.objweapon = var_1;
    _id_1991( var_2 );
}

_id_1991( var_0 )
{
    if ( !isdefined( var_0.damage ) )
        var_0.damage = 1;

    if ( !isdefined( var_0._id_9CBF ) )
        var_0._id_9CBF = "MOD_EXPLOSIVE";

    if ( !isdefined( var_0._id_0317 ) )
        var_0._id_0317 = ( 0, 0, 0 );

    if ( !isdefined( var_0._id_49A9 ) )
        var_0._id_49A9 = ( 0, 0, 0 );

    if ( !isdefined( var_0._id_02AF ) )
        var_0._id_02AF = 0;

    if ( !isdefined( var_0._id_02FA ) )
        var_0._id_02FA = "";

    if ( !isdefined( var_0._id_0455 ) )
        var_0._id_0455 = 0;

    if ( !isdefined( var_0._id_42E3 ) )
        var_0._id_42E3 = 0;

    if ( !isdefined( var_0._id_798D ) )
        var_0._id_798D = "none";

    if ( !isdefined( var_0._id_F21C ) )
        var_0._id_F21C = 0;

    if ( !isdefined( var_0._id_103C0._id_5171 ) )
        var_0._id_103C0._id_5171 = 0;

    var_0._id_103C0._id_5171++;

    if ( var_0._id_103C0._id_5171 == 1 )
    {
        if ( isplayer( var_0._id_103C0 ) )
            var_0._id_103C0 thread _id_E5CD( var_0 );

        if ( isdefined( var_0._id_103C0._id_51A1 ) )
            var_0._id_103C0 thread [[ var_0._id_103C0._id_51A1 ]]( var_0 );

        var_0._id_103C0 notify( "emp_started", var_0 );
    }

    if ( isdefined( var_0._id_103C0._id_516F ) )
        var_0._id_103C0 thread [[ var_0._id_103C0._id_516F ]]( var_0 );

    var_0._id_103C0 notify( "emp_applied", var_0 );
}

_id_C3A0()
{
    self._id_5171--;

    if ( isdefined( self._id_519C ) )
        self thread [[ self._id_519C ]]();

    self notify( "emp_removed" );

    if ( self._id_5171 == 0 )
        _id_38A7( 0 );
}

_id_38A7( var_0 )
{
    if ( isdefined( self._id_5171 ) )
    {
        self._id_5171 = undefined;

        if ( isplayer( self ) )
            thread _id_E88D( istrue( var_0 ) );
        else if ( isdefined( self._id_5170 ) )
            self thread [[ self._id_5170 ]]( istrue( var_0 ) );

        self notify( "emp_cleared" );
    }
}

_id_8598( var_0 )
{
    var_1 = 0;

    switch ( var_0.basename )
    {
        case "emp_grenade_mp":
            var_1 = 1;
    }

    return var_1;
}

_id_8597( var_0, var_1 )
{
    if ( !_id_8598( var_0 ) )
        return 0;

    if ( !_func_010E( var_1 ) )
        return 0;

    return 1;
}

_id_1510( var_0 )
{
    if ( isplayer( self ) )
        _id_1511( var_0 );
    else
    {
        if ( !isdefined( self._id_5199 ) )
            self._id_5199 = 0;

        if ( var_0 )
            self._id_5199--;
        else
            self._id_5199++;
    }
}

_id_3091()
{
    if ( isplayer( self ) )
        return _id_309C();
    else if ( istrue( self._id_57AE ) )
        return 0;
    else if ( istrue( self._id_5199 ) )
        return 0;

    return 1;
}

_id_8599()
{
    return isdefined( self._id_5171 ) && self._id_5171 > 0;
}

_id_644F()
{
    var_0 = _id_5167();
    _id_516E();
    return var_0._id_5507;
}

_id_D151( var_0 )
{
    self._id_516F = var_0;
}

_id_D3AD( var_0 )
{
    self._id_51A1 = var_0;
}

_id_D37A( var_0 )
{
    self._id_519C = var_0;
}

_id_D17C( var_0 )
{
    self._id_5170 = var_0;
}

_id_0FA8( var_0 )
{
    var_1 = _id_5167();
    var_2 = var_0 getentitynumber();
    var_1._id_5506[var_2] = var_0;
    return var_2;
}

_id_B20B( var_0 )
{
    if ( var_0 == 0 )
        return;

    if ( !isdefined( self._id_519E ) )
        self._id_519E = [];

    var_1 = self._id_519E[var_0];

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self._id_519E[var_0] = var_1 + 1;
    _id_0D7A();
}

_id_E88E( var_0 )
{
    if ( var_0 == 0 )
        return;

    self._id_519E[var_0] = self._id_519E[var_0] - 1;

    if ( self._id_519E[var_0] == 0 )
        self._id_519E[var_0] = undefined;

    _id_0D7A();
}

_id_0D7A()
{
    var_0 = 0;

    foreach ( var_3, var_2 in self._id_519E )
    {
        if ( var_3 > var_0 )
            var_0 = var_3;
    }

    self setclientomnvar( "ui_scrambler_strength", var_0 );
}

_id_B2A1( var_0, var_1 )
{
    var_0 _id_B20B( var_1 );
    scripts\engine\utility::waittill_any_2( "emp_cleared", "death" );

    if ( isdefined( var_0 ) )
        var_0 _id_E88E( var_1 );
}

_id_1511( var_0 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "emp", "setPlayerEMPImmune" ) )
        self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "emp", "setPlayerEMPImmune" ) ]]( var_0 );
}

_id_309C()
{
    if ( !scripts\cp_mp\utility\player_utility::_id_0C14() )
        return 0;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "emp", "getPlayerEMPImmune" ) )
        return ![[ scripts\cp_mp\utility\script_utility::getsharedfunc( "emp", "getPlayerEMPImmune" ) ]]();

    return 1;
}

_id_E5CD( var_0 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "emp", "onPlayerEMPed" ) )
        self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "emp", "onPlayerEMPed" ) ]]( var_0 );

    self _meth_830D( 1 );
    scripts\common\utility::_id_1527( 0, "emp" );
    scripts\common\utility::_id_155F( 0, "emp" );
}

_id_E88D( var_0 )
{
    self _meth_830D( 0 );

    if ( !var_0 )
    {
        scripts\common\utility::_id_1527( 1, "emp" );
        scripts\common\utility::_id_155F( 1, "emp" );
    }
}

_id_516C()
{
    var_0 = spawnstruct();
    level._id_515F = var_0;
    level._id_515F._id_5506 = [];
}

_id_5167()
{
    if ( !isdefined( level._id_515F ) )
        _id_516C();

    return level._id_515F;
}

_id_516E()
{
    var_0 = _id_5167();
    var_1 = [];

    foreach ( var_3 in var_0._id_5506 )
    {
        if ( isdefined( var_3 ) && var_3 _id_3091() )
            var_1[var_1.size] = var_3;
    }

    foreach ( var_6 in level._id_9ECB )
    {
        if ( isdefined( var_6 ) && var_6 _id_3091() )
            var_1[var_1.size] = var_6;
    }

    var_8 = getentarray( "misc_turret", "classname" );

    foreach ( var_10 in var_8 )
    {
        if ( isdefined( var_10 ) && var_10 _id_3091() )
            var_1[var_1.size] = var_10;
    }

    if ( isdefined( level._id_0F23 ) )
    {
        foreach ( var_13 in level._id_0F23 )
        {
            if ( isdefined( var_13 ) && var_13 _id_3091() )
                var_1[var_1.size] = var_13;
        }
    }

    if ( isdefined( level._id_FFF1 ) )
    {
        foreach ( var_16 in level._id_FFF1._id_82E6 )
        {
            foreach ( var_18 in var_16 )
            {
                if ( isdefined( var_18 ) && var_18 _id_3091() )
                    var_1[var_1.size] = var_18;
            }
        }
    }

    if ( isdefined( level._id_4520 ) )
    {
        foreach ( var_22 in level._id_4520 )
        {
            if ( isdefined( var_22 ) && var_22 _id_3091() )
                var_1[var_1.size] = var_22;
        }
    }

    foreach ( var_25 in level.players )
    {
        if ( !isplayer( var_25 ) && var_25 _id_3091() )
            var_1[var_1.size] = var_25;
    }

    var_0._id_5507 = var_1;
    thread _id_516D();
}

_id_516D()
{
    var_0 = _id_5167();
    waittillframeend;
    var_0._id_5507 = undefined;
}
