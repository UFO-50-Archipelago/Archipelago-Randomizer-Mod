if (scr07_CheckEnemyFreeze(true, true, false))
{
    if (o07_Player.sprite_index == s07_pRespawn || o07__Game.state == 1)
    {
        y = ystart;
        x = xstart;
        sprite_index = s07_eBossHang;
        active = false;
        state = -2;
        moveCount = moveCountMax;
        shotCount = shotCountMax;
        flyCount = flyCountMax;
        moveCurr = 0;
        with (o07_eHoming)
        {
            instance_destroy();
        }
        with (o07_eFly)
        {
            instance_destroy();
        }
    }
    exit;
}
event_inherited();
if (is_location_collected(107))
{
    instance_create(1664, 1824, o07_SaveShell);
    instance_create(1680, 1824, o07_SaveStation);
    o07__Game.bossActive = false;
    instance_destroy();
    exit;
}
else
{
    visible = true;
}
scr07_BossHang();
if (instance_place(x + hspeed, y, obj_floor))
{
    speed = 0;
}
if (instance_place(x, y + vspeed, obj_floor))
{
    speed = 0;
}
