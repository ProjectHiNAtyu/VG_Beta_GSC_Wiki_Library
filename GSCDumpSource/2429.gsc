// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_11CB()
{
    if ( isdefined( anim._id_A649 ) )
        return;

    anim._id_A649 = 1;
    scripts\anim\shared::_id_811C();
    scripts\anim\shared::_id_810F();
    scripts\anim\shared::_id_8204();
    scripts\anim\shared::_id_82A3();
    scripts\anim\shared::_id_815E();
    scripts\anim\shared::_id_D89E();
    scripts\anim\shared::_id_80A5();
    _id_D86D();
    _id_8115();
    _id_8285();
    scripts\anim\face::_id_81F3();
    _id_075D::_id_102EA();
}

_id_D86D()
{
    anim._id_7167["AI_frag_grenade_mp"] = randomintrange( 0, 20000 );
    anim._id_7167["AI_flash_grenade_mp"] = randomintrange( 0, 20000 );
    anim._id_7167["AI_smoke_grenade_mp"] = randomintrange( 0, 20000 );
    anim._id_7167["AI_concussion_grenade_mp"] = randomintrange( 5000, 20000 );
    anim._id_7167["AI_splash_grenade_mp"] = randomintrange( 5000, 20000 );
    anim._id_7167["AI_molotov_mp"] = randomintrange( 5000, 20000 );
    anim._id_7167["AI_semtex_mp"] = randomintrange( 5000, 20000 );
    anim._id_7167["AI_gas_mp"] = randomintrange( 5000, 20000 );
}

_id_8115()
{
    if ( !isdefined( anim._id_2F2C ) )
        anim._id_2F2C = [];

    anim._id_2F2C["PlaySoundAtViewHeight"] = ::_id_B2C6;
}

_id_B2C6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !_func_0200( var_0 ) )
        return;

    self _meth_827D( var_0 );

    if ( isdefined( var_1 ) )
    {
        wait( _func_0140( var_0 ) / 1000 );
        self notify( var_1 );
    }
}

_id_8285()
{
    level._id_E7FE = ::_id_8288;
}

_id_6966()
{
    return [];
}

_id_D4D9()
{

}

_id_8288()
{
    level._id_5D67 = ::_id_6966;
    level._id_5D9B = ::_id_D4D9;
}
