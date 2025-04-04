// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_59FB()
{
    level._id_5A00 = [];
    level._effect["field_mic_destroyed"] = loadfx( "vfx/s4/equipment/vfx_field_mic_damaged.vfx" );
}

_id_59F5()
{
    var_0 = 0;

    foreach ( var_2 in level._id_5A00 )
    {
        foreach ( var_4 in var_2 )
        {
            var_0++;

            if ( var_0 > 200 )
                return 0;
        }
    }

    return 1;
}

_id_59F6( var_0 )
{
    var_0 field_mic_give_to_owner( self );
    var_1 = self.origin;
    var_2 = spawn( "script_model", var_1 );
    var_0._id_5A02 = var_2;
    var_0._id_5A02.owner = self;
    var_0._id_5A02.team = self.team;
    var_0._id_5A02 setotherent( self );
    thread _id_0823::field_mic_plant( var_2 );
    var_0 _meth_86FB( "equipment" );

    if ( level.teambased )
        var_0 _meth_8703( self.team );
    else
        var_0 _meth_8703( self );

    var_0.owner = self;
    var_0._id_75CE = var_0 thread _id_0766::_id_D587( 0, 4 );
    var_0 thread _id_07A4::_id_C330( ::_id_59F8, 1, 1 );
    var_0 thread _id_59F7( self );
    var_0._id_5A02 _id_59FE();
}

_id_59F9()
{

}

_id_59FF()
{
    var_0 = self getentitynumber();

    if ( !isdefined( level._id_5A00[var_0] ) )
        return;

    foreach ( var_2 in level._id_5A00[var_0] )
        var_2 _id_59F8();
}

_id_59F7( var_0 )
{
    _id_079A::_id_A0EC( 250, "hitequip", ::_id_59FA, ::_id_59FC, 0 );
}

_id_59FC( var_0 )
{
    var_1 = var_0.objweapon;
    var_2 = var_0._id_9CBF;
    return _id_079A::_id_744C( var_1, var_2, var_0.damage );
}

_id_59FA( var_0 )
{
    var_1 = var_0.attacker;

    if ( isdefined( self.owner ) && istrue( scripts\cp_mp\utility\player_utility::_id_B779( self.owner, var_1 ) ) )
    {
        var_1 scripts\mp\battlechatter_mp::_id_553B( self );
        var_2 = self.owner getentitynumber();

        if ( level._id_5A00[var_2].size > 1 )
            self.owner thread _id_0A64::_id_9120( "fm_destroyed_m" );
        else
            self.owner thread _id_0A64::_id_9120( "fm_destroyed_s" );
    }

    playfx( level._effect["field_mic_destroyed"], self.origin );
    earthquake( 0.5, 1, self.origin, 512 );
    _id_59F8();
}

_id_59F8()
{
    field_mic_remove_from_owner( self.owner );
    _id_098C::_id_7803();
    _id_0766::_id_D586( self._id_75CE );

    if ( isdefined( self._id_FE8E ) )
        self._id_FE8E delete();

    if ( isdefined( self._id_B798 ) )
        self._id_B798 delete();

    if ( isdefined( self._id_CC47 ) )
        self._id_CC47 delete();

    if ( isdefined( self._id_5403 ) )
        _id_07D0::_id_C78C( self._id_5403 );

    if ( isdefined( self._id_BE15 ) && self._id_BE15.size > 0 )
    {
        foreach ( var_1 in self._id_BE15 )
            var_1 notify( "death" );
    }

    self setscriptablepartstate( "hacked", "neutral", 0 );
    self setscriptablepartstate( "hack_usable", "off" );
    self._id_5A02 notify( "mic_destroyed" );
    thread _id_0823::field_mic_explode( self );
    self delete();
}

_id_59FE()
{
    self endon( "mic_destroyed" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    var_0 = 700;

    if ( scripts\cp_mp\utility\game_utility::_id_88E4() )
        var_0 = 700;

    var_1 = 0;

    for (;;)
    {
        _func_024C( self.origin, self.owner, var_0, 3000 );
        wait 3;
    }
}

_id_59FD( var_0 )
{
    field_mic_remove_from_owner( var_0 );
    field_mic_give_to_owner( self.owner );
    self._id_5A02.owner = self.owner;
    self setscriptablepartstate( "hacked", "active", 0 );
}

field_mic_remove_from_owner( var_0 )
{
    var_1 = [];
    var_2 = var_0 getentitynumber();

    for ( var_3 = 0; var_3 < level._id_5A00[var_2].size; var_3++ )
    {
        var_4 = level._id_5A00[var_2][var_3];

        if ( var_4 != self )
            var_1[var_1.size] = var_4;
    }

    level._id_5A00[var_2] = var_1;
}

field_mic_give_to_owner( var_0 )
{
    var_1 = var_0 getentitynumber();

    if ( !isdefined( level._id_5A00[var_1] ) )
        level._id_5A00[var_1] = [];

    var_2 = level._id_5A00[var_1].size;

    if ( var_2 + 1 > 2 )
    {
        level._id_5A00[var_1][0] _id_59F8();
        var_2--;
    }

    level._id_5A00[var_1][var_2] = self;
}
