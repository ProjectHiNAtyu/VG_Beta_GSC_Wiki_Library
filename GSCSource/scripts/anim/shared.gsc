// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_B16B( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = undefined;

    if ( isweapon( var_0 ) )
    {
        var_3 = var_0;
        var_4 = getcompleteweaponname( var_0 );
    }
    else
    {
        var_3 = makeweaponfromstring( var_0 );
        var_4 = var_0;
    }

    self notify( "weapon_position_change" );
    var_5 = self.weaponinfo[var_4]._id_0318;

    if ( var_1 != "none" && isdefined( self._id_0DB6._id_10DBF[var_1] ) && self._id_0DB6._id_10DBF[var_1] == var_3 )
        return;

    _id_4868();

    if ( var_5 != "none" )
        _id_4870( var_3 );

    if ( var_1 == "none" )
    {
        _id_FC0C();
        return;
    }

    if ( !_func_0371( self._id_0DB6._id_10DBF[var_1] ) )
        _id_4870( self._id_0DB6._id_10DBF[var_1] );

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 && ( var_1 == "left" || var_1 == "right" ) )
    {
        _id_1D96( var_3, var_1 );
        self._id_04CE = var_3;
    }
    else
        _id_1D96( var_3, var_1 );

    _id_FC0C();
}

_id_4870( var_0 )
{
    var_1 = getcompleteweaponname( var_0 );
    self._id_0DB6._id_10DBF[self.weaponinfo[var_1]._id_0318] = undefined;
    self.weaponinfo[var_1]._id_0318 = "none";
}

_id_1D96( var_0, var_1 )
{
    var_2 = getcompleteweaponname( var_0 );
    self.weaponinfo[var_2]._id_0318 = var_1;
    self._id_0DB6._id_10DBF[var_1] = var_0;

    if ( !_func_0371( self._id_0DB6._id_10DC0[var_1] ) )
    {
        self notify( "end_weapon_drop_" + var_1 );
        self._id_0DB6._id_10DC0[var_1] = undefined;
    }
}

_id_6E55( var_0 )
{
    var_1 = self._id_0DB6._id_10DBF[var_0];

    if ( _func_0371( var_1 ) )
        return self._id_0DB6._id_10DC0[var_0];

    return var_1;
}

_id_4868()
{
    var_0 = [];
    var_0[var_0.size] = "right";
    var_0[var_0.size] = "left";
    var_0[var_0.size] = "chest";
    var_0[var_0.size] = "back";
    var_0[var_0.size] = "thigh";
    self _meth_8201();

    foreach ( var_2 in var_0 )
    {
        var_3 = _id_6E55( var_2 );

        if ( _func_0371( var_3 ) )
            continue;

        if ( _func_0279( var_3 ) == "riotshield" && isdefined( self._id_D9D1 ) )
        {
            if ( isdefined( self._id_D9CB ) && self._id_D9CB )
            {
                playfxontag( scripts\engine\utility::getfx( "riot_shield_dmg" ), self, "TAG_BRASS" );
                self._id_D9CB = undefined;
            }
        }
    }

    self _meth_8418();
}

_id_FC0C()
{
    var_0 = [];
    var_1 = [];
    var_2 = [];
    var_0[var_0.size] = "right";
    var_0[var_0.size] = "left";
    var_0[var_0.size] = "chest";
    var_0[var_0.size] = "back";
    var_0[var_0.size] = "thigh";

    foreach ( var_4 in var_0 )
    {
        var_5 = var_1.size;
        var_6 = _id_6E55( var_4 );

        if ( !_func_0371( var_6 ) && !isnullweapon( var_6 ) )
        {
            var_7 = getcompleteweaponname( var_6 );

            if ( self.weaponinfo[var_7]._id_FE30 && !self.weaponinfo[var_7]._id_7531 )
                var_6 = var_6 _meth_8668( var_6._id_026F );
        }

        if ( isdefined( var_6 ) )
        {
            var_8 = _id_6D96( var_4 );

            if ( self tagexists( var_8 ) )
            {
                var_1[var_5] = var_6;
                var_2[var_2.size] = var_8;
            }
        }
    }

    self _meth_8418( var_1[0], var_2[0], var_1[1], var_2[1], var_1[2], var_2[2], var_1[3], var_2[3] );
    _id_FC9C();
}

_id_FC9C()
{
    if ( isdefined( self._id_4230 ) )
        [[ self._id_4230 ]]();
    else
    {
        if ( !isdefined( self._id_0DB6._id_10DBF ) || _func_0371( self._id_0DB6._id_10DBF["right"] ) )
            return;

        if ( _id_31E0() )
        {
            self _meth_8202();
            return;
        }

        self _meth_8201();
    }
}

