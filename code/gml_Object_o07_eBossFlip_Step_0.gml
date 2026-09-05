if (scr07_CheckEnemyFreeze(true, true, false))
{
    if (o07_Player.sprite_index == s07_pRespawn || o07__Game.state == 1)
    {
        y = ystart;
        x = xstart;
        image_xscale = -1;
        sprite_index = s07_eBossFlip;
        active = false;
        state = -2;
        faceLeft = true;
        flip = false;
        spin = false;
        moveCount = 30;
        faceLeft = true;
        sliceCount = 0;
        hspd = 0;
        img = 0;
        shotCount = shotCountMax;
        moveCurr = 0;
    }
    exit;
}
event_inherited();
if (is_location_collected(211))
{
    instance_create(3344, 1936, o07_SaveShell);
    instance_create(3360, 1936, o07_SaveStation);
    o07__Game.bossActive = false;
    instance_destroy();
    exit;
}
else
{
    visible = true;
}
if (!on_ground)
{
    if (!flip)
    {
        vspd = approach(vspd, S_MAX_V, S_GRAVITY);
    }
    else
    {
        vspd = approach(vspd, S_MAX_V * -1, S_GRAVITY);
    }
    exit;
}
scr07_BossFlip();
if (spin > 0)
{
    spin += 20;
}
