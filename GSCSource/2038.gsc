// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_ABA6 = ::_id_ABA6;
    level._id_C7E7 = [];
    level._id_A77D = scripts\mp\utility\game::_id_6A46();
    level._id_A784 = getdvarint( "scr_" + scripts\mp\utility\game::getgametype() + "_numRevives", 0 );
    level._id_4AC6 = 1;
    level thread _id_AB46();
}

_id_AB46()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_A784 = level._id_A784;
    }
}

_id_ABA6( var_0 )
{
    if ( var_0.team != "spectator" )
        level thread _id_E35B( var_0, var_0, "new_trigger_spawned", "MOD_SUICIDE" );
}

_id_FD11()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    if ( !istrue( _id_07A8::_id_609F( "prematch_done" ) ) )
    {
        if ( _id_07A8::_id_609F( "infil_will_run" ) )
        {
            level scripts\engine\utility::_id_1087F( "prematch_done", "start_mode_setup", "infil_started" );
            var_0 = int( max( level._id_BBA0 - 5, 5 ) );
            wait( var_0 );
        }
        else
            level scripts\engine\utility::_id_1087F( "prematch_done", "start_mode_setup", "match_start_real_countdown" );
    }

    while ( scripts\mp\utility\player::isreallyalive( self ) )
    {
        if ( _id_8AD3() )
            _id_D8CA();

        waitframe();
    }
}

_id_D8CA()
{
    var_0 = self.origin;

    if ( isbot( self ) )
    {
        var_1 = self _meth_815E();

        if ( !isdefined( var_1 ) )
            var_0 = self.origin;
        else
            var_0 = var_1.origin;
    }
    else
    {
        var_1 = self _meth_815E();

        if ( !isdefined( var_1 ) )
            var_1 = self.origin;
        else
            var_1 = var_1.origin;
    }

    if ( !isdefined( self._id_C7DB ) )
        self._id_BC4F = var_0;
    else
        self._id_BC4F = self._id_C7DB;

    self._id_C7DB = var_0;
    self._id_C7E9 = var_0;
    self._id_A3EB = var_1;
}

_id_8AD3()
{
    var_0 = self.origin + ( 0, 0, 3 );

    if ( _func_0034( var_0 ) && self isonground() && !_id_0A67::_id_F391() )
        return 1;
    else
        return 0;
}

