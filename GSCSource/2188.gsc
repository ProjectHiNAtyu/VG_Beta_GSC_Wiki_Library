// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_64B2( var_0 )
{
    if ( !isdefined( level._id_03E1._id_7208._id_7212[var_0] ) )
        return undefined;

    return level._id_03E1._id_7208._id_7212[var_0]._id_9D9E;
}

_id_71EE( var_0, var_1 )
{
    var_2 = _id_64B3( var_0, var_1 );
    scripts\engine\utility::_id_5BE4( var_2 );
    var_3 = level._id_03E1._id_71D7._id_01AF[var_0];
    var_4 = 1;

    foreach ( var_7, var_6 in var_3 )
    {
        if ( !issubstr( var_6, "allies" ) && scripts\engine\utility::_id_5BE0( var_6 ) )
            return;
    }

    if ( scripts\engine\utility::_id_5BE0( var_2 ) && self != level )
        self notify( var_0 );

    scripts\engine\utility::_id_5BE4( var_0 );
}

_id_71F0( var_0 )
{
    var_1 = _id_64B3( var_0 );

    if ( !scripts\engine\utility::_id_5BE0( var_1 ) && self != level )
        self notify( var_0 );

    scripts\engine\utility::_id_5BFB( var_1 );
    scripts\engine\utility::_id_5BFB( var_0 );
}

_id_71ED( var_0 )
{
    var_1 = _id_64B3( var_0 );
    return scripts\engine\utility::_id_5BE0( var_1 );
}

_id_64B3( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self._id_CE61;

    var_2 = var_0 + "-Group:" + var_1;
    return var_2;
}

_id_71F1( var_0 )
{
    var_1 = _id_64B3( var_0 );
    scripts\engine\utility::_id_5C04( var_1 );
}

_id_71F3( var_0 )
{
    var_1 = _id_64B3( var_0 );
    scripts\engine\utility::_id_5C10( var_1 );
}

_id_71F2( var_0, var_1 )
{
    var_2 = _id_64B3( var_0 );
    scripts\engine\utility::_id_5C0E( var_2, var_1 );
}

_id_71F4( var_0, var_1 )
{
    var_2 = _id_64B3( var_0 );
    scripts\engine\utility::_id_5C16( var_2, var_1 );
}

_id_71EF( var_0 )
{
    if ( isdefined( self._id_CE61 ) )
        self._id_CE61 = scripts\engine\utility::_id_EA4F( self._id_CE61 );
    else
        self._id_CE61 = "default";

    if ( self.team == "allies" )
        self._id_CE61 = self._id_CE61 + "allies";

    if ( !scripts\engine\utility::_id_5BEC( var_0 ) )
        scripts\engine\utility::_id_5BF1( var_0 );

    var_1 = _id_64B3( var_0 );

    if ( !scripts\engine\utility::_id_5BEC( var_1 ) )
    {
        scripts\engine\utility::_id_5BF1( var_1 );

        if ( !isdefined( level._id_03E1._id_71D7._id_01AF[var_0] ) )
            level._id_03E1._id_71D7._id_01AF[var_0] = [];

        level._id_03E1._id_71D7._id_01AF[var_0][level._id_03E1._id_71D7._id_01AF[var_0].size] = var_1;
    }
}

_id_71FE( var_0, var_1 )
{
    if ( !isdefined( level._id_03E1._id_3A73 ) )
        level._id_03E1._id_3A73 = [];

    level._id_03E1._id_3A73[var_0] = var_1;
}

_id_71DA()
{
    if ( !isdefined( level._id_03E1._id_71D7._id_7212[self._id_CE61] ) )
    {
        level._id_03E1._id_71D7._id_7212[self._id_CE61] = [];
        level._id_03E1._id_71D7 notify( self._id_CE61 );
    }

    level._id_03E1._id_71D7._id_7212[self._id_CE61][level._id_03E1._id_71D7._id_7212[self._id_CE61].size] = self;
}

_id_71FF()
{
    var_0 = _id_64B3( "stealth_spotted" );
    return scripts\engine\utility::_id_5BE0( var_0 );
}

_id_18DF( var_0 )
{
    if ( !scripts\engine\utility::_id_5BE0( "stealth_enabled" ) )
        return 0;

    foreach ( var_2 in level._id_03E1._id_7208._id_7212 )
    {
        if ( isdefined( var_0 ) && !scripts\engine\utility::array_contains( var_0, var_2.name ) )
            continue;

        if ( _id_0886::_id_71DB( var_2.name ) )
            return 1;
    }

    return 0;
}