_id_31E0()
{
    if ( !self._id_0DB6._id_8EE9 )
        return 0;

    if ( scripts\anim\utility_common::_id_8A14( self._id_04CE ) )
        return 0;

    return isalive( self );
}

_id_6D96( var_0 )
{
    switch ( var_0 )
    {
        case "chest":
            return "tag_stowed_chest";
        case "back":
            return "tag_stowed_back";
        case "left":
            return "tag_weapon_left";
        case "right":
            return "tag_weapon_right";
        case "hand":
            return "tag_accessory_right";
        case "thigh":
            return "tag_stowed_thigh";
        default:
            break;
    }
}

_id_4FE8( var_0 )
{
    var_1 = getcompleteweaponname( var_0 );
    var_2 = self.weaponinfo[var_1]._id_0318;

    if ( !istrue( self._id_A56C ) && self._id_0173 && var_2 != "none" )
        thread _id_5057( var_0, var_2 );

    _id_4870( var_0 );

    if ( var_0 == self._id_04CE )
        self._id_04CE = _func_0370();

    if ( var_0 == self._id_0326 )
        self._id_0326 = _func_0370();

    if ( var_0 == self._id_038F )
        self._id_038F = _func_0370();

    if ( var_0 == self._id_03AF )
    {
        if ( !isnullweapon( self._id_0326 ) )
            _id_4FE8( self._id_0326 );

        self._id_03AF = _func_0370();
    }
}

_id_4FE7( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_04CE;

    if ( isnullweapon( var_0 ) )
        return;

    _id_4868();
    _id_4FE8( var_0 );

    if ( isnullweapon( self._id_0326 ) )
    {
        if ( !isnullweapon( self._id_04CE ) )
            self._id_0326 = self._id_04CE;
        else if ( !isnullweapon( self._id_038F ) )
            self._id_0326 = self._id_038F;
        else if ( !isnullweapon( self._id_03AF ) )
            self._id_0326 = self._id_03AF;

        if ( self._id_0326 == self._id_038F )
            self._id_038F = _func_0370();
    }

    _id_FC0C();
}

_id_4FE9()
{
    if ( !isdefined( self._id_0DB6 ) || !isdefined( self._id_0DB6._id_10DBF ) )
        return;

    var_0 = [];
    var_0[var_0.size] = "left";
    var_0[var_0.size] = "right";
    var_0[var_0.size] = "chest";
    var_0[var_0.size] = "back";
    var_0[var_0.size] = "thigh";
    _id_4868();

    foreach ( var_2 in var_0 )
    {
        var_3 = self._id_0DB6._id_10DBF[var_2];

        if ( _func_0371( var_3 ) )
            continue;

        var_4 = getcompleteweaponname( var_3 );
        self.weaponinfo[var_4]._id_0318 = "none";
        self._id_0DB6._id_10DBF[var_2] = undefined;

        if ( !istrue( self._id_A56C ) && self._id_0173 )
            thread _id_5057( var_3, var_2 );
    }

    self._id_04CE = _func_0370();
    _id_FC0C();
}

_id_5057( var_0, var_1 )
{
    if ( self _meth_81DE() )
        return "none";

    self._id_0DB6._id_10DC0[var_1] = var_0;
    var_2 = var_0;
    var_3 = var_0.basename;

    if ( issubstr( tolower( var_3 ), "_ai" ) )
    {
        var_3 = _func_00D6( var_3, 0, var_3.size - 3 );
        var_2 = makeweapon( var_3, var_0._id_006B );
    }

    thread _id_D52B( var_2 );

    if ( isagent( self ) )
    {
        if ( isdefined( level._id_5024 ) )
            self thread [[ level._id_5024 ]]( var_2, var_1 );
        else
            self _meth_862C( var_2, var_1 );
    }
    else if ( _id_30EB( self ) )
    {
        if ( var_1 == "back" || var_1 == "thigh" )
            var_4 = "tag_stowed_" + var_1;
        else
            var_4 = "tag_weapon_" + var_1;

        if ( !scripts\engine\utility::hastag( self.model, var_4 ) )
        {
            self _meth_80C4( var_2, var_1, 0 );
            self endon( "end_weapon_drop_" + var_1 );
            waitframe();
            return;
        }

        var_5 = self gettagorigin( var_4 );
        self endon( "end_weapon_drop_" + var_1 );
        waitframe();

        if ( !isdefined( self ) )
            return;

        var_6 = self gettagorigin( var_4 );
        var_7 = self gettagangles( var_4 );
        var_8 = getcompleteweaponname( var_2 );
        var_9 = spawn( "weapon_" + var_8, var_6 );
        var_9.angles = var_7;
        var_10 = var_6 - var_5;
        var_11 = vectornormalize( var_10 );
        var_12 = 20;
        var_13 = 50;
        var_14 = min( length( var_10 ) * var_12, var_13 );
        var_15 = var_11 * var_14;
        var_16 = ( 0, 0, 950 );
        var_17 = var_6 + var_11 * -1;
        var_18 = var_15 + var_16;

        if ( weaponclass( var_2 ) == "pistol" )
            var_18 = var_18 * 0.5;

        var_9 _meth_8255( var_17, var_18 );
    }
    else
    {
        self _meth_80C4( var_2, var_1, 0 );
        self endon( "end_weapon_drop_" + var_1 );
        waitframe();
    }

    if ( !isdefined( self ) )
        return;

    if ( isagent( self ) && !isalive( self ) )
        return;

    _id_4868();
    self._id_0DB6._id_10DC0[var_1] = undefined;
    _id_FC0C();
}

