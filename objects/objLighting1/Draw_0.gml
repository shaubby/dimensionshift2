if(!surface_exists(lighting)) lighting= surface_create(room_width,room_height);

surface_set_target(lighting)

draw_clear_alpha(c_black,0.6);
if(instance_exists(objDimensions)){
	if(objDimensions.currentdimension==1){
		
		with(objGrasses){
			if(x > objPlayer.x - 300 and x < objPlayer.x+300 and y > objPlayer.y - 160 and y< objPlayer.y+160){
				gpu_set_blendmode(bm_subtract)

				if(instance_exists(objEncounter4) and objEncounter4.encounter){
					draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.15)
				}else {
					draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.05)
				}
				if(image_angle==0){
					if(image_index==sprGrassLight){
						//draw_sprite_ext(sprGrassLight,0,x,y,1,1*image_yscale,0,c_white,1)
					} else {
						//draw_sprite_ext(sprGrassLightShort,0,x,y,1,1*image_yscale,0,c_white,1)
					}
				}

			}
			
		}
		with(objGrassesConcrete){
			if(x > objPlayer.x - 300 and x < objPlayer.x+300 and y > objPlayer.y - 160 and y< objPlayer.y+160){
				gpu_set_blendmode(bm_subtract)

				if(instance_exists(objEncounter4) and objEncounter4.encounter){
					draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.05)
				}else {
					draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.05)
				}
				if(image_angle==0){
					if(image_index==sprGrassLight){
						//draw_sprite_ext(sprGrassLight,0,x,y,1,1*image_yscale,0,c_white,1)
					} else {
						//draw_sprite_ext(sprGrassLightShort,0,x,y,1,1*image_yscale,0,c_white,1)
					}
				}

			}
			
		}
		with(objFlower){
			if(x > objPlayer.x - 300 and x < objPlayer.x+300 and y > objPlayer.y - 160 and y< objPlayer.y+160){
				gpu_set_blendmode(bm_subtract)

				if(instance_exists(objEncounter4) and objEncounter4.encounter){
					draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.15)
				}else {
					draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.15)
				}
				if(image_angle==0){
					if(image_index==sprGrassLight){
						//draw_sprite_ext(sprGrassLight,0,x,y,1,1*image_yscale,0,c_white,1)
					} else {
						//draw_sprite_ext(sprGrassLightShort,0,x,y,1,1*image_yscale,0,c_white,1)
					}
				}

			}
			
		}
		with(objFirefly){
			
			gpu_set_blendmode(bm_subtract)
			if(x > objPlayer.x - 500 and x < objPlayer.x+500 and y > objPlayer.y - 160 and y< objPlayer.y+160){
			draw_sprite_ext(sprLight,0,x,y,7,.7*image_yscale,0,c_white,.05)
			}
			
			
			
		}
		with(objBluePlate){
			
			gpu_set_blendmode(bm_subtract)
			draw_sprite_ext(sprLight,0,x,y,1.5,1.5,0,c_white,.5)
			
			
			
		}

		if(instance_exists(objEncounter3)){
			if(objEncounter3.encounter){
				with(objEnemyParent1) {
					draw_sprite_ext(sprLight,0,x,y,1.5,1.5,0,c_white,.5)
				}
			}
		}
	} else {
		with(objLight2){
			gpu_set_blendmode(bm_subtract)
			draw_sprite_ext(sprLight,0,x,y,2,2,0,c_white,1)
			
			
		}
		if(instance_exists(objEncounter3)){
			if(objEncounter3.encounter){
				with(objEnemyParent2) {
					draw_sprite_ext(sprLight,0,x,y,1.5,1.5,0,c_white,.5)
				}
			}
		}
	}
}
gpu_set_blendmode(bm_subtract)
with(objPlayer) draw_sprite_ext(sprLight,0,x,y,.7,.7,0,c_white,1)
gpu_set_blendmode(bm_normal)
surface_reset_target();

draw_surface(lighting,0,0)
