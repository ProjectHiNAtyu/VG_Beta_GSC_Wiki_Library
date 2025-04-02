// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level._id_2968 ) )
        level._id_2968 = [];
}

_id_2481( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_3858( var_3 );
    thread _id_10AC2( var_0, var_2, var_1, var_3, var_4, var_5, var_6, var_7 );
    return 1;
}

_id_10AC2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );

    if ( !isdefined( var_3 ) )
        return;

    if ( !isdefined( var_4 ) )
        return;

    if ( !scripts\mp\utility\player::isreallyalive( self ) )
        var_3 delete();

    var_3 _meth_821D( 1 );
    self notify( "deployable_deployed" );
    var_3.owner = self;
    var_3._id_04D6 = var_4;
    self._id_9B36 = var_3;

    if ( _id_8866( var_1 ) )
    {
        self thread [[ level._id_2968[var_1]._id_7168 ]]( var_3 );
        return;
    }

    var_3 playsoundtoplayer( level._id_2968[var_1]._id_47C8, self );
    var_3 thread _id_9B3A( var_0, var_2, var_1, ::_id_2957, var_5, var_6, var_7 );
}

_id_3858( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "late_missile_stuck" );
    var_0 thread _id_0A78::_id_A682( "missile_stuck", "late_missile_stuck" );
    self waittill( "disconnect" );
    var_0 delete();
}

_id_AD21( var_0 )
{
    self._id_87E1 = 1;
    self notify( "death" );
}

_id_9B3A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self notify( "markerActivate" );
    self endon( "markerActivate" );
    self waittill( "missile_stuck" );
    var_7 = self.owner;
    var_8 = self.origin;

    if ( !isdefined( var_7 ) )
        return;

    var_9 = _id_3F7A( var_2, var_8, var_7 );
    var_10 = spawnstruct();
    var_10._id_94F7 = self _meth_8151();

    if ( isdefined( var_10._id_94F7 ) && isdefined( var_10._id_94F7.model ) && var_10._id_94F7.model != "" )
    {
        var_9.origin = var_10._id_94F7.origin;
        var_11 = var_10._id_94F7 _meth_8151();

        if ( isdefined( var_11 ) )
            var_10._id_94F7 = var_11;
        else
            var_10._id_94F7 = undefined;
    }

    var_10._id_43D6 = ::_id_AD21;
    var_9 thread scripts\mp\movers::_id_73E7( var_10 );
    var_9._id_A270 = var_10._id_94F7;
    var_9 setotherent( var_7 );
    waitframe();
    var_9 thread [[ var_3 ]]( var_4, var_5, var_6 );

    if ( isdefined( level._id_8DBA ) )
        level thread [[ level._id_8DBA ]]( var_0 );

    self delete();

    if ( isdefined( var_9 ) && var_9 _id_0A67::_id_F38C() )
    {
        self._id_87E1 = 1;
        var_9 notify( "death" );
    }
}

_id_47C4( var_0 )
{
    if ( var_0 == "mp_satcom" )
        return 1;
    else if ( issubstr( var_0, "paris_catacombs_iron" ) )
        return 1;
    else if ( issubstr( var_0, "mp_warhawk_iron_gate" ) )
        return 1;

    return 0;
}

_id_888B()
{
    var_0 = self getcurrentweapon();

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in level._id_2968 )
        {
            if ( getcompleteweaponname( var_0 ) == var_2.weaponinfo )
                return 1;
        }
    }

    return 0;
}

_id_3F7A( var_0, var_1, var_2 )
{
    var_3 = level._id_2968[var_0];
    var_4 = spawn( "script_model", var_1 - ( 0, 0, 1 ) );
    var_4 setmodel( var_3._id_9FBD );
    var_4.health = 999999;
    var_4.maxhealth = var_3.maxhealth;
    var_4.angles = var_2.angles;
    var_4._id_296B = var_0;
    var_4.owner = var_2;
    var_4.team = var_2.team;
    var_4._id_7C71 = var_3._id_7C71;

    if ( isdefined( var_3._id_4EA6 ) )
        var_4._id_4EA6 = var_3._id_4EA6;

    if ( isdefined( var_3._id_9CA0 ) )
        var_4._id_FED1 = var_3._id_9CA0;

    var_4 _id_2959();
    var_4 thread _id_2950();
    var_4 _id_106C();
    return var_4;
}

