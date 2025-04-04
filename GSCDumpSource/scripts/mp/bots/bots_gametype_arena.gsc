// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    level._id_27D0 = 0;
    _id_D78A();
    _id_D758();
}

_id_D78A()
{
    if ( scripts\mp\gametypes\arena::_id_8965() )
    {
        level._id_2777["dropped_weapon_think"] = ::_id_1A3A;
        level._id_2777["dropped_weapon_cancel"] = ::_id_1A76;
    }

    level._id_2777["gametype_think"] = ::_id_26D9;
}

_id_D758()
{
    if ( !scripts\mp\gametypes\arena::_id_8936() )
        level._id_291D = 1;

    while ( !isdefined( level._id_1A7E ) )
        waitframe();

    if ( istrue( game["isLaunchChunk"] ) )
    {
        if ( game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3 )
            return;
    }

    var_0 = scripts\engine\utility::ter_op( level._id_A8FC == 1, 3, 1 );
    scripts\mp\bots\bots_gametype_dom::_id_D765( var_0, 3 );
}

_id_26D9()
{
    self notify( "bot_arena_think" );
    self endon( "bot_arena_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( self.pers["bot_original_personality"] ) )
        self.pers["bot_original_personality"] = self._id_B010;

    wait 0.1;

    if ( !scripts\mp\gametypes\arena::_id_8936() )
    {
        if ( self _meth_802F( "advancedPersonality" ) && self _meth_802F( "strategyLevel" ) > 0 )
            scripts\mp\bots\bots_gametype_gun::_id_27BF( self getcurrentweapon().basename, self.pers["bot_original_personality"] );
    }

    for (;;)
    {
        if ( isdefined( level._id_1A7E ) && level._id_1A7E._id_10418 == "any" )
        {
            if ( !_id_09D1::_id_27DB() )
                _id_09D0::_id_2704( level._id_1A7E._id_047A.origin, level._id_1A7E._id_A565, level._id_1A7E._id_047A );
        }
        else
            self [[ self._id_B012 ]]();

        wait 0.05;
    }
}

_id_1A3A()
{
    self notify( "bot_think_seek_dropped_weapons" );
    self endon( "bot_think_seek_dropped_weapons" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    var_0 = "s4_throwing_knife_mp";

    for (;;)
    {
        var_1 = 0;

        if ( _id_1A37() || _id_09D1::_id_27A1( 0.33 ) )
        {
            if ( self [[ level._id_2777["should_pickup_weapons"] ]]() && !_id_09D1::_id_27E9() )
            {
                var_2 = getentarray( "dropped_weapon", "targetname" );
                var_3 = scripts\engine\utility::_id_634A( self.origin, var_2 );

                if ( var_3.size > 0 )
                {
                    var_4 = var_3[0];
                    level._id_5023 = var_4;
                    _id_1A39( var_4 );
                }
            }
        }

        if ( !_id_09D1::_id_27D1() && !_id_09D1::_id_27E9() && self _meth_802F( "strategyLevel" ) > 0 )
        {
            var_5 = self hasweapon( var_0 );
            var_6 = var_5 && self _meth_8109( var_0 ) == 0;

            if ( var_6 )
            {
                if ( isdefined( self._id_707B ) )
                {
                    wait 5.0;
                    continue;
                }

                var_7 = getentarray( "dropped_knife", "targetname" );
                var_8 = scripts\engine\utility::_id_634A( self.origin, var_7 );

                foreach ( var_10 in var_8 )
                {
                    if ( !isdefined( var_10 ) )
                        continue;

                    if ( !isdefined( var_10._id_2EBD ) )
                    {
                        var_11 = _id_09D1::_id_2875( "BotGetClosestNavigablePoint", _id_09D1::_id_5FFA, var_10.origin, 32, self );

                        if ( isdefined( var_10 ) )
                        {
                            var_10._id_39C2 = var_11;
                            var_10._id_2EBD = 1;
                        }
                        else
                            continue;
                    }

                    if ( isdefined( var_10._id_39C2 ) )
                    {
                        self._id_707B = 1;
                        _id_1A39( var_10 );
                    }
                }
            }
            else if ( var_5 )
                self._id_707B = undefined;
        }

        wait( randomfloatrange( 0.25, 0.75 ) );
    }
}

_id_1A39( var_0 )
{
    if ( _id_09D0::_id_27C7( "seek_dropped_weapon", var_0 ) == 0 )
    {
        if ( istrue( level._id_DFBC ) )
        {
            var_1 = self _meth_802C( "lethal" );
            var_2 = self _meth_802C( "tactical" );

            if ( isdefined( var_1 ) && var_1.basename == "snowball_mp" )
            {
                var_3 = scripts\mp\equipment::_id_6985( "primary" );
                var_4 = scripts\mp\equipment::_id_69F0( var_3 );

                if ( var_1.basename == "snowball_mp" && var_4 > 3 )
                    return;
            }

            if ( isdefined( var_2 ) && var_2.basename == "pball_mp" )
            {
                var_3 = scripts\mp\equipment::_id_6985( "secondary" );
                var_4 = scripts\mp\equipment::_id_69F0( var_3 );

                if ( var_2.basename == "pball_mp" )
                    return;
            }
        }

        var_5 = undefined;

        if ( var_0._id_045A == "dropped_weapon" )
        {
            var_6 = 1;
            var_7 = self getweaponslistprimaries();

            foreach ( var_9 in var_7 )
            {
                if ( var_0.model == getweaponmodel( var_9 ) )
                    var_6 = 0;
            }

            if ( var_6 )
                var_5 = ::_id_1A38;
        }

        var_11 = spawnstruct();
        var_11._id_A84D = var_0;
        var_11._id_CD65 = 12;
        var_11._id_DA69 = level._id_2777["dropped_weapon_cancel"];
        var_11._id_0E5D = var_5;
        var_12 = undefined;
        var_13 = var_0.origin;

        if ( isdefined( var_0._id_2867 ) )
            var_13 = var_0._id_2867;

        _id_09D0::_id_283C( "seek_dropped_weapon", var_13, 100, var_11 );
    }
}

_id_1A38( var_0 )
{
    self _meth_804D( "use", 0.5 );
    thread _id_FC15();
}

_id_FC15()
{
    self notify( "updateBotWeaponBehavior" );
    self endon( "updateBotWeaponBehavior" );
    wait 2;

    if ( self _meth_802F( "advancedPersonality" ) && self _meth_802F( "strategyLevel" ) > 0 )
        scripts\mp\bots\bots_gametype_gun::_id_27BF( self getcurrentweapon().basename, self.pers["bot_original_personality"] );
}

_id_1A76( var_0 )
{
    if ( _id_1A36() > 0 )
    {
        var_1 = scripts\mp\utility\weapon::_id_6E59( self getcurrentweapon() );

        if ( isdefined( var_0._id_A84D ) )
        {
            var_2 = var_0._id_A84D.classname;

            if ( scripts\engine\utility::string_starts_with( var_2, "weapon_" ) )
                var_2 = _func_00D6( var_2, 7 );

            var_3 = scripts\mp\utility\weapon::_id_6E59( var_2 );

            if ( !_id_2902( var_1, var_3 ) )
                return 1;
        }
    }

    if ( !isdefined( var_0._id_A84D ) )
        return 1;

    if ( var_0._id_A84D._id_045A == "dropped_weapon" )
    {
        foreach ( var_5 in self._id_10DA7 )
        {
            if ( var_5.basename == "s4_me_fists_mp" )
                return 0;
        }

        if ( _id_1A36() > 0 )
            return 1;
    }
    else if ( var_0._id_A84D._id_045A == "dropped_knife" )
    {
        if ( _id_09D1::_id_27D1() )
        {
            self._id_707B = undefined;
            return 1;
        }
    }

    return 0;
}

_id_1A36()
{
    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self._id_10DA7 ) && self._id_10DA7.size > 0 )
        var_1 = self._id_10DA7;
    else
        var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_0 = var_0 + self getweaponammoclip( var_3 );
        var_0 = var_0 + self getweaponammostock( var_3 );
    }

    if ( var_1.size == 1 && var_1[0].basename == "s4_me_fists_mp" )
        var_0 = 0;

    return var_0;
}

_id_1A37()
{
    var_0 = undefined;

    if ( isdefined( self._id_10DA7 ) && self._id_10DA7.size > 0 )
        var_0 = self._id_10DA7;
    else
        var_0 = self getweaponslistprimaries();

    if ( var_0.size == 1 && var_0[0].basename == "s4_me_fists_mp" )
        return 1;

    foreach ( var_2 in var_0 )
    {
        if ( self getweaponammoclip( var_2 ) > 0 )
            return 0;

        if ( self getweaponammostock( var_2 ) > 0 )
            return 0;
    }

    return 1;
}

_id_287D( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "weapon_other":
        case "weapon_projectile":
        case "weapon_explosive":
        case "weapon_grenade":
            break;
        case "weapon_pistol":
            var_1 = 1;
            break;
        case "weapon_dmr":
        case "weapon_sniper":
            var_1 = 2;
            break;
        case "weapon_shotgun":
        case "weapon_lmg":
        case "weapon_smg":
        case "weapon_assault":
            var_1 = 3;
            break;
    }

    return var_1;
}

_id_2902( var_0, var_1 )
{
    var_2 = _id_287D( var_0 );
    var_3 = _id_287D( var_1 );
    return var_3 > var_2;
}
