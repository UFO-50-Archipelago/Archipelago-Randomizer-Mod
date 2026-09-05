if (newRoom && instance_exists(o07_Player))
{
    ds_grid_destroy(areaGrid);
    scr07_DefineAreas(room);
    var _screenHeight = o07__Game.screenHeight;
    if (rescue)
    {
        currArea = ds_grid_get(o07__Game.areaGrid, floor(rescueX / o07__Game.screenWidth), floor(rescueY / _screenHeight));
    }
    if (room != rm07_GravGuns)
    {
        _screenHeight = o07__Game.screenHeightEx;
    }
    var _tported = false;
    with (o07_Player)
    {
        trace("PLAYER POS (NEW ROOM):", x, y);
        if (o07__Game.rescue)
        {
            with (o07_SaveShell)
            {
                if (ds_grid_get(o07__Game.areaGrid, floor(x / o07__Game.screenWidth), floor(y / _screenHeight)) == o07__Game.currArea)
                {
                    other.x = x + 32;
                    other.y = y + 32;
                    _tported = true;
                    other.flip = false;
                    savePosFlip = false;
                    trace("TELEPORT IN ON GENEPOD", o07__Game.currArea, other.x, other.y);
                }
            }
            o07__Game.rescue = false;
        }
        if (!_tported)
        {
            with (o07_TeleporterUp)
            {
                if (ds_grid_get(o07__Game.areaGrid, floor(x / o07__Game.screenWidth), floor(y / _screenHeight)) == o07__Game.currArea)
                {
                    other.x = x + 16;
                    other.y = y + 31;
                    _tported = true;
                    other.flip = true;
                    savePosFlip = true;
                    trace("TELEPORT IN ON CEILING", o07__Game.currArea, other.x, other.y);
                }
            }
        }
        if (!_tported)
        {
            with (o07_Teleporter)
            {
                if (ds_grid_get(o07__Game.areaGrid, floor(x / o07__Game.screenWidth), floor(y / _screenHeight)) == o07__Game.currArea)
                {
                    other.x = x + 16;
                    other.y = y - 15;
                    _tported = true;
                    other.flip = false;
                    savePosFlip = false;
                    trace("TELEPORT IN ON FLOOR", o07__Game.currArea, other.x, other.y);
                }
            }
        }
    }
    areaX = ds_grid_value_x(areaGrid, 0, 0, ds_grid_width(areaGrid) - 1, ds_grid_height(areaGrid) - 1, currArea);
    areaY = ds_grid_value_y(areaGrid, 0, 0, ds_grid_width(areaGrid) - 1, ds_grid_height(areaGrid) - 1, currArea);
    var _w = 0;
    repeat (10 - areaX)
    {
        if (ds_grid_get(areaGrid, areaX + _w, areaY) == currArea)
        {
            _w++;
        }
        else
        {
            break;
        }
    }
    areaWidth = _w;
    var _h = 0;
    repeat (10 - areaY)
    {
        if (ds_grid_get(areaGrid, areaX, areaY + _h) == currArea)
        {
            _h++;
        }
        else
        {
            break;
        }
    }
    areaHeight = _h;
    trace("AREA POS:", areaX, areaY, "AREA SIZE:", areaWidth, areaHeight);
    areaWidth *= screenWidth;
    areaHeight *= _screenHeight;
    areaX *= screenWidth;
    areaY *= _screenHeight;
    introPlaying = 2;
    introCount = 0;
    with (o07_Player)
    {
        if (!place_meeting(x, y, o07_DoorIn))
        {
            image_index = 0;
            sprite_index = s07_pTeleEnter;
        }
        if (o07__Game.modSlot[UnknownEnum.Value_1] == 2)
        {
            instance_create(x, y - 48, o07_pDrone);
        }
    }
    mapRoom = room;
    currRoom = room;
    newRoom = false;
}

enum UnknownEnum
{
    Value_1 = 1
}
