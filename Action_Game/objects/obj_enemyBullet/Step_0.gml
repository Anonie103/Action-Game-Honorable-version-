// state machine 
switch ( state)
{
	// wait for enemy to shoot 
	case 0:
	  // aim for player 
	  if instance_exists(obj_flence)
	  {
		  dir = point_direction( x, y, obj_flence.x, obj_flence.y)
	  }  
	     depth = -y -20;
		 
	break;
	
	case 1:
	  //moevemt 
	  xspd = lengthdir_x(spd, dir);
	  yspd = lengthdir_y(spd, dir)
	  x += xspd;
	  y += yspd;
	
	
	break;
}


// clean up 
if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
{
	destroy = true;
}

if destroy == true { instance_destroy();}

if place_meeting(x,y,sSolidWall) { destroy = true; };

if place_meeting(x,y,obj_flence)  && playerDestroy == true {destroy = true;}