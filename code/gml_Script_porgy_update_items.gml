_newMax = min(24, 4 + get_item_count(301));
if (_newMax > o10_Game.fuelTanksMax)
{
    o10_Game.fuelTanksMax = _newMax;
    o10_Game.fuelTanks = o10_Game.fuelTanksMax;
    o10_Game.fuelTanksLerp = o10_Game.fuelTanksMax;
    o10_Game.currFuelLerp = o10_Game.fuelMax;
}
o10_Game.torpRange = min(20, get_item_count(300));
o10_Game.bossWins = min(5, get_item_count(303));
o10_Game.itemCapacity = min(4, 2 + (o10_Game.bossWins * 0.5));
o10_Game.has_missileSys = has_item(191);
o10_Game.has_radarSys = has_item(291) || global.porgy_radar == 0;
o10_Game.has_busterSys = has_item(90);
o10_Game.has_chargeSys = has_item(92);
o10_Game.has_fuelSys = has_item(290);
o10_Game.has_armorSys = has_item(292);
o10_Game.has_boostSys = has_item(93);
o10_Game.has_lightSys = has_item(192);
o10_Game.has_drillSys = has_item(91);
o10_Game.has_aimSys = has_item(190);
o10_Game.radarSys = o10_Game.radarSys || global.porgy_radar == 0;
_prevEggs = o10_Game.collectedEggs;
o10_Game.collectedEggs = min(20, get_item_count(302));
_joinedby = (o10_Game.collectedEggs div 5) - instance_number(o10_pOption);
trace("A FISH JOINS YOUR PARTY!", o10_Game.collectedEggs div 5, instance_number(o10_pOption), _joinedby);
repeat (_joinedby)
{
    trace("ADDING FISH...");
    with (instance_create(x, y, o10_pOption))
    {
        optionType = instance_number(o10_pOption) % 2;
        followLerp = 0;
    }
}
