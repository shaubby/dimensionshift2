
layer_set_visible("BackgroundDungeon", true)
layer_set_visible("DungeonTiles", true)
layer_set_visible("DungeonTilesOver", true)
layer_set_visible("DungeonTilesUnder", true)
layer_set_visible("ForestTiles", false)
layer_set_visible("BackgroundWater", false)
currentdimension=2


objFirstDimension.active=false
objFirstDimension.visible=false
if(room == Room5) {
	objFirstDimension.active=true
	objFirstDimension.visible=true
}


projectilesactive1 = false
objSecondDimension.visible=true

objPlayer.invincible();


audio_sound_gain(jazz1, 0, 500);
audio_sound_gain(jazz2, 1, 500);