if (!is_location_scouted_manual(argument0, argument1))
{
    if (apclient_location_scouts("[" + string(get_real_id(argument1)) + "]", 0))
    {
        variable_struct_set(global.ap_scouts[argument0], string(argument1), 
        {
            item_id: 0,
            player_id: 0,
            state: 1
        });
    }
}
