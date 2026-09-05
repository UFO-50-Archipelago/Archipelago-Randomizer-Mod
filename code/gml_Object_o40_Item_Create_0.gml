step = 0;
image_speed = 0;
room_x = 1 + floor((camera_get_view_x(view_get_camera(0)) + 64) / 256);
room_y = chr(65 + floor((camera_get_view_y(view_get_camera(0)) + 16) / 192));
coord = string(room_y) + string(room_x);
switch (coord)
{
    case "C2":
        location = 4;
        break;
    case "D1":
        location = 5;
        break;
    case "E3":
        location = 8;
        break;
    case "E5":
        location = 9;
        break;
    case "F4":
        location = 16;
        break;
    case "G5":
        location = 20;
        break;
}
if (is_location_collected(location))
{
    visible = false;
}
