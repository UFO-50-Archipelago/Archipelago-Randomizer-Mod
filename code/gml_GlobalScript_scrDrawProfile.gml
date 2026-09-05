function scrDrawProfile(arg0, arg1, arg2, arg3)
{
    scrDrawMenuBorder(arg0, arg1, 384 - (arg0 * 2), 32);
    scrSetFont(global.fontDefault);
    var _textTop = arg1 + 8;
    var _display_string, _display_string_2;
    if (arg2 == 1)
    {
        _display_string = scrStringManual("ap_server", 0);
        _display_string_2 = global.ap_server;
    }
    else if (arg2 == 2)
    {
        _display_string = scrStringManual("ap_player", 0);
        _display_string_2 = global.ap_player;
    }
    else
    {
        _display_string = scrStringManual("ap_password", 0);
        _display_string_2 = "";
        for (i = 0; i < string_length(global.ap_password); i++)
        {
            _display_string_2 = _display_string_2 + "*";
        }
    }
    draw_set_halign(0);
    draw_set_colour(0);
    draw_text((arg0 + 8) - 1, _textTop - 8 - 1, _display_string);
    draw_set_colour(arg3);
    draw_text(arg0 + 8, _textTop - 8, _display_string);
    draw_set_colour(16777215);
    scrSetFont(global.fontTall);
    draw_set_halign(1);
    draw_text(192, _textTop, _display_string_2);
    draw_set_halign(0);
}
