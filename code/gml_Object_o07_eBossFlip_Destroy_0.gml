if (!is_location_collected(211))
{
    muteBGM();
    var obj = instance_create(x - 8, y - 8, o07__iCode);
    obj.type = 3;
    obj.activated = true;
}
