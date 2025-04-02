// S4 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_CF5B()
{
    var_0 = undefined;
    var_1 = "scripted_widgets_" + getdvar( "#x32ea5e908954bfea7" );

    if ( _func_0225( "scripted_widget_list_assets.csv", 0, var_1 ) != -1 )
        var_0 = _func_038E( "scriptedwidgetslist:scripted_widgets_" + getdvar( "#x32ea5e908954bfea7" ) );

    if ( !isdefined( var_0 ) && isdefined( level.gametype ) )
    {
        var_1 = "scripted_widgets_" + level.gametype;

        if ( _func_0225( "scripted_widget_list_assets.csv", 0, var_1 ) != -1 )
            var_0 = _func_038E( "scriptedwidgetslist:scripted_widgets_" + level.gametype );
    }

    if ( !isdefined( var_0 ) )
    {
        var_2 = "mp";

        if ( scripts\common\utility::_id_87BA() )
            var_2 = "cp";
        else if ( scripts\common\utility::_id_8A2C() )
            var_2 = "sp";

        var_1 = "scripted_widgets_" + var_2;

        if ( _func_0225( "scripted_widget_list_assets.csv", 0, var_1 ) != -1 )
            var_0 = _func_038E( "scriptedwidgetslist:scripted_widgets_" + var_2 );
    }

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( level._id_7B23 ) )
        level._id_7B23 = spawnstruct();

    if ( !isdefined( level._id_7B23._id_CF5A ) )
        level._id_7B23._id_CF5A = spawnstruct();

    var_3 = level._id_7B23._id_CF5A;
    var_3._id_9C2D = var_0.max_scripted_widgets;
    var_3._id_10E18 = [];
    var_3.anchor_types = [];
    var_3._id_1A15 = [];
    var_3.list_widget_data = spawnstruct();

    if ( isdefined( var_0._id_1A15 ) )
    {
        foreach ( var_16, var_5 in var_0._id_1A15 )
        {
            var_6 = _func_038E( "scriptedwidgetarchetype:" + var_5._id_1A0D );

            if ( isdefined( var_6 ) )
            {
                var_7 = tolower( var_5._id_1A0D );
                var_3._id_1A15[var_7] = [];
                var_8 = 0;

                foreach ( var_10 in var_6.fields )
                {
                    var_11 = tolower( var_10.field_name );
                    var_12 = var_10._id_9C25;
                    var_13 = var_10._id_E835;
                    var_12 = max( var_12, var_13 );
                    var_14 = int( _func_0037( _func_013D( var_12 / var_13 + 1 ) / _func_013D( 2 ) ) );
                    var_3._id_1A15[var_7][var_11] = spawnstruct();
                    var_3._id_1A15[var_7][var_11]._id_2509 = var_14;
                    var_3._id_1A15[var_7][var_11]._id_9C25 = var_12;
                    var_3._id_1A15[var_7][var_11]._id_E835 = var_13;
                    var_3._id_1A15[var_7][var_11]._id_D9D2 = var_8;
                    var_8 = var_8 + var_14;
                }
            }
        }
    }

    if ( isdefined( var_0.anchors ) )
    {
        foreach ( var_21, var_18 in var_0.anchors )
        {
            var_19 = _func_038E( "scriptedwidgetanchorsettings:" + var_18._id_174A );

            if ( isdefined( var_19 ) )
            {
                var_20 = tolower( var_18._id_174A );
                var_3.anchor_types[var_20] = var_21;
            }
        }
    }

    foreach ( var_32, var_23 in var_0._id_CF5A )
    {
        var_24 = _func_038E( "scriptedwidget:" + var_23.scripted_widget );

        if ( isdefined( var_24 ) )
        {
            var_25 = tolower( var_23.scripted_widget );
            var_3._id_10E18[var_25] = spawnstruct();
            var_3._id_10E18[var_25]._id_0219 = var_32 + 1;

            if ( isdefined( var_24._id_1A0D ) )
            {
                var_5 = _func_038E( "scriptedwidgetarchetype:" + var_24._id_1A0D );
                var_7 = tolower( var_24._id_1A0D );

                if ( isdefined( var_5 ) && isdefined( var_3._id_1A15[var_7] ) )
                    var_3._id_10E18[var_25]._id_1A0D = var_7;
            }

            var_3._id_10E18[var_25].parameters = [];

            if ( isdefined( var_24.parameters ) )
            {
                foreach ( var_28, var_27 in var_24.parameters )
                {
                    if ( var_27.name != "" )
                        var_3._id_10E18[var_25].parameters[tolower( var_27.name )] = var_28;
                }
            }

            var_3._id_10E18[var_25]._id_E75B = [];

            if ( isdefined( var_24._id_E75B ) )
            {
                foreach ( var_31, var_30 in var_24._id_E75B )
                {
                    if ( var_30.name != "" )
                        var_3._id_10E18[var_25]._id_E75B[tolower( var_30.name )] = var_31;
                }
            }
        }
    }

    if ( isdefined( var_0.max_scripted_list_items ) && var_0.max_scripted_list_items > 0 )
    {
        var_3.list_widget_data._id_9C0F = var_0.max_scripted_list_items;
        var_3.list_widget_data.num_groups = _func_0037( var_3.list_widget_data._id_9C0F / 15 );
        var_3.list_widget_data.group_mask = 0;
        var_3.list_widget_data.group_shift = 0;

        if ( var_3.list_widget_data.num_groups > 1 )
        {
            var_3.list_widget_data.group_mask = 15;
            var_3.list_widget_data.group_shift = int( 28 );
        }
    }
}