_id_2957( var_0, var_1, var_2 )
{
    self setcursorhint( "HINT_NOICON" );
    var_3 = level._id_2968[self._id_296B];
    self sethintstring( var_3._id_020A );
    self hashed_0x84D0( 1 );
    self._id_84D5 = 0;
    var_4 = _id_07D0::_id_C56F( 1 );

    if ( var_4 == -1 )
        return;

    _id_07D0::_id_A854( var_4, "invisible", ( 0, 0, 0 ) );

    if ( !isdefined( self _meth_8151() ) )
        _id_07D0::_id_FB94( var_4, self.origin );
    else
        _id_07D0::_id_FB90( var_4, self );

    _id_07D0::_id_FB9B( var_4, "active" );
    _id_07D0::_id_FB8C( var_4, var_3._id_D95D );
    _id_07D0::_id_FB95( var_4, 1 );
    self._id_A8F4 = var_4;

    if ( level.teambased )
    {
        if ( var_4 != -1 )
            _id_07D0::_id_A8B7( var_4, self.team );

        _id_2958( self.team, var_3._id_EA0F, var_3._id_75DA );

        foreach ( var_6 in level.players )
        {
            if ( self.team != var_6.team )
                continue;

            if ( isdefined( var_3._id_31DB ) && !var_6 [[ var_3._id_31DB ]]( self ) )
            {
                if ( isdefined( self._id_2965 ) )
                    _id_0766::_id_D58C( self._id_2965, var_6 );
            }
        }
    }
    else
    {
        if ( var_4 != -1 )
            _id_07D0::_id_A892( var_4, self.owner );

        if ( !isdefined( var_3._id_31DB ) || self.owner [[ var_3._id_31DB ]]( self ) )
            _id_2958( self.owner, var_3._id_EA0F, var_3._id_75DA );
    }

    self makeuseable();
    self._id_8AAA = 1;
    self setcandamage( 1 );

    if ( isdefined( var_0 ) )
        self thread [[ var_0 ]]();
    else
        thread _id_294D();

    if ( isdefined( var_1 ) )
        self thread [[ var_1 ]]();
    else
        thread _id_294E();

    if ( isdefined( var_2 ) )
        self thread [[ var_2 ]]();
    else
        thread _id_295A();

    _id_07E9::_id_C2A4( "Tactical_Ground", self.owner );

    if ( isdefined( self.owner ) )
        self.owner notify( "new_deployable_box", self );

    if ( level.teambased )
    {
        foreach ( var_6 in level._id_AE69 )
        {
            if ( istrue( var_3._id_8A7A ) )
                _id_0B3F( var_6, 1, var_3._id_31DB );
            else
                _id_0B3F( var_6, self.team == var_6.team, var_3._id_31DB );

            if ( !isai( var_6 ) )
                thread _id_2956( var_6 );
        }
    }
    else
    {
        foreach ( var_6 in level._id_AE69 )
            _id_0B3F( var_6, isdefined( self.owner ) && self.owner == var_6, var_3._id_31DB );
    }

    thread _id_2955();
    thread _id_2945();

    if ( isdefined( var_3._id_AA9C ) )
        self [[ var_3._id_AA9C ]]( var_3 );
}

_id_0B3F( var_0, var_1, var_2 )
{
    if ( var_1 )
    {
        if ( !isdefined( var_2 ) || var_0 [[ var_2 ]]( self ) )
            _id_294C( var_0 );
        else
        {
            _id_294B( var_0 );
            thread _id_4E7C( var_0 );
        }

        thread _id_2969( var_0 );
    }
    else
        _id_294B( var_0 );
}

_id_2955()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        childthread _id_295B( var_0 );
    }
}

_id_2945()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "spawned_agent_player", var_0 );
        _id_2944( var_0 );
    }
}

_id_295B( var_0 )
{
    var_0 waittill( "spawned_player" );

    if ( level.teambased )
    {
        _id_2944( var_0 );
        thread _id_2956( var_0 );
    }
}

_id_2956( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "joined_team" );

        if ( level.teambased )
            _id_2944( var_0 );
    }
}

_id_2944( var_0 )
{
    if ( self.team == var_0.team || istrue( level._id_2968[self._id_296B]._id_8A7A ) )
    {
        _id_294C( var_0 );
        thread _id_2969( var_0 );
    }
    else
    {
        _id_294B( var_0 );

        if ( isdefined( self._id_2965 ) )
            _id_0766::_id_D58C( self._id_2965, var_0 );
    }
}

_id_2958( var_0, var_1, var_2 )
{
    var_3 = level._id_2968[self._id_296B];
    var_4 = _id_0A6F::_id_6ACA( var_1 );

    if ( isdefined( var_3._id_75CE ) )
        var_4 = var_3._id_75CE;

    if ( !scripts\cp_mp\utility\game_utility::_id_89D2() )
        self._id_2965 = thread _id_0766::_id_D58E( var_0, var_4, var_2, 1 );
}

_id_294C( var_0 )
{
    if ( isplayer( var_0 ) )
        self _meth_80E0( var_0 );

    self._id_4A6C[var_0 getentitynumber()] = 0;
}

