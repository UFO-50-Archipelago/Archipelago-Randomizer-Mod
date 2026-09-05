if (!is_location_hinted_manual(argument0, argument1))
{
    if (!is_location_scouted_manual(argument0, argument1))
    {
        variable_struct_set(global.ap_scouts[argument0], string(argument1), 
        {
            item_id: 0,
            player_id: 0,
            state: 0
        });
    }
    if (apclient_location_scouts("[" + string(get_real_id(argument1)) + "]", 2))
    {
        _item_id = variable_struct_get(global.ap_scouts[argument0], string(argument1)).item_id;
        _player_id = variable_struct_get(global.ap_scouts[argument0], string(argument1)).player_id;
        _state = variable_struct_get(global.ap_scouts[argument0], string(argument1)).state | 2;
        variable_struct_set(global.ap_scouts[argument0], string(argument1), 
        {
            item_id: _item_id,
            player_id: _player_id,
            state: _state
        });
    }
}
