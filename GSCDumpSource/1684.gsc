// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_239A( var_0 )
{
    return undefined;
}

_id_23F2()
{
    if ( isdefined( self._id_0B3E._id_028A ) && self._id_0B3E._id_028A )
        return 1;

    if ( isdefined( self._id_0B3E._id_2DC7 ) )
        return self._id_0B3E._id_2DC7;

    return 0;
}

_id_23CF( var_0 )
{
    self._id_0B3E._id_014D = var_0;
}

_id_239F()
{
    return self._id_0B3E._id_014D;
}

_id_23B0( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_08C8::_id_488B();
    return var_4 == var_3;
}

_id_23B1( var_0, var_1, var_2, var_3 )
{
    return self._id_0B3E._id_014D == var_3[0] && _id_0009::_id_1C39() == var_3[1];
}

_id_23E0( var_0 )
{
    self._id_008F = !isdefined( var_0 ) || var_0;
}

_id_23AD()
{
    return self._id_008F;
}

_id_23B5( var_0, var_1, var_2, var_3 )
{
    return weaponclass( self._id_04CE ) == var_3;
}

_id_23E9( var_0, var_1, var_2, var_3 )
{
    if ( weaponclass( self._id_04CE ) != "rocketlauncher" )
        return 0;

    var_4 = _id_23A1();

    if ( !isdefined( var_4 ) )
        return 0;

    return var_4 != "rocketlauncher";
}

_id_23CA()
{

}

_id_238A()
{

}

_id_23BD()
{
    return self _meth_8565();
}

_id_23BE( var_0 )
{
    return self._id_0B3E._id_02B7 == var_0;
}

_id_23CB( var_0 )
{
    self._id_0B3E._id_02B7 = var_0;
}

_id_23D4( var_0 )
{
    self._id_0B3E._id_04D9 = var_0;
}

_id_238F()
{
    self._id_0B3E._id_04D9 = "none";
}

_id_23A1()
{
    if ( isdefined( self._id_0B3E._id_04D9 ) && self._id_0B3E._id_04D9 == "none" )
        return undefined;

    return self._id_0B3E._id_04D9;
}

_id_23CD( var_0 )
{
    if ( !isdefined( var_0 ) )
        self._id_0B3E._id_009B = 1;
    else
        self._id_0B3E._id_009B = var_0;
}

_id_23C1()
{
    return self._id_0B3E._id_009B;
}

_id_23D1( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        self._id_0B3E._id_2C43 = 1;
    else
        self._id_0B3E._id_2C43 = var_0;

    if ( self._id_0B3E._id_2C43 )
        self._id_0B3E._id_F190 = var_1;
    else
        self._id_0B3E._id_F190 = undefined;
}

_id_23EF()
{
    if ( isdefined( self._id_0B3E._id_2C43 ) )
        return self._id_0B3E._id_2C43 && isdefined( self._id_0B3E._id_F190 );

    return 0;
}

_id_23A3()
{
    return self._id_0B3E._id_F190;
}

_id_23C6( var_0 )
{
    if ( !isdefined( var_0 ) )
        self._id_0B3E._id_008B = 1;
    else
        self._id_0B3E._id_008B = var_0;
}

_id_2391()
{
    return istrue( self._id_0B3E._id_008B );
}

_id_2384( var_0 )
{
    self._id_0B3E._id_03A6 = var_0;
}

_id_23E6()
{
    if ( !istrue( self._id_0B3E._id_03A7 ) )
        return 1;

    if ( !isdefined( self._id_0B3E._id_03A1 ) && !isdefined( self._id_0B3E._id_039D ) )
        return 1;

    return 0;
}

_id_23E7()
{
    if ( !istrue( self._id_0B3E._id_03A7 ) )
        return 0;

    if ( !isdefined( self._id_0B3E._id_03A2 ) )
        return 0;

    return self._id_0B3E._id_03A8 == self._id_0B3E._id_03A2;
}

_id_23F1( var_0 )
{
    self._id_0B3E._id_03A1 = var_0;
}

_id_238D()
{
    self._id_0B3E._id_039D = undefined;
    self._id_0B3E._id_03A7 = 0;
}

_id_23E4( var_0, var_1 )
{

}

