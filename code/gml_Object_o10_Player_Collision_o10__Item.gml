if (global.textboxExists || other.collected > 0 || other.dropped > 0 || other.dropped <= -3 || o10_Game.currFuel <= 0)
    exit;

var _message;
_message[0] = "";
var _toCarry = -1;
var _face;
_face[0] = UnknownEnum.Value_0;
var _isUpgrade = true;
var _eggCount = 0;

with (o10_Egg)
{
    if (collected == 1)
        _eggCount += 1;
}

var _item = other.id;

if (_item.itemID > -1) {
    scrSfx(sfx_collect09b, 25, false, false);

    if (global.porgy_check_on_touch) {
        o10_Game.itemsCollected[_item.itemID] = 2;
        collect_location(_item.itemID);
        instance_destroy(-2);
        exit;
    }
}

switch (other.object_index)
{
    case o10__FuelTank:
        _toCarry = UnknownEnum.Value_1;
        break;
    case o10__TorpBoost:
        _toCarry = UnknownEnum.Value_2;
        break;
    case o10__MissileSys:
        _toCarry = UnknownEnum.Value_3;
        break;
    case o10__RadarSys:
        _toCarry = UnknownEnum.Value_4;
        break;
    case o10__BusterSys:
        _toCarry = UnknownEnum.Value_5;
        break;
    case o10__ChargeSys:
        _toCarry = UnknownEnum.Value_6;
        break;
    case o10__FuelSys:
        _toCarry = UnknownEnum.Value_7;
        break;
    case o10__Armor:
        _toCarry = UnknownEnum.Value_8;
        break;
    case o10__PowerDash:
        _toCarry = UnknownEnum.Value_9;
        break;
    case o10__LightSys:
        _toCarry = UnknownEnum.Value_10;
        break;
    case o10__DrillSys:
        _toCarry = UnknownEnum.Value_11;
        break;
    case o10__HomingSys:
        _toCarry = UnknownEnum.Value_12;
        break;
    case o10_Egg:
        _toCarry = UnknownEnum.Value_14;
        _isUpgrade = false;
        break;
}

if (other.dropped >= 0 && ds_queue_size(o10_Game.dialog_queue) == 0)
{
    _message[0] = scrStringSplit(scrChoose("pickup_dropped_message1", "pickup_dropped_message2", "pickup_dropped_message3", "pickup_dropped_message4"), 30, 2);
    _face[0] = UnknownEnum.Value_7;
}

if (_isUpgrade)
{
    if ((array_length(o10_Game.carry) - _eggCount) == 2)
    {
        _message[1] = scrStringSplit("pickup_many_message1", 30, 2);
        _face[1] = UnknownEnum.Value_0;
    }
    else if ((array_length(o10_Game.carry) - _eggCount) == 4)
    {
        _message[1] = scrStringSplit("pickup_many_message1", 30, 2);
        _face[1] = UnknownEnum.Value_3;
    }
}

if (_toCarry != -1)
{
    scrTextPopup(x, y, scrString("item_get"), 50);
    var _x, _y;

    if (is_struct(array_last(o10_Game.carry)))
    {
        _x = array_last(o10_Game.carry).x;
        _y = array_last(o10_Game.carry).y;
    }
    else
    {
        _x = other.x;
        _y = other.y;
    }

    array_push(o10_Game.carry, 
    {
        item_type: _toCarry,
        item_id: _item.itemID,
        x: _x,
        y: _y
    });

    if (other.itemID > -1)
        o10_Game.itemsCollected[other.itemID] = 1;

    for (var i = 0; i < array_length(_message); i++)
    {
        if (_message[i] != "")
            scr10_DrPopup(_message[i], _face[i], -1, false);
    }

    canShoot = false;
    skipFrame = 1;
    
    with (other.id)
        instance_destroy();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_14 = 14
}