_id_30EB( var_0 )
{
    if ( !getdvarint( "scr_ai_fling_gun", 0 ) )
        return 0;

    if ( !scripts\common\utility::_id_8A2C() )
        return 0;

    if ( !isdefined( var_0._id_0251 ) )
        return 0;

    if ( !isplayer( var_0._id_0251 ) )
        return 0;

    if ( _func_010E( var_0._id_0138 ) )
        return 1;

    var_1 = 300;

    if ( distance( var_0._id_0251.origin, var_0.origin ) < var_1 )
        return 0;

    return 1;
}

_id_D52B( var_0 )
{
    self waittill( "weapon_dropped", var_1 );
    var_1 endon( "death" );

    if ( isdefined( var_0 ) && _id_8ACA( var_0 ) )
    {
        if ( isdefined( var_1 ) )
        {
            var_1 physics_registerforcollisioncallback();
            var_1 thread _id_10D78( var_0 );
            var_2 = _func_00D6( var_1.classname, 7, var_1.classname.size );
            var_1 _id_D6B2( var_2, self );
        }
    }
}

_id_8ACA( var_0 )
{
    if ( var_0._id_022E )
        return 0;

    return 1;
}

_id_10D78( var_0 )
{
    self endon( "death" );
    self endon( "timeout" );
    thread _id_10D79( 2 );
    self waittill( "collision", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    var_9 = _func_02C5( var_4 );
    var_10 = _func_00D6( var_9["name"], 9 );

    if ( var_10 == "user_terrain1" )
        var_10 = "user_terrain_1";

    if ( isdefined( var_0.classname ) && isdefined( self ) )
    {
        var_11 = "weap_drop_med";

        switch ( var_0.classname )
        {
            case "rifle":
                var_11 = "weap_drop_med";
                break;
            case "smg":
                var_11 = "weap_drop_small";
                break;
            case "mg":
                var_11 = "weap_drop_xlarge";
                break;
            case "spread":
                var_11 = "weap_drop_large";
                break;
            case "sniper":
                var_11 = "weap_drop_large";
                break;
            case "pistol":
                var_11 = "weap_drop_pistol";
                break;
            case "grenade":
                var_11 = "weap_drop_launcher";
                break;
            case "rocketlauncher":
                var_11 = "weap_drop_launcher";
                break;
        }

        if ( _func_0200( var_11 ) )
            self playsoundtoteam( var_11, var_10 );
        else if ( getdvarint( "#x3308ebfb282e3cd76", 1 ) == 1 )
            return;
    }
}

_id_10D79( var_0 )
{
    wait( var_0 );
    self notify( "timeout" );
}

_id_6879()
{
    if ( !isdefined( self._id_DA21 ) )
    {
        if ( !isdefined( self._id_DA2D ) )
            return 0;

        return scripts\engine\utility::_id_6877( self._id_DA2D );
    }

    return scripts\engine\utility::_id_6877( self._id_DA21 _meth_8176() );
}

_id_6876()
{
    var_0 = _id_6C0D();

    if ( self._id_036A == "cover_crouch" && isdefined( self._id_0DB6._id_3DC4 ) && self._id_0DB6._id_3DC4 == "lean" )
        var_0 = var_0 - anim._id_3DB3;

    return var_0;
}

_id_6C0D()
{
    if ( !isdefined( self._id_DA21 ) )
    {
        if ( !isdefined( self._id_DA2D ) )
            return 0;

        return scripts\anim\combat_utility::_id_6C0E( self._id_DA2D );
    }

    return scripts\anim\combat_utility::_id_6C0E( self._id_DA21 _meth_8176() );
}

_id_BFBD( var_0 )
{
    self endon( "killanimscript" );
    _id_BFBE( var_0 );
}

_id_BFBE( var_0 )
{

}

_id_44F9()
{
    var_0 = 0;
    var_1 = _func_0268( self._id_04CE );

    if ( var_1 )
        var_0 = var_1;
    else if ( scripts\anim\weaponlist::_id_FF1A() )
        var_0 = anim._id_D083[randomint( anim._id_D083.size )];
    else if ( self._id_599A )
        var_0 = anim._id_599B[randomint( anim._id_599B.size )];
    else
        var_0 = anim._id_2D88[randomint( anim._id_2D88.size )];

    if ( var_0 <= self._id_00C4 )
        return var_0;

    if ( self._id_00C4 <= 0 )
        return 1;

    return self._id_00C4;
}

_id_44FA()
{
    var_0 = self._id_00C4;

    if ( weaponclass( self._id_04CE ) == "mg" )
    {
        var_1 = randomfloat( 10 );

        if ( var_1 < 3 )
            var_0 = randomintrange( 2, 6 );
        else if ( var_1 < 8 )
            var_0 = randomintrange( 6, 12 );
        else
            var_0 = randomintrange( 12, 20 );
    }

    return var_0;
}

_id_7900( var_0 )
{
    self.weaponinfo[var_0]._id_7531 = 0;
    _id_FC0C();
}

_id_DCFB( var_0 )
{
    self.weaponinfo[var_0]._id_7531 = 1;
    _id_FC0C();
}

_id_7420( var_0 )
{
    self endon( "abort_reload" );
    self endon( var_0 + "_finished" );
    var_1 = self._id_04CE;
    var_2 = getcompleteweaponname( var_1 );
    var_3 = undefined;

    if ( self.weaponinfo[var_2]._id_FE30 )
        var_3 = _func_00EE( self._id_04CE );

    if ( self.weaponinfo[var_2]._id_7531 )
    {
        if ( scripts\anim\utility_common::_id_8ABB() )
            self playsound( "weap_reload_pistol_clipout_npc" );
        else
            self playsound( "weap_reload_smg_clipout_npc" );

        if ( isdefined( var_3 ) )
        {
            _id_7900( var_2 );
            thread _id_5005( var_3, "tag_clip" );
        }
    }

    var_4 = 0;

    while ( !var_4 )
    {
        self waittill( var_0, var_5 );

        if ( !_func_0106( var_5 ) )
            var_5 = [ var_5 ];

        foreach ( var_7 in var_5 )
        {
            switch ( var_7 )
            {
                case "attach clip left":
                    if ( isdefined( var_3 ) )
                    {
                        if ( !istrue( self.weaponinfo[var_2].clipattachedleft ) )
                        {
                            self attach( var_3, "tag_accessory_left" );
                            self.weaponinfo[var_2].clipattachedleft = 1;
                        }
                        else
                        {

                        }
                    }

                    scripts\anim\weaponlist::_id_C186();
                    break;
                case "attach clip right":
                    if ( isdefined( var_3 ) )
                    {
                        if ( !istrue( self.weaponinfo[var_2].clipattachedright ) )
                        {
                            self attach( var_3, "tag_accessory_right" );
                            self.weaponinfo[var_2].clipattachedright = 1;
                        }
                        else
                        {

                        }
                    }

                    scripts\anim\weaponlist::_id_C186();
                    break;
                case "detach clip nohand":
                    if ( isdefined( var_3 ) )
                    {
                        if ( istrue( self.weaponinfo[var_2].clipattachedright ) )
                        {
                            self detach( var_3, "tag_accessory_right" );
                            self.weaponinfo[var_2].clipattachedright = undefined;
                        }
                        else
                        {

                        }
                    }

                    break;
                case "detach clip right":
                    if ( isdefined( var_3 ) )
                    {
                        if ( istrue( self.weaponinfo[var_2].clipattachedright ) )
                        {
                            self detach( var_3, "tag_accessory_right" );
                            self.weaponinfo[var_2].clipattachedright = undefined;
                        }
                        else
                        {

                        }

                        if ( var_1 == self._id_04CE )
                            _id_DCFB( var_2 );
                        else
                        {
                            self.weaponinfo[getcompleteweaponname( self._id_04CE )]._id_7531 = 1;
                            self.weaponinfo[var_2]._id_7531 = 1;
                        }

                        self notify( "clip_detached" );
                    }

                    self._id_0DB6._id_A3FE = 0;
                    var_4 = 1;
                    break;
                case "detach clip left":
                    if ( isdefined( var_3 ) )
                    {
                        if ( istrue( self.weaponinfo[var_2].clipattachedleft ) )
                        {
                            self detach( var_3, "tag_accessory_left" );
                            self.weaponinfo[var_2].clipattachedleft = undefined;
                        }
                        else
                        {

                        }

                        if ( var_1 == self._id_04CE )
                            _id_DCFB( var_2 );
                        else
                        {
                            self.weaponinfo[getcompleteweaponname( self._id_04CE )]._id_7531 = 1;
                            self.weaponinfo[var_2]._id_7531 = 1;
                        }

                        self notify( "clip_detached" );
                    }

                    self._id_0DB6._id_A3FE = 0;
                    var_4 = 1;
                    break;
            }
        }
    }
}

_id_5005( var_0, var_1 )
{

}

_id_A260( var_0, var_1 )
{
    self endon( "killanimscript" );
    var_2 = var_0.origin;
    var_3 = distancesquared( self.origin, var_2 );

    if ( var_3 < 1 )
    {
        self hashed_0x82A9( var_2 );
        return;
    }

    if ( var_3 > 256 && !self _meth_822C( var_2, !scripts\engine\utility::_id_0F4F() ) )
        return;

    self._id_0244 = 1;
    var_4 = distance( self.origin, var_2 );
    var_5 = int( var_1 * 20 );

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_2 = var_0.origin;
        var_7 = self.origin - var_2;
        var_7 = vectornormalize( var_7 );
        var_8 = var_2 + var_7 * var_4;
        var_9 = var_8 + ( var_2 - var_8 ) * ( ( var_6 + 1 ) / var_5 );
        self hashed_0x82A9( var_9 );
        wait 0.05;
    }

    self._id_0244 = 0;
}

