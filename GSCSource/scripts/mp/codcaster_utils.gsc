// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

sendcodcasternotification( var_0, var_1, var_2 )
{
    if ( !isdefined( level.codcasternotificationqueuethreadexist ) || level.codcasternotificationqueuethreadexist == 0 )
        level thread processenqueuednotifications();

    enqueuenotification( encodenotification( var_0, var_1, var_2 ) );
    level notify( "codcasterNotificationEnqueued" );
}

processenqueuednotifications()
{
    level endon( "game_ended" );
    level.codcasternotificationqueuethreadexist = 1;

    for (;;)
    {
        if ( !isdefined( game["codcasterEncodedNotificationQueue"] ) || !_func_0106( game["codcasterEncodedNotificationQueue"] ) )
            game["codcasterEncodedNotificationQueue"] = [];

        while ( game["codcasterEncodedNotificationQueue"].size > 0 )
        {
            setcodcasternotificationomnvar( game["codcasterEncodedNotificationQueue"][0] );
            game["codcasterEncodedNotificationQueue"] = scripts\engine\utility::array_remove_index( game["codcasterEncodedNotificationQueue"], 0, 0 );
            waitframe();
        }

        level waittill( "codcasterNotificationEnqueued" );
    }
}

enqueuenotification( var_0 )
{
    game["codcasterEncodedNotificationQueue"] = scripts\engine\utility::_id_1B65( game["codcasterEncodedNotificationQueue"], var_0 );
}

setcodcasternotificationomnvar( var_0 )
{
    if ( isdefined( var_0 ) )
        setomnvar( "ui_codcaster_notification", var_0 );
}

encodenotification( var_0, var_1, var_2 )
{
    var_3 = var_0;

    if ( isdefined( var_1 ) )
        var_3 = var_3 + ( var_1 + 1 ) * 100;

    if ( isdefined( var_2 ) )
    {
        if ( _func_02B2( var_2 ) )
            var_3 = var_3 + var_2 * 100 * 100;
        else
            scripts\engine\utility::_id_5578( "codcaster notification extra data supports numbers only. Invalid extra data: " + var_2 );
    }

    return var_3;
}
