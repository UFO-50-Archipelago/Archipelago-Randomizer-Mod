victory = true;
for (game = 0; victory && game <= 51; game++)
{
    if (global.game_goals[game] == global.NO_GOAL)
    {
        continue;
    }
	has_cherry = scrReadRealManual(0, "gameWin" + string(global.mGameID[game]), 0) >= 2;
	has_cherry |= is_location_collected_manual(game, 999);
    if (global.game_goals[game] == global.GOAL_GOLD)
    {
		has_gold = scrReadRealManual(0, "gameWin" + string(global.mGameID[game]), 0) >= 1;
		has_gold |= is_location_collected_manual(game, 998);
        victory &= (has_gold || has_cherry);
    }
    else if (global.game_goals[game] == global.GOAL_CHERRY)
    {
        victory &= has_cherry;
    }
}
if (victory)
{
    apclient_status_update(global.AP_CLIENT_STATUS_GOAL);
}
