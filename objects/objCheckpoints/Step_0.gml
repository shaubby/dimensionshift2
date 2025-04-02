if(objPlayer.hitpoints<=0){
	alarm_set(0,1);
	audio_stop_all();
	room_restart();
	
}