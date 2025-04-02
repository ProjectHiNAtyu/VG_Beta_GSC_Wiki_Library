// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

dead_drop_try_use()
{
    if ( self._id_EA10 == 0 )
    {
        scripts\mp\hud_message::_id_DC9F( "MP/DEAD_DROP_NO_POINTS_TO_STORE" );
        return 0;
    }

    scripts\mp\killstreaks\killstreaks::_id_CB45();
    thread dead_drop_await_death();
    return 1;
}

dead_drop_await_death()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    scripts\mp\killstreaks\killstreaks::_id_9692();
}