_id_23E8()
{
    if ( istrue( self._id_0B3E._id_03A7 ) )
    {
        if ( isdefined( self._id_03AA ) && isdefined( self._id_0B3E._id_03A1 ) )
            return 1;

        if ( istrue( self._id_016C ) )
            return 0;

        if ( isdefined( self _meth_8182() ) )
        {
            var_0 = _id_08C8::_id_F884();

            if ( isdefined( var_0 ) )
                return 1;
        }

        if ( isdefined( self._id_0B3E._id_039D ) && isdefined( self._id_017D ) && self._id_017D == self._id_0B3E._id_039D )
            return self _meth_8657();
    }

    return 0;
}

_id_23C5( var_0 )
{
    self._id_0B3E._id_0119 = var_0;
}

_id_239D()
{
    if ( !isdefined( self._id_0B3E._id_0119 ) )
        return "none";

    return self._id_0B3E._id_0119;
}

_id_23C3( var_0 )
{
    self._id_0B3E._id_0111 = var_0;
}

_id_239B()
{
    return self._id_0B3E._id_0111;
}

_id_23C2( var_0 )
{
    self._id_0B3E._id_0092 = var_0;
}

_id_23DB( var_0 )
{
    self._id_0B3E._id_0113 = var_0;
    self._id_0B3E._id_24CD = isdefined( var_0 );
}

_id_23A4( var_0, var_1, var_2, var_3 )
{
    return istrue( self._id_0B3E._id_24CD );
}

_id_2394()
{
    return self._id_0B3E._id_0113;
}

_id_23A0()
{
    if ( isdefined( self._id_0B3E._id_C566 ) )
        return self._id_0B3E._id_C566;

    return undefined;
}

_id_23D2( var_0 )
{
    self._id_0B3E._id_C566 = var_0;
}

_id_23D3( var_0 )
{
    self._id_0B3E._id_C567 = var_0;
}

_id_23A5( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_0B3E._id_03AE ) && isdefined( self._id_02CD ) && self._id_0B3E._id_03AE == self._id_02CD && distancesquared( self._id_02CD.origin, self.origin ) > 16;
}

_id_23D8()
{
    self._id_0B3E._id_005D = 1;
}

_id_2385()
{
    self._id_0B3E._id_005D = 0;
}

_id_23A6()
{
    if ( isdefined( self._id_036A ) )
    {
        if ( self._id_036A == "scripted" || self._id_036A == "<custom>" )
            return 1;
    }

    return istrue( self._id_0B3E._id_005D );
}

_id_23C8( var_0 )
{
    self._id_0B3E._id_028A = 1;
    self._id_0B3E._id_9D86 = var_0;
    self._id_0B3E._id_9D85 = 0;
}

_id_2398()
{
    if ( !self._id_0B3E._id_028A )
        return undefined;

    return self._id_0B3E._id_9D86;
}

_id_2387()
{
    self._id_0B3E._id_028A = 0;
    self._id_0B3E._id_9D86 = undefined;
}

_id_2388()
{
    self._id_0B3E._id_9D85 = undefined;
}

_id_23BA( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_0B3E._id_9D85 );
}

_id_23B9( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_0B3E._id_9D85 ) && self._id_0B3E._id_9D85;
}

_id_23BB()
{
    return self._id_0B3E._id_028A;
}

_id_23BC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_9D22 ) )
        return 1;

    if ( !isdefined( self._id_9D22.target ) )
        return 1;

    return 0;
}

_id_23C9( var_0, var_1 )
{
    self._id_0B3E._id_028B = 1;
    self._id_0B3E._id_9D83 = var_0;
    self._id_0B3E._id_9D84 = var_1;
    var_0 notify( "being_melee_charged", self );
}

_id_2386()
{
    self._id_0B3E._id_028B = 0;
    self._id_0B3E._id_9D83 = undefined;
    self._id_0B3E._id_9D84 = undefined;
}

_id_23B8()
{
    return isdefined( self._id_0B3E._id_028B ) && self._id_0B3E._id_028B && isdefined( self._id_0303 );
}

_id_23B7( var_0, var_1, var_2, var_3 )
{
    if ( _id_23B8() )
        return 0;

    return 1;
}

_id_2396()
{
    if ( !isdefined( self._id_0B3E._id_028B ) || !self._id_0B3E._id_028B )
        return undefined;

    return self._id_0B3E._id_9D83;
}

_id_2397()
{
    return self._id_0B3E._id_9D84;
}

_id_23C7( var_0 )
{
    self._id_0B3E._id_008D = var_0;
}

_id_23D5( var_0 )
{
    self._id_0B3E._id_10E12 = var_0;
}

