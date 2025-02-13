image_index=1
image_speed=0;

grass_density=.05;
for(var i = 0; i < image_xscale*16*image_yscale*16*grass_density;i++){
	instance_create_layer(x+irandom_range(0,image_xscale*16), y+irandom_range(0,image_yscale*16),"Instances1",objGrasses);
}