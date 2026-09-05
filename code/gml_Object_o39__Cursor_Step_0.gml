if (!verify(oGame))
{
    exit;
}
if (!verify(o39__Game))
{
    exit;
}
if (!canCheck)
{
    canCheck = true;
    exit;
}
invx = camera_get_view_x(view_get_camera(0)) + 40;
invy = camera_get_view_y(view_get_camera(0)) + 152;
if (o39__Game.state == STATE_TEXT || o39__Game.state == STATE_TEXT_USE_ITEM || o39__Game.state == STATE_TENSION_TRANSITION || o39__Game.state == STATE_DEAD || o39__Game.state == STATE_TEXT_YESNO || o39__Game.state == STATE_TEXT_YESNO_SELECT || o39__Game.state == STATE_AUDIO_STINGER_WAIT || o39__Game.state == STATE_FADEIN_TRANSITION || o39__Game.state == STATE_ENDING_STATS_TO_CREDITS || o39__Game.state == STATE_TENSION_GAME || o39__Game.state == STATE_TENSION_GAME2 || o39__Game.state == STATE_TENSION_GAME3 || o39__Game.state == STATE_INTRO || o39__Game.state == STATE_WARNING || o39__Game.tensionState != 0 || o39__Game.currRoom >= ROOM_ENDING1 || oGame.fadeOut || oGame.fadeIn || instance_exists(o39_aKillerDie))
{
    visible = false;
    exit;
}
else
{
    visible = true;
}
scrGetInput(0);
accelerate = false;
if (holdUp)
{
    currSpeed = approach(currSpeed, speedMax, acc);
    yVel -= currSpeed;
    accelerate = true;
}
else if (holdDown)
{
    currSpeed = approach(currSpeed, speedMax, acc);
    yVel += currSpeed;
    accelerate = true;
}
if (holdLeft)
{
    currSpeed = approach(currSpeed, speedMax, acc);
    xVel -= currSpeed;
    accelerate = true;
}
else if (holdRight)
{
    currSpeed = approach(currSpeed, speedMax, acc);
    xVel += currSpeed;
    accelerate = true;
}
if (!accelerate)
{
    currSpeed = 0;
    if (!instance_exists(o39_aKiller))
    {
        xVel = 0;
        yVel = 0;
    }
}
if (abs(xVel) < 0.2)
{
    xVel = 0;
    x = round(x);
}
if (abs(yVel) < 0.2)
{
    yVel = 0;
    y = round(y);
}
if ((sqr(xVel) + sqr(yVel)) > sqr(currSpeed))
{
    xVel *= sqrt(0.5);
    yVel *= sqrt(0.5);
}
x += xVel;
y += yVel;
if (x > ((camera_get_view_x(view_get_camera(0)) + __view_get(UnknownEnum.Value_2, 0)) - 16))
{
    x = (camera_get_view_x(view_get_camera(0)) + __view_get(UnknownEnum.Value_2, 0)) - 16;
    xVel = 0;
}
if (x < camera_get_view_x(view_get_camera(0)))
{
    x = camera_get_view_x(view_get_camera(0));
    xVel = 0;
}
if (y > ((camera_get_view_y(view_get_camera(0)) + __view_get(UnknownEnum.Value_3, 0)) - 16))
{
    y = (camera_get_view_y(view_get_camera(0)) + __view_get(UnknownEnum.Value_3, 0)) - 16;
    yVel = 0;
}
if (y < camera_get_view_y(view_get_camera(0)))
{
    y = camera_get_view_y(view_get_camera(0));
    yVel = 0;
}
var overExit = scr39_CursorMoveCheck();
if (fire1pressed)
{
    if (o39__Game.state == STATE_NORMAL)
    {
        if (overExit)
        {
            if (state == CURSOR_STATE_LOOK)
            {
                state = CURSOR_STATE_MOVE;
            }
            else if (state == CURSOR_STATE_MOVE)
            {
                state = CURSOR_STATE_LOOK;
            }
        }
        else if (state == CURSOR_STATE_LOOK)
        {
            state = CURSOR_STATE_USE;
        }
        else if (state == CURSOR_STATE_USE)
        {
            state = CURSOR_STATE_LOOK;
        }
    }
    else if (o39__Game.state == STATE_TEXT_USE_ITEM_ON)
    {
        scrSfx(o39__Game.soundItemDeselect, 10);
        o39__Game.state = STATE_NORMAL;
    }
}
if (overExit)
{
    if (state == CURSOR_STATE_USE)
    {
        prevState = state;
        state = CURSOR_STATE_MOVE;
    }
}
else if (state == CURSOR_STATE_MOVE)
{
    state = CURSOR_STATE_USE;
}
if (canCheck)
{
    for (i = 0; i < 70; i++)
    {
        if (!o39__Game.receivedItems[i] && has_item(i))
        {
            night_manor_give_object(i);
            exit;
        }
    }
}
if (fire2pressed)
{
    xVel = 0;
    yVel = 0;
    if (canCheck)
    {
        if (o39__Game.state == STATE_NORMAL)
        {
            if (o39__Game.currRoom == ROOM_JOURNAL)
            {
                scrSfx(o39__Game.soundTransitionZoom, 30);
                o39__Game.lastRoom = ROOM_JOURNAL;
                o39__Game.nextRoom = o39__Game.roomJournal;
                if (!oGame.fadeOut)
                {
                    oGame.fadeOut = true;
                    o39__Game.state = 99;
                }
                canCheck = false;
            }
            else if (y > invy)
            {
                scr39_CursorInv();
            }
            else if (state == CURSOR_STATE_LOOK)
            {
                scr39_CursorLook();
            }
            else if (state == CURSOR_STATE_USE)
            {
                scr39_CursorMove(1);
            }
            else if (state == CURSOR_STATE_MOVE)
            {
                scr39_CursorMove(0);
            }
        }
        else if (o39__Game.state == STATE_TEXT_USE_ITEM_ON)
        {
            if (y > invy)
            {
                scr39_CursorUseOnInv();
            }
            else
            {
                scr39_CursorUseOn();
            }
        }
    }
    else
    {
        canCheck = true;
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_3
}