_id_789E( var_0, var_1 )
{
    if ( !isdefined( level._id_7B23 ) )
        level._id_7B23 = spawnstruct();

    if ( !isdefined( level._id_7B23._id_78C6 ) )
        level._id_7B23._id_78C6 = spawnstruct();

    var_2 = level._id_7B23._id_78C6;
    var_2._id_AA2B = var_0;
    var_2._id_10E19 = [];

    if ( isdefined( var_1 ) && _func_021C( var_1 ) )
    {
        var_3 = tablelookupgetnumrows( var_1 );

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = tablelookupbyrow( var_1, var_4, 0 );

            if ( var_5 != "" )
                var_2._id_10E19[tolower( var_5 )] = var_4;
        }
    }
}

_id_789D( var_0, var_1 )
{
    var_2 = level._id_7B23._id_78C6;

    if ( !_func_0106( var_0 ) )
        var_0 = [ var_0 ];

    foreach ( var_4 in var_0 )
    {
        var_4 = tolower( var_4 );
        var_1 = _id_0CD1( var_4, var_1 );
        self _meth_82F7( var_2._id_AA2B, var_2._id_10E19[var_4], var_1 );
    }
}

_id_CF55( var_0, var_1, var_2 )
{
    var_3 = level._id_7B23._id_CF5A;
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );

    if ( _id_CF57( var_0 ) )
        return;

    var_4 = _id_0CB3( var_0, var_1 );

    if ( isdefined( var_4 ) )
    {
        if ( isdefined( var_2 ) )
        {
            if ( isdefined( var_2._id_AE2C ) )
                _widget_set_omnvar( var_2._id_AE2C, "ui_scripted_widget_param_" + var_4, var_3._id_10E18[var_1].parameters );

            if ( isdefined( var_2._id_432F ) )
                _widget_set_omnvar( var_2._id_432F, "ui_scripted_widget_data_" + var_4 );

            if ( isdefined( var_2._id_E744 ) )
                _widget_set_omnvar( var_2._id_E744, "ui_scripted_widget_state_" + var_4, var_3._id_10E18[var_1]._id_E75B );

            if ( isdefined( var_2._id_BD19 ) )
                _widget_set_omnvar( var_2._id_BD19, "ui_scripted_widget_priority_" + var_4 );

            if ( _func_02DB( var_2._id_5449 ) )
                scripted_widget_anchor_to_ent( var_0, var_2._id_5449, var_2.anchor_type );

            if ( isdefined( var_2._id_0318 ) )
                scripted_widget_set_position( var_0, var_2._id_0318._id_0256, var_2._id_0318._id_046E, var_2._id_0318.horizontal_anchor, var_2._id_0318.vertical_anchor );
        }

        self setclientomnvar( "ui_scripted_widget_type_" + var_4, var_3._id_10E18[var_1]._id_0219 );
        thread _id_0CB1( var_0, var_4 );
    }
    else
    {

    }
}

scripted_widget_get_param_property( var_0, var_1, var_2 )
{
    var_3 = _func_038E( "scriptedwidget:" + var_0 );
    var_4 = scripted_widget_get_param_index( var_0, var_1 );

    if ( isdefined( var_4 ) )
    {
        var_2 = tolower( var_2 );

        foreach ( var_6 in var_3.parameters[var_4].properties )
        {
            if ( var_6.property == var_2 )
                return var_6._id_04A3;
        }
    }

    return undefined;
}

scripted_widget_get_param_index( var_0, var_1 )
{
    var_1 = tolower( var_1 );
    return level._id_7B23._id_CF5A._id_10E18[var_0].parameters[var_1];
}

scripted_widget_set_param( var_0, var_1 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_2 = level._id_7B23._id_CF5A;
    var_3 = self._id_0F02[var_0];
    var_4 = "ui_scripted_widget_param_" + var_3._id_0219;
    var_5 = var_2._id_10E18[var_3._id_10E17].parameters;
    _widget_set_omnvar( var_1, var_4, var_5 );
}

_id_CF58( var_0, var_1 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_2 = level._id_7B23._id_CF5A;
    var_3 = self._id_0F02[var_0];
    var_4 = "ui_scripted_widget_data_" + var_3._id_0219;
    _widget_set_omnvar( var_1, var_4 );
}

_id_CF59( var_0, var_1 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_2 = level._id_7B23._id_CF5A;
    var_3 = self._id_0F02[var_0];
    var_4 = "ui_scripted_widget_state_" + var_3._id_0219;
    var_5 = var_2._id_10E18[var_3._id_10E17]._id_E75B;
    _widget_set_omnvar( var_1, var_4, var_5 );
}

