SUB_INIT = 0;
SUB_NAV = 1;
SUB_GAME_INSPECT = 2;
SUB_SORT_SELECT = 3;
SUB_SORT_PERFORM = 4;
SUB_GAME_CHOSEN = 5;
SUB_GAME_DUST_OFF = 6;
SUB_GAME_OPEN = 7;
SUB_GAME_SLIDE_START = 8;
SUB_GAME_SLIDE = 9;
SUB_PET_COLLECTION = 10;
SUB_PROGRESS_STATS = 11;
CART_OFFX = 16;
CART_OFFY = 8;
CART_ROWS = 5;
CART_COLS = 10;
CART_WIDTH = 36;
CART_HEIGHT = 38;
if (scrInputAny())
{
    global.attractModeLibraryTimer = 0;
}
if (substate == SUB_INIT)
{
    if (texturegroup_get_status(global.TEXTUREGROUP[0]) != 3)
    {
        exit;
    }
    scrClearCheats();
    infoBarFlip = -1;
    tMenuSel = 0;
    joystickDir = false;
    tPageCycleLeft = 0;
    tPageCycleRight = 0;
    hasPage = array_create(0);
    infoBuddyIdleCount = 0;
    infoBuddyIdleCountMax = 240;
    infoBuddyIdleAnimLen = 30;
    oldCartX = 0;
    global.selGame = clamp(global.selGame, 1, 50);
    scrOpenCurrFile();
    global.randSortLocked = scrReadReal("randSortLocked", false);
    for (var i = 1; i <= global.NUM_GAMES; i++)
    {
        if (scrReadReal("gameRunCount" + string(global.mGameID[i]), 0) > 0)
        {
            played[i] = true;
        }
        else
        {
            played[i] = false;
        }
        if (global.arcadeCabinetMode)
        {
            played[i] = true;
        }
        winStatus[i] = scrReadReal("gameWin" + string(global.mGameID[i]), 0);
        gardenStatus[i] = scrReadReal("gardenWin" + string(global.mGameID[i]), 0);
        var _gardenStr = scrReadReal("gardenTime" + string(global.mGameID[i]), -1);
        gardenTime[i] = scrTimeFormat(_gardenStr, 4);
        totalPlaytime[i] = scrReadReal("gameTimeSum" + string(global.mGameID[i]), 0);
        gameExists[i] = room_exists(global.mGameRoom[i]);
        favs[i] = scrReadReal("favorite" + string(global.mGameID[i]), false);
        if ((i - 1) < global.NUM_LIBRARY_GAMES)
        {
            global.randSortOrder[i - 1] = scrReadReal("randSortOrder" + string(i - 1), -1);
        }
    }
    strProgress = scrGetRecords();
    scrCloseCurrFile();
    global.drawLibraryBG = true;
    petItemSelX = 0;
    petItemSelY = 0;
    scrPetInit();
    with (oIcon)
    {
        instance_destroy();
    }
    for (var j = 0; j < CART_ROWS; j++)
    {
        for (var i = 0; i < CART_COLS; i++)
        {
            var cartID = i + (CART_COLS * j) + 1;
            var cart = instance_create_depth(CART_OFFX + (i * CART_WIDTH), CART_OFFY + (CART_HEIGHT * j), 0, oIcon);
            if (instance_exists(cart))
            {
                cart.iconID = cartID;
                cart.myMonoIcon = global.mGameID[cartID];
                cart.myName = global.mGameTitle[cartID];
                cart.winStatus = winStatus[cartID];
                cart.multiplayer = global.mGameMultiplayer[cartID];
                if (played[cartID])
                {
                    cart.dustedOff = true;
                }
                else
                {
                    cart.dustedOff = false;
                }
                cart.active = gameExists[cartID];
            }
        }
    }
    scrCheckForAch();
    if (statePrev == STATE_PROFILE)
    {
        global.selSort = global.sortDefault;
        global.multStyle = 0;
    }
    if (global.all50 > 0)
    {
        global.selSort = global.SORT_PET;
        if (global.all50 == 2)
        {
            global.libraryBG = 9;
        }
        else
        {
            global.libraryBG = 8;
        }
    }
    scrSwitchSub(SUB_SORT_PERFORM);
}
else if (substate == SUB_NAV)
{
    with (oIcon)
    {
        state = 0;
        visible = true;
    }
    if (global.attractModeLibraryTimer++ >= global.AM_LIB_TIME)
    {
        event_user(15);
        exit;
    }
    selCart = scrSelectCart(global.selGame);
    var _quickNaviWait1 = 24;
    var _quickNaviWait2 = 8;
    var _navigateUp = false;
    var _navigateDown = false;
    var _navigateLeft = false;
    var _navigateRight = false;
    if (joystickDir > 0)
    {
        if (joystickDir != 1)
        {
            pressRight = false;
            holdRight = false;
        }
        if (joystickDir != 2)
        {
            pressUp = false;
            holdUp = false;
        }
        if (joystickDir != 3)
        {
            pressLeft = false;
            holdLeft = false;
        }
        if (joystickDir != 4)
        {
            pressDown = false;
            holdDown = false;
        }
        if (!joyTiltAny[0] && !joyTiltAny[1])
        {
            joystickDir = 0;
        }
    }
    if (holdUp || holdDown || holdRight || holdLeft)
    {
        tMenuSel--;
    }
    if (pressUp)
    {
        _navigateUp = true;
        tMenuSel = _quickNaviWait1;
    }
    else if (holdUp && tMenuSel == 0)
    {
        _navigateUp = true;
        tMenuSel = _quickNaviWait2;
    }
    if (pressDown)
    {
        _navigateDown = true;
        tMenuSel = _quickNaviWait1;
    }
    else if (holdDown && tMenuSel == 0)
    {
        _navigateDown = true;
        tMenuSel = _quickNaviWait2;
    }
    if (pressLeft)
    {
        _navigateLeft = true;
        tMenuSel = _quickNaviWait1;
    }
    else if (holdLeft && tMenuSel == 0)
    {
        _navigateLeft = true;
        tMenuSel = _quickNaviWait2;
    }
    if (pressRight)
    {
        _navigateRight = true;
        tMenuSel = _quickNaviWait1;
    }
    else if (holdRight && tMenuSel == 0)
    {
        _navigateRight = true;
        tMenuSel = _quickNaviWait2;
    }
    if (!global.EXCLUDE_ABSENT_GAMES && instance_exists(selCart))
    {
        var _cartBelow = instance_position(selCart.xOrig, selCart.yOrig + CART_HEIGHT, oIcon);
        var _canGoDown = false;
        if (instance_exists(_cartBelow))
        {
            if (!_cartBelow.excluded)
            {
                _canGoDown = true;
            }
        }
        if ((_navigateDown && !_canGoDown) || (_navigateUp && selCart.yOrig <= CART_OFFY))
        {
            scrSfxLibrary(soundFilterAccess);
            tMenuSel = _quickNaviWait1;
            oldCartX = selCart.xOrig;
            infoBarFlip = 0;
            if (global.selSort == global.SORT_FAVORITE || global.selSort == global.SORT_PROGRESS)
            {
                scrSwitchSub(SUB_SORT_PERFORM);
            }
            else
            {
                scrSwitchSub(SUB_SORT_SELECT);
            }
            exit;
        }
    }
    var _selCartPrev = selCart;
    if (_navigateUp)
    {
        with (selCart)
        {
            var _selectOK = false;
            var _f = yOrig - other.CART_HEIGHT;
            repeat (other.CART_ROWS - 1)
            {
                var _cartAbove = instance_place(x, _f, oIcon);
                if (instance_exists(_cartAbove))
                {
                    if (!_cartAbove.excluded)
                    {
                        global.selGame = _cartAbove.iconID;
                        _selectOK = true;
                    }
                }
                if (_selectOK)
                {
                    break;
                }
                else
                {
                    _f = _f - (other.CART_HEIGHT * 0.5);
                }
                if (_f < 0)
                {
                    _f = 216 - other.CART_HEIGHT - other.CART_OFFY;
                }
            }
            if (_selectOK)
            {
                break;
            }
        }
        selCart = scrSelectCart(global.selGame);
    }
    else if (_navigateDown)
    {
        with (selCart)
        {
            var _selectOK = false;
            var _f = yOrig + other.CART_HEIGHT;
            repeat (other.CART_ROWS - 1)
            {
                var _cartBelow = instance_place(x, _f, oIcon);
                if (instance_exists(_cartBelow))
                {
                    if (!_cartBelow.excluded)
                    {
                        global.selGame = _cartBelow.iconID;
                        _selectOK = true;
                    }
                }
                if (_selectOK)
                {
                    break;
                }
                else
                {
                    _f = (_f + (other.CART_HEIGHT * 0.5)) % 216;
                }
            }
            if (_selectOK)
            {
                break;
            }
        }
        selCart = scrSelectCart(global.selGame);
    }
    else if (_navigateLeft)
    {
        with (selCart)
        {
            var _selectOK = false;
            var _f = xOrig - other.CART_WIDTH;
            repeat (other.CART_COLS - 1)
            {
                var _cartLeft = instance_place(_f, y, oIcon);
                if (instance_exists(_cartLeft))
                {
                    if (!_cartLeft.excluded)
                    {
                        global.selGame = _cartLeft.iconID;
                        _selectOK = true;
                    }
                }
                if (_selectOK)
                {
                    break;
                }
                else
                {
                    _f = _f - (other.CART_WIDTH * 0.5);
                }
                if (_f < 0)
                {
                    _f = other.CART_OFFX + ((other.CART_COLS - 1) * other.CART_WIDTH);
                }
            }
            if (_selectOK)
            {
                break;
            }
        }
        selCart = scrSelectCart(global.selGame);
    }
    else if (_navigateRight)
    {
        with (selCart)
        {
            var _selectOK = false;
            var _f = xOrig + other.CART_WIDTH;
            repeat (other.CART_COLS - 1)
            {
                var _cartRight = instance_place(_f, y, oIcon);
                if (instance_exists(_cartRight))
                {
                    if (!_cartRight.excluded)
                    {
                        global.selGame = _cartRight.iconID;
                        _selectOK = true;
                    }
                }
                if (_selectOK)
                {
                    break;
                }
                else
                {
                    _f = (_f + (other.CART_WIDTH * 0.5)) % 384;
                }
            }
            if (_selectOK)
            {
                break;
            }
        }
        selCart = scrSelectCart(global.selGame);
    }
    if (selCart != _selCartPrev)
    {
        scrSfxLibrary(soundGameNavi);
    }
    if ((joystickDir == 0 && joyTiltAny[0]) || joyTiltAny[1])
    {
        if (holdRight)
        {
            joystickDir = 1;
        }
        else if (holdUp)
        {
            joystickDir = 2;
        }
        else if (holdLeft)
        {
            joystickDir = 3;
        }
        else if (holdDown)
        {
            joystickDir = 4;
        }
    }
    if (fire1pressed)
    {
        scrSfxLibrary(soundInspectOpen);
        event_user(14);
        scrSwitchSub(SUB_GAME_INSPECT);
        currPage = 0;
        currSubPage = 0;
        arrowCounter = 0;
    }
    else if (fire2pressed && has_item(global.mGameID[global.selGame]))
    {
        scrSwitchSub(SUB_GAME_CHOSEN);
    }
}
else if (substate == SUB_GAME_INSPECT)
{
    if (tPageCycleLeft > 0)
    {
        tPageCycleLeft--;
    }
    if (tPageCycleRight > 0)
    {
        tPageCycleRight--;
    }
    stateCounter = approach(stateCounter, 1, 0.2);
    if (stateCounter < 1)
    {
        exit;
    }
    if (fire2pressed && !global.arcadeCabinetMode)
    {
        favs[global.selGame] = !favs[global.selGame];
        with (oFxDummy)
        {
            instance_destroy();
        }
        var _x = 180;
        var _y = 209;
        if (favs[global.selGame])
        {
            scrSfxLibrary(soundFavoriteSet);
            for (var i = -1; i < 2; i++)
            {
                var _dir = 90 + (i * 65);
                var _xx = _x + lengthdir_x(6, _dir);
                var _yy = _y + lengthdir_y(6, _dir);
                var _fx = scrFX(sFX_StarRotate, 0.5, _xx, _yy);
                _fx.direction = _dir;
                _fx.speed = 2;
                _fx.friction = 0.2;
            }
        }
        else
        {
            scrSfxLibrary(soundFavoriteClear);
            var _fx = scrFX(sFX_StarRotate, 0.5, _x, _y);
            _fx.image_index = 3;
        }
        scrOpenCurrFile();
        scrWriteReal("favorite" + string(global.mGameID[global.selGame]), favs[global.selGame]);
        scrCloseCurrFile();
    }
    if (infoBuddyIdleCount < (infoBuddyIdleCountMax + infoBuddyIdleAnimLen))
    {
        infoBuddyIdleCount++;
    }
    else
    {
        infoBuddyIdleCount = 0;
    }
    if (pressLeft)
    {
        scrSfxLibrary(soundInspectNavi);
        currSubPage = 0;
        tPageCycleLeft = 3;
        tPageCycleRight = 0;
        do
        {
            currPage--;
            if (currPage < 0)
            {
                currPage = array_length(hasPage) - 1;
            }
        }
        until (hasPage[currPage]);
        infoBuddyIdleCount = 0;
    }
    else if (pressRight)
    {
        scrSfxLibrary(soundInspectNavi);
        currSubPage = 0;
        tPageCycleLeft = 0;
        tPageCycleRight = 3;
        do
        {
            currPage++;
            if (currPage >= array_length(hasPage))
            {
                currPage = 0;
            }
        }
        until (hasPage[currPage]);
        infoBuddyIdleCount = 0;
    }
    else if (pressDown && numSubPages[currPage] > 1)
    {
        currSubPage++;
        if (currSubPage == numSubPages[currPage])
        {
            currSubPage = 0;
        }
        arrowCounter = 4;
    }
    else if (pressUp && numSubPages[currPage] > 1)
    {
        currSubPage--;
        if (currSubPage < 0)
        {
            currSubPage = numSubPages[currPage] - 1;
        }
        arrowCounter = -4;
    }
    arrowCounter = approach(arrowCounter, 0, 1);
    if (fire1pressed)
    {
        scrSfxLibrary(soundInspectClose);
        scrSwitchSub(SUB_NAV);
    }
}
else if (substate == SUB_SORT_SELECT)
{
    stateCounter++;
    with (oIcon)
    {
        selected = false;
    }
    var _numFavs = 0;
    for (var i = 1; i <= global.NUM_GAMES; i++)
    {
        _numFavs += favs[i];
    }
    if (pressUp || pressDown)
    {
        var _canExit = true;
        if (global.selSort == global.SORT_PET)
        {
            _canExit = false;
        }
        if (global.selSort == global.SORT_FAVORITE && _numFavs == 0)
        {
            _canExit = false;
        }
        if (_canExit)
        {
            var _ok = false;
            with (oIcon)
            {
                if (state == 0)
                {
                    _ok = true;
                }
            }
            if (_ok)
            {
                scrSfxLibrary(soundGameNavi);
                var gotoX = oldCartX;
                var gotoY;
                if (pressUp)
                {
                    gotoY = CART_OFFY + (CART_WIDTH * (CART_ROWS - 1));
                }
                else
                {
                    gotoY = CART_OFFY;
                }
                var closestDistance = 999999;
                with (oIcon)
                {
                    if (!excluded)
                    {
                        var dist = point_distance(gotoX, gotoY, xOrig, yOrig);
                        if (dist < closestDistance)
                        {
                            closestDistance = dist;
                            global.selGame = iconID;
                        }
                    }
                }
                infoBarFlip = 0;
                scrSwitchSub(SUB_NAV);
            }
        }
    }
    if ((pressLeft || pressRight) && global.all50 == 0)
    {
        infoBarFlip = -1;
        scrSfxLibrary(soundFilterNavi);
        stateCounter = 0;
        if (global.selSort != 0)
        {
            global.selSort = 0;
        }
        else
        {
            global.selSort = global.SORT_TOTAL - 1;
        }
        if (global.selSort == global.SORT_MULTIPLAYER)
        {
            global.multStyle = 0;
        }
        scrSwitchSub(SUB_SORT_PERFORM);
    }
    if (fire2pressed && global.all50 == 0)
    {
        if (global.selSort == global.SORT_MULTIPLAYER)
        {
            scrSfxLibrary(soundFilterSubNavi);
            global.multStyle++;
            if (global.multStyle > 2)
            {
                global.multStyle = 0;
            }
            scrSwitchSub(SUB_SORT_PERFORM);
        }
        if (global.selSort == global.SORT_RANDOM)
        {
            scrSfxLibrary(soundFilterRandomize);
            global.randSortLocked = false;
            scrSwitchSub(SUB_SORT_PERFORM);
        }
        if (global.selSort == global.SORT_PET)
        {
            scrSfxLibrary(soundGardenListOpen);
            scrSwitchSub(SUB_PET_COLLECTION);
        }
        if (global.goldWins == 50)
        {
            scrSfxLibrary(soundFilterSubNavi);
            if (global.selSort == global.SORT_PROGRESS)
            {
                scrSwitchSub(SUB_PROGRESS_STATS);
            }
        }
    }
    if (fire1pressed && global.selSort != global.sortDefault && global.all50 == 0)
    {
        scrSfxLibrary(soundFilterDefault);
        global.selSort = global.sortDefault;
        scrSwitchSub(SUB_SORT_PERFORM);
    }
}
else if (substate == SUB_SORT_PERFORM)
{
    var _sortMethod = global.selSort;
    var _selPillar = global.selSort - global.SORT_PILLAR_START;
    if (_sortMethod != global.SORT_PET)
    {
        scrPetMakeVisible(false);
        with (oIcon)
        {
            visible = true;
        }
        with (oIcon)
        {
            gameID = global.mGameID[iconID];
            excluded = !global.included_games[gameID];
            if (!excluded)
            {
                if (is_location_collected_manual(gameID, 998))
                {
                    other.winStatus[iconID] = 1;
                }
                if (is_location_collected_manual(gameID, 999))
                {
                    other.winStatus[iconID] = 2;
                }
                winStatus = other.winStatus[iconID];
                if (other.gardenStatus[iconID] > 0)
                {
                    collect_location_manual(gameID, 997);
                }
                if (other.winStatus[iconID] > 0)
                {
                    collect_location_manual(gameID, 998);
                }
                if (other.winStatus[iconID] > 1)
                {
                    collect_location_manual(gameID, 999);
                }
            }
        }
        check_victory();
        ds_map_clear(sortMap);
        ds_list_clear(sortCategory);
        var _ascending = true;
        with (oIcon)
        {
            var _index = iconID;
            var _name = global.mGameTitle[iconID];
            if (!other.gameExists[iconID])
            {
                _name = "ZZZZZZZZZZZZZZ";
            }
            var _progress = other.winStatus[iconID];
            if (!other.played[iconID])
            {
                _progress = -1;
            }
            if (!other.gameExists[iconID])
            {
                _progress = 3;
            }
            if (other.gardenStatus[iconID] > 0)
            {
                _progress += 0.5;
            }
            var _playtime = other.totalPlaytime[iconID];
            var _excludedFactor = 0;
            if (excluded)
            {
                _excludedFactor = 1000;
            }
            var _listPos = _index + _excludedFactor;
            if (_sortMethod == global.SORT_NAME)
            {
                if (_name == "CAMPANELLA" || _name == "MORTOL")
                {
                    _listPos = _name + "   " + string(iconID);
                }
                else
                {
                    _listPos = _name + string(iconID);
                }
            }
            if (_sortMethod == global.SORT_PROGRESS)
            {
                _listPos = _progress + (iconID / 100);
            }
            if (_sortMethod == global.SORT_PLAYTIME)
            {
                _listPos = _playtime + (iconID / 100);
                _ascending = false;
            }
            if (_sortMethod == global.SORT_RANDOM && global.randSortLocked)
            {
                _listPos = global.randSortOrder[iconID - 1];
            }
            ds_map_add(other.sortMap, _listPos, id);
            ds_list_add(other.sortCategory, _listPos);
        }
        ds_list_sort(sortCategory, _ascending);
        if (_sortMethod == global.SORT_RANDOM)
        {
            if (!global.randSortLocked)
            {
                scrOpenCurrFile();
                scrShuffle(sortCategory);
                var _rsoID = 0;
                for (var i = 0; i < global.NUM_LIBRARY_GAMES; i++)
                {
                    _rsoID = ds_list_find_value(sortCategory, i) - 1;
                    global.randSortOrder[_rsoID] = i;
                    scrWriteReal("randSortOrder" + string(_rsoID), i);
                }
                global.randSortLocked = true;
                scrWriteReal("randSortLocked", global.randSortLocked);
                scrCloseCurrFile();
            }
        }
        for (var i = 0; i < ds_list_size(sortCategory); i++)
        {
            var tempCart = ds_map_find_value(sortMap, ds_list_find_value(sortCategory, i));
            if (instance_exists(tempCart))
            {
                tempCart.xOrig = CART_OFFX + ((i % CART_COLS) * CART_WIDTH);
                tempCart.yOrig = CART_OFFY + ((i div CART_COLS) * CART_HEIGHT);
                tempCart.x = tempCart.xOrig;
                tempCart.y = tempCart.yOrig - 6 - ((i % (CART_COLS * 2)) * 0.3) - ((i % 2) * 3);
                if (subPrev != SUB_SORT_SELECT)
                {
                    tempCart.y = tempCart.yOrig;
                }
                tempCart.depth = room_height - tempCart.yOrig;
            }
        }
        if (subPrev == SUB_INIT)
        {
            if (statePrev == STATE_PROFILE)
            {
                scrSwitchSub(SUB_GAME_SLIDE_START);
            }
            else
            {
                scrSwitchSub(SUB_NAV);
            }
        }
        else
        {
            scrSwitchSub(SUB_SORT_SELECT);
        }
    }
    else if (_sortMethod == global.SORT_PET)
    {
        if (statePrev == STATE_PROFILE)
        {
            global.selGame = 1;
            selCart = scrSelectCart(global.selGame);
            oldCartX = selCart.xOrig;
        }
        with (oIcon)
        {
            visible = false;
        }
        scrPetMakeVisible(true);
        scrSwitchSub(SUB_SORT_SELECT);
    }
}
else if (substate == SUB_PET_COLLECTION)
{
    var _petItemSelXPrev = petItemSelX;
    var _petItemSelYPrev = petItemSelY;
    if (pressLeft)
    {
        petItemSelX--;
    }
    else if (pressRight)
    {
        petItemSelX++;
    }
    if (pressUp)
    {
        petItemSelY--;
    }
    else if (pressDown)
    {
        petItemSelY++;
    }
    petItemSelX = scrWrap(petItemSelX, 10);
    petItemSelY = scrWrap(petItemSelY, 5);
    if (petItemSelX != _petItemSelXPrev || petItemSelY != _petItemSelYPrev)
    {
        scrSfxLibrary(soundGardenListNavi[scrIRandom(2)]);
    }
    if (fire1pressed || fire2pressed)
    {
        scrSfxLibrary(soundGardenListClose);
        scrSwitchSub(SUB_SORT_SELECT);
    }
}
else if (substate == SUB_PROGRESS_STATS)
{
    if (fire1pressed)
    {
        global.selSort = global.sortDefault;
        scrSwitchSub(SUB_SORT_PERFORM);
    }
    else if (fire2pressed)
    {
        scrSwitchSub(SUB_SORT_SELECT);
    }
}
else if (substate == SUB_GAME_CHOSEN)
{
    if (!gameExists[global.selGame])
    {
        scrSwitchSub(SUB_NAV);
        exit;
    }
    with (oIcon)
        visible = false;
    with (selCart)
        visible = true;
    var _gamePlayed = played[global.selGame];
    var _bgmFadeTime = 400;

    scrSfxLibrary(soundCartSelect);

    with (selCart)
        state = 1;

    scrSwitchSub(SUB_GAME_OPEN);

    var _gameID = global.mGameID[global.selGame];
    load_datagroup(_gameID, true, true);

    with (oAudioHandler)
    {
        if (libraryBgmPlaying)
        {
            if (audio_is_playing(bgmLibraryNormal))
                audio_sound_gain(bgmLibraryNormal, 0, _bgmFadeTime);
            if (audio_is_playing(bgmLibraryGarden))
                audio_sound_gain(bgmLibraryGarden, 0, _bgmFadeTime);
            if (audio_is_playing(bgmLibraryInfinity))
                audio_sound_gain(bgmLibraryInfinity, 0, _bgmFadeTime);
            libraryBgmPlaying = false;
        }
    }
}
else if (substate == SUB_GAME_DUST_OFF)
{
    if (stateCounter == 0)
    {
        scrSfxLibrary(soundCartFocus);
        with (selCart)
            state = 2;
        stateCounter++;
    }
    var _animationDone = false;
    with (selCart)
    {
        if (state == 3)
            _animationDone = true;
    }
    if (_animationDone)
    {
        scrSwitchSub(SUB_GAME_OPEN);
        stateCounter = 999;
    }
}
else if (substate == SUB_GAME_OPEN)
{
    stateCounter++;
    if (stateCounter >= 50)
    {
        with (oAudioHandler)
        {
            if (audio_is_playing(bgmLibraryNormal))
                audio_stop_sound(bgmLibraryNormal);
            if (audio_is_playing(bgmLibraryGarden))
                audio_stop_sound(bgmLibraryGarden);
            if (audio_is_playing(bgmLibraryInfinity))
                audio_stop_sound(bgmLibraryInfinity);
        }
        if (scrPlayGame(global.selGame))
        {
            exit;
        }
        else
        {
            scrSwitchState(STATE_GAMES);
            exit;
        }
    }
}
else if (substate == SUB_GAME_SLIDE_START)
{
    global.selGame = false;
    selCart = -4;
    with (oIcon)
        selected = false;
    with (oIcon)
    {
        if (yOrig == (other.CART_OFFY + (0 * other.CART_HEIGHT)))
            x = xOrig - 384;
        if (yOrig == (other.CART_OFFY + (1 * other.CART_HEIGHT)))
            x = xOrig + 384;
        if (yOrig == (other.CART_OFFY + (2 * other.CART_HEIGHT)))
            x = xOrig - 384;
        if (yOrig == (other.CART_OFFY + (3 * other.CART_HEIGHT)))
            x = xOrig + 384;
        if (yOrig == (other.CART_OFFY + (4 * other.CART_HEIGHT)))
            x = xOrig - 384;
    }
    scrSwitchSub(SUB_GAME_SLIDE);
}
else if (substate == SUB_GAME_SLIDE)
{
    with (instance_nearest(-384, 0, oIcon))
    {
        if (round(x) == xOrig)
            global.selGame = iconID;
    }
    if (global.selGame)
    {
        infoBarFlip = 0;
        selCart = scrSelectCart(global.selGame);
        scrSwitchSub(SUB_NAV);
    }
}