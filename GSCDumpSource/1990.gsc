// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_7FD4()
{
    level._id_CBFD = ::_id_9FED;
    level._id_9BB2 = spawnstruct();
    level._id_9BB2._id_FE1E = [ 10, 15, 20, 30, 40, 50, 60, 75, 80, 90, 100, 125, 150, 175, 200, 225, 250, 300 ];
    level._id_9BB2._id_8311 = [ "very_low", "low", "medium", "high", "very_high" ];
    level._id_9BB2._id_8310 = [];
    var_0 = 0;

    foreach ( var_2 in level._id_9BB2._id_8311 )
    {
        level._id_9BB2._id_8310[var_2] = var_0;
        var_0++;
    }

    level._id_9BB2._id_9AB2 = [ "small", "medium", "large" ];
    level._id_9BB2._id_9AB1 = [];
    var_0 = 0;

    foreach ( var_2 in level._id_9BB2._id_9AB2 )
    {
        level._id_9BB2._id_9AB1[var_2] = var_0;
        var_0++;
    }
}

_id_9FED( var_0 )
{
    if ( getdvarint( "scr_match_intensity_disable", 0 ) )
        return var_0;

    var_1 = [ "very_low", "low", "medium", "high", "very_high" ];
    var_2 = [ "war", "dom", "koth", "sd", "conf", "patrol", "control", "dm" ];
    var_3 = [ 4, 6, 8, 10, 12, 14, 16, 18, 20, 24 ];
    var_4 = 3;
    var_5 = 3;
    var_6 = 77;
    var_7 = getdvar( "#x3e619352055ca1c48" );
    var_8 = getdvar( "#x32ea5e908954bfea7" );
    var_10 = scripts\mp\utility\game::_id_6C54();
    var_12 = 1;
    var_13 = var_12 + 3;
    var_14 = 1.0;
    var_15 = level._id_9BB2._id_8310[var_10];

    if ( isdefined( var_15 ) )
    {
        var_16 = var_13 + var_15;
        var_17 = _func_021D( "mp/matchIntensityTable.csv", 0, var_7, var_16 );

        if ( isdefined( var_17 ) && var_17 != "" )
            var_14 = float( var_17 );
        else
        {

        }

        game["dialog"]["matchIntensity"] = "mp_glob_inin_bchr_";
        var_18 = "";

        switch ( var_10 )
        {
            case "very_low":
                var_18 = "ivl";
                break;
            case "low":
                var_18 = "iil";
                break;
            case "medium":
                var_18 = "iim";
                break;
            case "high":
                var_18 = "iih";
                break;
            case "very_high":
                var_18 = "ivh";
                break;
        }

        var_19 = randomintrange( 1, 10 );

        if ( var_19 == 10 )
            var_18 = _func_00D6( var_18, 1, 2 );

        game["dialog"]["matchIntensity"] = game["dialog"]["matchIntensity"] + ( var_18 + var_19 );
    }
    else
    {

    }

    if ( !isdefined( var_7 ) || !isdefined( var_8 ) || !isdefined( var_10 ) )
        return level._id_CBFC;

    if ( var_7 == "conf_tdm" )
        var_7 = "conf";

    var_20 = scripts\engine\utility::_id_1B83( var_2, var_7 );

    if ( !isdefined( var_20 ) || var_20 < 0 )
        return level._id_CBFC;

    var_21 = var_4 + var_20 * 2;
    var_22 = undefined;
    var_23 = undefined;

    for ( var_24 = var_5; var_24 <= var_6; var_24++ )
    {
        var_22 = tablelookupbyrow( "mp/matchIntensityValuesTable.csv", var_24, 0 );

        if ( var_22 == var_8 )
        {
            var_25 = tablelookupbyrow( "mp/matchIntensityValuesTable.csv", var_24, 1 );

            if ( var_25 == var_10 )
            {
                var_23 = int( tablelookupbyrow( "mp/matchIntensityValuesTable.csv", var_24, var_21 ) );
                break;
            }
        }
    }

    if ( !isdefined( var_23 ) || var_23 < 0 )
        return level._id_CBFC;

    var_26 = int( scripts\engine\utility::_id_1B83( var_3, var_23 ) ) + 1;
    var_27 = int( _func_021D( "mp/matchIntensityScoreTable.csv", 0, var_7, var_26 ) );

    if ( !isdefined( var_27 ) || var_27 < 0 )
        return level._id_CBFC;

    return var_27;
}
