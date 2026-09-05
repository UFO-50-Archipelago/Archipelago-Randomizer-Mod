if (!variable_struct_exists(global.ap_items_received[argument0], string(argument1)))
{
    return 0;
}
return variable_struct_get(global.ap_items_received[argument0], string(argument1));
