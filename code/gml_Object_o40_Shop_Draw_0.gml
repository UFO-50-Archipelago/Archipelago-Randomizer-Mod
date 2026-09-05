if (state == 2)
{
    scrDrawMenuBorder(xx, yy, 128, 32);
    scrDrawMenuBorder(xx, yy + 32, 224, 96);
    if (shopNum < 2)
    {
        var str = scrStringSplit("shop_dialogue", 14, 2);
        draw_text(xx + 8, yy + 8, str[0]);
        draw_text(xx + 8, yy + 16, str[1]);
    }
    else
    {
        draw_text(xx + 8, yy + 8, "...");
    }
    for (var i = 0; i < itemCount; i++)
    {
        var yD = yy + 40 + (24 * i);
        draw_text(xx + 8, yD, itemString[i]);
        draw_text((xx + 224) - 32, yD, itemPString[i]);
    }
    draw_text(xx + 8, yy + 80 + 32, scrStringLimit("exit", 14));
    if (selCurr < itemCount)
    {
        draw_sprite(s40_TextCursor, 0, xx, yy + 40 + (24 * selCurr));
    }
    else
    {
        draw_sprite(s40_TextCursor, 0, xx, yy + 80 + 32);
    }
}
else if (state == 3)
{
    scrDrawMenuBorder(xx, yy, 128, 96);
    for (var i = 0; i < 10; i++)
    {
        var yD = yy + 8 + (8 * i);
        draw_text(xx + 8, yD, hintString[i]);
    }
}
