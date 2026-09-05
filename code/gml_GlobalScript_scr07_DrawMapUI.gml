function scr07_DrawMapUI()
{
    var _interest = ds_map_find_value(areaInterestMap, mapRoom);
    var _doors = ds_map_find_value(doorGridMap, mapRoom);
    var _xview = __view_get(UnknownEnum.Value_0, 0);
    var _yview = __view_get(UnknownEnum.Value_1, 0);
    draw_sprite(s07__GravGunsMenu, menuFrame, _xview, _yview);
    if (menuFrame < 4)
    {
        menuFrame = min(menuFrame + 0.8, 4);
        exit;
    }
    scrSetFont(global.fontTall);
    draw_text((_xview + 144) - 104, _yview + 16, scrString("ui_level") + string(clearanceLevel));
    draw_text(_xview + 144, _yview + 16, string(shields));
    draw_text(_xview + 144, _yview + 16 + 128, string(modLimit - 2));
    for (var i = 0; i < 4; i++)
    {
        if (codes[i] > 0)
        {
            draw_sprite(s07_Codes, i * 2, _xview + 31 + (32 * i), (_yview + 192) - 3);
        }
    }
    draw_set_halign(1);
    var _locationName = "";
    var _zoneColor = global.palette[13];
    var teleportUpList = array_create(10);
    var teleportDownList = array_create(10);
    switch (mapRoom)
    {
        case rm07_GravGuns:
            _locationName = scrString("ui_location_zone1");
            break;
        case rm07_GravGuns2:
            _locationName = scrString("ui_location_zone2");
            _zoneColor = global.palette[11];
            break;
        case rm07_GravGuns3:
            _locationName = scrString("ui_location_zone3");
            _zoneColor = global.palette[10];
            break;
        case rm07_GravGuns4:
            _locationName = scrString("ui_location_zone4");
            _zoneColor = global.palette[9];
            break;
    }
    draw_text(_xview + 264, _yview + 16, _locationName);
    draw_set_halign(0);
    scrSetFont(global.fontTerminal);
    str = scrStringManual("ap_07_stuck_1", 0);
    draw_text_ext(_xview + 172, _yview + 140, str, 10, 192);
    str = scrStringManual("ap_07_stuck_2", 0);
    draw_text_ext(_xview + 172, _yview + 158, str, 10, 188);
    scrSetFont(global.fontNoShadow);
    var _height = o07__Game.screenHeightEx;
    if (room == rm07_GravGuns)
    {
        _height = o07__Game.screenHeight;
    }
    var _scol = (floor(current_time div 120) % 3) == 0;
    var _dfls = (floor(current_time div 120) % 4) < 2;
    if (rescueTimer > 12)
    {
        rescueWidth = 158;
        rescueWidth = ceil((rescueTimer / RESCUE_TIME) * rescueWidth) + 1;
        if (_scol)
        {
            draw_set_color(16777215);
        }
        else
        {
            draw_set_color(global.palette[4]);
        }
        draw_rectangle(_xview + 185, _yview + 193, _xview + 183 + rescueWidth, _yview + 193 + 6, false);
        draw_set_color(global.palette[21]);
        draw_rectangle(_xview + 185, _yview + 193, _xview + 342, _yview + 193 + 6, true);
        draw_set_color(16777215);
    }
    if (room == rm07_GravGuns4)
    {
        _xview += 16;
        _yview += 24;
    }
    for (var _xx = 0; _xx < ds_grid_width(areaGrid); _xx++)
    {
        for (var _yy = 0; _yy < ds_grid_height(areaGrid); _yy++)
        {
            var _area = ds_grid_get(areaGrid, _xx, _yy);
            if (is_undefined(_area) || _area == -1 || _area > 200)
            {
                continue;
            }
            if (areaVisited[_area])
            {
                if (ds_grid_get(areaGrid, _xx, _yy) == currArea && mapRoom == room)
                {
                    if (_scol)
                    {
                        draw_set_color(16777215);
                    }
                    else
                    {
                        draw_set_color(global.palette[4]);
                    }
                }
                else
                {
                    draw_set_color(_zoneColor);
                }
                var _w = 1;
                var _h = 1;
                if (_yy < (ds_grid_height(areaGrid) - 1) && ds_grid_get(areaGrid, _xx, _yy + 1) == ds_grid_get(areaGrid, _xx, _yy))
                {
                    _h++;
                }
                if (_xx < (ds_grid_width(areaGrid) - 1) && ds_grid_get(areaGrid, _xx + 1, _yy) == ds_grid_get(areaGrid, _xx, _yy))
                {
                    _w++;
                }
                draw_rectangle((_xx * 16) + _xview + 185, (_yy * 8) + _yview + 44, (_xx * 16) + _xview + 182 + (16 * _w), (_yy * 8) + _yview + 42 + (8 * _h), 0);
                if (ds_grid_get(_interest, _xx, _yy) == 1)
                {
                    if (ds_grid_get(areaGrid, _xx, _yy) == currArea && mapRoom == room)
                    {
                        draw_set_color(global.palette[14]);
                        draw_text((_xx * 16) + _xview + 188, (_yy * 8) + _yview + 44, scrString("ui_save_pod"));
                    }
                    else
                    {
                        draw_set_color(global.palette[14]);
                        draw_roundrect((_xx * 16) + _xview + 187, (_yy * 8) + _yview + 43, (_xx * 16) + _xview + 188 + 7, (_yy * 8) + _yview + 44 + 6, false);
                        draw_set_color(global.palette[22]);
                        draw_text((_xx * 16) + _xview + 188, (_yy * 8) + _yview + 44, scrString("ui_save_pod"));
                    }
                }
                if (ds_grid_get(_interest, _xx, _yy) == 2)
                {
                    draw_set_color(global.palette[21]);
                    draw_text((_xx * 16) + _xview + 188, (_yy * 8) + _yview + 43, ".");
                }
                if (ds_grid_get(_interest, _xx, _yy) == 3)
                {
                    draw_set_color(global.palette[0]);
                    draw_text((_xx * 16) + _xview + 188, (_yy * 8) + _yview + 44, scrString("ui_teleporter"));
                    if (_yy < 5)
                    {
                        teleportUpList[_xx] = true;
                    }
                    else
                    {
                        teleportDownList[_xx] = true;
                    }
                }
                if (ds_grid_get(_interest, _xx, _yy) == 4)
                {
                    draw_set_color(global.palette[21]);
                    draw_text((_xx * 16) + _xview + 188, (_yy * 8) + _yview + 44, scrString("ui_exit"));
                }
                if ((ds_grid_get(_doors, _xx, _yy) % 10) > 0)
                {
                    var _doorCol = global.palette[2];
                    var _locked = 0;
                    if (floor(ds_grid_get(_doors, _xx, _yy) % 10) == 2)
                    {
                        _doorCol = global.palette[11];
                        if (o07__Game.clearanceLevel < 1)
                        {
                            _locked = 1;
                        }
                        else
                        {
                            _locked = 2;
                        }
                    }
                    else if (floor(ds_grid_get(_doors, _xx, _yy) % 10) == 3)
                    {
                        _doorCol = global.palette[13];
                        if (o07__Game.clearanceLevel < 2)
                        {
                            _locked = 1;
                        }
                        else
                        {
                            _locked = 2;
                        }
                    }
                    else if (floor(ds_grid_get(_doors, _xx, _yy) % 10) == 4)
                    {
                        _doorCol = global.palette[14];
                        if (o07__Game.clearanceLevel < 3)
                        {
                            _locked = 1;
                        }
                        else
                        {
                            _locked = 2;
                        }
                    }
                    draw_sprite_ext(s07_UIMapDoor, 0, (_xx * 16) + _xview + 184, (_yy * 8) + _yview + 47, 1, 1, 0, _doorCol, 1);
                    if (_locked == 1)
                    {
                        draw_sprite_ext(s07_UIMapDoor, 1, (_xx * 16) + _xview + 184, (_yy * 8) + _yview + 47, 1, 1, 0, 16777215, 1);
                    }
                    if (_locked == 2 && _dfls)
                    {
                        draw_sprite_ext(s07_UIMapDoor, 1, (_xx * 16) + _xview + 184, (_yy * 8) + _yview + 47, 1, 1, 0, 16777215, 1);
                    }
                }
                if ((floor(ds_grid_get(_doors, _xx, _yy) / 10) % 10) > 0)
                {
                    var _doorCol = global.palette[2];
                    var _locked = 0;
                    if (floor(ds_grid_get(_doors, _xx, _yy) / 10) == 2)
                    {
                        _doorCol = global.palette[11];
                        if (o07__Game.clearanceLevel < 1)
                        {
                            _locked = 1;
                        }
                        else
                        {
                            _locked = 2;
                        }
                    }
                    else if (floor(ds_grid_get(_doors, _xx, _yy) / 10) == 3)
                    {
                        _doorCol = global.palette[13];
                        if (o07__Game.clearanceLevel < 2)
                        {
                            _locked = 1;
                        }
                        else
                        {
                            _locked = 2;
                        }
                    }
                    else if (floor(ds_grid_get(_doors, _xx, _yy) / 10) == 4)
                    {
                        _doorCol = global.palette[14];
                        if (o07__Game.clearanceLevel < 3)
                        {
                            _locked = 1;
                        }
                        else
                        {
                            _locked = 2;
                        }
                    }
                    draw_sprite_ext(s07_UIMapDoor, 0, (_xx * 16) + _xview + 200, (_yy * 8) + _yview + 47, 1, 1, 0, _doorCol, 1);
                    if (_locked == 1)
                    {
                        draw_sprite_ext(s07_UIMapDoor, 1, (_xx * 16) + _xview + 200, (_yy * 8) + _yview + 47, 1, 1, 0, 16777215, 1);
                    }
                    else if (_locked == 2 && _dfls)
                    {
                        draw_sprite_ext(s07_UIMapDoor, 1, (_xx * 16) + _xview + 200, (_yy * 8) + _yview + 47, 1, 1, 0, 16777215, 1);
                    }
                }
                if ((floor(ds_grid_get(_doors, _xx, _yy) / 100) % 10) > 0)
                {
                    var _doorCol = global.palette[2];
                    draw_sprite_ext(s07_UIMapDoor, 0, (_xx * 16) + _xview + 192, (_yy * 8) + _yview + 43, 1, 0.3, 0, _doorCol, 1);
                }
                if ((floor(ds_grid_get(_doors, _xx, _yy) / 1000) % 10) > 0)
                {
                    var _doorCol = global.palette[2];
                    draw_sprite_ext(s07_UIMapDoor, 0, (_xx * 16) + _xview + 192, (_yy * 8) + _yview + 51, 1, 0.3, 0, _doorCol, 1);
                }
            }
            else if (ds_grid_get(_interest, _xx, _yy) != 0)
            {
                draw_set_color(global.palette[3]);
                draw_text((_xx * 16) + _xview + 188, (_yy * 8) + _yview + 44, "?");
            }
        }
    }
    if (mapRoom == rm07_GravGuns || mapRoom == rm07_GravGuns2)
    {
        draw_sprite_ext(sArrowMore, 0, _xview + 184, _yview + 44, 1, -1, 0, 16777215, 1);
    }
    if (mapRoom == rm07_GravGuns || mapRoom == rm07_GravGuns3)
    {
        draw_sprite(sArrowMore, 0, _xview + 184, _yview + 123);
    }
    draw_set_color(16777215);
    scrSetFont(global.fontTerminal);
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
