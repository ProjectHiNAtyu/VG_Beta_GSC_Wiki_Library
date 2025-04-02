// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8C1D( var_0 )
{
    self endon( "asm_terminated" );
    self endon( "death" );

    if ( isdefined( self._id_EAB5 ) && self._id_EAB5 == "juggernaut" || isdefined( self._id_11E7 ) && self._id_11E7 == "juggernaut" )
    {
        childthread _id_8C43();

        if ( isdefined( level._id_8C25 ) )
            self childthread [[ level._id_8C25 ]]();
        else
            childthread _id_8C23();

        var_1 = 0;

        if ( !var_1 && scripts\common\utility::_id_87BA() )
            childthread _id_7FAC();
    }
}

_id_8118( var_0 )
{
    if ( _func_039E( var_0 ) )
        return;

    anim._id_8C65 = 1;
    _func_039D( var_0, "walk", 40 );
    _func_039D( var_0, "jog", 113 );
    _func_039D( var_0, "run", 170 );
}

_id_8C37()
{
    return self._id_0138 == "MOD_GRENADE" || self._id_0138 == "MOD_EXPLOSIVE" || self._id_0138 == "MOD_GRENADE_SPLASH" || self._id_0138 == "MOD_PROJECTILE_SPLASH" || ( self._id_013E.classname == "sniper" || self._id_013E.classname == "pistol" && self._id_013E.basename != "s4_pi_mike1911" && self._id_0138 != "MOD_MELEE" );
}

_id_8C53()
{
    for (;;)
    {
        self waittill( "pain" );
        self._id_8C60 = gettime();
    }
}

_id_8C43()
{
    childthread _id_8C53();

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( self.health > 0 && var_0 >= self._id_0294 )
        {
            if ( _func_0200( "generic_pain_enemy_1" ) )
                self playsound( "generic_pain_enemy_1" );

            self _meth_85CD( self._id_1C90 );
            var_10 = self._id_0294;
            self._id_0294 = var_10 * 3;
            wait 5;
            self._id_0294 = var_10;
        }
    }
}

_id_8C23()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( _id_8C37() )
            continue;

        if ( self._id_013E.basename == "s4_pi_mike1911" )
        {
            if ( var_7 == "j_head" || var_7 == "j_neck" || var_7 == "j_helmet" )
                var_10 = 70;
            else
                var_10 = 40;
        }
        else
            var_10 = 40;

        if ( var_0 < var_10 )
            var_10 = abs( var_0 - 5 );

        self.health = self.health + int( var_10 );

        if ( istrue( self._id_42B4 ) )
            _id_1998( self._id_0137, var_0 );
    }
}

_id_7FAC()
{
    scripts\engine\utility::_id_5C04( "scriptables_ready" );

    if ( !scripts\engine\utility::is_equal( self.model, "body_opforce_juggernaut_basebody" ) )
        return;

    self._id_42B4 = 1;
    self setscriptablepartstate( "base", "pristine" );
    _id_3F0C( "left_arm", 100, [ "left_arm_upper", "left_arm_lower", "left_hand" ] );
    _id_3F0C( "right_arm", 100, [ "right_arm_upper", "right_arm_lower", "right_hand" ] );
}

_id_3F0C( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.health = var_1;
    var_3._id_8640 = 0;

    if ( !isdefined( self._id_42CF ) )
        self._id_42CF = [];

    self._id_42CF[var_0] = var_3;

    if ( !isdefined( self._id_42D0 ) )
        self._id_42D0 = [];

    foreach ( var_5 in var_2 )
        self._id_42D0[var_5] = var_0;
}

_id_1998( var_0, var_1 )
{
    if ( !isdefined( self._id_42D0[var_0] ) )
        return;

    var_2 = self._id_42D0[var_0];
    var_3 = self._id_42CF[var_2];
    var_3.health = var_3.health - var_1;

    if ( var_3.health <= 0 && !istrue( var_3._id_8640 ) )
    {
        self setscriptablepartstate( var_2, "dmg", 1 );
        var_3._id_8640 = 1;
    }
}