_id_E35B( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_4 = var_0.origin;
    var_0.pers["useNVG"] = 0;

    if ( var_0 _meth_8630() )
        var_0.pers["useNVG"] = 1;

    var_5 = 1;

    if ( istrue( level._id_A77D ) )
    {
        waitframe();
        var_5 = !scripts\mp\utility\player::isreallyalive( var_0 ) && !istrue( var_0._id_82AC );

        if ( var_5 )
            var_5 = var_5 && !var_0 scripts\mp\playerlogic::_id_9CB6();
    }

    var_6 = level._id_9077;

    if ( var_6 != 0 )
        var_0._id_F280 = var_6;

    if ( var_0 scripts\mp\utility\player::_id_8AB5() )
    {
        var_0._id_C7E2 = 1;
        var_0 waittill( "stopped_using_remote" );
        var_0._id_C7E1 = 1;
    }
    else
    {
        var_0._id_C7E1 = 1;
        wait 3;
    }

    if ( istrue( var_0._id_F280 ) )
        var_0 thread _id_C7E0( var_6 );

    if ( !var_5 )
        return;

    if ( isagent( var_0 ) || !isdefined( var_0 ) )
        return;
    else
    {
        if ( !isdefined( var_0._id_C7AF ) )
            var_0._id_C7AF = var_0.class;

        var_7 = var_0 scripts\mp\class::_id_9617( var_0._id_C7AF );
        var_8 = var_0 scripts\mp\playerlogic::_id_6C23( var_7 );
        var_0 scripts\mp\playerlogic::_id_968F( [ var_8 ], 1 );
    }

    if ( isdefined( var_1 ) && isagent( var_1 ) )
        var_1 = var_1.owner;

    var_9[0] = spawn( "script_model", ( 0, 0, 0 ) );
    var_10 = var_9[0];
    var_9[0] setmodel( "tag_origin" );

    if ( istrue( level._id_A77D ) )
        var_9[0] _meth_82F8( var_0 );

    var_9[0] _meth_85A2();
    var_11 = 0;
    var_12 = var_0.team;
    var_11 = level._id_9074;

    if ( isdefined( var_0.attacker ) && isdefined( var_0.attacker.classname ) && var_0.attacker.classname == "trigger_hurt" && isdefined( var_0._id_A3EB ) )
        var_4 = var_0._id_A3EB;
    else if ( isdefined( var_0._id_C7E9 ) )
        var_4 = var_0._id_C7E9;
    else
    {
        var_13 = var_0 _meth_815E();

        if ( isdefined( var_13 ) )
            var_4 = var_13.origin;
        else
            var_4 = var_0.origin;
    }

    var_14 = [ "physicscontents_playerclip" ];
    var_15 = physics_createcontents( var_14 );
    var_16 = scripts\engine\trace::_id_E406( var_4 + ( 0, 0, 10 ), var_4 + ( 0, 0, 30 ), 2.0, undefined, var_15, 1 );
    var_4 = var_16["position"];
    var_10.team = var_0.team;
    var_10._id_4802 = var_4;
    level._id_C7E7[var_0._id_723F] = _id_07AD::_id_3FCF( var_12, var_10, var_9, ( 0, 0, 0 ) );
    level._id_C7E7[var_0._id_723F]._id_047A _id_99F5( var_0.team, istrue( level._id_A784 ) );
    level._id_C7E7[var_0._id_723F]._id_AD9B = var_0.team;
    level._id_C7E7[var_0._id_723F]._id_047A.owner = var_0;
    level._id_C7E7[var_0._id_723F]._id_047A._id_7C71 = "laststand_reviver";
    level._id_C7E7[var_0._id_723F]._id_839C = "friendly";
    level._id_C7E7[var_0._id_723F]._id_4122 = 0;
    level._id_C7E7[var_0._id_723F]._id_FEE5 = var_11;
    level._id_C7E7[var_0._id_723F]._id_45AB = var_11;
    level._id_C7E7[var_0._id_723F]._id_FEAF = 1;
    level._id_C7E7[var_0._id_723F]._id_7C71 = "laststand_reviver";
    level._id_C7E7[var_0._id_723F]._id_56C2 = 0;
    level._id_C7E7[var_0._id_723F]._id_56C1 = 1;
    level._id_C7E7[var_0._id_723F]._id_DDC6 = 1;
    level._id_C7E7[var_0._id_723F]._id_DDB2 = 1;
    level._id_C7E7[var_0._id_723F]._id_AA66 = ::_id_C7E4;
    level._id_C7E7[var_0._id_723F]._id_ABB8 = ::_id_C7E3;
    level._id_C7E7[var_0._id_723F]._id_AAAF = ::_id_C7E5;
    level._id_C7E7[var_0._id_723F]._id_AA6D = ::_id_C7E6;
    level._id_C7E7[var_0._id_723F]._id_047A setcursorhint( "HINT_BUTTON" );
    level._id_C7E7[var_0._id_723F]._id_047A setuseholdduration( "duration_none" );
    level._id_C7E7[var_0._id_723F]._id_047A hashed_0x84D0( 1 );
    level._id_C7E7[var_0._id_723F]._id_047A _meth_84D6( "tag_origin" );
    level._id_C7E7[var_0._id_723F]._id_047A _meth_83A0( -2 );
    level._id_C7E7[var_0._id_723F]._id_047A _meth_84D3( 96 );
    level._id_C7E7[var_0._id_723F]._id_047A sethintdisplayfov( 120 );
    level._id_C7E7[var_0._id_723F]._id_047A setuserange( 96 );
    level._id_C7E7[var_0._id_723F]._id_047A setusefov( 360 );
    level._id_C7E7[var_0._id_723F]._id_047A _meth_84D8( "hide" );
    level._id_C7E7[var_0._id_723F]._id_047A._id_045A = "revive_trigger";

    if ( !scripts\cp_mp\utility\game_utility::_id_89D2() )
        level._id_C7E7[var_0._id_723F]._id_047A sethintstring( &"MP/LASTSTAND_REVIVE_USE" );
    else
    {

    }

    level._id_C7E7[var_0._id_723F] _id_07AD::_id_D8C7( var_11 );
    level._id_C7E7[var_0._id_723F]._id_103C0 = var_0;
    level._id_C7E7[var_0._id_723F]._id_103CA = var_0.team;
    var_0 thread _id_C7EB( level._id_C7E7[var_0._id_723F] );
    var_0 thread _id_C7EA( level._id_C7E7[var_0._id_723F] );
    level._id_C7E7[var_0._id_723F]._id_43CE = 1;
    level._id_C7E7[var_0._id_723F]._id_411F = var_4;
    level._id_C7E7[var_0._id_723F]._id_047A.origin = var_4;
    level._id_C7E7[var_0._id_723F]._id_1042E[0].origin = var_4;
    level._id_C7E7[var_0._id_723F] _id_07AD::_id_81D0();

    if ( isdefined( var_1 ) )
    {
        level._id_C7E7[var_0._id_723F].attacker = var_1;
        level._id_C7E7[var_0._id_723F]._id_1DBB = var_1.team;
    }

    var_0._id_5EA7 = var_4;
    var_0._id_5EA2 = var_0.angles;
    var_0 thread _id_1155( level._id_C7E7[var_0._id_723F], var_0, var_0.team );
    level notify( var_2, level._id_C7E7[var_0._id_723F] );
    level notify( "player_last_stand" );
    var_0 scripts\mp\playerlogic::_id_D489( 0 );

    if ( isdefined( level._id_A77D ) && level._id_A77D )
        var_0._id_03E0 = "hud_status_revive_wh";
}

