// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_D78A();
    _id_D759();
}

_id_D78A()
{
    level._id_2777["gametype_think"] = ::_id_26DA;
}

_id_D759()
{

}

_id_26DA()
{
    self notify( "bot_arm_think" );
    self endon( "bot_arm_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self [[ self._id_B012 ]]();
        wait 0.05;
    }
}