_id_51C3()
{
    if ( isdefined( self._id_0102 ) )
        self._id_37C1 = self._id_0102;

    self._id_0102 = "no_cover";
    self _meth_800C( "stand" );
    self._id_00D4 = 1;
    self._id_4D88 = 1;
    self._id_4D87 = 1;
    self._id_37C2 = self._id_01ED;
    self._id_01ED = 0;
    self._id_37C0 = istrue( self._id_002F );
    self._id_002F = 1;
    self._id_0216 = 1;
    scripts\engine\utility::set_movement_speed( 50 );
    self._id_0481 = 0.1;
    self._id_0046 = 0;
    self._id_0157 = 1;
    self._id_4D96 = 1;
    self._id_4A62 = 1;
    self._id_A42E = 1;
    self._id_015C = 1;
    self._id_00D2 = 1;
    self._id_7CFF = 1;
    self._id_4D83 = 1;
    self._id_5EAE = 1;
    self._id_0301 = 0;

    if ( isdefined( self._id_0DB6 ) )
        self._id_0DB6._id_4AA3 = 1;

    var_0 = weaponclass( self._id_04CE );
    _id_8118( "juggernaut" );
    _id_08C8::_id_D483( "juggernaut" );
    var_1 = "casual_killer";

    if ( var_0 == "mg" )
        var_1 = "casual_killer_lmg";

    _id_08C8::_id_D626( "casual_killer", var_1, 1 );
    thread _id_32FB();

    if ( var_0 == "mg" || var_0 == "rifle" || var_0 == "smg" )
        thread _id_32FA();

    if ( var_0 == "rifle" || var_0 == "smg" )
        self._id_03AB = "full";

    thread _id_32F9();
}

_id_49C6()
{
    if ( !istrue( self._id_0254 ) )
        thread _id_49C7();
}

_id_49C7()
{
    if ( !isdefined( level._id_32FC ) || gettime() > level._id_32FC )
    {
        self._id_02C4 = gettime() + 3000;
        self._id_02C2 = 1;
        self._id_5E94 = 1;
    }

    self._id_0254 = 1;
    self _meth_8079();
    self._id_01A8 = undefined;
    self._id_01F8 = undefined;

    if ( isdefined( self._id_0303 ) )
        self _meth_84BB( 2, self _meth_84A5( 64 ) );

    scripts\engine\utility::waittill_any_2( "leaveCasualKiller", "death" );

    if ( !isalive( self ) || !isdefined( self ) )
        return;

    self._id_00D4 = 0;
    self._id_4D88 = 0;
    self._id_01ED = self._id_37C2;

    if ( istrue( self._id_37C0 ) )
        self._id_002F = 1;

    scripts\common\utility::_id_97D7( undefined );
    scripts\common\utility::_id_97D9( undefined );
    self._id_0216 = 0;
    self._id_4D87 = 0;
    self._id_0481 = 0.3;
    scripts\common\utility::_id_38C9();
    self._id_0157 = 0;
    self._id_0046 = 1;
    self._id_4D96 = undefined;
    self._id_4A62 = undefined;
    self._id_A42E = undefined;
    self._id_015C = 0;
    self._id_00D2 = 0;
    self._id_32FD = undefined;
    self._id_0301 = 192;
    self._id_016C = 0;
    self._id_03AB = undefined;
    self._id_7CFF = undefined;
    self._id_4D83 = undefined;
    self._id_5EAE = 0;
    self._id_01F8 = undefined;
    self._id_0035 = 0;
    self _meth_84BF( 2 );

    if ( isdefined( self._id_37C3 ) )
        self._id_37C3 delete();

    if ( isdefined( self._id_0DB6 ) )
        self._id_0DB6._id_4AA3 = 0;

    self _meth_800C( "stand", "crouch", "prone" );

    if ( isdefined( self._id_37C1 ) )
    {
        self._id_0102 = self._id_37C1;
        self._id_37C1 = undefined;
    }
    else
        self._id_0102 = "cover";
}

_id_32F8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( scripts\engine\utility::is_equal( var_1, level.player ) )
        self notify( "ck_player_attacked_me" );
}

_id_32F9()
{
    self endon( "leaveCasualKiller" );
    self endon( "death" );

    if ( !isdefined( self._id_429F ) )
        self._id_429F = [];

    self._id_429F[self._id_429F.size] = ::_id_32F8;
    self waittill( "ck_player_attacked_me" );
    self._id_01A8 = undefined;
    self _meth_8079();
    self _meth_838F( "axis" );
}

