function scr39_CursorUse()
{
    if (!verify(oGame))
    {
        exit;
    }
    if (!verify(o39__Game))
    {
        exit;
    }
    obj = instance_position(x, y, o39__ActiveObject);
    o39__Game.state = o39__Game.STATE_TEXT;
    if (verify(o39_aKiller))
    {
        if (verify(obj))
        {
            if (obj == o39_aKiller)
            {
                if (o39__Game.killerGuard)
                {
                    o39__Game.killerTime = 1;
                }
                else
                {
                    o39__Game.killerTime = max(0, o39__Game.killerTime - 2);
                }
                if (o39__Game.killerTime < 1)
                {
                    o39__Game.killerTime = 1;
                }
                if (o39__Game.killerTime > 1)
                {
                    scr39_SplitString(scrStringExt("use_killer_1", 0, 0, 0));
                    o39__Game.killerGuard = true;
                }
                else
                {
                    scr39_SplitString(scrStringExt("use_killer_2", 0, 0, 0));
                }
            }
            else if (obj.name == "THE GATE" || obj.name == "THE CHAIR" || (obj.name == "THE TRAPDOOR" && obj.open == ITEM_CLOSED))
            {
                if (o39__Game.killerRoom == o39__Game.currRoom)
                {
                    scr39_SplitString(scrStringVal("default_killer_obstacle_1", scr39_ItemGetName(obj.name)));
                }
                else
                {
                    scr39_SplitString(scrStringVal("default_killer_obstacle_2", scr39_ItemGetName(obj.name)));
                    if (o39__Game.killerTime > 9)
                    {
                        o39__Game.killerTime = 9;
                    }
                    o39__Game.killerCount = 0;
                    o39__Game.dontDrawInventory = true;
                }
            }
            else if (obj.name == "THE DARKNESS")
            {
                scr39_SplitString(scrString("move_darkness"));
            }
            else
            {
                scr39_SplitString(strKillerOnScreen);
            }
        }
        else
        {
            scr39_SplitString(strKillerOnScreen);
        }
    }
    else if (verify(obj))
    {
        var _journal7 = instance_position(x, y, o39_aJournal07);
        var _musicBox = instance_position(x, y, o39_aMusicBox);
        if (verify(_journal7))
        {
            scrSfx(o39__Game.soundItemTake, 50);
            scr39_SplitString(scrStringVal("take_default", scr39_ItemGetName(_journal7.name)));
            scr39_TakeObject(_journal7.name);
            with (_journal7)
            {
                instance_destroy();
            }
        }
        else if (verify(_musicBox))
        {
            if (_musicBox.open == ITEM_OPEN)
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
            else
            {
                scr39_SplitString(scrString("use_music_box"));
            }
        }
        else if (obj.canTake)
        {
            if (o39__Game.currRoom == ROOM_KITCHEN && o39__Game.killerMeet == 0)
            {
                if (obj.name == "THE KNIFE")
                {
                    scrSfx(o39__Game.soundItemTake, 50);
                    o39__Game.bgmScene[10] = bgm39_interior;
                    scr39_SplitString(scrString("use_knife"));
                    o39__Game.killerActive = true;
                    o39__Game.killerMeet = 1;
                    o39__Game.killerCount = 0;
                    o39__Game.killerTime = 9;
                    o39__Game.dontDrawInventory = true;
                    o39__Game.insanity += 1;
                }
                else
                {
                    scr39_SplitString(strKillerKitchen);
                }
            }
            else
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrStringVal("take_default", scr39_ItemGetName(obj.name)));
                if (obj.name == "THE ARROW")
                {
                    if (o39__Game.killerMeet < 3)
                    {
                        o39__Game.killerMeet = 3;
                    }
                    scr39_TakeObject("THE CROSSBOW BOLT");
                }
                else
                {
                    scr39_TakeObject(obj.name);
                }
                with (obj)
                {
                    instance_destroy();
                }
            }
        }
        else if (obj.name == "THE OPEN VENT")
        {
            if (obj.state == 0)
            {
                scrSfx(o39__Game.soundNoteCrumble, 50);
                scr39_SplitString(scrString("use_vent_open"));
                with (obj)
                {
                    state = 1;
                }
                scr39_TakeObjectNoSave("THE NOTE");
                scr39_TakeObject("THE HAIRPIN");
            }
            else
            {
                scr39_SplitString(scrString("look_paper_2"));
            }
        }
        else if (obj.name == "THE COUCH")
        {
            if (obj.visible)
            {
                scrSfx(o39__Game.soundCushion, 50);
                scr39_SplitString(scrString("use_couch"));
                with (o39_aCouch)
                {
                    visible = false;
                }
                scr39_TakeObject("THE COINS");
            }
            else
            {
                scr39_SplitString(scrString("use_couch_empty"));
            }
        }
        else if (obj.name == "THE FIGURE")
        {
            scrSfx(o39__Game.soundShoulderTap, 50);
            o39__Game.bgmScene[10] = bgm39_interior;
            scr39_SplitString(scrString("use_figure"));
            o39__Game.killerActive = true;
            o39__Game.killerMeet = 1;
            o39__Game.killerCount = 0;
            o39__Game.killerTime = 9;
            o39__Game.dontDrawInventory = true;
            o39__Game.insanity += 1;
        }
        else if (obj.name == "THE KITCHEN SINK CABINET")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else if (instance_exists(o39_aKiller))
            {
                scr39_SplitString(strKillerOnScreen);
            }
            else
            {
                scrSfx(o39__Game.soundOpenDoor, 50);
                scr39_SplitString(scrString("use_kitchen_under_sink"));
                with (o39_aCabKitchen)
                {
                    instance_destroy();
                }
                scr39_TakeObject("THE DRAIN CLEANER");
            }
        }
        else if (obj.name == "THE REFRIGERATOR")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                if (y < (obj.y + 38))
                {
                    scr39_SplitString(scrString("use_freezer"));
                    with (o39_aRefrigerator)
                    {
                        open = 3;
                    }
                }
                else
                {
                    scr39_SplitString(scrString("use_refrigerator"));
                    with (o39_aRefrigerator)
                    {
                        if (o39__Game.insanity > 3 && state == 1)
                        {
                            roll = floor(scrRandom(probability / o39__Game.insanity));
                            if (roll == 1)
                            {
                                open = 2;
                                state = 2;
                            }
                            else
                            {
                                open = ITEM_OPEN;
                                if (probability > (limit + o39__Game.insanity))
                                {
                                    probability -= o39__Game.insanity;
                                }
                            }
                        }
                        else
                        {
                            open = ITEM_OPEN;
                            if (state == 0)
                            {
                                state = 1;
                            }
                        }
                    }
                }
            }
        }
        else if (obj.name == "THE KITCHEN CABINETS ON THE LEFT")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else
            {
                scr39_SplitString(scrString("use_kitchen_cabinets"));
                if (o39_aCabKitchenL.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundOpenDrawer, 50);
                    with (o39_aCabKitchenL)
                    {
                        open = ITEM_OPEN;
                    }
                }
            }
        }
        else if (obj.name == "THE KITCHEN CABINETS ON THE RIGHT")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else
            {
                scr39_SplitString(scrString("use_kitchen_cabinets"));
                if (o39_aCabKitchenR.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundOpenDrawer, 50);
                    with (o39_aCabKitchenR)
                    {
                        open = ITEM_OPEN;
                    }
                }
            }
        }
        else if (obj.name == "THE RANGE")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else if (o39_aRange.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_range"));
                with (o39_aRange)
                {
                    open = ITEM_OPEN;
                }
            }
            else
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_range_close"));
                with (o39_aRange)
                {
                    open = ITEM_CLOSED;
                }
            }
        }
        else if (obj.name == "THE DISHWASHER")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else if (o39_aDishwasher.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_dishwasher"));
                with (o39_aDishwasher)
                {
                    open = ITEM_OPEN;
                }
            }
            else
            {
                scr39_SplitString(scrString("use_dishwasher_open"));
            }
        }
        else if (obj.name == "THE KITCHEN DRAWERS")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else
            {
                scr39_SplitString(scrString("use_kitchen_drawers"));
                if (o39_aDrawerKitch.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundOpenDrawer, 50);
                    with (o39_aDrawerKitch)
                    {
                        open = ITEM_OPEN;
                    }
                }
            }
        }
        else if (obj.name == "THE CABINETS LEFT OF THE WINDOW")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else
            {
                scr39_SplitString(scrString("use_kitchen_cabinets"));
                if (o39_aCabSinkL.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundOpenDrawer, 50);
                    with (o39_aCabSinkL)
                    {
                        open = ITEM_OPEN;
                    }
                }
            }
        }
        else if (obj.name == "THE CABINETS RIGHT OF THE WINDOW")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else
            {
                scr39_SplitString(scrString("use_kitchen_cabinets"));
                if (o39_aCabSinkR.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundOpenDrawer, 50);
                    with (o39_aCabSinkR)
                    {
                        open = ITEM_OPEN;
                    }
                }
            }
        }
        else if (obj.name == "THE PLAY TABLE")
        {
            scr39_SplitString(scrString("use_play_table"));
            if (o39_aToyBox.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aToyBox)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE SMALL DRESSER ON THE LEFT")
        {
            scr39_SplitString(scrString("use_childrens_dresser"));
            if (o39_aKidDrawerL.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aKidDrawerL)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE SMALL DRESSER ON THE RIGHT")
        {
            scr39_SplitString(scrString("use_childrens_dresser"));
            if (o39_aKidDrawerR.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aKidDrawerR)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE DRESSER")
        {
            scr39_SplitString(scrString("use_upper_dresser"));
            if (o39_aDresser.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aDresser)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE MASTER BED")
        {
            if (o39_aBed.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundCushion, 50);
                scr39_SplitString(scrString("use_master_bed"));
                with (o39_aBed)
                {
                    open = ITEM_OPEN;
                }
            }
            else
            {
                scr39_SplitString(scrString("use_master_bed_open"));
            }
        }
        else if (obj.name == "THE GAMING CABINET")
        {
            scr39_SplitString(scrString("use_study_cabinet"));
            if (o39_aCabGaming.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aCabGaming)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE WASHER")
        {
            scr39_SplitString(scrString("use_washer"));
            if (o39_aWasher.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aWasher)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE DRYER")
        {
            scr39_SplitString(scrString("use_dryer"));
            if (o39_aDryer.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                with (o39_aDryer)
                {
                    open = ITEM_OPEN;
                }
            }
        }
        else if (obj.name == "THE WASTE BIN")
        {
            if (o39__Game.killerMeet == 0)
            {
                scr39_SplitString(strKillerKitchen);
            }
            else if (o39_aTrashcan.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_kitchen_wastebin"));
                with (o39_aTrashcan)
                {
                    open = ITEM_OPEN;
                }
            }
            else
            {
                scr39_SplitString(scrString("use_trash"));
            }
        }
        else if (obj.name == "THE MEDICINE CABINET")
        {
            if (o39_aCabMedicine.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDoor, 50);
                scr39_SplitString(scrString("use_medicine_cabinet"));
                with (o39_aCabMedicine)
                {
                    open = ITEM_OPEN;
                }
                scr39_TakeObject("THE TWEEZERS");
            }
            else
            {
                scr39_SplitString(scrString("use_medicine_cabinet_empty"));
            }
        }
        else if (obj.name == "THE STANDING CLOSET")
        {
            scrSfx(o39__Game.soundOpenDoor, 50);
            scr39_SplitString(scrString("use_standing_closet"));
            instance_create(429, 284, o39_aHook);
            with (o39_aStandingCloset)
            {
                instance_destroy();
            }
            o39__Game.event_closet = 1;
        }
        else if (obj.name == "THE SHOWER")
        {
            if (instance_exists(o39_aKiller))
            {
                scr39_SplitString(scrString("default_killer"));
            }
            else if (o39_aShower.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundRevealHorror, 50);
                scr39_SplitString(scrString("use_shower_curtain"));
                with (o39_aShower)
                {
                    open = ITEM_OPEN;
                }
                o39__Game.event_shower = 1;
                o39__Game.insanity += 1;
            }
            else
            {
                scrSfx(o39__Game.soundTransitionZoom, 30);
                o39__Game.nextRoom = 5;
                if (!oGame.fadeOut)
                {
                    oGame.fadeOut = true;
                    o39__Game.state = 99;
                }
            }
        }
        else if (obj.name == "THE CAR DOOR")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundLocked, 50);
                scr39_SplitString(scrString("use_car_locked"));
            }
            else if (o39_aDoorGarage.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_car_door_closed"));
            }
            else
            {
                scrSfx(o39__Game.soundCarStart, 50);
                o39__Game.state = 1;
                o39__Game.substate = 2;
                scr39_SplitString(scrString("use_car_ignition"));
                scr39_AlertKiller();
            }
        }
        else if (obj.name == "THE ANTS")
        {
            scr39_SplitString(scrString("use_ants"));
        }
        else if (obj.name == "THE GATE")
        {
            scrSfx(o39__Game.soundOpenDoor, 50);
            scr39_SplitString(scrString("use_gate"));
            with (obj)
            {
                open = ITEM_OPEN;
                active = true;
            }
            scrSaveGame(0);
        }
        else if (obj.name == "THE CHAIR")
        {
            scrSfx(o39__Game.soundMoveFurniture, 50);
            scr39_SplitString(scrString("use_chair"));
            o39__Game.event_chair = 1;
            with (obj)
            {
                instance_destroy();
            }
        }
        else if (obj.name == "THE TRAPDOOR" && obj.open == ITEM_CLOSED)
        {
            scrSfx(o39__Game.soundLadderDrop, 50);
            scr39_SplitString(scrString("use_trapdoor"));
            with (obj)
            {
                open = ITEM_OPEN;
                active = true;
            }
            with (o39_aTrapUp)
            {
                open = ITEM_OPEN;
            }
            scrSaveGame(0);
        }
        else if (obj.name == "THE BOOK" && obj.activated == ITEM_OFF)
        {
            scrSfx(o39__Game.soundUnlockB, 50);
            scr39_SplitString(scrString("use_book_lever"));
            with (obj)
            {
                activated = ITEM_ON;
            }
            with (o39_aBookcase)
            {
                open = ITEM_OPEN;
            }
        }
        else if (obj.name == "THE BATHROOM CABINET")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDoor, 50);
                scr39_SplitString(scrString("use_upper_bath_cabinet"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_TakeObject("THE PEROXIDE");
            }
            else
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE FLOATING OBJECT")
        {
            if (obj.state == 0)
            {
                scr39_SplitString(scrString("use_floating_object"));
            }
            else if (obj.state == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_floating_corpse"));
                with (obj)
                {
                    state = 2;
                }
                scr39_TakeObject("THE COPPER KEY");
            }
            else
            {
                scr39_SplitString(scrString("use_floating_empty"));
            }
        }
        else if (obj.name == "THE FIRST LION" || obj.name == "THE SECOND LION" || obj.name == "THE THIRD LION" || obj.name == "THE FOURTH LION")
        {
            if (obj.activated == ITEM_ON)
            {
                scr39_SplitString(scrString("use_lion_with_gem"));
            }
            else
            {
                scr39_SplitString(scrString("use_lion_statue"));
            }
        }
        else if (obj.name == "THE LARGE PAINTING")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundMoveFurniture, 50);
                scr39_SplitString(scrString("use_large_painting"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
            }
            else if (obj.open == ITEM_OPEN)
            {
                scr39_SplitString(scrString("use_safe_locked"));
            }
            else if (obj.open == 2)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_safe"));
                with (obj)
                {
                    open = 3;
                }
                scr39_TakeObject("THE DIAMOND");
            }
            else if (o39_aPaintingBig.open == 3)
            {
                scr39_SplitString(scrString("use_safe_empty"));
            }
        }
        else if (obj.name == "THE COMPUTER")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundComputerOn, 50);
                scr39_SplitString(scrString("use_computer"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
            }
            else if (obj.open == ITEM_OPEN)
            {
                scr39_SplitString(scrString("use_computer_on"));
            }
            else
            {
                scrSfx(o39__Game.soundComputerOn, 50);
                o39__Game.nextRoom = 30;
                if (!oGame.fadeOut)
                {
                    oGame.fadeOut = true;
                    o39__Game.state = 99;
                }
            }
        }
        else if (obj.name == "THE TRASH")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundComputerTrash, 50);
                scr39_SplitString(scrString("use_computer_trash"));
                instance_create(obj.x, obj.y - 32, o39_aRecipe);
                with (obj)
                {
                    open = ITEM_OPEN;
                }
            }
            else
            {
                scrSfx(o39__Game.soundComputerInteract, 10);
                scr39_SplitString(scrString("use_computer_trash_empty"));
            }
        }
        else if (obj.name == "THE RECIPE")
        {
            if (!is_location_collected(night_manor_name_to_loc("THE RECIPE")))
            {
                scr39_SplitString(scrString("look_recipe"));
                scrSfx(o39__Game.soundComputerInteract, 10);
                scr39_TakeObjectNoSave("THE RECIPE");
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scrSaveGame(0);
            }
            else
            {
                scr39_SplitString(scrString("look_recipe_known"));
            }
        }
        else if (obj.name == "THE PIANO")
        {
            if (obj.activated == 0)
            {
                scr39_SplitString(scrString("use_piano"));
            }
            else if (obj.activated == 1)
            {
                scrBGM(bgm39_stingPiano, false);
                o39__Game.tStinger = 600;
                o39__Game.state = 10;
                scr39_SplitString(scrString("use_piano_ready"));
                with (obj)
                {
                    activated = 2;
                }
                scr39_TakeObject("THE PIANO WIRE");
            }
            else
            {
                scr39_SplitString(scrString("use_piano_broken"));
            }
        }
        else if (obj.name == "THE LEVER" && verify(o39_aFinalBox) && verify(o39_aFinalWires) && verify(o39_aFinalDoor))
        {
            if (o39_aFinalBox.open == 2 && o39_aFinalWires.activated == 1 && obj.oiled == 1)
            {
                if (o39_aFinalDoor.open == ITEM_OPEN)
                {
                    scr39_SplitString(scrString("use_lever_done"));
                }
                else
                {
                    scrSfx(o39__Game.soundUnlockSpecial, 50);
                    scr39_SplitString(scrString("use_lever_ready"));
                    with (obj)
                    {
                        activated = 1;
                    }
                    with (o39_aFinalDoor)
                    {
                        open = ITEM_OPEN;
                    }
                    scrSaveGame(0);
                }
            }
            else if (obj.oiled == 1)
            {
                if (o39_aFinalWires.activated == ITEM_OFF)
                {
                    scr39_SplitString(scrString("use_lever_no_power"));
                }
                else if (o39_aFinalBox.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_lever_closed"));
                }
                else
                {
                    scr39_SplitString(scrString("use_lever_no_gear"));
                }
            }
            else
            {
                scr39_SplitString(scrString("use_lever_rusted"));
            }
        }
        else if (obj.name == "THE BEDROOM DRAWERS")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_dresser"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_TakeObject("THE BATTERIES");
            }
            else
            {
                scr39_SplitString(scrString("use_dresser_empty"));
            }
        }
        else if (obj.name == "THE NIGHTSTAND")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_nightstand"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_TakeObject("THE JOURNAL ENTRY 5");
            }
            else
            {
                scr39_SplitString(scrString("use_nightstand_empty"));
            }
        }
        else if (obj.name == "THE NIGHTSTAND DRAWERS")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundOpenDrawer, 50);
                scr39_SplitString(scrString("use_upper_nightstand"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_TakeObject("THE JOURNAL ENTRY 15");
            }
            else
            {
                scr39_SplitString(scrString("use_upper_night_empty"));
            }
        }
        else if (obj.name == "THE VENT")
        {
            scr39_SplitString(scrString("use_vent"));
        }
        else if (obj.name == "THE HAND")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_hand"));
            }
            else if (obj.open == ITEM_OPEN)
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE BATHROOM SINK")
        {
            if (obj.state == 0)
            {
                scr39_SplitString(scrString("use_bathroom_sink_clogged"));
            }
            else if (obj.state == 1)
            {
                scr39_SplitString(scrString("use_bathroom_sink"));
            }
            else if (obj.state == 2)
            {
                scr39_SplitString(scrString("use_bathroom_sink_empty"));
            }
        }
        else if (obj.name == "THE BASIN")
        {
            if (obj.state == 0)
            {
                scr39_SplitString(scrString("use_basin"));
            }
            else if (obj.state == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_basin_drained"));
                with (obj)
                {
                    state = 2;
                }
                scr39_TakeObject("THE EMERALD");
            }
            else if (obj.state == 2)
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE JEWELRY BOX")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_jewelry_box"));
            }
            else if (obj.open == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_jewelry_box_open"));
                with (obj)
                {
                    open = 2;
                }
                scr39_TakeObject("THE BRASS KEY");
            }
            else
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE GRANDFATHER CLOCK")
        {
            scr39_SplitString(scrString("use_grandfather_clock"));
        }
        else if (obj.name == "THE CANDELABRA")
        {
            if (obj.state == 1)
            {
                scrSfx(o39__Game.soundExtinguish, 50);
                scr39_SplitString(scrString("use_candelabra_lit"));
                with (obj)
                {
                    state = 2;
                }
            }
            else
            {
                scr39_SplitString(scrString("use_candelabra"));
            }
        }
        else if (obj.name == "THE CHINA CABINET")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_china_cabinet"));
            }
            else if (obj.open == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_china_cabinet_open"));
                with (obj)
                {
                    open = 2;
                }
                scr39_TakeObject("THE ORNAMENTAL EGG");
            }
            else
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE RUSTY TRUNK")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_rusty_trunk"));
            }
            else
            {
                scr39_SplitString(scrString("use_rusty_trunk_empty"));
            }
        }
        else if (obj.name == "THE GARAGE DOOR MECHANISM")
        {
            if (obj.state == 0)
            {
                scr39_SplitString(scrString("use_garage_mechanism"));
            }
            else
            {
                scr39_SplitString(scrString("use_garage_mechanism_fixed"));
            }
        }
        else if (obj.name == "THE BURLAP SACK")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_burlap_sack"));
            }
            else if (obj.open == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_burlap_sack_open"));
                with (obj)
                {
                    open = 2;
                }
                scr39_TakeObject("THE BRONZE KEY");
            }
            else
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE VISE")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_vise"));
            }
            else
            {
                scr39_SplitString(scrString("use_vise_closed"));
            }
        }
        else if (obj.name == "THE FIREPLACE")
        {
            if (obj.soaked == 0)
            {
                scr39_SplitString(scrString("use_fireplace"));
            }
            else if (obj.soaked == 1)
            {
                scr39_SplitString(scrString("use_fireplace_soaked"));
            }
            else if (obj.soaked == 2)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_fireplace_burnt"));
                with (obj)
                {
                    soaked = 3;
                }
                scr39_TakeObject("THE RUBY");
            }
            else if (obj.soaked == 3)
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE HANGING BUNDLE")
        {
            scr39_SplitString(scrString("use_hanging_bundle"));
        }
        else if (obj.name == "THE FAMILY PORTRAIT")
        {
            scr39_SplitString(scrString("use_family_portrait"));
        }
        else if (obj.name == "THE BUNDLE")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_bundle"));
            }
            else if (obj.open == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_bundle_open"));
                with (obj)
                {
                    open = 2;
                }
                scr39_TakeObject("THE TOPAZ");
            }
            else
            {
                scr39_SplitString(scrString("use_bundle_empty"));
            }
        }
        else if (obj.name == "THE ROPE" && o39_aRope.open == ITEM_CLOSED)
        {
            scr39_SplitString(scrString("use_rope"));
        }
        else if (obj.name == "THE LAWN MOWER")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_lawnmower"));
            }
            else
            {
                scr39_SplitString(scrString("use_lawnmower_open"));
            }
        }
        else if (obj.name == "THE DIRT PATCH")
        {
            scr39_SplitString(scrString("use_dirt_patch"));
        }
        else if (obj.name == "THE DARKNESS")
        {
            scr39_SplitString(scrString("move_darkness"));
        }
        else if (obj.name == "THE JUKEBOX")
        {
            scrSfx(o39__Game.soundFlickSwitch, 50);
            scr39_SplitString(scrString("use_jukebox"));
        }
        else if (obj.name == "THE DOLLHOUSE")
        {
            scr39_SplitString(scrString("use_dollhouse"));
        }
        else if (obj.name == "THE CHEST")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_chest"));
            }
            else if (obj.open == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                scr39_SplitString(scrString("use_chest_open"));
                with (obj)
                {
                    open = 2;
                }
                scr39_TakeObject("THE CROSSBOW");
            }
            else
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE METAL BOX")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_metal_box"));
            }
            else if (obj.open == 1)
            {
                scrSfx(o39__Game.soundItemTake, 50);
                with (obj)
                {
                    scr39_SplitString(scrString("use_metal_box_open"));
                    open = 2;
                }
                scr39_TakeObject("THE HACKSAW");
            }
            else
            {
                scr39_SplitString(scrString("use_default_empty"));
            }
        }
        else if (obj.name == "THE BULKHEAD DOOR")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundLocked, 50);
                scr39_SplitString(scrString("move_bulkhead_door"));
            }
        }
        else if (obj.name == "THE WIRES")
        {
            if (obj.activated == ITEM_OFF)
            {
                scr39_SplitString(scrString("use_wires"));
            }
            else
            {
                scr39_SplitString(scrString("use_wires_fixed"));
            }
        }
        else if (obj.name == "THE GEAR BOX")
        {
            if (obj.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrString("use_gear_box"));
            }
            else if (obj.open == 1)
            {
                scr39_SplitString(scrString("use_gear_box_open"));
            }
            else
            {
                scr39_SplitString(scrString("use_gear_box_fixed"));
            }
        }
        else if (obj.name == "THE ABOMINATION")
        {
            scr39_SplitString(scrString("use_abomination"));
        }
        else if (obj.name == "THE PUSTULE")
        {
            scr39_SplitString(scrString("use_pustule"));
        }
        else if (obj.name == "THE LIGHT SWITCH")
        {
            scrSfx(o39__Game.soundFlickSwitch, 50);
            scr39_SplitString(scrString("use_light_switch"));
        }
        else if (obj.name == "THE FOUNTAIN PLAQUE")
        {
            scr39_SplitString(scrString("use_fountain_plaque"));
        }
        else
        {
            scr39_SplitString(scrString("use_default"));
        }
    }
    else if (o39__Game.currRoom == 0)
    {
        if (scrPointInBox(x, y, 65, 121, 158, 150))
        {
            scr39_SplitString(scrString("use_starting_mattress"));
        }
        else if (scrPointInBox(x, y, 184, 22, 197, 48))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 1)
    {
        if (scrPointInBox(x, y, 484, 90, 510, 137))
        {
            scr39_SplitString(scrString("use_hallway_stand"));
        }
        else if (o39__Game.currRoom == 1 && scrPointInBox(x, y, 504, 56, 528, 128))
        {
            scr39_SplitString(scrString("use_blockage"));
        }
        else if (scrPointInBox(x, y, 487, 52, 497, 76))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 552, 14, 583, 25))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 2)
    {
        if (scrPointInBox(x, y, 774, 98, 825, 150))
        {
            scrSfx(o39__Game.soundTV, 50);
            scr39_SplitString(scrString("use_tv"));
            scr39_AlertKiller();
            with (o39_aStatic)
            {
                visible = true;
            }
        }
        else if (scrPointInBox(x, y, 936, 48, 960, 64))
        {
            scrSfx(o39__Game.soundTransitionZoom, 30);
            o39__Game.nextRoom = 3;
            if (!oGame.fadeOut)
            {
                oGame.fadeOut = true;
                o39__Game.state = 99;
            }
        }
        else if (scrPointInBox(x, y, 795, 38, 819, 80))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 859, 54, 912, 129))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else if (scrPointInBox(x, y, 981, 54, 1034, 125))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else if (scrPointInBox(x, y, 1089, 19, 1143, 92))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 4)
    {
        if (scrPointInBox(x, y, 1598, 100, 1654, 151))
        {
            scrSfx(o39__Game.soundFlush, 50);
            scr39_SplitString(scrString("use_toilet"));
            scr39_AlertKiller();
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 5)
    {
        if (scrPointInBox(x, y, 2015, 12, 2160, 88))
        {
            scr39_SplitString(scrString("use_corpse"));
        }
        else if (scrPointInBox(x, y, 1998, 72, 2014, 88) || scrPointInBox(x, y, 2136, 44, 2150, 56))
        {
            scr39_SplitString(scrString("use_fungi"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 6)
    {
        if (scrPointInBox(x, y, 176, 312, 204, 340))
        {
            scr39_SplitString(scrString("use_blockage"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 7)
    {
        if (scrPointInBox(x, y, 524, 300, 622, 355))
        {
            scr39_SplitString(scrString("use_bed"));
        }
        else if (scrPointInBox(x, y, 622, 332, 337, 355))
        {
            scr39_SplitString(scrString("use_bed"));
        }
        else if (scrPointInBox(x, y, 626, 289, 652, 308))
        {
            scrSfx(o39__Game.soundFlickSwitch, 50);
            scr39_SplitString(scrString("use_lamp"));
        }
        else if (scrPointInBox(x, y, 622, 307, 656, 331))
        {
            scr39_SplitString(scrString("use_drawers"));
        }
        else if (scrPointInBox(x, y, 471, 278, 514, 332))
        {
            if (instance_exists(o39_aBedPlant))
            {
                scr39_SplitString(scrString("use_houseplant"));
            }
            else
            {
                scr39_SplitString(scrString("use_houseplant_gone"));
            }
        }
        else if (scrPointInBox(x, y, 561, 238, 590, 247))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else if (scrPointInBox(x, y, 516, 273, 540, 299))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 615, 273, 648, 288))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 615, 289, 626, 298))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 551, 268, 602, 302))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else if (scrPointInBox(x, y, 671, 261, 705, 325))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else if (scrPointInBox(x, y, 682, 328, 696, 346))
        {
            scr39_SplitString(scrString("use_trash"));
        }
        else if (scrPointInBox(x, y, 408, 272, 469, 368))
        {
            scr39_SplitString(scrString("use_nothing"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 8)
    {
        if (scrPointInBox(x, y, 941, 317, 998, 355))
        {
            scr39_SplitString(scrString("use_sunroom_chair"));
        }
        else if (scrPointInBox(x, y, 378, 265, 988, 282))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else if (scrPointInBox(x, y, 968, 312, 979, 317))
        {
            scr39_SplitString(scrString("use_teacup"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 9)
    {
        if (scrPointInBox(x, y, 1272, 312, 1416, 354))
        {
            scr39_SplitString(scrString("use_dining_table"));
        }
        else if (scrPointInBox(x, y, 1326, 255, 1361, 272))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else if (scrPointInBox(x, y, 1272, 272, 1295, 312) || scrPointInBox(x, y, 1304, 272, 1328, 312) || scrPointInBox(x, y, 1360, 272, 1384, 312) || scrPointInBox(x, y, 1392, 272, 1415, 312))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 1158, 289, 1190, 375) || scrPointInBox(x, y, 1251, 289, 1272, 331))
        {
            scr39_SplitString(scrString("use_houseplant"));
        }
        else if (scrPointInBox(x, y, 1216, 298, 1241, 349))
        {
            scr39_SplitString(scrString("use_dining_plant"));
        }
        else if (scrPointInBox(x, y, 1190, 255, 1215, 331) || scrPointInBox(x, y, 1166, 244, 1189, 289) || scrPointInBox(x, y, 1224, 260, 1240, 298) || scrPointInBox(x, y, 1240, 265, 1250, 312))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 10)
    {
        if (scrPointInBox(x, y, 1651, 268, 1677, 298))
        {
            scr39_SplitString(scrString("use_decorative_plates"));
        }
        else if (scrPointInBox(x, y, 1707, 301, 1744, 312))
        {
            scrSfx(o39__Game.soundPipes[rand(0, 4)], 50);
            scr39_SplitString(scrString("use_kitchen_sink"));
        }
        else if (scrPointInBox(x, y, 1707, 313, 1744, 334))
        {
            scr39_SplitString(scrString("use_default_empty"));
        }
        else if (scrPointInBox(x, y, 1713, 239, 1742, 247))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 11)
    {
        if (scrPointInBox(x, y, 2012, 320, 2212, 362) || scrPointInBox(x, y, 2072, 303, 2167, 320))
        {
            if (verify(o39_aCarDoor))
            {
                if (o39_aCarDoor.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_car_locked"));
                }
                else
                {
                    scr39_SplitString(scrString("use_car_trunk"));
                }
            }
        }
        else if (scrPointInBox(x, y, 2174, 307, 2197, 320))
        {
            scr39_SplitString(scrString("use_garage_trash"));
        }
        else if (scrPointInBox(x, y, 1932, 292, 1940, 308))
        {
            if (verify(o39_aDoorGarage) && verify(o39_aGarageMech))
            {
                if (o39_aDoorGarage.open == ITEM_CLOSED)
                {
                    if (o39_aGarageMech.state == 1)
                    {
                        scrSfx(o39__Game.soundOpenGarageDoor, 50);
                        scr39_SplitString(scrString("use_garage_button_fixed"));
                        scr39_AlertKiller();
                        with (o39_aDoorGarage)
                        {
                            open = ITEM_OPEN;
                        }
                        with (o39_aGarage)
                        {
                            open = ITEM_OPEN;
                        }
                        scrSaveGame(0);
                    }
                    else
                    {
                        scrSfx(o39__Game.soundFlickSwitch, 50);
                        scr39_SplitString(scrString("use_garage_button"));
                    }
                }
            }
            else
            {
                scr39_SplitString(scrString("use_garage_button_open"));
            }
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 12)
    {
        if (scrPointInBox(x, y, 48, 547, 174, 560) || scrPointInBox(x, y, 26, 561, 234, 599))
        {
            scr39_SplitString(scrString("use_swimming_pool"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 17)
    {
        if (scrPointInBox(x, y, 2097, 483, 2124, 516))
        {
            scr39_SplitString(scrString("use_growth"));
            if (o39__Game.growthInsanity == 0)
            {
                o39__Game.growthInsanity = 1;
                o39__Game.insanity += 1;
            }
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 19)
    {
        if (scrPointInBox(x, y, 648, 800, 712, 816))
        {
            scrSfx(o39__Game.soundTransitionZoom, 30);
            o39__Game.nextRoom = 20;
            if (!oGame.fadeOut)
            {
                oGame.fadeOut = true;
                o39__Game.state = 99;
            }
        }
        else if (scrPointInBox(x, y, 608, 690, 687, 764) || scrPointInBox(x, y, 640, 765, 665, 796))
        {
            scr39_SplitString(scrString("use_tree"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 20)
    {
        scr39_SplitString(scrString("use_animal_bones"));
    }
    else if (o39__Game.currRoom == 21)
    {
        if (scrPointInBox(x, y, 1464, 745, 1483, 806))
        {
            scr39_SplitString(scrString("use_statue"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 22)
    {
        if (scrPointInBox(x, y, 1542, 705, 1580, 782) || scrPointInBox(x, y, 1610, 719, 1633, 762) || scrPointInBox(x, y, 1655, 727, 1684, 750) || scrPointInBox(x, y, 1655, 727, 1684, 750) || scrPointInBox(x, y, 1766, 726, 1790, 736) || scrPointInBox(x, y, 1780, 737, 1790, 760))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowBoardedOpen);
        }
        else if (scrPointInBox(x, y, 1685, 739, 1695, 758))
        {
            scr39_SplitString(scrString("use_lamp"));
        }
        else if (scrPointInBox(x, y, 1580, 762, 1603, 782))
        {
            scr39_SplitString(scrString("use_teddy_bear"));
        }
        else if (scrPointInBox(x, y, 1615, 762, 1661, 793) || scrPointInBox(x, y, 1700, 762, 1747, 793))
        {
            scr39_SplitString(scrString("use_bed"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 23)
    {
        if (scrPointInBox(x, y, 1940, 688, 2008, 804) || scrPointInBox(x, y, 2052, 725, 2072, 761) || scrPointInBox(x, y, 2171, 720, 2202, 761))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 2109, 692, 2123, 720))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else if (scrPointInBox(x, y, 2108, 722, 2120, 740))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowBoardedOpen);
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 24)
    {
        if (scrPointInBox(x, y, 25, 1015, 61, 1045))
        {
            scr39_SplitString(scrString("use_toy_truck"));
        }
        else if (scrPointInBox(x, y, 114, 998, 158, 1008))
        {
            scr39_SplitString(scrString("use_crayons"));
        }
        else if (scrPointInBox(x, y, 175, 961, 210, 1008))
        {
            if (instance_exists(o39_aToyBear))
            {
                scr39_SplitString(scrString("use_big_bear"));
            }
            else
            {
                scr39_SplitString(scrString("use_big_bear_torn"));
            }
        }
        else if (scrPointInBox(x, y, 210, 982, 226, 998))
        {
            scr39_SplitString(scrString("use_toy_ball"));
        }
        else if (scrPointInBox(x, y, 207, 950, 233, 982) || scrPointInBox(x, y, 288, 948, 309, 981) || scrPointInBox(x, y, 339, 928, 378, 1006))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowBoardedOpen);
        }
        else if (scrPointInBox(x, y, 233, 958, 267, 1008))
        {
            scr39_SplitString(scrString("use_rocking_horse"));
        }
        else if (scrPointInBox(x, y, 230, 1012, 272, 1029) || scrPointInBox(x, y, 272, 1022, 291, 1039))
        {
            scr39_SplitString(scrString("use_toy_blocks"));
        }
        else if (scrPointInBox(x, y, 277, 981, 339, 1022))
        {
            scr39_SplitString(scrString("use_toy_box"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 25)
    {
        if (scrPointInBox(x, y, 477, 984, 497, 1019))
        {
            scrSfx(o39__Game.soundFlush, 50);
            scr39_SplitString(scrString("use_toilet"));
            scr39_AlertKiller();
        }
        else if (scrPointInBox(x, y, 662, 977, 680, 989))
        {
            scr39_SplitString(scrString("use_bathroom_faucet"));
        }
        else if (scrPointInBox(x, y, 481, 951, 497, 977))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowBoardedOpen);
        }
        else if (scrPointInBox(x, y, 446, 974, 463, 999))
        {
            scr39_SplitString(scrString("use_towel"));
        }
        else if (scrPointInBox(x, y, 446, 941, 469, 966))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 463, 992, 475, 1005))
        {
            scr39_SplitString(scrString("use_toilet_paper"));
        }
        else if (scrPointInBox(x, y, 511, 931, 582, 1020))
        {
            scr39_SplitString(scrString("use_shower"));
        }
        else if (scrPointInBox(x, y, 511, 1020, 542, 1035))
        {
            scr39_SplitString(scrString("use_broken_glass"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 26)
    {
        if (scrPointInBox(x, y, 788, 928, 814, 968))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 892, 940, 923, 993) || scrPointInBox(x, y, 997, 940, 1015, 993) || scrPointInBox(x, y, 1065, 940, 1078, 978) || scrPointInBox(x, y, 1110, 927, 1147, 964))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowBoardedOpen);
        }
        else if (scrPointInBox(x, y, 945, 913, 973, 927))
        {
            scr39_SplitString(scrString("use_ceiling_lamp"));
        }
        else if (scrPointInBox(x, y, 932, 940, 985, 993))
        {
            scrSfx(o39__Game.soundTV, 50);
            scr39_SplitString(scrString("use_tv"));
            scr39_AlertKiller();
            with (o39_aStatic2)
            {
                visible = true;
            }
        }
        else if (scrPointInBox(x, y, 904, 993, 1015, 1039))
        {
            scr39_SplitString(scrString("use_pool_table"));
        }
        else if (scrPointInBox(x, y, 1015, 952, 1065, 993))
        {
            if (instance_exists(o39_aLoungePlant))
            {
                scr39_SplitString(scrString("use_houseplant"));
            }
            else
            {
                scr39_SplitString(scrString("use_houseplant_gone"));
            }
        }
        else if (scrPointInBox(x, y, 1041, 993, 1110, 1036) || scrPointInBox(x, y, 1065, 978, 1110, 993))
        {
            scr39_SplitString(scrString("use_lounge_couch"));
        }
        else if (scrPointInBox(x, y, 1078, 913, 1105, 968))
        {
            scr39_SplitString(scrString("use_buck_trophy"));
        }
        else if (scrPointInBox(x, y, 1110, 964, 1147, 1039))
        {
            scr39_SplitString(scrString("use_trophies"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 27)
    {
        if (scrPointInBox(x, y, 1209, 974, 1219, 986))
        {
            scr39_SplitString(scrString("use_cologne"));
        }
        else if (scrPointInBox(x, y, 1162, 945, 1177, 967) || scrPointInBox(x, y, 1219, 950, 1232, 967))
        {
            scrSfx(o39__Game.soundFlickSwitch, 50);
            scr39_SplitString(scrString("use_lamp"));
        }
        else if (scrPointInBox(x, y, 1360, 936, 1384, 1000) || scrPointInBox(x, y, 1384, 936, 1423, 986))
        {
            scr39_SplitString(scrString("use_closet"));
        }
        else if (scrPointInBox(x, y, 1505, 986, 1518, 1000))
        {
            scr39_SplitString(scrString("use_clock"));
        }
        else if (scrPointInBox(x, y, 1518, 962, 1530, 1000))
        {
            scrSfx(o39__Game.soundFlickSwitch, 50);
            scr39_SplitString(scrString("use_lamp"));
        }
        else if (scrPointInBox(x, y, 1259, 952, 1288, 1000))
        {
            scr39_SplitString(scrString("use_houseplant"));
        }
        else if (scrPointInBox(x, y, 1328, 952, 1352, 1000))
        {
            scr39_SplitString(scrString("use_shelves"));
        }
        else if (scrPointInBox(x, y, 1315, 905, 1381, 936))
        {
            scr39_SplitString(scrString("use_ceiling_fan"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 29)
    {
        if (scrPointInBox(x, y, 2040, 968, 2084, 1012))
        {
            scr39_SplitString(scrString("use_study_chair"));
        }
        else if (scrPointInBox(x, y, 2045, 940, 2074, 969) || scrPointInBox(x, y, 2209, 936, 2233, 952) || scrPointInBox(x, y, 2262, 924, 2298, 969))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else if (scrPointInBox(x, y, 2079, 944, 2097, 969))
        {
            scr39_SplitString(scrString("use_pictures"));
        }
        else if (scrPointInBox(x, y, 2107, 949, 2128, 977))
        {
            scr39_SplitString(scrString("use_globe"));
        }
        else if (scrPointInBox(x, y, 2131, 945, 2166, 1012))
        {
            scr39_SplitString(scrString("use_shelves"));
        }
        else if (scrPointInBox(x, y, 2152, 932, 2182, 945))
        {
            scr39_SplitString(scrString("use_ship_in_bottle"));
        }
        else if (scrPointInBox(x, y, 2169, 982, 2277, 1036))
        {
            scr39_SplitString(scrString("use_study_desk"));
        }
        else if (scrPointInBox(x, y, 2242, 944, 2253, 952))
        {
            scrSfx(o39__Game.soundFlickSwitch, 50);
            scr39_SplitString(scrString("use_lamp"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 30)
    {
        if (scrPointInBox(x, y, 63, 1127, 112, 1136))
        {
            scrSfx(o39__Game.soundComputerInteract, 10);
            scr39_SplitString(scrString("use_computer_no_response"));
        }
        else if (scrPointInBox(x, y, 287, 1145, 315, 1168))
        {
            scrSfx(o39__Game.soundComputerInteract, 10);
            scr39_SplitString(scrString("use_computer_no_response"));
        }
        else if (scrPointInBox(x, y, 70, 1145, 231, 1240) || scrPointInBox(x, y, 119, 1240, 247, 1248) || scrPointInBox(x, y, 231, 1183, 247, 1240))
        {
            scrSfx(o39__Game.soundComputerInteract, 10);
            scr39_SplitString(scrString("use_computer_no_response"));
        }
        else
        {
            scrSfx(o39__Game.soundComputerInteract, 10);
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 31)
    {
        if (scrPointInBox(x, y, 496, 1181, 517, 1224) || scrPointInBox(x, y, 670, 1171, 750, 1219))
        {
            scr39_SplitString(scrString("use_attic_boxes"));
        }
        else if (scrPointInBox(x, y, 553, 1159, 569, 1193))
        {
            scrSfx(o39__Game.soundLocked, 50);
            scr39_SplitString(strWindowOpen);
        }
        else if (scrPointInBox(x, y, 521, 1177, 553, 1219))
        {
            scr39_SplitString(scrString("use_rocking_chair"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else if (o39__Game.currRoom == 32)
    {
        if (scrPointInBox(x, y, 795, 1176, 824, 1218))
        {
            scr39_SplitString(scrString("use_fusebox"));
        }
        else if (scrPointInBox(x, y, 774, 1218, 824, 1271))
        {
            scr39_SplitString(scrString("use_basement_boxes"));
        }
        else if (scrPointInBox(x, y, 824, 1165, 878, 1240))
        {
            scr39_SplitString(scrString("use_basement_docs"));
        }
        else if (scrPointInBox(x, y, 927, 1218, 949, 1232))
        {
            scr39_SplitString(scrString("use_laundry"));
        }
        else
        {
            scr39_SplitString(strUseDefault);
        }
    }
    else
    {
        scr39_SplitString(strUseDefault);
    }
    scrSfx(o39__Game.soundActionDefault, 5);
}
