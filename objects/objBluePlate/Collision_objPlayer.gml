if(sprite_index != sprPlateUsed ){
	objPlayer.hitpoints = min(objPlayer.maxhitpoints, objPlayer.hitpoints+4);
	sprite_index = sprPlateUsed
	objPlayer.greenFlashAlpha=.125
	objPlayer.greenFlashAlpha2=50
}