_id_C793()
{
    return 1;
}

#using_animtree("generic_human");

_id_B86F( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ::_id_C793;

    for ( var_3 = 0; var_3 < var_1 * 10; var_3++ )
    {
        if ( isalive( self._id_017D ) )
        {
            if ( scripts\anim\utility_common::_id_31A6() && [[ var_2 ]]() )
                return;
        }

        if ( scripts\anim\utility_common::_id_8A69() && [[ var_2 ]]() )
            return;

        self _meth_82DB( var_0, %body, 1, 0.1 );
        wait 0.1;
    }
}

_id_F188( var_0 )
{
    self endon( "killanimscript" );
    _id_B16B( self._id_038F, "right" );
    _id_06AE::_id_4958();
}

_id_C977()
{
    var_0 = _id_C979();

    if ( var_0 == 0 )
        return;

    self endon( "death" );

    for (;;)
    {
        level waittill( "an_enemy_shot", var_1 );

        if ( var_1 != self )
            continue;

        if ( !isdefined( var_1._id_017D ) )
            continue;

        if ( !isplayer( var_1._id_017D ) )
            continue;

        if ( isdefined( level._id_401D ) && level._id_401D == 0 )
            continue;

        thread _id_C978( var_1._id_017D );
        var_0--;

        if ( var_0 <= 0 )
            return;
    }
}

