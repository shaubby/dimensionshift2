if(checkpoint==0) {
	objPlayer.x=456
	objPlayer.y=472
} else if (checkpoint==1) {
	objPlayer.x=824
	objPlayer.y=728
} else if (checkpoint==2) {
	objPlayer.x=1032
	objPlayer.y=800
}
 else if (checkpoint==3) {
	objPlayer.x=1920
	objPlayer.y=800
	//alarm_set(1, 5)
	objDimensions.alarm[0] = 1
	objDimensions.alarm[2]= 5/(delta_time/1000000)
}
 else if (checkpoint==4) {
	objPlayer.x=3840
	objPlayer.y=980
}