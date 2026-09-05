function scr07_DrawModUI()
{
    draw_sprite(s07__GravGunsMenu, menuFrame, __view_get(UnknownEnum.Value_0, 0), __view_get(UnknownEnum.Value_1, 0));
    if (menuFrame > 0)
    {
        menuFrame = max(menuFrame - 0.8, 0);
        exit;
    }
    scrSetFont(global.fontTall);
    draw_text(__view_get(UnknownEnum.Value_0, 0) + 96, __view_get(UnknownEnum.Value_1, 0) + 13, scrString("slot_grav"));
    draw_text(__view_get(UnknownEnum.Value_0, 0) + 96, __view_get(UnknownEnum.Value_1, 0) + 77, scrString("slot_body"));
    draw_text(__view_get(UnknownEnum.Value_0, 0) + 96, __view_get(UnknownEnum.Value_1, 0) + 141, scrString("slot_gun"));
    draw_text((__view_get(UnknownEnum.Value_0, 0) + 351) - 104, __view_get(UnknownEnum.Value_1, 0) + 16, scrString("ui_level") + string(clearanceLevel));
    draw_text(__view_get(UnknownEnum.Value_0, 0) + 351, __view_get(UnknownEnum.Value_1, 0) + 16, string(shields));
    draw_text(__view_get(UnknownEnum.Value_0, 0) + 351, __view_get(UnknownEnum.Value_1, 0) + 16 + 128, string(modLimit - 2));
    for (var i = 0; i < 4; i++)
    {
        if (codes[i] > 0)
        {
            draw_sprite(s07_Codes, i * 2, __view_get(UnknownEnum.Value_0, 0) + 240 + 1 + (32 * i), (__view_get(UnknownEnum.Value_1, 0) + 192) - 3);
        }
    }
    if (modSlot[0] == 0 && modSlot[1] == 0 && modSlot[2] == 0 && modSlot[3] == 0)
    {
    }
    else
    {
        scrSetFont(global.fontTerminal);
        var _overcharged;
        _overcharged[4] = 0;
        for (var i = 0; i < 4; i++)
        {
            if (modSlot[i] == 1)
            {
                _overcharged[0]++;
            }
            if (modSlot[i] == 2)
            {
                _overcharged[1]++;
            }
            if (modSlot[i] == 3)
            {
                _overcharged[2]++;
            }
        }
        for (var i = 0; i < 4; i++)
        {
            if (_overcharged[i] >= modLimit)
            {
                draw_set_color(global.palette[24]);
                draw_rectangle(__view_get(UnknownEnum.Value_0, 0) + 128 + 15, (__view_get(UnknownEnum.Value_1, 0) + 28 + (64 * i)) - 9, __view_get(UnknownEnum.Value_0, 0) + 128 + 95, (__view_get(UnknownEnum.Value_1, 0) + 28 + (64 * i)) - 8, 0);
                draw_set_color(global.palette[9]);
                draw_rectangle(__view_get(UnknownEnum.Value_0, 0) + 97, __view_get(UnknownEnum.Value_1, 0) + 29 + (64 * i), __view_get(UnknownEnum.Value_0, 0) + 96 + 127, __view_get(UnknownEnum.Value_1, 0) + 28 + (64 * i) + 47, 0);
                if ((floor(current_time * 0.01) % 2) == 0)
                {
                    scrSetFont(global.fontTerminal);
                    draw_text(__view_get(UnknownEnum.Value_0, 0) + 128 + 28, (__view_get(UnknownEnum.Value_1, 0) + 28 + (64 * i)) - 12, scrString("mods_danger"));
                }
                scrSetFont(global.fontTall);
                if (i == UnknownEnum.Value_0)
                {
                    draw_text(__view_get(UnknownEnum.Value_0, 0) + 96, __view_get(UnknownEnum.Value_1, 0) + 13, scrString("slot_grav"));
                }
                if (i == UnknownEnum.Value_1)
                {
                    draw_text(__view_get(UnknownEnum.Value_0, 0) + 96, __view_get(UnknownEnum.Value_1, 0) + 77, scrString("slot_body"));
                }
                if (i == UnknownEnum.Value_2)
                {
                    draw_text(__view_get(UnknownEnum.Value_0, 0) + 96, __view_get(UnknownEnum.Value_1, 0) + 141, scrString("slot_gun"));
                }
                draw_set_color(global.palette[0]);
            }
        }
        scrSetFont(global.fontNoShadow);
        for (var i = 0; i < 4; i++)
        {
            if (modSlot[i] > 0)
            {
                modSpriteIndex = i + 1;
                if (modSlot[i] > 3)
                {
                    modSpriteIndex += 4;
                }
                visualModSlot = min(2, modSlot[i] - 1);
                draw_sprite(s07_ModBig, modSpriteIndex, __view_get(UnknownEnum.Value_0, 0) + 96 + (32 * i), __view_get(UnknownEnum.Value_1, 0) + 28 + (64 * visualModSlot));
            }
        }
        visualModSlot = min(2, modSlot[sel] - 1);
        draw_sprite(s07_ModBig, 0, __view_get(UnknownEnum.Value_0, 0) + 96 + (32 * sel), __view_get(UnknownEnum.Value_1, 0) + 28 + (64 * visualModSlot));
        var _modName = "";
        _slotName[0] = "";
        _slotName[1] = "";
        _slotName[2] = "";
        _slotDesc[0] = "";
        _slotDesc[1] = "";
        _slotDesc[2] = "";
        switch (sel)
        {
            case UnknownEnum.Value_0:
                _modName = "mod_heat_name";
                _slotName[0] = "mod_heat_grav";
                _slotName[1] = "mod_heat_body";
                _slotName[2] = "mod_heat_gun";
                _slotDesc[0] = "mod_heat_grav_desc";
                _slotDesc[1] = "mod_heat_body_desc";
                _slotDesc[2] = "mod_heat_gun_desc";
                break;
            case UnknownEnum.Value_1:
                _modName = "mod_multi_name";
                _slotName[0] = "mod_multi_grav";
                _slotName[1] = "mod_multi_body";
                _slotName[2] = "mod_multi_gun";
                _slotDesc[0] = "mod_multi_grav_desc";
                _slotDesc[1] = "mod_multi_body_desc";
                _slotDesc[2] = "mod_multi_gun_desc";
                break;
            case UnknownEnum.Value_2:
                _modName = "mod_pulse_name";
                _slotName[0] = "mod_pulse_grav";
                _slotName[1] = "mod_pulse_body";
                _slotName[2] = "mod_pulse_gun";
                _slotDesc[0] = "mod_pulse_grav_desc";
                _slotDesc[1] = "mod_pulse_body_desc";
                _slotDesc[2] = "mod_pulse_gun_desc";
                break;
            case UnknownEnum.Value_3:
                _modName = "mod_force_name";
                _slotName[0] = "mod_force_grav";
                _slotName[1] = "mod_force_body";
                _slotName[2] = "mod_force_gun";
                _slotDesc[0] = "mod_force_grav_desc";
                _slotDesc[1] = "mod_force_body_desc";
                _slotDesc[2] = "mod_force_gun_desc";
                break;
        }
        scrDrawTextCenteredPoint(scrString(_modName), __view_get(UnknownEnum.Value_0, 0) + 48, __view_get(UnknownEnum.Value_1, 0) + 9, 8);
        for (var i = 0; i < 3; i++)
        {
            if (modSlot[sel] == (i + 1))
            {
                draw_set_color(global.palette[16]);
                draw_rectangle(__view_get(UnknownEnum.Value_0, 0) + 13, __view_get(UnknownEnum.Value_1, 0) + 25 + (64 * i), __view_get(UnknownEnum.Value_0, 0) + 83, __view_get(UnknownEnum.Value_1, 0) + 80 + (64 * i), 0);
                draw_set_color(global.palette[0]);
            }
            else
            {
                draw_set_color(global.palette[16]);
            }
            scrSetFont(global.fontTall);
            draw_text(__view_get(UnknownEnum.Value_0, 0) + 16, __view_get(UnknownEnum.Value_1, 0) + 28 + (64 * i), scrString(_slotName[i]));
            scrSetFont(global.fontNoShadow);
            var _str = scrStringSplit(_slotDesc[i], 9, 3);
            for (var j = 0; j < 3; j++)
            {
                if (string_pos(".", _str[j]) == 1)
                {
                    draw_text(__view_get(UnknownEnum.Value_0, 0) + 12, __view_get(UnknownEnum.Value_1, 0) + 52 + (64 * i) + (8 * j), _str[j]);
                }
                else
                {
                    draw_text(__view_get(UnknownEnum.Value_0, 0) + 20, __view_get(UnknownEnum.Value_1, 0) + 52 + (64 * i) + (8 * j), _str[j]);
                }
            }
        }
    }
    with (o07_ModAppear)
    {
        draw_self();
    }
    scrSetFont(global.fontTerminal);
    draw_set_color(16777215);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