_id_C979()
{
    var_0 = scripts\common\utility::_id_69BF();

    switch ( var_0 )
    {
        case "gimp":
        case "easy":
            return 2;
        case "difficult":
        case "hard":
        case "medium":
            return 1;
        case "fu":
            return 0;
    }

    return 2;
}

_id_C978( var_0 )
{
    var_1 = _func_014B( var_0, 5000, 800 );
    wait 4.0;
    _func_014D( var_1 );
}

_id_B053()
{
    if ( isdefined( self._id_10DB6 ) && self._id_10DB6 )
        return;

    if ( scripts\engine\utility::_id_10E74( level.player.origin, level.player getplayerangles(), self.origin, 0.173648 ) )
        return;

    var_0 = undefined;

    if ( distancesquared( self.origin, self._id_017D.origin ) < self._id_39D6 * self._id_39D6 )
        var_0 = self._id_5E7A;
    else
        var_0 = self._id_5E7B;

    if ( var_0 != self._id_04CE )
    {
        _id_5EB6( var_0, "primary" );
        self._id_10D19 setmodel( getweaponmodel( self._id_5E79 ) );
        self._id_5E79 = var_0;
    }
}

_id_5EB6( var_0, var_1 )
{
    var_2 = undefined;

    if ( isweapon( var_0 ) )
        var_2 = var_0;
    else
        var_2 = [[ level._id_5D49 ]]( var_0 );

    if ( istrue( self._id_CD2B ) || istrue( self._id_CD14 ) )
    {
        _id_069C::_id_7284();
        _id_069C::_id_7275( getweaponattachmentworldmodels( var_2 ) );
        return;
    }

    if ( !scripts\common\utility::_id_8AEE( var_2 ) )
        scripts\common\utility::_id_82A0( var_2 );

    var_3 = !isnullweapon( self._id_04CE );
    var_4 = scripts\anim\utility_common::_id_8AB4();
    var_5 = scripts\anim\utility_common::_id_8ABB();
    var_6 = var_1 == "sidearm";
    var_7 = var_1 == "secondary";
    var_8 = var_1 == "primary";

    if ( var_3 && var_5 != var_6 )
    {
        if ( var_5 )
            var_9 = "none";
        else if ( var_7 )
            var_9 = "back";
        else
            var_9 = "chest";

        _id_B16B( self._id_04CE, var_9 );
        self._id_90AF = self._id_04CE;
    }
    else
        self._id_90AF = var_2;

    if ( var_3 && ( var_4 && var_8 ) )
        self._id_90AF = self._id_04CE;
    else
        _id_B16B( var_2, "right" );

    if ( var_6 )
        self._id_03AF = var_2;
    else if ( var_7 )
        self._id_038F = var_2;
    else
        self._id_0326 = var_2;

    self._id_04CE = var_2;
    self._id_00C4 = weaponclipsize( self._id_04CE );
    self notify( "weapon_switch_done" );
    _id_FD85( weaponclass( self._id_04CE ) );
}