_id_99F5( var_0, var_1 )
{
    self makeuseable();
    thread _id_0D85( var_0, var_1 );
}

_id_0D85( var_0, var_1 )
{
    self notify( "start_team_trigger" );
    self endon( "start_team_trigger" );
    self endon( "death" );

    for (;;)
    {
        foreach ( var_3 in level.players )
        {
            if ( !var_1 )
                var_3._id_A784 = 1;

            if ( var_3.team == var_0 && var_3._id_A784 && !istrue( var_3 scripts\mp\utility\perk::_hasperk( "specialty_revive_use_weapon" ) ) )
                self _meth_80E0( var_3 );
            else
                self disableplayeruse( var_3 );

            if ( istrue( var_3 scripts\mp\utility\perk::_hasperk( "specialty_revive_use_weapon" ) ) )
                var_3._id_786D[self getentitynumber()] = self;
        }

        level waittill( "joined_team" );
    }
}

_id_0D84( var_0 )
{
    self endon( "death" );

    foreach ( var_2 in level.players )
    {
        if ( var_2 != var_0 )
        {
            self disableplayeruse( var_2 );
            self hidefromplayer( var_2 );
        }
    }
}

_id_C7E0( var_0 )
{
    self endon( "death_or_disconnect" );
    self endon( "last_stand_finished" );
    self endon( "trigger_removed" );
    level endon( "game_ended" );
    self endon( "team_eliminated" );
    var_1 = level._id_C7E7[self._id_723F];
    level waittill( "new_trigger_spawned", var_1 );
    var_2 = var_0;

    for (;;)
    {
        waitframe();
        var_3 = var_0;

        if ( !istrue( scripts\mp\playerlogic::_id_68EB() ) )
        {
            var_0 = var_0 - level._id_5F1B;
            self._id_F212 = var_0;
            self setclientomnvar( "ui_securing_progress", min( var_0 / var_3, 0.01 ) );
            self setclientomnvar( "ui_securing", 0 );
        }

        if ( level._id_EF67[self.team]["aliveCount"] > 0 )
            _id_0A70::_id_D5DD( 5, int( gettime() + var_0 * 1000 ) );

        if ( istrue( self._id_5124 ) )
        {
            thread _id_C528( self._id_723F, 1 );
            self notify( "trigger_removed" );
            return;
        }

        if ( var_0 <= level._id_5F1B )
        {
            self notify( "last_stand_bleedout" );
            thread _id_C528( self._id_723F, 1, 1 );

            if ( scripts\mp\utility\game::getgametype() == "arm" )
                _id_0A70::_id_D5DD( 18 );
            else
            {
                _id_0A70::_id_D5DD( 2 );
                thread scripts\mp\playerlogic::_id_C514( 3.0 );
            }

            self notify( "trigger_removed" );
            break;
        }
        else if ( istrue( self._id_249F ) )
        {
            thread _id_C528( self._id_723F, 1 );
            _id_0A70::_id_D5DD( 0 );
            self notify( "trigger_removed" );
            break;
        }
    }
}

