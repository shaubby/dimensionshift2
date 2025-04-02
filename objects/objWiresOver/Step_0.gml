//if(sprite_index == sprWires and objEncounter4.open) sprite_index=sprWiresOpen;
//if(sprite_index == sprWiresOpen and !objEncounter4.open) sprite_index=sprWires;
if(place_meeting(x, y, objPlayer) and image_index == 1) {
	audio_stop_all();
	room=Room3;
}