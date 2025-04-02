event_inherited()
if(place_meeting(x, y,objPlayer) or !activated){
	sprite_index=sprButtonPressed;
	image_index=index;
	if(activated)pressed=true;
	else pressed=false;
} else {
	sprite_index = sprButton;
	image_index=index;
	pressed=false;
}