_id_6770()
{
    switch ( self._id_03E1._id_E744 )
    {
        case 0:
            return "normal";
        case 1:
            return "warning";
        case 2:
            return "warning";
        case 3:
            return "attack";
    }
}

_id_D3BC( var_0 )
{
    switch ( var_0 )
    {
        case "attack":
            var_1 = 3;
            break;
        case "warning2":
            var_1 = 2;
            break;
        case "warning1":
            var_1 = 1;
            break;
        default:
            var_1 = 0;
            break;
    }

    self._id_03E1._id_E744 = var_1;
}

_id_34A0()
{

}

_id_140A()
{
    level._id_03E1._id_1401 = [];
    level._id_03E1._id_1401["normal"] = "noncombat";
    level._id_03E1._id_1401["reset"] = "noncombat";
    level._id_03E1._id_1401["warning1"] = "alert";
    level._id_03E1._id_1401["warning2"] = "alert";
    level._id_03E1._id_1401["combat_hunt"] = "alert";
    level._id_03E1._id_1401["attack"] = "combat";
    level._id_03E1._id_1402 = [];
    level._id_03E1._id_1402["normal"] = 0;
    level._id_03E1._id_1402["reset"] = 0;
    level._id_03E1._id_1402["warning1"] = 1;
    level._id_03E1._id_1402["warning2"] = 2;
    level._id_03E1._id_1402["combat_hunt"] = 2;
    level._id_03E1._id_1402["attack"] = 3;
    level._id_03E1._id_1401["combat"] = 3;
}

_id_140C( var_0 )
{
    if ( isdefined( level._id_03E1._id_1401[var_0] ) )
        return level._id_03E1._id_1401[var_0];

    return var_0;
}

_id_140D( var_0 )
{
    if ( isdefined( level._id_03E1._id_1402[var_0] ) )
        return level._id_03E1._id_1402[var_0];

    return -1;
}

_id_D1C0( var_0, var_1 )
{
    if ( !isdefined( var_0 ) && !isdefined( var_1 ) )
    {

    }

    _id_0888::_id_D1C1( var_0, var_1 );
}

_id_D283( var_0, var_1 )
{
    if ( !isdefined( var_0 ) && !isdefined( var_1 ) )
    {

    }

    if ( isdefined( var_0 ) )
    {
        level._id_03E1._id_4871._id_9F20["hidden"]["prone"] = var_0["prone"];
        level._id_03E1._id_4871._id_9F20["hidden"]["crouch"] = var_0["crouch"];
        level._id_03E1._id_4871._id_9F20["hidden"]["stand"] = var_0["stand"];
    }

    if ( isdefined( var_1 ) )
    {
        level._id_03E1._id_4871._id_9F20["spotted"]["prone"] = var_1["prone"];
        level._id_03E1._id_4871._id_9F20["spotted"]["crouch"] = var_1["crouch"];
        level._id_03E1._id_4871._id_9F20["spotted"]["stand"] = var_1["stand"];
    }
}

_id_4C07()
{
    if ( !isdefined( level.player._id_03E1 ) )
        _id_0887::_id_D3BA( 1 );

    switch ( self.team )
    {
        case "team3":
        case "axis":
            thread _id_0883::main();
            break;
        case "allies":
            thread _id_0885::main();
            break;
        case "neutral":
            thread _id_0889::main();
            break;
    }
}

_id_CB2B()
{
    if ( isdefined( self._id_03E1._id_8F0B ) )
        return;

    self._id_CB39 = self._id_CD49;

    if ( isdefined( self._id_8F40 ) )
        self._id_03E1._id_8F0B = self._id_8F40;
    else if ( isdefined( self._id_8F3F ) )
        self._id_03E1._id_8F0B = self._id_8F3F.origin;
    else if ( isdefined( self._id_8F41 ) )
        self._id_03E1._id_8F0B = self._id_8F41;
    else
        self._id_03E1._id_8F0B = self.origin;
}

_id_D2D9( var_0 )
{

}

_id_D1AA( var_0 )
{
    self._id_03E1._id_4560 = var_0;

    if ( isdefined( self._id_03E1._id_4560 ) )
        _id_D2DB( self._id_03E1._id_4560 );
}

_id_662C( var_0 )
{
    switch ( var_0 )
    {
        case "small":
            return 0;
        case "smed":
            return 1;
        case "med":
            return 2;
        case "large":
            return 3;
    }
}

