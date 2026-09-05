conType = 0;
step = 0;
image_speed = 0;
room_x = 1 + floor((camera_get_view_x(view_get_camera(0)) + 64) / 256);
room_y = chr(65 + floor((camera_get_view_y(view_get_camera(0)) + 16) / 192));
coord = string(room_y) + string(room_x);
switch (coord)
{
    case "A1":
        location = 0;
        break;
    case "D4":
        location = 6;
        break;
    case "E8":
        location = 10;
        break;
    case "F2":
        location = 11;
        break;
    case "I4":
        location = 15;
        break;
    case "F5":
        location = 17;
        break;
    case "F6":
        location = 18;
        break;
    case "G2":
        location = 19;
        break;
    case "H5":
        location = 21;
        break;
    case "H7":
        location = 22;
        break;
}
if (is_location_collected(location))
{
    visible = false;
}
