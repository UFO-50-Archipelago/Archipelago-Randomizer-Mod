function scr39_SaveGame(arg0)
{
    if (!instance_exists(o39__Game))
    {
        exit;
    }
    if (arg0 == 99)
    {
        with (o39__Game)
        {
            scrSetGoal(global.GOLD_WIN, -1);
            scrSetGoal(global.CHERRY_WIN, -1);
            scrSetGoal(global.GARDEN_WIN, -1);
            return false;
        }
    }
    else if (arg0 == 0)
    {
        if (verify(o39__Game))
        {
            scrWriteReal("bgmState", o39__Game.bgmState);
            for (var i = 0; i < o39__Game.invSizeMax; i++)
            {
                scrWriteString("inv" + string(i), o39__Game.inv[i]);
            }
            scrWriteReal("invNumItems", o39__Game.invNumItems);
            scrWriteReal("invLastSlotFilled", o39__Game.invLastSlotFilled);
            scrWriteReal("invDispStart", o39__Game.invDispStart);
            scrWriteReal("itemsCollected", o39__Game.itemsCollected);
            scrWriteReal("itemsPercent", o39__Game.itemsPercent);
            for (var i = 0; i < o39__Game.invSizeMax; i++)
            {
                scrWriteString("invJournal" + string(i), o39__Game.invJournal[i]);
            }
            scrWriteReal("invNumJournalEntries", o39__Game.invNumJournalEntries);
            scrWriteReal("killerMeet", o39__Game.killerMeet);
            scrWriteReal("deaths", o39__Game.deaths);
            scrWriteReal("escapes", o39__Game.escapes);
            scrWriteReal("killerTime", o39__Game.killerTime);
            scrWriteReal("killerRoom", o39__Game.killerRoom);
            scrWriteReal("killerHit", o39__Game.killerHit);
            scrWriteReal("insanity_value", o39__Game.insanity);
            scrWriteReal("event_shedIns", o39__Game.shedInsanity);
            scrWriteReal("event_growthIns", o39__Game.growthInsanity);
            scrWriteReal("event_dogIns", o39__Game.dogInsanity);
            scrWriteReal("hidCurtains", o39__Game.hidCurtains);
            scrWriteReal("hidBedPlant", o39__Game.hidBedPlant);
            scrWriteReal("hidLoungePlant", o39__Game.hidLoungePlant);
            scrWriteReal("hidToyBear", o39__Game.hidToyBear);
            scrWriteReal("event_vent", o39__Game.event_vent);
            scrWriteReal("event_door0", o39__Game.event_door0);
            scrWriteReal("event_closet", o39__Game.event_closet);
            if (verify(o39_aJournalDrawer))
            {
                scrWriteReal("event_drawer", o39_aJournalDrawer.open);
            }
            if (verify(o39_aCabKitchenL))
            {
                scrWriteReal("event_kitCabL", o39_aCabKitchenL.open);
            }
            if (verify(o39_aCabKitchenR))
            {
                scrWriteReal("event_kitCabR", o39_aCabKitchenR.open);
            }
            if (verify(o39_aRange))
            {
                scrWriteReal("event_range", o39_aRange.open);
            }
            if (verify(o39_aDishwasher))
            {
                scrWriteReal("event_dishwasher", o39_aDishwasher.open);
            }
            if (verify(o39_aDrawerKitch))
            {
                scrWriteReal("event_kitDrawer", o39_aDrawerKitch.open);
            }
            if (verify(o39_aCabSinkL))
            {
                scrWriteReal("event_kitCabSinkL", o39_aCabSinkL.open);
            }
            if (verify(o39_aCabSinkR))
            {
                scrWriteReal("event_kitCabSinkR", o39_aCabSinkR.open);
            }
            if (verify(o39_aToyBox))
            {
                scrWriteReal("event_toybox", o39_aToyBox.open);
            }
            if (verify(o39_aKidDrawerL))
            {
                scrWriteReal("event_kidDrawerL", o39_aKidDrawerL.open);
            }
            if (verify(o39_aKidDrawerR))
            {
                scrWriteReal("event_kidDrawerR", o39_aKidDrawerR.open);
            }
            if (verify(o39_aDresser))
            {
                scrWriteReal("event_dresser", o39_aDresser.open);
            }
            if (verify(o39_aCabGaming))
            {
                scrWriteReal("event_gamingCab", o39_aCabGaming.open);
            }
            if (verify(o39_aWasher))
            {
                scrWriteReal("event_washer", o39_aWasher.open);
            }
            if (verify(o39_aDryer))
            {
                scrWriteReal("event_dryer", o39_aDryer.open);
            }
            if (verify(o39_aHand))
            {
                scrWriteReal("event_hand", o39_aHand.open);
            }
            if (verify(o39_aShower))
            {
                scrWriteReal("event_shower", o39_aShower.open);
            }
            if (verify(o39_aSink))
            {
                scrWriteReal("event_sink", o39_aSink.state);
            }
            if (verify(o39_aBasin))
            {
                scrWriteReal("event_basin", o39_aBasin.state);
            }
            scrWriteReal("event_cog", o39__Game.event_cog);
            scrWriteReal("event_darkness", o39__Game.event_darkness);
            if (verify(o39_aCandelabra))
            {
                scrWriteReal("event_candles", o39_aCandelabra.state);
            }
            if (verify(o39_aDrowned))
            {
                scrWriteReal("event_drowned", o39_aDrowned.state);
            }
            if (verify(o39_aBurlapSack))
            {
                scrWriteReal("event_sack", o39_aBurlapSack.open);
            }
            if (verify(o39_aLawnmower))
            {
                scrWriteReal("event_mower", o39_aLawnmower.open);
            }
            if (verify(o39_aGarageMech))
            {
                scrWriteReal("event_garageMech", o39_aGarageMech.state);
            }
            if (verify(o39_aDoorGarage))
            {
                scrWriteReal("event_doorGarage", o39_aDoorGarage.open);
            }
            if (verify(o39_aGarage))
            {
                scrWriteReal("event_garage", o39_aGarage.open);
            }
            if (verify(o39_aDoorShed))
            {
                scrWriteReal("event_doorShed", o39_aDoorShed.open);
            }
            if (verify(o39_aBaseEntrance))
            {
                scrWriteReal("event_baseEnt", o39_aBaseEntrance.open);
            }
            if (verify(o39_aCabChina))
            {
                scrWriteReal("event_cabChina", o39_aCabChina.open);
            }
            if (verify(o39_aLionSpring))
            {
                scrWriteReal("event_lionSpring", o39_aLionSpring.activated);
            }
            if (verify(o39_aLionSummer))
            {
                scrWriteReal("event_lionSummer", o39_aLionSummer.activated);
            }
            if (verify(o39_aLionFall))
            {
                scrWriteReal("event_lionFall", o39_aLionFall.activated);
            }
            if (verify(o39_aLionWinter))
            {
                scrWriteReal("event_lionWinter", o39_aLionWinter.activated);
            }
            if (verify(o39_aGateBack))
            {
                scrWriteReal("event_gateBack", o39_aGateBack.open);
            }
            scrWriteReal("event_bundle", o39__Game.event_bundle);
            if (verify(o39_aRope))
            {
                scrWriteReal("event_rope", o39_aRope.open);
            }
            scrWriteReal("event_dirt", o39__Game.event_dirt);
            if (verify(o39_aDoorVines))
            {
                scrWriteReal("event_doorVines", o39_aDoorVines.open);
            }
            if (verify(o39_aMetalBox))
            {
                scrWriteReal("event_metalBox", o39_aMetalBox.open);
            }
            if (verify(o39_aDoorFront))
            {
                scrWriteReal("event_doorFront", o39_aDoorFront.open);
            }
            if (verify(o39_aMusicBox))
            {
                scrWriteReal("event_musicBox", o39_aMusicBox.open);
            }
            if (verify(o39_aDollhouse))
            {
                scrWriteReal("event_dollhouse", o39_aDollhouse.activated);
            }
            if (verify(o39_aGate))
            {
                scrWriteReal("event_gate", o39_aGate.open);
            }
            if (verify(o39_aDoorBath2))
            {
                scrWriteReal("event_doorBath", o39_aDoorBath2.open);
            }
            if (verify(o39_aTrapDown))
            {
                scrWriteReal("event_trapDown", o39_aTrapDown.open);
            }
            if (verify(o39_aTrapUp))
            {
                scrWriteReal("event_trapUp", o39_aTrapUp.open);
            }
            if (verify(o39_aDoorLounge))
            {
                scrWriteReal("event_doorLounge", o39_aDoorLounge.open);
            }
            if (verify(o39_aFinalDoor))
            {
                scrWriteReal("event_finalDoor", o39_aFinalDoor.open);
            }
            if (verify(o39_aFireplace))
            {
                scrWriteReal("event_fireplace", o39_aFireplace.soaked);
            }
            if (verify(o39_aVise))
            {
                scrWriteReal("event_vise", o39_aVise.open);
            }
            if (verify(o39_aBed))
            {
                scrWriteReal("event_bed", o39_aBed.open);
            }
            if (verify(o39_aBundleGround))
            {
                scrWriteReal("event_bundleGround", o39_aBundleGround.open);
            }
            if (verify(o39_aChest))
            {
                scrWriteReal("event_chest", o39_aChest.open);
            }
            if (verify(o39_aPiano))
            {
                scrWriteReal("event_piano", o39_aPiano.activated);
            }
            if (verify(o39_aCabBath))
            {
                scrWriteReal("event_cabBath", o39_aCabBath.open);
            }
            if (verify(o39_aMirror))
            {
                scrWriteReal("event_mirror", o39_aMirror.activated);
            }
            if (verify(o39_aBook))
            {
                scrWriteReal("event_book", o39_aBook.activated);
            }
            if (verify(o39_aComputer))
            {
                scrWriteReal("event_computer", o39_aComputer.open);
            }
            if (verify(o39_aCompTrash))
            {
                scrWriteReal("event_compTrash", o39_aCompTrash.open);
            }
            scrWriteReal("event_chair", o39__Game.event_chair);
            if (verify(o39_aPaintingBig))
            {
                scrWriteReal("event_painting", o39_aPaintingBig.open);
            }
            if (verify(o39_aPlaqueFount))
            {
                scrWriteReal("event_plaque", o39_aPlaqueFount.activated);
            }
            if (verify(o39_aFinalBox))
            {
                scrWriteReal("event_finalBox", o39_aFinalBox.open);
            }
            if (verify(o39_aFinalLever))
            {
                scrWriteReal("event_finalLeverOiled", o39_aFinalLever.oiled);
            }
            if (verify(o39_aFinalLever))
            {
                scrWriteReal("event_finalLeverActivated", o39_aFinalLever.activated);
            }
            if (verify(o39_aFinalWires))
            {
                scrWriteReal("event_finalWires", o39_aFinalWires.activated);
            }
            if (verify(o39_aDoorBase))
            {
                scrWriteReal("event_doorBase", o39_aDoorBase.open);
            }
            if (verify(o39_aDoorBase2))
            {
                scrWriteReal("event_doorBase2", o39_aDoorBase2.open);
            }
            scrWriteReal("event_darkness", o39__Game.event_darkness);
            scrWriteReal("event_recipe", o39__Game.hasRecipe);
            if (is_location_collected(night_manor_name_to_loc("THE SHEET MUSIC")) && o39__Game.event_sheetmus < 2)
            {
                o39__Game.event_sheetmus = 2;
            }
            scrWriteReal("event_sheetmus", o39__Game.event_sheetmus);
            if (verify(o39_aCarDoor))
            {
                scrWriteReal("event_carDoor", o39_aCarDoor.open);
            }
            if (verify(o39_aWall))
            {
                scrWriteReal("event_wall", o39_aWall.activated);
            }
            if (verify(o39_aJewelryBox))
            {
                scrWriteReal("event_jewelryBox", o39_aJewelryBox.open);
            }
            scrWriteReal("bowl_added_tea_oil", o39__Game.bowl_added_tea_oil);
            scrWriteReal("bowl_added_cigar", o39__Game.bowl_added_cigar);
            scrWriteReal("bowl_added_peroxide", o39__Game.bowl_added_peroxide);
            scrWriteReal("currRoom", o39__Game.currRoom);
            scrWriteReal("nextRoom", o39__Game.nextRoom);
            scrWriteReal("lastRoom", o39__Game.lastRoom);
            scrWriteReal("roomJournal", o39__Game.roomJournal);
            for (var i = 0; i < 40; i++)
            {
                scrWriteReal("roomHasVisited" + string(i), o39__Game.roomHasVisited[i]);
            }
            scrSetRecord(false, o39__Game.itemsPercent);
            scrSetRecord(true, o39__Game.itemsPercent);
            scrSetDetail(1, string(o39__Game.invNumJournalEntries) + "/17");
            scrSetDetail(2, o39__Game.deaths);
            return true;
        }
    }
    else if (arg0 == 1)
    {
        if (verify(o39__Game))
        {
            o39__Game.bgmState = scrReadReal("bgmState", 1);
            for (var i = 0; i < o39__Game.invSizeMax; i++)
            {
                o39__Game.inv[i] = scrReadString("inv" + string(i), "");
            }
            o39__Game.invNumItems = scrReadReal("invNumItems", 0);
            o39__Game.invLastSlotFilled = scrReadReal("invLastSlotFilled", -1);
            o39__Game.invDispStart = scrReadReal("invDispStart", 0);
            o39__Game.itemsCollected = scrReadReal("itemsCollected", 0);
            o39__Game.itemsPercent = scrReadReal("itemsPercent", 0);
            o39__Game.bowl_added_tea_oil = scrReadReal("bowl_added_tea_oil", 0);
            o39__Game.bowl_added_cigar = scrReadReal("bowl_added_cigar", 0);
            o39__Game.bowl_added_peroxide = scrReadReal("bowl_added_peroxide", 0);
            for (var i = 0; i < o39__Game.invSizeMax; i++)
            {
                o39__Game.invJournal[i] = scrReadString("invJournal" + string(i), "");
            }
            o39__Game.invNumJournalEntries = scrReadReal("invNumJournalEntries", 0);
            with (o39_aSpoon)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aBowl)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aMatches)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aKnife)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aDuctTape)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aFlashlight)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aOilCan)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aHammer)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aWrench)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aScrewdriver)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aShears)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aShovel)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aSteelKey)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aDoll)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aPoolCue)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aCigarButt)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aTeaOil)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aMagGlass)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal01)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal02)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal03)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal04)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal06)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal07)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal08)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal09)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal10)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal11)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal12)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal13)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal14)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal16)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal17)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aJournal18)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            with (o39_aBolt)
            {
                if (is_location_collected(night_manor_name_to_loc("THE CROSSBOW BOLT")))
                {
                    instance_destroy();
                }
            }
            o39__Game.killerMeet = scrReadReal("killerMeet", 0);
            o39__Game.deaths = scrReadReal("deaths", 0);
            o39__Game.escapes = scrReadReal("escapes", 0);
            o39__Game.killerTime = scrReadReal("killerTime", 0);
            o39__Game.killerRoom = scrReadReal("killerRoom", 0);
            o39__Game.killerHit = scrReadReal("killerHit", 0);
            if (o39__Game.killerMeet > 0)
            {
                o39__Game.bgmScene[10] = bgm39_interior;
                with (o39_aKillerSmall)
                {
                    instance_destroy();
                }
                if (o39__Game.killerTime > -1 && o39__Game.killerTime < 20)
                {
                    o39__Game.killerTime = 20;
                }
            }
            o39__Game.insanity = scrReadReal("insanity_value", 0);
            o39__Game.shedInsanity = scrReadReal("event_shedIns", 0);
            o39__Game.growthInsanity = scrReadReal("event_growthIns", 0);
            o39__Game.dogInsanity = scrReadReal("event_dogIns", 0);
            o39__Game.hidCurtains = scrReadReal("hidCurtains", 0);
            o39__Game.hidBedPlant = scrReadReal("hidBedPlant", 0);
            o39__Game.hidLoungePlant = scrReadReal("hidLoungePlant", 0);
            o39__Game.hidToyBear = scrReadReal("hidToyBear", 0);
            o39__Game.event_vent = scrReadReal("event_vent", 0);
            o39__Game.event_door0 = scrReadReal("event_door0", 0);
            o39__Game.event_closet = scrReadReal("event_closet", 0);
            if (verify(o39_aHand))
            {
                o39_aHand.open = scrReadReal("event_hand", 0);
            }
            if (verify(o39_aShower))
            {
                o39_aShower.open = scrReadReal("event_shower", 0);
            }
            o39__Game.event_cog = scrReadReal("event_cog", 0);
            if (verify(o39_aSink))
            {
                o39_aSink.state = scrReadReal("event_sink", 0);
            }
            if (verify(o39_aBasin))
            {
                o39_aBasin.state = scrReadReal("event_basin", 0);
            }
            if (verify(o39_aJournalDrawer))
            {
                o39_aJournalDrawer.open = scrReadReal("event_drawer", 0);
            }
            if (verify(o39_aCabKitchenL))
            {
                o39_aCabKitchenL.open = scrReadReal("event_kitCabL", 0);
            }
            if (verify(o39_aCabKitchenR))
            {
                o39_aCabKitchenR.open = scrReadReal("event_kitCabR", 0);
            }
            if (verify(o39_aRange))
            {
                o39_aRange.open = scrReadReal("event_range", 0);
            }
            if (verify(o39_aDishwasher))
            {
                o39_aDishwasher.open = scrReadReal("event_dishwasher", 0);
            }
            if (verify(o39_aDrawerKitch))
            {
                o39_aDrawerKitch.open = scrReadReal("event_kitDrawer", 0);
            }
            if (verify(o39_aCabSinkL))
            {
                o39_aCabSinkL.open = scrReadReal("event_kitCabSinkL", 0);
            }
            if (verify(o39_aCabSinkR))
            {
                o39_aCabSinkR.open = scrReadReal("event_kitCabSinkR", 0);
            }
            if (verify(o39_aToyBox))
            {
                o39_aToyBox.open = scrReadReal("event_toybox", 0);
            }
            if (verify(o39_aKidDrawerL))
            {
                o39_aKidDrawerL.open = scrReadReal("event_kidDrawerL", 0);
            }
            if (verify(o39_aKidDrawerR))
            {
                o39_aKidDrawerR.open = scrReadReal("event_kidDrawerR", 0);
            }
            if (verify(o39_aDresser))
            {
                o39_aDresser.open = scrReadReal("event_dresser", 0);
            }
            if (verify(o39_aCabGaming))
            {
                o39_aCabGaming.open = scrReadReal("event_gamingCab", 0);
            }
            if (verify(o39_aWasher))
            {
                o39_aWasher.open = scrReadReal("event_washer", 0);
            }
            if (verify(o39_aDryer))
            {
                o39_aDryer.open = scrReadReal("event_dryer", 0);
            }
            if (verify(o39_aCandelabra))
            {
                o39_aCandelabra.state = scrReadReal("event_candles", 0);
            }
            if (verify(o39_aDrowned))
            {
                o39_aDrowned.state = scrReadReal("event_drowned", 0);
            }
            if (verify(o39_aBurlapSack))
            {
                o39_aBurlapSack.open = scrReadReal("event_sack", 0);
            }
            if (verify(o39_aLawnmower))
            {
                o39_aLawnmower.open = scrReadReal("event_mower", 0);
            }
            if (verify(o39_aDoorShed))
            {
                o39_aDoorShed.open = scrReadReal("event_doorShed", 0);
            }
            if (verify(o39_aGarageMech))
            {
                o39_aGarageMech.state = scrReadReal("event_garageMech", 0);
            }
            if (verify(o39_aDoorGarage))
            {
                o39_aDoorGarage.open = scrReadReal("event_doorGarage", 0);
            }
            if (verify(o39_aGarage))
            {
                o39_aGarage.open = scrReadReal("event_garage", 0);
            }
            if (verify(o39_aBaseEntrance))
            {
                o39_aBaseEntrance.open = scrReadReal("event_baseEnt", 0);
            }
            if (verify(o39_aCabChina))
            {
                o39_aCabChina.open = scrReadReal("event_cabChina", 0);
            }
            if (verify(o39_aLionSpring))
            {
                o39_aLionSpring.activated = scrReadReal("event_lionSpring", 0);
            }
            if (verify(o39_aLionSummer))
            {
                o39_aLionSummer.activated = scrReadReal("event_lionSummer", 0);
            }
            if (verify(o39_aLionFall))
            {
                o39_aLionFall.activated = scrReadReal("event_lionFall", 0);
            }
            if (verify(o39_aLionWinter))
            {
                o39_aLionWinter.activated = scrReadReal("event_lionWinter", 0);
            }
            if (verify(o39_aGateBack))
            {
                o39_aGateBack.open = scrReadReal("event_gateBack", 0);
            }
            o39__Game.event_bundle = scrReadReal("event_bundle", 0);
            if (verify(o39_aRope))
            {
                o39_aRope.open = scrReadReal("event_rope", 0);
            }
            o39__Game.event_dirt = scrReadReal("event_dirt", 0);
            if (verify(o39_aDoorVines))
            {
                o39_aDoorVines.open = scrReadReal("event_doorVines", 0);
            }
            if (verify(o39_aMetalBox))
            {
                o39_aMetalBox.open = scrReadReal("event_metalBox", 0);
            }
            if (verify(o39_aDoorFront))
            {
                o39_aDoorFront.open = scrReadReal("event_doorFront", 0);
            }
            if (verify(o39_aMusicBox))
            {
                o39_aMusicBox.open = scrReadReal("event_musicBox", 0);
            }
            if (verify(o39_aDollhouse))
            {
                o39_aDollhouse.activated = scrReadReal("event_dollhouse", 0);
            }
            if (verify(o39_aGate))
            {
                o39_aGate.open = scrReadReal("event_gate", 0);
            }
            if (verify(o39_aDoorBath2))
            {
                o39_aDoorBath2.open = scrReadReal("event_doorBath", 0);
            }
            if (verify(o39_aTrapDown))
            {
                o39_aTrapDown.open = scrReadReal("event_trapDown", 0);
            }
            if (verify(o39_aTrapDown) && o39_aTrapDown.open == 1)
            {
                o39_aTrapDown.active = true;
            }
            if (verify(o39_aTrapUp))
            {
                o39_aTrapUp.open = scrReadReal("event_trapUp", 0);
            }
            if (verify(o39_aPlaqueFount))
            {
                o39_aPlaqueFount.activated = scrReadReal("event_plaque", 0);
            }
            if (verify(o39_aDoorLounge))
            {
                o39_aDoorLounge.open = scrReadReal("event_doorLounge", 0);
            }
            if (verify(o39_aFinalDoor))
            {
                o39_aFinalDoor.open = scrReadReal("event_finalDoor", 0);
            }
            if (verify(o39_aFireplace))
            {
                o39_aFireplace.soaked = scrReadReal("event_fireplace", 0);
            }
            if (verify(o39_aVise))
            {
                o39_aVise.open = scrReadReal("event_vise", 0);
            }
            if (verify(o39_aBed))
            {
                o39_aBed.open = scrReadReal("event_bed", 0);
            }
            if (verify(o39_aChest))
            {
                o39_aChest.open = scrReadReal("event_chest", 0);
            }
            if (verify(o39_aPiano))
            {
                o39_aPiano.activated = scrReadReal("event_piano", 0);
            }
            if (verify(o39_aCabBath))
            {
                o39_aCabBath.open = scrReadReal("event_cabBath", 0);
            }
            if (verify(o39_aMirror))
            {
                o39_aMirror.activated = scrReadReal("event_mirror", 0);
            }
            if (verify(o39_aBook))
            {
                o39_aBook.activated = scrReadReal("event_book", 0);
            }
            if (verify(o39_aComputer))
            {
                o39_aComputer.open = scrReadReal("event_computer", 0);
            }
            if (verify(o39_aCompTrash))
            {
                o39_aCompTrash.open = scrReadReal("event_compTrash", 0);
            }
            o39__Game.event_chair = scrReadReal("event_chair", 0);
            if (verify(o39_aPaintingBig))
            {
                o39_aPaintingBig.open = scrReadReal("event_painting", 0);
            }
            if (verify(o39_aFinalBox))
            {
                o39_aFinalBox.open = scrReadReal("event_finalBox", 0);
            }
            if (verify(o39_aFinalLever))
            {
                o39_aFinalLever.oiled = scrReadReal("event_finalLeverOiled", 0);
            }
            if (verify(o39_aFinalLever))
            {
                o39_aFinalLever.activated = scrReadReal("event_finalLeverActivated", 0);
            }
            if (verify(o39_aFinalWires))
            {
                o39_aFinalWires.activated = scrReadReal("event_finalWires", 0);
            }
            if (verify(o39_aDoorBase))
            {
                o39_aDoorBase.open = scrReadReal("event_doorBase", 0);
            }
            if (verify(o39_aDoorBase2))
            {
                o39_aDoorBase2.open = scrReadReal("event_doorBase2", 0);
            }
            o39__Game.event_darkness = scrReadReal("event_darkness", 0);
            o39__Game.hasRecipe = scrReadReal("event_recipe", 0);
            o39__Game.event_sheetmus = scrReadReal("event_sheetmus", 0);
            if (verify(o39_aCarDoor))
            {
                o39_aCarDoor.open = scrReadReal("event_carDoor", 0);
            }
            if (verify(o39_aWall))
            {
                o39_aWall.activated = scrReadReal("event_wall", 0);
            }
            if (verify(o39_aJewelryBox))
            {
                o39_aJewelryBox.open = scrReadReal("event_jewelryBox", 0);
            }
            if (o39__Game.event_vent == 1)
            {
                with (o39_aVent)
                {
                    instance_create(x + 12, y + 7, o39_aNote);
                    instance_destroy();
                }
            }
            if (o39__Game.event_door0 == 1)
            {
                with (o39_aDoor0)
                {
                    open = 1;
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE HAIRPIN")))
            {
                with (o39_aNote)
                {
                    state = 1;
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE JOURNAL ENTRY 5")))
            {
                with (o39_aNightstand)
                {
                    open = 1;
                }
            }
            if (o39__Game.event_closet == 1)
            {
                with (o39_aStandingCloset)
                {
                    instance_create(429, 284, o39_aHook);
                    instance_destroy();
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE HOOK")))
            {
                with (o39_aHook)
                {
                    instance_destroy();
                }
            }
            if (o39__Game.event_shower == 1)
            {
                with (o39_aShower)
                {
                    open = 1;
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE TWEEZERS")))
            {
                with (o39_aCabMedicine)
                {
                    open = 1;
                }
            }
            if (verify(o39_aSink) && o39_aSink.state > 0)
            {
                with (o39_aDrip)
                {
                    instance_destroy();
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE COINS")))
            {
                with (o39_aCouch)
                {
                    visible = false;
                }
            }
            if (o39__Game.event_cog == 1)
            {
                instance_create(222, 358, o39_aCog);
            }
            with (o39_aCog)
            {
                if (is_location_collected(night_manor_name_to_loc(name)))
                {
                    instance_destroy();
                }
            }
            if (o39__Game.event_darkness == 1)
            {
                with (o39_aDarkness)
                {
                    instance_destroy();
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE DRAIN CLEANER")))
            {
                with (o39_aCabKitchen)
                {
                    instance_destroy();
                }
            }
            if (is_location_collected(night_manor_name_to_loc("THE GAS CAN")) && is_location_collected(night_manor_name_to_loc("THE CROWBAR")))
            {
                with (o39_aCarTrunk)
                {
                    open = 1;
                }
            }
            if (verify(o39_aGate) && o39_aGate.open == 1)
            {
                o39_aGate.active = true;
            }
            if (o39__Game.event_sheetmus > 0 && !is_location_collected(night_manor_name_to_loc("THE SHEET MUSIC")))
            {
                instance_create(876, 1010, o39_aSheetMusic);
            }
            if (is_location_collected(night_manor_name_to_loc("THE JOURNAL ENTRY 15")))
            {
                with (o39_aNightstand2)
                {
                    open = 1;
                }
            }
            if (o39__Game.event_chair > 0)
            {
                with (o39_aChairBlock)
                {
                    instance_destroy();
                }
            }
            if (verify(o39_aBook) && o39_aBook.activated == 1)
            {
                if (verify(o39_aBookcase))
                {
                    o39_aBookcase.open = 1;
                }
            }
            if (o39_aCompTrash.open == 1)
            {
                instance_create(o39_aCompTrash.x, o39_aCompTrash.y - 32, o39_aRecipe);
            }
            if (verify(o39_aDrowned) && o39_aDrowned.state > 0)
            {
                o39_aDrowned.x += 32;
            }
            if (o39__Game.event_bundle > 0)
            {
                with (o39_aBundleHang)
                {
                    instance_create(x + 16, y + 104, o39_aBundleGround);
                    instance_destroy();
                }
                if (o39__Game.event_bundle == 2)
                {
                    with (o39_aBundleGround)
                    {
                        open = 1;
                    }
                }
                if (verify(o39_aBundleGround))
                {
                    o39_aBundleGround.open = scrReadReal("event_bundleGround", 0);
                }
            }
            if (o39__Game.event_dirt == 1)
            {
                with (o39_aDirt)
                {
                    instance_destroy();
                }
            }
            o39__Game.currRoom = 0;
            o39__Game.nextRoom = 0;
            o39__Game.lastRoom = 0;
            o39__Game.roomJournal = scrReadReal("roomJournal", 0);
            for (var i = 0; i < 40; i++)
            {
                o39__Game.roomHasVisited[i] = scrReadReal("roomHasVisited" + string(i), 0);
            }
            with (o39__Game)
            {
                row = floor(currRoom / 6);
                col = currRoom % 6;
                __view_set(UnknownEnum.Value_0, 0, 384 * col);
                __view_set(UnknownEnum.Value_1, 0, 224 * row);
                state = STATE_FADEIN_TRANSITION;
                substate = 0;
                with (oGame)
                {
                    fadeIn = true;
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
