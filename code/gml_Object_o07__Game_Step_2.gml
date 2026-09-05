if (state == UnknownEnum.Value_4)
{
    scr07_DoMap(false);
    exit;
}
scr07_CameraHandler();
if (introPlaying == 1)
{
    depth = 10000;
    scrGetInput(0);
    with (o07_Terminal)
    {
        visible = false;
    }
    if (!instance_exists(oTextBox))
    {
        introCount += 1;
    }
    if (introCount == 1)
    {
        scrBGM(bgm07_intro);
    }
    if (introCount == 150)
    {
        introCount += 1;
        with (scrDrawTextBoxExSplit(0, 64, 384, 64, -100000, scrString("intro_1"), 42, 3))
        {
            autoClose = true;
            drawBorder = false;
        }
    }
    if (introCount == 350)
    {
        introCount += 1;
        with (scrDrawTextBoxExSplit(0, 64, 384, 64, -100000, scrString("intro_2"), 42, 3))
        {
            autoClose = true;
            drawBorder = false;
        }
    }
    if (introCount == 550)
    {
        introCount += 1;
        with (scrDrawTextBoxExSplit(0, 64, 384, 64, -100000, scrString("intro_3"), 42, 3))
        {
            autoClose = true;
            drawBorder = false;
        }
    }
    if (introCount == 750)
    {
        introCount += 1;
        with (scrDrawTextBoxExSplit(0, 64, 384, 64, -100000, scrString("intro_4"), 42, 3))
        {
            autoClose = true;
            drawBorder = false;
        }
    }
    if (introCount == 811)
    {
        scrSfx(soundIntroSpark, 80);
    }
    if (introCount > 1000)
    {
        muteBGM();
        introCount = 0;
        introPlaying = 2;
        scrResetSpeedRun();
        vainger_rescue();
    }
    else if (fire2)
    {
        introSkip++;
        if (introSkip >= 60)
        {
            with (oTextBox)
            {
                instance_destroy();
            }
            muteBGM();
            introSkip = 0;
            introCount = 0;
            introPlaying = 2;
            scrResetSpeedRun();
            vainger_rescue();
        }
    }
    else
    {
        introSkip = 0;
    }
}
else if (introPlaying == 2)
{
    introCount += 1;
    if (introCount > 120)
    {
        var _zoneStart = true;
        with (o07_Player)
        {
            if (place_meeting(x, y, o07_DoorIn))
            {
                _zoneStart = false;
            }
        }
        if (_zoneStart)
        {
            scrSfx(soundPlayerSpawn, 80);
            with (o07_Terminal)
            {
                visible = true;
            }
            introCount = 0;
            introPlaying = 0;
            saveAtStation = false;
            with (o07_Player)
            {
                o07__Game.savePosX = x;
                o07__Game.savePosY = (round(y / 8) * 8) + lerp(1, -1, flip);
                o07__Game.savePosFlip = flip;
                respawnPosX = x;
                respawnPosY = y;
                respawnPosFlip = flip;
            }
            scrSaveGame(0);
        }
        else
        {
            introCount = 0;
            introPlaying = 0;
            depth = 1000000;
        }
    }
}
var _interest = ds_map_find_value(areaInterestMap, mapRoom);
var _doors = ds_map_find_value(doorGridMap, mapRoom);
var _rh = screenHeightEx;
if (mapRoom == rm07_GravGuns)
{
    _rh = screenHeight;
}
if (mapRoom == room && state == UnknownEnum.Value_0)
{
    instance_activate_object(o07_Terminal);
    instance_activate_object(o07_Teleporter);
    instance_activate_object(o07_TeleporterUp);
    instance_activate_object(o07_DoorIn);
    instance_activate_object(o07_SaveShell);
    with (o07_Terminal)
    {
        if (ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div _rh) == o07__Game.currArea)
        {
            ds_grid_set(_interest, x div o07__Game.screenWidth, y div _rh, 2);
        }
    }
    with (o07_Teleporter)
    {
        if (ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div _rh) == o07__Game.currArea)
        {
            ds_grid_set(_interest, x div o07__Game.screenWidth, y div _rh, 3);
        }
    }
    with (o07_TeleporterUp)
    {
        if (ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div _rh) == o07__Game.currArea)
        {
            ds_grid_set(_interest, x div o07__Game.screenWidth, y div _rh, 3);
        }
    }
    with (o07_DoorIn)
    {
        if (ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div _rh) == o07__Game.currArea)
        {
            ds_grid_set(_interest, x div o07__Game.screenWidth, y div _rh, 4);
        }
    }
    with (o07_SaveShell)
    {
        if (ds_grid_get(o07__Game.areaGrid, x div o07__Game.screenWidth, y div _rh) == o07__Game.currArea)
        {
            ds_grid_set(_interest, x div o07__Game.screenWidth, y div _rh, 1);
        }
    }
    if (checkDoors)
    {
        var _checkx = floor(o07__Game.areaX / o07__Game.screenWidth);
        var _checky = floor(o07__Game.areaY / _rh);
        for (var _xx = 0; _xx < floor(o07__Game.areaWidth / o07__Game.screenWidth); _xx++)
        {
            for (var _yy = 0; _yy < floor(max(o07__Game.areaHeight, _rh) / _rh); _yy++)
            {
                var _horzDoorless = true;
                var _vertDoorless = true;
                ds_grid_set(_doors, _checkx + _xx, _checky + _yy, 0);
                with (o07_zDoor)
                {
                    if (((x div o07__Game.screenWidth) == (_checkx + _xx) || ((x + 32) div o07__Game.screenWidth) == (_checkx + _xx)) && (y div _rh) == (_checky + _yy))
                    {
                        ds_grid_set(_doors, _checkx + _xx, _checky + _yy, ds_grid_get(_doors, _checkx + _xx, _checky + _yy) + (((x < (o07__Game.areaX + (o07__Game.areaWidth * 0.5))) * (lockLevel + 1)) + ((x > (o07__Game.areaX + (o07__Game.areaWidth * 0.5))) * (lockLevel + 1) * 10)));
                        _horzDoorless = false;
                    }
                }
                if (_horzDoorless)
                {
                    with (o07__ExitArea)
                    {
                        if (!place_meeting(x, y, o07_WallExplode) && ((x div o07__Game.screenWidth) == (_checkx + _xx) || ((x + 32) div o07__Game.screenWidth) == (_checkx + _xx)) && (y div _rh) == (_checky + _yy))
                        {
                            ds_grid_set(_doors, _checkx + _xx, _checky + _yy, ds_grid_get(_doors, _checkx + _xx, _checky + _yy) + ((x < (o07__Game.areaX + (o07__Game.areaWidth * 0.5))) + ((x > (o07__Game.areaX + (o07__Game.areaWidth * 0.5))) * 10)));
                        }
                    }
                }
                with (o07_zDoorVert)
                {
                    if (((y div _rh) == (_checky + _yy) || ((y + 32) div _rh) == (_checky + _yy)) && (x div o07__Game.screenWidth) == (_checkx + _xx))
                    {
                        ds_grid_set(_doors, _checkx + _xx, _checky + _yy, ds_grid_get(_doors, _checkx + _xx, _checky + _yy) + (((y < (o07__Game.areaY + (o07__Game.areaHeight * 0.5))) * 100) + ((y > (o07__Game.areaY + (o07__Game.areaHeight * 0.5))) * 1000)));
                        _vertDoorless = false;
                    }
                }
                if (_vertDoorless)
                {
                    with (o07__ExitAreaVertical)
                    {
                        if (((y div _rh) == (_checky + _yy) || ((y + 32) div _rh) == (_checky + _yy)) && (x div o07__Game.screenWidth) == (_checkx + _xx))
                        {
                            ds_grid_set(_doors, _checkx + _xx, _checky + _yy, ds_grid_get(_doors, _checkx + _xx, _checky + _yy) + (((y < (o07__Game.areaY + (o07__Game.areaHeight * 0.5))) * 100) + ((y > (o07__Game.areaY + (o07__Game.areaHeight * 0.5))) * 1000)));
                            _vertDoorless = false;
                        }
                    }
                }
            }
        }
        trace("CHECKING DOORS", "(" + string(_checkx), string(_checky) + ")", "(" + string(floor(o07__Game.areaWidth / o07__Game.screenWidth)), string(floor(max(o07__Game.areaHeight, _rh) / _rh)) + ")", ds_grid_get(_doors, _checkx, _checky));
        with (o07_ShootButton)
        {
            on = false;
            if (object_index != o07_ShootButton_Permanent)
            {
                image_index = 0;
            }
        }
        checkDoors = false;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_4 = 4
}
