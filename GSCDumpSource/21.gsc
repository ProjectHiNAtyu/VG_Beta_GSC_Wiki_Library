// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_00E5()
{
    self [[ level._id_8111 ]]();
    var_0 = "axis";

    if ( level._id_A757 % 2 == 0 )
        var_0 = "allies";

    level._id_A757++;
    self _meth_84C3( "ai_lochit_dmgtable" );
    self [[ level._id_D45B ]]( var_0 );
    level._id_11E9[level._id_11E9.size] = self;
}

_id_00E6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = var_5;
    var_1 = [[ level._id_11F5 ]]( var_1 );
    var_13 = self [[ level._id_11EC ]]( "on_damaged" );

    if ( isdefined( var_13 ) )
        self [[ var_13 ]]( var_0, var_1, var_2, var_3, var_4, var_12, var_6, var_7, var_8, var_9, var_10, var_11, var_5 );
}

_id_00E8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( level._id_2F28 ) )
        [[ level._id_2F28 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_00E9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = var_5;
    var_1 = [[ level._id_11F5 ]]( var_1 );
    var_11 = self [[ level._id_11EC ]]( "on_killed" );

    if ( isdefined( var_11 ) )
        self thread [[ var_11 ]]( var_0, var_1, var_2, var_4, var_10, var_6, var_7, var_8, var_9 );
}

_id_00E7( var_0, var_1 )
{

}

init()
{
    _id_8110();
    scripts\anim\notetracks_mp::_id_C26E();
    _id_0009::_id_D7D2();
    level thread _id_0F67();
}

_id_3B60( var_0, var_1, var_2 )
{
    var_3 = [[ level._id_6A37 ]]( var_0 );

    if ( isdefined( var_3 ) )
    {
        var_3._id_3B62 = gettime();

        if ( isdefined( var_1 ) )
            var_3 [[ level._id_D45B ]]( var_1 );
        else
            var_3 [[ level._id_D45B ]]( var_3.team );

        if ( isdefined( var_2 ) )
            var_3._id_37DC = var_2;

        if ( isdefined( level._id_11C6[var_0]["onAIConnect"] ) )
            var_3 [[ var_3 [[ level._id_11EC ]]( "onAIConnect" ) ]]();

        var_3 [[ level._id_1131 ]]();
    }

    return var_3;
}

_id_8110()
{
    level._id_11E9 = [];
    level._id_A757 = 0;
}

_id_0F67()
{
    level endon( "game_ended" );
    level waittill( "connected", var_0 );
    var_1 = _func_00AE();

    while ( level._id_11E9.size < var_1 )
    {
        var_2 = _func_0004();

        if ( !isdefined( var_2 ) )
        {
            waitframe();
            continue;
        }
    }
}

_id_D125( var_0 )
{
    self._id_002C = var_0;
    self.health = var_0;
    self.maxhealth = var_0;
}
