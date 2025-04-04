// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "#x33898e672fe8116e1", 0 );
    waitframe();
    level._id_CC63 = spawnstruct();
    level._id_CC63._id_CC63 = scripts\engine\utility::_id_6D7C( "screens_system", "script_noteworthy" );

    if ( !isdefined( level._id_CC63._id_CC63 ) || level._id_CC63._id_CC63.size <= 0 )
        return;

    level._id_CC63._id_CC6B = [];
    level thread _id_CC68();

    foreach ( var_1 in level._id_CC63._id_CC63 )
    {
        var_1._id_E744 = "off";
        var_1 _id_71DF();
        var_1 thread _id_10A7D();
    }

    if ( isdefined( level._id_CC72 ) )
        scripts\engine\utility::_id_1BBA( level._id_CC63._id_CC63, level._id_CC72 );
    else
        scripts\engine\utility::_id_1BBA( level._id_CC63._id_CC63, ::_id_CC71 );
}

_id_71DF()
{
    if ( isdefined( self._id_CD38 ) )
    {
        if ( !isdefined( level._id_CC63._id_CC6B[self._id_CD38] ) )
        {
            level._id_CC63._id_CC6B[self._id_CD38] = [];
            level thread _id_CC73( self._id_CD38 );
        }

        level._id_CC63._id_CC6B[self._id_CD38] = scripts\engine\utility::array_add( level._id_CC63._id_CC6B[self._id_CD38], self );
        level._id_CC63._id_CC63 = scripts\engine\utility::array_remove( level._id_CC63._id_CC63, self );
    }
}

_id_CC71()
{
    if ( istrue( level._id_CC6E ) )
        return;

    self endon( "death" );
    _id_CC66();
    var_0 = _id_676A();

    if ( isdefined( var_0 ) )
        _id_4C05( var_0 );
    else
        _id_CC6A();
}

_id_4C05( var_0 )
{
    self endon( "death" );

    if ( issubstr( var_0, "screen" ) )
    {
        childthread _id_CC6A( var_0 );
        return;
    }

    switch ( var_0 )
    {
        case "fixed":
            if ( _id_4407() )
            {

            }

            childthread _id_CC6A();
            break;
        case "flip":
            if ( _id_4407() )
            {

            }

            childthread _id_CC6C();
            break;
        case "fliprnd":
            if ( _id_4407() )
            {

            }

            childthread _id_CC6D();
            break;
        case "static":
            if ( _id_4407() )
            {

            }

            childthread _id_CC70();
            break;
        case "red":
            if ( _id_4407() )
            {

            }

            childthread _id_CC6F();
            break;
        case "bink":
            if ( _id_4407() )
            {

            }

            childthread _id_CC65();
            break;
        case "alertflip":
            if ( _id_4407() )
            {

            }

            childthread _id_CC64();
            break;
    }
}

_id_CC66()
{
    self._id_CC5A = spawn( "script_model", self.origin );
    self._id_CC5A.angles = self.angles;
    self._id_CC5A setmodel( self._id_CDB4 );
    self._id_CC5A _meth_81A6();
    _id_670B();
}

_id_CC67()
{
    self._id_CC5A setcandamage( 1 );
    self._id_CC5A waittill( "damage" );
    self notify( "stop_screens" );
    self._id_CC5A delete();
}

_id_CC69()
{
    self._id_E744 = "off";
    self notify( "stop_screens" );

    if ( isdefined( self._id_CC5A ) )
        self._id_CC5A delete();

    _id_4722();
}

