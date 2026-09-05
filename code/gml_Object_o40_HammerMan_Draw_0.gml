if (state == 2)
{
    scrDrawMenuBorder(xx, yy, 128, 64);
    scrDrawMenuBorder(xx, yy + 64, 128, 32);
    player_id = get_location_player(7);
    game_name = apclient_get_player_game(player_id);
    item_name = apclient_get_item_name(get_location_item(7), game_name);
    player_name = apclient_get_player_alias(player_id);
    str = method_call(string, [scrStringManual("ap_40_hammer_man", 0), player_name, item_name]);
    str = string_split_custom(str, 14, 6);
    for (var i = 0; i < 6; i++)
    {
        draw_text(xx + 8, yy + 8 + (8 * i), str[i]);
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
else if (state == 9 || state == 10)
{
    draw_clear_alpha(0, 1);
}