_id_FD85( var_0 )
{
    if ( !isdefined( self._id_0B3E ) || _id_0694::_id_23A6() || !isdefined( self._id_1C08 ) || !isdefined( self._id_1C08._id_1A0D ) )
        return;

    var_1 = _id_08C8::_id_68DB();

    if ( var_0 == "pistol" && _func_0316( var_1 + "_pistol" ) )
        _id_08C8::_id_D626( "weapon", var_1 + "_pistol" );
    else if ( var_0 == "mg" && _func_0316( var_1 + "_lmg" ) )
        _id_08C8::_id_D626( "weapon", var_1 + "_lmg" );
    else
        _id_08C8::_id_3941( "weapon" );
}

_id_56AC()
{
    if ( scripts\anim\utility_common::_id_8A14( self._id_038F ) )
        return 1;

    if ( weaponclass( self._id_0326 ) == "rocketlauncher" )
        return 1;

    return 0;
}

_id_457E( var_0 )
{
    if ( !isdefined( self._id_E9CE ) )
    {
        if ( istrue( self._id_24D4 ) )
            self._id_E9CE = "thigh";
        else
            self._id_E9CE = anim._id_E9CF;
    }

    if ( istrue( self._id_CF73 ) )
    {
        if ( isdefined( level._id_5D99 ) )
        {
            if ( isdefined( self._id_CF74 ) )
            {
                self._id_0326 = [[ level._id_5D99 ]]( self._id_CF74 );
                self._id_CF74 = undefined;
            }

            if ( isdefined( self._id_CF76 ) )
            {
                self._id_03AF = [[ level._id_5D99 ]]( self._id_CF76, "sidearm" );
                self._id_CF76 = undefined;
            }

            if ( isdefined( self._id_CF75 ) )
            {
                self._id_038F = [[ level._id_5D99 ]]( self._id_CF75 );
                self._id_CF75 = undefined;
            }
        }
    }
    else if ( !istrue( self._id_FEC5 ) && ( !isdefined( self._id_11E7 ) || !( self._id_11E7 == "actor_enemy_cp_rus_desert_ar_ak_laser" || self._id_11E7 == "actor_enemy_cp_rus_desert_sniper_nvg" ) ) )
    {
        if ( !scripts\common\utility::_id_8A2C() )
        {
            if ( isweapon( self._id_0326 ) )
            {
                var_1 = getweaponbasename( self._id_0326 );

                if ( !scripts\common\utility::_id_87BA() )
                    var_1 = [[ level._id_5D71 ]]( var_1 );

                if ( var_1 != "none" )
                    self._id_0326 = [[ level._id_5D49 ]]( var_1, [], "none", "none" );
            }
            else
                self._id_0326 = [[ level._id_5D49 ]]( self._id_0326, [], "none", "none" );

            if ( isweapon( self._id_038F ) )
            {
                var_1 = getweaponbasename( self._id_038F );

                if ( !scripts\common\utility::_id_87BA() )
                    var_1 = [[ level._id_5D71 ]]( var_1 );

                if ( var_1 != "none" )
                    self._id_038F = [[ level._id_5D49 ]]( var_1, [], "none", "none" );
            }
            else
                self._id_038F = [[ level._id_5D49 ]]( self._id_038F, [], "none", "none" );

            if ( isweapon( self._id_03AF ) )
            {
                var_1 = getweaponbasename( self._id_03AF );

                if ( !scripts\common\utility::_id_87BA() )
                    var_1 = [[ level._id_5D71 ]]( var_1 );

                if ( var_1 != "none" )
                    self._id_03AF = [[ level._id_5D49 ]]( var_1, [], "none", "none" );
            }
            else
                self._id_03AF = [[ level._id_5D49 ]]( self._id_03AF, [], "none", "none" );
        }
        else
        {
            self._id_0326 = [[ level._id_5D49 ]]( self._id_0326, [] );
            self._id_038F = [[ level._id_5D49 ]]( self._id_038F, [] );
            self._id_03AF = [[ level._id_5D49 ]]( self._id_03AF, [] );
        }
    }

    self._id_10D1D = [];
    scripts\common\utility::_id_82A0( self._id_0326 );
    scripts\common\utility::_id_82A0( self._id_038F );
    scripts\common\utility::_id_82A0( self._id_03AF );
    var_2 = self.classname;

    if ( isagent( self ) )
        var_2 = self._id_11E7;

    var_3 = scripts\engine\utility::ter_op( isdefined( self._id_57CE ), self._id_57CE, "" );
    self _meth_8308();
    self._id_0DB6._id_10DBF = [];
    self._id_0DB6._id_10DC0 = [];
    self._id_90AF = self._id_04CE;
    var_4 = scripts\anim\utility_common::_id_FF19();
    self._id_0DB6._id_A42C = var_4;

    if ( var_4 )
        thread _id_C977();

    self._id_0355 = 100;
    _id_B16B( self._id_0326, "right" );

    if ( scripts\anim\utility_common::_id_8A14( self._id_038F ) )
        _id_B16B( self._id_038F, "back" );

    if ( !isnullweapon( self._id_03AF ) && isdefined( self._id_E9CE ) )
        _id_B16B( self._id_03AF, self._id_E9CE );

    if ( self.team != "allies" )
        self._id_74E9 = 1;

    scripts\anim\weaponlist::_id_C186();
    _id_FD8E( self._id_04CE );
    thread _id_ABC5();
}

