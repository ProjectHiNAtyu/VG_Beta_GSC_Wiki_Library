// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_C2A1()
{
    _id_0008::init();
    _id_097D::_id_11CB();

    if ( !isdefined( level._id_E3D6 ) )
        level._id_E3D6 = [];

    if ( !isdefined( level._id_E3D6["dog"] ) )
        level._id_E3D6["dog"] = [];

    level._id_11C4["actor_enemy_cp_dog"]["setup_func"] = ::_id_D838;
    level._id_11C4["actor_enemy_cp_dog"]["setup_model_func"] = ::_id_D884;
}

_id_D838()
{
    self._id_1874 = "dog";
    self._id_0148 = "cover_default";
    self._id_1068F = "russian";
    self._id_0492 = "dog";
    self _meth_830F( 256.0, 0.0 );
    self _meth_830E( 768.0, 1024.0 );
}

_id_D884( var_0, var_1 )
{
    self._id_75F7 = undefined;
    self setmodel( "test_character_dog_mp" );
}
