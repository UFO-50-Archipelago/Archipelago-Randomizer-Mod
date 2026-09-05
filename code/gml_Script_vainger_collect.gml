room_x = chr(65 + floor(argument0 / 384));
room_y = 1 + floor(argument1 / 224);
switch (room)
{
    case rm07_GravGuns:
        if (room_x == "C" && room_y == 11)
        {
            collect_location(100);
        }
        else if (room_x == "A" && room_y == 2)
        {
            collect_location(101);
        }
        else if (room_x == "A" && room_y == 3)
        {
            collect_location(101);
        }
        else if (room_x == "A" && room_y == 9)
        {
            collect_location(102);
        }
        else if (room_x == "C" && room_y == 5)
        {
            collect_location(103);
        }
        else if (room_x == "D" && room_y == 5)
        {
            collect_location(103);
        }
        else if (room_x == "C" && room_y == 8)
        {
            collect_location(104);
        }
        else if (room_x == "C" && room_y == 9)
        {
            collect_location(104);
        }
        else if (room_x == "C" && room_y == 10)
        {
            collect_location(105);
        }
        else if (room_x == "D" && room_y == 6)
        {
            collect_location(106);
        }
        else if (room_x == "D" && room_y == 7)
        {
            collect_location(106);
        }
        else if (room_x == "D" && room_y == 8)
        {
            collect_location(107);
        }
        else if (room_x == "D" && room_y == 9)
        {
            collect_location(107);
        }
        else if (room_x == "E" && room_y == 8)
        {
            collect_location(107);
        }
        else if (room_x == "E" && room_y == 9)
        {
            collect_location(107);
        }
        else if (room_x == "A" && room_y == 11)
        {
            collect_location(108);
        }
        else if (room_x == "B" && room_y == 11)
        {
            collect_location(109);
        }
        else if (room_x == "I" && room_y == 4)
        {
            collect_location(110);
        }
        else if (room_x == "J" && room_y == 7)
        {
            collect_location(111);
        }
        else
        {
            show_message("VAINGER - Unexpected location room: " + string(room_x) + string(room_y) + "\nPlease report this!");
        }
        break;
    case rm07_GravGuns2:
        if (room_x == "A" && room_y == 1)
        {
            collect_location(200);
        }
        else if (room_x == "B" && room_y == 11)
        {
            collect_location(201);
        }
        else if (room_x == "C" && room_y == 4)
        {
            collect_location(202);
        }
        else if (room_x == "C" && room_y == 5)
        {
            collect_location(203);
        }
        else if (room_x == "D" && room_y == 1)
        {
            collect_location(204);
        }
        else if (room_x == "D" && room_y == 2)
        {
            collect_location(204);
        }
        else if (room_x == "E" && room_y == 1)
        {
            collect_location(204);
        }
        else if (room_x == "E" && room_y == 2)
        {
            collect_location(204);
        }
        else if (room_x == "C" && room_y == 11)
        {
            collect_location(205);
        }
        else if (room_x == "F" && room_y == 8)
        {
            collect_location(206);
        }
        else if (room_x == "G" && room_y == 5)
        {
            collect_location(207);
        }
        else if (room_x == "G" && room_y == 10)
        {
            collect_location(208);
        }
        else if (room_x == "H" && room_y == 7)
        {
            collect_location(209);
        }
        else if (room_x == "I" && room_y == 4)
        {
            collect_location(210);
        }
        else if (room_x == "I" && room_y == 5)
        {
            collect_location(210);
        }
        else if (room_x == "I" && room_y == 9)
        {
            collect_location(211);
        }
        else if (room_x == "A" && room_y == 11)
        {
            collect_location(212);
        }
        else if (room_x == "J" && room_y == 9)
        {
            collect_location(213);
        }
        else
        {
            show_message("VAINGER - Unexpected location room: " + string(room_x) + string(room_y) + "\nPlease report this!");
        }
        break;
    case rm07_GravGuns3:
        if (room_x == "A" && room_y == 4)
        {
            collect_location(0);
        }
        if (room_x == "A" && room_y == 5)
        {
            collect_location(0);
        }
        else if (room_x == "A" && room_y == 7)
        {
            collect_location(1);
        }
        else if (room_x == "A" && room_y == 8)
        {
            collect_location(2);
        }
        else if (room_x == "A" && room_y == 9)
        {
            collect_location(2);
        }
        else if (room_x == "B" && room_y == 9)
        {
            collect_location(3);
        }
        else if (room_x == "C" && room_y == 4)
        {
            collect_location(4);
        }
        else if (room_x == "C" && room_y == 6)
        {
            collect_location(5);
        }
        else if (room_x == "D" && room_y == 4)
        {
            collect_location(6);
        }
        else if (room_x == "D" && room_y == 5)
        {
            collect_location(6);
        }
        else if (room_x == "K" && room_y == 4)
        {
            collect_location(7);
        }
        else if (room_x == "E" && room_y == 3)
        {
            collect_location(8);
        }
        else if (room_x == "E" && room_y == 4)
        {
            collect_location(8);
        }
        else if (room_x == "K" && room_y == 3)
        {
            collect_location(9);
        }
        else if (room_x == "K" && room_y == 2)
        {
            collect_location(10);
        }
        else if (room_x == "K" && room_y == 5)
        {
            collect_location(11);
        }
        else if (room_x == "J" && room_y == 2)
        {
            collect_location(12);
        }
        else if (room_x == "J" && room_y == 3)
        {
            collect_location(12);
        }
        else if (room_x == "J" && room_y == 9)
        {
            collect_location(13);
        }
        else if (room_x == "J" && room_y == 10)
        {
            collect_location(13);
        }
        else
        {
            show_message("VAINGER - Unexpected location room: " + string(room_x) + string(room_y) + "\nPlease report this!");
        }
        break;
    case rm07_GravGuns4:
        if (room_x == "D" && room_y == 2)
        {
            collect_location(300);
        }
        else
        {
            show_message("VAINGER - Unexpected location room: " + string(room_x) + string(room_y) + "\nPlease report this!");
        }
        break;
    default:
        show_message("VAINGER - Unexpected location area value: " + string(room) + "\nPlease report this!");
        break;
}
