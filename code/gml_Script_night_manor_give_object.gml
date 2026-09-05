if (argument0 < 0 || argument0 > 69)
{
    show_message("Receiving unexpected item with id " + argument0 + "\nPlease report this.");
    exit;
}
is_crossbow = argument0 == 58 || argument0 == 67;
if (!is_crossbow && o39__Game.receivedItems[argument0])
{
    exit;
}
o39__Game.receivedItems[argument0] = true;
argument0 = night_manor_item_to_name(argument0);
if (scr39_InvHas(argument0))
{
    exit;
}
bowl_started = o39__Game.bowl_added_cigar || o39__Game.bowl_added_tea_oil || o39__Game.bowl_added_peroxide;
switch (argument0)
{
    case "THE HAIRPIN":
        if (o39__Game.event_door0)
        {
            exit;
        }
        break;
    case "THE DRAIN CLEANER":
        if (!verify(o39_aSink))
        {
            exit;
        }
        if (verify(o39_aSink) && o39_aSink.state >= 1)
        {
            exit;
        }
        break;
    case "THE TWEEZERS":
        if (!verify(o39_aSink))
        {
            exit;
        }
        if (verify(o39_aSink) && o39_aSink.state >= 2)
        {
            exit;
        }
        break;
    case "THE SMALL MOTOR":
        if (!verify(o39_aGarageMech))
        {
            exit;
        }
        if (verify(o39_aGarageMech) && o39_aGarageMech.state)
        {
            exit;
        }
        break;
    case "THE COINS":
        if (is_location_collected(night_manor_name_to_loc("THE SHEET MUSIC")))
        {
            exit;
        }
        break;
    case "THE ORNAMENTAL EGG":
        if (!verify(o39_aVise))
        {
            exit;
        }
        if (verify(o39_aVise) && o39_aVise.open)
        {
            exit;
        }
        break;
    case "THE GAS CAN":
        if (!verify(o39_aFireplace))
        {
            exit;
        }
        if (verify(o39_aFireplace) && o39_aFireplace.soaked >= 1)
        {
            exit;
        }
        break;
    case "THE MATCHES":
        if (!verify(o39_aFireplace))
        {
            exit;
        }
        if (verify(o39_aFireplace) && o39_aFireplace.soaked >= 2)
        {
            exit;
        }
        break;
    case "THE NUMERICAL CODE":
        if (!verify(o39_aPaintingBig))
        {
            exit;
        }
        if (verify(o39_aPaintingBig) && o39_aPaintingBig.open >= 2)
        {
            exit;
        }
        break;
    case "THE PASSWORD":
        if (!verify(o39_aComputer))
        {
            exit;
        }
        if (verify(o39_aComputer) && o39_aComputer.open >= 2)
        {
            exit;
        }
        break;
    case "THE SHEET MUSIC":
        if (o39__Game.event_sheetmus >= 3)
        {
            exit;
        }
        break;
    case "THE PIANO WIRE":
        if (!verify(o39_aFinalWires))
        {
            exit;
        }
        if (verify(o39_aFinalWires) && o39_aFinalWires.activated)
        {
            exit;
        }
        break;
    case "THE GEAR":
        if (!verify(o39_aFinalBox))
        {
            exit;
        }
        if (verify(o39_aFinalBox) && o39_aFinalBox.open >= 2)
        {
            exit;
        }
        break;
    case "THE OIL CAN":
        if (o39_aCarTrunk.open && o39_aFinalLever.oiled)
        {
            exit;
        }
        break;
    case "THE DOLL":
        if (is_location_collected(night_manor_name_to_loc("THE ALUMINUM KEY")))
        {
            exit;
        }
        break;
    case "THE EMERALD":
        if (!verify(o39_aLionSpring))
        {
            exit;
        }
        if (verify(o39_aLionSpring) && o39_aLionSpring.activated)
        {
            exit;
        }
        break;
    case "THE RUBY":
        if (!verify(o39_aLionSummer))
        {
            exit;
        }
        if (verify(o39_aLionSummer) && o39_aLionSummer.activated)
        {
            exit;
        }
        break;
    case "THE TOPAZ":
        if (!verify(o39_aLionFall))
        {
            exit;
        }
        if (verify(o39_aLionFall) && o39_aLionFall.activated)
        {
            exit;
        }
        break;
    case "THE DIAMOND":
        if (!verify(o39_aLionWinter))
        {
            exit;
        }
        if (verify(o39_aLionWinter) && o39_aLionWinter.activated)
        {
            exit;
        }
        break;
    case "THE ALUMINUM KEY":
        if (!verify(o39_aMusicBox))
        {
            exit;
        }
        if (verify(o39_aMusicBox) && o39_aMusicBox.open)
        {
            exit;
        }
        break;
    case "THE BRASS KEY":
        if (o39__Game.event_cog)
        {
            exit;
        }
        break;
    case "THE COPPER KEY":
        if (!verify(o39_aDoorShed))
        {
            exit;
        }
        if (verify(o39_aDoorShed) && o39_aDoorShed.open)
        {
            exit;
        }
        break;
    case "THE BRONZE KEY":
        if (!verify(o39_aChest))
        {
            exit;
        }
        if (verify(o39_aChest) && o39_aChest.open)
        {
            exit;
        }
        break;
    case "THE IRON KEY":
        if (!verify(o39_aBaseEntrance))
        {
            exit;
        }
        if (verify(o39_aBaseEntrance) && o39_aBaseEntrance.open)
        {
            exit;
        }
        break;
    case "THE GOLD KEY":
        if (!verify(o39_aDoorLounge))
        {
            exit;
        }
        if (verify(o39_aDoorLounge) && o39_aDoorLounge.open)
        {
            exit;
        }
        break;
    case "THE SILVER KEY":
        if (!verify(o39_aJewelryBox))
        {
            exit;
        }
        if (verify(o39_aJewelryBox) && o39_aJewelryBox.open)
        {
            exit;
        }
        break;
    case "THE BATTERIES":
        if (scr39_InvHas("THE LIT FLASHLIGHT"))
        {
            exit;
        }
        break;
    case "THE FLASHLIGHT":
        if (scr39_InvHas("THE LIT FLASHLIGHT"))
        {
            exit;
        }
        break;
    case "THE HOOK":
        if (scr39_InvHas("THE TAPED HOOK") || scr39_InvHas("THE HOOKED POLE"))
        {
            exit;
        }
        break;
    case "THE DUCT TAPE":
        if (scr39_InvHas("THE TAPED HOOK") || scr39_InvHas("THE HOOKED POLE"))
        {
            exit;
        }
        break;
    case "THE POOL CUE":
        if (scr39_InvHas("THE HOOKED POLE"))
        {
            exit;
        }
        break;
    case "THE CROSSBOW":
        if (scr39_InvHas("THE ARMED CROSSBOW"))
        {
            exit;
        }
        if (is_location_collected(night_manor_name_to_loc("THE IRON KEY")))
        {
            exit;
        }
        break;
    case "THE CROSSBOW BOLT":
        if (scr39_InvHas("THE ARMED CROSSBOW"))
        {
            exit;
        }
        if (is_location_collected(night_manor_name_to_loc("THE IRON KEY")))
        {
            exit;
        }
        break;
    case "THE BOWL":
        if (bowl_started)
        {
            exit;
        }
        break;
    case "THE CIGAR BUTT":
        if (o39__Game.bowl_added_cigar)
        {
            exit;
        }
        break;
    case "THE TEA TREE OIL":
        if (o39__Game.bowl_added_tea_oil)
        {
            exit;
        }
        break;
    case "THE PEROXIDE":
        if (o39__Game.bowl_added_peroxide)
        {
            exit;
        }
        break;
    default:
        break;
}
if (scr39_ItemIsJournalEntry(argument0))
{
    for (i = 0; i < o39__Game.invSizeMax; i++)
    {
        if (o39__Game.invJournal[i] == argument0)
        {
            exit;
        }
    }
}
if (argument0 == "THE RECIPE")
{
    if (o39__Game.hasRecipe)
    {
        exit;
    }
    scrSfx(o39__Game.soundItemTake, 50);
    o39__Game.state = STATE_TEXT;
    scr39_SplitString(scrString("look_recipe"));
    o39__Game.hasRecipe = true;
    exit;
}
if (scr39_ItemIsJournalEntry(argument0))
{
    o39__Game.invNumJournalEntries += 1;
}
if (scr39_ItemIsJournalEntry(argument0) && o39__Game.invNumJournalEntries > 1)
{
    if (o39__Game.invNumJournalEntries == 2)
    {
        o39__Game.invJournal[0] = "THE BACKPACK";
        for (i = 0; i < o39__Game.invSizeMax; i++)
        {
            if (scr39_ItemIsJournalEntry(o39__Game.inv[i]))
            {
                o39__Game.invLastSlotFilled = i;
                o39__Game.invJournal[1] = o39__Game.inv[i];
                o39__Game.inv[i] = "THE JOURNAL ENTRIES";
                break;
            }
        }
    }
    for (i = 0; i < o39__Game.invSizeMax; i++)
    {
        if (o39__Game.invJournal[i] == "")
        {
            o39__Game.invJournal[i] = argument0;
            break;
        }
    }
    for (i = 0; i < o39__Game.invSizeMax; i++)
    {
        if (o39__Game.inv[i] == "THE JOURNAL ENTRIES")
        {
            o39__Game.invDispStart = floor(i / 6) * 6;
            o39__Game.invNewestSlotFilled = i;
            break;
        }
    }
    with (o39__Game)
    {
        alarm[0] = 10;
        newItemBlinkTimer = newItemBlinkTimerMax;
    }
}
else
{
    o39__Game.invDispJournalEntries = false;
    for (i = 0; i < o39__Game.invSizeMax; i++)
    {
        if (o39__Game.inv[i] == "")
        {
            o39__Game.inv[i] = argument0;
            o39__Game.invNewestSlotFilled = i;
            break;
        }
    }
    o39__Game.invDispStart = floor(o39__Game.invNewestSlotFilled / 6) * 6;
    o39__Game.invLastSlotFilled = 0;
    o39__Game.invNumItems = 0;
    for (i = 0; i < o39__Game.invSizeMax; i++)
    {
        if (o39__Game.inv[i] != "")
        {
            o39__Game.invNumItems++;
            o39__Game.invLastSlotFilled = i;
        }
    }
    with (o39__Game)
    {
        alarm[0] = 10;
        newItemBlinkTimer = newItemBlinkTimerMax;
    }
    scr39_RecordItem(argument0);
}
