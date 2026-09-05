with (o07__Game)
{
    scrSfx(soundCodeLightOn, 60);
}
img = 1;
if (num == 3 && o07__Game.codes[0] > 0 && o07__Game.codes[1] > 0 && o07__Game.codes[2] > 0)
{
    with (o07_WallBlock)
    {
        instance_destroy();
    }
}
else if (num == 3)
{
    alarm[0] = activateTimer;
}