_id_23B6()
{
    return isdefined( self._id_0B3E._id_10E12 );
}

_id_23A2()
{
    return self._id_0B3E._id_10E12;
}

_id_23A9()
{
    var_0 = _id_2394();

    if ( !isdefined( var_0 ) )
        var_0 = self._id_02CD;

    var_1 = isdefined( var_0 ) && ( var_0._id_048F == "Conceal Crouch" || var_0._id_048F == "Conceal Stand" );
    return self._id_0B3E._id_02B7 == "frantic" && !var_1;
}

_id_23AE()
{
    var_0 = _id_2399();

    if ( isdefined( var_0 ) )
        return 1;

    return 0;
}

_id_2399()
{
    var_0 = 0;
    var_1 = undefined;

    if ( !isdefined( self._id_0B3E._id_4B22 ) )
        return var_1;

    if ( isdefined( self._id_0B3E._id_4B22["left_leg"] ) )
    {
        var_0++;
        var_1 = "left";
    }

    if ( isdefined( self._id_0B3E._id_4B22["right_leg"] ) )
    {
        var_0++;
        var_1 = "right";
    }

    if ( var_0 == 2 )
        var_1 = "both";

    return var_1;
}

_id_8957( var_0 )
{
    if ( !isdefined( self._id_0B3E ) )
        return 0;

    if ( isdefined( self._id_0B3E._id_CF17 ) )
    {
        if ( !isdefined( self._id_0B3E._id_CF17[var_0] ) )
            return 0;

        return self._id_0B3E._id_CF17[var_0]._id_E744 == "dismember";
    }

    if ( !isdefined( self._id_0B3E._id_4B22 ) )
        return 0;

    return isdefined( self._id_0B3E._id_4B22[var_0] );
}

_id_23AF( var_0, var_1, var_2, var_3 )
{
    return _id_8957( var_3 );
}

_id_10A1A( var_0 )
{
    if ( isdefined( self._id_0B3E._id_CF17 ) )
    {
        if ( !isdefined( self._id_0B3E._id_CF17[var_0] ) )
            return 0;

        if ( self._id_0B3E._id_CF17[var_0]._id_E744 != "dismember" )
            return 0;

        return self._id_0B3E._id_CF17[var_0]._id_F1E5 == gettime();
    }

    if ( !isdefined( self._id_0B3E._id_4B22 ) )
        return 0;

    if ( !isdefined( self._id_0B3E._id_4B22[var_0] ) )
        return 0;

    return self._id_0B3E._id_4B22[var_0] == gettime();
}

_id_23F3( var_0, var_1, var_2, var_3 )
{
    return _id_10A1A( var_3 );
}

_id_23F4( var_0, var_1, var_2, var_3 )
{
    return _id_8957( var_3[0] ) && _id_10A1A( var_3[1] );
}

_id_2390( var_0 )
{
    self._id_0B3E._id_4B22[var_0] = gettime();
}

_id_23E3( var_0 )
{
    self._id_0B3E._id_D076 = var_0;
}

_id_23B3()
{
    if ( !isdefined( self._id_0B3E._id_D076 ) )
    {
        if ( isdefined( self._id_2C38._id_5E9D ) && gettime() > self._id_2C38._id_5E9D )
            self._id_0B3E._id_D076 = 1;
    }

    return isdefined( self._id_0B3E._id_D076 );
}

_id_23D7()
{
    self._id_0B3E._id_D077 = 1;
}

_id_23EA()
{
    return isdefined( self._id_0B3E._id_D077 );
}

_id_23DE( var_0 )
{
    self._id_0B3E._id_8876 = var_0;
}

_id_23AB()
{
    if ( isdefined( self._id_2C38._id_3E9C ) )
        return 0;

    return isdefined( self._id_0B3E._id_8876 );
}

_id_23D9( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = "left";

    if ( var_0 == var_2 )
        var_2 = "right";

    if ( isdefined( self._id_0B3E._id_C8B4 ) && isdefined( self._id_0B3E._id_C8B4[var_2] ) )
    {
        self._id_0B3E._id_C8B4[var_2] = 0;
        self._id_0B3E._id_C8B4[var_0] = 0;
        return;
    }

    self._id_0B3E._id_C8B4[var_0] = var_1;
}

