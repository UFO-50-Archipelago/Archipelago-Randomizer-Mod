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
if (is_location_collected(204))
{
    instance_create(1568, 176, o07_SaveShell);
    instance_create(1584, 176, o07_SaveStation);
    o07__Game.bossActive = false;
    instance_destroy();
    exit;
}
else
{
    visible = true;
}
scr07_BossBig();
if (hp < (maxHP * 0.5))
{
    sprite_index = s07_eBossBigLow;
}
else
{
    sprite_index = s07_eBossBig;
}
if (instance_place(x + (sign(hspeed) * 2), y, obj_floor))
{
    hspeed = 0;
}
if (instance_place(x, y + (sign(vspeed) * 2), obj_floor))
{
    vspeed = 0;
}
