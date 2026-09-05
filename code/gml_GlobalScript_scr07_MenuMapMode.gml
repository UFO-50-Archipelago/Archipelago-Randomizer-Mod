function scr07_MenuMapMode()
{
    scrGetInput(0);
    if (holdDown)
    {
        rescueTimer = min(RESCUE_TIME, rescueTimer + 1);
    }
    else
    {
        rescueTimer = max(0, rescueTimer - 1);
    }
    if (pressLeft || pressRight || fire2pressed)
    {
        with (o07__Game)
        {
            scrSfx(soundSaveStationNavPage, 50);
        }
        state = UnknownEnum.Value_2;
        rescueTimer = 0;
    }
    var updateMap = false;
    if (pressUp)
    {
        switch (o07__Game.mapRoom)
        {
            case rm07_GravGuns:
                o07__Game.mapRoom = rm07_GravGuns3;
                updateMap = true;
                break;
            case rm07_GravGuns2:
                o07__Game.mapRoom = rm07_GravGuns;
                updateMap = true;
                break;
        }
    }
    else if (pressDown)
    {
        switch (o07__Game.mapRoom)
        {
            case rm07_GravGuns:
                o07__Game.mapRoom = rm07_GravGuns2;
                updateMap = true;
                break;
            case rm07_GravGuns3:
                o07__Game.mapRoom = rm07_GravGuns;
                updateMap = true;
                break;
        }
    }
    if (updateMap)
    {
        with (o07__Game)
        {
            scrSfx(soundSaveStationNavMap, 50);
        }
        ds_grid_destroy(o07__Game.areaGrid);
        scr07_DefineAreas(o07__Game.mapRoom);
    }
    if (rescueTimer >= RESCUE_TIME)
    {
        vainger_rescue();
    }
    if (fire1pressed || rescue)
    {
        muteBGM();
        with (o07__Game)
        {
            scrSfx(soundSaveStationExit, 80);
        }
        o07__Game.mapRoom = room;
        ds_grid_destroy(o07__Game.areaGrid);
        scr07_DefineAreas(o07__Game.mapRoom);
        menuState = state;
        state = UnknownEnum.Value_0;
        sel = 0;
        var shell = instance_nearest(o07_Player.x, o07_Player.y, o07_SaveShell);
        if (verify(shell))
        {
            shell.sprite_index = s07_SaveShellOpen;
        }
        with (o07__Game)
        {
            saveAtStation = true;
            scrSaveGame(0);
        }
        rescueTimer = 0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2
}