_id_32FB()
{
    self endon( "leaveCasualKiller" );
    self endon( "death" );
    wait 1;
    self._id_37C3 = spawn( "script_origin", self.origin );
    thread scripts\engine\utility::_id_470D( self._id_37C3 );
    var_0 = undefined;
    var_1 = 0;
    var_2 = undefined;
    var_3 = undefined;

    for (;;)
    {
        waitframe();

        if ( !isdefined( self ) || !isalive( self ) || istrue( self._id_0254 ) )
            return;

        self._id_01F8 = "disable";
        var_4 = anglestoforward( self.angles );
        var_5 = self _meth_8849();

        if ( var_1 )
        {
            if ( !isalive( var_0 ) )
            {
                var_2 = gettime();
                self _meth_8313( self._id_37C3 );
                self _meth_86DB();
                var_1 = 0;
                var_3 = undefined;
            }
            else
                self._id_37C3.origin = var_0.origin;
        }

        var_6 = int( gettime() / 50 );

        if ( self getentitynumber() % 4 != var_6 % 4 )
        {
            if ( isdefined( var_2 ) && var_2 + 3000 > gettime() )
            {
                var_7 = self._id_37C3.origin - self.origin;

                if ( length( var_7 ) > 100 )
                {
                    var_7 = vectornormalize( var_7 );
                    var_8 = abs( _func_000B( _func_0002( clamp( vectordot( var_4, var_7 ), -1.0, 1.0 ) ) ) );

                    if ( var_8 > 30 && gettime() < var_2 + 1500 )
                        continue;

                    if ( var_8 < 90 )
                        continue;
                }
            }

            var_2 = undefined;

            if ( !isdefined( var_3 ) || gettime() > var_3 + 3000 )
            {
                self _meth_8079();
                self _meth_86DB();

                if ( isalive( self._id_017D ) )
                {
                    if ( var_1 && self._id_017D == var_0 )
                    {
                        var_9 = self._id_017D;
                        var_10 = self._id_017D.origin - self.origin;
                        var_10 = vectornormalize( var_10 );
                        var_11 = clamp( vectordot( var_4, var_10 ), -1.0, 1.0 );
                        var_12 = abs( _func_000B( _func_0002( var_11 ) ) );

                        if ( var_12 > 70 )
                        {
                            var_13 = self _meth_84C1();

                            if ( isdefined( var_13 ) )
                            {
                                foreach ( var_15 in var_13 )
                                {
                                    var_7 = var_15.origin - self.origin;
                                    var_7 = vectornormalize( var_7 );
                                    var_8 = abs( _func_000B( _func_0002( clamp( vectordot( var_4, var_7 ), -1.0, 1.0 ) ) ) );

                                    if ( var_8 < var_12 )
                                    {
                                        var_12 = var_8;
                                        var_9 = var_15;
                                    }
                                }

                                if ( var_9 != self._id_017D )
                                {
                                    if ( _func_011C( var_9 ) )
                                    {
                                        self._id_01A8 = var_9;
                                        self _meth_86DB();
                                        self._id_01A8 = undefined;
                                        var_3 = gettime();
                                    }
                                }
                            }
                        }
                    }

                    var_1 = isalive( self._id_017D );

                    if ( var_1 )
                        var_0 = self._id_017D;
                    else
                        var_0 = undefined;

                    continue;
                }
                else
                {
                    self _meth_8313( self._id_37C3 );
                    self _meth_86DB();

                    if ( isdefined( var_2 ) && var_2 + 7000 > gettime() )
                    {
                        if ( vectordot( var_4, self._id_37C3.origin - var_5 ) > 0 )
                            continue;
                    }

                    self._id_37C3.origin = self.origin + ( 0, 0, 40 ) + var_4 * 400;
                }
            }
        }
    }
}

