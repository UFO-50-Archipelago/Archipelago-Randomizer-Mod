if (is_location_collected(7) && state < 2)
{
    tile_add(bg40_Traps, 112, 112, 16, 16, 1568, 608, 95);
    instance_destroy();
    exit;
}
if (state == 1)
{
    if (t++ == 20)
    {
        t = 0;
        xx = camera_get_view_x(view_get_camera(0)) + 176;
        yy = camera_get_view_y(view_get_camera(0)) + 32;
        selCurr = 0;
        state = 2;
        hint_location(7);
    }
}
else if (state == 2)
{
    scrGetInput(0);
    if (pressLeft || pressRight)
    {
        scrSfx(sfx_navi02, 70);
        selCurr = ++selCurr % 2;
    }
    else if (fire2pressed)
    {
        if (selCurr == 0 && instance_exists(o40_Mas))
        {
            if (o40_Mas.points >= 500 && !is_location_collected(7))
            {
                scrSfx(sfx_select03, 71);
                o40_Mas.points -= 500;
                depth = -200;
                state = 9;
                collect_location(7);
            }
            else
            {
                scrSfx(sfx_nope00, 71);
            }
        }
        else
        {
            state = 4;
        }
    }
}
else if (state == 4)
{
    with (o40_Player)
    {
        state = 0;
    }
    state = 5;
}
else if (state == 5)
{
    if (!place_meeting(x, y, oPlayer))
    {
        state = 0;
    }
}
else if (state == 9)
{
    with (o40_eTurret)
    {
        t = 0;
    }
    with (o40__Projectile)
    {
        instance_destroy();
    }
    tile_add(bg40_Traps, 112, 112, 16, 16, 1568, 608, 95);
    state = 10;
}
else if (state == 10)
{
    t++;
    with (o40_eTurret)
    {
        t = 0;
    }
    if (t == 30)
    {
        scrSfx(sfx_thud00, 72);
    }
    if (t >= 60)
    {
        with (o40_Player)
        {
            state = 0;
        }
        instance_destroy();
    }
}
