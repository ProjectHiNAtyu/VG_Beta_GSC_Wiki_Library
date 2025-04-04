// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_4518()
{
    level._id_4520 = [];
    var_0 = spawnstruct();
    level._id_451F = var_0;
    var_0._id_5B74 = [];
    var_0._id_5B75 = [];
    var_0._id_5B72 = [];
    var_0._id_5B5C = [];
    var_0._id_5B59 = [];
    var_0._id_5B58 = [];
    var_0._id_5B60 = [];
    var_0._id_5B5E = [];
    var_0._id_5B5F = [];
    var_0._id_5B5D = [];
    var_0._id_5B74[var_0._id_5B74.size] = "ar";
    var_0._id_5B75["ar"] = 35;
    var_0._id_5B72["ar"] = 0.4;
    var_0._id_5B5C["ar"] = 3;
    var_0._id_5B59["ar"] = 0.5;
    var_0._id_5B58["ar"] = 2;
    var_0._id_5B60["ar"] = 175;
    var_0._id_5B5E["ar"] = 225;
    var_0._id_5B5F["ar"] = 55;
    var_0._id_5B5D["ar"] = 125;
    var_0._id_5B74[var_0._id_5B74.size] = "smg";
    var_0._id_5B75["smg"] = 50;
    var_0._id_5B72["smg"] = 0.4;
    var_0._id_5B5C["smg"] = 4;
    var_0._id_5B59["smg"] = 0.25;
    var_0._id_5B58["smg"] = 1;
    var_0._id_5B60["smg"] = 80;
    var_0._id_5B5E["smg"] = 125;
    var_0._id_5B5F["smg"] = 175;
    var_0._id_5B5D["smg"] = 265;
    var_0._id_5B74[var_0._id_5B74.size] = "sniper";
    var_0._id_5B75["sniper"] = 15;
    var_0._id_5B72["sniper"] = 0.4;
    var_0._id_5B5C["sniper"] = 2;
    var_0._id_5B59["sniper"] = 1;
    var_0._id_5B58["sniper"] = 3;
    var_0._id_5B60["sniper"] = 250;
    var_0._id_5B5E["sniper"] = 375;
    var_0._id_5B5F["sniper"] = 0;
    var_0._id_5B5D["sniper"] = 60;
}

_id_451E( var_0 )
{
    var_0 endon( "death" );
    _id_0A77::_id_BD07( "decoy grenade spawn", var_0.owner );
    var_0._id_B781 = [];
    var_0 _id_0764::_id_D151( ::_id_450D );
    var_0 _id_0764::_id_1510( 0 );
    _id_4508( var_0 );
    thread scripts\mp\weapons::_id_A0F3( self, var_0 );
    wait 0.4;
    var_0 _id_0764::_id_1510( 1 );
    var_0 thread _id_079A::_id_A0EC( 19, "hitequip", ::_id_4517, ::_id_4516 );
    var_0 thread _id_451C();
    wait 0.6;
    var_1 = gettime() + 5000;
    var_2 = gettime();
    var_3 = 3;

    while ( gettime() < var_1 )
    {
        if ( gettime() >= var_2 )
        {
            var_2 = gettime() + 200.0;

            if ( var_0 _id_4519() )
            {
                var_3--;

                if ( var_3 == 0 )
                    break;
            }
            else
                var_3 = 3;
        }

        wait 0.2;
    }

    var_0 thread _id_451B();
    var_0 thread _id_4507();
}

_id_4507()
{
    self endon( "death" );
    self setotherent( self.owner );
    self setscriptablepartstate( "beacon", "active", 0 );
    var_0 = _id_4512();

    for (;;)
    {
        _id_450F( var_0 );
        wait( randomfloatrange( 1.5, 3.5 ) );
    }
}

_id_450C()
{
    self setscriptablepartstate( "destroy", "active", 0 );
    self setscriptablepartstate( "beacon", "neutral", 0 );
    thread _id_450B( 0.1 );
}

_id_450B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    self notify( "death" );
    self._id_57AE = 1;
    _id_451D( self getentitynumber() );
    _id_079A::_id_A0ED();
    wait( var_0 );
    self delete();
}

_id_450F( var_0 )
{
    var_1 = _id_4513();
    var_2 = 1 + randomint( var_1._id_5B5C[var_0] );

    for (;;)
    {
        var_2--;
        _id_450E( var_0 );

        if ( var_2 == 0 )
            break;

        wait( randomfloatrange( var_1._id_5B59[var_0], var_1._id_5B58[var_0] ) );
    }
}

_id_450E( var_0 )
{
    var_1 = _id_4514();
    var_2 = _id_4510( var_1 );
    var_3 = _id_4511( var_1, var_0, var_2 );
    var_4 = self.owner getheldoffhand();

    if ( !isdefined( var_4 ) || var_4.basename != "s4_frag_usa_mk2_mp" )
        self.owner scripts\mp\utility\weapon::_id_0C1F( "s4_decoy_grenade_mp", self.origin, var_3, 100, 1, self );

    self setcandamage( 1 );
    self setscriptablepartstate( "beacon", "active", 0 );
    self setscriptablepartstate( "weaponFire", var_0 + "Fire", 0 );
    self setscriptablepartstate( "weaponSounds", var_0 + "Fire", 0 );
    _func_024D( self.origin, self.team, self.owner );
    _id_4509();
    var_5 = _id_4513();
    wait( var_5._id_5B72[var_0] );
}