_id_C528( var_0, var_1, var_2 )
{
    self._id_C7E1 = undefined;

    if ( isdefined( level._id_C7E7[var_0] ) )
    {
        if ( isdefined( level._id_C7E7[var_0]._id_5410 ) )
            level._id_C7E7[var_0]._id_5410 _id_C52A( self );

        level._id_C7E7[var_0] _id_C52A( self );
        waitframe();

        if ( isdefined( level._id_C7E7[var_0]._id_5410 ) )
        {
            level._id_C7E7[var_0]._id_5410 _id_C52E();
            level._id_C7E7[var_0]._id_5410 = undefined;
        }

        if ( isdefined( level._id_C7E7[var_0] ) )
            level._id_C7E7[var_0] _id_C52E();

        level._id_C7E7[var_0] = undefined;

        if ( isdefined( var_2 ) )
        {
            self._id_5EA7 = undefined;
            self._id_5EA2 = undefined;
        }
    }
}

_id_C52A( var_0 )
{
    self notify( "disabled" );

    if ( isdefined( self._id_43CE ) )
    {
        if ( isdefined( var_0._id_8FD1 ) )
            var_0._id_8FD1 delete();

        self._id_43CE = undefined;
    }

    _id_07AD::_id_15B7( "none" );
    self notify( "reset" );
}

_id_C52E()
{
    self notify( "death" );

    for ( var_0 = 0; var_0 < self._id_1042E.size; var_0++ )
    {
        if ( isdefined( self._id_1042E[var_0] ) )
            self._id_1042E[var_0] delete();
    }

    if ( !isdefined( self._id_DDB2 ) )
        thread _id_07AD::_id_477C();
}

_id_C310( var_0 )
{
    var_1 = var_0 + ( 0, 0, 5 );
    var_2 = level._id_C7E7[self._id_723F]._id_047A;
    var_2._id_4802 = var_1;
    var_2._id_411F = var_1;
    var_2.origin = var_1;
    level._id_C7E7[self._id_723F]._id_1042E[0].origin = var_1;
    self._id_5EA7 = var_1;
    self._id_8FD1.origin = var_1;
}

_id_C7EB( var_0 )
{
    level endon( "game_ended" );
    self endon( "trigger_removed" );
    var_0 endon( "death" );

    for (;;)
    {
        scripts\engine\utility::waittill_any_2( "disconnect", "joined_team" );
        thread _id_C528( self._id_723F, 1, 1 );
    }
}

_id_C7EA( var_0 )
{
    level endon( "game_ended" );
    self endon( "trigger_removed" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "joined_spectators" );

        if ( self.team == "spectator" )
            thread _id_C528( self._id_723F, 1, 1 );
    }
}

_id_AB7B( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( !isdefined( self.pers ) )
        waitframe();

    var_2 = scripts\mp\rank::_id_6CEE( var_0 );

    if ( istrue( var_1._id_EAF2 ) )
        var_2 = 0;

    thread _id_0A76::_id_6FE6( var_0, undefined, var_2 );
}

