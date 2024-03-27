switch ( state)
{
	// chase state 
	case 0:
	  
	  // get player direction
	  if instance_exists(obj_flence)
	 {
		    dir = point_direction(x, y, obj_flence.x, obj_flence.y);
	 }
	 
	 // set correct speed 
	    spd = chaseSpd;
	   
	  //transition to shooting state 
	  var _camLeft = camera_get_view_x(view_camera[0]);
	  var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
	  var _camTop = camera_get_view_y(view_camera[0]);
	  var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
	  
	 // only add to timer if onscreen
	 if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
	 {
	   shootTimer++;
	 }
	 
	  if shootTimer > cooldownTimer 
	  {
		  // shoot
		  state = 1;
		  
		  //reset timer 
		  shootTimer = 0;
	  }
	  
	  
 break; 
	 
	 case 1:
	
		// get player direction
	  if instance_exists(obj_flence)
	 {
		    dir = point_direction(x, y, obj_flence.x, obj_flence.y);
	 }
	
	    spd = 0;
		
		// shoot a bullet 
		shootTimer++;
		
		 if shootTimer == 1
		{
			bulletInst = instance_create_depth(x + bulletXoff, y+ bulletYoff, depth, obj_enemyBullet)
		}
		
		//shoot bullet after windup time is over 
		if shootTimer == windupTime && instance_exists(bulletInst)
		{
			//set bullet state to 1
			bulletInst.state = 1;
		}
		
		// recover timer 
		if shootTimer > windupTime + recoverTime
		{
			// go back to chasing player 
			state = 0;
			
			//reset timer to shootimer to use again
			shootTimer = 0;
		}
break;
}


//recieve damage 
get_damaged(obj_DamageEnemy);

//chase the player 
     xspd = lengthdir_x(spd,dir);
	 yspd = lengthdir_y(spd,dir);
	 
	 //collision
	 if place_meeting(x+ xspd, y, oWall) || place_meeting(x + xspd, y, obj_enemiesParent)
	 {xspd = 0}
	
	if place_meeting(x, y + yspd, oWall) || place_meeting(x, y + yspd, obj_enemiesParent)
	 {yspd = 0}
	 
	 //moving
	 x += xspd;
	 y += yspd;
	 
//death 
if hp <= 0
{
	sprite_index = spr_EnemyDeath
	chaseSpd = 0;
	instance_destroy(bulletInst)
	}
