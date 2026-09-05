if (!variable_struct_exists(global.ap_scouts[argument0], string(argument1)))
{
    return false;
}
return variable_struct_get(global.ap_scouts[argument0], string(argument1)).state > 1;