scripted_widget_anchor_to_ent( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_2 = tolower( var_2 );
    var_3 = level._id_7B23._id_CF5A;

    if ( !isdefined( self.scripted_widget_anchors ) )
        self.scripted_widget_anchors = [];

    var_4 = var_1 getentitynumber();

    if ( !isdefined( self.scripted_widget_anchors[var_4] ) )
        self.scripted_widget_anchors[var_4] = [];

    var_5 = self._id_0F02[var_0];

    if ( isdefined( var_5.ent_num ) )
    {
        self.scripted_widget_anchors[var_5.ent_num][var_0] = undefined;

        if ( self.scripted_widget_anchors[var_5.ent_num].size == 0 )
        {
            self.scripted_widget_anchors[var_5.ent_num] = undefined;
            self notify( "_automatic_remove_anchored_widget_" + var_5.ent_num );
        }
    }

    var_5.ent_num = var_4;
    self.scripted_widget_anchors[var_4][var_0] = var_5._id_0219;
    var_6 = "ui_scripted_widget_ent_" + var_5._id_0219;
    self setclientomnvar( var_6, var_1 );
    _widget_set_omnvar( var_3.anchor_types[var_2], "ui_scripted_widget_position_" + var_5._id_0219 );
    thread _id_0B36( var_1 );
}

scripted_widget_set_position( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    switch ( var_3 )
    {
        case 0:
            var_1 = var_1 - -63;
            break;
        case 3:
        case 1:
            var_1 = var_1 - -1023;
            break;
        case 2:
            var_1 = var_1 + 1984;
            break;
    }

    switch ( var_4 )
    {
        case 0:
            var_2 = var_2 - -483;
            break;
        case 3:
        case 1:
            var_2 = var_2 - -1023;
            break;
        case 2:
            var_2 = var_2 + 1564;
            break;
    }

    var_5 = var_2 << 11;
    var_6 = var_3 << 22;
    var_7 = var_4 << 24;
    var_8 = var_1 + var_5 + var_6 + var_7;
    var_9 = level._id_7B23._id_CF5A;
    var_10 = self._id_0F02[var_0];
    var_11 = "ui_scripted_widget_position_" + var_10._id_0219;
    self setclientomnvar( var_11, var_8 );
}

scripted_widget_set_priority( var_0, var_1 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_2 = level._id_7B23._id_CF5A;
    var_3 = self._id_0F02[var_0];
    var_4 = "ui_scripted_widget_priority_" + var_3._id_0219;
    self setclientomnvar( var_4, var_1 );
}

scripted_widget_archetype_set_field_values( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_3 = level._id_7B23._id_CF5A;
    var_4 = self._id_0F02[var_0];
    var_5 = "ui_scripted_widget_data_" + var_4._id_0219;
    var_6 = undefined;

    if ( !istrue( var_2 ) )
        var_6 = "ui_scripted_widget_time_" + var_4._id_0219;

    _widget_archetype_set_field_values( var_4._id_10E17, var_5, var_1, var_6 );
}

scripted_widget_archetype_set_progress( var_0, var_1, var_2, var_3 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_4 = level._id_7B23._id_CF5A;
    var_5 = self._id_0F02[var_0];
    var_6 = "ui_scripted_widget_data_" + var_5._id_0219;
    var_7 = "ui_scripted_widget_time_" + var_5._id_0219;
    _widget_archetype_set_progress( var_5._id_10E17, var_6, var_1, var_2, var_3, var_7 );
}

scripted_widget_archetype_set_progress_bool( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_3 = level._id_7B23._id_CF5A;
    var_4 = self._id_0F02[var_0];
    var_5 = "ui_scripted_widget_data_" + var_4._id_0219;
    var_6 = "ui_scripted_widget_time_" + var_4._id_0219;
    _widget_archetype_set_progress_bool( var_4._id_10E17, var_5, var_1, var_2, var_6 );
}

scripted_widget_archetype_set_progress_alpha( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_3 = level._id_7B23._id_CF5A;
    var_4 = self._id_0F02[var_0];
    var_5 = "ui_scripted_widget_data_" + var_4._id_0219;
    var_6 = "ui_scripted_widget_time_" + var_4._id_0219;
    _widget_archetype_set_progress_alpha( var_4._id_10E17, var_5, var_1, var_2, var_6 );
}

scripted_widget_archetype_set_count( var_0, var_1, var_2, var_3 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_4 = level._id_7B23._id_CF5A;
    var_5 = self._id_0F02[var_0];
    var_6 = "ui_scripted_widget_data_" + var_5._id_0219;
    var_7 = "ui_scripted_widget_time_" + var_5._id_0219;
    _widget_archetype_set_progress( var_5._id_10E17, var_6, var_1, var_2, var_3, var_7 );
}

scripted_widget_set_timestamp( var_0, var_1 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_2 = level._id_7B23._id_CF5A;
    var_3 = self._id_0F02[var_0];
    var_4 = "ui_scripted_widget_time_" + var_3._id_0219;
    self setclientomnvar( var_4, var_1 );
}

_id_CF56( var_0 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_1 = _id_0CB2( var_0 );

    if ( isdefined( var_1 ) )
    {
        var_2 = level._id_7B23._id_CF5A;
        var_3 = "ui_scripted_widget_type_" + var_1;
        self setclientomnvar( var_3, 0 );
        self notify( "scripted_widget_destroyed_" + var_0 );
    }
}

