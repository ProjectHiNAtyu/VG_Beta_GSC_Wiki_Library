// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_673B( var_0 )
{
    if ( scripts\common\utility::_id_8A2C() )
        var_0 = var_0 + 1;

    return level._id_496C[var_0];
}

_id_198E( var_0 )
{
    self._id_7218._id_9F8D = _id_642E( "missTimeConstant", var_0 );
    self._id_7218._id_9F8F = _id_642E( "missTimeDistanceFactor", var_0 );
    self._id_7218._id_4E75 = _id_642E( "double_grenades_allowed", var_0 );
}

_id_642E( var_0, var_1 )
{
    return _id_642D( var_0 ) * var_1;
}

_id_642D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self._id_60C7;

    return level._id_4969[var_0][_id_673B( var_1 )];
}

_id_642F( var_0 )
{
    return level._id_4969[var_0][_id_673B( level._id_60C7 )];
}

_id_162D()
{
    return 0;
}

_id_ADC7()
{
    if ( !_id_ADC8() )
        return 0;

    return randomint( 100 ) > 25;
}

_id_ADC8()
{
    if ( !isalive( self._id_017D ) )
        return 0;

    if ( !isplayer( self._id_017D ) )
        return 0;

    if ( !isalive( level._id_ADCF ) || level._id_ADCF._id_036A != "pain" )
        level._id_ADCF = self;

    if ( self == level._id_ADCF )
        return 0;

    var_0 = self._id_013E;

    if ( !isnullweapon( var_0 ) && var_0.ignoreme )
        return 0;

    return 1;
}

_id_D121()
{
    if ( scripts\anim\utility_common::_id_874C() && isalive( self._id_017D ) )
    {
        _id_D6C5();
        return;
    }

    if ( isplayer( self._id_017D ) )
    {
        _id_C612();

        if ( self._id_0DB6._id_9F8C > gettime() )
        {
            self._id_001D = 0;
            return;
        }
    }

    if ( isdefined( self._id_036A ) && self._id_036A == "move" )
    {
        if ( scripts\engine\utility::_id_0F4F() && isdefined( self._id_0B3E._id_909E ) && ( self._id_0B3E._id_909E._id_048F == "Exposed 3D" || self._id_0B3E._id_909E._id_048F == "Path 3D" ) )
            self._id_001D = self._id_0082;
        else if ( scripts\anim\utility::_id_87BC() )
            self._id_001D = anim._id_10988 * self._id_0082;
        else
            self._id_001D = anim._id_C996 * self._id_0082;

        return;
    }

    self._id_001D = self._id_0082;

    if ( isdefined( self._id_89C0 ) && isdefined( self._id_BFBC ) )
        self._id_001D = self._id_001D * self._id_BFBC;
}

_id_D6C5()
{
    if ( !isdefined( self._id_DFBA ) )
    {
        self._id_DFBA = 0;
        self._id_DFB0 = 0;
    }

    if ( !isdefined( self._id_DFA3 ) )
    {
        self._id_DFA3 = 1;
        var_0 = _id_673B( level._id_60C7 );
        var_1 = level._id_4969["sniperAccuDiffScale"][var_0];
        self._id_0082 = self._id_001D * var_1;
    }

    self._id_DFBA++;
    var_2 = level._id_60C7;

    if ( isplayer( self._id_017D ) )
        var_2 = self._id_017D._id_60C7;

    if ( _id_DB5A() )
    {
        self._id_001D = 0;

        if ( var_2 > 0 || self._id_DFBA > 1 )
            self._id_8FFE = self._id_017D;

        return;
    }

    if ( self._id_001D <= 10 )
        self._id_001D = ( 1 + 1 * self._id_DFB0 ) * self._id_0082;

    self._id_DFB0++;

    if ( var_2 < 1 && self._id_DFB0 == 1 )
        self._id_8FFE = undefined;
}

_id_DB5A()
{
    if ( isdefined( self._id_A42B ) && self._id_A42B )
        return 0;

    if ( self.team == "allies" )
        return 0;

    if ( isdefined( self._id_8FFE ) && self._id_017D == self._id_8FFE )
        return 0;

    if ( distancesquared( self.origin, self._id_017D.origin ) > 250000 )
        return 0;

    return 1;
}

_id_4958()
{
    self._id_0DB6._id_9F8E = 0;
}

_id_C617()
{
    if ( !self _meth_81B9() )
        return;

    if ( isnullweapon( self._id_04CE ) )
        return;

    if ( scripts\anim\utility_common::_id_874C() )
        return;

    if ( !scripts\anim\weaponlist::_id_FF04() && !scripts\anim\weaponlist::_id_FF1A() )
    {
        self._id_0DB6._id_9F8C = 0;
        return;
    }

    if ( !isalive( self._id_017D ) )
        return;

    if ( !isplayer( self._id_017D ) )
    {
        self._id_001D = self._id_0082;
        return;
    }

    var_0 = distance( self._id_017D.origin, self.origin );
    _id_D5ED( self._id_017D._id_7218._id_9F8D + var_0 * self._id_017D._id_7218._id_9F8F );
}

_id_C612()
{
    self._id_0DB6._id_9F8E = gettime() + 3000;
}

_id_D5ED( var_0 )
{
    if ( self._id_0DB6._id_9F8E > gettime() )
        return;

    if ( var_0 > 0 )
        self._id_001D = 0;

    var_0 = var_0 * 1000;
    self._id_0DB6._id_9F8C = gettime() + var_0;
    self._id_0DB6._id_0E37 = 1;
}

_id_4546()
{
    if ( self.team == "allies" )
        self._id_4E1E = 0.6;

    if ( self _meth_81B9() )
    {
        if ( level._id_60C7 >= 2 )
            self._id_4E1E = 0.8;
        else
            self._id_4E1E = 0.6;
    }
}

_id_01EE()
{
    if ( self.team == "allies" )
    {
        self._id_01EE = 0.9;
        self._id_01F0 = 0.9;
        return;
    }

    if ( self _meth_81B9() )
    {
        self._id_01EE = 1;
        self._id_01F0 = 0.2;
    }
}

_id_9A8C()
{
    if ( !isdefined( level._id_50C0 ) )
        return 1;

    if ( isdefined( level._id_50C0[level._id_036A] ) )
        return level._id_50C0[level._id_036A];

    return 0;
}

_id_D1DC()
{
    level._id_50C0 = [];
}