_id_2382( var_0 )
{
    if ( !isdefined( self._id_0B3E._id_C8B4 ) )
        return 0;

    if ( !isdefined( self._id_0B3E._id_C8B4[var_0] ) )
        return 0;

    if ( !self._id_0B3E._id_C8B4[var_0] )
        return 0;

    return 1;
}

_id_23E2( var_0 )
{
    self._id_0B3E._id_C8B5 = var_0;
}

_id_238C( var_0 )
{
    self._id_0B3E._id_C8B6 = undefined;
}

_id_23B2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_0B3E._id_C8B5 ) )
        return 0;

    return 1;
}

_id_23E1( var_0 )
{
    self._id_9D22 = spawnstruct();
    var_0._id_9D22 = spawnstruct();
    self._id_9D22.target = var_0;
    self._id_9D22._id_AE70 = var_0;
    var_0._id_9D22._id_AE70 = self;
}

_id_2389()
{
    if ( !isdefined( self._id_9D22 ) )
        return;

    if ( isdefined( self._id_9D22.target ) )
        self._id_9D22.target._id_9D22 = undefined;

    if ( isdefined( self._id_9D22._id_F04D ) )
        self._id_9D22._id_F04D delete();

    self._id_9D22 = undefined;
}

_id_23DC( var_0 )
{
    self._id_0B3E._id_3E9B = var_0;
}

_id_23A8()
{
    return isdefined( self._id_0B3E._id_3E9B );
}

_id_23DD( var_0 )
{
    self._id_0B3E._id_75B9 = var_0;
}

_id_23AA()
{
    return isdefined( self._id_0B3E._id_75B9 );
}

_id_2395()
{
    return self._id_0B3E._id_75B9;
}

_id_23DF( var_0 )
{
    self._id_0B3E._id_23F5 = var_0;
}

_id_23AC()
{
    return istrue( self._id_0B3E._id_23F5 );
}

_id_23DA( var_0 )
{
    if ( isdefined( self._id_0B3E._id_37BD ) && self._id_0B3E._id_37BD == var_0 )
        return;

    self._id_0B3E._id_37BD = var_0;
    self._id_0B3E._id_37BE = gettime();
}

_id_2392()
{
    return self._id_0B3E._id_37BD;
}

_id_2393()
{
    return self._id_0B3E._id_37BE;
}

_id_2383( var_0 )
{
    scripts\engine\utility::set_movement_speed( var_0 );
}

_id_23B4()
{
    return istrue( self._id_0B3E._id_DA39 );
}

_id_23E5( var_0 )
{
    self._id_0B3E._id_DA39 = var_0;
}

_id_23EC()
{
    return isdefined( self._id_0B3E._id_DE19 );
}

_id_23CE( var_0 )
{
    self._id_0B3E._id_DE19 = var_0;
}

_id_239E()
{
    return self._id_0B3E._id_DE19;
}

_id_238E()
{
    self._id_0B3E._id_DE19 = undefined;
    _id_238B();
}

_id_23CC()
{
    self._id_0B3E._id_29C7 = 1;
}

_id_238B()
{
    self._id_0B3E._id_29C7 = undefined;
}

_id_23BF()
{
    return istrue( self._id_0B3E._id_29C7 );
}

_id_23C4( var_0, var_1 )
{
    self._id_0B3E._id_4C2D = var_0;
    self._id_0B3E._id_4C2E = var_1;
}

_id_239C()
{
    return [ self._id_0B3E._id_4C2D, self._id_0B3E._id_4C2E ];
}

_id_23D6()
{
    self._id_0B3E._id_4C2D = undefined;
    self._id_0B3E._id_4C2E = undefined;
}

_id_23A7()
{
    return isdefined( self._id_0B3E._id_4C2D );
}

_id_2381( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_0B3E._id_62CE ) )
        return 0;

    if ( isdefined( var_3 ) && self._id_0B3E._id_62CE._id_628B != var_3 )
        return 0;

    if ( !isdefined( self._id_0B3E._id_62CE._id_90BD ) )
        return 0;

    if ( gettime() > self._id_0B3E._id_62CE._id_F22F )
        return 0;

    var_4 = self._id_0B3E._id_62CE._id_90BD;

    if ( !_id_0009::_id_1C4A( var_2, var_4 ) )
        return 0;

    return 1;
}

_id_23EB( var_0, var_1, var_2 )
{
    if ( !istrue( self._id_0B3E._id_89D5 ) )
        return 0;

    var_3 = 50;
    return randomint( 100 ) <= var_3;
}
