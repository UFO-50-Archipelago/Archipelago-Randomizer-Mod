if (!is_location_collected(204))
{
    var obj = instance_create(x - 8, y - 8, o07__iCode);
    obj.type = 0;
    obj.activated = true;
    instance_deactivate_object(o07_eSpikesRed);
    instance_deactivate_object(o07_eDropper);
    with (o07_eFly)
    {
        instance_destroy();
    }
}
