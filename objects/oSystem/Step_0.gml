

	instance_deactivate_all(true)
	instance_activate_object(oSystem)
	instance_activate_object(objPlayer)
	instance_activate_object(objCamera)
	instance_activate_object(objLighting1)
	instance_activate_object(objDrawable)
	instance_activate_object(objPopup)
	instance_activate_object(objCheckpoints)
	instance_activate_object(objDimensions)
	instance_activate_region(objPlayer.x-480, objPlayer.y -270, objPlayer.x+480, objPlayer.y +270,true);
