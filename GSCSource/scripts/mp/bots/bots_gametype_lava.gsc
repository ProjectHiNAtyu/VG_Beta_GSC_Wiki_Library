// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    _id_D78A();
    _id_D76D();
}

_id_D78A()
{
    level._id_2777["gametype_think"] = ::_id_280B;
}

_id_D76D()
{

}

_id_280B()
{
    self notify( "bot_lava_think" );
    self endon( "bot_lava_think" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self [[ self._id_B012 ]]();
        wait 0.05;
    }
}
