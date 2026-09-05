SUB_INIT = 0;
SUB_CLEANUP = 1;
SUB_LOAD = 2;
SUB_DELETE = 3;
SUB_DELETING = 4;
SUB_DELETE_FX = 5;
SUB_CONFIRM_DELETE = 6;
SUB_COPY_FROM = 7;
SUB_COPY_TO = 8;
SUB_COPYING = 9;
SUB_CONFIRM_OVERWRITE = 10;
SUB_COPY_FX = 11;
if (substate != SUB_INIT)
{
    parallaxCounter += PARALLAX_SPEED;
}
if (substate == SUB_INIT)
{
    if (statePrev == STATE_GAMES)
    {
        parallaxCounter = 0;
    }
    scrCloseProfile();
    with (oIcon)
    {
        instance_destroy();
    }
    global.drawLibraryBG = false;
    for (var i = 1; i <= global.NUM_PROFILES_ACCESSIBLE; i++)
    {
        scrOpenFileManual(i);
        profileName[i] = scrReadString("profileName", scrStringVal("prof_name_default", i));
        timePlayed[i] = scrReadReal("timeSum", 0);
        if (timePlayed[i] > 0)
        {
            fileExists[i] = true;
        }
        else
        {
            fileExists[i] = false;
        }
        libBG[i] = scrReadReal("libraryBG", 0);
        goldWins[i] = 0;
        cherryWins[i] = 0;
        gardenWins[i] = 0;
        var winStatus = 0;
        for (var j = 1; j <= global.NUM_GAMES; j++)
        {
            winStatus = scrReadReal("gameWin" + string(global.mGameID[j]), 0);
            if (winStatus >= global.GOLD_WIN)
            {
                goldWins[i]++;
            }
            if (winStatus == global.CHERRY_WIN)
            {
                cherryWins[i]++;
            }
            winStatus = scrReadReal("gardenWin" + string(global.mGameID[j]), 0);
            if (winStatus > 0)
            {
                gardenWins[i]++;
            }
        }
        scrCloseCurrFile();
    }
    menuSel = profileSelFinal;
    menuSelOrig = 0;
    if (subPrev == SUB_COPYING)
    {
        scrSwitchSub(SUB_COPY_FX);
    }
    if (subPrev == SUB_DELETING)
    {
        scrSwitchSub(SUB_DELETE_FX);
    }
    else
    {
        scrSwitchSub(SUB_CLEANUP);
    }
}
else if (substate == SUB_CLEANUP)
{
    if (stateCounter++ >= 2)
    {
        scrPetCleanup();
        scrSwitchSub(SUB_LOAD);
    }
}
else if (substate == SUB_LOAD)
{
    menuSelBot = global.NUM_PROFILES_ACCESSIBLE;
    var _startSel = menuSel;
    menuSel = scrVertNav(menuSel, menuSelBot);
    if (menuSel != _startSel)
    {
        scrSfxLibrary(soundProfileNavi);
    }
    if (fire2pressed)
    {
        keyboard_string = "";
        backspace_frames = 0;
        backspace_started = 0;
        backspace_hit = 0;
        if (menuSel == 0)
        {
            scrSfxLibrary(soundProfileArm);
            scrInputClear();
            substate = SUB_SERVER_INPUT;
            input_string = global.ap_server;
        }
        if (menuSel == 1)
        {
            scrSfxLibrary(soundProfileArm);
            scrInputClear();
            substate = SUB_PLAYER_INPUT;
            input_string = global.ap_player;
        }
        if (menuSel == 2)
        {
            scrSfxLibrary(soundProfileArm);
            scrInputClear();
            substate = SUB_PASSWORD_INPUT;
            input_string = global.ap_password;
        }
        else if (menuSel == global.NUM_PROFILES_ACCESSIBLE)
        {
            scrSfxLibrary(soundProfileCopyConfirm);
            global.ap_connecting = 2;
            global.ap_connected = false;
            apclient_set_items_handling(7);
            apclient_set_version(0, 5, 0);
            apclient_connect("", "UFO 50", global.ap_server);
            scrSwitchSub(SUB_CONNECTING);
        }
    }
    else if (fire1pressed)
    {
        scrSfxLibrary(soundProfileCancel);
        profileSelFinal = 0;
        scrSwitchState(STATE_LOGO);
    }
}
else if (substate == SUB_CONNECTING)
{
    if (global.ap_connecting <= 0 || fire1pressed)
    {
        scrSfxLibrary(soundProfileCancel);
        scrInputClear();
        substate = SUB_LOAD;
        apclient_disconnect();
    }
    if (global.ap_connected)
    {
        scrSfxLibrary(soundProfileLoad);
        menuSel = 0;
        if (scrLoadProfile(menuSel + 1))
        {
            global.goldWins = goldWins[menuSel + 1];
            global.cherryWins = cherryWins[menuSel + 1];
            global.gardenWins = gardenWins[menuSel + 1];
            trace("GOLD/CHERRY WINS:", global.goldWins, global.cherryWins);
            global.currFile = menuSel + 1;
            profileSelFinal = 0;
            scrSwitchState(STATE_GAMES);
        }
    }
}
else if (substate == SUB_CONNECTION_FAILED)
{
    scrSfxLibrary(soundProfileDeleteConfirm);
    scrInputClear();
    substate = SUB_LOAD;
}
else if (substate == SUB_SERVER_INPUT || substate == SUB_PLAYER_INPUT || substate == SUB_PASSWORD_INPUT)
{
    if (keyboard_check_pressed(8))
    {
        backspace_frames = 0;
        backspace_started = 0;
        backspace_hit = 1;
    }
    if (keyboard_check(8))
    {
        backspace_frames++;
        if (backspace_started && backspace_frames > 12)
        {
            backspace_hit = 1;
        }
        else if (backspace_frames > 18)
        {
            backspace_started = 1;
            backspace_hit = 1;
        }
    }
    else
    {
        backspace_frames = 0;
        backspace_started = 0;
    }
    if (backspace_hit)
    {
        scrSfxLibrary(soundProfileCancel);
        backspace_hit = 0;
        input_string = string_delete(input_string, string_length(input_string), 1);
    }
    if (string_length(keyboard_string) > 0)
    {
        scrSfxLibrary(soundProfileNavi);
        new_char = string_char_at(keyboard_string, string_length(keyboard_string));
        input_string += new_char;
    }
    if (substate == SUB_SERVER_INPUT)
    {
        global.ap_server = input_string;
    }
    else if (substate == SUB_PLAYER_INPUT)
    {
        global.ap_player = input_string;
    }
    else if (substate == SUB_PASSWORD_INPUT)
    {
        global.ap_password = input_string;
    }
    if (keyboard_check_pressed(13))
    {
        scrSfxLibrary(soundProfileCopyConfirm);
        scrInputClear();
        substate = SUB_LOAD;
    }
    keyboard_string = "";
}