_id_CF57( var_0 )
{
    var_0 = tolower( var_0 );
    var_1 = level._id_7B23._id_CF5A;
    return isdefined( self._id_0F02 ) && isdefined( self._id_0F02[var_0] );
}

scripted_widgets_available()
{
    return !isdefined( self._id_1F65 ) || self._id_1F65.size > 0;
}

_id_9510( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    _id_CF55( var_0, var_1 );
    self._id_0F02[var_0]._id_9505 = [];

    if ( isdefined( var_2 ) )
        _id_950F( var_0, var_2 );
}

_id_9511( var_0 )
{
    var_0 = tolower( var_0 );
    _id_CF56( var_0 );
    _id_0C26( var_0 );
}

_id_950E( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[var_1] = var_2;
    _id_950F( var_0, var_4, var_3 );
}

_id_950F( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_3 = [];
    var_4 = [];

    foreach ( var_8, var_6 in var_1 )
    {
        var_6 = tolower( var_6 );
        var_7 = _id_0C27( var_0, tolower( var_8 ), var_6 );

        if ( isdefined( var_7 ) )
        {
            var_3[var_3.size] = var_6;
            var_4[var_4.size] = var_7;
        }
    }

    _list_widget_add_items( var_0, var_3, var_4, var_2 );
}

list_widget_reorder_items( var_0, var_1 )
{
    var_0 = tolower( var_0 );
    self._id_0F02[var_0]._id_9505 = [];

    foreach ( var_5, var_3 in var_1 )
    {
        var_4 = _list_widget_get_item_data( var_0, var_3 );
        self._id_0F02[var_0]._id_9505[var_5] = var_4.omnvar_index;
    }

    _list_widget_update_list( var_0 );
}

list_widget_swap_items( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_3 = _list_widget_get_item_data( var_0, var_1 );
    var_4 = _list_widget_get_item_data( var_0, var_2 );
    var_5 = undefined;
    var_6 = undefined;
    var_7 = var_3.omnvar_index;
    var_8 = var_4.omnvar_index;

    foreach ( var_11, var_10 in self._id_0F02[var_0]._id_9505 )
    {
        if ( var_10 == var_7 )
            var_5 = var_11;

        if ( var_10 == var_8 )
            var_6 = var_11;
    }

    self._id_0F02[var_0]._id_9505[var_5] = var_4.omnvar_index;
    self._id_0F02[var_0]._id_9505[var_6] = var_3.omnvar_index;
    _list_widget_update_list( var_0 );
}

list_widget_shift_items( var_0, var_1 )
{
    var_0 = tolower( var_0 );
    var_2 = self._id_0F02[var_0]._id_9505.size;
    var_3 = var_1;

    if ( var_1 < 0 )
        var_3 = var_3 + var_2;

    var_4 = scripts\engine\utility::_id_1BAC( self._id_0F02[var_0]._id_9505, 0, var_3 );
    var_5 = scripts\engine\utility::_id_1BAC( self._id_0F02[var_0]._id_9505, var_3, var_2 );
    self._id_0F02[var_0]._id_9505 = scripts\engine\utility::array_combine( var_5, var_4 );
    _list_widget_update_list( var_0 );
}

list_widget_reverse_items( var_0 )
{
    var_0 = tolower( var_0 );
    self._id_0F02[var_0]._id_9505 = scripts\engine\utility::_id_1BAA( self._id_0F02[var_0]._id_9505 );
    _list_widget_update_list( var_0 );
}

list_wiget_get_item_refs( var_0 )
{
    var_0 = tolower( var_0 );
    return getarraykeys( self._id_0EF8[var_0] );
}

_id_951C( var_0, var_1, var_2 )
{
    _id_951D( var_0, [ var_1 ], var_2 );
}

_id_951D( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );

    if ( !_id_CF57( var_0 ) )
        return;

    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        var_5 = tolower( var_5 );
        var_6 = _id_0C25( var_0, var_5 );

        if ( isdefined( var_6 ) )
            var_3[var_3.size - 1] = var_6;
    }

    _list_widget_remove_items( var_0, var_3 );

    if ( istrue( var_2 ) && !_id_9513( var_0 ) )
        _id_9511( var_0 );
}

_id_9518( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_3 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_3 ) )
    {
        var_4 = level._id_7B23._id_CF5A;
        var_5 = self._id_0F02[var_0]._id_71D7;
        var_6 = _list_widget_get_omnvar_name( var_5, var_3.omnvar_index, "param_" );
        _widget_set_omnvar( var_2, var_6, var_4._id_10E18[var_3._id_10E17].parameters );
    }
}

list_widget_item_set_state( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_3 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_3 ) )
    {
        var_4 = level._id_7B23._id_CF5A;
        var_5 = self._id_0F02[var_0]._id_71D7;
        var_6 = _list_widget_get_omnvar_name( var_5, var_3.omnvar_index, "state_" );
        _widget_set_omnvar( var_2, var_6, var_4._id_10E18[var_3._id_10E17]._id_E75B );
    }
}

