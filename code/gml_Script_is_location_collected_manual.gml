if (!variable_struct_exists(global.ap_locations_found[argument0], string(argument1)))
{
    return false;
}
return variable_struct_get(global.ap_locations_found[argument0], string(argument1)) > 0;