_id_D2DB( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "unaware" )
        var_0 = "patrol";

    scripts\common\utility::_id_4786( var_0 );

    if ( var_0 == "cqb" )
    {
        var_4 = 60;

        if ( isdefined( self._id_03E1._id_7BA9 ) )
            var_4 = self._id_03E1._id_7BA9;

        scripts\engine\utility::set_movement_speed( var_4 );
    }

    if ( istrue( var_1 ) )
        _id_D2DA( var_2, var_3 );
}

_id_662D()
{
    return _id_0009::_id_1C39();
}

_id_662E()
{
    var_0 = self._id_03E1._id_4560;

    if ( !isdefined( var_0 ) )
        var_0 = level._id_03E1._id_4560;

    return var_0;
}

_id_D2DA( var_0, var_1 )
{
    if ( isdefined( self._id_03E1._id_2B4B ) )
    {
        if ( _id_662C( self._id_03E1._id_2B4B ) >= _id_662C( var_1 ) )
            return;
    }

    self._id_03E1._id_AF1C = var_1;
    self._id_03E1._id_AF1D = var_0;
    self._id_03E1._id_AF1E = gettime();
}

_id_70DA()
{
    self notify( "going_back" );
    self endon( "death" );

    if ( isdefined( self._id_03E1._id_7076 ) )
        self [[ self._id_03E1._id_7076 ]]();

    var_0 = self._id_03E1._id_8F0B;

    if ( isdefined( self._id_CB39 ) )
    {
        self._id_CD49 = self._id_CB39;
        self._id_CB39 = undefined;
    }

    if ( _func_02DC( var_0 ) )
    {
        self._id_03E1._id_8F0B = undefined;
        _id_E7D4( 0 );
        return;
    }

    if ( isdefined( var_0 ) )
    {
        self _meth_8325( var_0 );
        self._id_01E8 = 40;
    }

    if ( isdefined( var_0 ) )
        thread _id_70DB( var_0 );

    wait 0.05;
    _id_E7D4( 0 );
}

_id_70DB( var_0 )
{
    self endon( "death" );
    _id_10938( var_0 );
    self._id_03E1._id_8F49 = undefined;
}

_id_13FD( var_0 )
{
    var_1 = 2;

    if ( isdefined( self._id_03E1._id_9C37 ) )
        var_1 = self._id_03E1._id_9C37;

    if ( self [[ self._id_5D7C ]]() )
        var_1 = min( 1.5, var_1 );
    else if ( self [[ self._id_5D79 ]]() )
        var_1 = min( 1.0, var_1 );

    var_2 = 0.1;
    var_3 = 0.4;
    var_4 = 64;
    var_5 = 1024;
    var_6 = distance2d( self.origin, var_0.origin );

    if ( var_6 < var_4 )
    {
        var_7 = scripts\engine\math::_id_A5B2( 0, var_4, var_6 );
        var_8 = scripts\engine\math::_id_5878( var_2, var_3, var_7 );
    }
    else
    {
        var_7 = scripts\engine\math::_id_A5B2( var_4, var_5, var_6 );
        var_8 = scripts\engine\math::_id_5878( var_3, var_1, var_7 );
    }

    return var_8;
}

_id_D2D7( var_0 )
{
    var_0._id_4B96 = _id_6624( self.origin, var_0.origin, self );
}