_id_9517( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_3 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_3 ) )
    {
        var_4 = level._id_7B23._id_CF5A;
        var_5 = self._id_0F02[var_0]._id_71D7;
        var_6 = _list_widget_get_omnvar_name( var_5, var_3.omnvar_index, "data_" );
        _widget_set_omnvar( var_2, var_6 );
    }
}

_id_9515( var_0, var_1, var_2, var_3 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_4 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_4 ) )
    {
        var_5 = self._id_0F02[var_0]._id_71D7;
        var_6 = _list_widget_get_omnvar_name( var_5, var_4.omnvar_index, "data_" );
        var_7 = undefined;

        if ( !istrue( var_3 ) )
            var_7 = _list_widget_get_omnvar_name( var_5, var_4.omnvar_index, "time_" );

        _widget_archetype_set_field_values( var_4._id_10E17, var_6, var_2, var_7 );
    }
}

_id_9516( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_5 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_5 ) )
    {
        var_6 = self._id_0F02[var_0]._id_71D7;
        var_7 = _list_widget_get_omnvar_name( var_6, var_5.omnvar_index, "data_" );
        var_8 = _list_widget_get_omnvar_name( var_6, var_5.omnvar_index, "time_" );
        _widget_archetype_set_progress( var_5._id_10E17, var_7, var_2, var_3, var_4, var_8 );
    }
}

_id_9514( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_5 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_5 ) )
    {
        var_6 = self._id_0F02[var_0]._id_71D7;
        var_7 = _list_widget_get_omnvar_name( var_6, var_5.omnvar_index, "data_" );
        var_8 = _list_widget_get_omnvar_name( var_6, var_5.omnvar_index, "time_" );
        _widget_archetype_set_count( var_5._id_10E17, var_7, var_2, var_3, var_4, var_8 );
    }
}

_id_9519( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    var_3 = _list_widget_get_item_data( var_0, var_1 );

    if ( isdefined( var_3 ) )
    {
        var_4 = self._id_0F02[var_0]._id_71D7;
        var_5 = _list_widget_get_omnvar_name( var_4, var_3.omnvar_index, "time_" );
        _widget_set_omnvar( var_2, var_5 );
    }
}

_id_9512( var_0, var_1 )
{
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );
    return isdefined( self._id_0EF8 ) && isdefined( self._id_0EF8[var_0] ) && isdefined( self._id_0EF8[var_0][var_1] );
}

_id_9513( var_0 )
{
    var_0 = tolower( var_0 );
    return isdefined( self._id_0EF8 ) && isdefined( self._id_0EF8[var_0] ) && self._id_0EF8[var_0].size > 0;
}

_id_174C( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();

    if ( !isdefined( var_4 ) )
        var_4 = spawnstruct();

    var_4._id_5449 = var_0;
    var_4.anchor_type = var_3;
    _id_CF55( var_1, var_2, var_4 );
}

_id_1754( var_0, var_1, var_2 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    scripted_widget_set_param( var_1, var_2 );
}

_id_1753( var_0, var_1, var_2 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    _id_CF58( var_1, var_2 );
}

_id_174D( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    scripted_widget_archetype_set_field_values( var_1, var_2, var_3 );
}

_id_174E( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    scripted_widget_archetype_set_progress( var_1, var_2, var_3, var_4 );
}

_id_174F( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    scripted_widget_archetype_set_progress_bool( var_1, var_2, var_3 );
}

anchored_widget_archetype_set_progress_alpha( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    scripted_widget_archetype_set_progress_alpha( var_1, var_2, var_3 );
}

_id_1755( var_0, var_1, var_2 )
{
    var_1 = tolower( var_1 ) + var_0 getentitynumber();
    scripted_widget_set_timestamp( var_1, var_2 );
}

_id_1751( var_0, var_1 )
{
    var_2 = var_0 getentitynumber();
    var_1 = tolower( var_1 ) + var_2;
    _id_0B01( var_1, var_2 );
}

_id_1752( var_0 )
{
    _id_0B02( var_0 getentitynumber() );
}

anchored_widget_is_active( var_0, var_1 )
{
    var_2 = var_0 getentitynumber();
    var_1 = tolower( var_1 ) + var_2;
    return isdefined( self.scripted_widget_anchors ) && isdefined( self.scripted_widget_anchors[var_2] ) && isdefined( self.scripted_widget_anchors[var_2][var_1] );
}

_id_0B01( var_0, var_1 )
{
    if ( isdefined( self.scripted_widget_anchors[var_1] ) )
    {
        if ( isdefined( self.scripted_widget_anchors[var_1][var_0] ) )
            _id_CF56( var_0 );

        self.scripted_widget_anchors[var_1][var_0] = undefined;

        if ( self.scripted_widget_anchors[var_1].size == 0 )
        {
            self.scripted_widget_anchors[var_1] = undefined;
            self notify( "_automatic_remove_anchored_widget_" + var_1 );
        }
    }
}

_id_0B02( var_0 )
{
    if ( isdefined( self.scripted_widget_anchors ) && isdefined( self.scripted_widget_anchors[var_0] ) )
    {
        foreach ( var_3, var_2 in self.scripted_widget_anchors[var_0] )
            _id_CF56( var_3 );

        self.scripted_widget_anchors[var_0] = undefined;
        self notify( "_automatic_remove_anchored_widget_" + var_0 );
    }
}

