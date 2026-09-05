if (!is_location_scouted_manual(argument0, argument1))
{
    show_message("Trying to read data for location without scouting first!");
}
return variable_struct_get(global.ap_scouts[argument0], string(argument1)).item_id;
