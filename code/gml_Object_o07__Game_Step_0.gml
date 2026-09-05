if (state == UnknownEnum.Value_4)
{
    exit;
}
if (current_second != previous_second && introPlaying == 0)
{
    global.g07_totalTime++;
    previous_second = current_second;
}
enemyWallCheckCount++;
if (tBgm != -1)
{
    if (tBgm-- == 0)
    {
        scr07_BGM(0);
        tBgm = -1;
    }
}
with (o07_DoorIn)
{
    if (areaTo == 0 && alarm[0] == -1)
    {
        alarm[0] = 2;
    }
}
if (loadRoom)
{
    trace("LOAD ROOM");
    with (o07_Player)
    {
        x = other.loadPlayerX;
        y = other.loadPlayerY;
        flip = other.loadPlayerFlip;
        image_index = 0;
        sprTorso = s07_pTorso;
        if (o07__Game.modSlot[UnknownEnum.Value_0] == 2)
        {
            sprTorso = s07_pTorsoB;
        }
        if (o07__Game.modSlot[UnknownEnum.Value_3] == 2)
        {
            sprTorso = s07_pTorsoC;
        }
        if (o07__Game.modSlot[UnknownEnum.Value_1] == 2)
        {
            instance_create(x, y - 48, o07_pDrone);
        }
    }
    loadRoom = false;
}
if (bossActive)
{
    with (o07_zDoor)
    {
        if (sprite_index != s07_DoorClose)
        {
            sprite_index = s07_DoorClose_Lock;
            image_index = 0;
            state = 0;
            if (!instance_place(x, y, o07_zDoorBlock))
            {
                with (instance_create(x, y, o07_zDoorBlock))
                {
                    visible = false;
                }
            }
            if (!instance_place(x + 32, y, o07_zDoorBlock))
            {
                with (instance_create(x + 32, y, o07_zDoorBlock))
                {
                    visible = false;
                }
            }
        }
    }
}
else
{
    bossHPDraw = 0;
    with (o07_zDoor)
    {
        if (sprite_index == s07_DoorClose_Lock)
        {
            sprite_index = s07_Door;
        }
    }
}
switch (state)
{
    case 0:
        hpDraw = approach(hpDraw, hp, lerp(1, 5, abs(hpDraw - hp) > 20));
        if (!bossActive)
        {
            bossHP = 0;
        }
        bossHPDraw = approach(bossHPDraw, bossHP, 5);
        areaVisited[currArea] = true;
        break;
    case 1:
        hpDraw = hp;
        bossHP = 0;
        bossHPDraw = 0;
        break;
    case 2:
        scr07_MenuEquipMode();
        break;
    case 3:
        scr07_MenuMapMode();
        break;
    case 1000:
        scr07_GameEnd();
        break;
}
if (heatArea)
{
    heatAlpha = min(heatAlpha + 0.12, 1);
}
else
{
    heatAlpha = max(heatAlpha - 0.12, 0);
}
for (i = 0; i < 4; i++)
{
    if (modSlot[i] == 0 && has_item(i))
    {
        modSlot[i] = 99;
    }
}
modLimit = 2 + min(3, get_item_count(10));
apClones = 2 + min(3, get_item_count(11));
if (apClones > cloneMax)
{
    newClones = apClones - cloneMax;
    cloneMax += newClones;
    cloneCount += newClones;
}
apShields = get_item_count(12);
if (apShields > shields)
{
    newShields = apShields - shields;
    shields += newShields;
    hp += (newShields * 5);
    hpMax += (newShields * 5);
    hp = min(999, hp);
    hpMax = min(999, hpMax);
}
codes[0] = has_item(20);
codes[1] = has_item(21);
codes[2] = has_item(22);
codes[3] = has_item(23);
clearanceLevel = min(4, get_item_count(24));

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_3 = 3,
    Value_4
}
