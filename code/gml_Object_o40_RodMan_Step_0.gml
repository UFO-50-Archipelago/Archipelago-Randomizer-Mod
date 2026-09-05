if (state == 1)
{
    collect_location(23);
    if (t++ == 20)
    {
        t = 0;
        xx = camera_get_view_x(view_get_camera(0)) + 176;
        yy = camera_get_view_y(view_get_camera(0)) + 32;
        mode = 0;
        with (o40_Mas)
        {
            if (!prefersSword)
            {
                other.mode = 1;
            }
        }
        selCurr = 0;
        state = 2;
    }
}
else if (state == 2)
{
    scrGetInput(0);
    if (pressLeft || pressRight)
    {
        if (selCurr == 0)
        {
            selCurr = 1;
        }
        else
        {
            selCurr = 0;
        }
    }
    if (fire2pressed)
    {
        if (selCurr == 0)
        {
            if (mode == 0)
            {
                with (o40_Mas)
                {
                    prefersSword = false;
                }
            }
            else
            {
                with (o40_Mas)
                {
                    prefersSword = true;
                }
            }
        }
        with (oPlayer)
        {
            state = 0;
        }
        state = 4;
    }
}
else if (state == 4)
{
    if (!place_meeting(x, y, oPlayer))
    {
        state = 0;
    }
}
