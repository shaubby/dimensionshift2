if(!surface_exists(lighting)) lighting= surface_create(room_width,room_height);

surface_set_target(lighting)

draw_clear_alpha(c_black,0.5);
if(instance_exists(objGrasses)) {
	with(objGrasses){
		gpu_set_blendmode(bm_subtract)
		draw_sprite_ext(sprLight,0,x,y-(6*(image_yscale)),.7,.7,0,c_white,.10)
	}
}
with(objFirefly){
			
			gpu_set_blendmode(bm_subtract)
			draw_sprite_ext(sprLight,0,x,y,7,2,0,c_white,.05)
			
			
			
		}
gpu_set_blendmode(bm_normal)
surface_reset_target();

draw_surface(lighting,0,0)
