cd--;
if(cd<0){
	cd=2;
	#region instance activation
		instance_deactivate_all(true)
		instance_activate_object(oSystem)
		instance_activate_object(objPlayer)
		instance_activate_object(objCamera)
		instance_activate_object(objLighting1)
		instance_activate_object(objDrawable)
		instance_activate_object(objDrawable2)
		instance_activate_object(objPopup)
		instance_activate_object(objCheckpoints)
		instance_activate_object(objDimensions)
		instance_activate_object(objParentSolid1)
		instance_activate_object(objParentSolid2)
		instance_activate_object(objSolid1)
		instance_activate_object(objSolid2)
		if(room==Room2) instance_activate_object(objEncounter2);
		if(room==Room2) instance_activate_object(objEncounter3);
		if(room==Room2) instance_activate_object(objEncounter4);
		if(room==Room2) instance_activate_object(objEncounter41);
		if(room==Room2) instance_activate_object(objEncounter42);
		if(room==Room2) instance_activate_object(objEncounter43);
		if(room==Room3) instance_activate_object(objEncounter5);
		if(room==Room3) instance_activate_object(objEncounter6);
		if(room==Room2) instance_activate_object(objButton1);
		if(room==Room2) instance_activate_object(objButton2);
		if(room==Room2) instance_activate_object(objButton3);
		if(room==Room2) instance_activate_object(objButton4);
		if(room==Room2) instance_activate_object(objButton5);
		if(room==Room2) instance_activate_object(objButton6);
		if(room==Room2) instance_activate_object(objButton7);
		if(room==Room2) instance_activate_object(objButton8);
		if(room==Room2) instance_activate_object(objButton14);
		if(room==Room2) instance_activate_object(objButton24);
		if(room==Room2) instance_activate_object(objButton34);
		if(room==Room2) instance_activate_object(objButton44);
		if(room==Room2) instance_activate_object(objButton54);
		if(room==Room2) instance_activate_object(objButton64);
	
		if(room==Room2) instance_activate_object(objBoss);
		instance_activate_object(objEnemyParent1);
		instance_activate_object(objEnemyParent2);
	



		instance_activate_region(objPlayer.x-240, objPlayer.y -135, 480, 270,true);
	#endregion
}