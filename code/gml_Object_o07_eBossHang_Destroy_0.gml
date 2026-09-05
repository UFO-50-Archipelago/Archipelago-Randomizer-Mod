if (!is_location_collected(107))
{
    var obj = instance_create(x - 8, y - 8, o07__iCode);
    obj.type = 2;
    obj.activated = true;
}
instance_deactivate_object(o07_eRailbot);
instance_destroy(o07_eFly);
instance_destroy(o07_eHoming);