_id_9356( var_0 )
{
    if ( istrue( level._id_A784 ) )
        var_0._id_A784--;

    if ( isdefined( var_0.pers["rescues"] ) )
    {
        var_0.pers["rescues"]++;
        var_0 _id_07D5::_id_E76D( "round", "rescues", var_0.pers["rescues"] );

        switch ( scripts\mp\utility\game::getgametype() )
        {
            case "cyber":
            case "siege":
            case "sr":
                var_0 _id_0A7B::_id_D544( var_0.pers["rescues"] );
        }
    }

    var_1 = [];
    var_1[var_1.size] = self._id_103C0;

    if ( isdefined( self._id_103C0 ) )
    {
        level notify( "tr_player_respawned", self._id_103C0 );
        self._id_103C0 thread scripts\mp\rank::_id_CBF3( "revived" );
        self._id_103C0 _id_0A64::_id_9120( "revived" );

        if ( !level._id_609B )
        {
            self._id_103C0 scripts\mp\utility\player::_id_0BC4( 0 );

            if ( istrue( self._id_905E ) )
                _id_0A7B::_id_7D93( "clutchRevives", 1 );

            self._id_103C0 thread _id_C664();
        }

        self._id_103C0._id_C7E1 = undefined;
        self._id_103C0._id_03E0 = "";
        _id_0793::_id_AB69( var_0, self._id_103C0 );
    }

    var_0 thread _id_AB7B( "reviver", self._id_103C0 );

    if ( !isdefined( var_0._id_C588 ) )
        var_0._id_C588 = [];

    var_0._id_C588[self._id_103C0._id_723F] = 1;
    _id_07A5::_id_C7D4( var_0, self._id_103C0 );
}

_id_9357( var_0 )
{
    if ( isdefined( self._id_103C0 ) )
    {
        self._id_103C0 thread scripts\mp\hud_message::showsplash( "sr_eliminated" );
        level notify( "sr_player_eliminated", self._id_103C0 );
    }

    var_1 = [];
    var_1[var_1.size] = self._id_103C0;
    scripts\mp\hud_message::_id_A6A3( "sr_ally_eliminated", "sr_enemy_eliminated", self._id_103C0.team, var_1 );

    if ( isdefined( self._id_103C0 ) )
    {
        if ( !level._id_609B )
        {
            self._id_103C0 _id_0A70::_id_D5DD( 2 );
            self._id_103C0 thread scripts\mp\playerlogic::_id_C514( 3.0 );
        }

        self._id_103C0._id_C7E1 = undefined;
        self._id_103C0._id_03E0 = "hud_status_dead";
    }

    if ( self.attacker != var_0 )
        self.attacker thread _id_AB7B( "kill_confirmed" );

    var_0 thread _id_AB7B( "kill_confirmed" );
    var_0 _id_0A64::_id_9120( "kill_confirmed" );
}

_id_C664()
{
    self._id_161B = 1;
    scripts\mp\playerlogic::_id_7DCD( self.team, 1 );
    thread scripts\mp\playerlogic::_id_1094A( 1 );
}

_id_C7E3( var_0 )
{
    if ( isdefined( var_0.owner ) )
        var_0 = var_0.owner;

    if ( var_0.pers["team"] == self._id_103CA )
    {
        if ( isdefined( self._id_103C0._id_25A4 ) )
            self._id_103C0._id_25A4 delete();

        var_0 _id_0A7B::_id_7D93( "denied", 1 );
        var_0 _id_07D5::_id_E76D( "round", "denied", var_0.pers["denied"] );

        if ( istrue( level._id_A77D ) )
            _id_9356( var_0 );
    }
    else if ( level._id_A77D )
    {
        _id_9357( var_0 );
        var_0 _id_0A70::_id_D5DD( 2 );
    }

    var_0 setclientomnvar( "ui_securing", 0 );
    var_0 setclientomnvar( "ui_securing_progress", 0.01 );
    var_0._id_F910 = undefined;
    self._id_103C0 notify( "trigger_removed" );
    self._id_103C0 thread _id_C528( self._id_103C0._id_723F );
}

