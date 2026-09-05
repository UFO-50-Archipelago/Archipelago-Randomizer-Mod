if (!verify(o40_Mas))
{
    exit;
}
if (state == 1)
{
    if (t++ == 20)
    {
        t = 0;
        selCurr = 0;
        xx = camera_get_view_x(view_get_camera(0)) + 80;
        yy = camera_get_view_y(view_get_camera(0)) + 32;
        if (shopNum < 10)
        {
            if (shopNum == 0)
            {
                itemCount = 3;
                itemType[2] = 2;
                itemType[1] = 6;
                itemType[0] = 3;
                itemString[2] = "???";
                itemString[1] = "???";
                itemString[0] = "???";
                itemPrice[2] = 200;
                itemPrice[1] = 50;
                itemPrice[0] = 100;
                itemLocation[2] = 14;
                itemLocation[1] = 13;
                itemLocation[0] = 12;
            }
            else if (shopNum == 1)
            {
                itemCount = 2;
                itemType[1] = 3;
                itemType[0] = 4;
                itemString[1] = "???";
                itemString[0] = "???";
                itemPrice[1] = 50;
                itemPrice[0] = 100;
                itemLocation[1] = 3;
                itemLocation[0] = 2;
            }
            else if (shopNum == 2)
            {
                itemCount = 1;
                itemType[0] = 9;
                itemString[0] = "???";
                if (is_location_collected(1))
                {
                    itemString[0] = scrStringLimit("egg", 10);
                }
                itemPrice[0] = 100;
                itemLocation[0] = 1;
            }
            if (shopNum < 2)
            {
                for (var i = 0; i < itemCount; i++)
                {
                    if (!is_location_collected(itemLocation[i]))
                    {
                        itemPString[i] = string_format(itemPrice[i], 3, 0);
                        itemPString[i] = string_replace_all(itemPString[i], " ", "0");
                    }
                    else
                    {
                        itemPString[i] = "---";
                    }
                }
            }
            else if (o40_Mas.life < 6 || !is_location_collected(itemLocation[0]))
            {
                itemPString[0] = string_format(itemPrice[0], 3, 0);
                itemPString[0] = string_replace_all(itemPString[0], " ", "0");
            }
            else
            {
                itemPString[0] = "---";
            }
            state = 2;
            for (var i = 0; i < itemCount; i++)
            {
                location = itemLocation[i];
                hint_location(location);
                if (is_location_scouted(location))
                {
                    player_id = get_location_player(location);
                    game_name = apclient_get_player_game(player_id);
                    item_name = apclient_get_item_name(get_location_item(location), game_name);
                    if (string_length(item_name) > 22)
                    {
                        item_name = string_copy(item_name, 1, 22);
                    }
                    player_name = scrStringManual("ap_for", 0) + " " + apclient_get_player_alias(player_id);
                    if (string_length(player_name) > 22)
                    {
                        player_name = string_copy(player_name, 1, 22);
                    }
                    itemString[i] = item_name + "\n" + player_name;
                    if (shopNum == 2 && is_location_collected(location))
                    {
                        itemString[i] = scrStringLimit("egg", 10);
                    }
                }
            }
        }
        else
        {
            if (shopNum == 10)
            {
                hintString = false;
                hintString = scrStringManual("ap_40_hint_a", 0);
                hintString = string_split_custom(hintString, 14, 10);
            }
            else if (shopNum == 11)
            {
                hintString = false;
                hintString = scrStringManual("ap_40_hint_b", 0);
                hintString = string_split_custom(hintString, 14, 10);
            }
            else if (shopNum == 12)
            {
                hintString = false;
                hintString = scrStringManual("ap_40_hint_c", 0);
                hintString = string_split_custom(hintString, 14, 10);
            }
            else if (shopNum == 13)
            {
                hintString = false;
                hintString = scrStringManual("ap_40_hint_d", 0);
                hintString = string_split_custom(hintString, 14, 10);
            }
            else if (shopNum == 14)
            {
                hintString = false;
                hintString = scrStringManual("ap_40_hint_e", 0);
                hintString = string_split_custom(hintString, 14, 10);
            }
            state = 3;
        }
    }
}
else if (state == 2)
{
    scrGetInput(0);
    if (pressUp)
    {
        scrSfx(sfx_navi02, 70);
        if (selCurr > 0)
        {
            selCurr--;
        }
        else
        {
            selCurr = itemCount;
        }
    }
    else if (pressDown)
    {
        scrSfx(sfx_navi02, 70);
        if (selCurr < itemCount)
        {
            selCurr++;
        }
        else
        {
            selCurr = 0;
        }
    }
    if (fire2pressed)
    {
        if (selCurr < itemCount)
        {
            if (shopNum < 2)
            {
                if (o40_Mas.points >= itemPrice[selCurr] && !is_location_collected(itemLocation[selCurr]))
                {
                    scrSfx(sfx_select03, 71);
                    o40_Mas.points -= itemPrice[selCurr];
                    itemPString[selCurr] = "---";
                    collect_location(itemLocation[selCurr]);
                }
                else
                {
                    scrSfx(sfx_nope00, 71);
                }
            }
            else if (o40_Mas.points >= itemPrice[selCurr] && (o40_Mas.life < 6 || !is_location_collected(itemLocation[selCurr])))
            {
                scrSfx(sfx_select03, 71);
                if (o40_Mas.life < 6 && is_location_collected(itemLocation[selCurr]))
                {
                    o40_Mas.life++;
                }
                if (o40_Mas.life >= 6)
                {
                    itemPString[selCurr] = "---";
                }
                itemString[selCurr] = scrStringLimit("egg", 10);
                o40_Mas.points -= itemPrice[selCurr];
                collect_location(itemLocation[selCurr]);
            }
            else
            {
                scrSfx(sfx_nope00, 71);
            }
        }
        else if (instance_exists(oPlayer))
        {
            oPlayer.state = 0;
            state = 10;
        }
    }
}
else if (state == 3)
{
    scrGetInput(0);
    if (fire2pressed)
    {
        if (instance_exists(oPlayer))
        {
            oPlayer.state = 0;
            state = 10;
        }
    }
}
else if (state == 10)
{
    if (!place_meeting(x, y, oPlayer))
    {
        state = 0;
    }
}
