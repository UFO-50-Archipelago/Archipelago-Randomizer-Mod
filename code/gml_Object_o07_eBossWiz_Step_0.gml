if (scr07_CheckEnemyFreeze(true, true, false))
{
    if (o07_Player.sprite_index == s07_pRespawn || o07__Game.state == 1)
    {
        y = ystart;
        x = xstart;
        active = false;
        state = -2;
    }
    exit;
}
event_inherited();
var dist = point_distance(o07_Player.x, o07_Player.y, x, y);
if (is_location_collected(6))
{
    instance_create(1440, 992, o07_SaveShell);
    instance_create(1456, 992, o07_SaveStation);
    o07__Game.bossActive = false;
    instance_destroy();
    exit;
}
else
{
    visible = true;
}
scr07_BossWiz();
if (instance_place(x + hspeed, y, obj_floor))
{
    speed = 0;
}
if (instance_place(x, y + vspeed, obj_floor))
{
    speed = 0;
}