_id_0B36( var_0 )
{
    if ( isplayer( self ) )
        self endon( "disconnected" );

    var_1 = var_0 getentitynumber();
    self notify( "_automatic_remove_anchored_widget_" + var_1 );
    self endon( "_automatic_remove_anchored_widget_" + var_1 );
    var_0 scripts\engine\utility::_id_1087D( "death", "disconnected", "deleted" );
    thread _id_0B02( var_1 );
}

_id_0DB0( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_7B23._id_CF5A._id_1A15;

    if ( var_0 > var_4[var_1][var_2]._id_9C25 )
        var_0 = var_4[var_1][var_2]._id_9C25;

    var_0 = var_0 / var_4[var_1][var_2]._id_E835;
    var_0 = int( var_0 );
    var_3 = var_3 | var_0 << var_4[var_1][var_2]._id_D9D2;
    return var_3;
}

_widget_archetype_set_field_values( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_7B23._id_CF5A;
    var_5 = level._id_7B23._id_CF5A._id_1A15;
    var_6 = var_4._id_10E18[var_0]._id_1A0D;
    var_7 = 0;

    foreach ( var_10, var_9 in var_2 )
    {
        var_9 = clamp( var_9, 0.0, var_5[var_6][var_10]._id_9C25 );
        var_7 = _id_0DB0( var_9, var_6, var_10, var_7 );
    }

    self setclientomnvar( var_1, var_7 );

    if ( isdefined( var_3 ) )
        self setclientomnvar( var_3, gettime() );
}

_widget_archetype_set_progress( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = level._id_7B23._id_CF5A;
    var_7 = level._id_7B23._id_CF5A._id_1A15;
    var_8 = "scripted_widget_archetype_progress";
    var_2 = clamp( var_2, 0.0, var_7[var_8]["current_pct"]._id_9C25 );
    var_3 = clamp( var_3, 0.0, var_7[var_8]["target_pct"]._id_9C25 );
    var_9 = 0;
    var_9 = _id_0DB0( var_2, var_8, "current_pct", var_9 );
    var_9 = _id_0DB0( var_3, var_8, "target_pct", var_9 );
    var_9 = _id_0DB0( var_4, var_8, "time", var_9 );
    self setclientomnvar( var_1, var_9 );
    self setclientomnvar( var_5, gettime() );
}

_widget_archetype_set_progress_bool( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_7B23._id_CF5A;
    var_6 = level._id_7B23._id_CF5A._id_1A15;
    var_7 = "scripted_widget_archetype_progress_bool";
    var_2 = clamp( var_2, 0.0, var_6[var_7]["current_pct"]._id_9C25 );
    var_8 = 0;
    var_8 = _id_0DB0( var_2, var_7, "current_pct", var_8 );
    var_8 = _id_0DB0( var_3, var_7, "bool", var_8 );
    self setclientomnvar( var_1, var_8 );
    self setclientomnvar( var_4, gettime() );
}

_widget_archetype_set_progress_alpha( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_7B23._id_CF5A;
    var_6 = level._id_7B23._id_CF5A._id_1A15;
    var_7 = "scripted_widget_archetype_progress_alpha";
    var_2 = clamp( var_2, 0.0, var_6[var_7]["current_pct"]._id_9C25 );
    var_3 = clamp( var_3, 0.0, var_6[var_7]["current_alpha"]._id_9C25 );
    var_8 = 0;
    var_8 = _id_0DB0( var_2, var_7, "current_pct", var_8 );
    var_8 = _id_0DB0( var_3, var_7, "current_alpha", var_8 );
    self setclientomnvar( var_1, var_8 );
    self setclientomnvar( var_4, gettime() );
}

_widget_archetype_set_count( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = level._id_7B23._id_CF5A;
    var_7 = level._id_7B23._id_CF5A._id_1A15;
    var_8 = "scripted_widget_archetype_count";
    var_2 = clamp( var_2, 0.0, var_7[var_8]["count"]._id_9C25 );

    if ( isdefined( var_3 ) )
        var_3 = clamp( var_3, 0.0, var_7[var_8]["max_count"]._id_9C25 );
    else
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0.0;

    var_9 = 0;
    var_9 = _id_0DB0( var_2, var_8, "count", var_9 );
    var_9 = _id_0DB0( var_3, var_8, "max_count", var_9 );
    var_9 = _id_0DB0( var_4, var_8, "time", var_9 );
    self setclientomnvar( var_1, var_9 );

    if ( var_4 > 0.0 && isdefined( var_5 ) )
        self setclientomnvar( var_5, gettime() );
}

_widget_set_omnvar( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isint( var_0 ) )
        var_0 = var_0;
    else if ( isdefined( var_2 ) )
        var_0 = var_2[tolower( var_0 )];

    if ( isint( var_0 ) )
    {
        if ( isdefined( var_4 ) )
            var_0 = var_0 << var_4;

        if ( isdefined( var_3 ) )
        {
            var_5 = self _meth_876B( var_1 );
            var_5 = var_5 & ~var_3;
            var_0 = var_0 | var_5;
        }

        self setclientomnvar( var_1, var_0 );
    }
}

