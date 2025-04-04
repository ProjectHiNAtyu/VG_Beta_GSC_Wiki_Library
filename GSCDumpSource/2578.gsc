// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::_id_C25C( "death_switch", ::_id_F774 );
    level._id_8D9D = ::_id_43FB;
}

_id_F773()
{
    var_0 = scripts\cp_mp\utility\killstreak_utility::_id_4034( "death_switch", self );
    return _id_F774( var_0 );
}

_id_F774( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( isdefined( level._id_8DD2 ) )
    {
        if ( !level [[ level._id_8DD2 ]]( var_0 ) )
            return 0;
    }

    level thread scripts\mp\battlechatter_mp::_id_F756( self, "use_killstreak_deadman" );
    var_1 = _id_0990::_id_E9FE( var_0, makeweapon( "ks_gesture_vest_mp" ) );

    if ( !istrue( var_1 ) )
        return 0;

    if ( isdefined( level._id_8DAD ) )
    {
        if ( !level [[ level._id_8DAD ]]( var_0 ) )
            return 0;
    }

    scripts\cp_mp\utility\killstreak_utility::_id_B85C( "use_" + var_0._id_EA0F, 1 );
    scripts\common\utility::_id_F737( level._id_9B9D, "death_switch", self.origin );
    thread scripts\mp\hud_util::_id_EF8A( "used_death_switch", self );
    thread _id_E694( var_0 );
    return 1;
}

_id_10D8A( var_0 )
{
    return 1;
}

_id_E694( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self iprintlnbold( "If I go down, I'm taking them with me!" );
    scripts\mp\utility\perk::_id_6FA5( "specialty_pistoldeath" );
    self._id_8DC0 = 1;
    self._id_43FD = spawn( "script_model", self gettagorigin( "j_helmet" ) );
    self._id_43FD setmodel( "ks_death_switch_mp" );
    self._id_43FD.angles = self.angles;
    self._id_43FD linkto( self, "j_helmet", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    thread _id_43F5();
}

_id_43F5()
{
    self endon( "disconnect" );
    self endon( "deathSwitch_release" );

    for (;;)
    {
        self._id_43FD setscriptablepartstate( "blinking_light", "on", 0 );
        wait 0.5;
        self._id_43FD setscriptablepartstate( "blinking_light", "off", 0 );
    }
}

_id_44BD()
{
    self endon( "death" );

    for (;;)
        waitframe();
}

_id_43FB()
{
    var_0 = "s4_me_fists_mp_ls";
    scripts\cp_mp\utility\inventory_utility::_giveweapon( var_0, undefined, undefined, 1 );
    thread _id_07BF::_id_EC37( var_0 );
    self._id_9048 = "laststand_killstreak";
    scripts\mp\playeractions::_id_156E( self._id_9048, 0 );
    thread _id_43F6( 3 );
    thread _id_43FC( 3 );
}

_id_43F6( var_0 )
{
    self endon( "payload_release" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = 1;
    var_2 = scripts\mp\utility\weapon::_id_0C1F( "death_switch_blast_mp", self gettagorigin( "j_mainroot" ), ( 0, 0, 0 ), var_0, 1 );
    var_2 linkto( self );
    thread _id_43F7( var_1, var_2 );
    var_3 = 1;

    while ( var_0 > 0 )
    {
        self iprintlnbold( "Death Switch Countdown: " + var_0 );
        var_0 = var_0 - var_3;
        playsoundatpos( self.origin, "death_switch_beep" );
        wait( var_3 );
        var_3 = var_3 - 0.2;

        if ( var_3 < 0.05 )
            var_3 = 0.05;
    }

    _id_43F8( var_1, var_2 );
}

_id_43F7( var_0, var_1 )
{
    self endon( "payload_release" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "watch_switch_on_death" );
    self endon( "watch_switch_on_death" );
    self waittill( "death" );
    _id_43F8( var_0, var_1 );
}

_id_43F8( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        var_1 delete();

    switch ( var_0 )
    {
        case 0:
            thread _id_43FA();
            break;
        case 1:
            thread _id_43F9();
            break;
        default:
            break;
    }

    self._id_8DC0 = undefined;
    scripts\mp\utility\perk::removeperk( "specialty_pistoldeath" );
    self notify( "payload_release" );
}

_id_43FA()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "deathSwitch_release" );
    self._id_43FD setscriptablepartstate( "blinking_light", "off", 0 );
    self._id_43FD setscriptablepartstate( "explode", "on", 0 );
    self._id_43FD setentityowner( self );
    self._id_43FD thread _id_0A78::_id_46A6( 5 );
}

_id_43F9()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "deathSwitch_release" );
    var_0 = self.origin + ( 0, 0, 20000 );
    var_1 = self.origin;
    var_2 = scripts\cp_mp\utility\weapon_utility::_magicbullet( makeweapon( "death_switch_proj_mp" ), var_0, var_1, self );
    self._id_43FD setscriptablepartstate( "blinking_light", "off", 0 );
    self._id_43FD thread _id_0A78::_id_46A6( 5 );
}

_id_43FC( var_0 )
{
    level endon( "game_ended" );
    level endon( "death_or_disconnect" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( var_0 );
    _id_0A62::_id_0D61();
}