_id_CC6A( var_0 )
{
    if ( !isdefined( self._id_CC6A ) && !isdefined( var_0 ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_fixed" );

    if ( isdefined( var_0 ) )
        var_1 = var_0;
    else
        var_1 = "screen_fixed" + ( randomint( self._id_CC6A.size ) + 1 );

    if ( _id_4407() )
    {
        var_2 = var_1;

        if ( isdefined( var_0 ) )
            var_2 = "override " + var_2;
    }

    self._id_E744 = "on";
    self._id_CC5A _meth_81A6();
    self._id_CC5A showpart( var_1 );

    if ( isdefined( self._id_CC74 ) && !isdefined( var_0 ) )
    {
        if ( randomint( 3 ) == 0 )
        {
            var_1 = "screen_widget" + ( randomint( self._id_CC74.size ) + 1 );
            self._id_CC5A showpart( var_1 );
        }
    }
}

_id_CC70()
{
    if ( !isdefined( self._id_CC70 ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_static" );
    var_0 = "screen_static" + ( randomint( self._id_CC70.size ) + 1 );

    if ( _id_4407() )
    {

    }

    self._id_E744 = "on";
    self._id_CC5A _meth_81A6();
    self._id_CC5A showpart( var_0 );
}

_id_CC6C()
{
    if ( !isdefined( self._id_CC6C ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_flip" );
    var_0 = randomint( self._id_CC6C.size ) + 1;

    for (;;)
    {
        for ( var_1 = var_0; var_1 < self._id_CC6C.size + 1; var_1++ )
        {
            var_2 = 3;
            var_3 = "screen_flip" + var_1;

            if ( _id_4407() )
            {

            }

            self._id_E744 = "on";
            self._id_CC5A _meth_81A6();
            self._id_CC5A showpart( var_3 );
            wait( var_2 );
        }

        var_0 = 1;
    }
}

_id_CC6D()
{
    if ( !isdefined( self._id_CC6D ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_fliprnd" );
    var_0 = randomint( self._id_CC6D.size ) + 1;

    for (;;)
    {
        for ( var_1 = var_0; var_1 < self._id_CC6D.size + 1; var_1++ )
        {
            var_2 = randomfloatrange( 1.5, 4 );
            var_3 = "screen_fliprnd" + var_1;

            if ( _id_4407() )
            {

            }

            self._id_E744 = "on";
            self._id_CC5A _meth_81A6();
            self._id_CC5A showpart( var_3 );
            wait( var_2 );
        }

        var_0 = 1;
    }
}

_id_CC65()
{
    if ( !isdefined( self._id_CC65 ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_bink" );
    var_0 = "screen_bink" + ( randomint( self._id_CC65.size ) + 1 );

    if ( _id_4407() )
    {

    }

    self._id_E744 = "on";
    self._id_CC5A _meth_81A6();
    self._id_CC5A showpart( var_0 );
}

_id_CC6F()
{
    if ( !isdefined( self._id_CC6F ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_red" );
    self._id_C7AC = 0;
    var_0 = randomint( self._id_CC6F.size ) + 1;

    for (;;)
    {
        for ( var_1 = 1; var_1 < self._id_CC6F.size + 1; var_1++ )
        {
            var_2 = randomfloatrange( 0.25, 0.5 );

            if ( randomint( 6 ) == 0 && !self._id_C7AC )
            {
                self._id_C7AC = 1;

                if ( var_1 <= 2 )
                    var_1 = var_1 + self._id_CC6F.size;

                var_1 = var_1 - 2;
                var_2 = 0.1;
            }
            else
                self._id_C7AC = 0;

            var_3 = "screen_red" + var_1;

            if ( _id_4407() )
            {

            }

            self._id_E744 = "on";
            self._id_CC5A _meth_81A6();
            self._id_CC5A showpart( var_3 );
            wait( var_2 );
        }

        var_0 = 1;
    }
}

_id_CC64()
{
    if ( !isdefined( self._id_CC64 ) )
        return;

    self endon( "stop_screens" );
    self endon( "stop_screens_alertflip" );
    self._id_CC5A _meth_81A6();

    for (;;)
    {
        var_0 = randomfloatrange( 0.5, 1 );

        if ( _id_4407() )
        {

        }

        self._id_E744 = "on";
        self._id_CC5A hidepart( "screen_alertflip1" );
        self._id_CC5A showpart( "screen_alertflip2" );
        wait( var_0 );
        self._id_CC5A showpart( "screen_alertflip1" );
        self._id_CC5A hidepart( "screen_alertflip2" );
        wait( var_0 );
    }
}

_id_670B()
{
    var_0 = _func_00BC( self._id_CC5A.model );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = _func_00BF( self._id_CC5A.model, var_1 );

        if ( issubstr( var_2, "screen_" ) )
        {
            if ( issubstr( var_2, "screen_red" ) )
            {
                if ( !isdefined( self._id_CC6F ) )
                    self._id_CC6F = [];

                self._id_CC6F = scripts\engine\utility::array_add( self._id_CC6F, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_fixed" ) )
            {
                if ( !isdefined( self._id_CC6A ) )
                    self._id_CC6A = [];

                self._id_CC6A = scripts\engine\utility::array_add( self._id_CC6A, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_static" ) )
            {
                if ( !isdefined( self._id_CC70 ) )
                    self._id_CC70 = [];

                self._id_CC70 = scripts\engine\utility::array_add( self._id_CC70, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_fliprnd" ) )
            {
                if ( !isdefined( self._id_CC6D ) )
                    self._id_CC6D = [];

                self._id_CC6D = scripts\engine\utility::array_add( self._id_CC6D, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_flip" ) )
            {
                if ( !isdefined( self._id_CC6C ) )
                    self._id_CC6C = [];

                self._id_CC6C = scripts\engine\utility::array_add( self._id_CC6C, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_bink" ) )
            {
                if ( !isdefined( self._id_CC65 ) )
                    self._id_CC65 = [];

                self._id_CC65 = scripts\engine\utility::array_add( self._id_CC65, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_alertflip" ) )
            {
                if ( !isdefined( self._id_CC64 ) )
                    self._id_CC64 = [];

                self._id_CC64 = scripts\engine\utility::array_add( self._id_CC64, var_2 );
                continue;
            }

            if ( issubstr( var_2, "screen_widget" ) )
            {
                if ( !isdefined( self._id_CC74 ) )
                    self._id_CC74 = [];

                self._id_CC74 = scripts\engine\utility::array_add( self._id_CC74, var_2 );
            }
        }
    }
}

_id_4722()
{
    if ( isdefined( self._id_CC6F ) )
        self._id_CC6F = [];

    if ( isdefined( self._id_CC6A ) )
        self._id_CC6A = [];

    if ( isdefined( self._id_CC70 ) )
        self._id_CC70 = [];

    if ( isdefined( self._id_CC6C ) )
        self._id_CC6C = [];

    if ( isdefined( self._id_CC6D ) )
        self._id_CC6D = [];

    if ( isdefined( self._id_CC65 ) )
        self._id_CC65 = [];

    if ( isdefined( self._id_CC64 ) )
        self._id_CC64 = [];

    if ( isdefined( self._id_CC74 ) )
        self._id_CC74 = [];
}

_id_676A()
{
    if ( isdefined( self._id_CE0B ) )
    {
        var_0 = strtok( self._id_CE0B, " " );

        foreach ( var_2 in var_0 )
        {
            if ( issubstr( var_2, "screen" ) )
                return var_2;
        }

        foreach ( var_2 in var_0 )
        {
            if ( issubstr( var_2, "state" ) )
            {
                switch ( var_2 )
                {
                    case "state_fixed":
                        return "fixed";
                    case "state_flip":
                        return "flip";
                    case "state_fliprnd":
                        return "fliprnd";
                    case "state_static":
                        return "static";
                    case "state_red":
                        return "red";
                    case "state_bink":
                        return "bink";
                    case "state_alertflip":
                        return "alertflip";
                    default:
                }
            }
        }
    }

    return undefined;
}

_id_10A7D()
{
    if ( !isdefined( self.target ) )
        return;

    var_0 = getscriptablearray( self.target, "targetname" );

    if ( isdefined( var_0[0] ) )
    {
        if ( _id_4407() )
        {

        }

        var_0[0] waittill( "death" );
        _id_CC69();
        var_1 = getarraykeys( level._id_CC63._id_CC6B );

        foreach ( var_3 in var_1 )
        {
            foreach ( var_5 in level._id_CC63._id_CC6B[var_3] )
            {
                if ( self == var_5 )
                {
                    level._id_CC63._id_CC6B[var_3] = scripts\engine\utility::array_remove( level._id_CC63._id_CC6B[var_3], self );
                    return;
                }
            }
        }
    }
}

_id_4407()
{
    if ( getdvarint( "#x33898e672fe8116e1" ) > 0 )
        return 1;

    return 0;
}

_id_D386()
{

}

_id_CC68()
{
    if ( !_id_4407() )
        return;

    for (;;)
    {
        var_0 = 0;
        var_1 = 0;
        var_2 = getarraykeys( level._id_CC63._id_CC6B );

        foreach ( var_4 in var_2 )
        {
            var_1 = var_1 + level._id_CC63._id_CC6B[var_4].size;

            foreach ( var_6 in level._id_CC63._id_CC6B[var_4] )
            {
                if ( isdefined( var_6._id_E744 ) && var_6._id_E744 == "on" )
                    var_0 = var_0 + 1;
            }
        }

        foreach ( var_6 in level._id_CC63._id_CC63 )
        {
            if ( isdefined( var_6._id_E744 ) && var_6._id_E744 == "on" )
                var_0 = var_0 + 1;
        }

        var_11 = level._id_CC63._id_CC63.size + var_1;
        waitframe();
    }
}

_id_CC73( var_0 )
{
    if ( !scripts\engine\utility::_id_5BEC( var_0 ) )
        scripts\engine\utility::_id_5BF1( var_0 );

    for (;;)
    {
        scripts\engine\utility::_id_5C04( var_0 );

        if ( _id_4407() )
            iprintln( level._id_CC63._id_CC6B[var_0].size + " flagged screens activated: " + var_0 );

        if ( !istrue( level._id_CC6E ) )
        {
            if ( isdefined( level._id_CC72 ) )
                scripts\engine\utility::_id_1BBA( level._id_CC63._id_CC6B[var_0], level._id_CC72 );
            else
                scripts\engine\utility::_id_1BBA( level._id_CC63._id_CC6B[var_0], ::_id_CC71 );
        }

        scripts\engine\utility::_id_5C10( var_0 );

        if ( _id_4407() )
            iprintln( level._id_CC63._id_CC6B[var_0].size + " flagged screens deactivated: " + var_0 );

        if ( !istrue( level._id_CC6E ) )
            scripts\engine\utility::_id_1BBA( level._id_CC63._id_CC6B[var_0], ::_id_CC69 );
    }
}