_id_0CD1( var_0, var_1 )
{
    if ( !isdefined( self._id_7B1D ) )
        self._id_7B1D = [];

    if ( !isdefined( self._id_7B1D[var_0] ) )
        self._id_7B1D[var_0] = 0;

    if ( !var_1 )
    {
        if ( self._id_7B1D[var_0] > 0 )
            self._id_7B1D[var_0]--;
    }
    else
        self._id_7B1D[var_0]++;

    return self._id_7B1D[var_0] > 0;
}

_id_0CB3( var_0, var_1 )
{
    var_2 = level._id_7B23._id_CF5A;
    var_3 = undefined;

    if ( !isdefined( self._id_1F65 ) )
    {
        self._id_1F65 = [];

        for ( var_4 = 0; var_4 < var_2._id_9C2D; var_4++ )
            self._id_1F65[var_4] = var_4;
    }

    if ( !isdefined( self._id_0F02 ) )
        self._id_0F02 = [];

    if ( self._id_1F65.size > 0 )
    {
        var_3 = self._id_1F65[0];
        self._id_1F65 = scripts\engine\utility::array_remove_index( self._id_1F65, 0 );
        self._id_0F02[var_0] = spawnstruct();
        self._id_0F02[var_0]._id_0219 = var_3;
        self._id_0F02[var_0]._id_10E17 = var_1;
        _scripted_widget_reset_omnvars( var_3 );
    }

    return var_3;
}

_id_0CB2( var_0 )
{
    var_1 = level._id_7B23._id_CF5A;
    var_2 = undefined;

    if ( isdefined( self._id_0F02[var_0] ) )
        var_2 = self._id_0F02[var_0]._id_0219;

    if ( isdefined( var_2 ) )
    {
        self._id_1F65[self._id_1F65.size] = var_2;
        self._id_0F02[var_0] = undefined;
    }

    return var_2;
}

_id_0CB1( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnected" );
    self notify( "_scripted_widget_notify_closed_" + var_0 );
    self endon( "_scripted_widget_notify_closed_" + var_0 );
    self endon( "scripted_widget_destroyed_" + var_0 );
    var_2 = level._id_7B23._id_CF5A;

    for (;;)
    {
        self waittill( "luinotifyserver", var_3, var_4 );

        if ( var_3 == "scripted_widget_closed" && var_1 == var_4 )
        {
            thread _id_CF56( var_0 );
            return;
        }
    }
}

_scripted_widget_reset_omnvars( var_0 )
{
    var_1 = level._id_7B23._id_CF5A;
    var_2 = "ui_scripted_widget_type_" + var_0;
    var_3 = "ui_scripted_widget_param_" + var_0;
    var_4 = "ui_scripted_widget_data_" + var_0;
    var_5 = "ui_scripted_widget_state_" + var_0;
    var_6 = "ui_scripted_widget_time_" + var_0;
    var_7 = "ui_scripted_widget_position_" + var_0;
    var_8 = "ui_scripted_widget_priority_" + var_0;
    var_9 = "ui_scripted_widget_ent_" + var_0;
    self setclientomnvar( var_2, 0 );
    self setclientomnvar( var_3, 0 );
    self setclientomnvar( var_4, 0 );
    self setclientomnvar( var_5, 0 );
    self setclientomnvar( var_6, 0 );
    self setclientomnvar( var_7, 0 );
    self setclientomnvar( var_8, 0 );
    self setclientomnvar( var_9, undefined );
}

_id_0C27( var_0, var_1, var_2 )
{
    var_3 = level._id_7B23._id_CF5A.list_widget_data;
    var_4 = undefined;

    if ( !isdefined( self._id_1F66 ) )
    {
        self._id_1F66 = [];
        var_5 = 15;

        if ( var_3.num_groups > 1 )
            var_5 = var_5 - 1;

        for ( var_6 = 0; var_6 < var_3._id_9C0F; var_6++ )
        {
            var_7 = int( floor( var_6 / var_5 ) );
            var_8 = var_6 % var_5;

            if ( !isdefined( self._id_1F66[var_7] ) )
                self._id_1F66[var_7] = [];

            self._id_1F66[var_7][var_8] = var_8 + 1;
        }
    }

    if ( !isdefined( self._id_0EF8 ) )
        self._id_0EF8 = [];

    if ( !isdefined( self._id_0F02[var_0]._id_71D7 ) )
    {
        var_9 = undefined;
        var_10 = 0;

        for ( var_6 = 0; var_6 < var_3.num_groups; var_6++ )
        {
            var_11 = self._id_1F66[var_6].size;

            if ( var_11 > var_10 )
            {
                var_9 = var_6;
                var_10 = var_11;
            }
        }

        if ( !isdefined( var_9 ) )
            return undefined;

        _list_widget_group_reserve( var_0, var_9 );
    }

    var_7 = self._id_0F02[var_0]._id_71D7;
    var_12 = self._id_1F66[var_7].size - 1;

    if ( var_12 >= 0 )
    {
        var_4 = self._id_1F66[var_7][var_12];
        self._id_1F66[var_7][var_12] = undefined;

        if ( !isdefined( self._id_0EF8[var_0] ) )
            self._id_0EF8[var_0] = [];

        self._id_0EF8[var_0][var_1] = spawnstruct();
        self._id_0EF8[var_0][var_1].omnvar_index = var_4;
        self._id_0EF8[var_0][var_1]._id_10E17 = var_2;
        _id_0C28( var_7, var_4 );
    }

    return var_4;
}

