// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_823D( var_0 )
{
    if ( !isdefined( self.pers[var_0] ) )
        self.pers[var_0] = 0;
}

_id_6C0A( var_0 )
{
    return self.pers[var_0];
}

_id_7D93( var_0, var_1 )
{
    if ( _id_4ABA() )
        return;

    if ( !isplayer( self ) )
        return;

    if ( isdefined( self._id_911D[var_0] ) )
        self._id_911D[var_0] = self._id_911D[var_0] + var_1;

    _func_040A( self, var_0, var_1 );
}

_id_81F1( var_0 )
{
    if ( !isdefined( self._id_911D[var_0] ) )
        self._id_911D[var_0] = 0;
}

_id_D543( var_0 )
{
    if ( _id_4ABA() )
        return;

    if ( var_0 >= 65000 )
        var_0 = 65000;

    self._id_0190 = var_0;
    self.pers["extrascore0"] = var_0;
}

_id_D544( var_0 )
{
    if ( _id_4ABA() )
        return;

    if ( var_0 >= 255 )
        var_0 = 255;

    self._id_0191 = var_0;
    self.pers["extrascore1"] = var_0;
}

_id_D545( var_0 )
{
    if ( _id_4ABA() )
        return;

    if ( var_0 >= 65000 )
        var_0 = 65000;

    self._id_0192 = var_0;
    self.pers["extrascore2"] = var_0;
}

_id_D546( var_0 )
{
    if ( _id_4ABA() )
        return;

    if ( var_0 >= 65000 )
        var_0 = 65000;

    self._id_0193 = var_0;
    self.pers["extrascore3"] = var_0;
}

_id_4ABA()
{
    if ( istrue( game["practiceRound"] ) )
        return 1;

    if ( istrue( level._id_4ACB ) )
        return 1;

    return 0;
}

_id_6C2A()
{
    if ( _func_0329() )
        return "privateloadouts";

    if ( level._id_C016 && !scripts\mp\utility\game::_id_873A() )
        return "rankedloadouts";

    return "privateloadouts";
}

_id_D652()
{
    level._id_9687 = _id_6C2A();
}

_id_3194()
{
    if ( scripts\mp\utility\game::getgametype() == "infect" )
        return 0;

    if ( scripts\mp\utility\game::getgametype() == "br" && !_id_07A8::_id_609F( "prematch_done" ) )
        return 0;

    return level._id_C016 && !istrue( level._id_7D18 );
}

_id_6D77( var_0 )
{
    if ( _func_0307( "mp", "LethalScorestreakStatItems", var_0 ) )
        return "lethalScorestreakStats";

    if ( _func_0307( "mp", "SupportScorestreakStatItems", var_0 ) )
        return "supportScorestreakStats";

    return undefined;
}