_id_4509()
{
    var_0 = scripts\common\utility::_id_B7A3( self.origin, 800 );

    foreach ( var_2 in var_0 )
    {
        if ( !var_2 scripts\cp_mp\utility\player_utility::_id_0C14() )
            continue;

        if ( !istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_2 ) ) )
            continue;

        thread _id_450A( var_2 );
        self.owner _id_079A::_id_3A9F( "equip_decoy" );
        self.owner _id_0A7B::_id_7D93( "decoyHits", 1 );
    }
}

_id_450A( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = self.owner;
    var_1 endon( "disconnect" );
    self notify( "decoy_debuffEnemy_" + var_0 getentitynumber() );
    self endon( "decoy_debuffEnemy_" + var_0 getentitynumber() );

    if ( !isdefined( self._id_B781[var_0 getentitynumber()] ) )
        self._id_B781[var_0 getentitynumber()] = var_0;

    var_2 = var_0 scripts\engine\utility::_id_108F5( "death", 5 );

    if ( isdefined( self ) )
        self._id_B781[var_0 getentitynumber()] = undefined;

    if ( isdefined( var_0._id_8FE6 ) && var_0._id_8FE6 != var_1 )
    {
        if ( var_2 == "death" && scripts\cp_mp\utility\player_utility::_id_B779( var_0, var_1 ) )
            var_1 thread _id_0A76::_id_6FE6( "assist_decoy" );
    }
}

_id_451C()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = self.origin;
        waitframe();
        self._id_AA25 = var_0;
    }
}

_id_451B()
{
    self endon( "death" );
    wait 15;
    thread _id_450C();
}

_id_450D( var_0 )
{
    var_0._id_103C0 _id_4515( var_0.attacker );
    var_0._id_103C0 thread _id_450C();
}

_id_4516( var_0 )
{
    scripts\mp\weapons::_id_553D( self.owner, var_0.attacker, var_0.objweapon, var_0._id_9CBF );
    return var_0.damage;
}

_id_4517( var_0 )
{
    _id_4515( var_0.attacker, var_0.objweapon );
    thread _id_450C();
}

_id_4512()
{
    var_1 = 0;
    var_2 = [];
    var_3 = _id_4513();

    for ( var_4 = 0; var_4 < var_3._id_5B74.size; var_4++ )
    {
        var_5 = var_3._id_5B74[var_4];
        var_1 = var_1 + var_3._id_5B75[var_5];
        var_2[var_4] = var_1;
    }

    var_6 = randomint( var_1 );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_6 < var_2[var_4] )
            return var_3._id_5B74[var_4];
    }

    return undefined;
}

_id_4514()
{
    if ( !isdefined( self._id_AA25 ) )
        return undefined;

    return ( self.origin - self._id_AA25 ) / level._id_5F1B;
}

_id_4510( var_0 )
{
    var_1 = undefined;

    if ( !isdefined( var_0 ) )
        var_1 = ( 0, randomint( 360 ), 0 );
    else if ( var_0 * ( 1, 1, 0 ) == ( 0, 0, 0 ) )
        var_1 = ( 0, randomint( 360 ), 0 );
    else if ( randomint( 100 ) < 20 )
        var_1 = ( 0, randomint( 360 ), 0 );
    else
    {
        var_1 = vectortoangles( var_0 * ( 1, 1, 0 ) );
        var_2 = _func_000B( var_1[1] );
        var_2 = var_2 + _func_000A( -30.0 + randomint( 61 ) );
        var_1 = ( var_1[0], var_2, var_1[2] );
    }

    return var_1;
}

_id_4511( var_0, var_1, var_2 )
{
    var_3 = _id_4513();
    var_4 = var_0;
    var_4 = var_4 + anglestoup( var_2 ) * randomfloatrange( var_3._id_5B60[var_1], var_3._id_5B5E[var_1] );
    var_4 = var_4 + anglestoforward( var_2 ) * randomfloatrange( var_3._id_5B5F[var_1], var_3._id_5B5D[var_1] );
    return var_4;
}

_id_4519()
{
    var_0 = _id_4514();

    if ( !isdefined( var_0 ) || abs( var_0[2] ) <= 200 )
    {
        if ( _id_451A() )
            return 1;
    }

    return 0;
}

_id_451A()
{
    var_0 = scripts\engine\trace::_id_3EC3( 0, 1, 0, 0, 1, 1 );
    var_1 = self.origin + ( 0, 0, 1 );
    var_2 = var_1 + ( 0, 0, -5 );
    var_3 = _func_02BC( var_1, var_2, var_0, self, 0, "physicsquery_closest", 1 );

    if ( isdefined( var_3 ) && var_3.size > 0 )
        return 1;

    return 0;
}

_id_4515( var_0, var_1 )
{
    if ( isdefined( var_0 ) && istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 scripts\mp\killstreaks\killstreaks::_id_6FCD( self, var_1 );
    }
}

_id_4508( var_0 )
{
    level._id_4520[var_0 getentitynumber()] = var_0;
}

_id_451D( var_0 )
{
    level._id_4520[var_0] = undefined;
}

_id_4513()
{
    return level._id_451F;
}