_id_C7E4( var_0, var_1 )
{
    var_2 = self._id_047A.owner;
    var_2 scripts\mp\playerlogic::_id_D489( 1 );

    if ( var_0 scripts\mp\utility\perk::_hasperk( "specialty_medic" ) )
    {
        var_3 = level._id_C7E7[var_2._id_723F]._id_45AB;
        level._id_C7E7[var_2._id_723F] _id_07AD::_id_D8C7( var_3 * getdvarfloat( "perk_medicReviveSpeedRatio" ) );
    }

    self._id_047A thread _id_0D84( var_0 );
    var_2._id_C7DC = var_0;
    var_2 scripts\mp\playerlogic::_id_D489( 1 );
    level thread scripts\mp\battlechatter_mp::_id_F756( var_0, "reviving" );

    if ( !istrue( var_1 ) )
        var_0 thread _id_158B( 0 );

    var_2 scripts\mp\utility\player::_id_BD13( "teamrevive::reviveTriggerHoldOnUseBegin() Killcam SKIPPED" );
    var_2 notify( "abort_killcam" );
    var_2._id_3137 = 1;
    var_2 scripts\mp\utility\player::_id_0BC4( 1 );
    var_4 = var_0 geteye();
    var_5 = _id_6CD4( var_2, var_0 );
    var_6 = var_5.origin;
    var_7 = var_5.angles;
    var_2._id_5EA2 = ( 0, var_7[1], 0 );
    waitframe();
    var_2 scripts\mp\utility\player::_id_FD24( "spectator" );
    var_2 _id_07F1::_id_D505();
    waitframe();

    if ( isdefined( level._id_C7E7[var_2._id_723F]._id_75D2 ) )
    {
        if ( scripts\cp_mp\utility\game_utility::_id_89D2() )
            var_8 = "hud_realism_head_reviving";
        else
            var_8 = "hud_icon_cyber_reviving";

        _func_0351( level._id_C7E7[var_2._id_723F]._id_75D2, var_8 );
    }

    var_9 = spawn( "script_model", var_6 );
    var_9 setmodel( "tag_origin" );
    var_9.angles = var_7;
    var_2._id_C7D0 = var_9;
    var_2 _meth_805E( var_9, "tag_origin", 1 );
    var_2 thread _id_C7D1();

    if ( scripts\cp_mp\utility\game_utility::isnightmap() )
        var_2 thread _id_19B7();

    var_2 thread _id_CA65();
}

_id_6CD4( var_0, var_1 )
{
    var_2 = level._id_C7E7[var_0._id_723F]._id_411F;
    var_3 = var_2;
    var_4 = vectornormalize( var_1.origin - var_3 );
    var_5 = 2;
    var_6 = 30;
    var_7 = 360 / var_6;
    var_8 = 1;
    var_9 = 1;
    var_10 = 100;
    var_11 = _func_0305( var_4, ( 0, 0, 1 ) );
    var_12 = 0;
    var_13 = undefined;
    var_14 = 0;
    var_15 = var_3;
    var_16 = var_11;

    while ( var_8 < var_7 )
    {
        if ( var_12 )
        {
            var_12 = 0;
            var_13 = anglestoforward( var_11 );
        }
        else
        {
            var_13 = anglestoforward( var_11 + ( 0, scripts\engine\utility::ter_op( var_9, var_6, var_6 * -1 ) * var_8, 0 ) );
            var_9 = !var_9;

            if ( var_9 == 1 )
                var_8++;
        }

        var_17 = var_3 + ( 0, 0, 12 );
        var_18 = var_3 + var_13 * var_10 + ( 0, 0, 100 );
        var_19 = scripts\engine\trace::_id_E406( var_17, var_18, var_5, [ var_1 ] );
        var_20 = 30;
        var_21 = var_19["position"];
        var_22 = 0;

        if ( var_19["fraction"] < 1 )
        {
            var_21 = var_21 + var_13 * var_5;
            var_22 = 1;
        }

        if ( var_19["fraction"] > 0.99 )
        {
            var_15 = var_21;
            var_16 = vectortoangles( var_13 );
            break;
        }
    }

    var_23 = spawnstruct();
    var_23.origin = var_15;
    var_24 = vectornormalize( var_3 - var_15 );
    var_23.angles = vectortoangles( var_24 );
    return var_23;
}

