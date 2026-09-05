if (state == 2)
{
    scrDrawMenuBorder(xx, yy, 128, 64);
    scrDrawMenuBorder(xx, yy + 64, 128, 32);
    if (mode == 0)
    {
        var str = scrStringManual("ap_40_rod_man_1", 0);
        str = string_split_custom(str, 14, 6);
        for (var i = 0; i < 6; i++)
        {
            draw_text(xx + 8, yy + 8 + (8 * i), str[i]);
        }
    }
    else
    {
        var str = scrStringManual("ap_40_rod_man_2", 0);
        str = string_split_custom(str, 14, 6);
        for (var i = 0; i < 6; i++)
        {
            draw_text(xx + 8, yy + 8 + (8 * i), str[i]);
        }
    }
    draw_text(xx + 16, yy + 80, scrStringLimit("yes", 5));
    draw_text(xx + 80, yy + 80, scrStringLimit("no", 5));
    if (selCurr == 0)
    {
        draw_sprite(s40_TextCursor, 0, xx + 8, yy + 80);
    }
    else
    {
        draw_sprite(s40_TextCursor, 0, xx + 72, yy + 80);
    }
}
