function scr10_ResetBosses(arg0)
{
    if (o10_Game.sharkHP <= 0)
    {
        collect_location(300);
    }
    if (o10_Game.octoHP <= 0)
    {
        collect_location(301);
    }
    if (o10_Game.morayHP <= 0)
    {
        collect_location(302);
    }
    if (o10_Game.nautilusHP <= 0)
    {
        collect_location(303);
    }
    if (o10_Game.vampireHP <= 0)
    {
        collect_location(304);
    }
    scrRandomize(39);
    with (o10_FishMom)
    {
        with (o10__Enemy)
        {
            if (point_distance(x, y, other.x, other.y) < 96 && !boss)
            {
                instance_destroy();
            }
        }
    }
    if (arg0 == 0)
    {
        if (o10_Game.octoHP > 0)
        {
            with (o10_eOcto)
            {
                instance_destroy();
            }
            switch (scrIRandom(4))
            {
                case 0:
                    _pos[0] = 920;
                    _pos[1] = 280;
                    break;
                case 1:
                    _pos[0] = 792;
                    _pos[1] = 760;
                    break;
                case 2:
                    _pos[0] = 1288;
                    _pos[1] = 472;
                    break;
                case 3:
                    _pos[0] = 2488;
                    _pos[1] = 936;
                    break;
                case 4:
                    _pos[0] = 3560;
                    _pos[1] = 184;
                    break;
            }
            with (instance_create(_pos[0], _pos[1], o10_eOcto))
            {
                hp = o10_Game.octoHP;
            }
        }
        else
        {
            with (o10_eOcto)
            {
                instance_destroy();
            }
        }
        if (o10_Game.sharkHP > 0)
        {
            with (o10_eBossShark)
            {
                instance_destroy();
            }
            with (instance_create(0, 0, o10_eBossShark))
            {
                hp = o10_Game.sharkHP;
                myPath = scrChoose(p10_GreatWhiteLoop1, p10_GreatWhiteLoop2, p10_GreatWhiteLoop2);
                myPathCurrPoint = scrIRandom(path_get_number(myPath) - 1);
                var _px = path_get_point_x(myPath, myPathCurrPoint);
                var _py = path_get_point_y(myPath, myPathCurrPoint);
                x = _px;
                xstart = x;
                y = _py;
                ystart = y;
                returnX = x;
                returnY = y;
            }
        }
        else
        {
            with (o10_eBossShark)
            {
                instance_destroy();
            }
        }
    }
    else if (arg0 == 1)
    {
        if (o10_Game.nautilusHP > 0)
        {
            with (o10_eNautilus)
            {
                instance_destroy();
            }
            switch (scrIRandom(3))
            {
                case 0:
                    _pos[0] = 600;
                    _pos[1] = 320;
                    break;
                case 1:
                    _pos[0] = 960;
                    _pos[1] = 816;
                    break;
                case 2:
                    _pos[0] = 2424;
                    _pos[1] = 672;
                    break;
                case 3:
                    _pos[0] = 2440;
                    _pos[1] = 1120;
                    break;
            }
            with (instance_create(_pos[0], _pos[1], o10_eNautilus))
            {
                hp = o10_Game.nautilusHP;
            }
        }
        else
        {
            with (o10_eNautilus)
            {
                instance_destroy();
            }
        }
        if (o10_Game.morayHP > 0)
        {
            with (o10_eMorayHead)
            {
                instance_destroy();
            }
            with (o10_eMorayBody)
            {
                instance_destroy();
            }
            with (instance_create(0, 0, o10_eMorayHead))
            {
                hp = o10_Game.morayHP;
                myPath = scrChoose(p10_EelLoop1, p10_EelLoop2, p10_EelLoop3);
                myPathCurrPoint = scrIRandom(path_get_number(myPath) - 1);
                var _px = path_get_point_x(myPath, myPathCurrPoint);
                var _py = path_get_point_y(myPath, myPathCurrPoint);
                x = _px;
                xstart = x;
                y = _py;
                ystart = y;
                returnX = x;
                returnY = y;
                with (o10_eMorayBody)
                {
                    x = other.x;
                    y = other.y;
                }
            }
        }
        else
        {
            with (o10_eMorayHead)
            {
                instance_destroy();
            }
            with (o10_eMorayBody)
            {
                instance_destroy();
            }
        }
    }
    else if (arg0 == 2)
    {
        if (o10_Game.vampireHP > 0)
        {
            with (o10_eVampire)
            {
                instance_destroy();
            }
            switch (scrIRandom(4))
            {
                case 0:
                    _pos[0] = 1920;
                    _pos[1] = 864;
                    break;
                case 1:
                    _pos[0] = 2432;
                    _pos[1] = 224;
                    break;
                case 2:
                    _pos[0] = 2800;
                    _pos[1] = 144;
                    break;
                case 3:
                    _pos[0] = 2896;
                    _pos[1] = 512;
                    break;
                case 4:
                    _pos[0] = 2976;
                    _pos[1] = 512;
                    break;
            }
            with (instance_create(_pos[0], _pos[1], o10_eVampire))
            {
                hp = o10_Game.vampireHP;
            }
        }
        else
        {
            with (o10_eVampire)
            {
                instance_destroy();
            }
        }
        if (o10_Game.alienHP > 0)
        {
            with (o10_eAlien)
            {
                instance_destroy();
            }
            var _n;
            if (o10_Game.alienHP < 600)
            {
                _n = 1;
            }
            else
            {
                _n = 1;
            }
            if (_n == 1)
            {
                instance_create(272, 528, o10_eAlien);
            }
            else if (_n == 2)
            {
                instance_create(272, 832, o10_eAlien);
            }
        }
    }
}
