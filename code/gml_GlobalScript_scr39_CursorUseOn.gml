function scr39_CursorUseOn()
{
    obj = instance_position(x, y, o39__ActiveObject);
    o39__Game.state = STATE_TEXT;
    if (instance_exists(o39_aKiller))
    {
        if (o39__Game.item1 == "THE ARMED CROSSBOW")
        {
            var _gottem = false;
            var _killer = instance_position(x, y, o39_aKiller);
            if (verify(_killer))
            {
                with (o39__Game)
                {
                    muteBGM();
                    scrSfx(o39__Game.soundAttackKillerKillA, 50);
                    o39__Game.bgmCurr = -4;
                    o39__Game.bgmState = 1;
                    scr39_SplitString(scrString("use_crossbow_killer"));
                    with (o39_aKiller)
                    {
                        instance_create(x, y, o39_aKillerDie);
                        instance_destroy();
                    }
                    killerTime = -1;
                    if (escapes == 0)
                    {
                        scrWin(global.GARDEN_WIN);
                    }
                    state = STATE_TEXT;
                    substate = 3;
                }
                _gottem = true;
            }
            if (!_gottem)
            {
                if (o39__Game.currRoom == o39__Game.killerRoom)
                {
                    scrSfx(o39__Game.soundCrossbowMiss, 30);
                    scr39_SplitString(scrString("use_crossbow_miss"));
                    o39__Game.killerTime = 1;
                    scr39_RemoveObject("THE ARMED CROSSBOW");
                    night_manor_give_object(58);
                    night_manor_give_object(67);
                    scrSaveGame(0);
                }
                else
                {
                    scrSfx(o39__Game.soundCrossbowMiss, 30);
                    scr39_SplitString(scrString("use_crossbow_soon"));
                    scr39_RemoveObject("THE ARMED CROSSBOW");
                    night_manor_give_object(58);
                    night_manor_give_object(67);
                    scrSaveGame(0);
                }
            }
        }
        else if (verify(obj))
        {
            o39__Game.item2 = obj.name;
            with (o39__Game)
            {
                if (item2 == "THE KILLER" && (item1 == "THE KNIFE" || item1 == "THE HEDGE SHEARS" || item1 == "THE SHOVEL" || item1 == "THE HAMMER" || item1 == "THE SCREWDRIVER" || item1 == "THE CROWBAR" || item1 == "THE POOL CUE" || item1 == "THE HOOKED POLE" || item1 == "THE HOOK"))
                {
                    if (!killerGuard)
                    {
                        scrSfx(o39__Game.soundAttackKillerHit, 50);
                        scr39_SplitString(scrStringVal("use_any_on_killer_1", scr39_ItemGetName(item1)));
                        killerTime += 10;
                        killerGuard = true;
                        killerHit += 1;
                        with (o39_aKiller)
                        {
                            shakeCount = 20;
                        }
                    }
                    else
                    {
                        scrSfx(o39__Game.soundAttackKillerMiss, 50);
                        scr39_SplitString(scrStringExt("use_any_on_killer_2", 0, 0, 0));
                        killerTime = 1;
                    }
                }
                else if (item1 == "THE GAS CAN" && item2 == "THE KILLER")
                {
                    scr39_SplitString(scrStringExt("use_gascan_on_killer", 0, 0, 0));
                }
                else if (item1 == "THE MATCHES" && item2 == "THE KILLER")
                {
                    scr39_SplitString(scrString("use_matches_killer"));
                }
                else if (item1 == "THE CROSSBOW" && item2 == "THE KILLER")
                {
                    scr39_SplitString(scrString("use_crossbow_empty"));
                }
                else if (item2 == "THE KILLER")
                {
                    scr39_SplitString(scrStringVal("use_not_interested", scr39_ItemGetName(item1)));
                }
                else
                {
                    scr39_SplitString(o39__Cursor.strKillerOnScreen);
                }
            }
        }
        else
        {
            scr39_SplitString(o39__Cursor.strKillerOnScreen);
        }
    }
    else if (verify(obj))
    {
        o39__Game.item2 = obj.name;
        o39__Game.obj = obj;
        var _musicBox = instance_position(x, y, o39_aMusicBox);
        if (verify(_musicBox))
        {
            o39__Game.item2 = _musicBox.name;
        }
        with (o39__Game)
        {
            if (item2 == "THE MASTER BED" && (item1 == "THE KNIFE" || item1 == "THE HEDGE SHEARS" || item1 == "THE SHOVEL" || item1 == "THE HAMMER" || item1 == "THE SCREWDRIVER" || item1 == "THE CROWBAR" || item1 == "THE POOL CUE" || item1 == "THE HOOKED POLE" || item1 == "THE HOOK"))
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundCutOpen, 50);
                    scr39_SplitString(scrString("use_item_bed"));
                }
                else
                {
                    scr39_SplitString(scrString("use_item_mannequin"));
                }
            }
            else if (item2 == "THE FIGURE")
            {
                scr39_SplitString(scrString("use_item_figure"));
            }
            else if (item1 == "THE SPOON" && item2 == "THE VENT")
            {
                scrSfx(o39__Game.soundPryOpen, 50);
                scr39_SplitString(scrString("use_spoon_vent"));
                event_vent = 1;
                with (obj)
                {
                    instance_create(x + 12, y + 7, o39_aNote);
                    instance_destroy();
                }
            }
            else if (item1 == "THE SPOON" && item2 == "THE BOWL")
            {
                scr39_SplitString(scrString("use_spoon_bowl"));
            }
            else if (item1 == "THE SPOON" && item2 == "THE DOOR")
            {
                scr39_SplitString(scrString("use_spoon_door"));
            }
            else if (item1 == "THE HAIRPIN" && item2 == "THE DOOR")
            {
                scrSfx(o39__Game.soundUnlockB, 50);
                scr39_SplitString(scrString("use_hairpin_door"));
                event_door0 = 1;
                o39__Game.killerMeet = 3;
                o39__Game.killerTime = killerTimeMax;
                o39__Game.killerCount = killerCountMax;
                o39__Game.insanity += 1;
                with (o39_aKillerSmall)
                {
                    instance_destroy();
                }
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE HAIRPIN");
            }
            else if (item1 == "THE LIT FLASHLIGHT" && item2 == "THE DARKNESS")
            {
                scrSfx(o39__Game.soundIlluminate, 50);
                scr39_SplitString(scrString("use_flashlight_darkness"));
                with (obj)
                {
                    instance_destroy();
                }
                o39__Game.event_darkness = 1;
            }
            else if (item2 == "THE DOOR")
            {
                scr39_SplitString(scrStringFormat(scrString("use_nothing_happens"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
            }
            else if (item1 == "THE DRAIN CLEANER" && item2 == "THE BATHROOM SINK")
            {
                scrSfx(o39__Game.soundDrain, 50);
                scr39_SplitString(scrString("use_cleaner_sink"));
                with (obj)
                {
                    state = 1;
                }
                with (o39_aDrip)
                {
                    instance_destroy();
                }
                scr39_RemoveObject("THE DRAIN CLEANER");
                scrSaveGame(0);
            }
            else if (item1 == "THE TWEEZERS" && item2 == "THE BATHROOM SINK")
            {
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("use_bathroom_sink_clogged"));
                }
                else if (obj.state == 1)
                {
                    scrSfx(o39__Game.soundItemTake, 50);
                    scr39_SplitString(scrString("use_tweezers_drain"));
                    scr39_RemoveObject("THE TWEEZERS");
                    obj.state = 2;
                    scr39_TakeObject("THE SILVER KEY");
                }
            }
            else if ((item1 == "THE SPOON" || item1 == "THE BOWL") && item2 == "THE BATHROOM SINK")
            {
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("you_gag"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE HOOK" && item2 == "THE BATHROOM SINK")
            {
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("use_hook_sink"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE SILVER KEY" && item2 == "THE JEWELRY BOX")
            {
                scrSfx(o39__Game.soundUnlockA, 50);
                scr39_SplitString(scrString("use_silver_jewelry"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE SILVER KEY");
            }
            else if ((item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE JEWELRY BOX")
            {
                scr39_SplitString(scrString("use_key_jewelry"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE GRANDFATHER CLOCK")
            {
                scr39_SplitString(scrString("use_key_clock"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE ALUMINUM KEY") && item2 == "THE SHED DOOR")
            {
                scr39_SplitString(scrString("use_key_shed"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY") && item2 == "THE CHEST")
            {
                scr39_SplitString(scrString("use_key_chest"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE CAR DOOR")
            {
                scr39_SplitString(scrString("use_key_car"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE LOUNGE DOOR")
            {
                scr39_SplitString(scrString("use_key_gold_lock"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE IRON KEY") && item2 == "THE MUSIC BOX")
            {
                scr39_SplitString(scrString("use_key_musicbox"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY") && item2 == "THE BULKHEAD DOOR")
            {
                scr39_SplitString(scrString("use_key_bulkhead"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE WOODEN DOOR")
            {
                scr39_SplitString(scrString("use_key_wooden_door"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE CHINA CABINET")
            {
                scr39_SplitString(scrString("use_key_china"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE RUSTY TRUNK")
            {
                scr39_SplitString(scrString("use_key_trunk"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE METAL GATE")
            {
                scr39_SplitString(scrString("use_key_gate"));
            }
            else if ((item1 == "THE SILVER KEY" || item1 == "THE BRASS KEY" || item1 == "THE COPPER KEY" || item1 == "THE BRONZE KEY" || item1 == "THE STEEL KEY" || item1 == "THE GOLD KEY" || item1 == "THE ALUMINUM KEY" || item1 == "THE IRON KEY") && item2 == "THE HALLWAY DOOR")
            {
                scr39_SplitString(scrString("use_key_upper_door"));
            }
            else if (item1 == "THE BRASS KEY" && item2 == "THE GRANDFATHER CLOCK")
            {
                scrSfx(o39__Game.soundClockBreakA, 50);
                scr39_SplitString(scrString("use_brass_clock"));
                state = 1;
                substate = 1;
                scr39_RemoveObject("THE BRASS KEY");
            }
            else if (item1 == "THE MATCHES" && item2 == "THE CANDELABRA")
            {
                scrSfx(o39__Game.soundIgnite, 50);
                scr39_SplitString(scrString("use_matches_candles"));
                with (obj)
                {
                    state = 1;
                }
            }
            else if (item1 == "THE SCREWDRIVER" && item2 == "THE GARAGE DOOR MECHANISM")
            {
                scr39_SplitString(scrString("use_screwdriver_mechanism"));
            }
            else if (item1 == "THE WRENCH" && item2 == "THE GARAGE DOOR MECHANISM")
            {
                scrSfx(o39__Game.soundPryOpen, 50);
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("use_wrench_mechanism"));
                }
                else
                {
                    scr39_SplitString(scrString("use_mechanism_fixed"));
                }
            }
            else if (item1 == "THE SMALL MOTOR" && item2 == "THE GARAGE DOOR MECHANISM")
            {
                scrSfx(o39__Game.soundItemPlace, 50);
                scr39_SplitString(scrString("use_motor_mechanism"));
                with (obj)
                {
                    state = 1;
                }
                with (o39_aDoorGarage)
                {
                    canOpen = true;
                }
                scr39_RemoveObject("THE SMALL MOTOR");
                scrSaveGame(0);
            }
            else if (item1 == "THE COINS" && item2 == "THE JUKEBOX")
            {
                scrBGM(bgm39_stingJukebox, false);
                o39__Game.tStinger = 780;
                o39__Game.state = STATE_AUDIO_STINGER_WAIT;
                scr39_SplitString(scrString("use_coins_jukebox"));
                scr39_RemoveObject("THE COINS");
                instance_create(876, 1010, o39_aSheetMusic);
                o39__Game.event_sheetmus = 1;
            }
            else if (item1 == "THE HOOK" && item2 == "THE FLOATING OBJECT")
            {
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("use_hook_floating"));
                }
            }
            else if (item1 == "THE POOL CUE" && item2 == "THE FLOATING OBJECT")
            {
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("use_pool_cue_floating"));
                }
            }
            else if (item1 == "THE HOOKED POLE" && item2 == "THE FLOATING OBJECT")
            {
                if (obj.state == 0)
                {
                    scrSfx(o39__Game.soundPullWetCorpse, 50);
                    scr39_SplitString(scrString("use_hooked_pole_floating"));
                    o39__Game.insanity += 1;
                    with (obj)
                    {
                        x += 32;
                        state = 1;
                    }
                }
                else
                {
                    scr39_SplitString(scrString("use_hooked_pole_corpse"));
                }
            }
            else if (item1 == "THE COPPER KEY" && item2 == "THE SHED DOOR")
            {
                scrSfx(o39__Game.soundUnlockB, 50);
                scr39_SplitString(scrString("use_copper_shed"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE COPPER KEY");
            }
            else if (item1 == "THE KNIFE" && item2 == "THE BURLAP SACK")
            {
                if (!obj.open)
                {
                    scrSfx(o39__Game.soundCutOpen, 50);
                    scr39_SplitString(scrString("use_knife_sack"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                }
                else
                {
                    scr39_SplitString(scrStringFormat(scrString("use_nothing_happens"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                }
            }
            else if (item1 == "THE HEDGE SHEARS" && item2 == "THE BURLAP SACK")
            {
                scr39_SplitString(scrString("use_shears_sack"));
            }
            else if (item1 == "THE WRENCH" && item2 == "THE LAWN MOWER")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundPryOpen, 50);
                    scr39_SplitString(scrString("use_wrench_mower"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    scr39_TakeObject("THE SMALL MOTOR");
                }
                else
                {
                    scr39_SplitString(scrString("use_nothing_else"));
                }
            }
            else if (item1 == "THE GAS CAN" && item2 == "THE LAWN MOWER")
            {
                scr39_SplitString(scrString("use_gasoline_mower"));
            }
            else if (item1 == "THE SCREWDRIVER" && item2 == "THE LAWN MOWER")
            {
                scr39_SplitString(scrString("use_screwdriver_mower"));
            }
            else if (item1 == "THE SHOVEL" && item2 == "THE DIRT PATCH")
            {
                scrSfx(o39__Game.soundDig, 50);
                scr39_SplitString(scrString("use_shovel_dirt"));
                with (obj)
                {
                    instance_destroy();
                }
                o39__Game.event_dirt = 1;
            }
            else if (item1 == "THE POOL CUE" && item2 == "THE HANGING BUNDLE")
            {
                scr39_SplitString(scrString("use_pool_cue_hanging"));
            }
            else if (item1 == "THE HOOKED POLE" && item2 == "THE HANGING BUNDLE")
            {
                scr39_SplitString(scrString("use_hooked_pole_hanging"));
            }
            else if ((item1 == "THE KNIFE" || item1 == "THE HOOK") && item2 == "THE HANGING BUNDLE")
            {
                scr39_SplitString(scrString("use_other_hanging"));
            }
            else if (item1 == "THE KNIFE" && item2 == "THE DOLL")
            {
                scr39_SplitString(scrString("use_knife_doll_pickup"));
            }
            else if (item1 == "THE OIL CAN" && item2 == "THE RUSTY TRUNK")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundSpray, 50);
                    scr39_SplitString(scrString("use_oil_trunk"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    if (o39_aFinalLever.oiled)
                    {
                        scr39_RemoveObject("THE OIL CAN");
                    }
                    scr39_TakeObjectNoSave("THE GAS CAN");
                    scr39_TakeObject("THE CROWBAR");
                }
                else
                {
                    scr39_SplitString(scrString("use_nothing_else"));
                }
            }
            else if (item1 == "THE STEEL KEY" && item2 == "THE CAR DOOR" && verify(o39_aDoorGarage))
            {
                if (obj.open)
                {
                    if (o39_aDoorGarage.open == ITEM_CLOSED)
                    {
                        scr39_SplitString(scrString("use_car_door_closed"));
                    }
                    else
                    {
                        scrSfx(o39__Game.soundCarStart, 50);
                        state = 1;
                        substate = 2;
                        scr39_SplitString(scrString("use_car_ignition"));
                        scr39_AlertKiller();
                    }
                }
                else
                {
                    scrSfx(o39__Game.soundUnlockB, 50);
                    scr39_SplitString(scrString("use_steel_car"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                }
            }
            else if ((item1 == "THE HAMMER" || item1 == "THE WRENCH" || item1 == "THE CROWBAR" || item1 == "THE SHOVEL") && item2 == "THE CHINA CABINET")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundShatter, 50);
                    scr39_SplitString(scrString("use_break_china"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    scr39_AlertKiller();
                }
                else
                {
                    scr39_SplitString(scrString("use_broken_china"));
                }
            }
            else if (item1 == "THE ORNAMENTAL EGG" && item2 == "THE VISE")
            {
                scrSfx(o39__Game.soundEggHatch, 50);
                scr39_SplitString(scrString("use_egg_vise"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE ORNAMENTAL EGG");
                scr39_TakeObject("THE GOLD KEY");
            }
            else if (item1 == "THE HEDGE SHEARS" && item2 == "THE SUNROOM DOOR" && obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundClipVines, 50);
                scr39_SplitString(scrString("use_shears_door"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scrSaveGame(0);
            }
            else if (item1 == "THE HEDGE SHEARS" && item2 == "THE METAL BOX" && obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundClipVines, 50);
                scr39_SplitString(scrString("use_shears_box"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
            }
            else if (item1 == "THE OIL CAN" && item2 == "THE FIREPLACE" && obj.soaked == 0)
            {
                scr39_SplitString(scrString("use_oil_fireplace"));
            }
            else if (item1 == "THE GAS CAN" && item2 == "THE FIREPLACE" && obj.soaked == 0)
            {
                scrSfx(o39__Game.soundDrain, 50);
                scr39_SplitString(scrString("use_gasoline_fireplace"));
                scr39_RemoveObject("THE GAS CAN");
                with (obj)
                {
                    soaked = 1;
                }
            }
            else if (item1 == "THE MATCHES" && item2 == "THE FIREPLACE")
            {
                if (obj.soaked == 0)
                {
                    scr39_SplitString(scrString("use_matches_fireplace"));
                }
                else
                {
                    scrSfx(o39__Game.soundIgnite, 50);
                    scr39_SplitString(scrString("use_matches_soaked"));
                    scr39_RemoveObject("THE MATCHES");
                    with (obj)
                    {
                        soaked = 2;
                        instance_create(x, y, o39_fxFire);
                    }
                }
            }
            else if ((item1 == "THE KNIFE" || item1 == "THE HEDGE SHEARS" || item1 == "THE TWEEZERS") && item2 == "THE HAND" && o39_aHand.open == ITEM_CLOSED)
            {
                scr39_SplitString(scrStringVal("use_other_hand", scr39_ItemGetName(item1)));
            }
            else if (item1 == "THE HACKSAW" && item2 == "THE HAND" && obj.open == ITEM_CLOSED)
            {
                scrSfx(o39__Game.soundSaw, 50);
                scr39_SplitString(scrString("use_hacksaw_hand"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                with (o39_aShower)
                {
                    open = 2;
                }
                scr39_TakeObject("THE INSIGNIA RING");
                o39__Game.insanity += 1;
            }
            else if (item1 == "THE HOOK" && item2 == "THE FRONT DOOR")
            {
                scr39_SplitString(scrString("use_hook_front_door"));
            }
            else if (item1 == "THE BOWL" && item2 == "THE BASIN")
            {
                if (obj.state == 0)
                {
                    scr39_SplitString(scrString("use_bowl_basin"));
                }
                else
                {
                    scr39_SplitString(o39__Cursor.strNoReason);
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE FRONT DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundPryOpen, 50);
                    scr39_SplitString(scrString("use_crowbar_front_door"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    scrSaveGame(0);
                }
                else
                {
                    scr39_SplitString(scrString("use_nothing_else"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE WOODEN DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_door"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE HALLWAY DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_door"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE GARAGE DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_garage"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE LOUNGE DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_door"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE SHED DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_door"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE BULKHEAD DOOR")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_lock"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE CROWBAR" && item2 == "THE CHEST")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_crowbar_lock"));
                }
                else
                {
                    scr39_SplitString(scrString("use_no_reason"));
                }
            }
            else if (item1 == "THE INSIGNIA RING" && item2 == "THE FOUNTAIN PLAQUE")
            {
                if (obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundDrain, 50);
                    scr39_SplitString(scrString("use_ring_plaque"));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    with (o39_aBasin)
                    {
                        state = 1;
                    }
                }
                else
                {
                    scr39_SplitString(scrString("use_ring_plaque_used"));
                }
            }
            else if (item1 == "THE GOLD KEY" && item2 == "THE LOUNGE DOOR")
            {
                scrSfx(o39__Game.soundUnlockB, 50);
                scr39_SplitString(scrString("use_gold_lounge_door"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE GOLD KEY");
            }
            else if ((item1 == "THE KNIFE" || item1 == "THE HEDGE SHEARS") && item2 == "THE ROPE")
            {
                scr39_SplitString(scrStringVal("use_other_rope", scr39_ItemGetName(item1)));
            }
            else if (item1 == "THE HACKSAW" && item2 == "THE ROPE")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundBundleDrop, 50);
                    scr39_SplitString(scrString("use_hacksaw_rope"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    with (o39_aBundleHang)
                    {
                        instance_create(x + 16, y + 104, o39_aBundleGround);
                        instance_destroy();
                    }
                    o39__Game.event_bundle = 1;
                    scrSaveGame(0);
                }
                else
                {
                    scr39_SplitString(scrString("use_rope_cut"));
                }
            }
            else if ((item1 == "THE HACKSAW" || item1 == "THE HEDGE SHEARS") && item2 == "THE BUNDLE")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrStringVal("use_other_bundle", scr39_ItemGetName(item1)));
                }
                else
                {
                    scr39_SplitString(scrString("use_item_bundle_open"));
                }
            }
            else if (item1 == "THE KNIFE" && item2 == "THE BUNDLE")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundCutOpen, 50);
                    scr39_SplitString(scrString("use_knife_bundle"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    o39__Game.event_bundle = 2;
                    o39__Game.insanity += 1;
                }
                else
                {
                    scr39_SplitString(scrString("use_item_bundle_open"));
                }
            }
            else if ((item1 == "THE HAMMER" || item1 == "THE WRENCH" || item1 == "THE CROWBAR" || item1 == "THE SHOVEL") && item2 == "THE VANITY MIRROR")
            {
                if (obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundShatter, 50);
                    scr39_SplitString(scrStringVal("use_break_mirror", scr39_ItemGetName(item1)));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    if (o39__Game.killerTime == -1)
                    {
                        scrSaveGame(0);
                    }
                    else
                    {
                        scr39_AlertKiller();
                    }
                }
                else
                {
                    scr39_SplitString(scrString("use_broken_mirror"));
                }
            }
            else if ((item1 == "THE HAMMER" || item1 == "THE WRENCH" || item1 == "THE CROWBAR" || item1 == "THE SHOVEL") && item2 == "THE FANCY MIRROR")
            {
                if (obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundShatter, 50);
                    scr39_SplitString(scrStringVal("use_break_mirror", scr39_ItemGetName(item1)));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    if (o39__Game.killerTime == -1)
                    {
                        scrSaveGame(0);
                    }
                    else
                    {
                        scr39_AlertKiller();
                    }
                }
                else
                {
                    scr39_SplitString(scrString("use_broken_mirror"));
                }
            }
            else if ((item1 == "THE HAMMER" || item1 == "THE WRENCH" || item1 == "THE CROWBAR" || item1 == "THE SHOVEL") && item2 == "THE MIRROR")
            {
                if (obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundShatter, 50);
                    scr39_SplitString(scrStringVal("use_break_mirror_hidden", scr39_ItemGetName(item1)));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    scr39_AlertKiller();
                }
                else
                {
                    scr39_SplitString(scrString("use_broken_mirror"));
                }
            }
            else if (item1 == "THE NUMERICAL CODE" && item2 == "THE LARGE PAINTING" && obj.open == 1)
            {
                scrSfx(o39__Game.soundUnlockA, 50);
                scr39_SplitString(scrString("use_code_safe"));
                with (obj)
                {
                    open = 2;
                }
                scr39_RemoveObject("THE NUMERICAL CODE");
            }
            else if (item1 == "THE MAGNIFYING GLASS" && item2 == "THE DOLLHOUSE")
            {
                if (obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundItemTake, 50);
                    scr39_SplitString(scrString("use_magnifying_doll_noted"));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    scr39_TakeObject("THE PASSWORD");
                }
                else
                {
                    scr39_SplitString(scrString("use_magnifying_dollhouse"));
                }
            }
            else if (item1 == "THE ALUMINUM KEY" && item2 == "THE MUSIC BOX")
            {
                scrBGM(bgm39_stingMusicbox, false);
                o39__Game.tStinger = 900;
                o39__Game.state = STATE_AUDIO_STINGER_WAIT;
                scr39_SplitString(scrString("use_aluminum_musicbox"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE ALUMINUM KEY");
                scr39_TakeObject("THE RED GLASSES");
            }
            else if (item1 == "THE RED GLASSES" && item2 == "THE WALL")
            {
                if (obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundItemTake, 50);
                    scr39_SplitString(scrString("use_glasses_wall_noted"));
                    with (o39_aRedView)
                    {
                        visible = true;
                    }
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    scr39_TakeObject("THE DIRECTIONS");
                }
                else
                {
                    scr39_SplitString(scrString("use_glasses_wall"));
                    with (o39_aRedView)
                    {
                        visible = true;
                    }
                }
            }
            else if (item1 == "THE NUMERICAL CODE" && item2 == "THE COMPUTER" && obj.open == 1)
            {
                scr39_SplitString(scrString("use_computer_code"));
            }
            else if (item1 == "THE PASSWORD" && item2 == "THE COMPUTER")
            {
                if (obj.open == 0)
                {
                    scr39_SplitString(scrString("use_password_computer_off"));
                }
                else if (obj.open == 1)
                {
                    scrSfx(o39__Game.soundComputerOn, 50);
                    scr39_SplitString(scrString("use_password_computer"));
                    with (obj)
                    {
                        open = 2;
                    }
                    scr39_RemoveObject("THE PASSWORD");
                    scrSaveGame(0);
                }
            }
            else if (item1 == "THE BRONZE KEY" && item2 == "THE CHEST")
            {
                scrSfx(o39__Game.soundUnlockA, 50);
                scr39_SplitString(scrString("use_bronze_chest"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE BRONZE KEY");
            }
            else if (item1 == "THE SHEET MUSIC" && item2 == "THE PIANO")
            {
                scrSfx(o39__Game.soundItemPlace, 50);
                scr39_SplitString(scrString("use_music_piano"));
                o39__Game.event_sheetmus = 3;
                scr39_RemoveObject("THE SHEET MUSIC");
                with (obj)
                {
                    activated = ITEM_ON;
                }
            }
            else if ((item1 == "THE RUBY" || item1 == "THE TOPAZ" || item1 == "THE DIAMOND") && item2 == "THE FOUNTAIN PLAQUE")
            {
                scr39_SplitString(scrStringVal("use_gem_plaque", scr39_ItemGetName(item1)));
            }
            else if ((item1 == "THE RUBY" || item1 == "THE TOPAZ" || item1 == "THE DIAMOND") && item2 == "THE FIRST LION")
            {
                if (obj.activated == ITEM_ON)
                {
                    scr39_SplitString(scrString("use_gem_lion_gem"));
                }
                else
                {
                    scr39_SplitString(scrStringFormat(scrString("use_gem_wrong_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                }
            }
            else if ((item1 == "THE EMERALD" || item1 == "THE TOPAZ" || item1 == "THE DIAMOND") && item2 == "THE SECOND LION")
            {
                if (obj.activated == ITEM_ON)
                {
                    scr39_SplitString(scrString("use_gem_lion_gem"));
                }
                else
                {
                    scr39_SplitString(scrStringFormat(scrString("use_gem_wrong_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                }
            }
            else if ((item1 == "THE RUBY" || item1 == "THE EMERALD" || item1 == "THE DIAMOND") && item2 == "THE THIRD LION")
            {
                if (obj.activated == ITEM_ON)
                {
                    scr39_SplitString(scrString("use_gem_lion_gem"));
                }
                else
                {
                    scr39_SplitString(scrStringFormat(scrString("use_gem_wrong_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                }
            }
            else if ((item1 == "THE RUBY" || item1 == "THE TOPAZ" || item1 == "THE EMERALD") && item2 == "THE FOURTH LION")
            {
                if (obj.activated == ITEM_ON)
                {
                    scr39_SplitString(scrString("use_gem_lion_gem"));
                }
                else
                {
                    scr39_SplitString(scrStringFormat(scrString("use_gem_wrong_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                }
            }
            else if (item1 == "THE EMERALD" && item2 == "THE FIRST LION")
            {
                scr39_SplitString(scrStringFormat(scrString("use_gem_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                with (obj)
                {
                    activated = ITEM_ON;
                }
                scr39_RemoveObject("THE EMERALD");
                if (verify(o39_aLionSpring) && verify(o39_aLionSummer) && verify(o39_aLionFall) && verify(o39_aLionWinter))
                {
                    if (o39_aLionSpring.activated == ITEM_ON && o39_aLionSummer.activated == ITEM_ON && o39_aLionFall.activated == ITEM_ON && o39_aLionWinter.activated == ITEM_ON)
                    {
                        scrSfx(o39__Game.soundUnlockSpecial, 50);
                        scr39_SplitString(scrString("use_gate_unlock"));
                        with (o39_aGateBack)
                        {
                            open = ITEM_OPEN;
                        }
                    }
                    else
                    {
                        scrSfx(o39__Game.soundPlaceGem, 50);
                    }
                }
                scrSaveGame(0);
            }
            else if (item1 == "THE RUBY" && item2 == "THE SECOND LION")
            {
                scr39_SplitString(scrStringFormat(scrString("use_gem_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                with (obj)
                {
                    activated = ITEM_ON;
                }
                scr39_RemoveObject("THE RUBY");
                if (verify(o39_aLionSpring) && verify(o39_aLionSummer) && verify(o39_aLionFall) && verify(o39_aLionWinter))
                {
                    if (o39_aLionSpring.activated == ITEM_ON && o39_aLionSummer.activated == ITEM_ON && o39_aLionFall.activated == ITEM_ON && o39_aLionWinter.activated == ITEM_ON)
                    {
                        scrSfx(o39__Game.soundUnlockSpecial, 50);
                        scr39_SplitString(scrString("use_gate_unlock"));
                        with (o39_aGateBack)
                        {
                            open = ITEM_OPEN;
                        }
                    }
                    else
                    {
                        scrSfx(o39__Game.soundPlaceGem, 50);
                    }
                }
                scrSaveGame(0);
            }
            else if (item1 == "THE TOPAZ" && item2 == "THE THIRD LION")
            {
                scr39_SplitString(scrStringFormat(scrString("use_gem_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                with (obj)
                {
                    activated = ITEM_ON;
                }
                scr39_RemoveObject("THE TOPAZ");
                if (verify(o39_aLionSpring) && verify(o39_aLionSummer) && verify(o39_aLionFall) && verify(o39_aLionWinter))
                {
                    if (o39_aLionSpring.activated == ITEM_ON && o39_aLionSummer.activated == ITEM_ON && o39_aLionFall.activated == ITEM_ON && o39_aLionWinter.activated == ITEM_ON)
                    {
                        scrSfx(o39__Game.soundUnlockSpecial, 50);
                        scr39_SplitString(scrString("use_gate_unlock"));
                        with (o39_aGateBack)
                        {
                            open = ITEM_OPEN;
                        }
                    }
                    else
                    {
                        scrSfx(o39__Game.soundPlaceGem, 50);
                    }
                }
                scrSaveGame(0);
            }
            else if (item1 == "THE DIAMOND" && item2 == "THE FOURTH LION")
            {
                scr39_SplitString(scrStringFormat(scrString("use_gem_lion"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
                with (obj)
                {
                    activated = ITEM_ON;
                }
                scr39_RemoveObject("THE DIAMOND");
                if (verify(o39_aLionSpring) && verify(o39_aLionSummer) && verify(o39_aLionFall) && verify(o39_aLionWinter))
                {
                    if (o39_aLionSpring.activated == ITEM_ON && o39_aLionSummer.activated == ITEM_ON && o39_aLionFall.activated == ITEM_ON && o39_aLionWinter.activated == ITEM_ON)
                    {
                        scrSfx(o39__Game.soundUnlockSpecial, 50);
                        scr39_SplitString(scrString("use_gate_unlock"));
                        with (o39_aGateBack)
                        {
                            open = ITEM_OPEN;
                        }
                    }
                    else
                    {
                        scrSfx(o39__Game.soundPlaceGem, 50);
                    }
                }
                scrSaveGame(0);
            }
            else if (item1 == "THE IRON KEY" && item2 == "THE BULKHEAD DOOR")
            {
                scrSfx(o39__Game.soundUnlockSpecial, 50);
                scr39_SplitString(scrString("use_iron_bulkhead"));
                with (obj)
                {
                    open = ITEM_OPEN;
                }
                scr39_RemoveObject("THE IRON KEY");
            }
            else if (item1 == "THE SCREWDRIVER" && item2 == "THE GEAR BOX")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scrSfx(o39__Game.soundOpenDoor, 50);
                    scr39_SplitString(scrString("use_screwdriver_gearbox"));
                    with (obj)
                    {
                        open = ITEM_OPEN;
                    }
                    scrSaveGame(0);
                }
                else
                {
                    scr39_SplitString(scrString("use_screwdriver_gear_open"));
                }
            }
            else if ((item1 == "THE WRENCH" || item1 == "THE CROWBAR") && item2 == "THE GEAR BOX")
            {
                if (obj.open == ITEM_CLOSED)
                {
                    scr39_SplitString(scrString("use_other_gearbox"));
                }
                else
                {
                    scr39_SplitString(scrString("use_screwdriver_gear_open"));
                }
            }
            else if (item1 == "THE OIL CAN" && item2 == "THE GEAR BOX")
            {
                scr39_SplitString(scrString("use_oil_gearbox"));
            }
            else if (item1 == "THE GEAR" && item2 == "THE GEAR BOX" && obj.open == 1)
            {
                scrSfx(o39__Game.soundItemPlace, 50);
                scr39_SplitString(scrString("use_gear_gearbox"));
                with (obj)
                {
                    open = 2;
                }
                scr39_RemoveObject("THE GEAR");
                scrSaveGame(0);
            }
            else if (item1 == "THE PIANO WIRE" && item2 == "THE WIRES")
            {
                scrSfx(o39__Game.soundSpark, 50);
                scr39_SplitString(scrString("use_wire_wires"));
                with (obj)
                {
                    activated = ITEM_ON;
                }
                scr39_RemoveObject("THE PIANO WIRE");
                scrSaveGame(0);
            }
            else if (item1 == "THE OIL CAN" && item2 == "THE LEVER")
            {
                scrSfx(o39__Game.soundSpray, 50);
                scr39_SplitString(scrString("use_oil_lever"));
                with (obj)
                {
                    oiled = 1;
                }
                if (o39_aCarTrunk.open)
                {
                    scr39_RemoveObject("THE OIL CAN");
                }
                scrSaveGame(0);
            }
            else if (item1 == "THE SPOON" && item2 == "THE ABOMINATION")
            {
                scr39_SplitString(scrString("you_gag"));
            }
            else if ((item1 == "THE KNIFE" || item1 == "THE HEDGE SHEARS" || item1 == "THE SHOVEL" || item1 == "THE HAMMER" || item1 == "THE CROWBAR" || item1 == "THE HACKSAW" || item1 == "THE SCREWDRIVER") && item2 == "THE ABOMINATION")
            {
                scrSfx(o39__Game.soundCoreTorment, 50);
                scr39_SplitString(scrString("use_weapon_abomination"));
            }
            else if ((item1 == "THE CIGAR BUTT" || item1 == "THE TEA TREE OIL" || item1 == "THE PEROXIDE") && item2 == "THE ABOMINATION")
            {
                if (o39__Game.hasRecipe == true)
                {
                    scr39_SplitString(scrStringVal("use_ingredient_abomination", scr39_ItemGetName(item1)));
                }
                else
                {
                    scr39_SplitString(o39__Cursor.strNoReason);
                }
            }
            else if ((item1 == "THE KNIFE" || item1 == "THE HEDGE SHEARS" || item1 == "THE SHOVEL" || item1 == "THE HAMMER" || item1 == "THE CROWBAR" || item1 == "THE HACKSAW" || item1 == "THE SCREWDRIVER") && item2 == "THE PUSTULE")
            {
                scr39_SplitString(scrString("use_weapon_pustule"));
            }
            else if (item1 == "THE FUNGICIDE" && item2 == "THE ABOMINATION")
            {
                muteBGM();
                scrSfx(o39__Game.soundCoreKill, 50);
                with (o39_aFungalCore)
                {
                    sprite_index = s39_aFungalCoreDie;
                }
                with (o39_aPustule)
                {
                    image_speed = 0.5;
                }
                scr39_SplitString(scrString("use_fungicide_abomination"));
                state = 1;
                substate = 4;
                scrSaveGame(0);
            }
            else if ((item1 == "THE KNIFE" || item1 == "THE HACKSAW") && (item2 == "THE METAL BOX" || item2 == "THE SUNROOM DOOR"))
            {
                scr39_SplitString(scrStringVal("use_other_vines", scr39_ItemGetName(item1)));
            }
            else if ((item1 == "THE GAS CAN" || item1 == "THE DRAIN CLEANER" || item1 == "THE FUNGICIDE") && item2 == "THE ANTS")
            {
                scr39_SplitString(scrString("use_weapon_ants"));
            }
            else if (item2 == "THE ANTS")
            {
                scr39_SplitString(scrString("use_other_ants"));
            }
            else if (item1 == "THE ARMED CROSSBOW")
            {
                if (item2 == "THE VANITY MIRROR" && obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundShatter, 50);
                    scr39_SplitString(scrString("use_crossbow_mirror"));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    scr39_RemoveObject("THE ARMED CROSSBOW");
                    night_manor_give_object(58);
                    night_manor_give_object(67);
                    scrSaveGame(0);
                    scr39_AlertKiller();
                }
                else if (item2 == "THE FANCY MIRROR" && obj.activated == ITEM_OFF)
                {
                    scrSfx(o39__Game.soundShatter, 50);
                    scr39_SplitString(scrString("use_crossbow_mirror"));
                    with (obj)
                    {
                        activated = ITEM_ON;
                    }
                    scr39_RemoveObject("THE ARMED CROSSBOW");
                    night_manor_give_object(58);
                    night_manor_give_object(67);
                    scrSaveGame(0);
                    scr39_AlertKiller();
                }
                else
                {
                    scrSfx(o39__Game.soundCrossbowMiss, 30);
                    scr39_SplitString(scrString("use_crossbow_nothing"));
                    scr39_RemoveObject("THE ARMED CROSSBOW");
                    night_manor_give_object(58);
                    night_manor_give_object(67);
                    scrSaveGame(0);
                }
            }
            else
            {
                scr39_SplitString(scrStringFormat(scrString("use_nothing_happens"), scr39_ItemGetName(item1), scr39_ItemGetName(item2)));
            }
        }
    }
    else if (scrPointInBox(x, y, 2012, 320, 2212, 362) || scrPointInBox(x, y, 2072, 303, 2167, 320))
    {
        if (o39__Game.item1 == "THE STEEL KEY")
        {
            scr39_SplitString(scrString("use_steel_trunk"));
        }
        else if (o39__Game.item1 == "THE HAMMER" || o39__Game.item1 == "THE WRENCH" || o39__Game.item1 == "THE CROWBAR" || o39__Game.item1 == "THE SHOVEL")
        {
            scr39_SplitString(scrString("use_break_car"));
        }
        else if (o39__Game.item1 == "THE GAS CAN")
        {
            scr39_SplitString(scrString("use_gasoline_car"));
        }
        else
        {
            scr39_SplitString(scrStringVal("use_on_maze", scr39_ItemGetName(o39__Game.item1)));
        }
    }
    else if (scrPointInBox(x, y, 944, 496, 976, 560) || scrPointInBox(x, y, 872, 480, 888, 592) || scrPointInBox(x, y, 1024, 480, 1048, 592))
    {
        with (o39__Game)
        {
            state = 1;
            if (item1 == "THE DIRECTIONS")
            {
                scrSfx(o39__Game.soundTransitionWalk, 30);
                nextRoom = 15;
                if (!oGame.fadeOut)
                {
                    oGame.fadeOut = true;
                    state = 99;
                }
            }
            else
            {
                scr39_SplitString(scrStringVal("use_on_maze", scr39_ItemGetName(item1)));
            }
        }
    }
    else if (scrPointInBox(x, y, 267, 25, 291, 93) && o39__Game.item1 == "THE SPOON")
    {
        scr39_SplitString(scrString("use_spoon_boards"));
    }
    else if (scrPointInBox(x, y, 267, 25, 291, 93) && o39__Game.item1 == "THE CROWBAR")
    {
        scr39_SplitString(scrString("use_crowbar_boards"));
    }
    else if ((scrPointInBox(x, y, 1542, 705, 1580, 782) || scrPointInBox(x, y, 1610, 719, 1633, 762) || scrPointInBox(x, y, 1655, 727, 1684, 750) || scrPointInBox(x, y, 207, 950, 233, 982) || scrPointInBox(x, y, 288, 948, 309, 981) || scrPointInBox(x, y, 339, 928, 378, 1006) || scrPointInBox(x, y, 481, 951, 497, 977) || scrPointInBox(x, y, 892, 940, 923, 993) || scrPointInBox(x, y, 997, 940, 1015, 993) || scrPointInBox(x, y, 1065, 940, 1078, 978) || scrPointInBox(x, y, 1110, 927, 1147, 964) || scrPointInBox(x, y, 1766, 726, 1790, 736) || scrPointInBox(x, y, 1780, 737, 1790, 760) || scrPointInBox(x, y, 2108, 722, 2120, 740)) && o39__Game.item1 == "THE CROWBAR")
    {
        scr39_SplitString(scrString("default_boarded_pry"));
    }
    else if (o39__Game.item1 == "THE DRAIN CLEANER")
    {
        if (scrPointInBox(x, y, 1707, 301, 1744, 312))
        {
            scr39_SplitString(scrString("use_cleaner_other_sink"));
        }
        else if (scrPointInBox(x, y, 1598, 100, 1654, 151))
        {
            scr39_SplitString(scrString("use_cleaner_toilet"));
        }
        else
        {
            scr39_SplitString(scrString("use_cleaner_other"));
        }
    }
    else if ((scrPointInBox(x, y, 1598, 100, 1654, 151) || scrPointInBox(x, y, 477, 984, 497, 1019)) && o39__Game.item1 == "THE BOWL")
    {
        scr39_SplitString(scrString("you_gag"));
    }
    else if (o39__Game.item1 == "THE GAS CAN")
    {
        scr39_SplitString(scrString("use_gasoline_other"));
    }
    else if (scrPointInBox(x, y, 904, 993, 1015, 1039) && o39__Game.item1 == "THE POOL CUE")
    {
        scr39_SplitString(scrString("use_pool_table"));
    }
    else if (o39__Game.item1 == "THE FLASHLIGHT")
    {
        scrSfx(o39__Game.soundFlickSwitch, 50);
        scr39_SplitString(scrString("use_flashlight_dead"));
    }
    else if (o39__Game.item1 == "THE LIT FLASHLIGHT")
    {
        scr39_SplitString(scrString("use_flashlight_other"));
    }
    else if (o39__Game.item1 == "THE SHOVEL")
    {
        if (o39__Game.currRoom == ROOM_DOG)
        {
            scr39_SplitString(scrString("use_shovel_dog"));
        }
        else
        {
            scr39_SplitString(scrString("use_shovel_other"));
        }
    }
    else if (o39__Game.item1 == "THE ARMED CROSSBOW")
    {
        if (instance_exists(o39_aKiller) && o39__Game.currRoom == o39__Game.killerRoom)
        {
            scrSfx(o39__Game.soundCrossbowMiss, 30);
            scr39_SplitString(scrString("use_crossbow_miss"));
            o39__Game.killerTime = 1;
            scr39_RemoveObject("THE ARMED CROSSBOW");
            night_manor_give_object(58);
            night_manor_give_object(67);
            scrSaveGame(0);
        }
        else
        {
            scrSfx(o39__Game.soundCrossbowMiss, 30);
            scr39_SplitString(scrString("use_crossbow_other"));
            scr39_RemoveObject("THE ARMED CROSSBOW");
            night_manor_give_object(58);
            night_manor_give_object(67);
            scrSaveGame(0);
        }
    }
    else
    {
        with (o39__Game)
        {
            state = STATE_TEXT;
            scr39_SplitString(scrStringVal("use_on_maze", scr39_ItemGetName(item1)));
        }
    }
}
