if (!is_location_collected(6))
{
    muteBGM();
    var obj = instance_create(x - 8, y - 8, o07__iCode);
    obj.type = 1;
    obj.activated = true;
}
var _currArea = -1;
if (room == rm07_GravGuns)
{
    _currArea = ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div o07__Game.screenHeight);
}
else
{
    _currArea = ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div o07__Game.screenHeightEx);
}
if (o07__Game.currArea == _currArea)
{
    with (o07_eElec)
    {
        if (x > o07__Game.areaX && y > o07__Game.areaY && x < (o07__Game.areaX + o07__Game.areaWidth) && y < (o07__Game.areaY + o07__Game.areaHeight))
        {
            instance_destroy();
        }
    }
}
