

layer_set_visible("ForestTiles", true)
layer_set_visible("BackgroundWater", true)
layer_set_visible("DungeonTiles", false)
layer_set_visible("DungeonTilesOver", false)
layer_set_visible("DungeonTilesUnder", false)
layer_set_visible("BackgroundDungeon", false)

currentdimension=1;

objFirstDimension.visible=true

objSecondDimension.active=false
objSecondDimension.visible=false
projectilesactive2 = false

objPlayer.invincible();
audio_sound_gain(jazz1, 1, 500);
audio_sound_gain(jazz2, 0, 500);