_list_widget_group_reserve( var_0, var_1 )
{
    var_2 = level._id_7B23._id_CF5A.list_widget_data.group_mask;
    var_3 = level._id_7B23._id_CF5A.list_widget_data.group_shift;

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
    {
        var_4 = "ui_scripted_widget_data_" + self._id_0F02[var_0]._id_0219;
        _widget_set_omnvar( var_1, var_4, undefined, var_2, var_3 );
    }

    self._id_0F02[var_0]._id_71D7 = var_1;
}

_id_0C25( var_0, var_1 )
{
    var_2 = level._id_7B23._id_CF5A.list_widget_data;
    var_3 = undefined;

    if ( isdefined( self._id_0EF8[var_0] ) && isdefined( self._id_0EF8[var_0][var_1] ) )
    {
        var_3 = self._id_0EF8[var_0][var_1].omnvar_index;

        if ( isdefined( var_3 ) )
        {
            var_4 = self._id_0F02[var_0]._id_71D7;
            self._id_1F66[var_4][self._id_1F66[var_4].size] = var_3;
            self._id_0EF8[var_0][var_1] = undefined;

            if ( self._id_0EF8[var_0].size == 0 )
                self._id_0EF8[var_0] = undefined;
        }
    }

    return var_3;
}

_id_0C26( var_0 )
{
    var_1 = level._id_7B23._id_CF5A.list_widget_data;

    if ( isdefined( self._id_0EF8[var_0] ) )
    {
        if ( self._id_0EF8[var_0].size > 0 )
        {
            var_2 = self._id_0F02[var_0]._id_71D7;

            foreach ( var_4 in self._id_0EF8[var_0] )
                self._id_1F66[var_2][self._id_1F66[var_2].size] = var_4.omnvar_index;
        }

        self._id_0EF8[var_0] = undefined;
    }
}

_list_widget_add_items( var_0, var_1, var_2, var_3 )
{
    if ( istrue( var_3 ) )
        self._id_0F02[var_0]._id_9505 = scripts\engine\utility::array_combine( var_2, self._id_0F02[var_0]._id_9505 );
    else
        self._id_0F02[var_0]._id_9505 = scripts\engine\utility::array_combine( self._id_0F02[var_0]._id_9505, var_2 );

    var_4 = level._id_7B23._id_CF5A;

    foreach ( var_8, var_6 in var_1 )
    {
        var_7 = _list_widget_get_omnvar_name( self._id_0F02[var_0]._id_71D7, var_2[var_8], "type_" );
        self setclientomnvar( var_7, var_4._id_10E18[var_6]._id_0219 );
    }

    _list_widget_update_list( var_0 );
}

_list_widget_remove_items( var_0, var_1 )
{
    self._id_0F02[var_0]._id_9505 = scripts\engine\utility::_id_1B97( self._id_0F02[var_0]._id_9505, var_1 );
    _list_widget_update_list( var_0 );
}

_list_widget_update_list( var_0 )
{
    var_1 = 8.0;
    var_2 = 0;

    if ( level._id_7B23._id_CF5A.list_widget_data.num_groups > 1 )
    {
        var_1 = var_1 - 1;
        var_2 = self._id_0F02[var_0]._id_71D7 << level._id_7B23._id_CF5A.list_widget_data.group_shift;
    }

    var_3 = self._id_0F02[var_0]._id_9505;

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        if ( isdefined( var_3[var_4] ) )
            var_2 = var_2 | var_3[var_4] << 4 * var_4;
    }

    _id_CF58( var_0, var_2 );
}

_id_0C28( var_0, var_1 )
{
    var_1 = _list_widget_get_omnvar_index( var_0, var_1 );
    var_2 = "ui_scripted_list_item_type_" + var_1;
    var_3 = "ui_scripted_list_item_param_" + var_1;
    var_4 = "ui_scripted_list_item_data_" + var_1;
    var_5 = "ui_scripted_list_item_state_" + var_1;
    var_6 = "ui_scripted_list_item_time_" + var_1;
    self setclientomnvar( var_2, 0 );
    self setclientomnvar( var_3, 0 );
    self setclientomnvar( var_4, 0 );
    self setclientomnvar( var_5, 0 );
    self setclientomnvar( var_6, 0 );
}

_list_widget_get_omnvar_index( var_0, var_1 )
{
    return var_1 + var_0 * 15;
}

_list_widget_get_omnvar_name( var_0, var_1, var_2 )
{
    var_1 = _list_widget_get_omnvar_index( var_0, var_1 );
    return "ui_scripted_list_item_" + var_2 + var_1;
}

_list_widget_get_item_data( var_0, var_1 )
{
    var_2 = level._id_7B23._id_CF5A.list_widget_data;

    if ( isdefined( self._id_0EF8 ) && isdefined( self._id_0EF8[var_0] ) && isdefined( self._id_0EF8[var_0][var_1] ) )
        return self._id_0EF8[var_0][var_1];

    return undefined;
}