_id_ABC5()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );
        _id_FD8E( var_0 );
    }
}

_id_FD8E( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_1 = var_0.classname;

        if ( isdefined( self._id_10D1D[var_1] ) )
            self._id_04D8 = self._id_10D1D[var_1]._id_9C91;
        else
            self._id_04D8 = 512;
    }
}

_id_815E()
{
    anim._id_A767 = randomintrange( 0, 15 );
    anim._id_A766 = randomintrange( 0, 10 );
    anim._id_A486 = gettime() + randomintrange( 0, 20000 );
    anim._id_A487 = gettime() + randomintrange( 0, 10000 );
    anim._id_A483 = gettime() + randomintrange( 0, 15000 );
    anim._id_A47D = gettime() + randomintrange( 0, 1000 );
}

_id_810F()
{
    level._id_8F70 = [];
    level._id_8F70["axis"] = 0;
    level._id_8F70["allies"] = 0;
    level._id_8F70["team3"] = 0;
    level._id_8F70["neutral"] = 0;
    level._id_8F6E = [];
    level._id_8F6E["axis"] = ( 0, 0, 0 );
    level._id_8F6E["allies"] = ( 0, 0, 0 );
    level._id_8F6E["team3"] = ( 0, 0, 0 );
    level._id_8F6E["neutral"] = ( 0, 0, 0 );
    level._id_8F6F = [];
    level._id_8F6F["axis"] = ( 0, 0, 0 );
    level._id_8F6F["allies"] = ( 0, 0, 0 );
    level._id_8F6F["team3"] = ( 0, 0, 0 );
    level._id_8F6F["neutral"] = ( 0, 0, 0 );
    level._id_8F6D = [];
    level._id_11B1 = [];
    level._id_11B1["axis"] = 0;
    level._id_11B1["allies"] = 0;
    level._id_11B1["team3"] = 0;
    level._id_11B1["neutral"] = 0;
    level._id_11B3 = 2000;
    level._id_11B2 = 3;
}

_id_8204()
{
    anim._id_9D61["c6"] = 0;
    anim._id_9D5E["c6"] = 9000;
    anim._id_9D60["c6"] = 0;
    anim._id_9D5F["c6"] = 15000;
    anim._id_9D61["seeker"] = 0;
    anim._id_9D5E["seeker"] = 9000;
    anim._id_9D60["seeker"] = 0;
    anim._id_9D5F["seeker"] = 15000;
}

_id_80A5()
{
    if ( isdefined( anim._id_E494 ) && anim._id_E494 )
        return;

    anim._id_E489 = [];
    anim._id_E48A = [];
    anim._id_E4A5 = [];
    anim._id_E493 = [];
    anim._id_E4A3 = 0;
    anim._id_E494 = 1;
}

