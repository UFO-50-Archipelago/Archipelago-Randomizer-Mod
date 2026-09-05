if (!is_location_collected_manual(argument0, argument1))
{
    variable_struct_set(global.ap_locations_found[argument0], string(argument1), 1);
    apclient_location_checks("[" + string(get_real_id(argument1)) + "]");
}