_id_32FA()
{
    self endon( "leaveCasualKiller" );
    self endon( "death" );
    var_0 = 100;
    var_1 = 1000;
    var_2 = 20;
    var_3 = -1;
    var_4 = [ 40, 50, 60 ];
    var_5 = [ 20, 25, 30 ];
    var_6 = 0;
    var_7 = 0;
    var_8 = scripts\engine\utility::random( var_4 );
    var_9 = scripts\engine\utility::random( var_5 );
    var_10 = 0;
    var_11 = undefined;
    var_12 = undefined;

    foreach ( var_14 in var_5 )
    {
        if ( var_14 > var_6 )
            var_6 = var_14;
    }

    while ( isalive( self ) && isdefined( self ) )
    {
        waitframe();
        self._id_0257 = 90;
        self._id_0350 = -90;
        self._id_0035 = 180;
        var_16 = anglestoforward( self.angles );
        var_17 = self _meth_8849();

        if ( isdefined( self._id_017D ) )
        {
            if ( !isdefined( self._id_0303 ) || self._id_0262 > self _meth_8642() )
                var_11 = self._id_017D _meth_8176();
        }

        var_18 = _id_0009::_id_1C1B( self._id_1C08._id_F3EE, "aim" ) || _id_0009::_id_1C1B( self._id_1C08._id_F3EE, "notetrackAim" );

        if ( var_18 )
            var_18 = isdefined( var_11 );

        var_19 = _id_0009::_id_1C37( self._id_1C90 );

        if ( var_19 == "exposed_arrival" || var_19 == "exposed_reload" )
            var_18 = 0;

        if ( var_18 )
        {
            var_20 = self _meth_84A5( self _meth_8642() );
            var_21 = var_11 - var_20;
            var_21 = ( var_21[0], var_21[1], 0 );
            var_22 = vectornormalize( var_21 );
            var_23 = self._id_0257;

            if ( !istrue( var_12 ) )
                var_23 = max( 0, self._id_0257 - 20 );

            var_24 = abs( _func_000B( _func_0002( clamp( vectordot( var_22, var_16 ), -1.0, 1.0 ) ) ) );

            if ( var_24 >= var_23 )
            {
                var_11 = undefined;
                var_10 = 0;
                var_18 = 0;
            }
        }

        if ( !istrue( var_18 ) )
        {
            scripts\common\utility::_id_97D7( undefined );
            scripts\common\utility::_id_97D9( var_17 + var_16 * 200 );
            self._id_32FD = var_17 + var_16 * 200;
            var_2 = 20 * var_3;
            var_3 = var_3 * -1;
            var_10 = 0;
            self._id_016C = 1;
            var_12 = 0;
            continue;
        }

        var_12 = 1;
        self._id_016C = 0;

        if ( isdefined( var_11 ) )
            scripts\common\utility::_id_97D9( var_11 );
        else
        {
            scripts\common\utility::_id_97D7( undefined );
            scripts\common\utility::_id_97D9( undefined );
        }

        var_21 = var_11 - var_17;
        var_25 = length( var_21 );
        var_22 = vectornormalize( var_21 );
        var_24 = abs( _func_000B( _func_0002( clamp( vectordot( var_16, var_22 ), -1.0, 1.0 ) ) ) );
        var_26 = _func_0017( var_22, anglestoright( self.angles ), anglestoup( self.angles ) );
        var_27 = var_26[1];

        if ( istrue( self._id_0254 ) )
        {
            if ( var_2 > 0 )
            {
                var_2 = var_2 - min( var_2, var_8 * level._id_5F1B );
                var_3 = -1;
            }
            else if ( var_2 < 0 )
            {
                var_2 = var_2 + min( var_2 * -1, var_8 * level._id_5F1B );
                var_3 = 1;
            }
        }
        else if ( var_24 + var_6 < abs( self._id_0257 ) && var_24 + var_6 < abs( self._id_0350 ) && var_25 > var_0 && ( var_25 < var_1 || isdefined( self._id_017D ) && self._id_017D == level.player ) )
        {
            if ( gettime() > var_7 )
            {
                var_28 = level._id_5F1B * var_8 * var_3;
                var_2 = var_2 + var_28;

                if ( scripts\engine\utility::_id_DD3C( var_2 ) == scripts\engine\utility::_id_DD3C( var_3 ) && abs( var_2 ) > var_9 )
                {
                    var_3 = var_3 * -1;
                    var_8 = scripts\engine\utility::random( var_4 );
                    var_9 = scripts\engine\utility::random( var_5 );
                    var_7 = gettime() + 350;
                }
            }

            var_27 = var_27 + var_2;
        }

        var_29 = _func_0017( var_22, anglestoright( self.angles ), anglestoup( self.angles ) );
        var_29 = ( var_29[0], var_27, var_29[2] );
        var_22 = anglestoforward( var_29 );
        self._id_32FD = var_22 * var_25 + var_17;

        if ( istrue( self._id_0254 ) && var_2 == 0 )
            return;
    }
}
