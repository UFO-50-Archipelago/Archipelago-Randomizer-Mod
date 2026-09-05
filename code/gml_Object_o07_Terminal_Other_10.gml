var term = id;
o07_Player.skipFrame = true;
if (term.accessGrant > 0)
{
    isMetaMessage = true;
    stringLoad = "ap_07_terminal";
}
if (is_string(stringLoad))
{
    var _percent = floor(100 * (array_get(scr07_CalculateCompletionPercentage(), 2) / max(percentageReq, 1)));
    var _str = "";
    if (isMetaMessage)
    {
        _str = string_line_breaks(scrStringManual(stringLoad, 0), 42, 3);
    }
    else
    {
        _str = scrStringFormatExt(stringLoad, 42, 3, _percent);
    }
    scrDrawTextBoxEx(0, 0, 384, scrDrawTextBoxGetHeight(_str, 32, 16, 3), -10, _str[0], _str[1], _str[2]);
}
else if (is_array(stringLoad))
{
    var _str = array_create(array_length(stringLoad));
    for (var i = 0; i < array_length(stringLoad); i++)
    {
        _str[i] = scrStringFormatExt(stringLoad[i], 42, 3);
    }
    var __str = _str[0];
    var _text = scrDrawTextBoxEx(0, 0, 384, 64, -10, __str[0], __str[1], __str[2]);
    for (var i = 1; i < array_length(_str); i++)
    {
        _text.str = array_concat(_text.str, _str[i]);
    }
}
if (term.mapUpdate != 0)
{
    for (var i = 0; i < array_length(term.mapUpdatePos); i++)
    {
        var _pos = term.mapUpdatePos[i];
        var _interest = ds_map_find_value(o07__Game.areaInterestMap, array_get(_pos, 0));
        ds_grid_set(_interest, array_get(_pos, 1), array_get(_pos, 2), term.mapUpdate);
    }
    term.mapUpdate = 0;
}
if (term.missionNew > o07__Game.missionCurr)
{
    o07__Game.missionTextID = term.missionTextID;
    o07__Game.missionText = term.missionText;
    o07__Game.missionCurr = term.missionNew;
}
if (term.accessGrant > 0)
{
    vainger_collect(term.x, term.y);
}
if (o07__Game.currArea == 9)
{
    with (o07_WallBlock)
    {
        instance_destroy();
    }
}
o07_Player.sprite_index = s07_pRead;
o07_Player.imgFreeze = 0;
