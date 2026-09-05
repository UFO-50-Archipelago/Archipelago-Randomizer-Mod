if (global.g10_playerIsDead)
    exit;

if (global.g10_bosslightExists)
    exit;
    
if (o10_Game.postBossTransition)
{
    skipFrame = 0;
    state = 100;
}
if (skipFrame < -10)
{
    skipFrame = -20;
    exit;
}
var base = other.id;
var _exitBase = false;
var _textBoxShown = instance_exists(oTextBox);
if (_textBoxShown)
{
    if (o10_Game.currFuel < (o10_Game.fuelMax - 1))
    {
        o10_Game.currFuel = min(o10_Game.currFuel + 100, o10_Game.fuelMax - 1);
        exit;
    }
    else if (o10_Game.fuelTanks < o10_Game.fuelTanksMax)
    {
        o10_Game.currFuel = 20;
        o10_Game.fuelTanks++;
        exit;
    }
    else
    {
        o10_Game.currFuel = o10_Game.fuelMax;
    }
}
if ((y <= (base.y + 12) || state == 100) && !instance_exists(oTextBox))
{
    if (o10_Game.currFuel < o10_Game.fuelMax || o10_Game.fuelTanks < o10_Game.fuelTanksMax)
    {
        with (o10_Game)
        {
            muteBGM();
            scrSfx(sfx_powerup00, 80);
            tBgm = 120;
            bgmTrig = false;
            bgmState = BGM_STATE_OFF;
            fuelTanks = fuelTanksMax;
            currFuel = fuelMax;
            currArmor = armorSys;
            returnTrips++;
        }
        scrDrawTextBoxString(48, 120, 288, 48, -1000, "sub_refuel");
        state = 100;
        dashing = 0;
        dashTime = 0;
        yVel = 0;
        xVel = 0;
        y = base.y + 12;
        x = base.x + 16;
        image_speed = 0;
        if (!firstTextBox)
        {
            for (var i = 0; i < 300; i++)
            {
                if (o10_Game.itemsCollected[i] == 3)
                {
                    o10_Game.itemsCollected[i] = 0;
                }
            }
            firstTextBox = true;
        }
    }
    else if (state == 100)
    {
        ds_queue_clear(o10_Game.dialog_queue);
        o10_Game.dialog_curr[0] = "";
        o10_Game.dialog_curr[1] = "";
        o10_Game.menuSoundTrig = false;
        o10_Game.itemDescribe = "";
        with (oFX_TimedSprite)
        {
            instance_destroy();
        }
        y = base.y + 12;
        yVel = 0;
        xVel = 0;
        x = base.x + 16;
        state++;
        o10_Game.baseState = 0;
        o10_Game.itemDescribe = "";
    }
    else if (state == 102)
    {
        if (o10_Game.state != 2)
        {
            trace("checking for items");
            state++;
        }
    }
    else
    {
        state = 103;
        var _item = array_pop(o10_Game.carry);
        trace("ITEM POPPED OFF", array_length(o10_Game.carry), _item);
        var _message = undefined;
        porgy_update_items();
        if (!is_undefined(_item))
        {
            if (_item.item_type != UnknownEnum.Value_13)
            {
                scrSfx(sfx_special04b, 80);
            }
            switch (_item.item_type)
            {
                case UnknownEnum.Value_14:
                    _item.x = x;
                    _item.y = y;
                    array_push(o10_Game.eggTempArea, _item);
                    break;
                default:
                    break;
            }
            if (_item.item_id > -1 && _item.item_type != 14)
            {
                o10_Game.itemsCollected[_item.item_id] = 2;
                collect_location(_item.item_id);
            }
        }
        else
        {
            trace("UNDEFINED ITEM! BAILING", _item);
        }
        if (is_undefined(_message) && array_length(o10_Game.carry) == 0 && !instance_exists(oTextBox) && o10_Game.eggStored != array_length(o10_Game.eggTempArea))
        {
            if (o10_Game.eggStored > array_length(o10_Game.eggTempArea))
            {
                _message = scrString("sub_egg_lost");
            }
            else
            {
                _message = scrString("sub_egg_nobase");
            }
            o10_Game.eggStored = array_length(o10_Game.eggTempArea);
        }
        if (!is_undefined(_message))
        {
            if (firstTextBox)
            {
                scrDrawTextBoxOpenedExSplit(48, 120, 288, 48, -1000, _message, 32, 2);
                firstTextBox = true;
            }
            else
            {
                scrDrawTextBoxExSplit(48, 120, 288, 48, -1000, _message, 32, 2);
            }
        }
        if (array_length(o10_Game.carry) == 0 && !instance_exists(oTextBox))
        {
            _exitBase = true;
        }
    }
}
if (_exitBase)
{
    state = 102;
    if (!instance_exists(o10_hudPortrait))
    {
        instance_create(camera_get_view_x(view_get_camera(0)) + 56, camera_get_view_y(view_get_camera(0)) + 80, o10_hudPortrait);
    }
    with (o10_Game)
    {
        state = 2;
        baseState = 0;
        itemSelect = 0;
        missileSys = false;
        radarSys = false;
        busterSys = false;
        chargeSys = false;
        fuelSys = false;
        boostSys = false;
        drillSys = false;
        lightSys = false;
        aimSys = false;
        armorSys = 0;
        currArmor = 0;
        fuelMax = 1000;
    }
}

enum UnknownEnum
{
    Value_13 = 13,
    Value_14
}