_id_C7D1( var_0 )
{
    var_1 = self._id_C7D0.origin + anglestoforward( self._id_C7D0.angles ) * 3.0;
    var_2 = self._id_C7D0.origin + anglestoforward( self._id_C7D0.angles ) * 50.0;
    var_3 = scripts\engine\trace::_id_E406( var_1, var_2, 2.0, undefined )["position"];
    var_4 = level._id_C7E7[self._id_723F]._id_FEE5 / 1000;
    self._id_C7D0 moveto( var_3, var_4, var_4 * 0.3, var_4 * 0.3 );
}

_id_19B7()
{
    self notify( "stopNVGOnRevive" );
    self endon( "stopNVGOnRevive" );
    wait 1;
    self _meth_8248( 1 );
}

_id_475D( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    var_0 delete();
}

_id_158B( var_0 )
{
    scripts\common\utility::_id_152C( var_0 );
    scripts\common\utility::_id_1526( var_0 );
    scripts\mp\utility\player::_id_151B( var_0 );
    scripts\common\utility::allow_equipment( var_0 );
}

_id_A215( var_0, var_1, var_2 )
{
    var_3 = 1.0;
    var_4 = 1.0;
    self moveto( var_0, 1.0, 0.5, 0.5 );
    var_1 = ( -9.5111, var_2.angles[1], 0 );
    self rotateto( var_1, 1.0, 0.5, 0.5 );
}

_id_C7E5( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_047A.owner ) )
    {
        var_4 = self._id_047A.owner;
        var_5 = level._id_C7E7[var_4._id_723F]._id_45AB;
        level._id_C7E7[var_4._id_723F] _id_07AD::_id_D8C7( var_5 );
        var_4 scripts\mp\playerlogic::_id_D489( 0 );

        if ( var_2 )
        {
            if ( !isdefined( var_4._id_C7D2 ) )
                var_4._id_C7D2 = 1;
            else
                var_4._id_C7D2++;

            var_6 = _id_0A66::_id_6E38( "lastStandReviveHealth" );
            _id_0780::_id_9764( var_4, var_6, var_1 );
            var_4 setclientomnvar( "ui_reviver_id", -1 );
            var_4 setclientomnvar( "ui_securing", 0 );
        }
        else
        {
            self._id_047A thread _id_0D85( var_4.team, istrue( level._id_A784 ) );

            if ( scripts\cp_mp\utility\game_utility::_id_89D2() )
                var_7 = "hud_realism_head_revive";
            else
                var_7 = "hud_icon_cyber_revive";

            if ( isdefined( level._id_C7E7[var_4._id_723F]._id_75D2 ) )
                _func_0351( level._id_C7E7[var_4._id_723F]._id_75D2, var_7 );

            var_4 scripts\mp\utility\player::_id_0BC4( 0 );
            var_4 scripts\mp\utility\player::_id_FD24( "spectator" );
            var_4 cameralinkto();
            var_4._id_C7D0 delete();

            if ( isdefined( var_4.team ) && var_4.team != "spectator" )
            {
                var_4 _meth_8012( var_4.team, 1 );

                foreach ( var_9 in level._id_EF86 )
                {
                    if ( var_9 != var_4.team )
                        var_4 _meth_8012( var_9, 0 );
                }

                var_4 _meth_8604( var_1 getentitynumber() );
            }
        }
    }

    if ( !istrue( var_3 ) )
        var_1 thread _id_158B( 1 );

    if ( isplayer( var_1 ) )
    {
        var_1 setclientomnvar( "ui_securing", 0 );
        var_1 setclientomnvar( "ui_securing_progress", 0.01 );
        var_1._id_F910 = undefined;
    }

    if ( var_2 )
    {
        var_1 _id_0A7B::_id_7D93( "revives", 1 );

        if ( istrue( var_1._id_905E ) )
            var_1 _id_0A7B::_id_7D93( "clutchRevives", 1 );
    }
}

