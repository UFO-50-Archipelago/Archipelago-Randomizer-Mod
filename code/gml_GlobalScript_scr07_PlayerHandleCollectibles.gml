function scr07_PlayerHandleCollectibles()
{
    if (sprite_index == s07_pFace || sprite_index == s07_pRead || sprite_index == s07_pRespawn || sprite_index == s07_pWalkIn || sprite_index == s07_pTeleEnter || sprite_index == s07_pTeleExit || instance_exists(oTextBox) || !instance_exists(o07__Game) || dead)
    {
        exit;
    }
    if (place_meeting(x, y, o07__Item))
    {
        var _modCollected = false;
        var _collectOkay = false;
        var _collectObj = instance_place(x, y, o07__Item);
        itemX = _collectObj.x;
        itemY = _collectObj.y;
        var _stringID = "";
        if (_collectObj.hasBeenCollected)
        {
            exit;
        }
        switch (_collectObj.object_index)
        {
            case o07__iModFire:
                _stringID = "item_mod_heat";
                _modCollected = true;
                _collectOkay = true;
                break;
            case o07__iModMulti:
                _stringID = "item_mod_multi";
                _modCollected = true;
                _collectOkay = true;
                break;
            case o07__iModPulse:
                _stringID = "item_mod_pulse";
                _modCollected = true;
                _collectOkay = true;
                break;
            case o07__iModForce:
                _stringID = "item_mod_force";
                _modCollected = true;
                _collectOkay = true;
                break;
            case o07__iShield:
                with (o07__Game)
                {
                    scrSfx(soundGetItem, 80);
                }
                with (_collectObj.id)
                {
                    hasBeenCollected = true;
                    visible = false;
                }
                with (o07__Game)
                {
                    var _pos;
                    _pos[0] = _collectObj.x;
                    _pos[1] = _collectObj.y;
                    _pos[2] = room;
                    var _doAdd = true;
                    for (var i = 0; i < ds_list_size(upgradeCollected); i++)
                    {
                        if (array_get(ds_list_find_value(upgradeCollected, i), 0) == _pos[0] && array_get(ds_list_find_value(upgradeCollected, i), 1) == _pos[1])
                        {
                            _doAdd = false;
                            break;
                        }
                    }
                    if (_doAdd)
                    {
                        ds_list_add(upgradeCollected, _pos);
                    }
                }
                _stringID = "item_shield";
                _collectOkay = true;
                break;
            case o07__iStabilizer:
                with (o07__Game)
                {
                    scrSfx(soundGetItem, 80);
                }
                scr07_CollectMajorUpgrade(_collectObj.id, true);
                _stringID = "item_stabilizer";
                _collectOkay = true;
                break;
            case o07__iClone:
                with (o07__Game)
                {
                    scrSfx(soundGetItem, 80);
                }
                scr07_CollectMajorUpgrade(_collectObj.id, o07__Game.currArea != 0);
                _stringID = "item_clone";
                _collectOkay = true;
                break;
            case o07__iCode:
                with (o07__Game)
                {
                    tBgm = 60;
                    scrSfx(soundGetCode, 80);
                }
                with (_collectObj)
                {
                    collected = true;
                    instance_destroy();
                }
                _stringID = "item_keycode";
                _collectOkay = true;
                break;
        }
        if (_collectOkay)
        {
            vainger_collect(itemX, itemY);
            skipFrame = true;
            imgFreeze = image_index;
            if (_modCollected)
            {
                with (o07__Game)
                {
                    scrSfx(soundGetMod, 80);
                }
                scrWin(global.GARDEN_WIN);
                if (_collectObj.object_index == o07__iModFire)
                {
                    with (o07__Game)
                    {
                        if (missionCurr <= 1)
                        {
                            missionCurr = 1;
                            missionTextID = "mission_mods_1";
                            missionText = scrString(missionTextID);
                        }
                    }
                }
                else
                {
                    event_user(2);
                }
                scr07_CollectMajorUpgrade(_collectObj.id, true);
            }
            else
            {
            }
        }
    }
}