_id_294B( var_0 )
{
    if ( isplayer( var_0 ) )
        self disableplayeruse( var_0 );

    self._id_4A6C[var_0 getentitynumber()] = 1;
}

_id_2959()
{
    self makeunusable();
    self._id_8AAA = 0;

    if ( isdefined( self._id_A8F4 ) )
        _id_07D0::_id_C78C( self._id_A8F4 );
}

_id_294D()
{
    var_0 = level._id_2968[self._id_296B];
    _id_079A::_id_A0EC( var_0.maxhealth, var_0._id_42DC, ::_id_294F, ::_id_2954, 1 );
}

_id_2954( var_0 )
{
    var_1 = var_0.attacker;
    var_2 = var_0.objweapon;
    var_3 = var_0._id_9CBF;
    var_4 = var_0.damage;
    var_5 = var_0._id_7C7C;
    var_6 = var_4;
    var_7 = level._id_2968[self._id_296B];

    if ( var_7._id_1599 )
        var_6 = _id_079A::_id_744C( var_2, var_3, var_6 );

    var_6 = _id_079A::_id_7450( var_2, var_3, var_6 );
    var_6 = _id_079A::_id_7437( var_2, var_3, var_6 );
    var_6 = _id_079A::_id_7401( var_2, var_3, var_6 );
    return var_6;
}

_id_294F( var_0 )
{
    var_1 = var_0.attacker;
    var_2 = var_0.objweapon;
    var_3 = var_0._id_9CBF;
    var_4 = var_0.damage;
    self._id_4828 = 1;
    var_5 = level._id_2968[self._id_296B];
    var_6 = _id_079A::_id_AB05( "deployable_ammo", var_1, var_2, var_3, var_4, var_5._id_CC09, var_5._id_1068D );

    if ( var_6 )
        var_1 notify( "destroyed_equipment" );
}

_id_294E()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    _id_2959();
    _id_C46F();
    var_0 = level._id_2968[self._id_296B];

    if ( !istrue( self._id_4828 ) )
    {
        playfx( var_0._id_4400, self.origin );
        self playsound( "mp_killstreak_disappear" );
    }
    else
    {
        var_1 = self.origin + ( 0, 0, var_0._id_75DA );

        if ( isdefined( var_0._id_43BE ) )
        {
            var_2 = undefined;

            if ( isdefined( self.owner ) )
                var_2 = self.owner;

            if ( isdefined( var_0._id_57AD ) )
            {
                playfx( var_0._id_57AD, self.origin );
                self playsound( "c4_expl_trans" );
            }

            _func_01B5( var_1, var_0._id_43C0, var_0._id_43BE, var_0._id_43BF, var_2, "MOD_EXPLOSIVE", "support_box_mp" );
            thread _id_07EB::_id_7127( self.origin, 1.0 );
        }
    }

    self notify( "deleting" );
    self delete();
}

_id_2950()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "box_handleOwner" );
    self endon( "box_handleOwner" );
    childthread _id_295C( "disconnect" );
    childthread _id_295C( "joined_team" );
    childthread _id_295C( "joined_spectators" );
}

_id_295C( var_0 )
{
    self.owner waittill( var_0 );
    self._id_87E1 = 1;
    self notify( "death" );
}

_id_2969( var_0 )
{
    self endon( "death" );
    thread _id_2963( var_0 );

    if ( !isdefined( var_0._id_2964 ) )
        var_0._id_2964 = [];

    var_0._id_2964[var_0._id_2964.size] = self;
    var_1 = level._id_2968[self._id_296B];

    for (;;)
    {
        self waittill( "captured", var_2 );

        if ( var_2 == var_0 )
        {
            var_0 playlocalsound( var_1._id_ABC0 );

            if ( isdefined( var_1._id_ABBA ) )
                var_0 [[ var_1._id_ABBA ]]( self );

            if ( isdefined( self.owner ) && var_0 != self.owner && !scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_0 ) )
                self.owner thread _id_0A76::_id_6FE6( "support", undefined, var_1._id_FEF5 );

            if ( isdefined( self._id_FED1 ) )
            {
                self._id_FED1--;

                if ( self._id_FED1 == 0 )
                {
                    _id_2952();
                    break;
                }
            }

            if ( isdefined( var_1._id_31E2 ) && var_1._id_31E2 )
            {
                foreach ( var_4 in level._id_47BC[var_1._id_EA0F] )
                {
                    var_4 _id_294B( var_0 );

                    if ( isdefined( var_4._id_2965 ) )
                        _id_0766::_id_D58C( var_4._id_2965, var_0 );

                    var_4 thread _id_4E7C( var_0 );
                }

                continue;
            }

            if ( istrue( var_1._id_3197 ) )
                continue;

            if ( isdefined( self._id_2965 ) )
                _id_0766::_id_D58C( self._id_2965, var_0 );

            _id_294B( var_0 );
            thread _id_4E7C( var_0 );
        }
    }
}