_id_C7E6( var_0 )
{
    var_0 scripts\mp\hud_message::_id_DC9F( "MP/PLAYER_ALREADY_BEING_REVIVED" );
}

_id_1155( var_0, var_1, var_2 )
{
    if ( !level.teambased )
        return;

    var_3 = var_0._id_1042E[0].origin;
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );
    wait 0.05;
    _id_0A78::_id_1096A();

    if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
        return;

    _id_0766::_id_D586( self._id_8FD0 );

    if ( isdefined( self._id_8FD1 ) )
        self._id_8FD1 delete();

    self notify( "revived_death_icon" );

    if ( !isdefined( var_2 ) || var_2 == "spectator" )
        return;

    self._id_8FD1 = spawn( "script_model", var_3 );
    self._id_8FD1 setmodel( "tag_origin" );
    self._id_8FD1.team = var_2;

    if ( scripts\cp_mp\utility\game_utility::_id_89D2() || level._id_74A8 )
    {
        var_4 = 0;
        var_5 = 500;
        var_6 = 100;
        var_7 = "hud_realism_head_revive";
    }
    else
    {
        var_4 = 1;
        var_5 = 8000;
        var_6 = 100;
        var_7 = "hud_icon_cyber_revive";
    }

    var_0._id_75D2 = self._id_8FD1 thread _id_0766::_id_D58B( var_2, var_7, undefined, undefined, 0, var_4, var_5, var_6 );

    if ( level._id_DC9E )
    {
        _func_0352( var_0._id_75D2, "hud_icon_death_hunter_spawn" );

        foreach ( var_9 in level._id_EF86 )
            _func_035A( var_0._id_75D2, var_9 );
    }
}

_id_CA65()
{
    self notify( "end_spawn_zoom" );
    self endon( "end_spawn_zoom" );
    level endon( "game_ended" );
    self waittill( "spawned_player" );
    var_0 = self geteye();
    var_1 = self.angles;
    self _meth_805E( self._id_C7D0, "tag_origin", 1 );
    self._id_C7D0 moveto( var_0, 0.25, 0.1, 0.1 );
    self._id_C7D0 rotateto( var_1, 0.25, 0.1, 0.1 );
    wait 0.25;
    self visionsetmissilecamforplayer( "", 0.1 );
    self cameralinkto();
    self._id_C7D0 delete();
    level thread scripts\mp\battlechatter_mp::_id_F756( self, "revived" );
}

_id_B8C8()
{
    var_0 = newclienthudelem( self );
    var_0.x = 0;
    var_0.y = 0;
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.sort = 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1;
    var_0._id_01C0 = 1;
    var_0 setshader( "white", 640, 480 );
    var_0 fadeovertime( 0.4 );
    var_0.alpha = 0.0;
    wait 0.4;
    var_0 destroy();
}

_id_3878()
{
    foreach ( var_1 in level._id_C7E7 )
    {
        var_1 _id_07AD::_id_15B7( "none" );
        var_1 notify( "reset" );
        _id_0766::_id_D586( var_1._id_8FD0 );

        if ( isdefined( var_1._id_8FD1 ) )
            var_1._id_8FD1 delete();
    }
}

_id_FD65()
{

}

_id_1CFF( var_0 )
{
    self._id_839D = var_0;

    foreach ( var_2 in level.players )
        _id_19C7( var_2 );
}

_id_19C7( var_0 )
{
    if ( var_0.team == self._id_AD9B )
        self._id_1042E[0] showtoplayer( var_0 );
    else
        self._id_1042E[0] hidefromplayer( var_0 );
}

_id_10859()
{
    self endon( "disconnect" );
    self endon( "started_spawnPlayer" );
    self endon( "team_eliminated" );
    var_0 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            while ( self usebuttonpressed() )
            {
                var_0 = var_0 + 0.05;

                if ( var_0 >= 1.0 )
                    break;

                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                var_0 = var_0 + 0.05;
        }

        var_0 = 0;
        wait 0.05;
    }
}