_id_6624( var_0, var_1, var_2 )
{
    var_3 = self _meth_847A( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_2._id_AEB4 = var_3;

    var_4 = 0;

    for ( var_5 = 1; var_5 < var_3.size; var_5++ )
        var_4 = var_4 + distancesquared( var_3[var_5 - 1], var_3[var_5] );

    return var_4;
}

_id_C41D()
{
    self._id_AEB4 = undefined;
    self._id_4B96 = undefined;
}

_id_86F8( var_0 )
{
    if ( isplayer( self ) )
    {
        if ( scripts\engine\utility::_id_10E74( self.origin, self.angles, var_0.origin, 0.766 ) )
        {
            if ( isdefined( var_0._id_ED64 ) || _id_ED5E() )
                return 1;

            if ( scripts\anim\utility_common::_id_B3BF( self, var_0, 250 ) )
                return 1;
        }
    }
    else
        return self _meth_8066( var_0 );

    return 0;
}

_id_ED5E()
{
    return isdefined( self._id_A93E ) && isdefined( self._id_A93E._id_0026 ) && self._id_A93E._id_0026;
}

_id_6968()
{
    if ( isdefined( level._id_03E1 ) )
    {
        if ( isdefined( level._id_03E1._id_10A4 ) && isdefined( level._id_03E1._id_10A4[self getentitynumber()] ) )
            return self.origin;

        if ( isdefined( level._id_03E1._id_5D68 ) )
            return [[ level._id_03E1._id_5D68 ]]();
    }

    return self.origin;
}

_id_D485( var_0 )
{
    if ( isdefined( level._id_03E1 ) && isdefined( level._id_03E1._id_5D9A ) )
        return [[ level._id_03E1._id_5D9A ]]( var_0 );
}

_id_1083( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( level._id_03E1 ) && isdefined( level._id_03E1._id_5D33 ) )
        return [[ level._id_03E1._id_5D33 ]]( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_1881( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( level._id_03E1 ) && isdefined( level._id_03E1._id_5D3A ) )
        return [[ level._id_03E1._id_5D3A ]]( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_E7B5( var_0, var_1 )
{
    self notify( "stealth_music" );
    self endon( "stealth_music" );
    thread _id_E7B6();

    for (;;)
    {
        scripts\engine\utility::_id_5C04( "stealth_enabled" );
        scripts\engine\utility::_id_5C10( "stealth_spotted" );
        scripts\engine\utility::_id_5C10( "stealth_music_pause" );

        foreach ( var_3 in level.players )
            var_3 thread _id_E7B9( var_0 );

        scripts\engine\utility::_id_5C04( "stealth_spotted" );
        scripts\engine\utility::_id_5C10( "stealth_music_pause" );

        foreach ( var_3 in level.players )
            var_3 thread _id_E7B9( var_1 );
    }
}

_id_E7B7()
{
    self notify( "stealth_music" );
    self notify( "stealth_music_pause_monitor" );

    foreach ( var_1 in level.players )
        var_1 thread _id_E7B9( undefined );
}

_id_E7B6( var_0, var_1 )
{
    self notify( "stealth_music_pause_monitor" );
    self endon( "stealth_music_pause_monitor" );

    for (;;)
    {
        scripts\engine\utility::_id_5C04( "stealth_music_pause" );

        foreach ( var_3 in level.players )
            var_3 thread _id_E7B9( undefined );

        scripts\engine\utility::_id_5C10( "stealth_music_pause" );

        if ( scripts\engine\utility::_id_5BE0( "stealth_spotted" ) )
        {
            foreach ( var_3 in level.players )
                var_3 thread _id_E7B9( var_1 );

            continue;
        }

        foreach ( var_3 in level.players )
            var_3 thread _id_E7B9( var_0 );
    }
}

_id_E7B9( var_0 )
{
    if ( isdefined( self._id_5DA9 ) )
        return [[ self._id_5DA9 ]]( var_0 );
}

_id_FB7A()
{
    if ( isdefined( self._id_5DB0 ) )
        return [[ self._id_5DB0 ]]();
}

_id_D1CF( var_0 )
{
    if ( isdefined( level._id_03E1._id_5D9C ) )
        self [[ level._id_03E1._id_5D9C ]]( var_0 );
}

_id_D1D0( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( var_0 )
    {
        level._id_03E1._id_4B18 = 1;
        level._id_03E1._id_F167 = 0.4;
        level._id_03E1._id_F166 = 0.4;
        level._id_03E1._id_BDBE = 0;
        level._id_03E1._id_BDC0 = 0;
        level._id_03E1._id_BDBF = 0;
        setsaveddvar( "#x38b8e3afde018e32c", 0.25 );
        setsaveddvar( "#x3b2c2293119642503", cos( 90 ) );
        setsaveddvar( "#x3f00e4839cb5a6cda", 0.025 );
        setsaveddvar( "#x369c3046f22ec94c5", 0.25 );
    }
    else
    {
        level._id_03E1._id_4B18 = undefined;
        level._id_03E1._id_F167 = undefined;
        level._id_03E1._id_F166 = undefined;
        level._id_03E1._id_BDBE = 100;
        level._id_03E1._id_BDC0 = 150;
        level._id_03E1._id_BDBF = 60;
        setsaveddvar( "#x38b8e3afde018e32c", 0.5 );
        setsaveddvar( "#x3b2c2293119642503", cos( 180 ) );
        setsaveddvar( "#x3f00e4839cb5a6cda", 0.01 );
        setsaveddvar( "#x369c3046f22ec94c5", 0.1 );
    }

    var_1 = _func_0070();

    foreach ( var_3 in var_1 )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( isdefined( var_3._id_03E1 ) && isdefined( var_3._id_03E1._id_F156 ) )
            var_3 _id_088B::_id_F150();
    }
}

_id_E7D4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( var_0 )
    {
        self._id_C3B4 = 1;
        scripts\engine\utility::_id_5454( "stealth_override_goal" );
        _id_0883::_id_D166( 0 );
        self._id_8F3F = undefined;
    }
    else
        scripts\engine\utility::_id_5450( "stealth_override_goal" );
}

_id_E794()
{
    return scripts\engine\utility::_id_5452( "stealth_override_goal" ) && scripts\engine\utility::_id_544E( "stealth_override_goal" );
}

_id_E795()
{
    if ( _id_E794() )
        scripts\engine\utility::_id_545B( "stealth_override_goal" );
}

_id_4A37()
{
    scripts\engine\utility::_id_5BE4( "stealth_enabled" );
    _id_0887::_id_D3BA( 0 );
    var_0 = _func_0074( "all", "all" );

    foreach ( var_2 in var_0 )
        var_2 _id_5208( 0 );

    foreach ( var_5 in level.players )
    {
        var_5._id_0283 = 8192;

        if ( var_5 scripts\engine\utility::_id_5452( "stealth_enabled" ) )
            var_5 scripts\engine\utility::_id_5450( "stealth_enabled" );
    }

    _id_0888::_id_5672( "spotted" );
}

_id_5209()
{
    if ( !isdefined( level._id_03E1 ) )
    {
        if ( isdefined( level._id_5DA0 ) )
            [[ level._id_5DA0 ]]();
        else
            _id_0887::main();
    }
    else
        scripts\engine\utility::_id_5BFB( "stealth_enabled" );

    if ( !isdefined( level.player._id_03E1 ) )
        _id_0887::_id_D3BA( 1 );

    var_0 = _func_0074( "all", "all" );

    foreach ( var_2 in var_0 )
        var_2 _id_5208( 1 );

    foreach ( var_5 in level.players )
    {
        if ( var_5 scripts\engine\utility::_id_5452( "stealth_enabled" ) )
            var_5 scripts\engine\utility::_id_5454( "stealth_enabled" );
    }
}

_id_5208( var_0, var_1 )
{
    if ( !var_0 )
    {
        self._id_0283 = 8192;

        if ( scripts\engine\utility::_id_5452( "stealth_enabled" ) && scripts\engine\utility::_id_544E( "stealth_enabled" ) && self.team == "axis" )
        {
            var_2 = spawnstruct();
            var_2.origin = level.player.origin;
            var_2._id_84F7 = level.player.origin;
            var_2._id_84F8 = level.player.origin;
            var_2._id_048F = "combat";
            var_2._id_F8E1 = "attack";
            self._id_016A = 0;
            _id_0883::_id_2C3A( var_2 );
        }

        if ( istrue( var_1 ) )
            _id_38E4();
    }

    if ( scripts\engine\utility::_id_5452( "stealth_enabled" ) )
    {
        if ( var_0 )
            scripts\engine\utility::_id_5454( "stealth_enabled" );
        else
            scripts\engine\utility::_id_5450( "stealth_enabled" );
    }

    if ( var_0 && istrue( var_1 ) )
        _id_0EAB();
}

_id_423F( var_0 )
{
    if ( isdefined( var_0["spotted"] ) )
        self._id_E7E5["spotted"] = var_0["spotted"];

    if ( isdefined( var_0["hidden"] ) )
        self._id_E7E5["hidden"] = var_0["hidden"];
}

_id_D3B7( var_0, var_1 )
{
    self._id_03E1._id_6016[var_0] = var_1;
}

_id_D1E6( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( self._id_03E1 ) && isdefined( self._id_03E1._id_6016 ) )
        self._id_03E1._id_6016["event_" + var_0] = var_1;
}

_id_240D()
{
    self endon( "death" );

    if ( isdefined( self._id_5D78 ) && self [[ self._id_5D78 ]]() )
        return 1;

    if ( !isdefined( self._id_03E1 ) )
        return 1;

    return 0;
}

_id_0B38()
{
    return 1;
}

_id_10938( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_01E8;

    for (;;)
    {
        self waittill( "goal" );

        if ( distance( self.origin, var_0 ) < var_1 + 10 )
            break;
    }
}

_id_664F()
{
    if ( isdefined( level._id_03E1._id_5D6D ) )
        return [[ level._id_03E1._id_5D6D ]]( self );
}

_id_38E4()
{
    if ( isdefined( self._id_5D4F ) )
        [[ self._id_5D4F ]]();
}

_id_0EAB()
{
    if ( isdefined( self._id_5D32 ) )
        [[ self._id_5D32 ]]();
}
