currentdimension=1
layer_set_visible("ForestTiles", true)
layer_set_visible("BackgroundWater", true)
layer_set_visible("DungeonTiles", false)
layer_set_visible("DungeonTilesOver", false)
layer_set_visible("DungeonTilesUnder", false)
layer_set_visible("BackgroundDungeon", false)
objFirstDimension.active=true
objFirstDimension.visible=true

objSecondDimension.active=false
objSecondDimension.visible=false

projectilesactive1 = true;
projectilesactive2 = false;
jazz1 = audio_play_sound(Jazz2, 1, true, 1)
jazz2 = audio_play_sound(Jazz1, 2, true, 0)

flashAlpha=0;
redFlash=false;
maxcd=10
cd=0;