_id_811C()
{
    anim._id_187F = 0;
    anim._id_3A91 = 10000;
    anim._id_3A92 = 6000;
    anim._id_10DCF = [];
    anim._id_10DCF["c12"] = ::_id_2DE7;
    anim._id_4B23 = [];
    anim._id_10DD9 = ::_id_B053;

    if ( !isdefined( anim._id_AC42 ) )
        anim._id_AC42 = [];

    if ( !isdefined( anim._id_AC44 ) )
        anim._id_AC44 = [];

    if ( !isdefined( anim._id_AC3F ) )
        anim._id_AC3F = [];

    if ( !isdefined( anim._id_DA1E ) )
        anim._id_DA1E = scripts\anim\utility::_id_DA20;

    if ( !isdefined( anim._id_DA2F ) )
        anim._id_DA2F = scripts\anim\utility::_id_DA2E;

    anim._id_5B26 = [];
    anim._id_8F8F = -100000;
    anim._id_2D88 = scripts\anim\utility::_id_1B62( 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 5 );
    anim._id_599B = scripts\anim\utility::_id_1B62( 2, 3, 3, 3, 4, 4, 4, 5, 5 );
    anim._id_D083 = scripts\anim\utility::_id_1B62( 1, 2, 2, 3, 3, 4, 4, 4, 4, 5, 5, 5 );
    anim._id_20CD = [];
    anim._id_20CC = 0;
}

_id_2DDC()
{
    if ( scripts\anim\utility_common::_id_FF19() )
        return "rocket";
    else if ( scripts\anim\utility_common::_id_FF18() )
        return "minigun";

    return undefined;
}

_id_2DE7()
{
    self.weapons = [];

    if ( !isnullweapon( self._id_0326 ) )
    {
        self._id_04CE = self._id_0326;
        self.weapons["right"] = _id_2DDC();
    }

    if ( !isnullweapon( self._id_038F ) )
    {
        self._id_04CE = self._id_038F;
        self.weapons["left"] = _id_2DDC();
    }

    self._id_04CE = _func_0370();
    self._id_00C4 = 1;
}

_id_82A3()
{
    level._id_10E38[0] = -36.8552;
    level._id_10E38[1] = -27.0095;
    level._id_10E38[2] = -15.5981;
    level._id_10E38[3] = -4.37769;
    level._id_10E38[4] = 17.7776;
    level._id_10E38[5] = 59.8499;
    level._id_10E38[6] = 104.808;
    level._id_10E38[7] = 152.325;
    level._id_10E38[8] = 201.052;
    level._id_10E38[9] = 250.244;
    level._id_10E38[10] = 298.971;
    level._id_10E38[11] = 330.681;
}

_id_D89E()
{
    anim._id_BFF1 = 60;
    anim._id_BFF0 = [];

    for ( var_0 = 0; var_0 < anim._id_BFF1; var_0++ )
        anim._id_BFF0[var_0] = var_0;

    for ( var_0 = 0; var_0 < anim._id_BFF1; var_0++ )
    {
        var_1 = randomint( anim._id_BFF1 );
        var_2 = anim._id_BFF0[var_0];
        anim._id_BFF0[var_0] = anim._id_BFF0[var_1];
        anim._id_BFF0[var_1] = var_2;
    }
}

_id_D8BC()
{
    self endon( "death" );
    scripts\engine\utility::_id_5C04( "load_finished" );

    if ( isdefined( anim._id_10DCF ) && isdefined( anim._id_10DCF[self._id_0492] ) )
        self [[ anim._id_10DCF[self._id_0492] ]]();
    else
        _id_457E();
}

_id_D6B2( var_0, var_1, var_2 )
{
    if ( isdefined( var_1._id_CC8A ) )
        self _meth_81F5( var_1._id_CC8A, var_1._id_CC8B );
    else if ( isdefined( var_1._id_CC8B ) )
        self _meth_81F5( var_1._id_CC8A, var_1._id_CC8B );

    if ( isdefined( var_1._id_CC88 ) )
        self _meth_81F5( var_1._id_CC88, var_1._id_CC89, undefined, 1 );
    else if ( isdefined( var_1._id_CC89 ) )
        self _meth_81F5( var_1._id_CC88, var_1._id_CC89, undefined, 1 );

    if ( isdefined( var_1._id_CC8C ) )
        self _meth_81F5( weaponclipsize( self ), weaponmaxammo( self ) );

    if ( istrue( var_2 ) )
        self _meth_81F5( 1, 6, 0, 1 );
    else if ( issubstr( var_0, "ub_golf25_sp" ) || issubstr( var_0, "ub_mike203_sp" ) )
        self _meth_81F5( 1, 1, 0, 1 );
}