_id_4E7C( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "death" );

    if ( level.teambased )
    {
        if ( self.team == var_0.team )
        {
            if ( isdefined( self._id_2965 ) )
                _id_0766::_id_D583( self._id_2965, var_0 );

            _id_294C( var_0 );
        }
    }
    else if ( isdefined( self.owner ) && self.owner == var_0 )
    {
        if ( isdefined( self._id_2965 ) )
            _id_0766::_id_D583( self._id_2965, var_0 );

        _id_294C( var_0 );
    }
}

_id_2963( var_0 )
{
    level endon( "game_ended" );

    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( level._id_2968[self._id_296B]._id_A6B2 ) && level._id_2968[self._id_296B]._id_A6B2 && scripts\mp\utility\weapon::_id_88DC( var_0 getcurrentweapon() ) )
            continue;

        if ( var_1 == var_0 && _id_FE7B( var_0, level._id_2968[self._id_296B]._id_FEE5 ) )
            self notify( "captured", var_0 );
    }
}

_id_8856( var_0 )
{
    return level.teambased && self.team == var_0.team;
}

_id_295A()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_2968[self._id_296B];
    var_1 = var_0._id_935A;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );

    if ( isdefined( var_0._id_1068E ) )
        self.owner thread _id_0A64::_id_9120( var_0._id_1068E );

    _id_2952();
}

_id_2952()
{
    waitframe();
    self._id_87E1 = 1;
    self notify( "death" );
}

_id_475A( var_0 )
{
    wait 0.25;
    self linkto( var_0, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 waittill( "death" );
    _id_2952();
}

_id_2953( var_0 )
{
    self endon( "death" );
    self hide();

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == var_0 )
            self showtoplayer( var_2 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
                self showtoplayer( var_2 );
        }
    }
}

_id_FE7B( var_0, var_1 )
{
    scripts\mp\movers::_id_CDCB( var_0 );
    var_0 scripts\common\utility::_id_1565( 0 );
    var_0._id_2967 = spawnstruct();
    var_0._id_2967._id_4122 = 0;
    var_0._id_2967._id_84D5 = 1;
    var_0._id_2967._id_FEAF = 0;
    var_0._id_2967._id_7C71 = self._id_7C71;

    if ( isdefined( var_1 ) )
        var_0._id_2967._id_FEE5 = var_1;
    else
        var_0._id_2967._id_FEE5 = 3000;

    var_2 = _id_FE7D( var_0 );

    if ( isalive( var_0 ) )
    {
        var_0 scripts\common\utility::_id_1565( 1 );
        scripts\mp\movers::_id_CDDA( var_0 );
    }

    if ( !isdefined( self ) )
        return 0;

    var_0._id_2967._id_84D5 = 0;
    var_0._id_2967._id_4122 = 0;
    return var_2;
}

_id_FE7D( var_0 )
{
    var_1 = var_0._id_2967;

    while ( var_0 _id_898A( var_1 ) )
    {
        if ( !var_0 scripts\mp\movers::_id_CDDB( self ) )
        {
            var_0 _id_07AD::_id_FD73( var_1, 0 );
            return 0;
        }

        var_1._id_4122 = var_1._id_4122 + level._id_01CC * var_1._id_FEAF;

        if ( isdefined( var_0._id_A8D9 ) )
            var_1._id_FEAF = 1 * var_0._id_A8D9;
        else
            var_1._id_FEAF = 1;

        var_0 _id_07AD::_id_FD73( var_1, 1 );

        if ( var_1._id_4122 >= var_1._id_FEE5 )
        {
            var_0 _id_07AD::_id_FD73( var_1, 0 );
            return scripts\mp\utility\player::isreallyalive( var_0 );
        }

        waitframe();
    }

    var_0 _id_07AD::_id_FD73( var_1, 0 );
    return 0;
}

_id_106C()
{
    level._id_47BC[self._id_296B][self getentitynumber()] = self;
}

_id_C46F()
{
    level._id_47BC[self._id_296B][self getentitynumber()] = undefined;
}

_id_898A( var_0 )
{
    return !level._id_609B && isdefined( var_0 ) && scripts\mp\utility\player::isreallyalive( self ) && self usebuttonpressed() && !self isonladder() && !self meleebuttonpressed() && var_0._id_4122 < var_0._id_FEE5 && ( !isdefined( self._id_F038 ) || !self._id_F038 );
}

_id_8866( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        default:
            var_1 = 0;
            break;
    }

    return var_1;
}
